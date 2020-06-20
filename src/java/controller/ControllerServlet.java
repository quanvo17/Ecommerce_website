/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Model.ShoppingCart;
import Model.ShoppingCartItem;
import entity.*;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import session_bean.*;

/**
 *
 * @author Nguyen Minh Dang
 */
@WebServlet(name = "ControllerServlet", urlPatterns = {"/ControllerServlet", 
                                                       "/home",
                                                       "/productList", 
                                                       "/productDetail",
                                                       "/product-list",
                                                       "/addToCart",
                                                       "/viewcart",
                                                       "/remove",
                                                       "/emptycart",
                                                       "/login",
                                                       "/register",
                                                       "/logout",
                                                       "/profile",
                                                       "/buy",
                                                       "/checkout",
                                                       "/change",
                                                       "/update",
                                                       "/trendy",
                                                       "/orderDetail",
                                                       "/admin-update",
                                                       "/admin-dashboard",
                                                       "/admin-productList",
                                                       "/admin-orderList",
                                                       "/admin-categoryList",
                                                       "/admin-userList",
                                                       "/admin-productDetail",
                                                       "/admin-userDetail",
                                                       "/admin-orderDetail",
                                                       "/admin-categoryDetail",
                                                       "/admin-updateproduct",
                                                       "/admin-disableproduct",
                                                       "/admin-enableproduct",
                                                       "/admin-addcategory",
                                                       "/admin-disablecategory",
                                                       "/admin-enablecategory",
                                                       "/admin-addproduct",
                                                       "/admin-updatecategory",
                                                       "admin-removeuser",
                                                       "404"
})
@MultipartConfig(fileSizeThreshold = 1024*1024*1, maxFileSize = 1024*1024*5, maxRequestSize = 1024*1024*5)
public class ControllerServlet extends HttpServlet {
    
    // Session List:
    // 1. view      : Current Page
    // 2. title     : Page title
    // 3. 
    // 4.
    // 5. 
    // 6.
    // 7.
    // ....
    @EJB
    ProductSessionBean prod;
    @EJB
    CategorySessionBean cate;
    @EJB
    UserSessionBean userSB;
    @EJB
    OrderSessionBean orderSB;
    @EJB
    BestSaleSessionBean bestSB;
    
    public static final String SAVE_DIR = "/images";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        HttpSession session = request.getSession();
        String servletPath = request.getServletPath();
        
        // Homepage
        if (servletPath.equals("/home")){
            session.setAttribute("title", "Homepage");
            request.setAttribute("Allcate", cate.findActiveCate());
            request.setAttribute("bestSale", bestSB.getBestSale());
            request.setAttribute("newProducts", prod.findNew());
            servletPath = "/index";
        }
        if (servletPath.equals("/404")){
            request.setAttribute("error", "none");
            session.setAttribute("title", "404 Not Found");
        }
        if (servletPath.equals("/trendy")){
            session.setAttribute("title", "Trendy");
            request.setAttribute("bestSale", bestSB.getTrendy());
        }
        
        // Product List
        if (servletPath.equals("/productList")){
            int page = 1;
            int prodsPerPage = 12;
            if (request.getParameter("page") != null)
                page = Integer.parseInt(request.getParameter("page"));
            int a = (page-1)*prodsPerPage;
            List<Product> list = prod.findActiveRange(a, a + prodsPerPage);
            int noOfProds = prod.findAllActive().size();
            int noOfPages = (int) Math.ceil(noOfProds * 1.0 / prodsPerPage);
            request.setAttribute("productList", list);
            session.setAttribute("noOfPages", noOfPages);
            session.setAttribute("currentPage", page);
            session.setAttribute("title", "Product List");
        } 
        
        // Product Detail
        if (servletPath.equals("/productDetail")){
            int id;
            if (request.getParameter("id") != null){               
                id = Integer.parseInt(request.getParameter("id"));
                Product selectedProd = prod.find(id);
                if (selectedProd.getStatus()){
                    request.setAttribute("prods", selectedProd);
                }else{
                    request.setAttribute("error", "Product not found!");
                    servletPath = "/404";
                }
                session.setAttribute("title", selectedProd.getName());
            }
        }
        
