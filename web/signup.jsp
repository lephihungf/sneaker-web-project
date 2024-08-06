<!--
Author: Colorlib
Author URL: https://colorlib.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">       
        <style>
            body {
                margin: 0;
                padding: 0;
                background-color: #7c7672;
                height: 100vh;
            }
            #login .container #login-row #login-column #login-box {
                margin-top: 70px;
                max-width: 600px;
                height: 760px;
                border: 1px solid #9C9C9C;
                background-color: #e2e2e2;
            }
            form i {
                float: right;
                margin-left: -25px;
                margin-top: -25px;
                position: relative;
                z-index: 2;
            }
            #login .container #login-row #login-column #login-box #login-form {
                padding: 20px;
            }
        </style>
        
    </head>
    <body>
        <c:set var="cookie" value="${pageContext.request.cookies}"></c:set>
        <div id="login">
            <div class="container">
                <div id="login-row" class="row justify-content-center align-items-center">
                    <div id="login-column" class="col-md-6">
                        <div id="login-box" class="col-md-12">
                            <form action="signup" method="post">
                                <h3 class="text-center mt-3" style="color: #7c7672">Sign Up</h3>
                                <div style="color: red;">${mess}</div>
                                <c:if test="${requestScope.error!=null}"><p class="text-center text-danger">${requestScope.error}</p></c:if>
                                <div class="form-group">
                                    <label for="email"  style="color: #7c7672">Email:</label><br>
                                    <input type="email" name="email" id="email" class="form-control" placeholder="Email" >
                                </div>
                                <div class="form-group">
                                    <label for="username" style="color: #7c7672">Username:</label><br>
                                    <input type="text" name="username" id="username" class="form-control" placeholder="Username" >
                                    
                                </div>
                                <div class="form-group">
                                    <label for="password" style="color: #7c7672">Password:</label><br>
                                    <input type="password" name="password" id="password" class="form-control" placeholder="Password" >
                                    <i class="fas fa-eye" id="togglePassword"></i>
                                </div>
                                <div class="form-group">
                                    <label for="re-password" style="color: #7c7672">Re_password:</label><br>
                                    <input type="password" name="re_password" id="re_password" class="form-control" placeholder="Re_password:" >
                                    <i class="fas fa-eye" id="togglePassword"></i>
                                </div>
                                <div class="form-group">
                                    <label for="FullName" style="color: #7c7672">FullName:</label><br>
                                    <input type="text" name="fullname" id="FullName" class="form-control" placeholder="FullName" >
                                    
                                </div>
                                <div class="form-group">
                                    <label for="Phone" style="color: #7c7672">Phone:</label><br>
                                    <input type="number" name="phone" id="Phone" class="form-control" placeholder="Phone" >
                                    
                                </div>
                                <div class="form-group">
                                    <label for="Address" style="color: #7c7672">Address:</label><br>
                                    <input type="text" name="address" id="Address" class="form-control" placeholder="Address" >
                                    
                                </div>
                                <div class="form-group">
                                    <input type="submit" name="submit" class="btn btn-success btn-md col-md-12" value="Login">
                                </div>                          
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script >
            const togglePassword = document.querySelector("#togglePassword");
            const password = document.querySelector("#password");
            togglePassword.addEventListener("click", function () {
            // toggle the type attribute
                const type = password.getAttribute("type") === "password" ? "text" : "password";
                password.setAttribute("type", type);

            // toggle the icon
                this.classList.toggle("fa-eye-slash");
            });
        </script>
    </body>
</html>