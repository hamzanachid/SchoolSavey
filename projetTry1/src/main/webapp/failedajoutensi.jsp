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
<% 
    
     int num=(int)session.getAttribute("num");
    int error=(int)session.getAttribute("error"); 
    %>
	<script type="text/javascript">
    let num=<%=num%>
    let error=<%=error%> 
     if(num==1){
    	 swal("Error", "the code should be a integer", "error");
     }
     else if(num==2){
    	 swal("Error", "the date format should be(dd/mm//yyyy)", "error");
     }
     else if(num==3){
    	 swal("Error", "the password should be at least 8 caractere", "error");
     }else if(num==4){
    	 swal("Error", "the email should contain @gmail.com", "error");
     }
     else if(error<=0){
    	 swal("Error", "the email or password or code is already exist", "error");
     } 
    </script>
	<jsp:include page="ajouterensie.jsp" />
</body>
</html>