        // Product by Category
        if (servletPath.equals("/product-list")){
            int cateid;
            cateid = Integer.parseInt(request.getParameter("cate"));
            Category selectedcate = cate.find(cateid);
            if (selectedcate.getStatus()){
                List<Product> cateprods = (List<Product>)prod.findByCate(selectedcate);
                request.setAttribute("cate", selectedcate);
                request.setAttribute("productListByCate", cateprods);
            }else{
                
            }
            session.setAttribute("title", selectedcate.getName());
        }
        
        // View your cart
        if (servletPath.equals("/viewcart")) {
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
            if (cart == null) {
                cart = new ShoppingCart();
                session.setAttribute("cart", cart);
            }
            session.setAttribute("title", "View Cart");
        }
        
        // View Order Detail
        if (servletPath.equals("/orderDetail")){
            String id = (String) request.getParameter("id");
            MyOrder od = (MyOrder) orderSB.find(id);
            List<MyOrderDetail> odlist = (List<MyOrderDetail>) od.getMyOrderDetailCollection();
            request.setAttribute("orderDetailList", odlist);
            request.setAttribute("detail", id);
            servletPath = (String) session.getAttribute("view");
        }
        
        // Add product to Cart
        if (servletPath.equals("/addToCart")) {
            // if user is adding item to cart for first time
            // create cart object and attach it to user session
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");

            if (cart == null) {
                cart = new ShoppingCart();
                session.setAttribute("cart", cart);
            }
            // get user input from request
            if (request.getParameter("id") != null) {
                Product product = prod.find(Integer.parseInt(request.getParameter("id")));
                if (request.getParameter("num")==null){
                    cart.addItem(product);
                }else{
                    int num = (int) Integer.parseInt(request.getParameter("num"));
                    for (int i=0; i<num; i++){
                        cart.addItem(product);
                    }
                }
                request.setAttribute("prods", product);
                request.setAttribute("productListByCate", prod.findByCate(product.getCateID()));
                request.setAttribute("productList", prod.findAllActive());
                request.setAttribute("cate", product.getCateID());
            }
            String userView = (String) session.getAttribute("view");
            servletPath = userView;
        }

        // Remove item from Cart
        if (servletPath.equals("/remove")){
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
            if (cart == null){
                cart = new ShoppingCart();
                session.setAttribute("cart", cart);
            }
            if (request.getParameter("id") != null){
                Product product = prod.find(Integer.parseInt(request.getParameter("id")));
                cart.update(product, "0");
            }
            String userView = (String) session.getAttribute("view");
            servletPath = userView;
        }
        
        // Clear all items from Cart
        if (servletPath.equals("/emptycart")){
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
            if (cart == null){
                cart = new ShoppingCart();
                session.setAttribute("cart", cart);
            }
            cart.clear();
            String userView = (String) session.getAttribute("view");
            servletPath = userView;
        }
        
        // Login 
        if (servletPath.equals("/login")){
            session.setAttribute("title", "Login");
            
            String username = (String) request.getParameter("username");
            String password = (String) request.getParameter("password");
            if (username != null){
                MyUser user = null;
                
                try {
                    user = userSB.checkUser(username);
                } catch (Exception ex){
                    ex.printStackTrace();
                }
                
                if (user == null){
                    request.setAttribute("error", "Wrong username! Try again!");
                } else {
                    if (!user.getPassword().equals(password)){
                        request.setAttribute("error", "Wrong password! Try again!");
                    }else{
                        session.setAttribute("user", user);
                        if (user.getRoleID().getRoleID()==1){
                            session.setAttribute("title", "Homepage");
                            servletPath = "/index";
                        }else{
                            session.setAttribute("title", "Dashboard");
                            servletPath = "/admin/dashboard";
                        }
                    }
                }
            }
        }
        
        // Logout
        if (servletPath.equals("/logout")){
            session.setAttribute("user", null);
            request.setAttribute("Allcate", cate.findActiveCate());
            request.setAttribute("bestSale", bestSB.getBestSale());
            request.setAttribute("newProducts", prod.findNew());
            session.setAttribute("title", "Homepage");
            servletPath = "/index";
        }
        
        // View profile
        if (servletPath.equals("/profile")){
            MyUser user = (MyUser) session.getAttribute("user");
            List<MyOrder> ol = (List<MyOrder>) orderSB.findByUserID(user);
            session.setAttribute("user", user);
            session.setAttribute("orderList", ol);
            request.setAttribute("orderListDetail", null);
            session.setAttribute("title", "Your profile");
            request.setAttribute("tab", "none");
            request.setAttribute("detail", "none");
            request.setAttribute("thongbao", "none");
        }
        
