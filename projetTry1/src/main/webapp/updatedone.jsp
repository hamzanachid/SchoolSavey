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
	<%int i=(int)session.getAttribute("done"); %>
	<script type="text/javascript">  
        let i=<%=i%>
        if(i==1){
        	swal("Good", "Update done!", "success"); 
        }
        else if(i==2){
        	swal("Good", "Inscreption done!", "success"); 
        } 
    </script>
	<jsp:include page="loginpage.html" />
</body>
</html>