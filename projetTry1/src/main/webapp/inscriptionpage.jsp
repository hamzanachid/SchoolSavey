<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<body>
	<%@ page import="DAO.EnsiegnantDAO"%>
	<%@ page import="DAO.Ensiegnant"%>
	<%@ page import="java.util.*"%>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.text.*"%>
	<%
  int num=0;
  Ensiegnant e = new Ensiegnant();
  String code=request.getParameter("code"); 
  try{
	 int intcode=Integer.parseInt(code);
	 e.setCode(intcode);
  }catch(Exception es){
	  num=1;
  } 
  String email=request.getParameter("email");  
  String password=request.getParameter("password");  
  String status=request.getParameter("status");  
  String depart=request.getParameter("depart");  
  String date=request.getParameter("date_naissance"); 
  try{
	 java.util.Date date2 = new SimpleDateFormat("dd/mm/yyyy").parse(date);
     java.sql.Date sqlDate = new java.sql.Date(date2.getTime());
     e.setDate(sqlDate);
  }catch(Exception es){
	  num=2;
  }
  
  String nom=request.getParameter("nom");  
  String prenom=request.getParameter("prenom");  
  String fonction=request.getParameter("fonction");  
  String etatc=request.getParameter("etatcivil");   
  if(password.length()<8){
	  num=3;
  }
  else if(!email.contains("@gmail.com")){
	  num=4;
  }
  e.setEmail(email);
  e.setDepartement(depart);
  e.setPassword(password); 
  e.setFonction(fonction);
  e.setNom(nom);
  e.setPrenom(prenom);
  e.setEtatcivil(etatc);
  e.setStatus(status);
  int error=0;
  if(num==0){
	 error=EnsiegnantDAO.saveEnsiegnant(e);  
  } 
  session.setAttribute("num",num);
  session.setAttribute("error",error);
  String is=request.getParameter("is");
  System.out.println(is);
  int w=0;
  if(num==0 && error>0){
	  if(is==null){ 
	       w=1;
	  }
	  else{
		  response.sendRedirect("adminmainpage.jsp?orderbywhat=code&findbywhat=All&findvalue=any");
	  }
	  
  }
  else{ 
	  if(is==null){
		  response.sendRedirect("failedinscretion.jsp");
	  }
	  else{
		  response.sendRedirect("failedajoutensi.jsp");
	  }
	  
  } 
%>
<script type="text/javascript"> 
let num=<%=w%> 
if(num==1){
	swal("Inscreption done!!.")
	.then((value) => { 
		 window.location="http://localhost:8080/projetTry1/loginpage.html"
	}); 
} 	  
</script>
</body>
</html>