<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<%
    String idfich =request.getParameter("idfich"); 
    %>
	<script>
   let idfich=<%=idfich%>
   swal({
	   title: "Are you sure?",
	   text: "Once deleted, you will not be able to recover this fichier!",
	   icon: "warning",
	   buttons: true,
	   dangerMode: true,
	 })
	 .then((willDelete) => {
	   if (willDelete) {
		   window.location='http://localhost:8080/projetTry1/DeleteFich?idfich='+idfich
	   } else { 
		   window.location='http://localhost:8080/projetTry1/absencemainpage.jsp?orderbywhat=id_fich&Module=All'
	   }
	 });
   </script>
</body>
</html>
