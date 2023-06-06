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
  int num=0;
    String cne =(String) session.getAttribute("cne"); 
  String module =(String) session.getAttribute("module"); 
  String s ="?cne="+cne+"&module="+module;
   String snote1=request.getParameter("note1"); 
   String snote2=request.getParameter("note2"); 
   String snote3=request.getParameter("participation");  
   float n1=0f;
   float n2=0f;
   float n3=0f;
   try{
	  n1=Float.parseFloat(snote1);
      n2=Float.parseFloat(snote2);
      n3=Float.parseFloat(snote3);  
   }
   catch(Exception e){
	   num=4;
   }
   
   if(n1>20 | n1<0){
	   num=1;
   }
   else if(n2>20 | n2<0){
	   num=2;
   }
   else if(n3>20 | n3<0){
	   num=3;
   } 
   if(num==0){
	   EtudiantDAO.updatenoteetudiant(cne, module, n1, n2, n3);
	   response.sendRedirect("MainPage.jsp?orderbywhat=cne&Module=All&findbywhat=All&findvalue=any");
   }
   else{
	   session.setAttribute("num",num); 
	   response.sendRedirect("failsavenote.jsp"+s);
   }
  %>
</body>
</html>