        // Register
        if (servletPath.equals("/register")){
            session.setAttribute("title", "Register");
            
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            if (username != null) {
                try {
                    userSB.insertUser(email, username, password);
                    request.setAttribute("thongbao", "Successfully sign up! You can login now.");
                    session.setAttribute("title", "Login");
                    servletPath = "/login";
                }catch (Exception ex){
                    request.setAttribute("error", "Sorry! Username has been taken. Please try another.");
                }
            }
        }
        // Checkout 
        if (servletPath.equals("/checkout")) {
            MyUser user = (MyUser) session.getAttribute("user");
            
            if (user == null ){
                request.setAttribute("thongbao", "Please login first!");
                servletPath = "/login";
                session.setAttribute("title", "Login");
            }else{
                session.setAttribute("title", "Check out");
            }
        }
        
        // Confirm to Buy
        if (servletPath.equals("/buy")){
            String contname = (String) request.getParameter("contname");
            String contphone = (String) request.getParameter("contphone");
            String shipaddr = (String) request.getParameter("shipaddr");
            
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
            List<ShoppingCartItem> items = cart.getItems();
            
            MyUser user = (MyUser) session.getAttribute("user");
            
            String date = java.time.LocalDateTime.now().toString();
            String orderID = date + "-" + user.getUserID().toString();
            
            request.setAttribute("thongbao", "Successfully buy! Please wait for shipping");
            servletPath = (String) session.getAttribute("view");
            
            orderSB.insertOrder(orderID, user.getUserID(), contname, contphone, shipaddr, cart.getSubtotal());
            for (ShoppingCartItem item: items){
                orderSB.insertOrderDetail(orderID, item.getProd().getProdID(), item.getProd().getPrice(), item.getQuantity(), item.getTotal());
            }                   
            
            cart.clear();
            if (cart == null){
                cart = new ShoppingCart();
                session.setAttribute("cart", cart);
            }
        }
        
        // Choose what to change 
        if (servletPath.equals("/change")){
            String tab = (String) request.getParameter("tab");
            request.setAttribute("thongbao", "none");
            request.setAttribute("tab", tab);
            servletPath = (String) session.getAttribute("view");          
        }
        
        // Update the changes
        if (servletPath.equals("/update")) {
            servletPath = (String) session.getAttribute("view");
            
            String name = (String) request.getParameter("name");
            String email = (String) request.getParameter("email");
            String sex = (String) request.getParameter("sex");
            String phone = (String) request.getParameter("phone");
            String address = (String) request.getParameter("address");
            
            MyUser user = (MyUser) session.getAttribute("user");
            int id = user.getUserID();
            
            if (name!=null){
                request.setAttribute("thongbao", "Name Changed");
                userSB.updateName(name, id);
                user.setName(name);
            }
            
            if (email!=null){
                request.setAttribute("thongbao", "Email Changed");
                userSB.updateEmail(email, id);
                user.setEmail(email);
            }
            
            if (sex!=null){
                request.setAttribute("thongbao", "Sex Changed");
                userSB.updateSex(sex, id);
                user.setSex(sex);
            }
            
            if (phone!=null){
                request.setAttribute("thongbao", "Phone Changed");
                userSB.updatePhone(phone, id);
                user.setPhone(phone);
            }
            
            if (address!=null){
                request.setAttribute("thongbao", "Address Changed");
                userSB.updateAddress(address, id);
                user.setAddress(address);
            }
            session.setAttribute("user", user);
            request.setAttribute("tab", "none");
        }
        
        
        // Admin : Product List
        if (servletPath.equals("/admin-productList")){
            MyUser user = (MyUser) session.getAttribute("user");
            if (user==null || user.getRoleID().getRoleID()==1){
                request.setAttribute("error", "You are not permitted!");
                servletPath = "/404";
            }else{
                int page = 1;
                int prodsPerPage = 6;
                if (request.getParameter("page") != null)
                {
                    page = Integer.parseInt(request.getParameter("page"));
                    session.setAttribute("page", page);
                }
                int a = (page-1)*prodsPerPage;
                List<Category> cl = cate.findAll();
                List<Product> list = prod.findRange(new int[]{a, a + prodsPerPage});
                int noOfProds = prod.count();
                int noOfPages = (int) Math.ceil(noOfProds * 1.0 / prodsPerPage);
                session.setAttribute("catelist", cl);
                session.setAttribute("productList", list);
                session.setAttribute("noOfPages", noOfPages);
                session.setAttribute("currentPage", page);
                session.setAttribute("title", "Product List");
                servletPath = "/admin/productList";
            }
        }

        
        // Admin : Order List
        if (servletPath.equals("/admin-orderList")){
            MyUser user = (MyUser) session.getAttribute("user");
            if (user==null || user.getRoleID().getRoleID()==1){
                request.setAttribute("error", "You are not permitted!");
                servletPath = "/404";
            }else{
                List<MyOrder> list = orderSB.findAll();
                session.setAttribute("orderList", list);
                session.setAttribute("title", "Order List");
                request.setAttribute("orderListDetail", null);
                request.setAttribute("detail", "none");
                servletPath = "/admin/orderList";
            }
        }
        
        
        // Admin : User List
        if (servletPath.equals("/admin-userList")){
            MyUser user = (MyUser) session.getAttribute("user");
            if (user==null || user.getRoleID().getRoleID()==1){
                request.setAttribute("error", "You are not permitted!");
                servletPath = "/404";
            }else{
                List<MyUser> list = userSB.findAll();
                session.setAttribute("userList", list);
                session.setAttribute("title", "User List");
                request.setAttribute("thongbao", "none");
                servletPath = "/admin/userList";
            }
        }
        
