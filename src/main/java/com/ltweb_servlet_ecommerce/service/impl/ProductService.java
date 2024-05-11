package com.ltweb_servlet_ecommerce.service.impl;

import com.ltweb_servlet_ecommerce.dao.IProductDAO;
import com.ltweb_servlet_ecommerce.dao.IProductSizeDAO;
import com.ltweb_servlet_ecommerce.model.ProductModel;
import com.ltweb_servlet_ecommerce.paging.Pageble;
import com.ltweb_servlet_ecommerce.service.IProductService;
import com.ltweb_servlet_ecommerce.subquery.SubQuery;

import javax.inject.Inject;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

public class ProductService implements IProductService {
    @Inject
    IProductDAO productDAO;
    @Inject
    IProductSizeDAO sizeDAO;

    @Override
    public List<ProductModel> findAllWithFilter(ProductModel model, Pageble pageble) throws SQLException {
        List<ProductModel> values = productDAO.findAllWithFilter(model, pageble);
        values.forEach(this::setPrice);
        return values;
    }

    @Override
    public ProductModel findWithFilter(ProductModel model) throws SQLException {
        ProductModel values = productDAO.findWithFilter(model);
        setPrice(values);
        return values;
    }

    @Override
    public List<ProductModel> findByColumnValues(List<SubQuery> subQueryList, Pageble pageble) throws SQLException {
        List<ProductModel> values = productDAO.findByColumnValues(subQueryList, pageble);
        values.forEach(this::setPrice);
        return values;
    }

    private void setPrice(ProductModel value) {
        try {
            Map<String, Object> withCustomSQL = sizeDAO.findWithCustomSQL("SELECT price FROM product_sizes WHERE productId = ? ORDER BY createAt DESC", List.of(value.getId()));
            value.setPrice(((BigDecimal) withCustomSQL.get("price")).doubleValue());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Map<String, Object> findWithCustomSQL(String sql, List<Object> params) throws SQLException {
        return productDAO.findWithCustomSQL(sql, params);
    }

    @Override
    public ProductModel update(ProductModel model) throws SQLException {
        ProductModel oldModel = productDAO.findById(model.getId());
        model.setUpdateAt(new Timestamp(System.currentTimeMillis()));
        productDAO.update(model);
        return productDAO.findById(model.getId());
    }

    @Override
    public ProductModel delete(Long id) throws SQLException {
        ProductModel oldModel = productDAO.findById(id);
        productDAO.delete(id);
        return oldModel;
    }

    @Override
    public List<ProductModel> findAll(Pageble pageble) throws SQLException {
        List<ProductModel> values = productDAO.findAll(pageble);
        values.forEach(this::setPrice);
        return values;
    }

    @Override
    public ProductModel softDelete(Long id) throws SQLException {
        ProductModel model = productDAO.findById(id);
        model.setUpdateAt(new Timestamp(System.currentTimeMillis()));
        model.setIsDeleted(true);
        productDAO.update(model);
        return productDAO.findById(model.getId());
    }

    @Override
    public ProductModel findById(Long id) throws SQLException {
        ProductModel productModel = productDAO.findById(id);
        setPrice(productModel);
        return productModel;
    }

    @Override
    public ProductModel save(ProductModel model) throws SQLException {
        Long productId = productDAO.save(model);
        return productDAO.findById(productId);
    }

    @Override
    public ProductModel updateProductTotalView(Long id) throws SQLException {
        productDAO.updateProductTotalView(id);
        return productDAO.findById(id);
    }
}
