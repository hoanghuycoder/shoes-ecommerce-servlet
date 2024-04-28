package com.ltweb_servlet_ecommerce.controller.admin.dashboard;

import com.ltweb_servlet_ecommerce.dao.impl.OrderDAO;
import com.ltweb_servlet_ecommerce.model.OrderModel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = {"/admin/dashboard"})
public class DashboardController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("/views/admin/home.jsp");

        rd.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String year = request.getParameter("selectedYear");
//        String month = request.getParameter("selectedMonth");
        if (year.equals("")) year = String.valueOf(LocalDate.now().getYear());
//        if (month.equals("")) month = "1";
        request.setAttribute("year", year);
        OrderDAO orderDAO = new OrderDAO();

        System.out.println(year);


        List<Integer> list = new ArrayList<>();

        try {
        for (int i = 1; i <= 12; i++) {
            List<OrderModel> models = orderDAO.findByYear(year, String.valueOf(i));
            if (models != null) {
                list.add(models.size());
            } else {
                list.add(0);
            }
        }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        for (int i : list) {
            System.out.println(i);
        }

        request.setAttribute("listOrder", list);

        request.getRequestDispatcher("/views/admin/home.jsp").forward(request,response);

    }
}
