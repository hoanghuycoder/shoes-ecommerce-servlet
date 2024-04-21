package com.ltweb_servlet_ecommerce.service;

import com.ltweb_servlet_ecommerce.model.ImportOrderDetailModel;
import com.ltweb_servlet_ecommerce.model.ImportOrderModel;
import com.ltweb_servlet_ecommerce.paging.Pageble;

import java.util.List;

public interface IImportOrderDetailService {
    double getTotalPriceByImportId(long importId);

    List<ImportOrderDetailModel> findByImportId(long importId);
}
