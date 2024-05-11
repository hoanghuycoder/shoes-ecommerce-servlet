package com.ltweb_servlet_ecommerce.controller.web.shared;

import com.ltweb_servlet_ecommerce.model.UserModel;
import com.ltweb_servlet_ecommerce.service.IUserService;
import com.ltweb_servlet_ecommerce.utils.FormUtil;
import com.ltweb_servlet_ecommerce.utils.NotifyUtil;
import com.ltweb_servlet_ecommerce.utils.SendMailUtil;
import com.ltweb_servlet_ecommerce.utils.SessionUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Random;


@WebServlet(urlPatterns = {"/sign-up"})
public class RegisterController extends HttpServlet {
    @Inject
    IUserService userService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        NotifyUtil.setUp(req);
        RequestDispatcher rd = req.getRequestDispatcher("/views/shared/register.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String password = (String) req.getParameter("password");
        if (password.length() < 6) {
            resp.sendRedirect(req.getContextPath()+"/sign-up?message=short_length_password&toast=danger");
        } else {

            try {
                UserModel userModel = FormUtil.toModel(UserModel.class, req);
                UserModel tmpUser = new UserModel();
                tmpUser.setEmail(userModel.getEmail());
                tmpUser = userService.findWithFilter(tmpUser);
                if (tmpUser == null) {

                    Random random = new Random();
                    Integer OTP = 100_000 + random.nextInt(900_000);
                    SendMailUtil.sendMail(userModel.getEmail(), "Vertify your email", SendMailUtil.templateOTPMail(OTP + ""));
                    SessionUtil.putValue(req, "OTP", OTP);
                    SessionUtil.getInstance().putValue(req, "REGISTER_USER", userModel);
                    resp.sendRedirect("/vertify-email");

                } else {
                    resp.sendRedirect(req.getContextPath() + "/sign-up?message=exist_user&toast=danger");
                }



            } catch (InstantiationException | IllegalAccessException | InvocationTargetException | SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