        // Admin : Category List
        if (servletPath.equals("/admin-categoryList")){
            MyUser user = (MyUser) session.getAttribute("user");
            if (user==null || user.getRoleID().getRoleID()==1){
                request.setAttribute("error", "You are not permitted!");
                servletPath = "/404";
            }else{
                List<Category> list = cate.findAll();
                session.setAttribute("categoryList", list);
                session.setAttribute("title", "Category List");
                request.setAttribute("thongbao", "none");
                servletPath = "/admin/categoryList";
            }
        }
        
        // Admin Product Detail
        if (servletPath.equals("/admin-productDetail")){
            MyUser user = (MyUser) session.getAttribute("user");
            if (user==null || user.getRoleID().getRoleID()==1){
                request.setAttribute("error", "You are not permitted!");
                servletPath = "/404";
            }else{
                int id;
                if (request.getParameter("id") != null){
                    List<Category> cl = (List<Category>) cate.findActiveCate();
                    id = Integer.parseInt(request.getParameter("id"));
                    Product selectedProd = prod.find(id);
                    session.setAttribute("prods", selectedProd);
                    session.setAttribute("title", selectedProd.getName());
                    session.setAttribute("catelist", cl);
                    request.setAttribute("tab", "none");
                    request.setAttribute("thongbao", "none");
                    servletPath = "/admin/productDetail";
                }
            }
        }
        
        // Admin : Choose what to change
        if (servletPath.equals("/admin-change")){
            MyUser user = (MyUser) session.getAttribute("user");
            if (user==null || user.getRoleID().getRoleID()==1){
                request.setAttribute("error", "You are not permitted!");
                servletPath = "/404";
            }else{
                String tab = (String) request.getParameter("tab");
                request.setAttribute("thongbao", "none");
                request.setAttribute("tab", tab);
                servletPath = (String) session.getAttribute("view");
            }
        }

        // Admin : Category Detail
        if (servletPath.equals("/admin-categoryDetail")){
            MyUser user = (MyUser) session.getAttribute("user");
            if (user==null || user.getRoleID().getRoleID()==1){
                request.setAttribute("error", "You are not permitted!");
                servletPath = "/404";
            }else{
                int id;
                if (request.getParameter("id") != null){
                    id = Integer.parseInt(request.getParameter("id"));
                    Category selectedCate = cate.find(id);
                    session.setAttribute("Cate", selectedCate);
                    session.setAttribute("title", selectedCate.getName());
                    request.setAttribute("tab", "none");
                    request.setAttribute("thongbao", "none");
                }
                servletPath = "/admin/categoryDetail";
            }
        }
        
