package com.ltweb_servlet_ecommerce.service;

import com.ltweb_servlet_ecommerce.model.LogModel;
import com.ltweb_servlet_ecommerce.paging.Pageble;
import com.ltweb_servlet_ecommerce.subquery.SubQuery;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ILogService {
    List<LogModel> findAllWithFilter(LogModel model, Pageble pageble) throws SQLException;
    LogModel findWithFilter(LogModel model) throws SQLException;
    List<LogModel> findByColumnValues(List<SubQuery> subQueryList, Pageble pageble) throws SQLException;
    LogModel save(LogModel model) throws SQLException;
    LogModel delete(Long id) throws SQLException;
    LogModel update(LogModel model) throws SQLException;
    LogModel findById(Long id) throws SQLException;
    List<LogModel> findAll(Pageble pageble) throws SQLException;
    LogModel softDelete(Long id) throws SQLException;
    Map<String,Object> findWithCustomSQL(String sql, List<Object> params) throws SQLException;
}
