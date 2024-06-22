<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="../img/favicon.png" type="image/x-icon">
<title>Admin : Add books</title>
</head>
<%@include file="allCss.jsp"%>
<body style="background-color: #f0f1f2;">
	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp"/>
	</c:if>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4 p-3">
				<div class="card">
					<div class="card-body">

						<h4 class="text-center">Add books</h4>
						
						<c:if test="${ not empty succMsg }">
							<p class="text-center text-success">${ succMsg }</p>
							<c:remove var="succMsg" scope="session"/>
						</c:if>
						
						
						<c:if test="${ not empty failedMsg }">
							<p class="text-center text-danger">${ failedMsg }</p>
							<c:remove var="succMsg" scope="session"/>
						</c:if>

						<form action="../add_books" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputEmail1">Book name*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required"
									name="bookName">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Author name*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required"
									name="authorName">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Price*</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="price">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Book category*</label> <select
									class="form-control" required="required" name="category">
									<option>--Select--</option>
									<option>New</option>
								</select>
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Books status*</label> <select
									class="form-control" required="required" name="status">
									<option>--Select--</option>
									<option>Active</option>
									<option>InActive</option>
								</select>
							</div>

							<div class="form-group">
								<label for="exampleFormControlFile1">Upload photo*</label> <input
									type="file" class="form-control-file"
									id="exampleFormControlFile1" required="required" name="photo">
							</div>


							<div class="text-center">
								<button type="submit" class="btn btn-primary">Add</button>
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>