<%-- 
    Document   : single
    Created on : Oct 9, 2019, 8:56:27 PM
    Author     : Nguyen Minh Dang
--%>

<%@page import="entity.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    session.setAttribute("view", "/productDetail");
    Product pr = (Product) request.getAttribute("prods");
%>
    <div class="banner-top">
        <div class="container">
            <h1><%=pr.getName()%></h1>
            <em></em>
            <h2><a href="home">Home</a><label>/</label>Product detail</h2>
        </div>
    </div>
    <div class="single">
        <div class="container">
            <div class="col-md-9">
                <div class="col-md-5 grid">
                    <div class="flexslider">
                        <ul class="slides">
                            <li data-thumb="${initParam.imgProductPath}<%=pr.getThumbImage()%>">
                                <div class="thumb-image"> <img src="${initParam.imgProductPath}<%=pr.getThumbImage()%>" data-imagezoom="true" class="img-responsive"> </div>
                            </li>
                            <li data-thumb="${initParam.imgProductPath}<%=pr.getProductDetail().getImage1()%>">
                                <div class="thumb-image"> <img src="${initParam.imgProductPath}<%=pr.getProductDetail().getImage1()%>" data-imagezoom="true" class="img-responsive"> </div>
                            </li>
                            <li data-thumb="${initParam.imgProductPath}<%=pr.getProductDetail().getImage2()%>">
                                <div class="thumb-image"> <img src="${initParam.imgProductPath}<%=pr.getProductDetail().getImage2()%>" data-imagezoom="true" class="img-responsive"> </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-7 single-top-in">
                    <div class="span_2_of_a1 simpleCart_shelfItem">
                        <form action="addToCart" method="get">
                            <h3><%=pr.getName()%></h3>
                            <p class="in-para"><%=pr.getProductDetail().getInfo()%></p>
                            <div class="price_single">
                                <span class="reducedfrom item_price">$<%=pr.getPrice()%></span>
                                <div class="clearfix"></div>
                            </div>
                            <div class="quantity">
                                <div class="quantity-select">
                                    <div class="entry value-minus">&nbsp;</div>
                                    <input type="text" class="entry value" id="num" name="num" value="1" required="">
                                    <div class="entry value-plus active">&nbsp;</div>
                                </div>
                            </div>
                            <script>
                                $('.value-plus').on('click', function(){
                                    var divUpd = $(this).closest('.quantity-select').find('input').val().trim(),
                                    newVal = parseInt(divUpd) + 1;
                                    $(this).closest('.quantity-select').find('input').val(newVal);
                                });

                                $('.value-minus').on('click', function(){
                                    var divUpd = $(this).closest('.quantity-select').find('input').val().trim(),
                                    newVal = parseInt(divUpd) - 1;
                                    if (newVal >= 1) $(this).closest('.quantity-select').find('input').val(newVal);
                                });
                            </script>
                            <input type="hidden" id="id" name="id" value="<%=pr.getProdID()%>">
                            <div style="text-align: right; margin-top: 12px;">
                                <input type="submit" class="change" value="Add To Cart">
                            </div>
                            <div class="clearfix"> </div>   
                        </form>
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="col-md-3">
                <h4 class="quick">Product description:</h4>
                <p class="quick_desc"><%=pr.getProductDetail().getDescription()%></p>  
                <div class="facts">
                    <ul>
                        <li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Research</li>
                        <li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Design and Development</li>
                        <li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Porting and Optimization</li>
                        <li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>System integration</li>
                        <li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Verification, Validation and Testing</li>
                        <li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Maintenance and Support</li>
                    </ul>
                </div>
            </div>
        </div>     
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
    </div>

    <script src="js/imagezoom.js"></script>
    <script defer src="js/jquery.flexslider.js"></script>
    <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
    <script>
        // Can also be used with $(document).ready()
        $(window).load(function() {
            $('.flexslider').flexslider({
                animation: "slide",
                controlNav: "thumbnails"
            });
        });
    </script>
    <script src="js/simpleCart.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
