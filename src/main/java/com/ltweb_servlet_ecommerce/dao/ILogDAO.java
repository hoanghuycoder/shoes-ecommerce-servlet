package com.ltweb_servlet_ecommerce.dao;

import com.ltweb_servlet_ecommerce.model.LogModel;
import com.ltweb_servlet_ecommerce.model.LogModel;
import com.ltweb_servlet_ecommerce.paging.Pageble;
import com.ltweb_servlet_ecommerce.subquery.SubQuery;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ILogDAO {
    List<LogModel> findAll(Pageble pageble) throws SQLException;
    LogModel findById(Long id) throws SQLException;
    LogModel findWithFilter(LogModel model) throws SQLException;
    List<LogModel> findByColumnValues(List<SubQuery> subQueryList, Pageble pageble) throws SQLException;
    List<LogModel> findAllWithFilter(LogModel model,Pageble pageble) throws SQLException;
    Long save(LogModel model) throws SQLException;
    void update(LogModel model) throws SQLException;
    void delete(Long id) throws SQLException;

    void softDelete(Long id) throws SQLException;
    Map<String,Object> findWithCustomSQL(String sql, List<Object> params) throws SQLException;
}
