package com.ltweb_servlet_ecommerce.dao.impl;

import com.ltweb_servlet_ecommerce.dao.IImportOrderDetailDAO;
import com.ltweb_servlet_ecommerce.mapper.impl.ImportOrderDetailMapper;
import com.ltweb_servlet_ecommerce.model.ImportOrderDetailModel;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ImportOrderDetailDAO extends AbstractDAO<ImportOrderDetailModel> implements IImportOrderDetailDAO {

    @Override
    public double getTotalPriceByImportId(long importId) {
        String sql = "SELECT SUM(priceImport) AS totalPrice FROM import_order_details where importOrderId = ?";
        Map<String, Object> stringObjectMap = queryCustom(sql, List.of(importId));
        Object totalPrice = stringObjectMap.get("totalPrice");
        if (totalPrice != null) {
            return (double) totalPrice;
        } else {
            return 0;
        }
    }

    @Override
    public boolean softDeleteByImportId(Long id) {
        String sql = "update import_order_details set isDeleted=? where importOrderId=?";
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

    @Override
    public List<ImportOrderDetailModel> findByImportId(long importId) {
        String sql = "SELECT * FROM import_order_details where importOrderId = ? and isDeleted = 0";
        return query(sql, new ImportOrderDetailMapper(), List.of(importId), ImportOrderDetailModel.class);
    }
}
