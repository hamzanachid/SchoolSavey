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
				<h1>Student Space</h1>
			</div>
			<div class="add">
				<div class="containe">
					<div class="wrapper rounded bg-white">

						<div class="h3">Ajouter Etudiant</div>

						<form action="AjouterEtudiant"  class="form">
							<div class="row">
								<div class="col-md-6 mt-md-0 mt-3">
									<label>Cne</label> <input type="text" class="form-control"
										name="cne" required>
								</div>
								<div class="col-md-6 mt-md-0 mt-3">
									<label>Apogee</label> <input type="text" class="form-control"
										name="apogee" required>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 mt-md-0 mt-3">
									<label>Nom</label> <input type="text" class="form-control"
										name="nom" required>
								</div>
								<div class="col-md-6 mt-md-0 mt-3">
									<label>Prenom</label> <input type="text" class="form-control"
										name="prenom" required>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 mt-md-0 mt-3">
									<label>Adress</label> <input type="text" class="form-control"
										name="adress" required>
								</div>
								<div class="col-md-6 mt-md-0 mt-3">
									<label>Phone</label> <input type="phone" class="form-control"
										name="phone" required>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 mt-md-0 mt-3">
									<label>date de naissance</label> <input type="text"
										class="form-control" name="daten" required>
								</div>
								<div class="col-md-6 mt-md-0 mt-3">
									<label>Etat Civil</label>
									<div class="d-flex align-items-center mt-2">
										<label class="option"> <input type="radio"
											name="etatcivil" value="marie">marie <span
											class="checkmark"></span>
										</label> <label class="option ms-4"> <input type="radio"
											name="etatcivil" value="cele">celebataire <span
											class="checkmark"></span>
										</label>
									</div>
								</div>
							</div>
							<div class=" my-md-2 my-3">
								<label>Niveau</label> <select class="form-select"
									aria-label="Default select example" name="niveau" required>
									<option value="" selected hidden>Choisi un niveau</option>
									<%  
                            ArrayList<String> m=EnsiegnantDAO.getNiveau();
                 		 for(String s:m) {
                 			 out.print("<option>"+s+"</option>");
                 		 } 
                          %>
								</select>
							</div>
							<button type="submit" class="btn btn-primary mt-3">Ajouter</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>