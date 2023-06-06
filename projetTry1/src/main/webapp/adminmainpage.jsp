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
String lien1="href=\"/projetTry1/adminmainpage.jsp?orderbywhat=code&findbywhat=All&findvalue=any\"";  
String lien2="href=\"/projetTry1/Allmodules.jsp\""; 
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
                    <a <%=lien2 %>  class="btn1">module</a>  
                </div>
            </div>
            <div class="profile">
                <div class="profile-content">
                   <% String lien="href=\"/projetTry1/profile2.jsp?email="+email+"&password="+password+"\"";%>
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
                  <h1>Ensiegnant Space</h1>
            </div>
            <div class="buttons">
                 <div class="addbu">
                    <a class="btn2" href="/projetTry1/ajouterensie.jsp">Add ensiegnant</a>
                 </div>
                 <form action="adminmainpage.jsp">
                 <div class="searchbtn">
                        <div class="secondselection">
                        <label class="labelmodule" for="inputGroupSelect01">Order</label>
                        <select class="selectionmodule selectionstyle"  id="inputGroupSelect01" name="orderbywhat">
                            <option selected>code</option>
                            <option >email</option>
                            <option value='lastname' >nom</option>
                            <option value='firstname'>prenom</option>
                            <option >date_naissance</option>   
                        </select>
                        </div>   
                        <div class="secondselection">
                        <input type="text" class="findinput" name="findvalue" placeholder="values">
                        <select class="selectionmodule selectionstyle"  id="inputGroupSelect01" name="findbywhat">
                            <option selected >All</option> 
                            <option >email</option>
                            <option value='lastname'>nom</option> 
                            <option value='firstname'>prenom</option>  
                            <option >date_naissance</option>  
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
                        <th scope="col">code</th>  
                          <th scope="col">email</th> 
                          <th scope="col">date_naissance</th>
                          <th scope="col">fullname</th> 
                          <th scope="col">status</th> 
                          <th scope="col">etat_civil</th>
                          <th scope="col">departement</th>  
                          <th scope="col">delete</th>
                        </tr>
                      </thead>
                      <tbody> 
                       <%  
						String findvalue=request.getParameter("findvalue");
						String findbywhat=request.getParameter("findbywhat"); 
						String order=request.getParameter("orderbywhat");
						%>	
                      <%
                      ArrayList< Ensiegnant> list=EnsiegnantDAO.ensieinfo(findvalue, findbywhat, order) ;
              		for(Ensiegnant e:list) {
              			out.print("<tr>");
              			out.print("<td>"+e.getCode()+"</td><td  >"+e.getEmail()+"</td><td  >"+e.getDate()+"</td><td  >"+e.getPrenom()+e.getNom()+"</td><td  >"+e.getStatus()+"</td><td  >"+e.getEtatcivil()+"</td><td  >"+e.getDepartement()+"</td><td  ><a href=\"deleteensie.jsp?code="+e.getCode()+"\" class=\"btn btn-danger\">Delete</a></td>");
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