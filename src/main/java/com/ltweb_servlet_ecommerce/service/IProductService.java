package com.ltweb_servlet_ecommerce.service;

import com.ltweb_servlet_ecommerce.model.ProductModel;
import com.ltweb_servlet_ecommerce.paging.Pageble;
import com.ltweb_servlet_ecommerce.subquery.SubQuery;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IProductService {
    List<ProductModel> findAllWithFilter(ProductModel model, Pageble pageble) throws SQLException;
    ProductModel findWithFilter(ProductModel model) throws SQLException;
    List<ProductModel> findByColumnValues(List<SubQuery> subQueryList, Pageble pageble) throws SQLException;
    ProductModel save(ProductModel model) throws SQLException;
    ProductModel delete(Long id) throws SQLException;
    ProductModel update(ProductModel model) throws SQLException;
    ProductModel findById(Long id) throws SQLException;
    List<ProductModel> findAll(Pageble pageble) throws SQLException;
    ProductModel softDelete(Long id) throws SQLException;
    Map<String,Object> findWithCustomSQL(String sql, List<Object> params) throws SQLException;
    ProductModel updateProductTotalView(Long id) throws SQLException;
}
