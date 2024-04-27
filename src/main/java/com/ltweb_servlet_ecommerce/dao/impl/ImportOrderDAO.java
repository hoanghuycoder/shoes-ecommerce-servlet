package com.ltweb_servlet_ecommerce.dao.impl;

import com.ltweb_servlet_ecommerce.dao.IImportOrderDAO;
import com.ltweb_servlet_ecommerce.mapper.impl.ImportOrderMapper;
import com.ltweb_servlet_ecommerce.model.ImportOrderModel;
import com.ltweb_servlet_ecommerce.model.LogModel;
import com.ltweb_servlet_ecommerce.paging.Pageble;
import com.ltweb_servlet_ecommerce.utils.SqlPagebleUtil;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ImportOrderDAO extends AbstractDAO<LogModel> implements IImportOrderDAO {

    @Override
    public List<ImportOrderModel> findAll(Pageble pageble) {
        StringBuilder sqlStrBuilder = new StringBuilder("SELECT * FROM import_orders where isDeleted = 0");
        SqlPagebleUtil.addSQlPageble(sqlStrBuilder, pageble);
        return query(sqlStrBuilder.toString(), new ImportOrderMapper(), null, ImportOrderModel.class);
    }
    @Override
    public boolean softDelete(Long id) {
        String sql = "update import_orders set isDeleted=? where id=?";
        List<Object> params = new ArrayList<>();
        params.add(1);
        params.add(id);
        try {
            return delete(sql, params) > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
