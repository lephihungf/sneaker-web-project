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
    </head>

    <body>
        <%@include  file="Header.jsp"%>



        <!-- Start Content -->
        <div class="container py-5">
            <div class="row">

                <div class="col-lg-3">
                    <h1 class="h2 pb-4">Categories</h1>
                    <ul class="list-unstyled templatemo-accordion">
                        <li class="pb-3">
                            <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                                Category
                                <i class="fa fa-fw fa-chevron-circle-down mt-1"></i>
                            </a>
                            <ul class="collapse show list-unstyled pl-3">
                                <c:forEach items="${requestScope.categories}" var="c">                                            
                                    <li><a class="text-decoration-none" href="list?cid=${c.categoryId}">${c.categoryName}</a></li>
                                    </c:forEach>
                                <li><a class="text-decoration-none" href="list?cid=0">All</a></li>
                            </ul>
                        </li>


                    </ul>
                </div>

                <div class="col-lg-9">

                    <div class="row">
                        <div class="col-md-9">
                            <form class="col-md-8 col-lg-auto mb-3 mb-lg-0 me-lg-3 mr-4" action="list">
                                <i class="fa-solid fa-magnifying-glass"></i>
                                <input type="search" class="form-control form-control-dark col-md-12" style="width: 500px; height: 40px; border: 1px solid black" placeholder="Search..."
                                       aria-label="Search" name = "search" value="${requestScope.search}">
                                <input type="hidden" name="search" value="${keys}">
                                <input type="hidden" name="cid" value="${cids}">
                            </form>
                        </div>
                        <div class="col-md-3 pb-4">
                            <form id="f1" action="list" >
                                <div class="d-flex">
                                    <select class="form-control" name="arrange" onchange="change()">
                                        <option ${(arrange=="latest")?'selected':''} value="latest">Latest</option>
                                        <option ${(arrange=="cheapest")?'selected':''} value="cheapest">Cheapest</option>
                                        <option ${(arrange=="expensive")?'selected':''} value="expensive">Most Expensive</option>
                                    </select>
                                    <input type="hidden" name="search" value="${keys}">
                                    <input type="hidden" name="cid" value="${cids}">            
                                </div>
                            </form>
                        </div>
                    </div>



                    <div class="row">

                        <c:forEach  items="${requestScope.products}" var="p">                        
                            <div class="col-md-4">
                                <div class="card mb-4 product-wap rounded-0">
                                    <div class="card rounded-0">
                                        <!--      <img class="card-img rounded-0 img-fluid" src="assets/img/shop_01.jpg"> -->
                                        <img class="card-img rounded-0 img-fluid" Style="width: 304.67px;height: 313.33px" src="img/${p.image}">
                                        <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                            <ul class="list-unstyled">
                                                
                                                <li><a class="btn btn-success text-white mt-2" href="single?pid=${p.productId}"><i class="fas fa-cart-plus"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <a href="single?pid=${p.productId}" class="h3 text-decoration-none">${p.productName}</a>
                                        <ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
                                            <li>
                                                <c:forEach  items="${requestScope.sizes}" var="s">
                                                    <c:if test="${s.productid==p.productId}">                                  
                                                        ${s.size} 
                                                    </c:if>
                                                </c:forEach>
                                            </li>
                                            <li class="pt-2">
                                                <span class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span>
                                                <span class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span>
                                                <span class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span>
                                                <span class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span>
                                                <span class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span>
                                            </li>
                                        </ul>

                                        <p class=" mb-0">
                                            <c:forEach  items="${requestScope.sum}" var="sum">
                                                <c:if test="${sum.productid==p.productId}">                                  
                                                    Quantity: ${sum.quantity} 
                                                </c:if>
                                            </c:forEach></p>

                                        <p class=" mb-0">Sold_quantity: ${p.sold_quantity}</p>

                                        <p class="text-center mb-0">${p.price}$</p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>





                    </div>

                    <div div="row">
                        <ul class="pagination pagination-lg justify-content-end">
                            <c:forEach  begin="1" end="${endP}" var="i">                                                                                                                      
                                <li class="page-item">
                                    <a class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark" href="list?index=${i}&search=${keys}&cid=${cids}&arrange=${arranges}">${i}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

                </div>

            </div>
        </div>
        <!-- End Content -->

        <%@include  file="Footer.jsp"%>




        <!-- Start Script -->
        <script type="text/javascript">
            function change() {
                document.getElementById("f1").submit();
            }
        </script>

        <script src="assets/js/jquery-1.11.0.min.js"></script>
        <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/templatemo.js"></script>
        <script src="assets/js/custom.js"></script>
        <!-- End Script -->
    </body>

</html>