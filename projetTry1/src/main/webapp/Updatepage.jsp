<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<%@ page import="DAO.EnsiegnantDAO"%>
	<%
String email =request.getParameter("email"); 
String anpassword =request.getParameter("anpassword");
String newpassword =request.getParameter("newpassword");
String connewassword =request.getParameter("connewassword");
int i= EnsiegnantDAO.findByEmailPass(email, anpassword);
if(newpassword.length()<8){
	i=2;
}
else if(!newpassword.equals(connewassword)){
	i=3;
}

session.setAttribute("i",i);

if(i!=1){
	response.sendRedirect("failedupdate.jsp");
}  
else{
	session.setAttribute("done",1);
	EnsiegnantDAO.updatePasswordEnsiegnant(email, anpassword, connewassword);
	response.sendRedirect("operadone.jsp");
}
%>

</body>
</html>