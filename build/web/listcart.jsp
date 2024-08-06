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
        <!--
            
        TemplateMo 559 Hng Shop
        
        https://templatemo.com/tm-559-zay-shop
        
        -->


        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            body{
                background:#eee;
                overflow-x: hidden;
            }
            .ui-w-40 {
                width: 40px !important;
                height: auto;
            }

            .card{
                box-shadow: 0 1px 15px 1px rgba(52,40,104,.08);
            }

            .ui-product-color {
                display: inline-block;
                overflow: hidden;
                margin: .144em;
                width: .875rem;
                height: .875rem;
                border-radius: 10rem;
                -webkit-box-shadow: 0 0 0 1px rgba(0,0,0,0.15) inset;
                box-shadow: 0 0 0 1px rgba(0,0,0,0.15) inset;
                vertical-align: middle;
            }
            .dropdown-toggle::after {
                content: none;
            }
            .dropdown-toggle {
                background-color: transparent;
            }
        </style>
    </head>

    <body>




        <!-- Start Content -->
        <c:set var="listCart" value="${requestScope.listCart}"></c:set>
        <c:set var="listProduct" value="${requestScope.listProduct}"></c:set>
        <%@include file="Header.jsp" %>
        <div class="row mt-5 mb-5">
            <div class="container" style="background-color: white">
                <div class="container px-3 my-5 clearfix">
                    <!-- Shopping cart table -->
                    <div class="card">
                        <div class="card-header">
                            <h2>Shopping Cart</h2>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered m-0 table-hover" id="cartTable">
                                    <thead>
                                        <tr>
                                            <th class="text-center py-3 px-4" style="min-width: 100px;">Product Name</th>
                                            <th class="text-center py-3 px-4" style="min-width: 200px;">Image</th>
                                            <th class="text-right py-3 px-4" style="width: 100px;">Price</th>
                                            <th class="text-center py-3 px-4" style="width: 120px;">Size</th>
                                            <th class="text-center py-3 px-4" style="width: 120px;">Quantity</th>
                                            <th class="text-right py-3 px-4" style="width: 100px;">Total</th>
                                            <th class="text-center align-middle py-3 px-0" style="width: 40px;"><a href="#" class="shop-tooltip float-none text-light" title="" data-original-title="Clear cart"><i class="ino ion-md-trash"></i></a></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="check" value="0"></c:set>
                                        <c:forEach var="c" items="${listCart}">
                                            <tr>
                                                <c:forEach var="pc" items="${listProduct}">
                                                    <c:if test="${pc.productId == c.productid}">
                                                        <td class="p-4">${pc.productName}</td>
                                                        <td class="p-2"><img src="img/${pc.image}" alt="alt" style="width: 100px;height: 100px  ;object-fit: cover"></td>
                                                        <td class="text-right font-weight-semibold align-middle p-4 price${check}">${pc.price}</td>
                                                         <td class="p-4">${c.size}</td>
                                                                <td class="align-middle p-4">
                                                                    <input readonly="" id="quantity" class="quantity" name="quantity" data-item="${c.productid}"
                                                                           class="form-control text-center" min="1" max="${c.quantity}" value="${c.quantity}" style="width: 50px">
                                                                
                                                        </td>
                                                    </c:if>
                                                </c:forEach>
                                                <td class="text-right font-weight-semibold align-middle p-4 total${check}" style="width: 150px">$115.1</td>
                                                <td class="text-center align-middle px-0"><a onclick="doDelete(${c.productid},${c.size})" class="shop-tooltip close float-none text-danger removeBtn" title="" data-original-title="Remove">×</a></td>
                                                <c:set var="check" value="${check+1}"></c:set>
                                                </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- / Shopping cart table -->

                            <div class="d-flex flex-wrap justify-content-end align-items-center pb-4">
                                <div class="d-flex">
                                    <div class="text-right mt-4">
                                        <label class="text-muted font-weight-normal m-0">Total price</label>
                                        <div class="text-large"><strong></strong></div>
                                    </div>
                                </div>
                            </div>

                            <div class="float-right">
                                <a href="list"><button type="button" class="btn btn-lg btn-default md-btn-flat mt-2 mr-3">Back to shopping</button></a>
                                <a href="check-out"><button type="button" id="checkoutButton" class="btn btn-lg btn-primary mt-2">Checkout</button></a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- End Content -->

        <%@include  file="Footer.jsp"%>




        <!-- Start Script -->

        <script src="assets/js/jquery-1.11.0.min.js"></script>
        <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/templatemo.js"></script>
        <script src="assets/js/custom.js"></script>


        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>                            
        <script>
                                                    function doDelete(id,size) {
                                                        if (confirm("are you sure to delete ?")) {
                                                            window.location = "delete-cart?id=" + id +"&size="+size;
                                                        }
                                                    }
                                                    const quantity = document.querySelectorAll(".quantity");
                                                    quantity.forEach((value, index) => {
                                                        value.addEventListener("input", function (e) {
                                                            if (+e.target.value > +value.max) { // Convert both value and max to numbers for comparison                                     
                                                                e.target.value = value.max;
                                                            }
                                                            init();
                                                        });
                                                    });
                                                    const init = function () {
                                                        const totalAll = document.querySelector("strong");
                                                        let totalCart = 0;
                                                        quantity.forEach((value, index) => {
                                                            const price = document.querySelector(`.price\${index}`);
                                                            const total = document.querySelector(`.total\${index}`);
                                                            total.innerHTML = '$' + Number(price.innerHTML) * Number(value.value);
                                                            totalCart += Number(price.innerHTML) * Number(value.value);
                                                        });
                                                        totalAll.innerHTML = '$' + totalCart;
                                                    };
                                                    init();
        </script>
        <!-- End Script -->
    </body>

</html>