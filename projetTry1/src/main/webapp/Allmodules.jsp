 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/style1.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<title>Document</title>
</head> 
<body>
<%@ page import= "DAO.*"  %>
<%@ page import= "java.util.*"  %> 
<%
String email=(String)session.getAttribute("email");
String password=(String)session.getAttribute("password"); 
session.setAttribute("email",email);
session.setAttribute("password",password);
String lien1="href=\"/projetTry1/adminmainpage.jsp?orderbywhat=code&findbywhat=All&findvalue=any\"";  
String lien2="href=\"/projetTry1/Allmodules.jsp\""; 
%>
	<div class="page">
		<div class="navbar">
			<div class="logo">
				<img src="images/Calendar-amico.png" alt="#">
			</div>
			<div class="traitment">
				<div class="liens"> 
				<a <%=lien1 %> class="btn1">ensiegnants</a>
                    <a <%=lien2 %>  class="btn1">module</a>  
				</div>
			</div>
			<div class="profile">
				<div class="profile-content">
					<% String lien="href=\"/projetTry1/profile2.jsp?email="+email+"&password="+password+"\"";%>
					<a <%=lien %> class="profile-lien"> <%
                   String name=(String)session.getAttribute("name");
                   out.print("<i class=\"fa fa-user-o fa-x\" aria-hidden=\"true\"></i>"+ name);
                   %>
					</a>
				</div>
				<div class="logout">
					<a href="/projetTry1/loginpage.html" class="profile-lien"> <i
						class="fa fa-sign-out fa-x" aria-hidden="true"></i>Log-Out
					</a>
				</div>
			</div>
		</div>
		<div class="home">
			<div class="sharit">
				<h1>Module Space</h1>
			</div>
			<div class="buttons">
                <div class="addbu">
                    <form action="AjouterNiveau" class="form2">    
                        <input type="text" class="addniveau" name="niveau" placeholder="niveau" required>  
                        <button type="submit" class="btn4">ajouter niveau</button> 
                    </form>
                 </div>  
                 <form action="AjouterModule">
                 <div class="searchbtn">  
                    <div class="secondselection"> 
                        </div>  
                        <div class="firstselection"> 
                        </div>
                        <div class="secondselection">
                        <input type="text" class="findinput" name="module" placeholder="module" required>
                        <select class="selectionmodule selectionstyle"  id="inputGroupSelect01" name="niveau">
                             <%  
                            ArrayList<String> m=EnsiegnantDAO.getNiveau();
                 		 for(String s:m) {
                 			 out.print("<option>"+s+"</option>");
                 		 } 
                          %>
                        </select>
                    </div>  
                        <button type="submit" class="btn3">ajouter module</button>
                 </div>  </form>
			</div>
			<div class="table">
				<div class="table-wrapper-scroll-y my-custom-scrollbar">
					<table class="table table-bordered table-striped mb-0">
						<thead>
							<tr>
						    	<th scope="col">id module</th>
								<th scope="col">module</th>
								<th scope="col">niveau</th> 
								<th scope="col">Delete</th>
							</tr>
						</thead>
						<tbody>
 	<%
							ArrayList<ArrayList<String>>  lists=EnsiegnantDAO.getModules1();
              		for(ArrayList<String> list:lists) {
              			out.print("<tr>");
              			out.print("<td  >"+list.get(0)+"</td><td  >"+list.get(1)+"</td><td  >"+list.get(2)+"</td><td  ><a href=\"DeleteModule?idmodule="+list.get(0)+"\" class=\"btn btn-danger\">Delete</a></td>");
              			out.print("</tr>");
              		}
                      %>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</div>
	<script src="js/bootstrap.bundle.min.js">
     </script>
</body>
</html>