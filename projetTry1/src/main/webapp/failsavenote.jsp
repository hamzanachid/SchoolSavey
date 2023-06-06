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
%>
	<script type="text/javascript">  
        let i=<%=num%>
        if(i==1){
        	swal("error", "the note 1 should be between 0 and 20", "error"); 
        }
        else if(i==2){
        	swal("error", "the note 2 should be between 0 and 20", "error"); 
        }
        else if(i==3){
        	swal("error", "the participate note should be between 0 and 20", "error"); 
        }
        else if(i==4){
        	swal("error", "all the notes should be a floats", "error"); 
        } 
    </script>
	<jsp:include page="etudiantnoteaf.jsp" />
</body>
</html>