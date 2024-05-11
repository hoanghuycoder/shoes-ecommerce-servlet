package com.ltweb_servlet_ecommerce.dao;

import com.ltweb_servlet_ecommerce.model.ImportOrderDetailModel;
import com.ltweb_servlet_ecommerce.model.ImportOrderModel;
import com.ltweb_servlet_ecommerce.paging.Pageble;

import java.util.List;

public interface IImportOrderDetailDAO {
    double getTotalPriceByImportId(long importId);
    boolean softDeleteByImportId(Long id);

    List<ImportOrderDetailModel> findByImportId(long importId);
    List<ImportOrderDetailModel> findByProductSizeId();
}
