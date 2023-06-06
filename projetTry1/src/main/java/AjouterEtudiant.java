

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import DAO.Etudiant;
import DAO.EtudiantDAO;

/**
 * Servlet implementation class AjouterEtudiant
 */
public class AjouterEtudiant extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjouterEtudiant() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cne = request.getParameter("cne");
		String apogee = request.getParameter("apogee");
		String nom= request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String adress= request.getParameter("adress");
		String phone = request.getParameter("phone");
		String date=request.getParameter("daten"); 
		String etatc=request.getParameter("etatcivil"); 
		java.util.Date date2;
		Etudiant e=new Etudiant();
		try {
			date2 = new SimpleDateFormat("yyyy-mm-dd").parse(date);
			java.sql.Date sqlDate = new java.sql.Date(date2.getTime());
			e.setDaten(sqlDate);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String niveau=request.getParameter("niveau"); 
		
		int num;
		e.setCne(cne);
		e.setApogee(apogee); 
		e.setNiveau(niveau);
		e.setNom(nom);
		e.setPrenom(prenom);
		e.setEtat_civil(etatc);
		e.setAdress(adress);
		e.setPhone(phone);
		System.out.println(e);
		if(date.matches("^\\d{4}-\\d{2}-\\d{2}$") & phone.length()>8 & !EtudiantDAO.selectallcne().contains(cne)){
			num=1;
			EtudiantDAO.insertetudiant(e);
		}
		else if(!date.matches("^\\d{4}-\\d{2}-\\d{2}$")){
			num=2;
		}
		else if(phone.length()<8){
			num=3;
		}else{
			num=4;
		}
		request.setAttribute("num",num); 
		request.getRequestDispatcher("ajouteroper.jsp").forward(request, response);
	}
 

}
