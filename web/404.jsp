<%-- 
    Document   : 404
    Created on : Oct 9, 2019, 8:55:13 PM
    Author     : Nguyen Minh Dang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% session.setAttribute("view", "/404");     %>
    <div class="banner-top">
        <div class="container">
            <h1>404</h1>
            <em></em>
            <h2><a href="home">Home</a><label>/</label>404</h2>
        </div>
    </div>
    <!--login-->
    <div class="container">
        <div class="four">
            <h3>404</h3>
            <%  String error = (String) request.getAttribute("error");
                if(!error.equals("none")){ %>
                <h4 class="error"><%=error%></h4>
            <% } else {%>
            <p>Sorry! Evidently the document you were looking for has either been moved or no longer exist.</p>
            <% }%>
            <a href="home" class="hvr-skew-backward">Back To Home</a>
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
    <script src="js/simpleCart.min.js">
    </script>
    <!-- slide -->
    <script src="js/bootstrap.min.js"></script>
