<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.ltweb_servlet_ecommerce.service.impl.OrderService" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.ltweb_servlet_ecommerce.service.impl.ImportOrderService" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.ltweb_servlet_ecommerce.service.impl.ProductSizeService" %>
<fmt:setLocale value="vi_VN"/>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Admin Nai - Dashboard</title>
    <script>
        // Set new default font family and font color for charts
        Chart.defaults.global.defaultFontFamily = 'Nunito, -apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
        Chart.defaults.global.defaultFontColor = '#858796';
    </script>

</head>
<body>

<!-- Earnings (Monthly) Card Example -->
<div class="row">
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                            Tổng Doanh thu</div>
                        <%  OrderService orderService = new OrderService();
                            double totalOrderPrice = orderService.getTotalPrice();
                            DecimalFormat decimalFormat1 = new DecimalFormat("#,##0.00 ₫");
                            String formattedOrderPrice = decimalFormat1.format(totalOrderPrice);
                           %>
                        <div class="h5 mb-0 font-weight-bold text-gray-800"><%=formattedOrderPrice%></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-calendar fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Earnings (Annual) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-success shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                            Tổng Chi phí nhập hàng</div>
                        <%  ImportOrderService importOrderService = new ImportOrderService();
                            double totalImportPrice = importOrderService.getTotalImportPrice();
                            DecimalFormat decimalFormat2 = new DecimalFormat("#,##0.00 ₫");
                            String formattedImportPrice = decimalFormat2.format(totalImportPrice);%>
                        <div class="h5 mb-0 font-weight-bold text-gray-800"><%=formattedImportPrice%></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                            Tổng Lợi Nhuận</div>
                        <%
                            ProductSizeService productSizeService = new ProductSizeService();
                            double totalProfit = productSizeService.getTotalProfit();
                            String formattedProfitPrice = decimalFormat2.format(totalProfit);
                        %>
                        <div class="h5 mb-0 font-weight-bold text-gray-800"><%=formattedProfitPrice%></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-calendar fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Earnings (Annual) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-success shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                            Earnings (Annual)</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800"></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Bar Chart -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Bar Chart</h6>
    </div>
    <div class="card-body">
        <div class="chart-bar">
            <canvas id="myBarChart"></canvas>
        </div>
        <hr>
        Styling for the bar chart can be found in the
        <code>/js/demo/chart-bar-demo.js</code> file.
    </div>
</div>

<!-- Bar Chart -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Thống kê đơn hàng:</h6>
        <hr>
        <div>
            <label for="yearSelect">Chọn năm:</label>
            <form action="/admin/dashboard" method="post"> <!-- Thay đổi your_action.jsp thành tên của file JSP bạn muốn gửi dữ liệu đến -->
                <select id="yearSelect" name="selectYear" onchange="updateYear()">
                    <option value="năm">Năm</option>
                    <option value="2020">2020</option>
                    <option value="2021">2021</option>
                    <option value="2022">2022</option>
                    <option value="2023">2023</option>
                    <option value="2024">2024</option>
                </select>


<%--                <select id="monthSelect" name="selectMonth" onchange="updateMonth()">--%>
<%--                    <option value="1" selected>Tháng 1</option>--%>
<%--                    <option value="2">Tháng 2</option>--%>
<%--                    <option value="3">Tháng 3</option>--%>
<%--                    <option value="4">Tháng 4</option>--%>
<%--                    <option value="5">Tháng 5</option>--%>
<%--                    <option value="6">Tháng 6</option>--%>
<%--                    <option value="7">Tháng 7</option>--%>
<%--                    <option value="8">Tháng 8</option>--%>
<%--                    <option value="9">Tháng 9</option>--%>
<%--                    <option value="10">Tháng 10</option>--%>
<%--                    <option value="11">Tháng 11</option>--%>
<%--                    <option value="12">Tháng 12</option>--%>
<%--                </select>--%>

                <!-- Thêm input hidden để lưu giá trị năm đã chọn -->
                <input type="hidden" id="selectedYear" name="selectedYear" />
<%--                <input type="hidden" id="selectedMonth" name="selectedMonth" />--%>

                <input type="submit" value="Submit" />
            </form>
        </div>
        <hr>
        <%
            String currentYear = (String) request.getAttribute("year");
            List<Integer> list = (List<Integer>) request.getAttribute("listOrder");
        %>
    </div>
    <div class="card-body">
        <p>Kết quả của: <%= currentYear %></p>
        <div class="chart-bar">
            <canvas id="myBarChart2"></canvas>
        </div>

    </div>
    <div>Coming soon</div>
</div>


