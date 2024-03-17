<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<%@include file="all_css.jsp"%>
</head>
<body>

	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>

		<h2>Add Note. </h2>
		<br>

		<!-- this is add form  -->

		<form action="saveservelet" method="post">

			<div class="form-group">
				<label for="title"><h4>Note Title.</h4></label> 
				<input 
				name="title"
				required 
				type="text"
				class="form-control" 
				id="title" 
				aria-describedby="emailHelp"
				placeholder="Enter Title Here... "/>

			</div>


			<div class="form-group">
				<label for="content"><h4>Note Content.</h4></label>
				<textarea 
				name="contant"
				required 
				id="content"
				placeholder="Enter Content Here... "				 
				class="form-control" 
				style="height: 300px;"		
					></textarea>


			</div>

			<div class="container   ">
			<button type="submit" class="btn btn-primary">Add</button>
			</div>

		</form>

	</div>


</body>
</html>