package py.gov.stp.tools;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * 	@author DGTIC-STP
 *  @email  dgtic@stp.gov.py 
 */

public class ConnectionConfiguration {

    public static Connection conectar(){
		 Connection con = null;
	        Statement st = null;
	        ResultSet rs = null;
	        try {Class.forName("org.postgresql.Driver");}
	        catch (ClassNotFoundException e) {e.printStackTrace();}

	        try {con = DriverManager.getConnection("jdbc:postgresql://localhost/tablero?useUnicode=true&characterEncoding=UTF-8&user=postgres&password=postgres");}
	        catch (SQLException ex) {
	            Logger lgr = Logger.getLogger(SqlHelper.class.getName());
	            lgr.log(Level.SEVERE, ex.getMessage(), ex);
	        } 
	        return con;
    }
    public static Connection conectarConsulta(){
		 Connection con = null;
	        Statement st = null;
	        ResultSet rs = null;
	        try {Class.forName("org.postgresql.Driver");}
	        catch (ClassNotFoundException e) {e.printStackTrace();}

	        try {con = DriverManager.getConnection("jdbc:postgresql://localhost/tablero?useUnicode=true&characterEncoding=UTF-8&user=postgres&password=postgres");}
	        catch (SQLException ex) {
	            Logger lgr = Logger.getLogger(SqlHelper.class.getName());
	            lgr.log(Level.SEVERE, ex.getMessage(), ex);
	        } 
	        return con;
   }
    public static Connection conectarSpr(){
		 Connection con = null;
	        Statement st = null;
	        ResultSet rs = null;
	        //try {Class.forName("com.mysql.jdbc.Driver");}
	        try {Class.forName("org.postgresql.Driver");}
	        catch (ClassNotFoundException e) {e.printStackTrace();}
	        try {con = DriverManager.getConnection("jdbc:postgresql://localhost/spr?useUnicode=true&characterEncoding=UTF-8", "postgres", "postgres");}
	        catch (SQLException ex) {
	            Logger lgr = Logger.getLogger(SqlHelper.class.getName());
	            lgr.log(Level.SEVERE, ex.getMessage(), ex);
	        } 
	        return con;
	}
    public static Connection conectarSprConsulta(){
		 Connection con = null;
	        Statement st = null;
	        ResultSet rs = null;
	        //try {Class.forName("com.mysql.jdbc.Driver");}
	        try {Class.forName("org.postgresql.Driver");}
	        catch (ClassNotFoundException e) {e.printStackTrace();}

	        try {con = DriverManager.getConnection("jdbc:postgresql://localhost/spr?useUnicode=true&characterEncoding=UTF-8", "postgres", "postgres");}
	        catch (SQLException ex) {
	            Logger lgr = Logger.getLogger(SqlHelper.class.getName());
	            lgr.log(Level.SEVERE, ex.getMessage(), ex);
	        } 
	        return con;
	}   
 
}
