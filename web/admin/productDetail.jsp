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
<%  session.setAttribute("view", "admin/productDetail");
    Product pr = (Product) session.getAttribute("prods");
    List<Category> cl = (List<Category>) session.getAttribute("catelist");
%>
<% String tab = (String) request.getAttribute("tab");
%>
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
                    <div>
                        <p><a href="admin-productList">Product list</a> / <%=pr.getName()%></p>
                    </div>
                    <div class="col-md-12">
                        <div class="card strpied-tabled-with-hover">
                            <div class="card-header ">
                                <h4 class="card-title"><%=pr.getName()%></h4>
                                <p class="card-category">Product detail</p>
                            </div>
                        <form action="admin-updateproduct" enctype="multipart/form-data"  method="post">
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
                                        <td><input type="text" id="name" name="name" required=""></td>
                                        <td style=" min-width: 210px;">
                                            <input class="opbox" type="submit" value="Update"> 
                                            <a class="opboxdis" href="<c:url value="admin-productDetail?id=${prods.getProdID()}"/>">Cancel</a>
                                        </td>
                                        <% }else{ %>
                                        <td style="color: black; font-size: 120%;"><%= pr.getName()%></td>        
                                        <td style=" min-width: 210px;"><a class="opbox" href="admin-change?tab=name">Change</a></td>
                                        <% } %>         
                                    </tr>
                                    <tr>
                                        <th class="td-label">Info</th>
                                        <% if (tab.equals("info")) { %>
                                        <td><input type="text" id="info" name="info" required=""></td>
                                        <td style=" min-width: 210px;">
                                            <input class="opbox" type="submit" value="Update"> 
                                            <a class="opboxdis" href="<c:url value="admin-productDetail?id=${prods.getProdID()}"/>">Cancel</a>
                                        </td>
                                        <% }else{ %>
                                        <td style="color: black; font-size: 120%;"><%= pr.getProductDetail().getInfo() %></td>        
                                        <td style=" min-width: 210px;"><a class="opbox" href="admin-change?tab=info">Change</a></td>
                                        <% } %>
                                    </tr>
                                    <tr>
                                        <th class="td-label">Description</th>
                                        <% if (tab.equals("description")) { %>
                                        <td><input type="text" id="description" name="description" required=""></td>
                                        <td style=" min-width: 210px;">
                                            <input class="opbox" type="submit" value="Update"> 
                                            <a class="opboxdis" href="<c:url value="admin-productDetail?id=${prods.getProdID()}"/>">Cancel</a>
                                        </td>
                                        <% }else{ %>
                                        <td style="color: black; font-size: 120%;"><%= pr.getProductDetail().getDescription()%></td>        
                                        <td style=" min-width: 210px;"><a class="opbox" href="admin-change?tab=description">Change</a></td>
                                    <% } %>
                                    </tr>
                                    <tr>
                                        <th class="td-label">Category</th>
                                        <% if (tab.equals("category")) { %>
                                        <td>
                                            <input list="category" name="category" required="">
                                            <datalist id="category">
                                                <% 
                                                 for (Category clunit: cl){
                                                    %>
                                                    <option value="<%=clunit.getName()%>">
                                                    <% } %>
                                            </datalist>
                                        </td>
                                        <td style=" min-width: 210px;">
                                            <input class="opbox" type="submit" value="Update"> 
                                            <a class="opboxdis" href="<c:url value="admin-productDetail?id=${prods.getProdID()}"/>">Cancel</a>
                                        </td>
                                        <% }else{ %>
                                        <td style="color: black; font-size: 120%;"><%= pr.getCateID().getName()%></td>    
                                        <td style=" min-width: 210px;"><a class="opbox" href="admin-change?tab=category">Change</a></td>
                                        <% } %>
                                    </tr>
                                    <tr>
                                        <th class="td-label">Unit Price</th>
                                        <% if (tab.equals("price")) { %>
                                        <td><input type="text" id="price" name="price" required=""></td>
                                        <td style="">
                                            <input class="opbox" type="submit" value="Update"> 
                                            <a class="opboxdis" href="<c:url value="admin-productDetail?id=${prods.getProdID()}"/>">Cancel</a>
                                        </td>
                                        <% }else{ %>
                                        <td style="color: black; font-size: 120%;"><%= pr.getPrice()%></td>    
                                        <td style=" min-width: 210px;"><a class="opbox" href="admin-change?tab=price">Change</a></td>
                                        <% } %>
                                    </tr>
                                    <tr>
                                        <th class="td-label">Thumbnail Image</th>
                                        <% if (tab.equals("thumbImage")) {%>
                                        <td><input type="file" id="thumbImage" name="thumbImage" required=""></td>
                                        <td style=" min-width: 210px;">
                                            <input class="opbox" type="submit" value="Update">
                                            <a class="opboxdis" href="admin-productDetail?id=${prods.getProdID()}">Cancel</a>
                                        </td>
                                        <% }else{%>
                                        <td>
                                            <img src="${initParam.imgProductPath}<%=pr.getThumbImage()%>" data-imagezoom="true" class="img-responsive" style="max-width: 20%;"> 
                                        </td>   
                                        <td style=" min-width: 210px;"><a class="opbox" href="admin-change?tab=thumbImage">Change</a></td>
                                        <% } %>
                                    </tr>
                                    <tr>
                                        <th class="td-label">Image 1</th>
                                        <% if (tab.equals("image1")) {%>
                                        <td><input type="file" id="image1" name="image1" required=""></td>
                                        <td style=" min-width: 210px;">
                                            <input class="opbox" type="submit" value="Update">
                                            <a class="opboxdis" href="admin-productDetail?id=${prods.getProdID()}">Cancel</a>
                                        </td>
                                        <% }else{%>
                                        <td>
                                            <img src="${initParam.imgProductPath}<%=pr.getProductDetail().getImage1()%>" data-imagezoom="true" class="img-responsive" style="max-width: 20%;"> 
                                        </td>   
                                        <td style=" min-width: 210px;"><a class="opbox" href="admin-change?tab=image1">Change</a></td>
                                        <% } %>
                                    </tr>
                                    <tr>
                                        <th class="td-label">Image 2</th>
                                        <% if (tab.equals("image2")) {%>
                                        <td><input type="file" id="image2" name="image2" required=""></td>
                                        <td style=" min-width: 210px;">
                                            <input class="opbox" type="submit" value="Update">
                                            <a class="opboxdis" href="admin-productDetail?id=${prods.getProdID()}">Cancel</a>
                                        </td>
                                        <% }else{%>
                                        <td>
                                            <img src="${initParam.imgProductPath}<%=pr.getProductDetail().getImage2()%>" data-imagezoom="true" class="img-responsive" style="max-width: 20%;"> 
                                        </td>   
                                        <td style=" min-width: 210px;"><a class="opbox" href="admin-change?tab=image2">Change</a></td>
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


