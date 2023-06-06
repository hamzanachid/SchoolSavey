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

<body>
	<% 
    
     int num=(int)session.getAttribute("num");
    int error=(int)session.getAttribute("error"); 
    %>
	<script type="text/javascript">
    let num=<%=num%>
    let error=<%=error%>  
    if(num==2){
    	 swal("Error", "the date format should be(yyyy-dd-mm)", "error");
     }else if(error<=0){
    	 swal("Error", "there is a error in the update  ", "error");
     } 
    </script>
	<jsp:include page="profile2.jsp" />
</body>
</html>