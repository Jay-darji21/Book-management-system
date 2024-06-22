<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : Home</title>
<link rel="icon" href="../img/favicon.png" type="image/x-icon">
<%@include file="allCss.jsp"%>
</head>

<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}
</style>


<body>
	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp"/>
	</c:if>

	<h1 class="text-center mt-2">Welcome, admin</h1>
	<div class="container">
		<div class="row p-5">
			<div class="col-md-3">
				<a href="add_books.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-square-plus fa-3x text-primary"></i>
							<h4>Add books</h4>
							------------------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="all_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open fa-3x text-danger"></i>
							<h4>All books</h4>
							------------------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-box-open fa-3x text-warning"></i>
							<h4>View orders</h4>
							------------------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="" data-toggle="modal" data-target="#exampleModalCenter">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-right-from-bracket fa-3x text-primary"></i>
							<h4>Logout</h4>
							------------------
						</div>
					</div>
				</a>
			</div>


		</div>
	</div>

	<div style="margin-top: 181px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>