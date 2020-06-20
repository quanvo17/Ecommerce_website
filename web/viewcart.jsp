<%-- 
    Document   : checkout
    Created on : Oct 9, 2019, 8:55:21 PM
    Author     : Nguyen Minh Dang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="entity.Product"%>
<%@page import="Model.ShoppingCart"%>
<%@page import="Model.ShoppingCartItem"%>

<%    
    session.setAttribute("view", "/viewcart");
%>
    <div class="banner-top">
        <div class="container">
            <h1>Your Cart</h1>
            <em></em>
            <h2><a href="home">Home</a><label>/</label>View Cart</h2>
        </div>
    </div>
    <!--login-->
    <script>
        $(document).ready(function(c) {
            $('.close1').on('click', function(c) {
                $('.cart-header').fadeOut('slow', function(c) {
                    $('.cart-header').remove();
                });
            });
        });
    </script>
    <script>
        $(document).ready(function(c) {
            $('.close2').on('click', function(c) {
                $('.cart-header1').fadeOut('slow', function(c) {
                    $('.cart-header1').remove();
                });
            });
        });
    </script>
    <script>
        $(document).ready(function(c) {
            $('.close3').on('click', function(c) {
                $('.cart-header2').fadeOut('slow', function(c) {
                    $('.cart-header2').remove();
                });
            });
        });
    </script>
    <div class="check-out">
        <div class="container">
            <% 
                String thongbao = (String) request.getAttribute("thongbao");
                if (thongbao != null) {
            %>
            <div class="thongbao"><%=thongbao%></div>
            <% } %>
            <div class="bs-example4" data-example-id="simple-responsive-table">
                <div class="table-responsive" style="text-decoration: black;">
                    <table class="table-heading simpleCart_shelfItem">
                        <tr>
                            <th class="table-grid">Item</th>
                            <th>Prices</th>
                            <th>Quantity</th>
                            <th>Subtotal</th>
                        </tr>
                        <%
                            if (cart != null) {
                                List<ShoppingCartItem> items = cart.getItems();
                                for (ShoppingCartItem item : items) {
                        %>
                        <tr class="cart-header">
                            <td class="ring-in">
                                <a href="productDetail?id=<%= item.getProd().getProdID()%>" class="at-in"><img src="${initParam.imgProductPath}<%= item.getProd().getThumbImage()%>" class="img-responsive" alt=""></a>
                                <div class="sed">
                                    <h5><a href="productDetail?id=<%= item.getProd().getProdID()%>"><%= item.getProd().getName()%></h5>
                                    <p><%= item.getProd().getProductDetail().getInfo()%></p>
                                </div>
                                <div class="clearfix"> </div>
                            </td>
                            <td>$<%= item.getProd().getPrice()%> / 1 unit</td>
                            <td><%= item.getQuantity()%></td>
                            <td class="item_price">$<%= item.getTotal()%></td>
                            <td class="add-check"><a class="item_add hvr-skew-backward" href="remove?id=<%= item.getProd().getProdID()%>">Remove</a></td>
                        </tr>      
                        <%
                                }
                            }
                        %>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>$<%= cart.getSubtotal()%></td>
                            <td></td>
                        </tr>
                    </table>
                </div>
            </div>
            <% if (cart.getNumberOfItems() != 0) {%>
            <div class="produced">
                <a href="checkout" class="hvr-skew-backward">Produced To Buy</a>
            </div>
            <% } else {%>
            <p>Oh! Your cart is empty.</p>
            <div class="produced">
                <a href="productList" class="hvr-skew-backward">Let's shopping!</a>
            </div>
            <% } %>
        </div>
    </div>
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
