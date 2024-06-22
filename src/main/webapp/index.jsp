<%@page import="com.entity.bookDtls"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.DB.DBconnect"%>
<%@ page import="com.DAO.booksImpl"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.User"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="img/favicon.png" type="image/x-icon">
<title>E-book System</title>
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

	<%
	User us = (User) session.getAttribute("userobj");
	%>

	<c:if test="${not empty succMsg }">
		<div class="alert alert-success text-center" role="alert">${succMsg }</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<div class="alert alert-danger text-center" role="alert">${failedMsg }</div>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<%-- Book image --%>
	<div class="container-fluid back-img"></div>


	<%-- Recent book start --%>

	<div class="container">
		<h3 class="text-center">Recent books</h3>
		<div class="row">
			<%
			booksImpl dao2 = new booksImpl(DBconnect.getConn());
			List<bookDtls> list2 = dao2.recentbooks();

			for (bookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card card-ho">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category :
							<%=b.getCategory()%></p>

						<%
						if (b.getCategory().equals("Old")) {
						%>
						<div class="row">
							<a href="view_book.jsp?id=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
						<%
						} else {
						%>
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
						<%
						}
						%>

					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="recent_allBooks.jsp" class="btn btn-danger text-white">View
				all</a>

		</div>
	</div>

	<%-- Recent book end --%>

	<hr>

	<%-- New book start --%>

	<div class="container">
		<h3 class="text-center">New books</h3>
		<div class="row">

			<%
			booksImpl dao = new booksImpl(DBconnect.getConn());
			List<bookDtls> list = dao.getNewBook();

			for (bookDtls b : list) {
			%>
			<div class="col-md-3">
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
		<div class="text-center mt-1">
			<a href="new_allBooks.jsp" class="btn btn-danger text-white">View
				all</a>

		</div>
	</div>

	<%-- New book end --%>

	<hr>

	<%-- Old books start --%>

	<div class="container">
		<h3 class="text-center">Old books</h3>
		<div class="row">

			<%
			booksImpl dao3 = new booksImpl(DBconnect.getConn());
			List<bookDtls> list3 = dao3.oldBooks();

			for (bookDtls b : list3) {
			%>

			<div class="col-md-3">
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
							<a href="view_book.jsp?id=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
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
		<div class="text-center mt-1">
			<a href="old_allBooks.jsp" class="btn btn-danger text-white">View
				all</a>

		</div>
	</div>


	<%-- Old book end --%>

	<%@include file="all_component/footer.jsp"%>



</body>
</html>