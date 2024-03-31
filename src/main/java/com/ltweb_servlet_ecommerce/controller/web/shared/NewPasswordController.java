package com.ltweb_servlet_ecommerce.controller.web.shared;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.ltweb_servlet_ecommerce.model.UserModel;
import com.ltweb_servlet_ecommerce.service.IUserService;
import com.ltweb_servlet_ecommerce.utils.NotifyUtil;
import com.ltweb_servlet_ecommerce.utils.SessionUtil;

import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = {"/new-password"})
public class NewPasswordController extends HttpServlet {
    @Inject
    IUserService userService;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String pass = request.getParameter("password");
        String repass = request.getParameter("repassword");

        if (!pass.equals(repass)) {
            request.setAttribute("error", "Nhập mật khẩu chưa chính xác!");
            request.getRequestDispatcher("/views/shared/new-password.jsp").forward(request, response);
        } else {

            UserModel userModel = (UserModel) SessionUtil.getInstance().getValue(request, "FORGET_PASS");
            SessionUtil.removeValue(request, "FORGET_PASS");
            userModel.getPassword();

            BCrypt.Hasher hasher = BCrypt.withDefaults();
            String hashedPassword = hasher.hashToString(12, pass.toCharArray());
            userModel.setPassword(hashedPassword);
            try {
                userService.update(userModel);
                request.setAttribute("error", "Đổi mật khẩu thành công!");
                request.getRequestDispatcher("/views/shared/change-password.jsp").forward(request, response);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }
    }
}
