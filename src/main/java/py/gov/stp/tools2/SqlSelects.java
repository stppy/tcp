package py.gov.stp.tools2;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;

import objetos.Entidad;
import objetos.FactHitos;
import objetos.Generica;

import py.gov.stp.objetosV2.*;

import com.google.gson.Gson;
import com.google.gson.JsonObject;


public class SqlSelects {
	/*public static Connection ConnectionConfiguration.conectar(){
		 Connection con = null;
	        Statement st = null;
	        ResultSet rs = null;
	        try {Class.forName("com.mysql.jdbc.Driver");}
	        catch (ClassNotFoundException e) {e.printStackTrace();}
	        String url = "";
	        String user = "root";
	        String password = "t3R3R3.ol";

	        try {con = DriverManager.getConnection("jdbc:mysql://mysql01.stp.gov.py/spr", "root", "t3R3R3.ol");}
	        catch (SQLException ex) {
	            Logger lgr = Logger.getLogger(SqlHelper.class.getName());
	            lgr.log(Level.SEVERE, ex.getMessage(), ex);
	        } 
	        return con;
	}*/
	
	public static List<TipoAccion> selectTipoAccion() throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from tipo_accion";

		Statement statement = null;
		ResultSet rs=null;
		List<TipoAccion> objetos = new ArrayList<TipoAccion>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				TipoAccion objeto = new TipoAccion();
		
				objeto.setNombre(rs.getString("nombre"));
				objeto.setDescripcion(rs.getString("descripcion"));
				objeto.setBorrado(rs.getBoolean("borrado"));

				objetos.add(objeto);
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		finally{
			if (statement != null) {statement.close();}
			if (conect != null) {conect.close();}
		}
		return objetos; 
		}	
	
	public static List<UnidadMedida> selectUnidadMedida() throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from unidad_medida";

		Statement statement = null;
		ResultSet rs=null;
		List<UnidadMedida> objetos = new ArrayList<UnidadMedida>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				UnidadMedida objeto = new UnidadMedida();
		
				objeto.setNombre(rs.getString("nombre"));
				objeto.setDescripcion(rs.getString("descripcion"));
				objeto.setSigla(rs.getString("sigla"));
				objeto.setBorrado(rs.getBoolean("borrado"));

				objetos.add(objeto);
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		finally{
			if (statement != null) {statement.close();}
			if (conect != null) {conect.close();}
		}
		return objetos; 
		}	
	public static List<LineaEstrategica> selectLineaEstrategica() throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from linea_estrategica";

		Statement statement = null;
		ResultSet rs=null;
		List<LineaEstrategica> objetos = new ArrayList<LineaEstrategica>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				LineaEstrategica objeto = new LineaEstrategica();
		
				objeto.setNombre(rs.getString("nombre"));
				objeto.setDescripcion(rs.getString("descripcion"));
				objeto.setOrden(rs.getInt("orden"));
				objeto.setBorrado(rs.getBoolean("borrado"));

				objetos.add(objeto);
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		finally{
			if (statement != null) {statement.close();}
			if (conect != null) {conect.close();}
		}
		return objetos; 
		}	
	


}
