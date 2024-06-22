<%@ page import="com.entity.User"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="img/favicon.png" type="image/x-icon">
<title>User Address</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7">

	<%@include file="all_component/navbar.jsp"%>

	<%
	User u2 = (User) session.getAttribute("userobj");
	%>

	<div class="container">
		<div class="row p-2">

			<div class="col-md-6 offset-md-3 p-3">
				<div class="card" style="backgroud-color: white">
					<div class="card-body">
						<h3 class="text-center p-2">Edit your address</h3>
						<form>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Address</label> <input type="text"
										class="form-control" id="inputEmail4" placeholder="Address"
										value="<%=u2.getAddress()%>">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Landmark</label> <input type="email"
										class="form-control" id="inputPassword4" placeholder="Landmark"
										value="<%=u2.getLandmark()%>">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="inputEmail4">City</label> <input type="text"
										class="form-control" id="inputEmail4" placeholder="City"
									 value="<%=u2.getCity()%>">
								</div>
								<div class="form-group col-md-4">
									<label for="inputPassword4">State</label> <input type="text"
										class="form-control" id="inputPassword4" placeholder="State"
										required="required" value="<%=u2.getState() %>">
								</div>
								<div class="form-group col-md-4">
									<label for="inputPassword4">Zip</label> <input type="number"
										class="form-control" id="inputPassword4" placeholder="Zip"
										required="required" value="<%=u2.getZip() %>">
								</div>
							</div>

							
							<div class="text-center">
								<a href="" class="btn btn-warning"><b>Submit</b></a>
							</div>


						</form>

					</div>
				</div>
			</div>

		</div>
	</div>



</body>
</html>