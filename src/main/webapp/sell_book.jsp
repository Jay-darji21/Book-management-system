<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="img/favicon.png" type="image/x-icon">
<title>Sell Book</title>
</head>
<%@include file="all_component/allCss.jsp"%>
<body>

	<%
	User user = (User) session.getAttribute("userobj");
	%>


	<%-- Nav bar --%>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4 p-3">
				<div class="card">
					<div class="card-body">

						<h4 class="text-center">Sell book</h4>

						<c:if test="${ not empty succMsg }">
							<p class="text-center text-success">${ succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>


						<c:if test="${ not empty failedMsg }">
							<p class="text-center text-danger">${ failedMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<form action="old_book" method="post"
							enctype="multipart/form-data">
							
							<input type="hidden" value="<%=user.getEmail()%>" name="email2">
							
							<div class="form-group">
								<label for="exampleInputEmail1">Book name*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required"
									name="bookName">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Author name*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required"
									name="authorName">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Price*</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="price">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Book category*</label> <select
									class="form-control" required="required" name="category">
									<option>Old</option>
								</select>
							</div>



							<div class="form-group">
								<label for="exampleFormControlFile1">Upload photo*</label> <input
									type="file" class="form-control-file"
									id="exampleFormControlFile1" required="required" name="photo">
							</div>


							<div class="text-center">
								<button type="submit"
										class="btn btn-primary">Submit</button>
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>