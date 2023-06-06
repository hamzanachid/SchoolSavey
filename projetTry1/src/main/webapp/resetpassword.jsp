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
	<%
String email =request.getParameter("email");
String cod =request.getParameter("code");
int code=Integer.parseInt(cod);
String name =request.getParameter("name"); 
String pass= EnsiegnantDAO.findByEmailCodeName(email, code, name); 
int i;
if(pass==null){
	i=0;
}
else{
	i=1; 
}   
%>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
let num=<%=i%>
let s="<%=pass%>"
if(num==1){
	swal("your password is :"+s);
}
else if(num==0){
	swal("Error", "the information are incorrecte", "error"); 
}
</script>
	<jsp:include page="resetpassword.html" />
</body>
</html>