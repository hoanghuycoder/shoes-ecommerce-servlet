<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ltweb_servlet_ecommerce.utils.StatusMapUtil" %>
<fmt:setLocale value="vi_VN"/>
<html>
<head>
    <title>Chi tiết đơn hàng</title>

</head>
<body>
<div class="row">
    <div class="col-12">
        <div class="card my-4">
            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                    <h6 class="text-white text-capitalize ps-3">Chi tiết đơn hàng #${order.id}</h6>
                </div>
            </div>
            <div class="card-body px-0 pb-2">
                <div class="page-content">
                    <div class="content">
                        <div class="status">
                            <div class="checkline">
                                <div class="sub-status">
                                    <div class="circle"><i class="fa-solid fa-user"
                                                           style="color: #e73774"></i></div>
                                    <div class="status-content">
                                        <p><b>Khách hàng</b> <br>
                                            ${order.addressModel.fullName}<br>
                                            0${order.addressModel.phoneNumber}
                                        </p>
                                    </div>
                                </div>
                                <div class="sub-status">
                                    <div class="circle"><i class="fa-solid fa-truck"
                                                           style="color: #e73774;"></i></div>
                                    <div class="status-content">
                                        <p><b>Thông tin đơn hàng</b> <br>
                                            ${order.note}
                                        </p>
                                    </div>
                                </div>
                                <div class="sub-status">
                                    <div class="circle"><i class="fa-solid fa-location-dot"
                                                           style="color: #e73774;"></i>
                                    </div>
                                    <div class="status-content">
                                        <p><b>Vận chuyển tới</b><br>
                                            ${order.addressModel.hamlet},${order.addressModel.commune},
                                            ${order.addressModel.district},${order.addressModel.province}
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="information">
                            <table style="width: 100%;">
                                <tr class="head">
                                    <td style="width: 50%;">Sản phẩm</td>
                                    <td style="width: 15%;">Giá</td>
                                    <td style="width: 20%;">Số lượng</td>
                                    <td class="f-right">Tổng</td>
                                </tr>
                                <c:forEach var="product_item" items="${order.listProduct}">
                                    <tr class="item">
                                        <td style="display: flex;">
                                            <img class="img-product" src="" alt="">
                                            <div class="product-name">
                                                    ${product_item.name} - ${product_item.sizeName}
                                            </div>
                                        </td>
                                        <td>
                                            <fmt:formatNumber type="currency" value="${product_item.price}"/>
                                        </td>
                                        <td>
                                                ${product_item.quantity}
                                        </td>
                                        <td class="f-right">
                                            <fmt:formatNumber type="currency" value="${product_item.subTotal}"/>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <tr class="final">
                                    <td></td>
                                    <td></td>
                                    <td>Phí giao hàng : <br>
                                        Tổng : <br>
                                        Trạng thái :
                                    </td>
                                    <td class="f-right">

                                        <fmt:formatNumber type="currency" value="20000"/><br>
                                        <span style="font-size: 15px;font-weight: 700;">
                                        <fmt:formatNumber type="currency" value="${order.totalAmount}"/>
                                    </span> <br>
                                        <span class="status"
                                              style="padding: 5px; background-color: antiquewhite; color: rgb(67, 142, 185);border-radius: 5px;">
                                            ${StatusMapUtil.getStatusValue(order.status)}
                                        </span>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="operation">
                            <select name="" id="select">
                                <c:forEach var="entry" items="${status}">
                                    <option value="${entry.key}"
                                            <c:if test="${order.status eq entry.key}"> selected </c:if>
                                    >${entry.value}</option>
                                </c:forEach>
                            </select>
                            <button class="change-state" id="changeBtn"
                                    <c:if test="${order.status eq 'ORDER_CANCEL' || order.status eq 'ORDER_DELIVERED'}">
                                        style="background-color: #cccccc;color: #666666;cursor: not-allowed;pointer-events: none;"
                                    </c:if>
                            >Lưu thay đổi
                            </button>

                        </div>
                    </div>
                    <!-- /.row -->
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    window.addEventListener("DOMContentLoaded", function () {
        $("#changeBtn").click(function () {
            let status = $("#select").val();
            let orderId = ${order.id};
            console.log(JSON.stringify({
                status: status,
                orderId: orderId
            }))
            $.ajax({
                url: "<c:url value="/admin/orders/detail"/>",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify({
                    status: status,
                    orderId: orderId
                }),
                success: function (data) {
                    // use swetalert2
                    Swal.fire({
                        icon: "success",
                        title: "Thay đổi thành công",
                        toast: true,
                        position: "top-end",
                        showConfirmButton: false,
                        timer: 1000,
                        timerProgressBar: true,
                        didOpen: (toast) => {
                            toast.onmouseenter = Swal.stopTimer;
                            toast.onmouseleave = Swal.resumeTimer;
                        }
                    });
                    setTimeout(function () {
                        window.location.reload();
                    }, 1000)
                },
                error: function (data) {
                    Swal.fire({
                        icon: "warning",
                        title: "Thay đổi thất bại!",
                        toast: true,
                        position: "top-end",
                        showConfirmButton: false,
                        timer: 1000,
                        timerProgressBar: true,
                        didOpen: (toast) => {
                            toast.onmouseenter = Swal.stopTimer;
                            toast.onmouseleave = Swal.resumeTimer;
                        }
                    });
                    console.log(data)
                }
            })
        })
    })
</script>
</body>
</html>
