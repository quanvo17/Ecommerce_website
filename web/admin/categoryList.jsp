<%-- 
    Document   : category
    Created on : Dec 7, 2019, 1:55:31 PM
    Author     : quan.vd173320
--%>
<!DOCTYPE html>
<html lang="en">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.Category" %>
<%@page import="java.util.List" %>
<%  
    session.setAttribute("view", "/admin/categoryList");
%>
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
                                    <h4 class="card-title">Category List</h4>
                                    <p class="card-category">Danh sách các danh mục</p>
                                </div>
                                <div class="card-body table-full-width table-responsive">
                                    <table class="table table-hover table-striped">
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Description</th>
                                            <th>Image</th>
                                            <th>Amount of product</th>
                                            <th>Status</th>
                                            <th style="text-align: center;">Option</th>
                                        </tr>                                        
                                        <%  List<Category> l = (List<Category>) session.getAttribute("categoryList");
                                            for (Category cate: l){ %>
                                            <tr>
                                                <th><%=cate.getCateID()%></th>
                                                <th style="min-width: 264px;"><%=cate.getName()%></th>
                                                <th style="min-width: 264px;"><%=cate.getDescription()%></th>
                                                <th><img src="${initParam.imgProductPath}<%=cate.getImage()%>" class="img-responsive" style="width:80%;" alt=" " ></th>
                                                <th style="min-width: 100px;"><%=cate.getProductCollection().size()%></th>
                                                <th><%=cate.getStatus()%></th>
                                                <th style="min-width: 210px;">
                                                    <a class="opbox" href="admin-categoryDetail?id=<%=cate.getCateID()%>">Detail</a>
                                                    <% if (cate.getStatus()) { %>
                                                    <a class="opboxdis"  href="admin-disablecategory?id=<%=cate.getCateID()%>">Disable</a>
                                                    <%} else {%>
                                                    <a class="opboxen"  href="admin-enablecategory?id=<%=cate.getCateID()%>">Enable</a>
                                                    <% } %>
                                                </th>
                                            </tr>
                                        <% } %>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <% 
                            String thongbao = (String) request.getAttribute("thongbao");
                            if (!thongbao.equals("none")){ %>
                            <div class="thongbao"><%=thongbao%></div>
                            <% } %>
                            <form action="admin-addcategory" method="post" enctype="multipart/form-data" style="min-width: 100%;">
                            <div class="col-md-12">
                                <div class="card strpied-tabled-with-hover">
                                    <table class="table table-hover table-striped">
                                        <tr>
                                            <td>Name</td>
                                            <td>Description</td>
                                            <td>Image</td>
                                        </tr>
                                        <tr>
                                            <td><input type="text" id="name" name="name" style="min-width: 100%;" placeholder="Name" required=""></td>
                                            <td><input type="text" id="desc" name="desc" style="min-width: 100%;" placeholder="Description"></td>
                                            <td><input type="file" id="imag" name="imag" style="min-width: 100%;"></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div class="col-md-12" style="margin-left: 10px; text-align: right;">
                                <input class="opboxadd" type="submit" value="Add new category">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <jsp:include page="footer.jsp"/>
        </div>
    </div>
</body>
<jsp:include page="script.jsp"/>
</html>