<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    // Set new default font family and font color to mimic Bootstrap's default styling

    function number_format(number, decimals, dec_point, thousands_sep) {
        // *     example: number_format(1234.56, 2, ',', ' ');
        // *     return: '1 234,56'
        number = (number + '').replace(',', '').replace(' ', '');
        var n = !isFinite(+number) ? 0 : +number,
            prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
            sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
            dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
            s = '',
            toFixedFix = function(n, prec) {
                var k = Math.pow(10, prec);
                return '' + Math.round(n * k) / k;
            };
        // Fix for IE parseFloat(0.55).toFixed(0) = 0;
        s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
        if (s[0].length > 3) {
            s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
        }
        if ((s[1] || '').length < prec) {
            s[1] = s[1] || '';
            s[1] += new Array(prec - s[1].length + 1).join('0');
        }
        return s.join(dec);
    }

    // Bar Chart Example
    var ctx = document.getElementById("myBarChart");
    var myBarChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4","Tháng 5","Tháng 6","Tháng 7","Tháng 8","Tháng 9","Tháng 10","Tháng 11","Tháng 12",],
            datasets: [{
                label: "Revenue",
                backgroundColor: "#4e73df",
                hoverBackgroundColor: "#2e59d9",
                borderColor: "#4e73df",
                data: [4215, 5312, 6251, 7841, 9821, 14984,4215, 5312, 6251, 7841, 9821, 14984],
            }],
        },
        options: {
            maintainAspectRatio: false,
            layout: {
                padding: {
                    left: 10,
                    right: 25,
                    top: 25,
                    bottom: 0
                }
            },
            scales: {
                xAxes: [{
                    time: {
                        unit: 'month'
                    },
                    gridLines: {
                        display: false,
                        drawBorder: false
                    },
                    ticks: {
                        maxTicksLimit: 6
                    },
                    maxBarThickness: 25,
                }],
                yAxes: [{
                    ticks: {
                        min: 0,
                        max: 15000,
                        maxTicksLimit: 5,
                        padding: 10,
                        // Include a dollar sign in the ticks
                        callback: function(value, index, values) {
                            return '$' + number_format(value);
                        }
                    },
                    gridLines: {
                        color: "rgb(234, 236, 244)",
                        zeroLineColor: "rgb(234, 236, 244)",
                        drawBorder: false,
                        borderDash: [2],
                        zeroLineBorderDash: [2]
                    }
                }],
            },
            legend: {
                display: false
            },
            tooltips: {
                titleMarginBottom: 10,
                titleFontColor: '#6e707e',
                titleFontSize: 14,
                backgroundColor: "rgb(255,255,255)",
                bodyFontColor: "#858796",
                borderColor: '#dddfeb',
                borderWidth: 1,
                xPadding: 15,
                yPadding: 15,
                displayColors: false,
                caretPadding: 10,
                callbacks: {
                    label: function(tooltipItem, chart) {
                        var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                        return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
                    }
                }
            },
        }
    });

    // Mã JavaScript cho biểu đồ cột 2
    var ctx2 = document.getElementById("myBarChart2");
    var myBarChart2 = new Chart(ctx2, {
        type: 'bar',
        data: {
            labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4","Tháng 5","Tháng 6","Tháng 7","Tháng 8","Tháng 9","Tháng 10","Tháng 11","Tháng 12",],
            datasets: [{
                label: "Số đơn hàng ",
                backgroundColor: "#e74a3b",
                hoverBackgroundColor: "#e74a3b",
                borderColor: "#e74a3b",
                data: [0,0,0,0,0,0,0,0,0,0,0,0],
            }],
        },
        options: {
            // Các tùy chọn...
            maintainAspectRatio: false,
            layout: {
                padding: {
                    left: 10,
                    right: 25,
                    top: 25,
                    bottom: 0
                }
            },
            scales: {
                xAxes: [{
                    time: {
                        unit: 'month'
                    },
                    gridLines: {
                        display: false,
                        drawBorder: false
                    },
                    ticks: {
                        maxTicksLimit: 6
                    },
                    maxBarThickness: 25,
                }],
                yAxes: [{
                    ticks: {
                        min: 0,
                        max: 15000,
                        maxTicksLimit: 5,
                        padding: 10,
                        // Include a dollar sign in the ticks
                        callback: function(value, index, values) {
                            return  number_format(value);
                        }
                    },
                    gridLines: {
                        color: "rgb(234, 236, 244)",
                        zeroLineColor: "rgb(234, 236, 244)",
                        drawBorder: false,
                        borderDash: [2],
                        zeroLineBorderDash: [2]
                    }
                }],
            },
            legend: {
                display: false
            },
            tooltips: {
                titleMarginBottom: 10,
                titleFontColor: '#6e707e',
                titleFontSize: 14,
                backgroundColor: "rgb(255,255,255)",
                bodyFontColor: "#858796",
                borderColor: '#dddfeb',
                borderWidth: 1,
                xPadding: 15,
                yPadding: 15,
                displayColors: false,
                caretPadding: 10,
                callbacks: {
                    label: function(tooltipItem, chart) {
                        var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                        return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
                    }
                }
            },
        }
    });
    window.onload = updateBarChart();
    function updateBarChart() {
        <%Gson gson = new Gson();
        String json = gson.toJson(list);%>

        // Dựa vào năm được chọn, cập nhật dữ liệu cho biểu đồ cột
        var listData = JSON.parse("<%= json %>");
        var newData = listData;

        // Update the chart with the parsed data
        myBarChart2.data.datasets[0].data = newData;
        myBarChart2.update();
    }

    function updateYear() {
        var selectedYear = document.getElementById("yearSelect").value;
        document.getElementById("selectedYear").value = selectedYear;
    }
    function updateMonth() {
        var selectedMonth = document.getElementById("monthSelect").value;
        document.getElementById("selectedMonth").value = selectedMonth;
    }
</script>
</body>
</html>