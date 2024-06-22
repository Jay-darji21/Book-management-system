<%@page import="com.entity.bookDtls"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.DB.DBconnect"%>
<%@ page import="com.DAO.booksImpl"%>
<%@ page import="java.util.List"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="img/favicon.png" type="image/x-icon">
<title>Old Books</title>
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


	<div class="container p-2">
		<h3 class="text-center mt-2">Old books</h3>
		<div class="row">
			<%
			booksImpl dao2 = new booksImpl(DBconnect.getConn());
			List<bookDtls> list2 = dao2.allOldBooks();

			for (bookDtls b : list2) {
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

						<%
						if (b.getCategory().equals("Old")) {
						%>
						<div class="row">
							<a href="view_book.jsp?id=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
						<%
						} else {
						%>
						<div class="row">
							<a href="" class="btn btn-danger btn-sm "><i
								class="fa-solid fa-cart-plus"></i> Add cart</a> <a href="view_book.jsp?id=<%=b.getBookId()%>"
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
		
	</div>
	
	<%@include file="all_component/footer.jsp"%>

</body>
</html>