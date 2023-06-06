<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="DAO.EnsiegnantDAO"%>
	<%@ page import="DAO.Ensiegnant"%>
	<%@ page import="java.util.*"%>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.text.*"%>

	<%
  int num=0;
  Ensiegnant e = new Ensiegnant(); 
  String email=request.getParameter("email");  
  String password=request.getParameter("password");  
  String status=request.getParameter("status");  
  String depart=request.getParameter("depart");  
  String date=request.getParameter("date_naissance"); 
  try{
	 java.util.Date date2 = new SimpleDateFormat("yyyy-mm-dd").parse(date);
  java.sql.Date sqlDate = new java.sql.Date(date2.getTime()); 
  e.setDate(sqlDate); 
  }catch(Exception ex){
	  num=2;
  }
  
  String nom=request.getParameter("nom");  
  String prenom=request.getParameter("prenom");  
  String fonction=request.getParameter("fonction");  
  String etatc=request.getParameter("etatcivil");  
  e.setEmail(email);
  e.setDepartement(depart);
  e.setPassword(password); 
  e.setFonction(fonction);
  e.setNom(nom);
  e.setPrenom(prenom);
  e.setEtatcivil(etatc);
  e.setStatus(status);
  int error=0;
  String is=request.getParameter("is");
  if(num==0){
	  if(is==null){
		  error=EnsiegnantDAO.updateinfoEnsiegnant(e);  
	  }
	  else{
		  error=EnsiegnantDAO.updateinfoAdmin(e);
	  }
  } 
  System.out.println(e);
  session.setAttribute("num",num);
  session.setAttribute("error",error); 
  if(num==0 && error>0){  
	  if(is==null){ 
		  session.setAttribute("done",1);
	      response.sendRedirect("operadone.jsp");
	  } 
	  else{
		  response.sendRedirect("profile2.jsp");
	  }
  }
  else{ 
	  if(is==null){
		   response.sendRedirect("updateinfoerror.jsp");
	  }
	  else{
		  response.sendRedirect("updateadminerror.jsp");
	  }
	  
  }
%>
</body>
</html>