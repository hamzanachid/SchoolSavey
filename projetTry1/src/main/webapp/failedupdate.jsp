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
	<%   int num=(int)session.getAttribute("i");  
    %>
	<script type="text/javascript">
    let num=<%=num%> 
     if(num==0){
    	 swal("Error", "the email or password does not exist", "error");
     } 
     else if(num==2){
    	 swal("Error", "the new  password should be at least 8 caractere", "error");
     }else if(num==3){
    	 swal("Error", "the new password and the confirme password should be the same", "error");
     }  
    </script>
	<jsp:include page="Updatepassword.html" />
</body>
</html>