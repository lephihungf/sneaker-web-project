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
        
    </head>

    <body>
        <%@include  file="Header.jsp"%>



        <!-- Start Content -->
        <div class="container py-5">
            <div class="row">
                <%@include file="SideBarAdmin.jsp" %>
                
                <div class="col-lg-9">
                     <c:set var="user" value="${requestScope.data}"/>
            <div class="container mt-5">
                <h1 style="margin-bottom: 40px">Add User</h1>
                <form action="add-account" method="post">
                    <input value="${user.accountId}" name="id" hidden="">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputEmail4" style="font-weight: bold">Email</label>
                            <input type="email" class="form-control" id="inputEmail4" placeholder="Email" required=""  name="email">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputUsername4" style="font-weight: bold">Username: </label>
                            <input type="text" class="form-control" id="inputUsername4" placeholder="Username"  name="username">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-3">
                            <label for="fullname" style="font-weight: bold">Fullname</label>
                            <input type="text" class="form-control" id="fullname" name="fullname" >
                        </div>
                        <div class="form-group col-md-3">
                            <label for="inputPassword4" style="font-weight: bold">Password</label>
                            <input type="password" class="form-control" id="inputPassword4" placeholder="Password"  name="password">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="role" style="font-weight: bold">Role</label>
                            <select id="role" class="form-control" name="role">
                                <option >0</option>
                                <option >1</option>
                            </select>
                        </div>
                        <div class="form-group col-md-3">
                            <label for="phone" style="font-weight: bold">Phone</label>
                            <input type="text" class="form-control" id="phone" name="phone" >
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-10">
                            <label for="address" style="font-weight: bold">Address: </label>
                            <input type="text" class="form-control" id="address" placeholder="Adderss"  name="address">
                        </div>
                        <div class="form-group col-md-2">
                            <label for="gender" style="font-weight: bold">Gender</label>
                            <select id="gender" class="form-control" name="gender">
                                <option>0</option>
                                <option>1</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlFile1" style="font-weight: bold">Image</label>
                            <input type="file" class="form-control-file" accept="image/*" onchange="loadFile(event)" id="exampleFormControlFile1" name="image">
                            <img id="output" style="width: 200px;height: 200px;object-fit: cover"/>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary updateBtn">ADD</button>
                </form>
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
        <script>
                        var loadFile = function (event) {
                            var output = document.getElementById('output');
                            output.src = URL.createObjectURL(event.target.files[0]);
                            output.onload = function () {
                                URL.revokeObjectURL(output.src);
                            }
                        };
    </script>  
    </body>

</html>