package DAO;  
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
public class Main {

	public static void main(String[] args) {
		 ArrayList< Ensiegnant> l=EnsiegnantDAO.ensieinfo("All", "All", "code") ;
   		for(Ensiegnant e:l) {
   			System.out.println(e);
   		}
   		
	}
			 
		} 
