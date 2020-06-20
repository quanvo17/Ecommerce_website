<%-- 
    Document   : productDetail
    Created on : Dec 8, 2019, 5:38:20 PM
    Author     : quan.vd173320
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.Category" %>
<%@page import="entity.Product" %>
<%@page import="java.util.List" %>
<%  session.setAttribute("view", "admin/categoryDetail");
    Category cate = (Category) session.getAttribute("Cate");
%>
<% String tab = (String) request.getAttribute("tab");
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
                        <div class="col-md-12" style="text-align: left">
                            <p><a href="admin-categoryList">Category list</a> / <%=cate.getName()%></p>
                        </div>
                        <div class="col-md-12">
                            <div class="card strpied-tabled-with-hover">
                                <div class="card-header ">
                                    <h4 class="card-title"><%=cate.getName()%></h4>
                                    <p class="card-category">Chi tiết danh mục</p>
                                </div>
                                <form action="admin-updatecategory" enctype="multipart/form-data" method="post">
                                    <div class="card-body table-full-width table-responsive">
                                        <table class="table table-hover table-striped">
                                            <% String thongbao = (String) request.getAttribute("thongbao");
                                                if (!thongbao.equals("none")){
                                            %>
                                                <div class="thongbao"><%=thongbao%></div>
                                            <% } %>
                                                <tr>
                                                    <th class="td-label">Name</th>
                                                <% if (tab.equals("name")) { %>
                                                    <td><input type="text" id="name" name="name" required=""><td>
                                                    <td style="text-align: right;">
                                                        <input class="opbox" type="submit" value="Update"> 
                                                        <a class="opbox" href="admin-categoryDetail?id=<%=cate.getCateID()%>">Cancel</a>
                                                    </td>
                                                <% }else{ %>
                                                    <% if (cate.getName() == null) {%>
                                                    <td style="color: black; font-size: 120%;">-</td>
                                                    <% }else{ %>
                                                    <td style="color: black; font-size: 120%;"><%= cate.getName()%></td>        
                                                    <% } %>
                                                    <td></td>
                                                    <td style="text-align: right; min-width: 210px;"><a class="opbox" href="admin-change?tab=name">Change</a></td>
                                                <% } %>         
                                                </tr>
                                                <tr>
                                                    <th class="td-label">Description</th>
                                                <% if (tab.equals("description")) { %>
                                                    <td><input type="text" id="desc" name="desc" required=""><td>
                                                    <td style="text-align: right;">
                                                        <input class="opbox" type="submit" value="Update"> 
                                                        <a class="opbox" href="admin-categoryDetail?id=<%=cate.getCateID()%>">Cancel</a>
                                                    </td>
                                                <% }else{ %>
                                                    <% if (cate.getDescription() == null) {%>
                                                    <td style="color: black; font-size: 120%;">-</td>
                                                    <% }else{ %>
                                                    <td style="color: black; font-size: 120%;"><%= cate.getDescription()%></td>        
                                                    <% } %>
                                                    <td></td>
                                                    <td style="text-align: right; min-width: 210px;"><a class="opbox" href="admin-change?tab=description">Change</a></td>
                                                <% } %>     
                                                </tr>
                                                <tr>
                                                    <th class="td-label">Image</th>
                                                <% if (tab.equals("image")) { %>
                                                    <td><input type="file" id="image" name="image" required=""></td>
                                                    <td></td>
                                                    <td style="text-align: right;">
                                                        <input class="opbox" type="submit" value="Update">
                                                        <a class="opbox" href="admin-categoryDetail?id=<%=cate.getCateID()%>">Cancel</a>
                                                    </td>
                                                <% }else{ %>
                                                    <% if (cate.getDescription() == null) {%>
                                                    <td style="color: black; font-size: 120%;"><img src="none.jpg" data-imagezoom="true" class="img-responsive" style="max-width: 50%" alt=""></td>
                                                    <% }else{ %>
                                                    <td style="color: black; font-size: 120%;"><img src="${initParam.imgProductPath}<%=cate.getImage()%>" data-imagezoom="true" class="img-responsive" style="max-width: 50%;"></td>
                                                    <% } %>
                                                    <td></td>
                                                    <td style="text-align: right; min-width: 210px;"><a class="opbox" href="admin-change?tab=image">Change</a></td>
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
