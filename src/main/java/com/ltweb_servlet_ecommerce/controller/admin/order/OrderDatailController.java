package com.ltweb_servlet_ecommerce.controller.admin.order;


import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.ltweb_servlet_ecommerce.constant.SystemConstant;
import com.ltweb_servlet_ecommerce.model.AddressModel;
import com.ltweb_servlet_ecommerce.model.OrderDetailsModel;
import com.ltweb_servlet_ecommerce.model.OrderModel;
import com.ltweb_servlet_ecommerce.model.ProductModel;
import com.ltweb_servlet_ecommerce.service.*;
import com.ltweb_servlet_ecommerce.utils.CartUtil;
import com.ltweb_servlet_ecommerce.utils.StatusMapUtil;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/admin/orders/detail", name = "orderAdminServlet")
public class OrderDatailController extends HttpServlet {
    @Inject
    IOrderService orderService;
    @Inject
    IAddressService addressService;
    @Inject
    IOrderDetailsService orderDetailsService;
    @Inject
    IProductService productService;
    @Inject
    IProductSizeService productSizeService;
    @Inject
    ISizeService sizeService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        try {
            OrderModel orderModel = orderService.findById(Long.parseLong(id));
            AddressModel addressModel = addressService.findById(orderModel.getAddressId());
            OrderDetailsModel orderDetailsModel = new OrderDetailsModel();
            orderDetailsModel.setOrderId(orderModel.getId());
            List<OrderDetailsModel> listOrderDetails = orderDetailsService.findAllWithFilter(orderDetailsModel, null);
            List<ProductModel> listProduct = new ArrayList<>();
            for (OrderDetailsModel orderDetails : listOrderDetails) {
                new CartUtil().setListProductFromOrderDetails(listProduct, orderDetails, productSizeService, productService, sizeService);
            }
            orderModel.setAddressModel(addressModel);
            orderModel.setListProduct(listProduct);
            request.setAttribute("order", orderModel);
            request.setAttribute("status", StatusMapUtil.getStatusMap());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("/views/admin/order/admin-order-detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JsonParser parser = new JsonParser();
        JsonElement jsonTree = parser.parse(request.getReader());

        if (jsonTree.isJsonObject()) {
            String statusElement = jsonTree.getAsJsonObject().get("status").getAsString();
            long orderIdElement = jsonTree.getAsJsonObject().get("orderId").getAsLong();

            OrderModel order;
            try {
                order = orderService.findById(orderIdElement);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            if (order == null) {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                return;
            }

            if (order.getStatus().equals("ORDER_DELIVERED") || order.getStatus().equals("ORDER_CANCEL")) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                return;
            }

            if (order.getStatus().equals("ORDER_TRANSPORTING") && statusElement.equals("ORDER_PROCESSING")) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                return;
            }
            order.setStatus(statusElement);
            try {
                order = orderService.update(order);
                response.setStatus(order == null ? HttpServletResponse.SC_INTERNAL_SERVER_ERROR : HttpServletResponse.SC_OK);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
