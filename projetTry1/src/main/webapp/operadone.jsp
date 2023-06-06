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
int num=(int)session.getAttribute("done");  
%>
	<script type="text/javascript">  
        let i=<%=num%>
        if(i==1){
        	swal("Good", "the ensiegnant updated!", "success"); 
        } 
        else if(i==2){
        	swal("Good", "the password updated!", "success"); 
        }
    </script>
	<jsp:include page="profile.jsp" />
</body>
</html>