        // Admin : User Detail
        if (servletPath.equals("/admin-userDetail")) {
            MyUser user = (MyUser) session.getAttribute("user");
            if (user == null || user.getRoleID().getRoleID() == 1) {
                request.setAttribute("error", "You are not permitted!");
                servletPath = "/404";
            } else {
                int id;
                if (request.getParameter("id") != null) {
                    id = Integer.parseInt(request.getParameter("id"));
                    MyUser selectedUser = userSB.find(id);
                    session.setAttribute("useritem", selectedUser);
                    session.setAttribute("title", selectedUser.getName());
                    request.setAttribute("tab", "none");
                    request.setAttribute("thongbao", "none");
                    servletPath = "/admin/userDetail";
                }
            }
        }
        
        // Admin: User Update: Commit Change
        if (servletPath.equals("/admin-update")) {
            MyUser user = (MyUser) session.getAttribute("user");
            if (user==null || user.getRoleID().getRoleID()==1){
                request.setAttribute("error", "You are not permitted!");
                servletPath = "/404";
            }else{
                servletPath = (String) session.getAttribute("view");

                String name = (String) request.getParameter("name");
                String email = (String) request.getParameter("email");
                String sex = (String) request.getParameter("sex");
                String phone = (String) request.getParameter("phone");
                String address = (String) request.getParameter("address");
                
                MyUser us = (MyUser) session.getAttribute("useritem");
                int id = us.getUserID();

                if (name!=null){
                    request.setAttribute("thongbao", "Name Changed");
                    userSB.updateName(name, id);
                    us.setName(name);
                }

                if (email!=null){
                    request.setAttribute("thongbao", "Email Changed");
                    userSB.updateEmail(email, id);
                    us.setEmail(email);
                }

                if (sex!=null){
                    request.setAttribute("thongbao", "Sex Changed");
                    userSB.updateSex(sex, id);
                    us.setSex(sex);
                }

                if (phone!=null){
                    request.setAttribute("thongbao", "Phone Changed");
                    userSB.updatePhone(phone, id);
                    us.setPhone(phone);
                }

                if (address!=null){
                    request.setAttribute("thongbao", "Address Changed");
                    userSB.updateAddress(address, id);
                    us.setAddress(address);
                }
                session.setAttribute("useritem", us);
                request.setAttribute("tab", "none");
                session.setAttribute("title", us.getName());
            }
        }
        
        // Admin : View Order Detail
        if (servletPath.equals("/admin-orderDetail")){
            MyUser user = (MyUser) session.getAttribute("user");
            if (user==null || user.getRoleID().getRoleID()==1){
                request.setAttribute("error", "You are not permitted!");
                servletPath = "/404";
            }else{
                String id = (String) request.getParameter("id");
                MyOrder od = (MyOrder) orderSB.find(id);
                List<MyOrderDetail> odlist = (List<MyOrderDetail>) od.getMyOrderDetailCollection();
                request.setAttribute("orderDetailList", odlist);
                servletPath = (String) session.getAttribute("view");
                request.setAttribute("detail", id);
            }
        }
  
        // Admin : Dashboard / Admin homepage
        if (servletPath.equals("/admin-dashboard")){
            MyUser user = (MyUser) session.getAttribute("user");
            if (user==null || user.getRoleID().getRoleID()==1){
                request.setAttribute("error", "You are not permitted!");
                servletPath = "/404";
            }else{
                servletPath = "/admin/dashboard";
            }
        }
        
        // Admin Disable product, cant be seen on web
        if (servletPath.equals("/admin-disableproduct")){
            MyUser user = (MyUser) session.getAttribute("user");
            if (user==null || user.getRoleID().getRoleID()==1){
                request.setAttribute("error", "You are not permitted!");
                servletPath = "/404";
            }else{
                int id = (int) Integer.parseInt(request.getParameter("id"));
                prod.disableProduct(id);    
                int noOfProds = prod.count();
                int prodsPerPage = 6;
                int noOfPages = (int) Math.ceil(noOfProds * 1.0/prodsPerPage);
                int page = (int) session.getAttribute("page");
                if (noOfPages < page) page = noOfPages;
                int a = (page-1)*prodsPerPage;
                List<Product> list = prod.findRange(new int[]{a, a+ prodsPerPage});
                session.setAttribute("productList", list);
                session.setAttribute("noOfPages", noOfPages);
                session.setAttribute("currentPage", page);
                
                servletPath = (String) session.getAttribute("view");
            }
        }
        
