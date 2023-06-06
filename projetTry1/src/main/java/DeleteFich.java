

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import DAO.FichDAO;

/**
 * Servlet implementation class DeleteFich
 */
public class DeleteFich extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFich() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   String idfich1 =request.getParameter("idfich");
		   int idfich=Integer.parseInt(idfich1);
		   FichDAO.deleteetudiant(idfich);
		   response.sendRedirect("http://localhost:8080/projetTry1/absencemainpage.jsp?orderbywhat=id_fich&Module=All");
	}

	 

}
