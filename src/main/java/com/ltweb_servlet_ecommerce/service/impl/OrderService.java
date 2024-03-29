package com.ltweb_servlet_ecommerce.service.impl;

import com.ltweb_servlet_ecommerce.constant.SystemConstant;
import com.ltweb_servlet_ecommerce.dao.IOrderDAO;
import com.ltweb_servlet_ecommerce.dao.IProductDAO;
import com.ltweb_servlet_ecommerce.log.LoggerHelper;
import com.ltweb_servlet_ecommerce.model.OrderModel;
import com.ltweb_servlet_ecommerce.paging.Pageble;
import com.ltweb_servlet_ecommerce.service.IOrderService;
import com.ltweb_servlet_ecommerce.subquery.SubQuery;
import com.ltweb_servlet_ecommerce.utils.RuntimeInfo;
import org.json.JSONObject;

import javax.inject.Inject;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

public class OrderService implements IOrderService {
    @Inject
    IOrderDAO orderDAO;

    @Override
    public List<OrderModel> findAllWithFilter(OrderModel model, Pageble pageble) throws SQLException {
        return orderDAO.findAllWithFilter(model,pageble);
    }

    @Override
    public OrderModel findWithFilter(OrderModel model) throws SQLException {
        return orderDAO.findWithFilter(model);
    }

    @Override
    public List<OrderModel> findByColumnValues(List<SubQuery> subQueryList, Pageble pageble) throws SQLException {
        return orderDAO.findByColumnValues(subQueryList,pageble);
    }
    @Override
    public Map<String,Object> findWithCustomSQL(String sql, List<Object> params) throws SQLException {
        return orderDAO.findWithCustomSQL(sql,params);
    }

    @Override
    public OrderModel update(OrderModel model) throws SQLException {
        OrderModel oldModel = orderDAO.findById(model.getId());
        model.setUpdateAt(new Timestamp(System.currentTimeMillis()));
        boolean isUpdated = orderDAO.update(model) > 0;
        OrderModel newModel = orderDAO.findById(model.getId());

        // logging
        JSONObject preValue = new JSONObject()
                .put(SystemConstant.VALUE_LOG, new JSONObject(oldModel));

        JSONObject value = new JSONObject()
                .put(SystemConstant.STATUS_LOG, String.format("Update orderDetails %s",  isUpdated ? "successfully" : "failed"))
                .put(SystemConstant.VALUE_LOG, new JSONObject(newModel));

        LoggerHelper.log(SystemConstant.WARN_LEVEL, "UPDATE",
                RuntimeInfo.getCallerClassNameAndLineNumber(), preValue, value);

        return newModel;
    }

    @Override
    public OrderModel delete(Long id) throws SQLException {
        OrderModel oldModel = orderDAO.findById(id);
        orderDAO.delete(id);
        return oldModel;
    }

    @Override
    public List<OrderModel> findAll(Pageble pageble) throws SQLException {
        return orderDAO.findAll(pageble);
    }

    @Override
    public OrderModel softDelete(Long id) throws SQLException {
        OrderModel model = orderDAO.findById(id);
        model.setUpdateAt(new Timestamp(System.currentTimeMillis()));
        model.setIsDeleted(true);
        orderDAO.update(model);
        return orderDAO.findById(model.getId());
    }

    @Override
    public OrderModel findById(Long id) throws SQLException {
        return orderDAO.findById(id);
    }

    @Override
    public OrderModel save(OrderModel model) throws SQLException {
        Long productId = orderDAO.save(model);
        OrderModel result = orderDAO.findById(productId);

        //logging
        String status = String.format("Saved order %s", result != null ? "successfully" : "failed");
        JSONObject value = new JSONObject().put(SystemConstant.STATUS_LOG, status)
                .put(SystemConstant.VALUE_LOG, result != null ? new JSONObject(result) : new JSONObject());

        LoggerHelper.log(result != null ? SystemConstant.WARN_LEVEL : SystemConstant.ERORR_LEVEL,
                "INSERT", RuntimeInfo.getCallerClassNameAndLineNumber(), value);

        return result;
    }
}
