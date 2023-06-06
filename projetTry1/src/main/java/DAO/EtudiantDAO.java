package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EtudiantDAO {
	public static Connection getConnection() {
		Connection con=null;
		try {
			Class.forName("org.postgresql.Driver");
			con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/absence","postgres","HN2002hn");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return con;
	}
	

public static ArrayList<Etudiant> etudiantinfo(String email,String password, String module,String findvalue,String findcre,String order){
	ArrayList<Etudiant> list= new ArrayList<Etudiant>(); 
	String sql;
	Connection con=EtudiantDAO.getConnection();
	PreparedStatement stm=null;
	if(module.equals("All") & findcre.equals("All")) { 
		sql="select nom_module, etudiant.cne, nom, prenom, etat_civil ,apogee, etudiant.date_naissance,adress,phone  \r\n"
				+ "from ensiegnant \r\n"
				+ "inner join ensei_module\r\n"
				+ "on ensei_module.email=ensiegnant.email and ensei_module.password=ensiegnant.password\r\n"
				+ "inner join module\r\n"
				+ "on ensei_module.id_module=module.id_module\r\n"
				+ "inner join niveau\r\n"
				+ "on niveau.id_niveau=module.id_niveau\r\n"
				+ "inner join etudiant\r\n"
				+ "on niveau.id_niveau=etudiant.id_niveau\r\n"
				+ "where ensiegnant.email=? and ensiegnant.password=? order by "+order+";";	
	       try {
			stm= con.prepareStatement(sql);
			stm.setString(1, email);
		    stm.setString(2, password);  
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		   
	}
	else if((!module.equals("All")) & findcre.equals("All")) { 	 
		sql="select nom_module, etudiant.cne, nom, prenom, etat_civil ,apogee, etudiant.date_naissance,adress,phone  \r\n"
				+ "from ensiegnant \r\n"
				+ "inner join ensei_module\r\n"
				+ "on ensei_module.email=ensiegnant.email and ensei_module.password=ensiegnant.password\r\n"
				+ "inner join module\r\n"
				+ "on ensei_module.id_module=module.id_module\r\n"
				+ "inner join niveau\r\n"
				+ "on niveau.id_niveau=module.id_niveau\r\n"
				+ "inner join etudiant\r\n"
				+ "on niveau.id_niveau=etudiant.id_niveau\r\n"
				+ "where ensiegnant.email=? and ensiegnant.password=? and nom_module=? order by "+order+";";	
	       try {
			stm= con.prepareStatement(sql);
			stm.setString(1, email);
		    stm.setString(2, password);
		    stm.setString(3,module);  
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	}
	else if((module.equals("All")) & (!findcre.equals("All"))) { 
		sql="select nom_module, etudiant.cne, nom, prenom, etat_civil ,apogee, etudiant.date_naissance,adress,phone  \r\n"
				+ "from ensiegnant \r\n"
				+ "inner join ensei_module\r\n"
				+ "on ensei_module.email=ensiegnant.email and ensei_module.password=ensiegnant.password\r\n"
				+ "inner join module\r\n"
				+ "on ensei_module.id_module=module.id_module\r\n"
				+ "inner join niveau\r\n"
				+ "on niveau.id_niveau=module.id_niveau\r\n"
				+ "inner join etudiant\r\n"
				+ "on niveau.id_niveau=etudiant.id_niveau\r\n"
				+ "where ensiegnant.email=? and ensiegnant.password=? and "+findcre+" like ?  order by "+order+";";	
	       try {
			stm= con.prepareStatement(sql); 
			stm.setString(1, email);
		    stm.setString(2, password); 
		    stm.setString(3,"%"+findvalue+"%");  
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 	
	}
	else { 
		sql="select nom_module, etudiant.cne, nom, prenom, etat_civil ,apogee, etudiant.date_naissance,adress,phone  \r\n"
				+ "from ensiegnant \r\n"
				+ "inner join ensei_module\r\n"
				+ "on ensei_module.email=ensiegnant.email and ensei_module.password=ensiegnant.password\r\n"
				+ "inner join module\r\n"
				+ "on ensei_module.id_module=module.id_module\r\n"
				+ "inner join niveau\r\n"
				+ "on niveau.id_niveau=module.id_niveau\r\n"
				+ "inner join etudiant\r\n"
				+ "on niveau.id_niveau=etudiant.id_niveau\r\n"
				+ "where ensiegnant.email=? and ensiegnant.password=? and "+findcre+" like ? and nom_module=?  order by "+order+";";	
	       try {
			stm= con.prepareStatement(sql);
			stm.setString(1, email);
		    stm.setString(2, password); 
		    stm.setString(3,"%"+findvalue+"%");
		    stm.setString(4,module);  
		} catch (SQLException e) {
			  
			e.printStackTrace();
		}	
	}
	try { 
		    ResultSet result=stm.executeQuery();
	    	  while(result.next()) {  
	    		  Etudiant e=new Etudiant();
	    		  e.setCne(result.getString(2));
	    		  e.setModule(result.getString(1));
	    		  e.setNom(result.getString(3));
	    		  e.setPrenom(result.getString(4));
	    		  e.setEtat_civil(result.getString(5));
	    		  e.setApogee(result.getString(6));
	    		  e.setDaten(result.getDate(7));
	    		  e.setAdress(result.getString(8));
	    		  e.setPhone(result.getString(9));
	    		  list.add(e);
	    	  }
		} catch (SQLException ex) {
			ex.printStackTrace();
		} 
	return list;
}
public static int   deleteetudiant(String cne) {
	int in=0;
	Connection con=EtudiantDAO.getConnection();  
	String sql="delete from etudfich where cne=?";
	try { 
	PreparedStatement stm= con.prepareStatement(sql);  
	   stm.setString(1, cne); 
	   in =stm.executeUpdate(); 
	} catch (SQLException e) {
		e.printStackTrace();
	} 
	 sql="delete from module_etudiant where cne=?";
	try { 
	PreparedStatement stm= con.prepareStatement(sql);  
	   stm.setString(1, cne); 
	   in =stm.executeUpdate(); 
	} catch (SQLException e) {
		e.printStackTrace();
	} 
	 sql="delete from etudiant where cne=?";
	try { 
	PreparedStatement stm= con.prepareStatement(sql);  
	   stm.setString(1, cne); 
	   in =stm.executeUpdate(); 
	} catch (SQLException e) {
		e.printStackTrace();
	} 
	return in;  
}
public static int   insertetudiant(Etudiant e) {
	int in=0;
	Connection con=EtudiantDAO.getConnection(); 
	String sql="insert into etudiant values(?,?,?,?,?,?,?,?,?);";
	String id="select id_niveau from niveau where nom_niveau=?";
	
	
	try { 
	PreparedStatement stm2= con.prepareStatement(id);
	stm2.setString(1,e.getNiveau());
	ResultSet result=stm2.executeQuery();
	  if(result.next()) {  
		  PreparedStatement stm= con.prepareStatement(sql);  
		   stm.setString(1, e.getCne());
		   stm.setString(2, e.getNom()); 
		   stm.setString(3, e.getPrenom()); 
		   stm.setString(4, e.getEtat_civil()); 
		   stm.setString(5 ,e.getApogee()); 
		   stm.setDate(6, e.getDaten()); 
		   stm.setInt(7,result.getInt(1));
		   stm.setString(8, e.getAdress());
		   stm.setString(9, e.getPhone());
		   in =stm.executeUpdate(); 
	  }  
	} catch (SQLException ex) {
		ex.printStackTrace();
	} 
	return in;  
}
public static Etudiant   findByCne(String cne) { 
	Connection con=EtudiantDAO.getConnection();
	Etudiant s=new Etudiant();
	String sql="select cne,nom,prenom,etat_civil,apogee,date_naissance,nom_niveau,adress,phone from etudiant inner join niveau on etudiant.id_niveau = niveau.id_niveau where cne=?;";
	try { 
	PreparedStatement stm= con.prepareStatement(sql);  
	   stm.setString(1, cne); 
	    ResultSet result=stm.executeQuery();
    	  if(result.next()) {  
    		  s.setCne(result.getString(1));
    		  s.setNom(result.getString(2));
    		  s.setPrenom(result.getString(3));
    		  s.setEtat_civil(result.getString(4));
    		  s.setApogee(result.getString(5));
    		  s.setDaten(result.getDate(6));
    		  s.setNiveau(result.getString(7)); 
    		  s.setAdress(result.getString(8));
    		  s.setPhone(result.getString(9));
    	  }
	} catch (SQLException e) {
		e.printStackTrace();
	} 
	return s;  
}
public static ArrayList<Float>   selectnotes(String cne,String module) { 
	Connection con=EtudiantDAO.getConnection();
	ArrayList<Float> notes=new ArrayList<Float>();
	String sql="select note1,note2,participation\r\n"
			+ "from etudiant  \r\n"
			+ "inner join module_etudiant\r\n"
			+ "on etudiant.cne=module_etudiant.cne \r\n"
			+ "inner join module\r\n"
			+ "on module_etudiant.id_module=module.id_module \r\n"
			+ "where nom_module=? and etudiant.cne=?;";
	try { 
	PreparedStatement stm= con.prepareStatement(sql);  
	     stm.setString(1,module); 
	     stm.setString(2, cne); 
	    ResultSet result=stm.executeQuery();
    	  if(result.next()) {  
    		   notes.add(result.getFloat(1));
    		   notes.add(result.getFloat(2));
    		   notes.add(result.getFloat(3));
    	  }
    	  else {
    		  notes.add(0f);
   		      notes.add(0f);
   		      notes.add(0f);
    	  }
	} catch (SQLException e) {
		e.printStackTrace();
	} 
	return notes;  
}
public static ArrayList<String> selectallcne() { 
	Connection con=EtudiantDAO.getConnection();
	ArrayList<String> s=new ArrayList<String>(); 
	String sql="select cne from etudiant;";
	try { 
	PreparedStatement stm= con.prepareStatement(sql);   
	    ResultSet result=stm.executeQuery();
    	  while(result.next()) {   
    		  s.add(result.getString(1));
    	  }
	} catch (SQLException e) {
		e.printStackTrace();
	} 
	return s;  
}
public static int   updateetudiant(Etudiant e) {
	int in=0;
	Connection con=EtudiantDAO.getConnection(); 
	String sql="update  etudiant set nom=? , prenom=?,etat_civil=?,apogee=?,date_naissance=?,id_niveau=?,adress=?,phone=? where cne=?";
	String id="select id_niveau from niveau where nom_niveau=?";
	
	
	try { 
	PreparedStatement stm2= con.prepareStatement(id);
	stm2.setString(1,e.getNiveau());
	ResultSet result=stm2.executeQuery();
	  if(result.next()) {  
		  PreparedStatement stm= con.prepareStatement(sql);  
		   
		   stm.setString(1, e.getNom()); 
		   stm.setString(2, e.getPrenom()); 
		   stm.setString(3, e.getEtat_civil()); 
		   stm.setString(4 ,e.getApogee()); 
		   stm.setDate(5, e.getDaten()); 
		   stm.setInt(6,result.getInt(1)); 
		   stm.setString(7, e.getAdress()); 
		   stm.setString(8, e.getPhone()); 
		   stm.setString(9, e.getCne());
		   System.out.println(stm);
		   in =stm.executeUpdate();  
	  }  
	} catch (SQLException ex) {
		ex.printStackTrace();
	} 
	return in;  
}
 
public static int   updatenoteetudiant(String cne,String module,float n1,float n2,float n3) {
	int in=0;
	Connection con=EtudiantDAO.getConnection(); 
	String id="select id_module from module where nom_module=?";
	String sql1="delete from module_etudiant where cne=? and id_module=?;";
	String sql="insert into module_etudiant values(?,?,?,?,?);";  
	try { 
	PreparedStatement stm2= con.prepareStatement(id);
	stm2.setString(1,module);
	ResultSet result=stm2.executeQuery();
	  if(result.next()) {    
		  PreparedStatement stm1= con.prepareStatement(sql1);
		  stm1.setString(1,cne);
		  stm1.setInt(2,result.getInt(1));
		  stm1.executeUpdate();
		  PreparedStatement stm= con.prepareStatement(sql);
		  stm.setInt(1,result.getInt(1));
		  stm.setString(2,cne);
		  stm.setFloat(3,n1);
		  stm.setFloat(4,n2);
		  stm.setFloat(5,n3);
		  stm.executeUpdate();
	  }  
	} catch (SQLException ex) {
		ex.printStackTrace();
	} 
	return in;  
}
public static Etudiant etudiant(String cne){
	Etudiant e = null;
	String sql;
	Connection con=EtudiantDAO.getConnection();
	PreparedStatement stm=null; 
		sql="select  etudiant.cne, nom, prenom \r\n"
				+ "from etudiant \r\n" 
				+ "where cne=?;";	
	       try {
			stm= con.prepareStatement(sql);
			stm.setString(1, cne); 
		} catch (SQLException ex) {
			// TODO Auto-generated catch block
			ex.printStackTrace();
		}  
	try { 
		    ResultSet result=stm.executeQuery();
	    	  if(result.next()) {  
	    		  e=new Etudiant();
	    		  e.setCne(result.getString(1)); 
	    		  e.setNom(result.getString(2));
	    		  e.setPrenom(result.getString(3)); 
	    	  }
		} catch (SQLException ex) {
			ex.printStackTrace();
		} 
	return e;
}
}

