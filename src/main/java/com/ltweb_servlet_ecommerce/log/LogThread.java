package com.ltweb_servlet_ecommerce.log;

import com.ltweb_servlet_ecommerce.model.LogModel;
import com.ltweb_servlet_ecommerce.utils.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;

/**
 * A thread for saving log items to the database.
 */
public class LogThread extends Task<LogModel> {

    @Override
    public Integer call() throws Exception {
        List<LogModel> logs = getItems();
        try {
            if (logs != null && !logs.isEmpty()) {
                save(logs);
            }
        } catch (Exception e) {
            return 0;
        }
        return 1;
    }

    /**
     * Saves the list of log items to the database.
     * @param logs The list of log items to save.
     */
    public void save(List<LogModel> logs) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO logs(ip, level, address, preValue, value) VALUES(?,?,?,?,?)";
        try {
            connection = JDBCUtil.getConnection();
            connection.setAutoCommit(false);
            preparedStatement = connection.prepareStatement(sql);

            for (LogModel log : logs) {
                preparedStatement.setString(1, log.getIp());
                preparedStatement.setString(2, log.getLevel());
                preparedStatement.setString(3, log.getAddress());
                // Check if preValue is null before setting it to the PreparedStatement
                if (log.getPreValue() != null) {
                    preparedStatement.setString(4, log.getPreValue());
                } else {
                    preparedStatement.setNull(4, Types.VARCHAR);
                }
                preparedStatement.setString(5, log.getValue());
                preparedStatement.executeUpdate();
            }
            connection.commit();
        } catch (SQLException e) {
            if (connection != null) {
                connection.rollback();
            }
        } finally {
            JDBCUtil.closeConnection(connection, preparedStatement, null);
        }
    }
}
