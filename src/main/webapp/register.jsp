<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored = "false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="img/favicon.png" type="image/x-icon">
<title>Ebook : Register</title>
<%@include file="all_component/allCss.jsp"%>
</head>

<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

	<%-- Form --%>

	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center" id="message">Register</h4>
						
						<c:if test = "${not empty succMsg }">
							<p class="text-center text-success">${succMsg } </p>
							<c:remove var="succMsg" scope="session"/>
						</c:if>
						
						<c:if test = "${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg } </p>
							<c:remove var="failedMsg" scope="session"/>
						</c:if>
						
							
						
						
						<form action="register" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter full name*</label> <input
									type="text" class="form-control" id="exampleInputName"
									aria-describedby="emailHelp" required="required" name="fname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address*</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Phone number*</label> <input
									type="number" class="form-control" id="exampleInputNumber"
									aria-describedby="emailHelp" required="required" name="phno">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password*</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="password">
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree terms & conditions*</label>
							</div>
							<div class="text-center mt-1">
								<button type="submit" class="btn btn-primary center-form">Submit</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>
