<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.NoteEntity"%>
<%@page import="com.factory.Factory"%>
<%@page import="org.hibernate.SessionFactory"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="style.css" />
<style type="text/css">
.card{
background-color: #f97316;
}</style>
</head>
<%
SessionFactory sf = Factory.getInstance();
Session sess = sf.getCurrentSession();
sess.beginTransaction();
%>
<body>
<%  int id=Integer.parseInt(request.getParameter("id"));
	NoteEntity Note = (NoteEntity)sess.createQuery("From NoteEntity WHERE note_id=:id").setParameter("id",id).uniqueResult();
	sess.getTransaction().commit();
	sess.close();
	%>
	<div class="container">
	<jsp:include page="navbar.jsp"></jsp:include>
	</div>
	
	<div class="container">
	<div class="card p-3 mt-4 ">
		<form action="Updatee" class="mt-5 w-50  rounded-3" method="POST">
		<input type="hidden" name="ide" value="<%=request.getParameter("id")%>">
			<div class="mb-3">
				<label for="title" class="form-label">Title</label> <input
					type="text" class="form-control" id="title" name="title" value="<%=Note.getTitle()%>">

			</div>
			<div class="mb-3">
			<label for="content" class="form-label">Note</label>
				<textarea rows="4" cols="71" id="content"
					placeholder="Write notes here..." name="content" "><%=Note.getContent()%></textarea>
			</div>

			<button type="submit" class="btn btn-primary">Update</button>
		</form>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
</html>