<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                            <h2 class="form-title">Đăng nhập</h2>
                            <form role="form" method="post" action="${pageContext.request.contextPath}/Login">
                                <div class="row justify-content-center card-body" style="margin-bottom: -34px;">
                                    <div style="color: red;">${errorString}</div>
                                    <div class="form-group">
                                        <i class="fas fa-user left"></i>
                                        <input type="text" name="username" placeholder="Tên tài khoản" value="${param.username != null ? param.username : sessionScope.user.username}" required/>
                                    </div>
                                    <div class="form-group">
                                        <i class="fas fa-lock left"></i>
                                        <input type="password" id="password" name="password" placeholder="Mật khẩu" required/>
                                        <i class="fa-regular fa-eye" id="togglePassword" onclick="togglePasswordVisibility()"></i>
                                    </div>
                                    <h4 style="color: red; padding-top: 10px; font-weight: 400">${requestScope.error}</h4>
                                    <div class="form-group form-button">
                                        <input type="submit" class="form-submit" value="Đăng nhập"/>
                                    </div>
                                </div>
                            </form>
                            <a href="${pageContext.request.contextPath}/SendOTP" style="display: contents; color: #2a8341;">Quên mật khẩu?</a>
                        </div>
                        <div class="signup-image">
                            <figure><img src="Resources/img/AdminLTELogo.jpg" alt="sign up image"></figure>
                            <div style="display: flex; justify-content: center; font-size: 16px">
                                <span>Bạn chưa có tài khoản?</span>&nbsp
                                <a href="${pageContext.request.contextPath}/Signup" style="display: contents; color: #2a8341;">Đăng kí</a>
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
        </script>
    </body>
</html>

