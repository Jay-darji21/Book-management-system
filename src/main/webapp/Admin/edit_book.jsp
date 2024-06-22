<%@page import="javax.print.attribute.HashPrintRequestAttributeSet"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.ThrowStatement"%>
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
<title>Admin : Add books</title>
</head>
<%@include file="allCss.jsp"%>
<body style="background-color: #f0f1f2;">
	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp"/>
	</c:if>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4 p-3">
				<div class="card">
					<div class="card-body">

						<h4 class="text-center">Edit book</h4>


						<%
						int id = Integer.parseInt(request.getParameter("id"));
						booksImpl dao = new booksImpl(DBconnect.getConn());
						bookDtls b = dao.getBookById(id);
						%>




						<form action="../edit_books" method="post">

							<input type="hidden" name="bookId" value="<%=id%>">

							<div class="form-group">
								<label for="exampleInputEmail1">Book name*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required"
									name="bookName" value="<%=b.getBookName()%>">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Author name*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required"
									name="authorName" value="<%=b.getAuthor()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Price*</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="price"
									value="<%=b.getPrice() %>">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Book category*</label> <select
									class="form-control" name="category" required="required">
									<option>New</option>
								</select>
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Books status*</label> <select
									class="form-control" name="status" required="required">
									<option>Active</option>
									<option>InActive</option>
								</select>
							</div>

							<div class="text-center">
								<a href="all_book.jsp"><button type="submit" class="btn btn-primary">Submit</button></a>
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>