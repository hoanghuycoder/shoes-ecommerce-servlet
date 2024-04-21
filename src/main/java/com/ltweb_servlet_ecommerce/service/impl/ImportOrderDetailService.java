package com.ltweb_servlet_ecommerce.service.impl;

import com.ltweb_servlet_ecommerce.dao.*;
import com.ltweb_servlet_ecommerce.model.*;
import com.ltweb_servlet_ecommerce.paging.Pageble;
import com.ltweb_servlet_ecommerce.service.IImportOrderDetailService;
import com.ltweb_servlet_ecommerce.service.IImportOrderService;

import javax.inject.Inject;
import java.util.List;
import java.util.Map;

public class ImportOrderDetailService implements IImportOrderDetailService {
    @Inject
    private IImportOrderDetailDAO orderDetailDAO;
    @Inject
    private IProductDAO productDAO;
    @Inject
    private ISizeDAO sizeDAO;
    @Override
    public double getTotalPriceByImportId(long importId) {
        return orderDetailDAO.getTotalPriceByImportId(importId);
    }

    @Override
    public List<ImportOrderDetailModel> findByImportId(long importId) {
        List<ImportOrderDetailModel> importList = orderDetailDAO.findByImportId(importId);
        List<Long> productSizeIds = importList.stream().map(ImportOrderDetailModel::getProductSizeId).toList();
        Map<Long, ProductModel> productMap =productDAO.findProductsByProductSizeIds(productSizeIds);
        Map<Long, SizeModel> sizeMap =sizeDAO.findSizesByProductSizeIds(productSizeIds);

        importList.forEach(importOrderDetailModel -> {
            ProductModel product = productMap.get(importOrderDetailModel.getProductSizeId());
            SizeModel size = sizeMap.get(importOrderDetailModel.getProductSizeId());
            importOrderDetailModel.setProductId(product.getId());
            importOrderDetailModel.setProductName(product.getName());
            importOrderDetailModel.setSize(size.getName());
        });
        return importList;
    }
}
