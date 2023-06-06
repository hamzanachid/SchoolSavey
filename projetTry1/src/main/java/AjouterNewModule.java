

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import DAO.EnsiegnantDAO;

/**
 * Servlet implementation class AjouterNewModule
 */ 
@WebServlet("/AjouterNewModule")  
public class AjouterNewModule extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjouterNewModule() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String module=request.getParameter("module"); 
		EnsiegnantDAO.ajouternewmodule(module, email, password);
		response.sendRedirect("modulemainpage.jsp?email="+email+"&password="+password);
	}
 

}
