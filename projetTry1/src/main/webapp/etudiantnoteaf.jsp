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
	<%@ page import="DAO.*"%>
	<%@ page import="java.util.*"%>
	<%
  String cne=request.getParameter("cne");
  String module=request.getParameter("module");
  Etudiant e=EtudiantDAO.findByCne(cne);
  ArrayList<Float> l=EtudiantDAO.selectnotes(cne, module);
  session.setAttribute("cne",cne);
  session.setAttribute("module",module); 
  String email=(String)session.getAttribute("email");
  String password=(String)session.getAttribute("password"); 
  session.setAttribute("email",email);
  session.setAttribute("password",password);
  String lien1="href=\"/projetTry1/MainPage.jsp?email="+email+"&password="+password+"&orderbywhat=cne&Module=All&findbywhat=All&findvalue=any\"";
  String lien2="href=\"/projetTry1/absencemainpage.jsp?email="+email+"&password="+password+"&orderbywhat=id_fich&Module=All\"";
  String lien3="href=\"/projetTry1/etudabsence.jsp?email="+email+"&password="+password+"&orderbywhat=cne&Module=All\"";
  String lien4="href=\"/projetTry1/modulemainpage.jsp?email="+email+"&password="+password+"\"";
  
%>
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

						<form action="notespagejsp.jsp" method="post" class="form">
							<div class="con">
								<div class="h3">Student note</div>
								<div class="row">
									<div class="col-md-6 mt-md-0 mt-3">
										<label>Module</label> <input type="text" class="form-control"
											name="module" value=<%=module %> disabled>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6 mt-md-0 mt-3">
										<label>Cne</label> <input type="text" class="form-control"
											name="cne" value=<%=e.getCne() %> disabled>
									</div>
									<div class="col-md-6 mt-md-0 mt-3">
										<label>Apogee</label> <input type="text" class="form-control"
											name="nom" value=<%=e.getApogee() %> disabled>
									</div>
								</div>
								<div class="row"></div>
								<div class="row">
									<div class="col-md-6 mt-md-0 mt-3">
										<label>Nom</label> <input type="text" class="form-control"
											name="nom" value=<%=e.getNom() %> disabled>

									</div>
									<div class="col-md-6 mt-md-0 mt-3">
										<label>Prenom</label> <input type="text" class="form-control"
											name="nom" value=<%=e.getPrenom() %> disabled>
									</div>
								</div>
								<div class="row"></div>

								<div class="row">
									<div class="col-md-4 mt-md-0 mt-3">
										<label>Note 1</label> <input type="text" class="form-control"
											name="note1" value=<%=l.get(0) %>>
									</div>
									<div class="col-md-4 mt-md-0 mt-3">
										<label>Note 2</label> <input type="text" class="form-control"
											name="note2" value=<%=l.get(1) %>>
									</div>
									<div class="col-md-4 mt-md-0 mt-3">
										<label>Particiption</label> <input type="text"
											class="form-control" name="participation"
											value=<%=l.get(2) %>>
									</div>
								</div>
								<button type="submit" class="btn btn-primary mt-3">Save</button>
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