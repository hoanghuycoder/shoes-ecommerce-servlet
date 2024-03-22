package com.ltweb_servlet_ecommerce.dao;

import com.ltweb_servlet_ecommerce.model.LogModel;

import java.sql.SQLException;
import java.util.List;

public interface ILogDAO {
    void insert(List<LogModel> logs) ;
}
