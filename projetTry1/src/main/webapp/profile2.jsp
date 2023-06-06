<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/style1.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<title>Document</title>
</head>
<%@ page import="DAO.EnsiegnantDAO"%>
<%@ page import="DAO.Ensiegnant"%>
<%@ page import="java.util.*"%>
<%

String email=(String)session.getAttribute("email");
String password=(String)session.getAttribute("password"); 
session.setAttribute("email",email);
session.setAttribute("password",password); 
String lien1="href=\"/projetTry1/adminmainpage.jsp?orderbywhat=code&findbywhat=All&findvalue=any\"";  
String lien2="href=\"/projetTry1/Allmodules.jsp\""; 
Ensiegnant e=EnsiegnantDAO.admininfo(email, password);
%>
<body>
	<div class="page">
		<div class="navbar">
			<div class="logo">
				<img src="images/Calendar-amico.png" alt="#">
			</div>
			<div class="traitment">
				<div class="liens">
					<a <%=lien1 %> class="btn1">ensiegnants</a>
                    <a <%=lien2 %> class="btn1">module</a>  
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
				<h1>Admin Space</h1>
			</div>
			<div class="add">
				<div class="containe">
					<div class="wrapper rounded bg-white">

						<div class="h3">Your Profile</div>

						<form
							action="Updateinfoensie.jsp?email=<%=email %>&password=<%=password %>&is=1"
							method="post" class="row g-2">
							<div class="col-md-3">
								<label for="inputEmail4" class="form-label">Code</label> <input
									type="text" class="form-control" id="inputEmail4"
									value="<%=e.getCode() %>" disabled>
							</div>
							<div class="col-md-4">
								<label for="inputEmail4" class="form-label">Email</label> <input
									type="text" class="form-control" id="inputEmail4"
									value="<%=e.getEmail() %>" disabled>
							</div>
							<div class="col-md-4">
								<label for="inputPassword4" class="form-label">Password</label>
								<input type="text" class="form-control" id="inputPassword4"
									value="<%=e.getPassword() %>" disabled>
							</div>
							<div class="col-md-3">
								<label for="inputname4" class="form-label">FirstName</label> <input
									type="text" class="form-control" id="inputname4" name="prenom"
									value="<%=e.getPrenom() %>">
							</div>
							<div class="col-md-3">
								<label for="inputname4" class="form-label">LastName</label> <input
									type="text" class="form-control" id="inputname4" name="nom"
									value="<%=e.getNom() %>">
							</div>
							<div class="col-md-4">
								<label for="inputname4" class="form-label">Date de
									Naissance</label> <input type="text" class="form-control"
									id="inputDatedeNaissance4" name="date_naissance"
									value="<%=e.getDate()%>">
							</div>
							<div class="col-md-3">
								<label for="inputname4" class="form-label">Fonction</label> <input
									type="text" class="form-control" id="inputfonction4"
									name="fonction" value="<%=e.getFonction() %>">
							</div>
							<div class="col-md-3">
								<label for="inputname4" class="form-label">Departement</label> <input
									type="text" class="form-control" id="inputdepartement4"
									name="depart" value="<%=e.getDepartement() %>">
							</div>
							<div class="col-md-4">
								<label for="inputname4" class="form-label">EtatCivil</label> <input
									type="text" class="form-control" id="inputetatcivil4"
									name="etatcivil" value="<%=e.getEtatcivil() %>">
							</div>
							<div class="col-md-3">
								<label for="inputname4" class="form-label">Status</label> <input
									type="text" class="form-control" id="inputstatus4"
									name="status" value="<%=e.getStatus() %>">
							</div>
							<div class="col-2 classbtn">
								<button type="submit" class="btn btn-primary">Save</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>