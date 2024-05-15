package com.ltweb_servlet_ecommerce.dao;

import com.ltweb_servlet_ecommerce.model.ImportOrderDetailModel;
import com.ltweb_servlet_ecommerce.model.ImportOrderModel;
import com.ltweb_servlet_ecommerce.paging.Pageble;

import java.util.List;

public interface IImportOrderDetailDAO {
    double getTotalPriceByImportId(String importId);
    boolean softDeleteByImportId(String id);

    List<ImportOrderDetailModel> findByImportId(String importId);
    List<ImportOrderDetailModel> findByProductSizeId();

    long save(ImportOrderDetailModel newModel);
}
