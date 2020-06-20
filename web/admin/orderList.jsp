<%-- 
    Document   : order
    Created on : Dec 7, 2019, 1:55:21 PM
    Author     : quan.vd173320
--%>

<%@page import="entity.MyOrderDetail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.MyOrder" %>
<%@page import="java.util.List" %>
<% 
    session.setAttribute("view", "/admin/orderList"); 
    List<MyOrder> mol = (List<MyOrder>) session.getAttribute("orderList");
    List<MyOrderDetail> modl = (List<MyOrderDetail>) request.getAttribute("orderDetailList");
    String detail = (String) request.getAttribute("detail");
%>
<!DOCTYPE html>
<html lang="en">
<%String title = (String) session.getAttribute("title"); %>
<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="assets/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Admin 20 | <%=title%></title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/light-bootstrap-dashboard.css?v=2.0.0 " rel="stylesheet" />
    <link href="assets/css/demo.css" rel="stylesheet" />
    <link href="css/1.css" rel="stylesheet" />
</head>
<body>
    <div class="wrapper">
        <jsp:include page="sidebar.jsp"/>
        <div class="main-panel">
            <jsp:include page="nav.jsp"/>
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card strpied-tabled-with-hover">
                                <div class="card-header ">
                                    <h4 class="card-title">Order List</h4>
                                    <p class="card-category">Danh sách đặt hàng</p>
                                </div>
                                <div class="card-body table-full-width table-responsive">
                                    <table class="table table-hover table-striped">
                                        <thead>
                                            <th>ID</th>
                                            <th>Contact Name</th>
                                            <th>Contact Phone</th>
                                            <th>Ship Address</th>
                                            <th>Total Money</th>
                                            <th>Date Create</th>
                                            <th>Option</th>
                                        </thead>
                                        <tbody>    
                                            <% 
                                                for (MyOrder order: mol){
                                                    String orderid = (String) order.getOrderID();
                                                    System.out.println(orderid);
                                                    System.out.println(detail);
                                                    if (!orderid.equals(detail)){
                                                    %>
                                                    <tr>
                                                        <td><%=order.getOrderID()%></td>
                                                        <td><%=order.getContactName()%></td>
                                                        <td><%=order.getContactPhone()%></td>
                                                        <td><%=order.getShipAddress()%></td>
                                                        <td><%=order.getTotalMoney()%></td>
                                                        <td><%=order.getDateCreate()%></td>
                                                        <td><a class="opbox" href="admin-orderDetail?id=<%=order.getOrderID()%>">Detail</a></td>
                                                    </tr>
                                                    <%
                                                    }else{
                                                        %>
                                                    <tr>
                                                        <td><%=order.getOrderID()%></td>
                                                        <td><%=order.getContactName()%></td>
                                                        <td><%=order.getContactPhone()%></td>
                                                        <td><%=order.getShipAddress()%></td>
                                                        <td><%=order.getTotalMoney()%></td>
                                                        <td><%=order.getDateCreate()%></td>
                                                        <td><a class="opboxdis" href="admin-orderList">Cancel</a></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                        <td>Index</td>
                                                        <td>Image</td>
                                                        <td>Name</td>
                                                        <td>Unit Price</td>
                                                        <td>Quantity</td>
                                                        <td>Amount</td>
                                                    </tr>
                                                        <%
                                                            int i = 1;
                                                            for (MyOrderDetail od: modl){
                                                                %>
                                                    <tr>
                                                        <td></td>
                                                        <td><%=i%></td>
                                                        <td><img src="${initParam.imgProductPath}<%=od.getProduct().getThumbImage()%>" style="max-width: 20%;" /></td>
                                                        <td><%=od.getProduct().getName()%></td>
                                                        <td><%=od.getUnitPrice()%></td>
                                                        <td><%=od.getQuantity()%></td>
                                                        <td><%=od.getAmount()%></td>
                                                    </tr>
                                                                <%
                                                                    i++;
                                                            }
                                                    }
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="footer.jsp"/>
        </div>
    </div>
</body>
<jsp:include page="script.jsp"/>
</html>
