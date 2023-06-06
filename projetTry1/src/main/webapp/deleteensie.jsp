<%@page import="DAO.EnsiegnantDAO"%>
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
String cod=request.getParameter("code");
int code=Integer.parseInt(cod); 
EnsiegnantDAO.deleteens(code);
response.sendRedirect("/projetTry1/adminmainpage.jsp?orderbywhat=code&findbywhat=All&findvalue=any");
%>
</body>
</html>