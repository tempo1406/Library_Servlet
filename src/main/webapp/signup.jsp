<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
            <link rel="stylesheet" href="./Resources/css/signupCSS.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="" crossorigin="anonymous" />
        <style>
            body, h2, span, a, input, p, h4 {
                font-family: 'Poppins', sans-serif;
            }
        </style>
    </head>
    <body>

        <div class="main">
            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <div class="signup-form">
                            <h2 class="form-title">Đăng kí</h2>
                            <form method="post" action="${pageContext.request.contextPath}/Signup">
                                <div class="form-group" style="display: flex">
                                    <i class="fas fa-user left"></i>
                                    <input type="text" name="username" placeholder="Tài khoản" value="${param.username != null ? param.username : sessionScope.username}" required/>
                                </div>

                                <div class="form-group">
                                    <i class="fas fa-envelope left"></i>
                                    <input type="email" name="email" placeholder="Email" value="${param.email != null ? param.email : sessionScope.email}" required/>
                                </div>

                                <div class="form-group">
                                    <i class="fas fa-lock left"></i>
                                    <input type="password" id="password" name="password" placeholder="Mật khẩu" required/>
                                    <i class="fa-regular fa-eye" id="togglePassword" onclick="togglePasswordVisibility()" style="position: absolute; right: 10px; cursor: pointer;"></i>
                                </div>
                                <div class="form-group">
                                    <i class="fas fa-lock left"></i>
                                    <input type="password" id="re_password" name="re_password" placeholder="Xác nhận lại mật khẩu" required/>
                                    <i class="fa-regular fa-eye" id="togglePassword1" onclick="togglePasswordVisibility1()" style="position: absolute; right: 10px; cursor: pointer;"></i>
                                </div>
                                <h4 style="color: red; padding-top: 10px; font-weight: 400">${requestScope.error}</h4>
                                <div class="form-group form-button">
                                    <input type="submit" name="signup" class="form-submit" value="Đăng kí"/>
                                </div>
                                <div class = "error-message">${errorString}</div>
                            </form>
                        </div>
                        <div class="signup-image" >
                            <figure><img src="Resources/img/AdminLTELogo.jpg" alt="sign up image"></figure>
                            <div style="display: flex; justify-content: center; font-size: 16px">
                                <span>Bạn đã có tài khoản ?</span>&nbsp;
                                <a href="${pageContext.request.contextPath}/Login" style="display: contents; color: #2a8341;">Đăng nhập</a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <script>
            function togglePasswordVisibility() {
                const passwordField = document.getElementById('password');
                const togglePassword = document.getElementById('togglePassword');
                if (passwordField.type === 'password') {
                    passwordField.type = 'text';
                    togglePassword.classList.remove('fa-eye');
                    togglePassword.classList.add('fa-eye-slash');
                } else {
                    passwordField.type = 'password';
                    togglePassword.classList.remove('fa-eye-slash');
                    togglePassword.classList.add('fa-eye');
                }
            }

            function togglePasswordVisibility1() {
                const passwordField = document.getElementById('re_password');
                const togglePassword = document.getElementById('togglePassword1');
                if (passwordField.type === 'password') {
                    passwordField.type = 'text';
                    togglePassword.classList.remove('fa-eye');
                    togglePassword.classList.add('fa-eye-slash');
                } else {
                    passwordField.type = 'password';
                    togglePassword.classList.remove('fa-eye-slash');
                    togglePassword.classList.add('fa-eye');
                }
            }
        </script>
    </body>
</html>
