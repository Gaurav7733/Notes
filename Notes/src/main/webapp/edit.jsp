<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.Help.*,org.hibernate.*,com.Note.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<h2>Show Note. </h2>
		<br>

		<%
			int noteId = Integer.parseInt(request.getParameter("note_id").trim());
		Session s = factor.getFactory().openSession();
		Notes note = (Notes) s.get(Notes.class, noteId);
		%>


		<form action="UpdateServlet" method="post">

			<input value="<%=note.getId()%>" name="noteId" type="hidden" />

			<div class="form-group">
				<label for="title"><h4>Note Title.</h4></label> <input name="title" required
					type="text" class="form-control" id="title"
					aria-describedby="emailHelp" placeholder="Enter here"
					value="<%=note.getTitle()%>" />

			</div>


			<div class="form-group">
				<label for="content"><h4>Note Content.</h4></label>
				<textarea name="content" required id="content"
					placeholder="Enter your content here" class="form-control"
					style="height: 300px;"><%=note.getContent()%>
					</textarea>


			</div>

			<div class="container text-center">

				<button type="submit" class="btn btn-success">save</button>
			</div>

		</form>


	</div>
</body>
</html>