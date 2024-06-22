<%@ page import="com.entity.User"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="img/favicon.png" type="image/x-icon">
<title>Setting</title>
<%@include file="all_component/allCss.jsp"%>

<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: blue;
	cursor: pointer;
}
</style>


</head>
<body style="background-color: #f7f7f7">

	<%-- Nav bar --%>
	<%@include file="all_component/navbar.jsp"%>
	<%
	User us3 = (User) session.getAttribute("userobj");
	%>
	
	<c:if test="${not empty succMsg }">
		<div class="alert alert-success text-center" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session"/>
	</c:if>

	<c:if test="${not empty failedMsg }">
		<div class="alert alert-danger text-center" role="alert">${failedMsg}</div>
		<c:remove var="failedMsg" scope="session"/>
	</c:if>
	
	<c:if test="${not empty wrongPassword }">
		<div class="alert alert-danger text-center" role="alert">${wrongPassword}</div>
		<c:remove var="wrongPassword" scope="session"/>
	</c:if>

	<h2 class="text-center">
		Hello ,
		<%=us3.getName()%></h2>

	<div class="container">
		<div class="row p-5">

			<div class="col-md-4">
				<a href="sell_book.jsp">
					<div class="card bg-white p-2">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open fa-3x text-primary text-center"></i>
							<h3 class="text-center">Sell old book</h3>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4">
				<a href="edit_oldBook.jsp">
					<div class="card bg-white p-2">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open fa-3x text-danger text-center"></i>
							<h3>Your old books</h3>
						</div>
					</div>
				</a>
			</div>


			<div class="col-md-4">
				<a href="edit_profile.jsp">
					<div class="card bg-white p-2">
						<div class="card-body text-center">
							<i
								class="fa-solid fa-address-card fa-3x text-primary text-center"></i>
							<h3>Edit profile</h3>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-6 mt-4">
				<a href="order.jsp">
					<div class="card bg-white p-2">
						<div class="card-body text-center">
							<i class="fa-solid fa-box-open fa-3x text-danger"></i>
							<h3>My Order</h3>
							<p>Track your order</p>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-6 mt-4 p-2">
				<a href="helpline.jsp">
					<div class="card bg-white">
						<div class="card-body text-center">
							<i class="fa-solid fa-user-circle fa-3x text-warning"></i>
							<h3>Help center</h3>
							<p>24 X 7 Service</p>
						</div>
					</div>
				</a>
			</div>


		</div>


	</div>


	<%@include file="all_component/footer.jsp"%>



</body>
</html>