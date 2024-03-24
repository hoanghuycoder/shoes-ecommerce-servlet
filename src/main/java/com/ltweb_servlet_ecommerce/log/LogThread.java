package com.ltweb_servlet_ecommerce.log;


import com.ltweb_servlet_ecommerce.model.LogModel;
import com.ltweb_servlet_ecommerce.service.ILogService;
import com.ltweb_servlet_ecommerce.service.impl.LogService;

import javax.inject.Inject;
import java.util.List;

/**
 * A thread for saving log items to the database.
 */
public class LogThread extends Task<LogModel> {

    // if you keep @Inject, logService is null. I don't know the reason
//    @Inject
    private ILogService logService;

    @Override
    public Integer call() throws Exception {
        logService = new LogService();
        List<LogModel> logs = getItems();
        try {
            if (logs != null && !logs.isEmpty()) {
                for (LogModel log : logs) {
                    logService.save(log);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
        return 1;
    }
}
