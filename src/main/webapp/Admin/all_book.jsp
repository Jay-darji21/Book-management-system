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
<link rel="icon" href="../img/favicon.png" type="image/x-icon">
<title>Admin : All books</title>
</head>
<%@include file="allCss.jsp"%>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp"/>
	</c:if>
	<h2 class="text-center mt-2">Hello , Admin</h2>

	<c:if test="${ not empty succMsg }">
		<h5 class="text-center text-success">${ succMsg }</h5>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	
	<c:if test="${ not empty failedMsg }">
		<h5 class="text-center text-danger">${ failedMsg }</h5>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<table class="table table-striped">
		<thead class="bg-dark text-white">
			<tr>
				<th scope="col">Book Id</th>
				<th scope="col">Book Image</th>
				<th scope="col">Book name</th>
				<th scope="col">Author name</th>
				<th scope="col">Price</th>
				<th scope="col">Book categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>

			<%
			booksImpl dao = new booksImpl(DBconnect.getConn());
			List<bookDtls> list = dao.allBooks();
			for (bookDtls b : list) {
			%>
			<tr>
				<th><%=b.getBookId()%></th>
				<td><img src="../books/<%=b.getPhotoName()%>"
					style="width: 50px; height: 50px"></td>
				<td><%=b.getBookName()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getCategory()%></td>
				<td><%=b.getStatus()%></td>
				<%
				int id = b.getBookId();
				%>
				<td><a href="edit_book.jsp?id=<%=b.getBookId()%>"
					class="btn btn-sm btn-primary"><i class="fa-regular fa-pen-to-square"></i> Edit</a> 
					<a href="../delete?id=<%=b.getBookId() %>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash-can"></i> Delete</a></td>
			</tr>

			<%
			}
			%>


		</tbody>
	</table>
	<div style="margin-top: 221px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>