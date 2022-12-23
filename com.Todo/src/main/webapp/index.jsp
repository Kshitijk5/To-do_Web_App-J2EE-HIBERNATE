<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.NoteEntity"%>
<%@page import="com.factory.Factory"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!Doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<%
SessionFactory sf = Factory.getInstance();
Session sess = sf.getCurrentSession();
sess.beginTransaction();
%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="style.css" />


<title>Main page</title>
</head>
<body>
	<input type="hidden" id="info"
		value="<%=session.getAttribute("info")%>">
	<div class="container">
		<jsp:include page="./navbar.jsp"></jsp:include>
	</div>
	<!-- CONTENT -->
	<%
	List<NoteEntity> Notes = sess.createQuery("From NoteEntity").getResultList();
	out.println(Notes.size());
	int pages=0;
	if(Notes.size()>5){
		pages=(Notes.size()/5);
	}
	for (NoteEntity notes : Notes) {
	%>

	<div class="container  mt-4 w-50">
		<div class="card shadow p-4">
			<h3><%=notes.getTitle()%></h3>
			<p><%=notes.getContent()%></p>
			<div class="wrapper">
				<a class="btn btn-primary "
					href="Edit.jsp?id=<%=notes.getNoteId()%>">Edit</a> <a
					class="btn btn-danger " href="Delete?id=<%=notes.getNoteId()%>">Delete</a>
			</div>
		</div>
	</div>
	<%
	}
	sess.getTransaction().commit();
	sess.close();
	%>




	<!-- CONTENT END -->



	<!-- Pagination -->
	
	<div class="container w-50 mt-5 mb-2">
		<nav aria-label="..." class="mx-auto" >
			<ul class="pagination w-50 mx-auto">
				<li class="page-item "><a class="page-link" href="#"
					tabindex="-1" aria-disabled="true">Previous</a></li>
					<%for(int i=1;i<=pages;i++){%>
				<li class="page-item">
				<a class="page-link" href="#"><%=i %></a>
				</li>
				<% }%>
				<li class="page-item">
				<a class="page-link" href="#">Next</a>
				</li>
			</ul>
		</nav>
	</div>

	<!-- PAgination end -->

	<!-- Optional JavaScript -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script type="text/javascript">
		const info_value = document.getElementById('info').value;
		if (info_value != null) {
			if (info_value == 'Deleted') {
				swal('Note Deleted', '', 'success')
				info_value = null;
			}

			else if (info_value == 'Added') {
				swal('Note Added', '', 'success')
				info_value = null;
			} else if (info_value == 'Updated') {
				swal('Note Updated', '', 'success')
				info_value = null;
			}
		}
	</script>
	<%
	session.invalidate();
	%>
</body>
</html>