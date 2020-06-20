<%-- 
    Document   : productDetail
    Created on : Dec 8, 2019, 5:38:20 PM
    Author     : quan.vd173320
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.MyUser" %>
<%@page import="java.util.List" %>
<%  
    session.setAttribute("view", "/admin/userDetail");
    MyUser user = (MyUser) session.getAttribute("useritem");
%>
<% String tab = (String) request.getAttribute("tab"); %>
<!DOCTYPE html>
<html lang="en">
<%
    String title = (String) session.getAttribute("title"); 
    if (title == null){
        Integer num = user.getUserID()*9 + user.getUserID()*6 + 1999;
        title = num.toString();
    }
%>
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
                        <div class="col-md-12" style="text-align: left">
                            <p><a href="admin-userList">User list</a> / <% if (user.getName()!=null){ %>
                                        <%=user.getName()%>
                                        <% }else{ %>
                                        <%=user.getUserID()*9 + user.getUserID()*6 + 1999 %>
                                        <% }%></p>
                        </div>
                        <div class="col-md-12">
                            <div class="card strpied-tabled-with-hover">
                                <div class="card-header ">
                                    <h4 class="card-title">
                                        <% if (user.getName()!=null){ %>
                                        <%=user.getName()%>
                                        <% }else{ %>
                                        <%=user.getUserID()*9 + user.getUserID()*6 + 1999 %>
                                        <% }%>
                                    </h4>
                                    <p class="card-category">User information detail</p>
                                    <%  String thongbao = (String) request.getAttribute("thongbao");
                                    if (!thongbao.equals("none")){
                                        %>
                                    <p class="thongbao"><%=thongbao%></p>
                                <% } %>
                                </div>
                                <form action="admin-update" method="get">
                                    <div class="card-body table-full-width table-responsive">
                                        <table class="table table-hover table-striped">
                                            <tr>
                                                <th style="min-width: 150px;">Name</th>
                                                <% if (tab.equals("name")) { %>
                                                    <td><input type="text" id="name" name="name" required=""><td>
                                                    <td style="text-align: right;">
                                                        <input class="opbox" type="submit" value="Update"> 
                                                        <a class="opbox" href="admin-userDetail?id=<%=user.getUserID()%>">Cancel</a>
                                                    </td>
                                                <% }else{ %>
                                                    <% if (user.getName() == null) {%>
                                                        <td style="color: black; font-size: 120%;">-</td>
                                                    <% }else{ %>
                                                        <td style="color: black; font-size: 120%;"><%= user.getName()%></td>        
                                                    <% } %>
                                                    <td></td>
                                                    <td style="text-align: right;"><a class="opbox" href="change?tab=name">Change</a></td>
                                                <% } %>
                                            </tr>
                                            <tr>
                                                <th style="min-width: 150px;">Email</th>
                                                <% if (tab.equals("email")) { %>
                                                    <td><input type="text" id="email" name="email" required=""><td>
                                                    <td style="text-align: right;">
                                                        <input class="opbox" type="submit" value="Update"> 
                                                        <a class="opbox" href="admin-userDetail?id=<%=user.getUserID()%>">Cancel</a>
                                                    </td>
                                                <% } else { %>
                                                    <td style="color: black; font-size: 120%;"><%= user.getEmail()%></td>
                                                    <td></td>
                                                    <td style="text-align: right;"><a class="opbox" href="change?tab=email">Change</a></td>
                                                <% } %>
                                            </tr>
                                            <tr>
                                                <th style="min-width: 150px;">Sex</th>
                                                <%if (tab.equals("sex")) { %>
                                                    <td>
                                                        <input list="sex" name="sex" required="">
                                                        <datalist id="sex">
                                                            <option value="Male">
                                                            <option value="Female">
                                                            <option value="LGBTQ+">
                                                        </datalist>
                                                    <td>
                                                    <td style="text-align: right;">
                                                        <input class="opbox" type="submit" value="Update"> 
                                                        <a class="opbox" href="admin-userDetail?id=<%=user.getUserID()%>">Cancel</a>
                                                    </td>
                                                <% }else { %>
                                                    <% if (user.getSex() == null) {%>
                                                        <td style="color: black; font-size: 120%;">-</td>
                                                    <% }else{ %>
                                                        <td style="color: black; font-size: 120%;"><%= user.getSex()%></td>
                                                    <% } %>
                                                    <td></td>
                                                    <td style="text-align: right;"><a class="opbox" href="change?tab=sex">Change</a></td>
                                                <% } %>
                                            </tr>
                                            <tr>    
                                                <th style="min-width: 150px;">Phone</th>
                                                <% if (tab.equals("phone")){ %>
                                                    <td><input type="text" id="phone" name="phone" required=""><td>
                                                    <td style="text-align: right;">
                                                        <input class="opbox" type="submit" value="Update"> 
                                                        <a class="opbox" href="admin-userDetail?id=<%=user.getUserID()%>">Cancel</a>
                                                    </td>
                                                <% } else { %>
                                                    <% if (user.getPhone() == null) {%>
                                                        <td style="color: black; font-size: 120%;">-</td>
                                                    <% }else{ %>
                                                        <td style="color: black; font-size: 120%;"><%= user.getPhone()%></td>
                                                    <% } %>
                                                    <td></td>
                                                    <td style="text-align: right;"><span><a class="opbox" href="change?tab=phone">Change</a></span></td>
                                                <% } %>
                                            </tr>
                                            <tr>
                                                <th style="min-width: 150px;">Address</th>
                                                <% if (tab.equals("address")) { %>
                                                    <td>
                                                        <input list="address" name="address" required="">
                                                        <datalist id="address">
                                                            <option value="An Giang">
                                                            <option value="Ba Ria - Vung Tau">
                                                            <option value="Bac Giang">
                                                            <option value="Bac Kan">
                                                            <option value="Bac Lieu">
                                                            <option value="Bac Ninh">
                                                            <option value="Ben Tre">
                                                            <option value="Binh Dinh">
                                                            <option value="Dinh Duong">
                                                            <option value="Binh Phuoc">
                                                            <option value="Binh Thuan">
                                                            <option value="Ca Mau">
                                                            <option value="Cao Bang">
                                                            <option value="Dak lak">
                                                            <option value="Dak Nong">
                                                            <option value="Dien Bien">
                                                            <option value="Dong Nai">
                                                            <option value="Dong Thao">
                                                            <option value="Gia Lai">
                                                            <option value="Ha Giang">
                                                            <option value="Ha Nam">
                                                            <option value="Ha Tinh">
                                                            <option value="Hai Duong">
                                                            <option value="Hau Giang">
                                                            <option value="Hoa Binh">
                                                            <option value="Hung Yen">
                                                            <option value="Khanh Hoa">
                                                            <option value="Kien Giang">
                                                            <option value="Kon Tum">
                                                            <option value="Lai Chau">
                                                            <option value="Lam Dong">
                                                            <option value="Lang Son">
                                                            <option value="Lao Cai">
                                                            <option value="Long An">
                                                            <option value="Nam Dinh">
                                                            <option value="Nghe An">
                                                            <option value="Ninh Binh">
                                                            <option value="Ninh Thuan">
                                                            <option value="Phu Tho">
                                                            <option value="Quang Binh">
                                                            <option value="Quang Nam">
                                                            <option value="Quang Ngai">
                                                            <option value="Quang Ninh">
                                                            <option value="Quang Tri">
                                                            <option value="Soc Trang">
                                                            <option value="Son La">
                                                            <option value="Tay Ninh">
                                                            <option value="Thai Binh">
                                                            <option value="Thai Nguyen">
                                                            <option value="Thanh Hoa">
                                                            <option value="Thua Thien - Hue">
                                                            <option value="Tien Giang">
                                                            <option value="Tra Vinh">
                                                            <option value="Tuyen Quang">
                                                            <option value="Vinh Long">
                                                            <option value="Vinh Phuc">
                                                            <option value="Yen Bai">
                                                            <option value="Phu Yen">
                                                            <option value="Da Nang">
                                                            <option value="Can Tho">
                                                            <option value="Ha Noi">
                                                            <option value="Hai Phong">
                                                            <option value="Thanh pho Ho Chi Minh">
                                                        </datalist>
                                                    <td>
                                                    <td style="text-align: right;">
                                                        <input class="opbox" type="submit" value="Update"> 
                                                        <a class="opbox" href="admin-userDetail?id=<%=user.getUserID()%>">Cancel</a>
                                                    </td>
                                                <% }else{ %>
                                                    <% if (user.getAddress()== null) {%>
                                                        <td style="color: black; font-size: 120%;">-</td>
                                                    <% }else{ %>
                                                        <td style="color: black; font-size: 120%;"><%= user.getAddress()%></td>
                                                    <% } %>
                                                    <td></td>
                                                    <td style="text-align: right;"><a class="opbox" href="change?tab=address">Change</a></td>
                                                <% } %>
                                            </tr>
                                        </table>                                         
                                    </div>
                                </form>
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

