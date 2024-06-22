<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="img/favicon.png" type="image/x-icon">
<title>Order successfully</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7">
	<%@include file="all_component/navbar.jsp"%>
	
	<div class="container text-center p-3 mt-4">
		<i class="fa-solid fa-circle-check fa-5x text-success"></i>
		<h1>Thank you</h1>
		<h2>Your Order successfully</h2>
		<h4>With in 7 days your product delivered at your address</h4>
		
		<a href="index.jsp" class="btn btn-primary">Home</a>
		<a href="order.jsp" class="btn btn-danger">View order</a>
	
	</div>
	
</body>
</html>