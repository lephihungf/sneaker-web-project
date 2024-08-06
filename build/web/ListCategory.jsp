<%-- 
    Document   : ListCategory
    Created on : Mar 15, 2024, 3:37:38 PM
    Author     : Admin
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
        
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("are you sure to delete id = " + id)) {
                    window.location = "delete-category?id=" + id;
                }
            }
        </script>
        
    </head>
    <body>
        <%@include  file="Header.jsp"%>
        <div class="container py-5">
            <div class="row">
                <%@include file="SideBarAdmin.jsp" %>

                <div class="col-lg-9">
                    <div class="container" style="margin-top: -20px">
                <div>
                    <div class="container">
                        <a href="add-category" class="btn btn-success p-2" style="margin-bottom: 45px;margin-top: 30px">Add New Category</a>
                    </div>
                </div>
                <div class="container" style="margin-top: -30px">
                    <a href="list-category" style="text-decoration: none; color: inherit"><h2 style="color: chocolate">List Category</h2></a>
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr>
                                <th scope="col">CategooryID</th>
                                <th scope="col">Category Name</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:if test="${requestScope.list == null}">
                            <h2>No user was found</h2>
                        </c:if>
                        <c:if test="${requestScope.list != null}">
                            <c:forEach items = "${requestScope.list}" var="c">
                                <c:set var="id" value="${c.categoryId}"/> 
                                <tr>
                                    <td>${id}</td>
                                    <td>${c.categoryName}</td>
                                    <td>  
                                        
                                        <c:forEach items = "${requestScope.cnull}" var="cnull">
                                        <c:if test="${cnull.categoryId == id}">
                                        <a href="#" onclick="doDelete('${id}')" class="btn btn-danger">Delete</a>
                                        </c:if>
                                        </c:forEach>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>   
                        </tbody>
                    </table>
                    <c:if test="${requestScope.list != null}">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination  justify-content-end">
                                <li class="page-item ${requestScope.page == 1 ? "disabled" :""}"><a class="page-link" href="list-category?page=${requestScope.page-1}">Previous</a></li>
                                <c:forEach begin="1" end="${requestScope.endPage}" var="i">
                                    <li class="page-item ${requestScope.page ==i ?"active" :""}" ><a href="list-category?page=${i}" class="page-link" >${i}</a></li>
                                </c:forEach>
                                <li class="page-item ${requestScope.page == requestScope.endPage || requestScope.endPage ==0 ? "disabled" :""}"><a class="page-link" href="list-category?page=${requestScope.page+1}">Next</a></li>
                            </ul>
                        </nav>
                    </c:if>
                </div>
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
