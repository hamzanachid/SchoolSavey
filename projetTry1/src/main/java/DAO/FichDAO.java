package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class FichDAO { 
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
		 
		public static ArrayList<Fichabsence> fichsinfo(String email,String password, String module,String order){
			ArrayList<Fichabsence> list= new ArrayList<Fichabsence>(); 
			String sql;
			Connection con=FichDAO.getConnection();
			PreparedStatement stm=null;
			if(order.equals("nbrabsence")) {
				order="count(cne)";
			}
			if(module.equals("All")) { 
				sql=  "select fichabsence.id_fich,date_fich,typefich,fichabsence.id_module,count(cne) \r\n"
						+ "from etudfich  \r\n"
						+ "inner join fichabsence on fichabsence.id_fich=etudfich.id_fich\r\n"
						+ "inner join module on module.id_module=fichabsence.id_module\r\n"
						+ "inner join ensei_module on ensei_module.id_module=module.id_module\r\n"
						+ "where email=? and password=?   \r\n"
						+ "group by fichabsence.id_fich  \r\n"
						+ "order by  "+order;
			       try {
					stm= con.prepareStatement(sql);
					stm.setString(1, email);
				    stm.setString(2, password);  
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}  
			       
				   
			}
			else if((!module.equals("All")) ) { 	 
				sql=  "select fichabsence.id_fich,date_fich,typefich,fichabsence.id_module,count(cne) \r\n"
						+ "from etudfich  \r\n"
						+ "inner join fichabsence on fichabsence.id_fich=etudfich.id_fich\r\n"
						+ "inner join module on module.id_module=fichabsence.id_module\r\n"
						+ "inner join ensei_module on ensei_module.id_module=module.id_module\r\n"
						+ "where email=? and password=? and nom_module=?   \r\n"
						+ "group by fichabsence.id_fich  \r\n"
						+ "order by  "+order;	
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
			try { 
				    ResultSet result=stm.executeQuery();
			    	  while(result.next()) {  
			    		   Fichabsence e =new Fichabsence();
			    		   e.setIdfich(result.getInt(1));
			    		   e.setDatefich(result.getDate(2));
			    		   e.setTypefich(result.getString(3)); 
			    		   String id="select nom_module from module where id_module=?";
			    		   PreparedStatement stm2= con.prepareStatement(id);
			    			stm2.setInt(1,result.getInt(4));
			    			ResultSet result2=stm2.executeQuery();
			    			if(result2.next()) {
			    				e.setModule(result2.getString(1));
			    			}
			    		   e.setCount(result.getInt(5)); 
			    		   list.add(e);
			    	  }
				} catch (SQLException ex) {
					ex.printStackTrace();
				} 
			return list;
		}
		public static int   deleteetudiant(int idfich) {
			int in=0;
			Connection con=FichDAO.getConnection(); 
			String sql="delete from etudfich where id_fich=?";
			String sql2="delete from fichabsence where id_fich=?";
			try { 
			PreparedStatement stm= con.prepareStatement(sql);  
			   stm.setInt(1, idfich); 
			   in =stm.executeUpdate(); 
			   PreparedStatement stm2= con.prepareStatement(sql2);  
			   stm2.setInt(1, idfich); 
			   in =stm2.executeUpdate(); 
			} catch (SQLException e) {
				e.printStackTrace();
			} 
			return in;  
		}
		public static Fichabsence fichinfo(int idfich){
			Fichabsence f=new Fichabsence(); 
			Connection con=FichDAO.getConnection();
			PreparedStatement stm=null;  
			String 	sql=   "select * from fichabsence where id_fich=?";
			       try {
					stm= con.prepareStatement(sql);
					stm.setInt(1, idfich); 
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}   
			try { 
				    ResultSet result=stm.executeQuery();
			    	  if(result.next()) {   
			    		   f.setIdfich(result.getInt(1));
			    		   f.setDatefich(result.getDate(2));
			    		   f.setTypefich(result.getString(4)); 
			    		   String id="select nom_module from module where id_module=?";
			    		   PreparedStatement stm2= con.prepareStatement(id);
			    			stm2.setInt(1,result.getInt(3));
			    			ResultSet result2=stm2.executeQuery();
			    			if(result2.next()) {
			    				f.setModule(result2.getString(1));
			    			}   
			    	  }
				} catch (SQLException ex) {
					ex.printStackTrace();
				} 
			return f;
		}
		public static ArrayList<String> selectabsenteetud(int idfich) { 
			Connection con=FichDAO.getConnection();
			ArrayList<String> s=new ArrayList<String>(); 
			String sql="select cne from etudfich where id_fich=?;";
			try { 
			PreparedStatement stm= con.prepareStatement(sql);   
			stm.setInt(1,idfich);
			    ResultSet result=stm.executeQuery();
		    	  while(result.next()) {   
		    		  s.add(result.getString(1));
		    	  }
			} catch (SQLException e) {
				e.printStackTrace();
			} 
			return s;  
		}
		public static Fichabsence newfileabsence(String module) { 
			Connection con=FichDAO.getConnection(); 
			Fichabsence f=new Fichabsence(); 
			java.sql.Date date_fich = new  java.sql.Date(System.currentTimeMillis());
			int id_module=0;
			int id_fich=0;
			String sql;
			sql="select max(id_fich)+1 from fichabsence ;";  
			try { 
			PreparedStatement stm= con.prepareStatement(sql);  
			    ResultSet result=stm.executeQuery();
		    	  if(result.next()) {   
		    		  id_fich=result.getInt(1);
		    	  }
			} catch (SQLException e) {
				e.printStackTrace();
			} 
			sql="select id_module from module where nom_module=?";
			try { 
				PreparedStatement stm= con.prepareStatement(sql);  
				stm.setString(1,module);
				    ResultSet result=stm.executeQuery();
			    	  if(result.next()) {   
			    		  id_module=result.getInt(1);
			    	  }
				} catch (SQLException e) {
					e.printStackTrace();
				} 
			sql="insert into fichabsence(id_fich,date_fich,id_module) values(?,?,?)";
			try { 
				PreparedStatement stm= con.prepareStatement(sql); 
				stm.setInt(1, id_fich); 
				stm.setInt(3, id_module); 
				stm.setDate(2, date_fich); 
				stm.executeUpdate(); 
				f.setIdfich(id_fich);
				f.setDatefich(date_fich);
			    f.setModule(module);
				} catch (SQLException e) {
					e.printStackTrace();
				} 	
			return f;  
		}
		public static int   insertabs(int idfich,String cne,String typefich ) {
			int in=0;
			Connection con=FichDAO.getConnection(); 
			String sql;
			
			sql="insert into etudfich(id_fich,cne) values(?,?) ";  
			try { 
			PreparedStatement stm= con.prepareStatement(sql);  
			   stm.setInt(1, idfich); 
			   stm.setString(2, cne);  
			   in =stm.executeUpdate();   
			} catch (SQLException e) {
				e.printStackTrace();
			} 
			sql="update fichabsence set Typefich=?  where id_fich=?";
			try { 
				PreparedStatement stm= con.prepareStatement(sql);  
				   stm.setString(1, typefich);  
				   stm.setInt(2, idfich); 
				   in =stm.executeUpdate();   
				} catch (SQLException e) {
					e.printStackTrace();
				} 
			return in;  
		}
		public static ArrayList<List> absetud( String email,String password,String module){ 
			ArrayList<List> lists=new ArrayList<List>();
			String sql;
			Connection con=FichDAO.getConnection();
			PreparedStatement stm=null;  
			if(module.equals("All")) {
				sql="select nom_module, etudiant.cne, nom, prenom  \r\n"
						+ "from ensiegnant \r\n"
						+ "inner join ensei_module\r\n"
						+ "on ensei_module.email=ensiegnant.email and ensei_module.password=ensiegnant.password\r\n"
						+ "inner join module\r\n"
						+ "on ensei_module.id_module=module.id_module\r\n"
						+ "inner join niveau\r\n"
						+ "on niveau.id_niveau=module.id_niveau\r\n"
						+ "inner join etudiant\r\n"
						+ "on niveau.id_niveau=etudiant.id_niveau\r\n"
						+ "where ensiegnant.email=? and ensiegnant.password=?  ;";	
				   try {
						stm= con.prepareStatement(sql);
						stm.setString(1, email);
					    stm.setString(2, password); 
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} 
			}
			else {
				sql="select nom_module, etudiant.cne, nom, prenom  \r\n"
						+ "from ensiegnant \r\n"
						+ "inner join ensei_module\r\n"
						+ "on ensei_module.email=ensiegnant.email and ensei_module.password=ensiegnant.password\r\n"
						+ "inner join module\r\n"
						+ "on ensei_module.id_module=module.id_module\r\n"
						+ "inner join niveau\r\n"
						+ "on niveau.id_niveau=module.id_niveau\r\n"
						+ "inner join etudiant\r\n"
						+ "on niveau.id_niveau=etudiant.id_niveau\r\n"
						+ "where ensiegnant.email=? and ensiegnant.password=? and nom_module=? ;";
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
				
			    
			try { 
				    ResultSet result=stm.executeQuery();
			    	  while(result.next()) {  
			    		   List<Object> list= new ArrayList<>(); 
			    		   list.add(result.getString(2));
			    		   list.add(result.getString(4));
			    		   list.add(result.getString(3));
			    		   list.add(result.getString(1));
			    		   String sql1="select count(etudfich.id_fich) \r\n"
			    		   		+ "from etudfich \r\n"
			    		   		+ "inner join fichabsence \r\n"
			    		   		+ "on etudfich.id_fich=fichabsence.id_fich \r\n"
			    		   		+ "inner join module \r\n"
			    		   		+ "on module.id_module=fichabsence.id_module \r\n"
			    		   		+ "where cne=?  and nom_module=?\r\n"
			    		   		+ "group by cne ,nom_module";
			    		   stm= con.prepareStatement(sql1);
							stm.setString(1, result.getString(2));
						    stm.setString(2, result.getString(1)); 
						    ResultSet result2=stm.executeQuery();
						    if(result2.next()) {
						    	int n=result2.getInt(1);
						    	list.add(n);
						    	String sact;
						    	if(1<=n && n<=3) {
						    		sact="nothing";
						    	}
						    	else if(4<=n && n<=10) {
						    		sact="Participation-"+(0.75*n);
						    	}
						    	else {
						    		sact="ne pass pas exam";
						    	}
						    	list.add(sact);
						    	lists.add(list); 
						    }
						   
			    	  }
				} catch (SQLException ex) {
					ex.printStackTrace();
				} 
			return lists;
		}
		 
		public static ArrayList<ArrayList<Object>> etudfich(String cne,String module){ 
			Connection con=FichDAO.getConnection();
		ArrayList<ArrayList<Object>> lists=new ArrayList<ArrayList<Object>>();
			PreparedStatement stm=null;  
			String 	sql=   "select etudfich.id_fich, justification \r\n"
					+ "from etudfich\r\n"
					+ "inner join fichabsence\r\n"
					+ "on etudfich.id_fich=fichabsence.id_fich\r\n"
					+ "inner join module\r\n"
					+ "on module.id_module=fichabsence.id_module\r\n"
					+ "where cne=? and nom_module=?";
			       try {
					stm= con.prepareStatement(sql);
					stm.setString(1, cne);
					stm.setString(2,  module); 
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}   
			try { 
				    ResultSet result=stm.executeQuery();
			    	  while(result.next()) {    
			    		  ArrayList<Object> list=new ArrayList<Object>();
			    		  Fichabsence l=FichDAO.fichinfo(result.getInt(1));
			    		  list.add(l.getIdfich()); 
			    		  list.add(l.getDatefich());
			    		  list.add(l.getTypefich()); 
			    		  String stf=null;
			    		  if(result.getString(2)==null) {
			    			  stf="--";
			    		  }
			    		  else {
			    			  stf=result.getString(2);
			    		  }
			    		  list.add(stf);
			    		  System.out.println(list);
			    		  lists.add(list);
			    	  }
				} catch (SQLException ex) {
					ex.printStackTrace();
				} 
			
			return lists;
		}
		public static int   updatejust(int idfich,String cne,String justf) {
			int in=0;
			Connection con=FichDAO.getConnection(); 
			String sql="update etudfich set justification=? where cne=? and id_fich=? "; 
			try { 
			PreparedStatement stm= con.prepareStatement(sql);  
			   stm.setString(1, justf);  
			   stm.setString(2, cne); 
			   stm.setInt(3, idfich); 
			   in =stm.executeUpdate(); 
			} catch (SQLException e) {
				e.printStackTrace();
			} 
			return in;  
		}
		 
}
