<%-- 
    Document   : product
    Created on : Dec 7, 2019, 1:54:47 PM
    Author     : quan.vd173320
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.Category" %>
<%@page import="entity.Product" %>
<%@page import="java.util.List" %>
<%  session.setAttribute("view", "/admin/productList"); 
    List<Category> cl = (List<Category>) session.getAttribute("catelist");
    List<Product> pl = (List<Product>) session.getAttribute("productList");
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
    <link href="assets/css/demo.css" rel="stylesheet"/>
    <link href="css/1.css" rel="stylesheet"/>
</head>
<body>
<div class="wrapper">
    <jsp:include page="sidebar.jsp"/>
    <div class="main-panel">
        <jsp:include page="nav.jsp"/>
        <div class="content">
            <div class="container-fluid">
                <form action="admin-addproduct" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-md-12">
                                <h4 class="card-title">Add Product Form</h4>
                                <p class="card-category">Fill the form</p>
                            <div class="card strpied-tabled-with-hover">
                                <table class="table table-hover table-striped" border="1">
                                    <tr>
                                        <th style="min-width: 264px;">Product Name <span style="color: tomato;">*</span></th>
                                        <td style="min-width: 100%;"><input type="text" id="name" name="name" placeholder="Product Name" style="min-width: 100%;" required=""></td>
                                    </tr>
                                    <tr>
                                        <th style="min-width: 264px;">Category <span style="color: tomato;">*</span></th>
                                        <td style="min-width: 100%;">
                                            <input list="cate" name="cate"  placeholder="Category" style="min-width: 100%;" required="">
                                            <datalist id="cate">
                                                <% for (Category clunit: cl){ %>
                                                <option value="<%=clunit.getName()%>">
                                                <%} %>
                                            </datalist>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="min-width: 264px;">Unit Price <span style="color: tomato;">*</span></th>
                                        <td style="min-width: 100%;"><input type="text" id="price" name="price"  placeholder="Unit Price" style="min-width: 100%;" required=""></td>
                                    </tr>
                                    <tr>
                                        <th style="min-width: 264px;">Info</th>
                                        <td style="min-width: 100%;"><input type="text" id="info" name="info"  placeholder="Information" style="min-width: 100%;"></td>
                                    </tr>
                                    <tr>
                                        <th style="min-width: 264px;">Description</th>
                                        <td style="min-width: 100%;"><input type="text" id="desc" name="desc"  placeholder="Description" style="min-width: 100%;"></td>
                                    </tr>
                                    <tr>
                                        <th style="min-width: 264px;">Thumbnail Image <span style="color: tomato;">*</span></th>
                                        <td style="min-width: 100%;"><input type="file" placeholder="Thumbnail Image" id="thumbImage" name="thumbImage" style="min-width: 100%;" required=""></td>
                                    </tr>
                                    <tr>
                                        <th style="min-width: 264px;">Image 1</th>
                                        <td style="min-width: 100%;"><input type="file" placeholder="Image 1" id="image1" name="image1" style="min-width: 100%;"></td>
                                    </tr>
                                    <tr>
                                        <th style="min-width: 264px;">Image 2</th>
                                        <td style="min-width: 100%;"><input type="file" placeholder="Image 2" id="image2" name="image2" style="min-width: 100%;"></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12" style="text-align: right;">
                            <input type="submit" class="opboxadd" style="color:white;" value="Add new product"> 
                        </div>
                    </div>
                </form>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card strpied-tabled-with-hover">
                            <div class="card-header ">
                                <h4 class="card-title">Product List</h4>
                                <p class="card-category">Danh sách sản phẩm</p>
                            </div>
                            <div class="card-body table-full-width table-responsive">
                                <table class="table table-hover table-striped">
                                    <tr>
                                        <th>ID</th>
                                        <th style="min-width: 264px;">Name</th>
                                        <th style="min-width: 150px;">Category</th>
                                        <th style="min-width: 150px;">Price</th>
                                        <th>Thumbnail Image</th>
                                        <th>Status</th>
                                        <th>Option</th>
                                    </tr>
                                    <% for (Product prods: pl){ %>
                                        <tr>
                                            <td><%=prods.getProdID()%></td>
                                            <td><%=prods.getName()%></td>
                                            <td><%=prods.getCateID().getName()%></td>
                                            <td><%=prods.getPrice()%></td>
                                            <td><div class="anh-sp" style="width: 80%;"><img src="${initParam.imgProductPath}<%=prods.getThumbImage()%>" class="img-responsive" style="width:80%;" alt=" " ></div></td>
                                            <td><%=prods.getStatus()%></td>
                                            <td>
                                                <a class="opbox" href="admin-productDetail?id=<%=prods.getProdID()%>">Detail</a>
                                                <% if (prods.getStatus()) { %>
                                                <a class="opboxdis"  href="admin-disableproduct?id=<%=prods.getProdID()%>">Disable</a>
                                                <% }else{ %>
                                                <a class="opboxen"  href="admin-enableproduct?id=<%=prods.getProdID()%>">Enable</a>
                                                <% } %>
                                            </td>
                                        </tr>
                                    <% } %>
                                </table>
                                <table class="table-number-page">
                                    <tr>
                                        <c:if test="${currentPage != 1}">
                                            <td>
                                                <a style="color: black;" href="admin-productList?page=${currentPage - 1}">Prev</a>
                                            </td>
                                        </c:if>
                                        <c:forEach begin="1" end="${noOfPages}" var="i">
                                            <c:choose>
                                                <c:when test="${currentPage eq i}">
                                                    <td style="color: red; text-decoration: underline;">${i}</td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td>
                                                        <a style="color: black;" href="admin-productList?page=${i}">${i}</a>
                                                    </td>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <c:if test="${currentPage lt noOfPages}">
                                            <td>
                                                <a style="color: black;" href="admin-productList?page=${currentPage + 1}">Next</a>
                                            </td>
                                        </c:if>
                                    </tr>
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
