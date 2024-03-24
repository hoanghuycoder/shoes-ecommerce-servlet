package com.ltweb_servlet_ecommerce.dao.impl;

import com.ltweb_servlet_ecommerce.dao.ILogDAO;
import com.ltweb_servlet_ecommerce.mapper.impl.LogMapper;
import com.ltweb_servlet_ecommerce.mapper.result.MapSQLAndParamsResult;
import com.ltweb_servlet_ecommerce.model.LogModel;
import com.ltweb_servlet_ecommerce.model.LogModel;
import com.ltweb_servlet_ecommerce.paging.Pageble;
import com.ltweb_servlet_ecommerce.subquery.SubQuery;
import com.ltweb_servlet_ecommerce.utils.JDBIConnector;
import com.ltweb_servlet_ecommerce.utils.SqlPagebleUtil;
import org.jdbi.v3.core.statement.Update;
import org.json.JSONObject;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class LogDAO extends AbstractDAO<LogModel> implements ILogDAO {


    @Override
    public List<LogModel> findAllWithFilter(LogModel model, Pageble pageble) throws SQLException {
        StringBuilder sqlStrBuilder = new StringBuilder("SELECT * FROM log WHERE 1=1 ");
        MapSQLAndParamsResult sqlAndParams = new LogMapper().mapSQLAndParams(sqlStrBuilder,model,"select",pageble);
        String sql = sqlAndParams.getSql();
        List<Object> params = sqlAndParams.getParams();
        List<LogModel> result = query(sql.toString(), new LogMapper(),params,LogModel.class);
        return result;
    }
    @Override
    public List<LogModel> findAll(Pageble pageble) throws SQLException {
        StringBuilder sqlStrBuilder = new StringBuilder("SELECT * FROM log");
        SqlPagebleUtil.addSQlPageble(sqlStrBuilder,pageble);
        return query(sqlStrBuilder.toString(),new LogMapper(),null, LogModel.class);
    }

    @Override
    public LogModel findById(Long id) throws SQLException {
        String sql = "select * from log where id=?";
        List<Object> params = new ArrayList<>();
        params.add(id);
        List<LogModel> result =  query(sql,new LogMapper(),params,LogModel.class);
        return result.isEmpty() ? null : result.get(0);
    }
    @Override
    public LogModel findWithFilter(LogModel model) throws SQLException {
        StringBuilder sqlStrBuilder = new StringBuilder("SELECT * FROM log WHERE 1=1 ");
        MapSQLAndParamsResult sqlAndParams = new LogMapper().mapSQLAndParams(sqlStrBuilder,model,"select",null);
        String sql = sqlAndParams.getSql();
        List<Object> params = sqlAndParams.getParams();
        List<LogModel> result = query(sql.toString(), new LogMapper(),params,LogModel.class);
        return result.isEmpty() ? null : result.get(0);
    }

    @Override
    public List<LogModel> findByColumnValues(List<SubQuery> subQueryList, Pageble pageble) throws SQLException {
        StringBuilder sqlStrBuilder = new StringBuilder("SELECT * FROM log WHERE 1=1 ");
        List<LogModel> result = queryWithSubQuery(sqlStrBuilder,new LogMapper(),subQueryList,"in",LogModel.class,pageble);
        return result;
    }

    @Override
    public Long save(LogModel model) throws SQLException {
        StringBuilder sqlStrBuilder = new StringBuilder("INSERT INTO log SET ");
        MapSQLAndParamsResult sqlAndParams = new LogMapper().mapSQLAndParams(sqlStrBuilder,model,"insert",null);
        String sql = sqlAndParams.getSql();
        List<Object> params = sqlAndParams.getParams();
        return insert(sql,params);
    }

    @Override
    public void update(LogModel model) throws SQLException {
        StringBuilder sqlStrBuilder = new StringBuilder("UPDATE log SET ");
        MapSQLAndParamsResult sqlAndParams = new LogMapper().mapSQLAndParams(sqlStrBuilder,model,"update",null);
        String sql = sqlAndParams.getSql();
        List<Object> params = sqlAndParams.getParams();
        update(sql,params);
    }

    @Override
    public void delete(Long id) throws SQLException {
        String sql = "delete from log where id=?";
        List<Object> params = new ArrayList<>();
        params.add(id);
        delete(sql,params);
    }

    @Override
    public void softDelete(Long id) throws SQLException {
        LogModel model = new LogModel();
        model.setId(id);
        model.setIsDeleted(true);
        StringBuilder sqlStrBuilder = new StringBuilder("UPDATE log SET ");
        MapSQLAndParamsResult sqlAndParams = new LogMapper().mapSQLAndParams(sqlStrBuilder,model,"update",null);
        String sql = sqlAndParams.getSql();
        List<Object> params = sqlAndParams.getParams();
        update(sql,params);
    }

    @Override
    public Map<String, Object> findWithCustomSQL(String sql, List<Object> params) throws SQLException {
        return queryCustom(sql,params);
    }



}
