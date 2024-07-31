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
            <section class="forgot-password">
                <div class="container">
                    <div class="forgot-password-content">
                        <div class="forgot-password-form">
                            <h2 class="form-title">Quên Mật Khẩu</h2>
                            <form method="post" action="${pageContext.request.contextPath}/SendOTP">
                                <div class="form-group">
                                    <i class="fas fa-envelope left"></i>
                                    <input type="email" name="email" placeholder="Nhập email của bạn" required/>
                                </div>
                                <h4 style="color: red; padding-top: 10px; font-weight: 400">${requestScope.error}</h4>
                                <div class="form-group form-button">
                                    <input type="submit" name="send_otp" class="form-submit" value="Gửi OTP"/>
                                </div>
                                <div class="error-message">${errorString}</div>
                            </form>
                        </div>
                        <div class="forgot-password-image">
                            <figure><img src="Resources/img/AdminLTELogo.jpg" alt="forgot password image"></figure>
                            <div style="display: flex; justify-content: center; font-size: 16px">
                                <span>Quay lại trang đăng nhập ?</span>&nbsp;
                                <a href="${pageContext.request.contextPath}/Login" style="display: contents; color: #2a8341;">Đăng nhập</a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </body>
</html>
