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
                
                <div class="col-lg-9">
                <div>
                    <div class="container">
                        <a href="list-category" class="btn btn-warning p-3" style="margin-bottom: 45px;margin-top: 30px;background-color: #59ab6e; color: White ">List Category</a>
                        <a href="add-product" class="btn btn-success p-3" style="margin-bottom: 45px;margin-top: 30px; background-color: #59ab6e">Add New Product</a>
                    </div>
                </div>
                    
                <div class="container" style="margin-top: -30px">
                    <a href="list-product" style="text-decoration: none; "><h1 style="color: #58abff">List Product</h1></a>
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr>
                                <th scope="col">Product ID</th>
                                <th scope="col">Image</th>
                                <th scope="col">Name</th>
                                <th scope="col">Category</th>
                                <th scope="col">Price</th>
                                <th scope="col">Size:Quantity</th>
                                <th scope="col">Sold Quantity</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>  
                            <c:if test="${requestScope.list == null}">
                            <h2>No product was found</h2>
                        </c:if>
                        <c:if test="${requestScope.list != null}">
                            <c:forEach items = "${requestScope.list}" var="c">
                                <c:set var="id" value="${c.productId}"/> 
                                <tr>
                                    <td>${id}</td>
                                    <td style="width: 300px;height: 100px"><img class="card-img rounded-0 img-fluid" Style="" src="img/${c.image}"></td>
                                    <td>${c.productName}</td>
                                    <c:forEach var="a" items="${requestScope.catelist}">
                                        <c:if test="${a.categoryId == c.category.categoryId}">
                                            <td>${a.categoryName}</td>
                                        </c:if>
                                    </c:forEach>
                                            <td>${c.price}</td>
                                             
                                            <td>
                                                <c:forEach  items="${requestScope.size}" var="s">
                                                    <c:if test="${s.productid==c.productId}">
                                                ${s.size}:${s.quantity}<br>
                                                </c:if>
                                                </c:forEach>
                                                
                                            </td>
                                            
                                            <td>${c.sold_quantity}</td>
                                            <td style="">
                                                <a class="btn btn-success text-white" href="update-product?id=${id}">Update</i></a>
                                                <a class="btn btn-danger text-white" href="#" onclick="doDelete('${id}')"  ">Delete</i></a>
                                                
                                            </td>
                                </tr>
                            </c:forEach>
                        </c:if>   
                        </tbody>
                    </table>
                    <c:if test="${requestScope.list != null}">
                        <nav aria-label="Page navigation example" >
                            <ul class="pagination pagination-lg justify-content-end">
                                <li class="page-item ${requestScope.page == 1 ? "disabled" :""}"><a class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark" href="list-product?page=${requestScope.page-1}">Previous</a></li>
                                    <c:forEach begin="1" end="${requestScope.endPage}" var="i">
                                    <li class="page-item ${requestScope.page ==i ?"active " :""} " ><a class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark" href="list-product?page=${i}"  >${i}</a></li>
                                    </c:forEach>
                                <li class="page-item ${requestScope.page == requestScope.endPage || requestScope.endPage == 0 ? "disabled" :""}"><a class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark" href="list-product?page=${requestScope.page+1}">Next</a></li>
                            </ul>
                        </nav>
                    </c:if>
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