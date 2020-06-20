<%-- 
    Document   : product
    Created on : Dec 7, 2019, 1:54:47 PM
    Author     : quan.vd173320
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.MyUser" %>
<%@page import="java.util.List" %>
<%  session.setAttribute("view", "/admin/userList"); 
    request.setAttribute("title", "User List");
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
    <link href="css/1.css" rel="stylesheet"/>
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
                                    <h4 class="card-title">User List</h4>
                                    <p class="card-category">List of user's information</p>
                                </div>
                                <% String thongbao = (String) request.getAttribute("thongbao");
                                    if (!thongbao.equals("none")){ %>
                                    <div class="thongbao"><%=thongbao%></div>
                                    <% }%>
                                <div class="card-body table-full-width table-responsive">
                                    <table class="table table-hover table-striped">
                                        <tr>
                                            <th>ID</th>
                                            <th>Email</th>
                                            <th>Username</th>
                                            <th>Password</th>
                                            <th>Name</th>
                                            <th>Phone</th>
                                            <th>Role</th>
                                            <th style="text-align: center;">Option</th>
                                        </tr>
                                        <c:forEach items="${userList}" var="users">
                                            <tr>
                                                <th>${users.getUserID()}</th>
                                                <th>${users.getEmail()}</th>
                                                <th>${users.getUsername()}</th>
                                                <th>${users.getPassword()}</th>
                                                <th>${users.getName()}</th>
                                                <th>${users.getPhone()}</th>
                                                <th>${users.getRoleID().getName()}</th>
                                                <th style="min-width: 210px;">
                                                    <a class="opbox" href="<c:url value="admin-userDetail?id=${users.getUserID()}"/>">Detail</a> 
                                                    <a class="opbox" href="admin-removeuser?id=${users.getUserID()}">Remove</a>
                                                </th>
                                            </tr>
                                        </c:forEach>
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