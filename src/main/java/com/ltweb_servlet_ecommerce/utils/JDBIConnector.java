package com.ltweb_servlet_ecommerce.utils;

import com.mysql.cj.jdbc.MysqlDataSource;
import com.mysql.cj.jdbc.MysqlXADataSource;
import org.jdbi.v3.core.Jdbi;

import java.sql.SQLException;
import java.util.ResourceBundle;

public class JDBIConnector {
    private static Jdbi jdbi;

    private static void makeConnect()  {
        ResourceBundle resourceBundle = ResourceBundle.getBundle("env");
        MysqlDataSource dataSource = new MysqlXADataSource();
        dataSource.setURL(resourceBundle.getString("DB_URL"));
        dataSource.setUser(resourceBundle.getString("DB_USERNAME"));
        dataSource.setPassword(resourceBundle.getString("DB_PASSWORD"));
       try {
           dataSource.setAutoReconnect(true);
           dataSource.setUseCompression(true);
       }catch (SQLException e) {
           e.printStackTrace();
       }
        jdbi = Jdbi.create(dataSource);
    }

    public static Jdbi getInstance() {
        if (jdbi == null) makeConnect();
        return jdbi;
    }
}
