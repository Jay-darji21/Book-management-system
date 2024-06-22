<%@page import="com.entity.bookDtls"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.DB.DBconnect"%>
<%@ page import="com.DAO.booksImpl"%>
<%@ page import="java.util.List"%>
<%@ page import="com.DAO.cartDAOImpl"%>
<%@ page import="com.entity.Cart"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="img/favicon.png" type="image/x-icon">
<title>User cart</title>


<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7">

	<%-- Nav bar --%>
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${not empty succMsg }">
		<div class="alert alert-success" role="alert">${succMsg }</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<div class="alert alert-danger" role="alert">${failedMsg }</div>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<%
	int userId = Integer.parseInt(request.getParameter("id"));
	cartDAOImpl dao = new cartDAOImpl(DBconnect.getConn());
	List<Cart> list = dao.getUserBooks(userId);
	User u = (User) session.getAttribute("userobj");
	%>

	<%-- Cart --%>
	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">
				<div class="card" style="backgroud-color: white">
					<div class="card-body">
						<h3 class="text-center text-success">Your selected Items</h3>

						<table class="table table-striped">
							<thead class="bg-primary text-white">
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								double sum = 0.0;
								for (Cart b : list) {
									sum = sum + b.getPrice();
								%>

								<tr>
									<th scope="row"><%=b.getBookName()%></th>
									<td><%=b.getAuthorName()%></td>
									<td><%=b.getPrice()%></td>
									<td><a
										href="remove_book?bid=<%=b.getBookId()%>&&uid=<%=userId%>&&cid=<%=b.getCartId()%>"
										class="btn btn-sm btn-danger text-white">Remove</a></td>
								</tr>

								<%
								}
								%>

								<tr class="bg-warning">
									<th>Total price</th>
									<td></td>
									<td><b><%=sum%></b></td>
									<td></td>
								</tr>


							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card" style="backgroud-color: white">
					<div class="card-body">
						<h3 class="text-center text-success">Your details for order</h3>


						<form action="orders" method="post">
							<input type="hidden" value="<%=u.getId()%>" name="uid">

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										class="form-control" id="inputEmail4" placeholder="Name"
										value="<%=u.getName()%>" name="name" readonly="readonly">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email"
										class="form-control" id="inputPassword4" placeholder="Email"
										value="<%=u.getEmail()%>" name="email" readonly="readonly">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone no.</label> <input type="number"
										class="form-control" id="inputEmail4" placeholder="Phone no."
										value="<%=u.getPhno()%>" name="phno">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" id="inputPassword4" placeholder="Address"
										required="required" name="address">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										class="form-control" id="inputEmail4" placeholder="Landmark"
										required="required" name="landmark">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text"
										class="form-control" id="inputPassword4" placeholder="City"
										required="required" name="city">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" id="inputEmail4" placeholder="State"
										required="required" name="state">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Pincode</label> <input
										type="number" class="form-control" id="inputPassword4"
										placeholder="Pincode" required="required" name="pincode">
								</div>
							</div>

							<div class="form-group">
								<label for="inputState"> --Payment mode-- </label> <select
									id="inputState" class="form-control" name="payment">
									<option>COD</option>

								</select>
							</div>
							<div class="text-center">

								<button type="submit" 
									class="btn btn-warning text-black" <%if (sum == 0.0) {%>
									disabled <%}%>>
									<b>Place order</b>
								</button>


								<a href="index.jsp" class="btn btn-success"><b>Continue
										shopping</b></a>
							</div>

						</form>

					</div>
				</div>
			</div>

		</div>
	</div>

	


</body>
</html>