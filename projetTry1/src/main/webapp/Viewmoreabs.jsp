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
				<h1>Absence Space</h1>
			</div>
			<%
            String id=request.getParameter("idfich");
            int idfich=Integer.parseInt(id);
            Fichabsence f=FichDAO.fichinfo(idfich);
            %>
			<div class="fichinfo">
				<div class="info1">
					<div class="input1">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text si" id="">id fichier</span>
							</div>
							<input type="text" class="form-control" value=<%=f.getIdfich() %>
								disabled>
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
							<input type="text" class="form-control" value=<%=f.getModule() %>
								disabled>
						</div>
					</div>
				</div>
				<div class="info1">
					<div class="input1">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text si" id="">type fichier</span>
							</div>
							<input type="text" class="form-control"
								value=<%=f.getTypefich() %> disabled>
						</div>
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
                            String module=f.getModule();
                      ArrayList<Etudiant> l=EtudiantDAO.etudiantinfo(email,password,module,"all","All","cne");
                      ArrayList<String> s=FichDAO.selectabsenteetud(idfich);
              		for(Etudiant e:l) {
              			out.print("<tr>");
              			if(s.contains(e.getCne())){
                  			out.print("<td  >"+e.getCne()+"</td><td  >"+e.getPronom()+"</td><td  >"+e.getNom()+"</td><td  ><input class=\"form-check-input\" type=\"checkbox\" value=\"\" id=\"flexCheckChecked\" checked disabled></td>");
              			}
              			else{
                  			out.print("<td  >"+e.getCne()+"</td><td  >"+e.getPronom()+"</td><td  >"+e.getNom()+"</td><td  ><input class=\"form-check-input\" type=\"checkbox\" value=\"\" id=\"flexCheckChecked\"  disabled></td>");

              			}
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