<%@ page import="com.entity.User"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="img/favicon.png" type="image/x-icon">
<title>Edit profile</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7">
	
	<%-- Nav bar --%>
	<%@include file="all_component/navbar.jsp"%>
	
	<%
	User u1 = (User) session.getAttribute("userobj");
	%>
	
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4 p-3">
				<div class="card">
					<div class="card-body">

						<h4 class="text-center">Edit profile</h4>
						
						
						
						
						<c:if test="${ not empty wrongPassword }">
							<p class="text-center text-danger">${ wrongPassword }</p>
							<c:remove var="wrongPassword" scope="session"/>
						</c:if>

						<form action="edit_profile" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
							<input type="hidden" value="<%=u1.getId()%>" name="uid">
								<label for="exampleInputEmail1">Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required"
									name="Name" value="<%=u1.getName() %>">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email Address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required"
									name="email" value="<%=u1.getEmail() %>">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Phone</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="phone" value="<%=u1.getPhno() %>">
							</div>
							
							<div class="form-group">
								<label for="exampleInputEmail1">Password</label> <input
									type="password" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="password">
							</div>
							
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Update</button>
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>