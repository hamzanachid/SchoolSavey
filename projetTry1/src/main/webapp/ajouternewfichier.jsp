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
<style>
.si {
	border-bottom-right-radius: 0px;
	border-top-right-radius: 0px;
}
</style>
</head>
<body>
	<%@ page import="DAO.*"%>
	<%@ page import="java.util.*"%>
	<%
  String module=request.getParameter("module");
  Fichabsence f=FichDAO.newfileabsence(module);
  String email=request.getParameter("email");
  String password=request.getParameter("password");  
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
			<form action="ajouterabsetud.jsp" class="getabs">
				<div class="sharit">
					<h1>Absence Space</h1>
				</div>
				<div class="fichinfo">
					<div class="info1">
						<div class="input1">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text si" id="">id fichier</span>
								</div>
								<input type="text" class="form-control"
									value=<%=f.getIdfich() %> disabled>
							</div>
						</div>
						<div class="input1">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text si" id="">date fichier</span>
								</div>
								<input type="text" class="form-control"
									value=<%=f.getDatefich() %> disabled>
							</div>
						</div>
						<div class="input1">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text si" id="">module fichier</span>
								</div>
								<input type="text" class="form-control"
									value=<%=f.getModule() %> disabled>
							</div>
						</div>
					</div>
					<div class="info1">
						<div class="input1">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text si" id="">type fichier</span>
								</div>
								<select class="form-control" id="inputGroupSelect01"
									name="typefich">
									<option selected>Cour</option>
									<option>Tp</option>
									<option>Td</option>
									<option>Exam</option>
								</select>

							</div>
						</div> 
						<div class="input1 btnsave">
							<button class="btn5">save</button>
						</div>
					</div>
				</div>
				<div class="table">
					<div class="table-wrapper-scroll-y my-custom-scrollbar">
						<table class="table table-bordered table-striped mb-0">
							<thead>
								<tr>
									<th scope="col">cne</th>
									<th scope="col">nom</th>
									<th scope="col">prenom</th>
									<th scope="col">absence</th>
								</tr>
							</thead>
							<tbody>
								<% 
                      ArrayList<Etudiant> l=EtudiantDAO.etudiantinfo(email,password,module,"all","All","cne"); 
                            int i=0;
                            session.setAttribute("idfich",f.getIdfich());
              		for(Etudiant e:l) {
              			out.print("<tr>"); 
              			i+=1;
              			session.setAttribute("cne"+i,e.getCne());
              			session.setAttribute("idfich",f.getIdfich());
                  			out.print("<td  >"+e.getCne()+"</td><td  >"+e.getPronom()+"</td><td  >"+e.getNom()+"</td><td  ><input class=\"form-check-input\" type=\"checkbox\" value=\"True\" id=\"flexCheckChecked\" name=\"check"+i+"\" ></td>");
              			 
              			out.print("</tr>");
              		}
              		int n=i;
              		session.setAttribute("n",n);
                      %>
							</tbody>
						</table>

					</div>
				</div>
			</form>
		</div>
	</div>
	<script src="js/bootstrap.bundle.min.js">
     </script>
</body>
</html>