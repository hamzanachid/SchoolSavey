<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/projetTry1/css/style1.css">
    <link rel="stylesheet" href="/projetTry1/css/bootstrap.min.css">  
    <link rel="stylesheet" href="/projetTry1/css/font-awesome.min.css"> 
    <title>Document</title>
</head> 
<%@ page import= "DAO.*"  %>
<%@ page import= "java.util.*"  %> 
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
                   <a <%=lien %> class="profile-lien">
                   <%
                   String name=(String)session.getAttribute("name");
                   out.print("<i class=\"fa fa-user-o fa-x\" aria-hidden=\"true\"></i>"+ name);
                   %> 
                   </a>
                </div>
                <div class="logout">
                    <a href="/projetTry1/loginpage.html" class="profile-lien">
                        <i class="fa fa-sign-out fa-x" aria-hidden="true"></i>Log-Out
                       </a>
                </div>
            </div>
        </div>
        <div class="home">
            <div class="sharit">
                  <h1>Student Space</h1>
            </div>
            <div class="buttons">
                 <div class="addbu">
                    <a class="btn2" href="/projetTry1/ajouetstudent.jsp">Add Student</a>
                 </div>
                 <form action="MainPage.jsp">
                 <div class="searchbtn">
                        <div class="secondselection">
                        <label class="labelmodule" for="inputGroupSelect01">Order</label>
                        <select class="selectionmodule selectionstyle"  id="inputGroupSelect01" name="orderbywhat">
                            <option selected>cne</option>
                            <option >prenom</option>
                            <option >nom</option>
                            <option >date_naissance</option>
                            <option >apogee</option>   
                        </select>
                        </div>  
                        <div class="firstselection">
                        <label class="labelmodule" for="inputGroupSelect01">Module</label>
                        <select class="selectionmodule"  id="inputGroupSelect01" name="Module">
                            <option selected>All</option> 
                             <% 
                         ArrayList<String> m=EnsiegnantDAO.EnsiegnantModule(email,password);
                 		 for(String s:m) {
                 			 out.print("<option>"+s+"</option>");
                 		 }
                          %>
                        </select>
                        </div>
                        <div class="secondselection">
                        <input type="text" class="findinput" name="findvalue" placeholder="values">
                        <select class="selectionmodule selectionstyle"  id="inputGroupSelect01" name="findbywhat">
                            <option selected >All</option>
                            <option >cne</option>
                            <option >prenom</option>
                            <option >nom</option> 
                            <option >apogee</option> 
                            <option >phone</option> 
                            <option >adress</option> 
                            <option >etat_civil</option> 
                        </select>
                    </div>  
                        <button type="submit" class="btn3">search</button>
                 </div>  </form>

            </div> 
            <div class="table">
                <div class="table-wrapper-scroll-y my-custom-scrollbar"> 
                    <table class="table table-bordered table-striped mb-0">
                      <thead>
                        <tr>
                          <th scope="col">module</th>
                          <th scope="col">Apogee</th>
                          <th scope="col">Cne</th>
                          <th scope="col">FullName</th> 
                          <th scope="col">Birthday</th>
                          <th scope="col">Etat_civil</th>
                          <th scope="col">Adress</th>
                          <th scope="col">Phone</th> 
                          <th scope="col">Update</th>
                          <th scope="col">Delete</th>
                          <th scope="col">Note</th>
                        </tr>
                      </thead>
                      <tbody> 
                       <%String Module=request.getParameter("Module"); 
						String findvalue=request.getParameter("findvalue");
						String findbywhat=request.getParameter("findbywhat"); 
						String order=request.getParameter("orderbywhat");
						%>	
                      <%
                      ArrayList<Etudiant> l=EtudiantDAO.etudiantinfo(email,password,Module,findvalue,findbywhat,order);
              		for(Etudiant e:l) {
              			out.print("<tr>");
              			out.print("<td>"+e.getModule()+"</td><td  >"+e.getApogee()+"</td><td  >"+e.getCne()+"</td><td  >"+e.getPrenom()+e.getNom()+"</td><td  >"+e.getDaten()+"</td><td  >"+e.getEtat_civil()+"</td><td  >"+e.getAdress()+"</td><td  >"+e.getPhone()+"</td><td  ><a  href=\"Updateetudiant.jsp?cne="+e.getCne()+"\" class=\"btn btn-success\">Update</a></td><td  ><a href=\"confairmationdelete.jsp?cne="+e.getCne()+"\" class=\"btn btn-danger\">Delete</a></td><td  ><a href=\"etudiantnoteaf.jsp?cne="+e.getCne()+"&module="+e.getModule()+"\" class=\"btn btn-secondary \">Note</a></td>");
              			out.print("</tr>");
              		}
                      %>                              
                      </tbody>
                    </table>
                  
                  </div>
            </div>
        </div>
     </div> 
     <script src="/projetTry1/js/bootstrap.bundle.min.js">
     </script>
</body>
</html>