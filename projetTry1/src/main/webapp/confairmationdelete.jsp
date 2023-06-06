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
    String cne =request.getParameter("cne"); 
    %>
	<script>
   let cne=<%=cne%>
   swal({
	   title: "Are you sure?",
	   text: "Once deleted, you will not be able to recover this imaginary file!",
	   icon: "warning",
	   buttons: true,
	   dangerMode: true,
	 })
	 .then((willDelete) => {
	   if (willDelete) {
		   window.location='http://localhost:8080/projetTry1/deletetudiantpage.jsp?cne='+cne
	   } else { 
		   window.location='http://localhost:8080/projetTry1/MainPage.jsp?orderbywhat=cne&Module=All&findbywhat=All&findvalue=any'
	   }
	 });
   </script>
</body>
</html>