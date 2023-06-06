package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EnsiegnantDAO {
        
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
	public static int   findByEmailPassName(String email,String password,String name) {
		int st=0;
		Connection con=EnsiegnantDAO.getConnection();
		Ensiegnant s=new Ensiegnant();
		String sql="select email ,concat(firstname,lastname) as name ,password  from ensiegnant where email=? and password=? and concat(firstname,lastname)=?;";
		try { 
		PreparedStatement stm= con.prepareStatement(sql);  
		   stm.setString(1, email);
		   stm.setString(2, password); 
		   stm.setString(3, name); 
		    ResultSet result=stm.executeQuery();
	    	  if(result.next()) { 
	    		  s.setPrenom(result.getString(1));
	    		  s.setEmail(result.getString(2));
	    		  s.setPassword(result.getString(3));  
	    		  st=1;
	    	  }
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return st;  
	}
	public static int   findByEmailPassNameadmin(String email,String password,String name) {
		int st=0;
		Connection con=EnsiegnantDAO.getConnection();
		Ensiegnant s=new Ensiegnant();
		String sql="select email ,concat(firstname,lastname) as name ,password  from admin where email=? and password=? and concat(firstname,lastname)=?;";
		try { 
		PreparedStatement stm= con.prepareStatement(sql);  
		   stm.setString(1, email);
		   stm.setString(2, password); 
		   stm.setString(3, name); 
		    ResultSet result=stm.executeQuery();
	    	  if(result.next()) { 
	    		  s.setPrenom(result.getString(1));
	    		  s.setEmail(result.getString(2));
	    		  s.setPassword(result.getString(3));  
	    		  st=1;
	    	  }
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return st;  
	}
	public static String   findByEmailCodeName(String email,int code,String name) { 
		String pass=null;
		Connection con=EnsiegnantDAO.getConnection(); 
		String sql="select password from ensiegnant where email=? and code=? and concat(firstname,lastname)=?;";
		try { 
		PreparedStatement stm= con.prepareStatement(sql);  
		   stm.setString(1, email);
		   stm.setInt(2, code); 
		   stm.setString(3, name); 
		    ResultSet result=stm.executeQuery();
	    	  if(result.next()) {  
	    		  pass=result.getString(1);  
	    	  }
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return pass;  
	}
	public static int   findByEmailName(String email,String name) {
		int in=0;
		Connection con=EnsiegnantDAO.getConnection();
		Ensiegnant s=new Ensiegnant();
		String sql="select email ,concat(firstname,lastname) as name from ensiegnant  where email=? and  concat(firstname,lastname)=?;";
		try { 
		PreparedStatement stm= con.prepareStatement(sql);  
		   stm.setString(1, email); 
		   stm.setString(2, name); 
		    ResultSet result=stm.executeQuery();
	    	  if(result.next()) { 
	    		  s.setPrenom(result.getString(1));
	    		  s.setEmail(result.getString(2)); 
	    		  in=1;
	    	  }
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return in;  
	}
	public static int   findByEmailPass(String email,String password) {
		int in=0;
		Connection con=EnsiegnantDAO.getConnection();
		Ensiegnant s=new Ensiegnant();
		String sql="select email   ,password from ensiegnant where email=? and password=?  ;";
		try { 
		PreparedStatement stm= con.prepareStatement(sql);  
		   stm.setString(1, email);
		   stm.setString(2, password); 
		    ResultSet result=stm.executeQuery();
	    	  if(result.next()) {  
	    		  s.setEmail(result.getString(1));
	    		  s.setPassword(result.getString(2)); 
	    		  in=1;
	    	  }
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return in;  
	}
	public static int   updatePasswordEnsiegnant(String email,String password,String npassword) {
		int in=0;
		Connection con=EnsiegnantDAO.getConnection(); 
		String sql=" update   ensiegnant set  password=? where email=? and password=?;"; 
		try { 
		PreparedStatement stm= con.prepareStatement(sql); 
		   stm.setString(2, email);
		   stm.setString(3, password); 
		   stm.setString(1, npassword); 
		   in =stm.executeUpdate(); 
		   
		   
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return in;  
	}
	public static int   saveEnsiegnant(Ensiegnant e) {
		int in=0;
		Connection con=EnsiegnantDAO.getConnection();
		Ensiegnant s=new Ensiegnant();
		String sql="insert into ensiegnant(code,email,password,firstname,lastname,status,fonction,departement,date_naissance,etatcivil) \r\n"
				+ "values(?,?,?,?,?,?,?,?,?,?);";
		try { 
		PreparedStatement stm= con.prepareStatement(sql);  
		   stm.setInt(1, e.getCode());
		   stm.setString(2, e.getEmail()); 
		   stm.setString(3, e.getPassword()); 
		   stm.setString(4, e.getPrenom());
		   stm.setString(5, e.getNom()); 
		   stm.setString(6, e.getStatus()); 
		   stm.setString(7, e.getFonction());
		   stm.setString(8, e.getDepartement()); 
		   stm.setDate(9, e.getDate()); 
		   stm.setString(10, e.getEtatcivil()); 
		   in =stm.executeUpdate();
		} catch (SQLException er) {
			er.printStackTrace();
		} 
		return in;  
	}
	public static ArrayList<String> EnsiegnantModule(String email,String password){
		ArrayList<String> modules=new ArrayList<String>();
    	Connection con=EnsiegnantDAO.getConnection();
    	String sql="select nom_module from module inner join ensei_module on module.id_module=ensei_module.id_module \r\n"
    			+ "where email=? and password=?;";
    	try { 
    		PreparedStatement stm= con.prepareStatement(sql);  
    		   stm.setString(1, email);
    		   stm.setString(2, password); 
    		    ResultSet result=stm.executeQuery();
    	    	  while(result.next()) {  
    	    		  modules.add(result.getString(1));  
    	    	  }
    		} catch (SQLException e) {
    			e.printStackTrace();
    		} 
    	return modules;
    }
	public static Ensiegnant Ensiegnantinfo(String email,String password){
		Ensiegnant e=new Ensiegnant();
    	Connection con=EnsiegnantDAO.getConnection();
    	String sql="select * from  ensiegnant \r\n"
    			+ "where email=? and password=?;";
    	try { 
    		PreparedStatement stm= con.prepareStatement(sql);  
    		   stm.setString(1, email);
    		   stm.setString(2, password); 
    		    ResultSet result=stm.executeQuery();
    	    	  if(result.next()) {  
    	    		  e.setCode(result.getInt(1)); 
    	    		  e.setEmail(result.getString(2));
    	    		  e.setPassword(result.getString(3));
    	    		  e.setPrenom(result.getString(4));
    	    		  e.setNom(result.getString(5));
    	    		  e.setStatus(result.getString(6));
    	    		  e.setFonction(result.getString(7));
    	    		  e.setDepartement(result.getString(8));
    	    		  e.setDate(result.getDate(9));
    	    		  e.setEtatcivil(result.getString(10));
    	    	  }
    		} catch (SQLException ex) {
    			ex.printStackTrace();
    		} 
    	return e;
    }
	public static int   updateinfoEnsiegnant(Ensiegnant e) {
		int in=0;
		Connection con=EnsiegnantDAO.getConnection(); 
		String sql=" update   ensiegnant set  firstname=? ,lastname=?,status=?,fonction=?,departement=?,date_naissance=?,etatcivil=? where email=? and password=?;"; 
		try { 
		PreparedStatement stm= con.prepareStatement(sql); 
		   stm.setString(2, e.getNom()); 
		   stm.setString(1, e.getPrenom());
		   stm.setString(3, e.getStatus());
		   stm.setString(4, e.getFonction());
		   stm.setString(5, e.getDepartement());
		   stm.setDate(6, e.getDate());
		   stm.setString(7, e.getEtatcivil());
		   stm.setString(8, e.getEmail());
		   stm.setString(9, e.getPassword());
		   in =stm.executeUpdate();
		   
		} catch (SQLException ex) {
			ex.printStackTrace();
		} 
		return in;  
	}
	public static ArrayList<ArrayList<Object>> getModules(String email,String password){
		ArrayList<ArrayList<Object>> lists=new ArrayList<ArrayList<Object>>();
		
    	Connection con=EnsiegnantDAO.getConnection();
    	String sql="select nom_module,nom_niveau,count(cne) from ensiegnant \r\n"
    			+ "inner join ensei_module \r\n"
    			+ "on ensiegnant.email=ensei_module.email and ensiegnant.password=ensei_module.password\r\n"
    			+ "inner join module \r\n"
    			+ "on ensei_module.id_module=module.id_module\r\n"
    			+ "inner join niveau \r\n"
    			+ "on module.id_niveau=niveau.id_niveau\r\n"
    			+ "left join etudiant \r\n"
    			+ "on niveau.id_niveau=etudiant.id_niveau \r\n"
    			+ "where ensiegnant.email=? and ensiegnant.password=? \r\n"
    			+ "group by nom_module,nom_niveau";
    	try { 
    		PreparedStatement stm= con.prepareStatement(sql);  
    		   stm.setString(1, email);
    		   stm.setString(2, password); 
    		    ResultSet result=stm.executeQuery();
    	    	  while(result.next()) {  
    	    		  ArrayList<Object> list=new ArrayList<Object>();
    	    		  list.add(result.getString(1));
    	    		  list.add(result.getString(2));
    	    		  list.add(result.getInt(3));
    	    		  System.out.println(result.getInt(3));
    	    		  lists.add(list);
    	    	  }
    		} catch (SQLException ex) {
    			ex.printStackTrace();
    		} 
    	return lists;
    }
	public static ArrayList<String> getModule(String email,String password){
		ArrayList<String> list=new ArrayList<String>();
		
    	Connection con=EnsiegnantDAO.getConnection();
    	String sql="select nom_module from module where id_module not in(select id_module from ensei_module where email=? and password=?) ";
    	try { 
    		PreparedStatement stm= con.prepareStatement(sql);   
    		stm.setString(1,email);
    		stm.setString(2,password);
    		    ResultSet result=stm.executeQuery();
    	    	  while(result.next()) {   
    	    		  list.add(result.getString(1));
    	    	  }
    		} catch (SQLException ex) {
    			ex.printStackTrace();
    		} 
    	return list;
    }
	public static int   ajouternewmodule(String module,String email,String password) {
		int in=0;
		Connection con=EnsiegnantDAO.getConnection(); 
		String sql="insert into ensei_module values(?,?,?)";
		
		try { 
		PreparedStatement stm= con.prepareStatement(sql);  
		String sql2="select id_module from module where nom_module=?";
		PreparedStatement stm2= con.prepareStatement(sql2); 
		
		stm2.setString(1,module.toLowerCase());
		ResultSet result=stm2.executeQuery(); 
  	  if(result.next()) {    
  		stm.setInt(1,result.getInt(1));
  	  } 
		   stm.setString(2, email); 
		   stm.setString(3,password);   
		   in =stm.executeUpdate();
		} catch (SQLException er) {
			er.printStackTrace();
		} 
		return in;  
	}
	public static int   deletemodule(String module,String email,String password) {
		int in=0;
		Connection con=FichDAO.getConnection(); 
		String sql="delete from ensei_module where id_module=? and email=? and password=?"; 
		try { 
		PreparedStatement stm= con.prepareStatement(sql);
		String sql2="select id_module from module where nom_module=?";
       PreparedStatement stm2= con.prepareStatement(sql2); 
		
		stm2.setString(1,module.toLowerCase());
		ResultSet result=stm2.executeQuery();
		System.out.println(stm2);
  	  if(result.next()) {    
  		stm.setInt(1,result.getInt(1));
  	  } 
  	  stm.setString(2,email);
  	stm.setString(3,password);
		   in =stm.executeUpdate();  
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return in;  
	}
	public static ArrayList<Ensiegnant> ensieinfo(  String findvalue,String findcre,String order){
		ArrayList<Ensiegnant> list= new ArrayList<Ensiegnant>(); 
		String sql;
		Connection con=EtudiantDAO.getConnection();
		PreparedStatement stm=null;
		if(findcre.equals("All")) { 
			sql="select * from ensiegnant    order by "+order+";";	
		       try {
				stm= con.prepareStatement(sql); 
			} catch (SQLException e) { 
				e.printStackTrace();
			}   
		}
		else {
			sql="select * from ensiegnant where "+findcre+"=?  order by "+order+";";	
		       try {
				stm= con.prepareStatement(sql); 
				stm.setString(1,findvalue);
				System.out.print(stm);				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
		}
		 
		try { 
			    ResultSet result=stm.executeQuery();
		    	  while(result.next()) {   
		    		  Ensiegnant e=new Ensiegnant();
		    		  e.setCode(result.getInt(1)); 
		    		  e.setEmail(result.getString(2));
		    		  e.setPassword(result.getString(3)); 
		    		  e.setPrenom(result.getString(4)); 
		    		  e.setNom(result.getString(5)); 
		    		  e.setStatus(result.getString(6)); 
		    		  e.setFonction(result.getString(7)); 
		    		  e.setDepartement(result.getString(8)); 
		    		  e.setDate(result.getDate(9));
		    		  e.setEtatcivil(result.getString(10));
		    		  list.add(e);
		    	  }
			} catch (SQLException ex) {
				ex.printStackTrace();
			} 
		return list;
	}
	public static int   deleteens(int code) {
		int in=0;
		Connection con=EtudiantDAO.getConnection();
		String sql="select email from ensiegnant where code=?";
		String email=null;
		try { 
		PreparedStatement stm= con.prepareStatement(sql);  
		   stm.setInt(1, code); 
		   ResultSet result=stm.executeQuery(); 
		   if(result.next()) {
			   email=result.getString(1);
		   }
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		sql="delete from ensei_module where email=?";
		try { 
		PreparedStatement stm= con.prepareStatement(sql);  
		   stm.setString(1, email); 
		   in =stm.executeUpdate(); 
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		 sql="delete from ensiegnant where code=?";
		try { 
		PreparedStatement stm= con.prepareStatement(sql);  
		   stm.setInt(1, code); 
		   in =stm.executeUpdate(); 
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return in;  
	}
	public static ArrayList<ArrayList<String>> getModules1(){
		ArrayList<ArrayList<String>> lists=new ArrayList<ArrayList<String>>();
		
    	Connection con=EnsiegnantDAO.getConnection();
    	String sql="select id_module,nom_module,nom_niveau from module \r\n"
    			+ "inner join niveau \r\n"
    			+ "on module.id_niveau=niveau.id_niveau\r\n" ;
    	try { 
    		PreparedStatement stm= con.prepareStatement(sql);   
    		    ResultSet result=stm.executeQuery();
    	    	  while(result.next()) {  
    	    		  ArrayList<String> list=new ArrayList<String>();
    	    		  list.add(result.getString(1));
    	    		  list.add(result.getString(2));
    	    		  list.add(result.getString(3));
    	    		  lists.add(list);
    	    	  }
    		} catch (SQLException ex) {
    			ex.printStackTrace();
    		} 
    	return lists;
    }
	public static ArrayList<String> getNiveau(){
		ArrayList<String> list=new ArrayList<String>(); 
    	Connection con=EnsiegnantDAO.getConnection();
    	String sql="select nom_niveau from niveau ";
    	try { 
    		PreparedStatement stm= con.prepareStatement(sql);    
    		    ResultSet result=stm.executeQuery();
    	    	  while(result.next()) {   
    	    		  list.add(result.getString(1));
    	    	  }
    		} catch (SQLException ex) {
    			ex.printStackTrace();
    		} 
    	return list;
    }
	public static int   ajoutermodule(String module,String niveau ) throws SQLException {
		int in=0;
		Connection con=EnsiegnantDAO.getConnection(); 
		String sql="insert into module values(?,?,?)";
		String sql2="select max(id_module)+1 from module ";
		PreparedStatement stm2= con.prepareStatement(sql2);  
		ResultSet result=stm2.executeQuery(); 
		int idm=0;
		if(result.next()) {    
  		idm=result.getInt(1);
  	  }   
		String sql3="select id_niveau from niveau where nom_niveau=?;";
		PreparedStatement stm3= con.prepareStatement(sql3); 
		stm3.setString(1,niveau);
		ResultSet result1=stm3.executeQuery(); 
		int idm2=0;
		if(result1.next()) {    
		idm2=result1.getInt(1);
	  }    
		try { 
		PreparedStatement stm= con.prepareStatement(sql);   
  	        stm.setInt(1,idm);
  	        stm.setString(2,module);
  	        stm.setInt(3,idm2);
		   in =stm.executeUpdate();
		} catch (SQLException er) {
			er.printStackTrace();
		} 
		return in;  
	}
	public static int   ajouterniveau( String niveau ) throws SQLException {
		int in=0;
		Connection con=EnsiegnantDAO.getConnection(); 
		String sql="insert into niveau values(?,?)";
		String sql2="select max(id_niveau)+1 from niveau ";
		PreparedStatement stm2= con.prepareStatement(sql2);  
		ResultSet result=stm2.executeQuery(); 
		int idm=0;
		if(result.next()) {    
  		idm=result.getInt(1);
  	  }    
		try { 
		PreparedStatement stm= con.prepareStatement(sql);   
  	        stm.setInt(1,idm);
  	        stm.setString(2,niveau); 
		   in =stm.executeUpdate();
		} catch (SQLException er) {
			er.printStackTrace();
		} 
		return in;  
	}
	public static int   deletemodule(int idmodule ) {
		int in=0;
		Connection con=FichDAO.getConnection(); 
		String sql="delete from ensei_module where id_module=?  "; 
		try { 
		PreparedStatement stm= con.prepareStatement(sql);
		 stm.setInt(1, idmodule);
		   in =stm.executeUpdate();  
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		 sql="delete from module where id_module=?  "; 
		try { 
		PreparedStatement stm= con.prepareStatement(sql);
		 stm.setInt(1, idmodule);
		   in =stm.executeUpdate();  
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return in;  
	}
	public static Ensiegnant admininfo(String email,String password){
		Ensiegnant e=new Ensiegnant();
    	Connection con=EnsiegnantDAO.getConnection();
    	String sql="select * from  admin \r\n"
    			+ "where email=? and password=?;";
    	try { 
    		PreparedStatement stm= con.prepareStatement(sql);  
    		   stm.setString(1, email);
    		   stm.setString(2, password); 
    		    ResultSet result=stm.executeQuery();
    	    	  if(result.next()) {  
    	    		  e.setCode(result.getInt(1)); 
    	    		  e.setEmail(result.getString(2));
    	    		  e.setPassword(result.getString(3));
    	    		  e.setPrenom(result.getString(4));
    	    		  e.setNom(result.getString(5));
    	    		  e.setStatus(result.getString(6));
    	    		  e.setFonction(result.getString(7));
    	    		  e.setDepartement(result.getString(8));
    	    		  e.setDate(result.getDate(9));
    	    		  e.setEtatcivil(result.getString(10));
    	    	  }
    		} catch (SQLException ex) {
    			ex.printStackTrace();
    		} 
    	return e;
    }
	public static int   updateinfoAdmin(Ensiegnant e) {
		int in=0;
		Connection con=EnsiegnantDAO.getConnection(); 
		String sql=" update   admin set  firstname=? ,lastname=?,status=?,fonction=?,departement=?,date_naissance=?,etatcivil=? where email=? and password=?;"; 
		try { 
		PreparedStatement stm= con.prepareStatement(sql); 
		   stm.setString(2, e.getNom()); 
		   stm.setString(1, e.getPrenom());
		   stm.setString(3, e.getStatus());
		   stm.setString(4, e.getFonction());
		   stm.setString(5, e.getDepartement());
		   stm.setDate(6, e.getDate());
		   stm.setString(7, e.getEtatcivil());
		   stm.setString(8, e.getEmail());
		   stm.setString(9, e.getPassword());
		   in =stm.executeUpdate();
		   
		} catch (SQLException ex) {
			ex.printStackTrace();
		} 
		return in;  
	}
} 

    