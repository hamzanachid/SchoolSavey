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
<%@ page import="DAO.*"%>
<%@ page import="java.util.*"%>
<%
String email=(String)session.getAttribute("email");
String password=(String)session.getAttribute("password"); 
session.setAttribute("email",email);
session.setAttribute("password",password);
String lien1="href=\"/projetTry1/MainPage.jsp?email="+email+"&password="+password+"&orderbywhat=cne&Module=All&findbywhat=All&findvalue=any\"";
String lien2="href=\"/projetTry1/absencemainpage.jsp?email="+email+"&password="+password+"&orderbywhat=id_fich&Module=All\"";
String lien3="href=\"/projetTry1/etudabsence.jsp?email="+email+"&password="+password+"&orderbywhat=cne&Module=All\"";
String lien4="href=\"/projetTry1/modulemainpage.jsp?email="+email+"&password="+password+"\"";
ArrayList<String> m=EnsiegnantDAO.EnsiegnantModule(email,password);
%>
<body>
	<div class="page">
		<div class="navbar">
			<div class="logo">
				<img src="images/Calendar-amico.png" alt="#">
			</div>
			<div class="traitment">
				<div class="liens">
					<a <%=lien1 %> class="btn1">Students</a> <a <%=lien2 %> class="btn1">Absences</a>
					<a <%=lien3 %> class="btn1">Sanction</a> <a <%=lien4 %>
						class="btn1">Modules</a>
				</div>
			</div>
			<div class="profile">
				<div class="profile-content">
					<% String lien="href=\"/projetTry1/profile.jsp?email="+email+"&password="+password+"\"";%>
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
				<h1>Absence Space</h1>
			</div>
			<div class="buttons">
				<div class="addbu">
					<form
						action="ajouternewfichier.jsp?email=<%=email %>&password=<%=password %>"
						method="post" class="form1">
						<select class="moduleinput" id="inputGroupSelect01" name="module"
							required>
							<option value="" selected hidden>All</option>
							<%  
                 		 for(String s:m) {
                 			 out.print("<option>"+s+"</option>");
                 		 }
                          %>
						</select>
						<button type="submit" class="btn4">new File</button>
					</form>
				</div>
				<form action="absencemainpage.jsp">
					<div class="searchbtn">
						<div class="secondselection">
							<label class="labelmodule" for="inputGroupSelect01">Order</label>
							<select class="selectionmodule selectionstyle"
								id="inputGroupSelect01" name="orderbywhat">
								<option selected>id_fich</option>
								<option>date_fich</option> 
								<option>nbrabsence</option>
							</select>
						</div>
						<div class="firstselection">
							<label class="labelmodule" for="inputGroupSelect01">Module</label>
							<select class="selectionmodule" id="inputGroupSelect01"
								name="Module" required>
								<option hidden>All</option>
								<%  
                 		 for(String s:m) {
                 			 out.print("<option>"+s+"</option>");
                 		 }
                          %>
							</select>
						</div>

						<button type="submit" class="btn3">search</button>
					</div>
				</form>

			</div>
			<div class="table">
				<div class="table-wrapper-scroll-y my-custom-scrollbar">
					<table class="table table-bordered table-striped mb-0">
						<thead>
							<tr>
								<th scope="col">id_fich</th>
								<th scope="col">module</th>
								<th scope="col">date_fich</th>
								<th scope="col">type_fich</th> 
								<th scope="col">nombre d'absence</th>
								<th scope="col">delete</th>
								<th scope="col">view more</th>
							</tr>
						</thead>
						<tbody>
							<%String Module=request.getParameter("Module");  
						String order=request.getParameter("orderbywhat");
						%>
							<%
                      ArrayList<Fichabsence> l=FichDAO.fichsinfo(email,password,Module,order);
              		for(Fichabsence e:l) {
              			out.print("<tr>");
              			out.print("<td>"+e.getIdfich()+"</td><td  >"+e.getModule()+"</td><td  >"+e.getDatefich()+"</td><td  >"+e.getTypefich()+"</td><td  >"+e.getCount()+"</td><td  ><a href=\"confirmationdeletefich.jsp?idfich="+e.getIdfich()+"\"  class=\"btn btn-success\">Delete</a></td><td  ><a href=\"Viewmoreabs.jsp?idfich="+e.getIdfich()+"&email="+email+"&password="+password+"\" class=\"btn btn-success\">View more</a></td>");
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