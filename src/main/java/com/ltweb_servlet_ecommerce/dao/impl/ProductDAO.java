package com.ltweb_servlet_ecommerce.dao.impl;

import com.ltweb_servlet_ecommerce.dao.IProductDAO;
import com.ltweb_servlet_ecommerce.mapper.impl.ProductMapper;
import com.ltweb_servlet_ecommerce.mapper.impl.ProductImageMapper;
import com.ltweb_servlet_ecommerce.mapper.impl.UserMapper;
import com.ltweb_servlet_ecommerce.mapper.result.MapSQLAndParamsResult;
import com.ltweb_servlet_ecommerce.mapper.impl.ProductMapper;
import com.ltweb_servlet_ecommerce.model.ProductModel;
import com.ltweb_servlet_ecommerce.model.ProductModel;
import com.ltweb_servlet_ecommerce.model.ProductModel;
import com.ltweb_servlet_ecommerce.model.SizeModel;
import com.ltweb_servlet_ecommerce.paging.Pageble;
import com.ltweb_servlet_ecommerce.subquery.SubQuery;
import com.ltweb_servlet_ecommerce.utils.JDBCUtil;
import com.ltweb_servlet_ecommerce.utils.SqlPagebleUtil;
import org.apache.commons.lang3.StringUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class ProductDAO extends AbstractDAO<ProductModel> implements IProductDAO {
    @Override
    public List<ProductModel> findAllWithFilter(ProductModel model,Pageble pageble) throws SQLException {
        StringBuilder sqlStrBuilder = new StringBuilder("SELECT * FROM products WHERE 1=1 ");
        MapSQLAndParamsResult sqlAndParams = new ProductMapper().mapSQLAndParams(sqlStrBuilder,model,"select",pageble);
        String sql = sqlAndParams.getSql();
        List<Object> params = sqlAndParams.getParams();
        List<ProductModel> result = query(sql.toString(), new ProductMapper(),params,ProductModel.class);
        return result;
    }
    @Override
    public List<ProductModel> findAll(Pageble pageble) throws SQLException {
        StringBuilder sqlStrBuilder = new StringBuilder("SELECT * FROM products");
        SqlPagebleUtil.addSQlPageble(sqlStrBuilder,pageble);
        return query(sqlStrBuilder.toString(),new ProductMapper(),null, ProductModel.class);
    }

    @Override
    public ProductModel findById(Long id) throws SQLException {
        String sql = "select * from products where id=?";
        List<Object> params = new ArrayList<>();
        params.add(id);
        List<ProductModel> result =  query(sql,new ProductMapper(),params,ProductModel.class);
        return result.isEmpty() ? null : result.get(0);
    }
    @Override
    public ProductModel findWithFilter(ProductModel model) throws SQLException {
        StringBuilder sqlStrBuilder = new StringBuilder("SELECT * FROM products WHERE 1=1 ");
        MapSQLAndParamsResult sqlAndParams = new ProductMapper().mapSQLAndParams(sqlStrBuilder,model,"select",null);
        String sql = sqlAndParams.getSql();
        List<Object> params = sqlAndParams.getParams();
        List<ProductModel> result = query(sql.toString(), new ProductMapper(),params,ProductModel.class);
        return result.isEmpty() ? null : result.get(0);
    }

    @Override
    public List<ProductModel> findByColumnValues(List<SubQuery> subQueryList,Pageble pageble) throws SQLException {
        StringBuilder sqlStrBuilder = new StringBuilder("SELECT * FROM products WHERE 1=1 ");
        List<ProductModel> result = queryWithSubQuery(sqlStrBuilder,new ProductMapper(),subQueryList,"in",ProductModel.class,pageble);
        return result;
    }

    @Override
    public Long save(ProductModel model) throws SQLException {
        StringBuilder sqlStrBuilder = new StringBuilder("INSERT INTO products SET ");
        MapSQLAndParamsResult sqlAndParams = new ProductMapper().mapSQLAndParams(sqlStrBuilder,model,"insert",null);
        String sql = sqlAndParams.getSql();
        List<Object> params = sqlAndParams.getParams();
        return insert(sql,params);
    }

    @Override
    public void update(ProductModel model) throws SQLException {
        StringBuilder sqlStrBuilder = new StringBuilder("UPDATE products SET ");
        MapSQLAndParamsResult sqlAndParams = new ProductMapper().mapSQLAndParams(sqlStrBuilder,model,"update",null);
        String sql = sqlAndParams.getSql();
        List<Object> params = sqlAndParams.getParams();
        update(sql,params);
    }

    @Override
    public void delete(Long id) throws SQLException {
        String sql = "delete from products where id=?";
        List<Object> params = new ArrayList<>();
        params.add(id);
        delete(sql,params);
    }

    @Override
    public Map<String, Object> findWithCustomSQL(String sql, List<Object> params) throws SQLException {
        return queryCustom(sql,params);
    }
    @Override
    public void updateProductTotalView(Long id) throws SQLException {
        List<Object> params = new ArrayList<>();
        params.add(id);
        updateCustom("UPDATE `products` SET totalViewAndSearch=totalViewAndSearch+1 WHERE id=?",params);
    }
    @Override
    public Map<Long, ProductModel> findProductsByProductSizeIds(List<Long> productSizeIds) {
        Map<Long, ProductModel> result = new HashMap<>();
        String sql = "SELECT ps.id AS productSizeId, p.id, p.name FROM products p " +
                "INNER JOIN product_sizes ps ON p.id = ps.productId WHERE ps.id IN (" +
                productSizeIds.stream().map(Object::toString).collect(Collectors.joining(",")) + ")";
        try (Connection connection = JDBCUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                long productSizeId = resultSet.getLong("productSizeId");
                ProductModel productModel = new ProductModel();
                productModel.setId(resultSet.getLong("id"));
                productModel.setName(resultSet.getString("name"));
                result.put(productSizeId, productModel);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    @Override
    public void updateThumbnail(long productId, String url) {
        String sql = "UPDATE products SET thumbnail=? WHERE id=?";
        List<Object> params = new ArrayList<>();
        params.add(url);
        params.add(productId);
        try {
            update(sql,params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
