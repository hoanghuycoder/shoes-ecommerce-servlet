package com.ltweb_servlet_ecommerce.controller.admin.importOrder;

import com.ltweb_servlet_ecommerce.constant.SystemConstant;
import com.ltweb_servlet_ecommerce.model.ImportOrderModel;
import com.ltweb_servlet_ecommerce.service.IImportOrderService;
import com.ltweb_servlet_ecommerce.utils.AuthRole;
import com.ltweb_servlet_ecommerce.utils.HttpUtil;
import com.ltweb_servlet_ecommerce.utils.NotifyUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
@MultipartConfig(
        maxFileSize = 1024 * 1024,// 1MB
        maxRequestSize = 1024 * 1024 * 10//10MB
)
@WebServlet(urlPatterns = "/admin/import-order")
public class ImportOrderController extends HttpServlet {
    @Inject
    private IImportOrderService importOrderService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        NotifyUtil.setUp(req);
        List<ImportOrderModel> list = importOrderService.findAll(null);
        req.setAttribute(SystemConstant.LIST_MODEL, list);
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/import-order/list.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Collection<Part> parts = request.getParts();
        String realPath = request.getServletContext().getRealPath("/images/blogs");
        //validate
//        boolean hasError = validate(blog);
//        if (!hasError) {
//            // if image isn't null
//            boolean isImageProvided = !image.getSubmittedFileName().isEmpty();
//            if (isImageProvided) {
//                newFileName = WriteImage.generateFileName(image.getSubmittedFileName(), realPath);
//                blog.setImage(newFileName);
//            }
//            blog.setCreatedBy(user.fullName());
//
//            boolean isOperationSuccessful = blog.getId() != 0 ? blogService.update(blog) : blogService.save(blog);
//            if (isOperationSuccessful && isImageProvided) {
//                //write image
//                WriteImage.writeImage(image.getInputStream(), realPath, newFileName);
//            }
//            int statusCode = isOperationSuccessful ? HttpServletResponse.SC_NO_CONTENT : HttpServletResponse.SC_INTERNAL_SERVER_ERROR;
//            response.setStatus(statusCode);
//        } else {
//            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
//        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if(!AuthRole.checkPermission(response, request, SystemConstant.ADMIN_ROLE)) return;
        Long[] ids = HttpUtil.of(request.getReader()).toModel(Long[].class);
        if (ids.length != 0) {
            boolean result = importOrderService.delete(ids);
            response.setStatus(result ? HttpServletResponse.SC_OK : HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        } else {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}
