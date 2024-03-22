package com.ltweb_servlet_ecommerce.log;

import com.ltweb_servlet_ecommerce.dao.ILogDAO;
import com.ltweb_servlet_ecommerce.dao.impl.LogDAO;
import com.ltweb_servlet_ecommerce.model.LogModel;

import javax.inject.Inject;
import java.util.List;

/**
 * A thread for saving log items to the database.
 */
public class LogThread extends Task<LogModel> {
    @Inject
    private ILogDAO logDAO;

    @Override
    public Integer call() throws Exception {
        logDAO = new LogDAO();
        List<LogModel> logs = getItems();
        try {
            if (logs != null && !logs.isEmpty()) {
                logDAO.insert(logs);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
        return 1;
    }
}
