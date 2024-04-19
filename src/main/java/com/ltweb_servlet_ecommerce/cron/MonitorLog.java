package com.ltweb_servlet_ecommerce.cron;

import com.ltweb_servlet_ecommerce.dao.ILogDAO;
import com.ltweb_servlet_ecommerce.dao.impl.LogDAO;
import com.ltweb_servlet_ecommerce.model.LogModel;
import com.ltweb_servlet_ecommerce.utils.SendMailUtil;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

@WebListener
public class MonitorLog implements ServletContextListener {
    private ScheduledExecutorService scheduler;

    private ILogDAO logDAO = new LogDAO();

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        scheduler = Executors.newScheduledThreadPool(1);
        scheduler.scheduleAtFixedRate(this::monitorLogs, 0, 1, TimeUnit.MINUTES);
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        if (scheduler != null) {
            scheduler.shutdown();
        }
    }

    private void monitorLogs() {
        List<LogModel> list = logDAO.checkAccessCount();
        if (!list.isEmpty()) {
//            SendMailUtil.templateMailAccessCount(list);
            System.out.println("Send mail access count");
        }
    }
}
/**

 UPDATE logs SET createAt = NOW() WHERE id IN (578,579,580,581,582,583);
 SELECT ip, resource, COUNT(ip) AS access_count , createAt
 FROM logs
 WHERE createAt > DATE_SUB(NOW() , INTERVAL 1 MINUTE)
 GROUP BY ip, resource, createAt
 HAVING COUNT(ip) > 2

 */