<%@page import="com.Note.Notes"%>
<%@page import="com.Help.factor"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All notes: Note Taker</title>
<%@include file="all_css.jsp"%>
</head>
<body>

    <div class="container">
        <%@include file="navbar.jsp"%>
        <br>
        <h1 class="text-uppercase">All Notes:</h1>

        <div class="row">
            <%
            Session s = factor.getFactory().openSession();
            Query q = s.createQuery("from Notes");
            List<Notes> list = q.list();
            for (Notes note : list) {
                // Convert Date to LocalDateTime and format it
                java.util.Date date = note.getDate();
                java.time.LocalDateTime localDateTime = date.toInstant()
                    .atZone(java.time.ZoneId.systemDefault())
                    .toLocalDateTime();
                java.time.format.DateTimeFormatter df = java.time.format.DateTimeFormatter.ofPattern("dd-M-yy E h:m:s a");
                String formattedDate = localDateTime.format(df);
            %>

            <div class="card m-2" >            
                <img class="card-img-top m-1 mx-2" style="max-width:50px;" src="img/notes.png" alt="Card image cap">
                <div class="card-body px-3">
                    <h5 class="card-title"><%= note.getTitle() %></h5>
                    <p class="card-text">
                        <%= note.getContent() %>
                    </p>
                    <p><b class="text-primary"><%= formattedDate %></b></p>
                    <div class="container text-center mt-2">
                        <a href="edit.jsp?note_id=<%= note.getId() %>" class="btn btn-primary">show</a>
                        <a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
                    </div>
                </div>
            </div>

            <%
                }
            s.close();
            %>
        </div>
    </div>
</body>
</html>
