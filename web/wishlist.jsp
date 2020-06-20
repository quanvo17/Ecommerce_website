<%-- 
    Document   : wishlist
    Created on : Oct 9, 2019, 8:56:43 PM
    Author     : Nguyen Minh Dang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%session.setAttribute("view", "wishlist");%>
    <div class="banner-top">
        <div class="container">
            <h1>Wishlist</h1>
            <em></em>
            <h2><a href="home">Home</a><label>/</label>Wishlist</h2>
        </div>
    </div>
    <!--login-->
    <div class="container">
        <div class="wishlist">
            <h6><a href="#">Product Name</a>	<a href="#">Unit Price</a>	<a href="#">Stock Status</a></h6>
            <p>No products were added to the wishlist</p>
        </div>
    </div>
    <!--//login-->
    <!--brand-->
    <div class="container">
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
    <script src="js/simpleCart.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
