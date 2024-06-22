<%@ page import="com.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<%
User us2 = (User) session.getAttribute("userobj");
%>

<div class="container-flues"
	style="height: 10px; background-color: #303f9f"></div>
<div class="container-fluidd p-3">
	<div class="row">
		<div class="col-md-3 text-success">
			<h3>
				<i class="fa-solid fa-book"></i> E-books
			</h3>
		</div>
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search" name="ch">
				<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>

		<div class="col-md-3">
			<!-- <a href="login.jsp" class="btn btn-success"><i class="fa-solid fa-user-plus"></i> Login</a> -->
			<!-- <a href="register.jsp" class="btn btn-primary"><i class="fa-solid fa-right-to-bracket"></i> Register</a> -->
			<c:if test="${not empty userobj}">
				<a href="cart.jsp?id=<%=us2.getId()%>"
					class="btn btn-danger text-white"><i
					class="fa-solid fa-cart-plus"></i> Cart</a>
				<a class="btn btn-success text-white"><i
					class="fa-solid fa-user"></i> ${userobj.name}</a>
				<a data-toggle="modal" data-target="#exampleModalCenter"
					class="btn btn-primary text-white"><i
					class="fa-solid fa-right-to-bracket"></i> Logout</a>
			</c:if>

			<c:if test="${empty userobj }">
				<a href="login.jsp" class="btn btn-success"><i
					class="fa-solid fa-user-plus"></i> Login</a>
				<a href="register.jsp" class="btn btn-primary"><i
					class="fa-solid fa-right-to-bracket"></i> Register</a>
			</c:if>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle"></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="text-center">
					<h4>Do you wants to logout ?</h4>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<a href="logout"><button type="button"
							class="btn btn-primary text-white">Logout</button></a>
				</div>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>

<!-- Logout modal end -->


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="#"><i
		class="fa-solid fa-house-chimney"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item custom-nav-item active"><a class="nav-link"
				href="index.jsp">Home <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="recent_allBooks.jsp"><i class="fa-solid fa-book-open"></i>
					Recent book</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="new_allBooks.jsp"><i class="fa-solid fa-book-open"></i>
					New book</a></li>

			<li class="nav-item active"><a class="nav-link disabled"
				href="old_allBooks.jsp"><i class="fa-solid fa-book-open"></i>
					Old book</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">

			<%
			if (us2 == null) {
			%>
				<a href="login.jsp" class="btn btn-light my-2 my-sm-0"
				type="submit"> <i class="fa-solid fa-gear"></i> Setting
			</a>
			<%
			} else {
			%>
			<a href="settings.jsp" class="btn btn-light my-2 my-sm-0"
				type="submit"> <i class="fa-solid fa-gear"></i> Setting
			</a>

			<%
			}
			%>
			
			<a href="helpline.jsp" class="btn btn-light my-2 my-sm-0 ml-1" type="submit">
				<i class="fa-solid fa-phone"></i> Contact Us
			</a>
		</form>
	</div>
</nav>