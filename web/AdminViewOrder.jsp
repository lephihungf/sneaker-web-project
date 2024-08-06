<%-- 
    Document   : Home
    Created on : Mar 12, 2024, 11:41:30 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

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

        <style>
            .nav-link {
                color: white
            }
            .nav-link:hover {
                background-color: #ccc;
                color: #17a2b8
            }
        </style>
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("are you sure to delete product id = " + id)) {
                    window.location = "delete-product?id=" + id;
                }
            }
        </script>
    </head>

    <body>
        <%@include  file="Header.jsp"%>



        <!-- Start Content -->
        <div class="container py-5">
            <div class="row">
            <%@include file="SideBarAdmin.jsp" %>  
            <c:set var="listOrder" value="${requestScope.listOrder}"></c:set>
            <c:set var="listProduct" value="${requestScope.listProduct}"></c:set>
            <c:set var="order" value="${requestScope.order}"></c:set>
            <div class="col-lg-9">
                <div class="d-flex">
                
                <div class="row">
                    
                    <div class="container bg-white mt-4">     
                        <div class="col-md-6 mt-5 mb-5 mx-auto">
                            <!-- REVIEW ORDER -->
                            <div class="card">
                                <div class="card-header d-flex align-items-center justify-content-between" >
                                    <div style="font-size: 22px;color: chocolate;font-weight: bold; font-style: italic"">Review Order #${order.orderid}</div>
                                </div>
                                <div class="card-body ">
                                    <c:forEach var="orderItem" items="${listOrder}">
                                        <div class="form-group row">
                                            <c:forEach var="product" items="${listProduct}">
                                                <c:if test="${product.productId == orderItem.productid}">
                                                    <div class="col-sm-3 col-3">
                                                        <img class="img-fluid" src="img/${product.image}" />
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                            <c:forEach var="product" items="${listProduct}">
                                                <c:if test="${product.productId == orderItem.productid}"> 

                                                    <div class="col-sm-6 col-6">
                                                        <div class="col-12" style="font-weight: bold;font-size: 18px">${prod.name}</div>
                                                        <div class="col-12"><small style="font-weight: bold ;font-style: italic;font-size: 14px">Size: <span style="font-weight: lighter ;font-style: normal">${orderItem.size}</span></small></div>
                                                        <div class="col-12"><small style="font-weight: bold ;font-style: italic;font-size: 14px">Quantity: <span style="font-weight: lighter ;font-style: normal">${orderItem.quantity}</span></small></div>
                                                        <div class="col-12"><small style="font-weight: bold ;font-style: italic;font-size: 14px">Price: <span style="font-weight: lighter ;font-style: normal">$${product.price}</span></small></div>
                                                    </div>

                                                    <div class="col-sm-3 col-3 text-right">
                                                        <h6><span>$</span><span class="price">${product.price * orderItem.quantity}</span></h6>
                                                    </div>

                                                </c:if>
                                            </c:forEach>                                  
                                        </div>
                                    </c:forEach>
                                    <hr />
                                    <div class="form-group row">
                                        <div class="col-12">
                                            <strong>Order Total</strong>
                                            <span class="float-right" style="font-weight: bold"><span>$</span><span>${requestScope.order.totalmoney}</span></span>
                                            <input type="text" class="totalOrder" value="" name="total" hidden="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



        </div>
                                            </div>
                                            </div>
    </div>
    <!-- End Content -->

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