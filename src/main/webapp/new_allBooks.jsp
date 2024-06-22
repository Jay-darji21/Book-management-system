<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="com.entity.bookDtls"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.DB.DBconnect"%>
<%@ page import="com.DAO.booksImpl"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.User"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>New Books</title>
<link rel="icon" href="img/favicon.png" type="image/x-icon">
<%@include file="all_component/allCss.jsp"%>
</head>
<style type="text/css">
.back-img {
	background: url("img/book.png");
	height: 50vh;
	width: 100%;
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
}

.card-ho:hover {
	background-color: #fcf7f7;
	cursor: pointer;
}
</style>
<body style="background-color: #f7f7f7">



	<%-- Nav bar --%>
	<%@include file="all_component/navbar.jsp"%>
	
	<c:if test="${not empty succMsg }">
		<div class="alert alert-success text-center" role="alert">${succMsg }</div>
		<c:remove var="succMsg" scope="session"/>
	</c:if>
	
	<c:if test="${not empty failedMsg }">
		<div class="alert alert-danger text-center" role="alert">${failedMsg }</div>
		<c:remove var="failedMsg" scope="session"/>
	</c:if>

	<%
	User us = (User) session.getAttribute("userobj");
	%>



	<div class="container p-2">
		<h3 class="text-center mt-2">New books</h3>

		<c:if test="${not empty addCart }">
			<h5 class="text-center text-success">${addCart }</h5>
			<c:remove var="addCart" scope="session" />

		</c:if>

		<c:if test="${not empty failedMsg }">
			<h5 class="text-center text-success">${failedMsg }</h5>
			<c:remove var="failedMsg" scope="session" />

		</c:if>

		<div class="row">

			<%
			booksImpl dao = new booksImpl(DBconnect.getConn());
			List<bookDtls> list = dao.allNewBooks();

			for (bookDtls b : list) {
			%>
			<div class="col-md-3 mt-4">
				<div class="card card-ho">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category :
							<%=b.getCategory()%></p>
						<div class="row">
							<%
							if (us == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm "><i
								class="fa-solid fa-cart-plus"></i> Add cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=us.getId()%>"
								class="btn btn-danger btn-sm "><i
								class="fa-solid fa-cart-plus"></i> Add cart</a>

							<%
							}
							%>

							<a href="view_book.jsp?id=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>

	</div>



	<%@include file="all_component/footer.jsp"%>

</body>
</html>