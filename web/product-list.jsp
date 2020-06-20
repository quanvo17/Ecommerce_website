<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.Category" %>
<%@page import="entity.Product" %>
<%@page import="java.util.List" %>
        <% 
            session.setAttribute("view", "/product-list");
            Category pl = (Category) request.getAttribute("cate");
            List<Product> prl = (List<Product>) request.getAttribute("productListByCate");
        %> 
        <div class="banner-top">
        <div class="container">
            <h1><%= pl.getName()%></h1>
            <em></em>
            <h2><a href="home">Home</a><label>/</label><%= pl.getName()%></h2>
        </div>
    </div>
        <div class="content">
            <div class="container">
                <div class="content-mid">                       
                    <div class="mid-popular">
                        <% for (Product prunit: prl) {%>
                        <div class="col-md-3 item-grid simpleCart_shelfItem">
                            <div class=" mid-pop">
                                <div class="pro-img">
                                    <img src="${initParam.imgProductPath}<%=prunit.getThumbImage()%>" class="img-responsive" alt="" >
                                    <div class="zoom-icon ">
                                        <a class="picture" href="${initParam.imgProductPath}<%=prunit.getThumbImage()%>" rel="title" class="b-link-stripe b-animate-go  thickbox"><i class="glyphicon glyphicon-search icon "></i></a>
                                        <a href="productDetail?id=<%=prunit.getProdID()%>"><i class="glyphicon glyphicon-menu-right icon"></i></a>
                                    </div>
                                </div>
                                <div class="mid-1">
                                    <div class="women">
                                        <div class="women-top">
                                            <span>${prod.getCateID().getName()}</span>
                                            <h6><a href="productDetail?id=<%=prunit.getProdID()%>"><%=prunit.getName()%></a></h6>
                                        </div>
                                        <div class="img">
                                            <a href="addToCart?id=<%=prunit.getProdID()%>"><img src="images/ca.png" alt=""></a>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="mid-2">
                                        <p style="font-size: 120%;">
                                            <label>$<%=prunit.getPrice()%></label><em class="item_price">$<%=prunit.getPrice()%></em>
                                        </p>
                                        <div class="block">
                                            <div class="starbox small ghosting"></div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% } %>
                    </div>                  
                    <div class="clearfix"></div>
                </div>
                
                <div class="brand">
                    <div class="col-md-3 brand-grid">
                        <img src="images/ic.png" class="img-responsive" alt="">
                    </div>
                    <div class="col-md-3 brand-grid">
                        <img src="images/ic1.png" class="img-responsive" alt="">
                    </div>
                    <div class="col-md-3 brand-grid">
                        <img src="images/ic2.png" class="img-responsive" alt="">
                    </div>
                    <div class="col-md-3 brand-grid">
                        <img src="images/ic3.png" class="img-responsive" alt="">
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <script src="js/simpleCart.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.chocolat.js"></script>
        <link rel="stylesheet" href="css/chocolat.css" type="text/css" media="screen" charset="utf-8">
        <script type="text/javascript" charset="utf-8">
            $(function() {
                $('a.picture').Chocolat();
            });
        </script>