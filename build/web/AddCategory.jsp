<%-- 
    Document   : ListCategory
    Created on : Mar 15, 2024, 3:37:38 PM
    Author     : Admin
<?xml version="1.0" encoding="UTF-8"?>
<web-app version="6.0" xmlns="https://jakarta.ee/xml/ns/jakartaee" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="https://jakarta.ee/xml/ns/jakartaee https://jakarta.ee/xml/ns/jakartaee/web-app_6_0.xsd">
    <welcome-file-list>
        <welcome-file>/list</welcome-file>
    </welcome-file-list>
    <session-config>
        <session-timeout>
            30
        </session-timeout>
    </session-config>
    <servlet>
        <servlet-name>ListProductServlet</servlet-name>
        <servlet-class>controller.product.ListServlet</servlet-class>
    </servlet>
    <servlet>
        <servlet-name>SingleProductServlet</servlet-name>
        <servlet-class>controller.product.SingleProductServlet</servlet-class>
    </servlet>
    <servlet>
        <servlet-name>LoginServlet</servlet-name>
        <servlet-class>controller.account.LoginServlet</servlet-class>
    </servlet>
    <servlet>
        <servlet-name>SignUpServlet</servlet-name>
        <servlet-class>controller.account.SignUpServlet</servlet-class>
    </servlet>
    <servlet>
        <servlet-name>Logout</servlet-name>
        <servlet-class>controller.account.Logout</servlet-class>
    </servlet>
    <servlet>
        <servlet-name>AdminServlet</servlet-name>
        <servlet-class>controller.account.AdminServlet</servlet-class>
    </servlet>
    <servlet>
        <servlet-name>ListProduct</servlet-name>
        <servlet-class>controller.product.ListProductAdmin</servlet-class>
    </servlet>
    <servlet>
        <servlet-name>ListCategory</servlet-name>
        <servlet-class>controller.category.ListCategory</servlet-class>
    </servlet>
    <servlet>
        <servlet-name>AddCategory</servlet-name>
        <servlet-class>controller.category.AddCategory</servlet-class>
    </servlet>
    <servlet>
        <servlet-name>AddProduct</servlet-name>
        <servlet-class>controller.product.AddProduct</servlet-class>
    </servlet>
    <servlet>
        <servlet-name>DeleteProduct</servlet-name>
        <servlet-class>controller.product.DeleteProduct</servlet-class>
    </servlet>
    <servlet>
        <servlet-name>DeleteCategory</servlet-name>
        <servlet-class>controller.category.DeleteCategory</servlet-class>
    </servlet>
    <servlet>
        <servlet-name>UpdateProductServlet</servlet-name>
        <servlet-class>controller.product.UpdateProductServlet</servlet-class>
    </servlet>
    <servlet>
        <servlet-name>AddToCart</servlet-name>
        <servlet-class>controller.cart.AddToCart</servlet-class>
    </servlet>
    <servlet>
        <servlet-name>CartServlet</servlet-name>
        <servlet-class>controller.cart.CartServlet</servlet-class>
    </servlet>
    <servlet>
        <servlet-name>CheckOut</servlet-name>
        <servlet-class>oder.controller.CheckOut</servlet-class>
    </servlet>
    <servlet>
        <servlet-name>DeletedCart</servlet-name>
        <servlet-class>controller.cart.DeletedCart</servlet-class>
    </servlet>
    <servlet>
        <servlet-name>ListOrderServlet</servlet-name>
        <servlet-class>oder.controller.ListOrderServlet</servlet-class>
    </servlet>
    <servlet>
        <servlet-name>ViewOrderServlet</servlet-name>
        <servlet-class>oder.controller.ViewOrderServlet</servlet-class>
    </servlet>
    <servlet>
        <servlet-name>UserServlet</servlet-name>
        <servlet-class>controller.account.UserServlet</servlet-class>
    </servlet>
    <servlet>
        <servlet-name>ChangeInformation</servlet-name>
        <servlet-class>controller.account.ChangeInformation</servlet-class>
    </servlet>
    <servlet>
        <servlet-name>HistoryPurahseServlet</servlet-name>
        <servlet-class>oder.controller.HistoryPurchseServlet</servlet-class>
    </servlet>
    <servlet>
        <servlet-name>OrderDetail</servlet-name>
        <servlet-class>oder.controller.OrderUser</servlet-class>
    </servlet>
    <servlet>
        <servlet-name>ListUserServlet</servlet-name>
        <servlet-class>controller.account.ListUserServlet</servlet-class>
    </servlet>
    <servlet>
        <servlet-name>AddAccount</servlet-name>
        <servlet-class>controller.account.AddAccount</servlet-class>
    </servlet>
    <servlet>
        <servlet-name>UpdateAccount</servlet-name>
        <servlet-class>controller.account.UpdateAccount</servlet-class>
    </servlet>
    <servlet>
        <servlet-name>DeleteAccount</servlet-name>
        <servlet-class>controller.account.DeleteAccount</servlet-class>
    </servlet>
    <servlet-mapping>
        <servlet-name>ListProductServlet</servlet-name>
        <url-pattern>/list</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>SingleProductServlet</servlet-name>
        <url-pattern>/single</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>LoginServlet</servlet-name>
        <url-pattern>/login</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>SignUpServlet</servlet-name>
        <url-pattern>/signup</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>Logout</servlet-name>
        <url-pattern>/logout</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>AdminServlet</servlet-name>
        <url-pattern>/admin</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>ListProduct</servlet-name>
        <url-pattern>/list-product</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>ListCategory</servlet-name>
        <url-pattern>/list-category</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>AddCategory</servlet-name>
        <url-pattern>/add-category</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>AddProduct</servlet-name>
        <url-pattern>/add-product</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>DeleteProduct</servlet-name>
        <url-pattern>/delete-product</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>DeleteCategory</servlet-name>
        <url-pattern>/delete-category</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>UpdateProductServlet</servlet-name>
        <url-pattern>/update-product</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>AddToCart</servlet-name>
        <url-pattern>/addcart</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>CartServlet</servlet-name>
        <url-pattern>/cart</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>CheckOut</servlet-name>
        <url-pattern>/check-out</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>DeletedCart</servlet-name>
        <url-pattern>/delete-cart</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>ListOrderServlet</servlet-name>
        <url-pattern>/list-order</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>ViewOrderServlet</servlet-name>
        <url-pattern>/view-order</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>UserServlet</servlet-name>
        <url-pattern>/user</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>ChangeInformation</servlet-name>
        <url-pattern>/change-information</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>HistoryPurahseServlet</servlet-name>
        <url-pattern>/history-purchase</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>OrderDetail</servlet-name>
        <url-pattern>/order</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>ListUserServlet</servlet-name>
        <url-pattern>/list-user</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>AddAccount</servlet-name>
        <url-pattern>/add-account</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>UpdateAccount</servlet-name>
        <url-pattern>/update-account</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>DeleteAccount</servlet-name>
        <url-pattern>/delete-account</url-pattern>
    </servlet-mapping>
</web-app>

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hng Shop - Product Listing Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/custom.css">

        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
  
    </head>
    <body>
        <%@include  file="Header.jsp"%>
        <div class="container py-5">
            <div class="row">
                <%@include file="SideBarAdmin.jsp" %>

                <div class="col-lg-9">
                    <c:set var="user" value="${requestScope.data}"/>
                <div class="container mt-5">
                    <h1 style="margin-bottom: 40px">Add User</h1>
                    <form action="add-category" method="post">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputEmail4" style="font-weight: bold">Category Name</label>
                                <input type="text" class="form-control" id="inputEmail4" placeholder="Category Name" required="" name="Name">
                            </div> 
                        </div>
                        <button type="submit" class="btn btn-primary updateBtn">ADD</button>
                    </form>
                </div>


                </div>



            </div>
        </div>

        <%@include  file="Footer.jsp"%>
        
        <!-- Start Script -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
       

        <script src="assets/js/jquery-1.11.0.min.js"></script>
        <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/templatemo.js"></script>
        <script src="assets/js/custom.js"></script>
        <!-- End Script -->
    </body>
</html>
