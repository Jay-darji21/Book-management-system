<%@ page import="com.entity.User"%>
<%@ page import="com.DAO.bookOrderImpl"%>
<%@ page import="com.DB.DBconnect"%>
<%@ page import="java.util.*"%>
<%@ page import="com.entity.orders"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : All Orders</title>
<link rel="icon" href="../img/favicon.png" type="image/x-icon">
</head>
<%@include file="allCss.jsp"%>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp"/>
	</c:if>
	<h2 class="text-center mt-2">Hello , Admin</h2>
	<table class="table table-striped">
		<thead class="bg-dark text-white">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone no</th>
				<th scope="col">Book name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment</th>
			</tr>
		</thead>
		<tbody>
		
		<%
			bookOrderImpl dao = new bookOrderImpl(DBconnect.getConn());
			List<orders> list = dao.allOrders();
			
			for(orders o : list){
		%>		
			<tr class="text-danger">
				<th><%=o.getOrderId() %></th>
				<td><%=o.getUserName() %></td>
				<td><%=o.getEmail() %></td>
				<td><%=o.getAddress() %></td>
				<td><%=o.getPhone() %></td>
				<td><%=o.getBook_name() %></td>
				<td><%=o.getAuthor() %></td>
				<td><%=o.getPrice() %></td>
				<td><%=o.getPayment() %></td>
			</tr>
		
		<%		
			}
			
		%>
		
		
		</tbody>
	</table>
	
	<div style="margin-top: 241px;">
		<%@include file="footer.jsp" %>
	</div>
</body>
</html>