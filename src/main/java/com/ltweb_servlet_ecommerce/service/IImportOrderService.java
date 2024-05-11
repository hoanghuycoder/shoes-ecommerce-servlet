package com.ltweb_servlet_ecommerce.service;

import com.ltweb_servlet_ecommerce.model.ImportOrderModel;
import com.ltweb_servlet_ecommerce.model.LogModel;
import com.ltweb_servlet_ecommerce.paging.Pageble;

import javax.servlet.http.Part;
import java.io.IOException;
import java.util.List;

public interface IImportOrderService {
    List<ImportOrderModel> findAll(Pageble pageble);

    boolean delete(Long[] ids);

    double getTotalImportPrice();

    ImportOrderModel save(ImportOrderModel model);

}
