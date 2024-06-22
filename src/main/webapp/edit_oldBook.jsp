<%@ page import="com.DAO.booksImpl"%>
<%@ page import="com.DB.DBconnect"%>
<%@ page import="java.util.*"%>
<%@ page import="com.entity.bookDtls"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="img/favicon.png" type="image/x-icon">
<title>User : Old books</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	
	<%
	User us4 = (User) session.getAttribute("userobj");
	%>
	
	<h2 class="text-center mt-2">Hello , <%=us4.getName() %></h2>

	<c:if test="${ not empty succMsg }">
		<h5 class="text-center text-success">${ succMsg }</h5>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	
	<c:if test="${ not empty failedMsg }">
		<h5 class="text-center text-danger">${ failedMsg }</h5>
		<c:remove var="failedMsg" scope="session" />
	</c:if>
	
	<div class="container">

	<table class="table table-striped">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Book Id</th>
				<th scope="col">Book name</th>
				<th scope="col">Author name</th>
				<th scope="col">Price</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>

			<%
			String email = us4.getEmail();
			booksImpl dao = new booksImpl(DBconnect.getConn());
			List<bookDtls> list = dao.getUserOldBooks(email, "Old");
			for (bookDtls b : list) {
			%>
			<tr>
				<th><%=b.getBookId()%></th>
				<td><%=b.getBookName()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><a href="remove_old_book?bid=<%=b.getBookId() %>" class="btn btn-sm btn-danger">Remove</a></td>
			</tr>

			<%
			}
			%>


		</tbody>
	</table>
	</div>
	
</body>
</html>