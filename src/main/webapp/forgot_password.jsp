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
    <section class="forgot-password">
        <div class="container">
            <div class="forgot-password-content">
                <h2 class="form-title">Quên mật khẩu</h2>
                <form role="form" method="post" action="${pageContext.request.contextPath}/SendOTP">
                    <div class="form-group">
                        <input type="email" name="email" placeholder="Nhập email của bạn" required/>
                    </div>
                    <div style="color: red;">${error}</div> 
                    <div class="form-group form-button">
                        <input type="submit" class="form-submit" value="Gửi OTP"/>
                    </div>
                </form>
            </div>
        </div>
    </section>
</div>
</body>
</html>
