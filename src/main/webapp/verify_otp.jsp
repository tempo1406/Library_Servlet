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
        <link rel="stylesheet" href="./Resources/css/forgot.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="" crossorigin="anonymous" />
        <style>
            body, h2, span, a, input, p, h4 {
                font-family: 'Poppins', sans-serif;
            }
        </style>
    </head>
    <body>
        <div class="main">
            <section class="verify-otp">
                <div class="container">
                    <div class="verify-otp-content">
                        <h2 class="form-title" style="text-align: center">Xác minh OTP</h2>
                        <form role="form" method="post" action="${pageContext.request.contextPath}/VerifyOTP">
                            <input type="hidden" name="email" value="${param.email}" />
                            <div class="form-group">
                                <input type="text" name="otp" placeholder="Nhập OTP" required/>
                            </div>
                            <div class="form-group">
                                <input type="password" name="newPassword" placeholder="Nhập mật khẩu mới" required/>
                            </div>
                            <div style="color: red">${requestScope.error}</div>
                            <div class="form-group form-button">
                                <input type="submit" class="form-submit" value="Đổi mật khẩu"/>
                            </div>

                        </form>
                    </div>
                </div>
            </section>
        </div>
    </body>
</html>
