package com.ltweb_servlet_ecommerce.cron;

import com.ltweb_servlet_ecommerce.cacheMemory.BlockedIPCache;
import com.ltweb_servlet_ecommerce.dao.ILogDAO;
import com.ltweb_servlet_ecommerce.dao.impl.LogDAO;
import com.ltweb_servlet_ecommerce.model.LogModel;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

@WebListener
public class MonitorLog implements ServletContextListener {

    private BlockedIPCache ipCache;
    private ILogDAO logDAO = new LogDAO();
    private Timer timer;

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        ipCache = BlockedIPCache.getInstance();
        timer = new Timer(true);
        timer.scheduleAtFixedRate(new TimerTask() {
            @Override
            public void run() {
                monitorLogs();
            }
        }, 0, 60 * 1000);
        timer.scheduleAtFixedRate(new TimerTask() {
            @Override
            public void run() {
                ipCache.cleanupExpiredBlocks();
            }
        }, 0, 5 * 60 * 1000);
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        if (timer != null) {
            timer.cancel();
        }
    }

    private void monitorLogs() {
        List<LogModel> list = logDAO.checkAccessCount();
        if (!list.isEmpty()) {
            for (LogModel log : list) {
                ipCache.blockIP(log.getIp());
            }
            // Send mail access count
//            SendMailUtil.templateMailAccessCount(list);
            System.out.println("Send mail access count");
        }
    }


}
/**
 * UPDATE logs SET createAt = NOW() WHERE id IN (578,579,580,581,582,583);
 * SELECT ip, resource, COUNT(ip) AS access_count , createAt
 * FROM logs
 * WHERE createAt > DATE_SUB(NOW() , INTERVAL 1 MINUTE)
 * GROUP BY ip, resource, createAt
 * HAVING COUNT(ip) > 2
 */