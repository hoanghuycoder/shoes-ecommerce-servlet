package com.ltweb_servlet_ecommerce.controller.admin.ajax.voucher;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ltweb_servlet_ecommerce.model.VoucherConditionModel;
import com.ltweb_servlet_ecommerce.model.VoucherModel;
import com.ltweb_servlet_ecommerce.service.IVoucherConditionService;
import com.ltweb_servlet_ecommerce.service.IVoucherService;
import com.ltweb_servlet_ecommerce.utils.FormUtil;
import com.ltweb_servlet_ecommerce.utils.HttpUtil;
import com.ltweb_servlet_ecommerce.utils.UrlUtil;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/ajax/voucher/add")
public class VoucherAjaxAdmin extends HttpServlet {
    @Inject
    IVoucherService voucherService;
    @Inject
    IVoucherConditionService voucherConditionService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            String jsonData = HttpUtil.of(req.getReader()).getJson();
            VoucherModel voucher = objectMapper.readValue(jsonData, VoucherModel.class);
            List<VoucherConditionModel> voucherConditions = voucher.getConditions();
            voucher.setConditions(null);
            voucher = voucherService.save(voucher);
            for (VoucherConditionModel voucherCondition : voucherConditions) {
                voucherCondition.setVoucherId(voucher.getId());
                voucherConditionService.save(voucherCondition);
            }
            resp.getWriter().write("{\"status\":\"success\"}");
        } catch ( Exception e) {
            HttpUtil.returnError500Json(objectMapper,resp,e.getMessage());
        }

    }
}