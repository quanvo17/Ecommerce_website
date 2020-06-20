<%
    session.setAttribute("view", "/index");
%>
    <div class="banner">
        <div class="container">
            <section class="rw-wrapper">
                <h1 class="rw-sentence">
                    <span>Fashion &amp; Beauty</span>
                    <div class="rw-words rw-words-1">
                        <span>&nbspKids</span>
                        <span>&nbspMen</span>
                        <span>&nbspWomen</span>
                        <span>&nbspKids</span>
                        <span>&nbspMen</span>
                        <span>&nbspWomen</span>
                    </div>
                    <div class="rw-words rw-words-2">
                        <span>Cute, Safe and Fashionable</span>
                        <span>Gentle</span>
                        <span>Beauty</span>
                        <span>Cute, Safe and Fashionable</span>
                        <span>Gentle</span>
                        <span>Beauty</span>
                    </div>
                </h1>
            </section>
        </div>
    </div>
    <!--content-->
    <div class="content">
        <div class="container">
            <div class="content-top">
                <div class="col-md-6 col-md">
                    <div class="col-1">
                        <a href="trendy" class="b-link-stroke b-animate-go  thickbox">
                            <img src="images/pi.jpg" class="img-responsive" alt="" />
                            <div class="b-wrapper1 long-img">
                                <p class="b-animate b-from-right b-delay03 ">Fashion</p>
                                <label class="b-animate b-from-right b-delay03 "></label>
                                <h3 class="b-animate b-from-left b-delay03 ">Trendy</h3></div>
                        </a>

                        <!---<a href="single.jsp"><img src="images/pi.jpg" class="img-responsive" alt=""></a>-->
                    </div>
                    <div class="col-2">
                        <span>Hot Deal</span>
                        <h2><a href="#">Luxurious &amp; Trendy</a></h2>
                        <p>We give you the best choice of luxury, formal, polite, style, fashion and long use products</p>
                        <a href="#" class="buy-now">Buy Now</a>
                    </div>
                </div>
                <div class="col-md-6 col-md1">
                    <div class="col-3">
                        <a href="product-list?cate=1"><img src="images/men.jpg" class="img-responsive" alt="">
                            <div class="col-pic">
                                <p>Fashion</p>
                                <label></label>
                                <h5>For Men</h5>
                            </div>
                        </a>
                    </div>    
                    <div class="col-3">
                        <a href="product-list?cate=2"><img src="images/kids.jpg" class="img-responsive" alt="">
                            <div class="col-pic">
                                <p>Fashion</p>
                                <label></label>
                                <h5>For Kids</h5>
                            </div>
                        </a>
                    </div>   
                    <div class="col-3">
                        <a href="product-list?cate=3"><img src="images/women.jpg" class="img-responsive" alt="">
                            <div class="col-pic">
                                <p>Fashion</p>
                                <label></label>
                                <h5>For Women</h5>
                            </div>
                        </a>
                    </div>   
                </div>
                <div class="clearfix"></div>
            </div>
            <!--products-->
            <div class="content-mid">
                <h3>New Arrivals</h3>
                <label class="line"></label>
                <div class="mid-popular">
                    <c:forEach items="${newProducts}" var="prods" begin="0" end="7">
                        <div class="col-md-3 item-grid simpleCart_shelfItem">
                            <div class=" mid-pop">
                                <div class="pro-img">
                                    <img src="${initParam.imgProductPath}${prods.getThumbImage()}" class="img-responsive" alt="">
                                    <div class="zoom-icon ">
                                        <a class="picture" href="${initParam.imgProductPath}${prods.getThumbImage()}" rel="title" class="b-link-stripe b-animate-go  thickbox"><i class="glyphicon glyphicon-search icon "></i></a>
                                        <a href="<c:url value="productDetail?id=${prods.getProdID()}"/>"><i class="glyphicon glyphicon-menu-right icon"></i></a>
                                    </div>
                                </div>
                                <div class="mid-1">
                                    <div class="women">
                                        <div class="women-top">
                                            <span>${prods.getCateID().getName()}</span>
                                            <h6><a href="<c:url value="productDetail?id=${prods.getProdID()}"/>">${prods.getName()}</a></h6>
                                        </div>
                                        <div class="img">
                                            <a href="<c:url value="addToCart?id=${prods.getProdID()}" />"><img src="images/ca.png" alt=""></a>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="mid-2">
                                        <p style="font-size: 120%;">
                                            <label>$${prods.getPrice()}</label><em class="item_price">$${prods.getPrice()}</em>
                                        </p>
                                        <div class="block">
                                            <div class="starbox small ghosting"></div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="clearfix"></div>
                </div> 
                <h3>Best Seller</h3>
                <label class="line"></label>
                <div class="mid-popular">
                    <c:forEach items="${bestSale}" var="bs" begin="0" end="7">
                        <div class="col-md-3 item-grid simpleCart_shelfItem">
                            <div class=" mid-pop">
                                <div class="pro-img">
                                    <img src="${initParam.imgProductPath}${bs.getProduct().getThumbImage()}" class="img-responsive" alt="">
                                    <div class="zoom-icon ">
                                        <a class="picture" href="${initParam.imgProductPath}${bs.getProduct().getThumbImage()}" rel="title" class="b-link-stripe b-animate-go  thickbox"><i class="glyphicon glyphicon-search icon "></i></a>
                                        <a href="<c:url value="productDetail?id=${bs.getProdID()}"/>"><i class="glyphicon glyphicon-menu-right icon"></i></a>
                                    </div>
                                </div>
                                <div class="mid-1">
                                    <div class="women">
                                        <div class="women-top">
                                            <span>${bs.getProduct().getCateID().getName()}</span>
                                            <h6><a href="<c:url value="productDetail?id=${bs.getProdID()}"/>">${bs.getProduct().getName()}</a></h6>
                                        </div>
                                        <div class="img">
                                            <a href="<c:url value="addToCart?id=${bs.getProdID()}" />"><img src="images/ca.png" alt=""></a>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="mid-2">
                                        <p style="font-size: 120%;">
                                            <label>$${bs.getProduct().getPrice()}</label><em class="item_price">$${bs.getProduct().getPrice()}</em>
                                        </p>
                                        <div class="block">
                                            <div class="starbox small ghosting"></div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="clearfix"></div>
                </div> 
            </div>
            <div class="content" style="text-align: center; color: tomato; margin-top: 50px;">
                <p>Hello, We are Team 20 !</p>
            </div>
            <!--//products-->
            <!--brand-->
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
            <!--//brand-->
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