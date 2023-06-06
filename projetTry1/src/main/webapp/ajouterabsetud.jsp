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
  int n=(int)session.getAttribute("n");
  int idfich=(int)session.getAttribute("idfich");
  String typefich=request.getParameter("typefich");  
  int k=1;
  for(int i=1;i<=n;i++){
	  String cne=(String)session.getAttribute("cne"+i);
	  String check=request.getParameter("check"+i);  
	  try{
		  
		if(check.equals("True")){
		  k=0;
		  FichDAO.insertabs(idfich, cne,typefich) ;
	  }  
	  }catch(Exception e){
		  
	  }
	  
  }
  if(k==1){
	  FichDAO.insertabs(idfich,null,typefich) ;
  }
  response.sendRedirect("http://localhost:8080/projetTry1/absencemainpage.jsp?orderbywhat=id_fich&Module=All");
  %>
</body>
</html>