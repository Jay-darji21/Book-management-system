<%@page import="com.entity.bookDtls"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.DB.DBconnect"%>
<%@ page import="com.DAO.booksImpl"%>
<%@ page import="java.util.List"%>
<%@ page import = "com.entity.User" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="img/favicon.png" type="image/x-icon">
<title>View book details</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">

	<%@include file="all_component/navbar.jsp"%>
	
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		booksImpl dao = new booksImpl(DBconnect.getConn());
		bookDtls b = dao.getBookById(id);
	
	%>
	<%
		User us = (User)session.getAttribute("userobj");
		
	%>
	

	<div class="container p-3">
		<div class="row mt-3">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="books/<%=b.getPhotoName() %>" style="width: 150px; height: 200px">
				<h4 class="mt-3">Book name : <span class="text-success"><b><%=b.getBookName() %></b></span></h4>
				<h4>Author name :<span class="text-success"><b><%=b.getAuthor() %></b></span> </h4>
				<h4>Price : <span class="text-success"><b><%=b.getPrice() %>/-</b></span></h4>

			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2 class="mt-5"><%=b.getBookName() %></h2>
				
				<%if("Old".equals(b.getCategory())){
				%>
					<h5 class="text-primary">Contact to seller</h5>
					<h6 class="text-primary"><i class="fa-solid fa-envelope"></i> <%=b.getEmail() %></h6>
				<% 		
				} %>
				
				
				<div class="row mt-4">

					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-money-bill-wave fa-2x"></i>
						<h5>Cash on delivery</h5>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<h5>Return available</h5>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-truck-moving fa-2x"></i>
						<h5>Free delivery</h5>
					</div>
				</div>
				
				<div class="text-center p-3">
				<%if("Old".equals(b.getCategory())){
				%>	
					<a href="index.jsp" class="btn btn-success">Continue shopping</a>
				<%	
				} else{
				%>	
							<%
							if(us==null){
						%>		
							<a href="login.jsp" class="btn btn-success"><i
								class="fa-solid fa-cart-plus"></i> Add cart</a>
						<%		
							}else{
						%>
							<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=us.getId() %>" class="btn btn-success"><i
								class="fa-solid fa-cart-plus"></i> Add cart</a>
								
						<%		
							}
						%>
				<% 		
				}%>
				
					
					<a href="" class="btn btn-danger ml-2"><i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice() %></a>
				</div>
			</div>
		</div>
	</div>


</body>
</html>