<%-- 
    Document   : shop-single
    Created on : Mar 13, 2024, 6:15:22 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Zay Shop - Product Detail Page</title>
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

        <!-- Slick -->
        <link rel="stylesheet" type="text/css" href="assets/css/slick.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/slick-theme.css">
        <!--
            
        TemplateMo 559 Zay Shop
        
        https://templatemo.com/tm-559-zay-shop
        
        -->
    </head>

    <body>
        <%@include  file="Header.jsp"%>

        <!-- Open Content -->
        <section class="bg-light">
            <div class="container pb-5">
                <div class="row">
                    <div class="col-lg-5 mt-5">
                        <div class="card mb-3">
                            <img class="card-img img-fluid" src="img/${productsById.image}" alt="Card image cap" id="product-detail">
                        </div>                 
                    </div>
                    <!-- col end -->
                    <div class="col-lg-7 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h1 class="h2">${productsById.productName}</h1>
                                <p class="h3 py-2">${productsById.price}$</p>

                                <ul class="list-inline">
                                    <li class="list-inline-item">
                                        <h6>Brand:</h6>
                                    </li>
                                    <li class="list-inline-item">
                                        <p class="text-muted"><strong>${productsById.category.categoryName}</strong></p>
                                    </li>
                                </ul>

                                <h6>Description: ${productsById.description}</h6>
                                
                                <ul class="list-inline">
                                    <li class="list-inline-item">
                                        <h6>Size/Quantity : 
                                            <c:forEach  items="${requestScope.sizes}" var="s">
                                                    <c:if test="${s.productid==productsById.productId}">
                                                ${s.size}/<span class="text-muted">${s.quantity}&nbsp;&nbsp;&nbsp;</span>
                                                </c:if>
                                                </c:forEach>
                                        </h6>
                                    </li>                              
                                </ul>
                                

                                <h6>Sold_quantity: ${productsById.sold_quantity}</h6>


                                <form action="addcart" >
                                    <input type="hidden" name="product-title" value="Activewear">
                                    <div class="row">
                                        <div class="col-auto">
                                            <ul class="list-inline pb-3">
                                                <li class="list-inline-item">Size :
                                                    <input type="hidden" name="product-size" id="product-size" value="S">
                                                </li>
                                                <c:forEach  items="${requestScope.sizes}" var="s">
                                                    <c:if test="${s.productid==productsById.productId}">                                  
                                                        <li class="list-inline-item"><span class="btn btn-success btn-size">${s.size}</span></li>
                                                        </c:if>
                                                    </c:forEach>

                                            </ul>
                                            
                                        </div>
                                        <input type="text" value="${productsById.productId}" name="productId" hidden="">
                                        <div class="col-auto">
                                            
                                            <ul class="list-inline pb-3">
                                                
                                                <li class="list-inline-item text-right">
                                                    Quantity
                                                    <input type="hidden" name="product-quanity" id="product-quanity" value="1">
                                                </li>
                                                <li class="list-inline-item"><span class="btn btn-success" id="btn-minus">-</span></li>
                                                <li class="list-inline-item"><span class="badge bg-secondary" id="var-value" >1</span></li>
                                                <li class="list-inline-item"><span class="btn btn-success" id="btn-plus">+</span></li>
                                            </ul>
                                        </div>
                                        <p style="color: red">${requestScope.mess}</p>
                                    </div>
                                    <div class="row pb-3">
                                        
                                        <div class="col d-grid">
                                            <button type="submit" class="btn btn-success btn-lg" name="submit" value="addtocard">Add To Cart</button>
                                        </div>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Close Content -->

        <!-- Start Article -->
        <section class="py-5">
            <div class="container">
                <div class="row text-left p-2 pb-3">
                    <h4>Best Selling</h4>
                </div>

                <!--Start Carousel Wrapper-->
                <div id="carousel-related-product">
                    <c:forEach  items="${requestScope.top4}" var="p"> 
                        <div class="p-2 pb-3">
                            <div class="product-wap card rounded-0">
                                <div class="card rounded-0">
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

            </div>


        </div>
    </section>
    <!-- End Article -->


    <%@include  file="Footer.jsp"%>

    <!-- Start Script -->
    <script src="assets/js/jquery-1.11.0.min.js"></script>
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/templatemo.js"></script>
    <script src="assets/js/custom.js"></script>
    <!-- End Script -->

    <!-- Start Slider Script -->
    <script src="assets/js/slick.min.js"></script>
    <script>
        $('#carousel-related-product').slick({
            infinite: true,
            arrows: false,
            slidesToShow: 4,
            slidesToScroll: 3,
            dots: true,
            responsive: [{
                    breakpoint: 1024,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 3
                    }
                },
                {
                    breakpoint: 600,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 3
                    }
                },
                {
                    breakpoint: 480,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 3
                    }
                }
            ]
        });
    </script>
    <!-- End Slider Script -->

</body>

</html>
