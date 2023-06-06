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
	<%@ page import="java.util.*"%>
	<%@ page import="java.util.*"%>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.text.*"%>
	<% 
int num;
String cne =(String)session.getAttribute("cne");
String apogee = request.getParameter("apogee");
String nom= request.getParameter("nom");
String prenom = request.getParameter("prenom");
String adress= request.getParameter("adress");
String phone = request.getParameter("phone");
String date=request.getParameter("daten"); 
String etatc=request.getParameter("etatcivil"); 

String niveau=request.getParameter("niveau"); 
Etudiant e=new Etudiant();

e.setCne(cne);
e.setApogee(apogee);

e.setNiveau(niveau);
e.setNom(nom);
e.setPrenom(prenom);
e.setEtat_civil(etatc);
e.setAdress(adress);
e.setPhone(phone); 
if(date.matches("^\\d{4}-\\d{2}-\\d{2}$") & phone.length()>8){
	java.util.Date date2 = new SimpleDateFormat("yyyy-mm-dd").parse(date);
    java.sql.Date sqlDate = new java.sql.Date(date2.getTime()); 
    e.setDaten(sqlDate);
	num=1;
	EtudiantDAO.updateetudiant(e);
}
else if(!date.matches("^\\d{4}-\\d{2}-\\d{2}$")){
	num=2;
}
else{
	num=3;
}
session.setAttribute("num",num);
response.sendRedirect("updateoper.jsp?cne="+cne);
%>
</body>
</html>