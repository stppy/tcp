package py.gov.stp.tools2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import py.gov.stp.tools2.*;

public class ConnectionConfiguration {
	
    public static final String URL = "jdbc:mysql01://pg01.stp.goy.py:3306/spr?useUnicode=true&characterEncoding=UTF-8";
    public static final String USERNAME = "root";
    public static final String PASSWORD = "cybiraconsulting";
 
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
	        String password = "t3R3R3.ol";

	        try {con = DriverManager.getConnection("jdbc:postgresql://pg01.stp.gov.py/tablero2015v3?useUnicode=true&characterEncoding=UTF-8&user=postgres&password=t3R3R3.ol");}
	        catch (SQLException ex) {
	            Logger lgr = Logger.getLogger(SqlHelper.class.getName());
	            lgr.log(Level.SEVERE, ex.getMessage(), ex);
	        } 
	        return con;
	}

}