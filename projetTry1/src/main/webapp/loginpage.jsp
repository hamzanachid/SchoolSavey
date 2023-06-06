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
	<%@ page import="DAO.EnsiegnantDAO"%>
	<%
String email =request.getParameter("email");
String name =request.getParameter("name");
String password =request.getParameter("password");

int i= EnsiegnantDAO.findByEmailPassName(email, password, name);
int j= EnsiegnantDAO.findByEmailPassNameadmin(email, password, name);
session.setAttribute("email", email);
session.setAttribute("password", password);
session.setAttribute("name", name);
int num=1;
if(i==1 && j==0){ 
	response.sendRedirect("MainPage.jsp?orderbywhat=cne&Module=All&findbywhat=All&findvalue=any"); 
}
else if(i==0 && j==1){ 
	response.sendRedirect("/projetTry1/adminmainpage.jsp?orderbywhat=code&findbywhat=All&findvalue=any"); 
} 
else{ 
	i=EnsiegnantDAO.findByEmailName(email, name); 
	if(i==1){
		num=2;
	}
	else if(i!=1){
		num=3;
	}
} 
%>
	<script type="text/javascript">
let num=<%=num%>
if(num==2){
	swal({
		  title: "the password is incorrecte?",
		  text: "you want to recuper your password!",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
		     window.location="http://localhost:8080/projetTry1/resetpassword.html"
		  } else { 
		    window.location="http://localhost:8080/projetTry1/loginpage.html"
		  }
		});
}
else if(num==3){
	swal("Your information are incorrecte.")
	.then((value) => { 
		window.location="http://localhost:8080/projetTry1/loginpage.html"
	});
	
}
</script>
</body>
</html>