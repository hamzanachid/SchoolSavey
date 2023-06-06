<%@page import="DAO.FichDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
String email=(String)session.getAttribute("email");
String password=(String)session.getAttribute("password"); 
session.setAttribute("email",email);
session.setAttribute("password",password); 
String idfic=request.getParameter("idfich");
String cne=(String)session.getAttribute("cne");
String justf=request.getParameter("just");
String module=(String)session.getAttribute("module"); 
Integer idfich=Integer.parseInt(idfic);
FichDAO.updatejust(idfich, cne, justf);
response.sendRedirect("http://localhost:8080/projetTry1/etudabsinfo.jsp?cne="+cne+"&module="+module);
%>
</body>
</html>