        // Admin Enable product, product can see on web
        if (servletPath.equals("/admin-enableproduct")){
            MyUser user = (MyUser) session.getAttribute("user");
            if (user==null || user.getRoleID().getRoleID()==1){
                request.setAttribute("error", "You are not permitted!");
                servletPath = "/404";
            }else{
                int id = (int) Integer.parseInt(request.getParameter("id"));
                prod.enableProduct(id);    
                int noOfProds = prod.count();
                int prodsPerPage = 6;
                int noOfPages = (int) Math.ceil(noOfProds * 1.0/prodsPerPage);
                int page = (int) session.getAttribute("page");
                if (noOfPages < page) page = noOfPages;
                int a = (page-1)*prodsPerPage;
                List<Product> list = prod.findRange(new int[]{a, a+ prodsPerPage});
                session.setAttribute("productList", list);
                session.setAttribute("noOfPages", noOfPages);
                session.setAttribute("currentPage", page);
                
                servletPath = (String) session.getAttribute("view");
            }
        }
        
        // Admin disable Category, also disable all Product with disabled category
        if(servletPath.equals("/admin-disablecategory")){
            MyUser user = (MyUser) session.getAttribute("user");
            if (user==null || user.getRoleID().getRoleID()==1){
                request.setAttribute("error", "You are not permitted!");
                servletPath = "/404";
            }else{
                int cateID = (int) Integer.parseInt(request.getParameter("id"));
                Category c = cate.find(cateID);
                cate.disableCate(cateID);
                prod.disableByCate(c);
                request.setAttribute("thongbao", "Successfully disable category");
                List<Category> cl = (List<Category>) cate.findAll();
                session.setAttribute("categoryList", cl);
                servletPath = (String) session.getAttribute("view");
            }
        }
        
        // Admin Enable category, also enable products with enabled category
        if(servletPath.equals("/admin-enablecategory")){
            MyUser user = (MyUser) session.getAttribute("user");
            if (user==null || user.getRoleID().getRoleID()==1){
                request.setAttribute("error", "You are not permitted!");
                servletPath = "/404";
            }else{
                int cateID = (int) Integer.parseInt(request.getParameter("id"));
                Category c = cate.find(cateID);
                cate.enableCate(cateID);
                prod.enableByCate(c);
                request.setAttribute("thongbao", "Successfully enable category");
                List<Category> cl = (List<Category>) cate.findAll();
                session.setAttribute("categoryList", cl);
                servletPath = (String) session.getAttribute("view");
            }
        }
        
        // Admin remove User,
        if (servletPath.equals("/admin-removeuser")){
            MyUser user = (MyUser) session.getAttribute("user");
            if (user==null || user.getRoleID().getRoleID()==1){
                request.setAttribute("error", "You are not permitted!");
                servletPath = "/404";
            }else{
                int id = (int) Integer.parseInt(request.getParameter("id"));
                request.setAttribute("thongbao", "Delete successfully user!");
                userSB.deleteUser(id);
                List<MyUser> ul = (List<MyUser>) userSB.findAll();
                session.setAttribute("userList", ul);
                servletPath = (String) session.getAttribute("view");
            }
        }       
        
