package com.ltweb_servlet_ecommerce.utils;

import java.sql.*;
import java.util.ResourceBundle;

public class JDBCUtil {
    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
//            Lưu trong /bin/setenv.bat của tomcat
            ResourceBundle resourceBundle = ResourceBundle.getBundle("env");
            return DriverManager.getConnection(resourceBundle.getString("DB_URL"), resourceBundle.getString("DB_USERNAME"), resourceBundle.getString("DB_PASSWORD"));
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return null;
        }

    }


    public static void closeConnection(Connection connection, PreparedStatement statement, ResultSet resultSet) {
        try {
            if (connection != null) {
                connection.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (resultSet != null) {
                resultSet.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
