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

@WebServlet(urlPatterns = {"/change-password"})
public class ChangePasswordController extends HttpServlet {
    @Inject
    IUserService userService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        NotifyUtil.setUp(request);
        RequestDispatcher rd = request.getRequestDispatcher("/views/shared/change-password.jsp");

        rd.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String currentPass = request.getParameter("currentpassword");
        String newpass = request.getParameter("newpassword");
        String repass = request.getParameter("repassword");

        if (!newpass.equals(repass)) {
            response.sendRedirect(request.getContextPath()+"/change-password?message=two_password_diffirent&toast=danger");
        } else if (newpass.length() < 6) {
            response.sendRedirect(request.getContextPath()+"/change-password?message=short_length_password&toast=danger");
        } else {
            //check current pass
            UserModel userModel = (UserModel) SessionUtil.getInstance().getValue(request, "USER_MODEL");
            if (userModel != null) {
                BCrypt.Hasher hasher = BCrypt.withDefaults();
                String currentHashedPassword = hasher.hashToString(12, currentPass.toCharArray());
                if (!currentHashedPassword.equals(userModel.getPassword())) {
                    response.sendRedirect(request.getContextPath()+"/change-password?message=password_invalid&toast=danger");
                } else {
                    String newHashedPassword = hasher.hashToString(12, newpass.toCharArray());
                    userModel.setPassword(newHashedPassword);
                    try {
                        userService.update(userModel);
                        response.sendRedirect(request.getContextPath()+"/new-password?message=change_password_success&toast=success");
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                }
            } else {
                response.sendRedirect(request.getContextPath()+"/change-password?message=not_login_yet&toast=danger");
            }
        }
    }
}
