<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="DAO.*"%>
	<%
   String cne =request.getParameter("cne");
   EtudiantDAO.deleteetudiant(cne);
   response.sendRedirect("http://localhost:8080/projetTry1/MainPage.jsp?orderbywhat=cne&Module=All&findbywhat=All&findvalue=any");
   %>
</body>
</html>