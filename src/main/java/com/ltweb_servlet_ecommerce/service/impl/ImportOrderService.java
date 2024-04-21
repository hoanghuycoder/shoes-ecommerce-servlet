package com.ltweb_servlet_ecommerce.service.impl;

import com.ltweb_servlet_ecommerce.dao.IImportOrderDAO;
import com.ltweb_servlet_ecommerce.dao.IImportOrderDetailDAO;
import com.ltweb_servlet_ecommerce.model.ImportOrderModel;
import com.ltweb_servlet_ecommerce.paging.Pageble;
import com.ltweb_servlet_ecommerce.service.IImportOrderService;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.List;

public class ImportOrderService implements IImportOrderService {
    @Inject
    private IImportOrderDAO importDAO;
    @Inject
    private IImportOrderDetailDAO importDetailDAO;

    @Override
    public List<ImportOrderModel> findAll(Pageble pageble) {
        // calculate total price for every import order
        List<ImportOrderModel> all = importDAO.findAll(pageble);
        if (all == null) {
            all = new ArrayList<>();
        } else {
            all.forEach(importOrderModel -> {
                importOrderModel.setTotalPrice(importDetailDAO.getTotalPriceByImportId(importOrderModel.getId()));
            });
        }
        return all;
    }

    @Override
    public boolean delete(Long[] ids) {
        boolean result = true;
        for (Long id : ids) {
            result = result && importDAO.softDelete(id) && importDetailDAO.softDeleteByImportId(id);
        }

        return result;
    }
}
