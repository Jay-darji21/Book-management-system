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
<link rel="icon" href="img/favicon.png" type="image/x-icon">
<title>Orders</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7">
	<%-- Nav bar --%>
	<%@include file="all_component/navbar.jsp"%>

	<h1 class="text-center">Your Orders</h1>



	<div class="container">
		<table class="table table-striped">
			<thead class="bg-primary">
				<tr>
					<th scope="col">Order id</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment mode</th>
				</tr>
			</thead>
			<tbody class="text-success">

				<%
				bookOrderImpl dao = new bookOrderImpl(DBconnect.getConn());
				User u = (User) session.getAttribute("userobj");
				String email = u.getEmail();
			
				List<orders> list = dao.getOrders(email);
				

				for (orders o : list) {
				%>
				<tr>
					
					<th><%=o.getOrderId()%></th>
					<th><%=o.getUserName()%></th>
					<th><%=o.getBook_name()%></th>
					<th><%=o.getAuthor()%></th>
					<th><%=o.getPrice()%></th>
					<th><%=o.getPayment()%></th>
				</tr>

				<%
				}
				%>
				



			</tbody>
		</table>
	</div>

</body>
</html>