        String url = servletPath + ".jsp";
        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex){
            ex.printStackTrace();
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{       
        HttpSession session = request.getSession(false);
        String servletPath = request.getServletPath();
        
        // Admin add new Category, File uploaded to Build File
        if (servletPath.equals("/admin-addcategory")){
            MyUser user = (MyUser) session.getAttribute("user");
            if (user==null || user.getRoleID().getRoleID()==1){
                request.setAttribute("error", "You are not permitted!");
                servletPath = "/404";
            }else{
                String imageName = null;
                String name = (String) request.getParameter("name");
                String desc = (String) request.getParameter("desc");               
                Part image = request.getPart("imag");
                if (image == null) imageName = "NULL";
                else {
                    imageName = upload(image, request);
                }
                
                int cateID = (int) cate.count()+1;
                if (desc == null) desc = "NULL";
                
                cate.insertNewCate(cateID, name, desc, imageName);
                
                request.setAttribute("thongbao", "Successfully add new category!");
                List<Category> cl = (List<Category>) cate.findAll();
                session.setAttribute("categoryList", cl);
                servletPath = (String) session.getAttribute("view");
            }
        }
        
        // Admin Update Category , File Uploaded to Build File
        if (servletPath.equals("/admin-updatecategory")){
            MyUser user = (MyUser) session.getAttribute("user");
            if (user==null || user.getRoleID().getRoleID()==1){
                request.setAttribute("error", "You are not permitted!");
                servletPath = "/404";
            }else{
                Category c = (Category) session.getAttribute("Cate");
                int id = (int) c.getCateID();
                String name = (String) request.getParameter("name");
                String desc = (String) request.getParameter("desc");                             
                if (name!=null){
                    request.setAttribute("thongbao", "Category name changed");
                    cate.updateName(name, id);
                    c.setName(name);
                }
                if (desc!=null){
                    request.setAttribute("thongbao", "Category description changed");
                    cate.updateDesc(desc, id);
                    c.setDescription(desc);
                }
                String imageName = "NULL";
                Part image = request.getPart("image");
                if (image == null) imageName = "NULL";
                else {
                    imageName = upload(image, request);
                    request.setAttribute("thongbao", "Category image changed");
                }                    
                cate.updateImage(imageName, id);
                c.setImage(imageName);
                session.setAttribute("Cate", c);
                request.setAttribute("tab", "none");
                servletPath = (String) session.getAttribute("view");              
            }
        }
        
        // Admin Update Product 
        if (servletPath.equals("/admin-updateproduct")) {
            MyUser user = (MyUser) session.getAttribute("user");
            if (user==null || user.getRoleID().getRoleID()==1){
                request.setAttribute("error", "You are not permitted!");
                servletPath = "/404";
            }else{
                servletPath = (String) session.getAttribute("view");     

                Product pr = (Product) session.getAttribute("prods");

                String name         = (String) request.getParameter("name");                //1
                String info         = (String) request.getParameter("info");                //2
                String description  = (String) request.getParameter("description");         //3
                String category     = (String) request.getParameter("category");            //4
                String price        = (String) request.getParameter("price");               //5
                Part thumbImage     =  request.getPart("thumbImage");                       //6
                Part image1         =  request.getPart("image1");                           //7
                Part image2         =  request.getPart("image2");                           //8


                int id = pr.getProdID();

                if (name!=null){
                    request.setAttribute("thongbao", "Name Changed");
                    prod.updateName(name, id);
                    pr.setName(name);
                }
                if (info!=null){
                    request.setAttribute("thongbao", "Info Changed");
                    prod.updateInfo(info, id);
                    ProductDetail pd = pr.getProductDetail();
                    pd.setInfo(info);
                    pr.setProductDetail(pd);
                }
                if (description!=null){
                    request.setAttribute("thongbao", "Description Changed");
                    prod.updateDescription(description, id);
                    ProductDetail pd = pr.getProductDetail();
                    pd.setDescription(description);
                    pr.setProductDetail(pd);
                }
                if (category!=null){
                    request.setAttribute("thongbao", "Category Changed");
                    Category newcate = new Category();
                    List<Category> cl = (List<Category>) session.getAttribute("catelist");
                    for (Category clunit: cl){
                        if (category.equals(clunit.getName())){
                            newcate = clunit;
                            break;
                        }
                    }
                    prod.updateCategory(newcate, id);
                    pr.setCateID(newcate);
                }
                if (price!=null){
                    request.setAttribute("thongbao", "Price Changed");
                    int unitprice = Integer.parseInt(price);
                    prod.updateUnitPrice(unitprice, id);
                    pr.setPrice(unitprice);
                }
                String thumbImageName = "NULL";
                String image1Name = "NULL";
                String image2Name = "NULL";
                if (thumbImage!=null){
                    thumbImageName = upload(thumbImage, request);
                    request.setAttribute("thongbao", "Product Thumbnail Image changed");
                    pr.setThumbImage(thumbImageName);
                }
                if (image1!=null){
                    image1Name = upload(image1, request);
                    request.setAttribute("thongbao", "Product Image 1 changed");
                    ProductDetail pd = pr.getProductDetail();
                    pd.setImage1(image1Name);
                    pr.setProductDetail(pd);
                }
                if (image2!=null){
                    image2Name = upload(image2, request);
                    request.setAttribute("thongbao", "Product Image 2 changed");
                    ProductDetail pd = pr.getProductDetail();
                    pd.setImage2(image2Name);
                    pr.setProductDetail(pd);
                }
                session.setAttribute("prods", pr);
                request.setAttribute("tab", "none");
            }
        }
        
        if(servletPath.equals("/admin-addproduct")){
            MyUser user = (MyUser) session.getAttribute("user");
            if (user==null || user.getRoleID().getRoleID()==1){
                request.setAttribute("error", "You are not permitted!");
                servletPath = "/404";
            }else{
                Product newpr = new Product();
                ProductDetail prd = new ProductDetail();
                // Name
                String name = (String) request.getParameter("name");
                newpr.setName(name);                    // Set Name
                
                // Category
                String cate = (String) request.getParameter("cate");
                Category newcate = new Category();
                List<Category> cl = (List<Category>) session.getAttribute("catelist");
                for (Category clunit: cl){
                    if (cate.equals(clunit.getName())){
                        newcate = clunit;
                        break;
                    }
                }
                newpr.setCateID(newcate);               // Set Category
                // Price
                String price = (String) request.getParameter("price");
                int upr = Integer.parseInt(price);
                newpr.setPrice(upr);                    // Set Price
                
                // Thumbnail Image
                Part thumbImage = request.getPart("thumbImage");
                String thumbImageName = upload(thumbImage, request);
                newpr.setThumbImage(thumbImageName);    // Set Thumbnail Image
                // Status = Cate Status
                newpr.setStatus(newcate.getStatus());   // Set Status
                // Insert Newproduct
                prod.addNewProduct(newpr);
                // Get Identity ProdID
                int identity = prod.getLastIndex();
                
                prd.setProdID(identity);                // Set detail ProdID
                String info = (String) request.getParameter("info");
                String desc = (String) request.getParameter("desc");
               
                Part image1 = request.getPart("image1");
                Part image2 = request.getPart("image2");
                
                if (info==null) info = "NULL";
                if (desc==null) desc = "NULL";
                String imageName1 = "NULL";
                String imageName2 = "NULL";
                if (image1!=null) imageName1 = upload(image1, request);
                if (image2!=null) imageName2 = upload(image2, request);
                prd.setDescription(desc);               // Set detail description
                prd.setInfo(info);                      // Set detail info
                prd.setImage1(imageName1);              // Set detail Image1
                prd.setImage2(imageName2);              // Set detail Image2
                // Insert Product detail
                prod.addNewProdDetail(prd);
                
                // To the last page of product List
                int noOfProds = prod.count();
                int prodsPerPage = 6;
                int noOfPages = (int) Math.ceil(noOfProds * 1.0/prodsPerPage);
                int page = noOfPages;
                if (noOfPages < page) page = noOfPages;
                int a = (page-1)*prodsPerPage;
                List<Product> list = prod.findRange(new int[]{a, a+ prodsPerPage});
                session.setAttribute("productList", list);
                session.setAttribute("noOfPages", noOfPages);
                session.setAttribute("currentPage", page);
                // 
                servletPath = (String) session.getAttribute("view");          
            }
        }
        
        String url = servletPath + ".jsp";
        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }   
    
    public String upload(Part part, HttpServletRequest request){
        String imageName = "";
        try{
            imageName = extractFileName(part);
            String appPath = request.getServletContext().getRealPath("");
            appPath = appPath.replace('\\', '/');
            String basePath = appPath + File.separator+ SAVE_DIR + File.separator;
            InputStream inputStream = null;
            OutputStream outputStream = null;
            try{
                File outputFilePath = new File(basePath + imageName);
                inputStream = part.getInputStream();
                outputStream = new FileOutputStream(outputFilePath);
                int read = 0;
                final byte[] bytes = new byte[1024];
                while ((read = inputStream.read(bytes)) != -1){
                    outputStream.write(bytes, 0, read);
                }
            }catch (Exception e){
                e.toString();
                imageName = "";
                }finally{
                    if (outputStream != null) {
                        outputStream.close();
                    }       
                    if (inputStream != null) {
                        inputStream.close();
                    }
            }
        }catch(Exception e){
            e.toString();
            imageName = "";
        }
        return imageName;
    }
    
    public String extractFileName(Part part){
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                // C:\file1.zip
                // C:\Note\file2.zip
                String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
                clientFileName = clientFileName.replace("\\", "/");
                int i = clientFileName.lastIndexOf('/');
                // file1.zip
                // file2.zip
                return clientFileName.substring(i + 1);
            }
        }
        return null;
    }
}
