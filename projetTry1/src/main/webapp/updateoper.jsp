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
int num=(int)session.getAttribute("num");  
%>
	<script type="text/javascript">  
        let i=<%=num%>
        if(i==1){
        	swal("Good", "the student updated!", "success"); 
        }
        else if(i==2){
        	swal("error", "you should put a date as the form of (yyyy-mm-dd)", "error"); 
        }
        else if(i==3){
        	swal("error", "the number phone should have at least 8 numbers", "error"); 
        } 
    </script>
	<jsp:include page="Updateetudiant.jsp" />
</body>
</html>