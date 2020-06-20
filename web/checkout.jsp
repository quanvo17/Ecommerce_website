<%-- 
    Document   : checkout
    Created on : Dec 6, 2019, 9:51:38 PM
    Author     : Nguyen Minh Dang
--%>

<%@page import="java.util.List"%>
<%@page import="Model.ShoppingCartItem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% session.setAttribute("view", "/checkout");     %>
<div class="banner-top">
    <div class="container">
        <h1>Check out</h1>
        <em></em>
        <h2><a href="home">Home</a><label>/</label>Check out</h2>
    </div>
</div>

<div class="container" style="margin-top: 50px;">
    <div class="container">
        <% String thongbao = (String) request.getAttribute("thongbao");
           if (thongbao != null) {
        %>
        <div class="thongbao"><%=thongbao%></div>
        <% }else{ %>
            <div class="col-md-4">
                <h3>Confirmation</h3>
                <hr>
                <form action="buy" method="get">
                    <fieldset>
                        <label>Contact Name<span style="color: tomato;">*</span></label>
                        <input type="text" size="40" name="contname" id="contname"  required=""/>
                    </fieldset>
                    <fieldset>
                        <label>Contact Phone<span style="color: tomato;">*</span></label>
                        <input type="text" size="40" name="contphone" id="contphone" required=""/>
                    </fieldset>
                    <fieldset>
                        <label>Ship Address<span style="color: tomato;">*</span></label>
                        <input type="text" size="40" list="shipaddr" name="shipaddr" required="">
                        <datalist id="shipaddr">
                            <option value="An Giang">
                            <option value="Ba Ria - Vung Tau">
                            <option value="Bac Giang">
                            <option value="Bac Kan">
                            <option value="Bac Lieu">
                            <option value="Bac Ninh">
                            <option value="Ben Tre">
                            <option value="Binh Dinh">
                            <option value="Dinh Duong">
                            <option value="Binh Phuoc">
                            <option value="Binh Thuan">
                            <option value="Ca Mau">
                            <option value="Cao Bang">
                            <option value="Dak lak">
                            <option value="Dak Nong">
                            <option value="Dien Bien">
                            <option value="Dong Nai">
                            <option value="Dong Thao">
                            <option value="Gia Lai">
                            <option value="Ha Giang">
                            <option value="Ha Nam">
                            <option value="Ha Tinh">
                            <option value="Hai Duong">
                            <option value="Hau Giang">
                            <option value="Hoa Binh">
                            <option value="Hung Yen">
                            <option value="Khanh Hoa">
                            <option value="Kien Giang">
                            <option value="Kon Tum">
                            <option value="Lai Chau">
                            <option value="Lam Dong">
                            <option value="Lang Son">
                            <option value="Lao Cai">
                            <option value="Long An">
                            <option value="Nam Dinh">
                            <option value="Nghe An">
                            <option value="Ninh Binh">
                            <option value="Ninh Thuan">
                            <option value="Phu Tho">
                            <option value="Quang Binh">
                            <option value="Quang Nam">
                            <option value="Quang Ngai">
                            <option value="Quang Ninh">
                            <option value="Quang Tri">
                            <option value="Soc Trang">
                            <option value="Son La">
                            <option value="Tay Ninh">
                            <option value="Thai Binh">
                            <option value="Thai Nguyen">
                            <option value="Thanh Hoa">
                            <option value="Thua Thien - Hue">
                            <option value="Tien Giang">
                            <option value="Tra Vinh">
                            <option value="Tuyen Quang">
                            <option value="Vinh Long">
                            <option value="Vinh Phuc">
                            <option value="Yen Bai">
                            <option value="Phu Yen">
                            <option value="Da Nang">
                            <option value="Can Tho">
                            <option value="Ha Noi">
                            <option value="Hai Phong">
                            <option value="Thanh pho Ho Chi Minh">
                        </datalist>
                    </fieldset>
                    <input type="submit" value="Buy" style="background-color: silver; border: none; color: black; padding: 5px 10px; text-decoration: none; margin: 10px 10px;"/> 
                    <a href="home" style="background-color: silver; border: none; color: black; padding: 5px 10px; text-decoration: none; margin: 10px 10px;">Back</a>
                </form>
            </div>
            <div class="col-md-8">
                <h3>Order Information</h3>
                <hr>
                <p style="color: mediumseagreen;">Free ship for you</p>
                <table>
                    <tr>
                        <th>Item</th>
                        <th></th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Subtotal</th>
                    </tr>
                    <%  
                        List<ShoppingCartItem> items = cart.getItems();
                        for (ShoppingCartItem item : items) {
                    %>
                    <tr>
                        <td><img src="${initParam.imgProductPath}<%= item.getProd().getThumbImage()%>" alt="" style="height: 75px; width: 75px;"></td>
                        <td><h5><%= item.getProd().getName()%></h5></td>
                        <td>$<%= item.getProd().getPrice()%> / 1 unit</td>
                        <td><%= item.getQuantity()%></td>
                        <td class="item_price">$<%= item.getTotal()%></td>
                    </tr>
                    <% 
                        }
                    %>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>Total</td>
                        <td><%=cart.getSubtotal()%></td>
                    </tr>
                </table>
            </div>
        <%} %>
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
<script src="js/simpleCart.min.js">
</script>
<!-- slide -->
<script src="js/bootstrap.min.js"></script>
