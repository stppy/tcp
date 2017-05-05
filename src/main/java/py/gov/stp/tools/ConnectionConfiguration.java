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
    public static final String URL = "jdbc:postgres://mysql01.stp.goy.py:3306/spr?useUnicode=true&characterEncoding=UTF-8";
    public static final String USERNAME = "bpm";
    public static final String PASSWORD = "cybiraconsulting2";
 
    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.postgres.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();
        }
 
        return connection;
    }
    public static Connection conectar(){
		 Connection con = null;
	        Statement st = null;
	        ResultSet rs = null;
	        try {Class.forName("org.postgresql.Driver");}
	        catch (ClassNotFoundException e) {e.printStackTrace();}
	        String url = "";
	        String user = "postgres";
	        String password = "postgres";

	        try {con = DriverManager.getConnection("jdbc:postgresql://pg01.stp.gov.py/tablero2015v3?useUnicode=true&characterEncoding=UTF-8&user=postgres&password=postgres");}
	        catch (SQLException ex) {
	            Logger lgr = Logger.getLogger(SqlHelper.class.getName());
	            lgr.log(Level.SEVERE, ex.getMessage(), ex);
	        } 
	        return con;
    }
//    	
//    	 Connection con = null;
//	        Statement st = null;
//	        ResultSet rs = null;
//	        try {Class.forName("com.mysql.jdbc.Driver");}
//	        catch (ClassNotFoundException e) {e.printStackTrace();}
//	        String url = "";
//	        String user = "root";
//	        String password = "postgres";
//
//	        try {con = DriverManager.getConnection("jdbc:mysql://mysql01.stp.gov.py/tablero2015?useUnicode=true&characterEncoding=UTF-8", "root", "postgres");}
//	        catch (SQLException ex) {
//	            Logger lgr = Logger.getLogger(SqlHelper.class.getName());
//	            lgr.log(Level.SEVERE, ex.getMessage(), ex);
//	        } 
//	        return con;
//	}
    public static Connection conectarBase(){
		 Connection con = null;
	        Statement st = null;
	        ResultSet rs = null;
	        try {Class.forName("org.postgresql.Driver");}
	        catch (ClassNotFoundException e) {e.printStackTrace();}
	        String url = "";
	        String user = "bpm";
	        String password = "cybiraconsulting2";

	        try {con = DriverManager.getConnection("jdbc:postgresql://pg02.stp.gov.py/base?useUnicode=true&characterEncoding=UTF-8&user=bpm&password=cybiraconsulting2");}
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
	        String url = "";
	        //String user = "root";
	        String user = "postgres";
	        String password = "postgres";

	        //try {con = DriverManager.getConnection("jdbc:mysql://mysql01.stp.gov.py/spr?useUnicode=true&characterEncoding=UTF-8", "root", "postgres");}
	        try {con = DriverManager.getConnection("jdbc:postgresql://pg01.stp.gov.py/spr?useUnicode=true&characterEncoding=UTF-8", "postgres", "postgres");}
	        catch (SQLException ex) {
	            Logger lgr = Logger.getLogger(SqlHelper.class.getName());
	            lgr.log(Level.SEVERE, ex.getMessage(), ex);
	        } 
	        return con;
	}
    public static Connection conectarSnpp(){
		 Connection con = null;
	        Statement st = null;
	        ResultSet rs = null;
	        try {Class.forName("com.mysql.jdbc.Driver");}
	        catch (ClassNotFoundException e) {e.printStackTrace();}
	        String url = "";
	        String user = "root";
	        String password = "postgres";

	        try {con = DriverManager.getConnection("jdbc:mysql://mysql01.stp.gov.py/tablero2015?useUnicode=true&characterEncoding=UTF-8", "root", "postgres");}
	        catch (SQLException ex) {
	            Logger lgr = Logger.getLogger(SqlHelper.class.getName());
	            lgr.log(Level.SEVERE, ex.getMessage(), ex);
	        } 
	        return con;
	}
    
 
}