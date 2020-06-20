<%-- 
    Document   : profile
    Created on : Dec 5, 2019, 3:32:25 PM
    Author     : Nguyen Minh Dang
--%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="entity.MyOrderDetail"%>
<%@page import="entity.MyOrder"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    session.setAttribute("view", "/profile"); 
    String detail = (String) request.getAttribute("detail");
    List<MyOrder> ol = (List<MyOrder>) session.getAttribute("orderList");
    List<MyOrderDetail> modl = (List<MyOrderDetail>) request.getAttribute("orderDetailList");
%>
<% String tab = (String) request.getAttribute("tab");
%>
    <div class="banner-top">
        <div class="container">
            <h1>Profile</h1>
            <em></em>
            <h2><a href="home">Home</a><label>/</label>Profile</h2>
        </div>
    </div>
    <div style="margin-top: 50px;">
        <div class="container" style="margin-left: auto; margin-right: auto;">
            <h3 style="color: tomato; font-size: 200%;">Information</h3>
            <hr style="border: 3px solid #2E2E2E;">
            <% String thongbao = (String) request.getAttribute("thongbao");
                if (!thongbao.equals("none")){
            %>
            <div class="thongbao"><%=thongbao%></div>
            <% } %>
            <form action="update" method="get">
                <table align="center">
                    <tr>
                        <th>Name</th>
                        <% if (tab.equals("name")) { %>
                            <td><input type="text" id="name" name="name" required=""><td>
                            <td style="text-align: right;"><input class="update" type="submit" value="Update"> <a class="update" href="profile" style="color: white">Cancel</a></td>
                        <% }else{ %>
                            <% if (user.getName() == null) {%>
                                <td style="color: black; font-size: 120%;">-</td>
                            <% }else{ %>
                                <td style="color: black; font-size: 120%;"><%= user.getName()%></td>        
                            <% } %>
                            <td>&nbsp;</td>
                            <td style="text-align: right;"><a class="update" style="color: white" href="change?tab=name">Change</a></td>
                        <% } %>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <% if (tab.equals("email")) { %>
                            <td><input type="text" id="email" name="email" required=""><td>
                            <td style="text-align: right;"><input class="update" type="submit" value="Update"> <a class="update" href="profile" style="color: white">Cancel</a></td>
                        <% } else { %>
                            <td style="color: black; font-size: 120%;"><%= user.getEmail()%></td>
                            <td>&nbsp;</td>
                            <td style="text-align: right;"><a class="update" style="color: white" href="change?tab=email">Change</a></td>
                        <% } %>
                    </tr>
                    <tr>
                        <th>Sex</th>
                        <%if (tab.equals("sex")) { %>
                            <td>
                                <input list="sex" name="sex" required="">
                                <datalist id="sex">
                                    <option value="Male">
                                    <option value="Female">
                                    <option value="LGBTQ+">
                                </datalist>
                            <td>
                            <td style="text-align: right;"><input class="update" type="submit" value="Update"> <a class="update" href="profile" style="color: white">Cancel</a></td>
                        <% }else { %>
                            <% if (user.getSex() == null) {%>
                                <td style="color: black; font-size: 120%;">-</td>
                            <% }else{ %>
                                <td style="color: black; font-size: 120%;"><%= user.getSex()%></td>
                            <% } %>
                            <td>&nbsp;</td>
                            <td style="text-align: right;"><a class="update" style="color: white" href="change?tab=sex">Change</a></td>
                        <% } %>
                    </tr>
                    <tr>    
                        <th>Phone</th>
                        <% if (tab.equals("phone")){ %>
                            <td><input type="text" id="phone" name="phone" required=""><td>
                            <td style="text-align: right;"><input class="update" type="submit" value="Update"> <a class="update" href="profile" style="color: white">Cancel</a></td>
                        <% } else { %>
                            <% if (user.getPhone() == null) {%>
                                <td style="color: black; font-size: 120%;">-</td>
                            <% }else{ %>
                                <td style="color: black; font-size: 120%;"><%= user.getPhone()%></td>
                            <% } %>
                            <td>&nbsp;</td>
                            <td style="text-align: right;"><a class="update" style="color: white"" href="change?tab=phone">Change</a></td>
                        <% } %>
                    </tr>
                    <tr>
                        <th>Address</th>
                        <% if (tab.equals("address")) { %>
                            <td>
                                <input list="address" name="address" required="">
                                <datalist id="address">
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
                            <td>
                            <td style="text-align: right;"><input class="update" type="submit" value="Update"> <a class="update" href="profile" style="color: white">Cancel</a></td>
                        <% }else{ %>
                            <% if (user.getAddress()== null) {%>
                                <td style="color: black; font-size: 120%;">-</td>
                            <% }else{ %>
                                <td style="color: black; font-size: 120%;"><%= user.getAddress()%></td>
                            <% } %>
                            <td>&nbsp;</td>
                            <td style="text-align: right;"><a class="update" style="color: white" href="change?tab=address">Change</a></td>
                        <% } %>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <div style="margin-top: 50px;">
        <div class="container">
            <h3 style="color: tomato; font-size: 200%">Order history</h3>
            <hr style="border: 3px solid #2E2E2E;">  
            <table>
                <tr>
                    <th>Index</th>
                    <th>Contact Name</th>
                    <th>Contact Phone</th>
                    <th>Ship Address</th>
                    <th>Total Money</th>
                    <th>Date Create</th>
                    <th>Option</th>
                </tr>
                <% 
                    int j = 1;
                    for (MyOrder order: ol){
                        String orderid = (String) order.getOrderID();
                        System.out.println(orderid);
                        System.out.println(detail);
                        if (!orderid.equals(detail)){
                        %>
                        <tr>
                            <td style="color: black;"><%=j%></td>
                            <td style="color: black;"><%=order.getContactName()%></td>
                            <td style="color: black;"><%=order.getContactPhone()%></td>
                            <td style="color: black;"><%=order.getShipAddress()%></td>
                            <td style="color: black;"><%=order.getTotalMoney()%></td>
                            <td style="color: black;"><%=order.getDateCreate()%></td>
                            <td><a class="update" style="color: white;" href="orderDetail?id=<%=order.getOrderID()%>">Detail</a></td>
                        </tr>
                        <%
                        }else{
                            %>
                        <tr>
                            <td style="color: black;"><%=j%></td>
                            <td style="color: black;"><%=order.getContactName()%></td>
                            <td style="color: black;"><%=order.getContactPhone()%></td>
                            <td style="color: black;"><%=order.getShipAddress()%></td>
                            <td style="color: black;"><%=order.getTotalMoney()%></td>
                            <td style="color: black;"><%=order.getDateCreate()%></td>
                            <td><a class="update" style="color: white" href="profile">Cancel</a></td>
                        </tr>
                        <tr>
                            <td style="color: black;"></td>
                            <td style="color: black;">Index</td>
                            <td style="color: black;">Image</td>
                            <td style="color: black;">Name</td>
                            <td style="color: black;">Unit Price</td>
                            <td style="color: black;">Quantity</td>
                            <td style="color: black;">Amount</td>
                        </tr>
                            <%
                                int i = 1;
                                for (MyOrderDetail od: modl){
                                    %>
                        <tr>
                            <td style="color: black; font-size: 90%;"></td>
                            <td style="color: black; font-size: 90%;"><%=i%></td>
                            <td style="color: black; font-size: 90%;"><img src="${initParam.imgProductPath}<%=od.getProduct().getThumbImage()%>" style="max-width: 20%;" /></td>
                            <td style="color: black; font-size: 90%;"><%=od.getProduct().getName()%></td>
                            <td style="color: black; font-size: 90%;"><%=od.getUnitPrice()%></td>
                            <td style="color: black; font-size: 90%;"><%=od.getQuantity()%></td>
                            <td style="color: black; font-size: 90%;"><%=od.getAmount()%></td>
                        </tr>
                                    <%
                                        i++;
                                }
                        }
                        j++;
                    }
                %>
            </table>
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