package com.ltweb_servlet_ecommerce.dao.impl;

import com.ltweb_servlet_ecommerce.dao.ILogDAO;
import com.ltweb_servlet_ecommerce.model.LogModel;
import com.ltweb_servlet_ecommerce.utils.JDBIConnector;
import org.jdbi.v3.core.statement.Update;
import org.json.JSONObject;

import java.sql.Timestamp;
import java.sql.Types;
import java.util.List;

public class LogDAO_BAK {
//    public static List<LogModel> find() {
//        return JDBIConnector.getInstance().withHandle(handle ->
//                handle.createQuery("SELECT * FROM logs").map(((rs, ctx) -> {
//                    long id = rs.getLong("id");
//                    String ip = rs.getString("ip");
//                    String level = rs.getString("level");
//                    String action = rs.getString("action");
//                    String resource = rs.getString("resource");
//                    String preValueString = rs.getString("preValue");
//                    JSONObject preValue = null;
//                    if (preValueString != null)
//                        preValue = new JSONObject(preValueString);
//                    JSONObject value = new JSONObject(rs.getString("value"));
//                    Timestamp createdAt = rs.getTimestamp("createdAt");
//                    Timestamp updatedAt = rs.getTimestamp("updatedAt");
//                    return LogModel.builder().id(id).ip(ip).level(level).action(action).resource(resource)
//                            .preValue(preValue).value(value).createdAt(createdAt).updatedAt(updatedAt).build();
//                })).list()
//        );
//    }
//
//    @Override
//    public void insert(List<LogModel> logs) {
//        String sql = "INSERT INTO logs(ip, level, action, resource, preValue, value) " +
//                "VALUES(:ip, :level, :action, :resource, :preValue, :value)";
//        JDBIConnector.getInstance().inTransaction(handle -> {
//            for (LogModel log : logs) {
//                Update update = handle.createUpdate(sql)
//                        .bind("ip", log.getIp())
//                        .bind("level", log.getLevel())
//                        .bind("action", log.getAction())
//                        .bind("resource", log.getResource())
//                        .bind("value", log.getValue().toString());
//                if (log.getPreValue() != null) {
//                    update.bind("preValue", log.getPreValue().toString());
//                } else {
//                    update.bindNull("preValue", Types.NVARCHAR);
//                }
//                update.execute();
//            }
//            return null;
//        });
//    }


}
