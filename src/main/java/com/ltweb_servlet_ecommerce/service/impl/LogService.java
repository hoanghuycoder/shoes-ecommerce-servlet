package com.ltweb_servlet_ecommerce.service.impl;

import com.ltweb_servlet_ecommerce.dao.ILogDAO;
import com.ltweb_servlet_ecommerce.dao.IOpinionDAO;
import com.ltweb_servlet_ecommerce.model.LogModel;
import com.ltweb_servlet_ecommerce.paging.Pageble;
import com.ltweb_servlet_ecommerce.service.ILogService;
import com.ltweb_servlet_ecommerce.subquery.SubQuery;

import javax.inject.Inject;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

public class LogService implements ILogService {
    @Inject
    ILogDAO logDAO;

    @Override
    public List<LogModel> findAllWithFilter(LogModel model, Pageble pageble) throws SQLException {
        return logDAO.findAllWithFilter(model,pageble);
    }

    @Override
    public LogModel findWithFilter(LogModel model) throws SQLException {
        return logDAO.findWithFilter(model);
    }

    @Override
    public List<LogModel> findByColumnValues(List<SubQuery> subQueryList, Pageble pageble) throws SQLException {
        return logDAO.findByColumnValues(subQueryList,pageble);
    }
    @Override
    public Map<String,Object> findWithCustomSQL(String sql, List<Object> params) throws SQLException {
        return logDAO.findWithCustomSQL(sql,params);
    }

    @Override
    public LogModel update(LogModel model) throws SQLException {
        LogModel oldModel = logDAO.findById(model.getId());
        model.setUpdateAt(new Timestamp(System.currentTimeMillis()));
        logDAO.update(model);
        return logDAO.findById(model.getId());
    }

    @Override
    public LogModel delete(Long id) throws SQLException {
        LogModel oldModel = logDAO.findById(id);
        logDAO.delete(id);
        return oldModel;
    }

    @Override
    public List<LogModel> findAll(Pageble pageble) throws SQLException {
        return logDAO.findAll(pageble);
    }

    @Override
    public LogModel softDelete(Long id) throws SQLException {
        LogModel model = logDAO.findById(id);
        model.setUpdateAt(new Timestamp(System.currentTimeMillis()));
        model.setIsDeleted(true);
        logDAO.update(model);
        return logDAO.findById(model.getId());
    }

    @Override
    public LogModel findById(Long id) throws SQLException {
        return logDAO.findById(id);
    }

    @Override
    public LogModel save(LogModel model) throws SQLException {
        Long productId = logDAO.save(model);
        return logDAO.findById(productId);
    }
}
