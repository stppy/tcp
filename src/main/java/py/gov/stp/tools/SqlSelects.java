package py.gov.stp.tools;



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
import objetos.Generica2;
import objetos.Generica3;
import objetos.LineaAccion;
import objetos.LineaAccionAcumuladoMes;
import objetos.LineaAccionDepartamento;
import objetos.LineaAccionDistrito;
import objetos.MetasDistEntLinea;
import py.gov.stp.objetosV2.AccionCatalogo;
import py.gov.stp.objetosV2.AccionHasProducto;
import py.gov.stp.tools2.ConnectionConfiguration;

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
	
	public static List<Usuario> selectUsuario(String condition) throws SQLException{
 	 Connection conect=ConnectionConfiguration.conectarSpr();
		 String query = " select * from usuario "+condition;
		 
		 Statement statement = null;
		 ResultSet rs=null;
		 List<Usuario> objetos = new ArrayList<Usuario>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				Usuario objeto = new Usuario();

				objeto.setId(rs.getInt("id"));
				objeto.setCorreo(rs.getString("correo"));
				objeto.setNombre(rs.getString("nombre"));
				objeto.setEntidad(rs.getString("entidad"));
				objeto.setEntidad_id(rs.getInt("entidad_id"));
				objeto.setNivel_id(rs.getInt("nivel_id"));
				
				
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
	
	
	public static List<Usuario> selectPass(String condition) throws SQLException{
	 	 Connection conect=ConnectionConfiguration.conectarSpr();
			 String query = " select passwd from usuario "+condition;
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<Usuario> objetos = new ArrayList<Usuario>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					Usuario objeto = new Usuario();
							
					objeto.setPasswd(rs.getString("passwd"));		
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
	
	public static List<FactHitos> selectFactHitos2015(String condition) throws SQLException{
    	 Connection conect=ConnectionConfiguration.conectar();
 		 String query = " select * from fact_hitos "+condition +" order by accion_departamento_id ASC, accion_distrito_id ASC, accion ASC, hito_fecha_entrega ASC ";
 		 
 		 Statement statement = null;
 		 ResultSet rs=null;
 		 List<FactHitos> objetos = new ArrayList<FactHitos>();

 		try {
 			statement = conect.createStatement();
 			rs=statement.executeQuery(query);
 			while(rs.next()){
 				FactHitos objeto = new FactHitos();

 				objeto.setLinea_estrategica_id(rs.getInt("linea_estrategica_id"));
 				objeto.setLinea_estrategica(rs.getString("linea_estrategica"));
 				objeto.setLinea_accion_tipo_id(rs.getInt("linea_accion_tipo_id"));
 				objeto.setLinea_accion_tipo(rs.getString("linea_accion_tipo"));
 				objeto.setLinea_accion_id(rs.getInt("linea_accion_id"));
 				objeto.setLinea_accion(rs.getString("linea_accion"));
 				objeto.setInstitucion_id(rs.getInt("institucion_id"));
 				objeto.setInstitucion(rs.getString("institucion"));
 				objeto.setAccion_id(rs.getInt("accion_id"));
 				objeto.setAccion(rs.getString("accion"));
 				objeto.setCantidad(rs.getDouble("accion_cantidad"));
 				objeto.setAccion_unidad_edida(rs.getString("accion_unidad_medida"));
 				objeto.setAccion_costo(rs.getDouble("accion_costo"));
 				objeto.setAccion_departamento_id(rs.getInt("accion_departamento_id"));
 				objeto.setAccion_departamento(rs.getString("accion_departamento"));
 				objeto.setAccion_distrito_id(rs.getInt("accion_distrito_id"));
 				objeto.setAccion_distrito(rs.getString("accion_distrito"));
// 				objeto.setAccion_fecha_inicio(rs.getDate("accion_fecha_inicio"));
// 				objeto.setAccion_fecha_entrega(rs.getDate("accion_fecha_entrega"));
// 				objeto.setAccion_status_fin(rs.getString("accion_status_fin").toCharArray()[0]);
// 				objeto.setAccion_avance_programado(rs.getDouble("accion_avance_programado"));
// 				objeto.setAccion_avance_ejecutado(rs.getDouble("accion_avance_ejecutado"));
// 				objeto.setAccion_cantidad_hito(rs.getDouble("accion_cantidad_hito"));
 				objeto.setHito_id(rs.getInt("hito_id"));
 				objeto.setHito(rs.getString("hito"));
 				objeto.setHito_fecha_entrega(rs.getDate("hito_fecha_entrega"));
 				objeto.setHito_porcentaje_programado(rs.getInt("hito_porcentaje_programado"));
 				objeto.setHito_porcentaje_ejecutado(rs.getInt("hito_porcentaje_ejecutado"));
 				objeto.setHito_cantidad_programado(rs.getDouble("hito_cantidad_programado"));
 				objeto.setHito_cantidad_ejecutado(rs.getDouble("hito_cantidad_ejecutado"));
 				objeto.setHito_costo_programado(rs.getDouble("hito_costo_programado"));
 				objeto.setHito_costo_ejecutado(rs.getDouble("hito_costo_ejecutado"));
// 				objeto.setHito_comentario_aprob(rs.getString("hito_comentario_aprob"));
// 				objeto.setHito_status(rs.getString("hito_status").toCharArray()[0]);
// 				objeto.setHito_total_doc(rs.getInt("hito_total_doc"));


 				

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
	public static List<FactHitos> selectFactHitos2015Base(String condition) throws SQLException{
   	 Connection conect=ConnectionConfiguration.conectarBase();
		 String query = " select * from fact_hitos "+condition +" order by accion_departamento_id ASC, accion_distrito_id ASC, accion ASC, hito_fecha_entrega ASC ";
		 
		 Statement statement = null;
		 ResultSet rs=null;
		 List<FactHitos> objetos = new ArrayList<FactHitos>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				FactHitos objeto = new FactHitos();

				objeto.setLinea_estrategica_id(rs.getInt("linea_estrategica_id"));
				objeto.setLinea_estrategica(rs.getString("linea_estrategica"));
				objeto.setLinea_accion_tipo_id(rs.getInt("linea_accion_tipo_id"));
				objeto.setLinea_accion_tipo(rs.getString("linea_accion_tipo"));
				objeto.setLinea_accion_id(rs.getInt("linea_accion_id"));
				objeto.setLinea_accion(rs.getString("linea_accion"));
				objeto.setInstitucion_id(rs.getInt("institucion_id"));
				objeto.setInstitucion(rs.getString("institucion"));
				objeto.setAccion_id(rs.getInt("accion_id"));
				objeto.setAccion(rs.getString("accion"));
				objeto.setCantidad(rs.getDouble("accion_cantidad"));
				objeto.setAccion_unidad_edida(rs.getString("accion_unidad_medida"));
				objeto.setAccion_costo(rs.getDouble("accion_costo"));
				objeto.setAccion_departamento_id(rs.getInt("accion_departamento_id"));
				objeto.setAccion_departamento(rs.getString("accion_departamento"));
				objeto.setAccion_distrito_id(rs.getInt("accion_distrito_id"));
				objeto.setAccion_distrito(rs.getString("accion_distrito"));
				objeto.setAccion_fecha_inicio(rs.getDate("accion_fecha_inicio"));
				objeto.setAccion_fecha_entrega(rs.getDate("accion_fecha_entrega"));
				objeto.setAccion_status_fin(rs.getString("accion_status_fin").toCharArray()[0]);
				objeto.setAccion_avance_programado(rs.getDouble("accion_avance_programado"));
				objeto.setAccion_avance_ejecutado(rs.getDouble("accion_avance_ejecutado"));
				objeto.setAccion_cantidad_hito(rs.getDouble("accion_cantidad_hito"));
				objeto.setHito_id(rs.getInt("hito_id"));
				objeto.setHito(rs.getString("hito"));
				objeto.setHito_fecha_entrega(rs.getDate("hito_fecha_entrega"));
				objeto.setHito_porcentaje_programado(rs.getInt("hito_porcentaje_programado"));
				objeto.setHito_porcentaje_ejecutado(rs.getInt("hito_porcentaje_ejecutado"));
				objeto.setHito_cantidad_programado(rs.getDouble("hito_cantidad_programado"));
				objeto.setHito_cantidad_ejecutado(rs.getDouble("hito_cantidad_ejecutado"));
				objeto.setHito_costo_programado(rs.getDouble("hito_costo_programado"));
				objeto.setHito_costo_ejecutado(rs.getDouble("hito_costo_ejecutado"));
				objeto.setHito_comentario_aprob(rs.getString("hito_comentario_aprob"));
				objeto.setHito_status(rs.getString("hito_status").toCharArray()[0]);
				objeto.setHito_total_doc(rs.getInt("hito_total_doc"));


				

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
	public static List<FactHitos> selectFactHitos2015Accion(String condition) throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " select * from fact_acciones_periodo "+condition ;
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<FactHitos> objetos = new ArrayList<FactHitos>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					FactHitos objeto = new FactHitos();

					objeto.setLinea_estrategica_id(rs.getInt("linea_estrategica_id"));
					objeto.setLinea_estrategica(rs.getString("linea_estrategica"));
					objeto.setLinea_accion_tipo_id(rs.getInt("linea_accion_tipo_id"));
					objeto.setLinea_accion_tipo(rs.getString("linea_accion_tipo"));
					objeto.setLinea_accion_id(rs.getInt("linea_accion_id"));
					objeto.setLinea_accion(rs.getString("linea_accion"));
					objeto.setInstitucion_id(rs.getInt("institucion_id"));
					objeto.setInstitucion(rs.getString("institucion"));
					objeto.setAccion_id(rs.getInt("accion_id"));
					objeto.setAccion(rs.getString("accion"));
					objeto.setCantidad(rs.getDouble("accion_cantidad"));
					objeto.setAccion_unidad_edida(rs.getString("accion_unidad_medida"));
					objeto.setAccion_costo(rs.getDouble("accion_costo"));
					objeto.setAccion_departamento_id(rs.getInt("accion_departamento_id"));
					objeto.setAccion_departamento(rs.getString("accion_departamento"));
					objeto.setAccion_distrito_id(rs.getInt("accion_distrito_id"));
					objeto.setAccion_distrito(rs.getString("accion_distrito"));
//					objeto.setAccion_fecha_inicio(rs.getDate("accion_fecha_inicio"));
//					objeto.setAccion_fecha_entrega(rs.getDate("accion_fecha_entrega"));
//					objeto.setAccion_status_fin(rs.getString("accion_status_fin").toCharArray()[0]);
//					objeto.setAccion_avance_programado(rs.getDouble("accion_avance_programado"));
//					objeto.setAccion_avance_ejecutado(rs.getDouble("accion_avance_ejecutado"));
//					objeto.setAccion_cantidad_hito(rs.getDouble("accion_cantidad_hito"));
					objeto.setHito_id(rs.getInt("hito_id"));
					objeto.setHito(rs.getString("hito"));
					objeto.setHito_fecha_entrega(rs.getDate("hito_fecha_entrega"));
					objeto.setHito_porcentaje_programado(rs.getInt("hito_porcentaje_programado"));
					objeto.setHito_porcentaje_ejecutado(rs.getInt("hito_porcentaje_ejecutado"));
					objeto.setHito_cantidad_programado(rs.getDouble("hito_cantidad_programado"));
					objeto.setHito_cantidad_ejecutado(rs.getDouble("hito_cantidad_ejecutado"));
					objeto.setHito_costo_programado(rs.getDouble("hito_costo_programado"));
					objeto.setHito_costo_ejecutado(rs.getDouble("hito_costo_ejecutado"));
//					objeto.setHito_comentario_aprob(rs.getString("hito_comentario_aprob"));
//					objeto.setHito_status(rs.getString("hito_status").toCharArray()[0]);
//					objeto.setHito_total_doc(rs.getInt("hito_total_doc"));

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
	public static List<FactHitos> selectFactHitos2016Accion(String condition) throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " select * from fact_acciones_periodo2016 "+condition ;
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<FactHitos> objetos = new ArrayList<FactHitos>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					FactHitos objeto = new FactHitos();

					objeto.setLinea_estrategica_id(rs.getInt("linea_estrategica_id"));
					objeto.setLinea_estrategica(rs.getString("linea_estrategica"));
					objeto.setLinea_accion_tipo_id(rs.getInt("linea_accion_tipo_id"));
					objeto.setLinea_accion_tipo(rs.getString("linea_accion_tipo"));
					objeto.setLinea_accion_id(rs.getInt("linea_accion_id"));
					objeto.setLinea_accion(rs.getString("linea_accion"));
					objeto.setInstitucion_id(rs.getInt("institucion_id"));
					objeto.setInstitucion(rs.getString("institucion"));
					objeto.setAccion_id(rs.getInt("accion_id"));
					objeto.setAccion(rs.getString("accion"));
					objeto.setCantidad(rs.getDouble("accion_cantidad"));
					objeto.setAccion_unidad_edida(rs.getString("accion_unidad_medida"));
					objeto.setAccion_costo(rs.getDouble("accion_costo"));
					objeto.setAccion_departamento_id(rs.getInt("accion_departamento_id"));
					objeto.setAccion_departamento(rs.getString("accion_departamento"));
					objeto.setAccion_distrito_id(rs.getInt("accion_distrito_id"));
					objeto.setAccion_distrito(rs.getString("accion_distrito"));
//					objeto.setAccion_fecha_inicio(rs.getDate("accion_fecha_inicio"));
//					objeto.setAccion_fecha_entrega(rs.getDate("accion_fecha_entrega"));
//					objeto.setAccion_status_fin(rs.getString("accion_status_fin").toCharArray()[0]);
//					objeto.setAccion_avance_programado(rs.getDouble("accion_avance_programado"));
//					objeto.setAccion_avance_ejecutado(rs.getDouble("accion_avance_ejecutado"));
//					objeto.setAccion_cantidad_hito(rs.getDouble("accion_cantidad_hito"));
					objeto.setHito_id(rs.getInt("hito_id"));
					objeto.setHito(rs.getString("hito"));
					objeto.setHito_fecha_entrega(rs.getDate("hito_fecha_entrega"));
					objeto.setHito_porcentaje_programado(rs.getInt("hito_porcentaje_programado"));
					objeto.setHito_porcentaje_ejecutado(rs.getInt("hito_porcentaje_ejecutado"));
					objeto.setHito_cantidad_programado(rs.getDouble("hito_cantidad_programado"));
					objeto.setHito_cantidad_ejecutado(rs.getDouble("hito_cantidad_ejecutado"));
					objeto.setHito_costo_programado(rs.getDouble("hito_costo_programado"));
					objeto.setHito_costo_ejecutado(rs.getDouble("hito_costo_ejecutado"));
//					objeto.setHito_comentario_aprob(rs.getString("hito_comentario_aprob"));
//					objeto.setHito_status(rs.getString("hito_status").toCharArray()[0]);
//					objeto.setHito_total_doc(rs.getInt("hito_total_doc"));

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
	public static List<FactHitos> selectFactHitos(String condition) throws SQLException{
   	 Connection conect=ConnectionConfiguration.conectar();
		 String query = " select * from fact_hitos "+condition;
		 
		 Statement statement = null;
		 ResultSet rs=null;
		 List<FactHitos> objetos = new ArrayList<FactHitos>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				FactHitos objeto = new FactHitos();

				objeto.setLinea_estrategica_id(rs.getInt("linea_estrategica_id"));
				objeto.setLinea_estrategica(rs.getString("linea_estrategica"));
				objeto.setLinea_accion_tipo_id(rs.getInt("linea_accion_tipo_id"));
				objeto.setLinea_accion_tipo(rs.getString("linea_accion_tipo"));
				objeto.setLinea_accion_id(rs.getInt("linea_accion_id"));
				objeto.setLinea_accion(rs.getString("linea_accion"));
				objeto.setInstitucion_id(rs.getInt("institucion_id"));
				objeto.setInstitucion(rs.getString("institucion"));
				objeto.setAccion_id(rs.getInt("accion_id"));
				objeto.setAccion(rs.getString("accion"));
				objeto.setCantidad(rs.getDouble("accion_cantidad"));
				objeto.setAccion_unidad_edida(rs.getString("accion_unidad_medida"));
				objeto.setAccion_costo(rs.getDouble("accion_costo"));
				objeto.setAccion_departamento_id(rs.getInt("accion_departamento_id"));
				objeto.setAccion_departamento(rs.getString("accion_departamento"));
				objeto.setAccion_distrito_id(rs.getInt("accion_distrito_id"));
				objeto.setAccion_distrito(rs.getString("accion_distrito"));
				objeto.setAccion_fecha_inicio(rs.getDate("accion_fecha_inicio"));
				objeto.setAccion_fecha_entrega(rs.getDate("accion_fecha_entrega"));
				objeto.setAccion_status_fin(rs.getString("accion_status_fin").toCharArray()[0]);
				objeto.setAccion_avance_programado(rs.getDouble("accion_avance_programado"));
				objeto.setAccion_avance_ejecutado(rs.getDouble("accion_avance_ejecutado"));
				objeto.setAccion_cantidad_hito(rs.getDouble("accion_cantidad_hito"));
				objeto.setHito_id(rs.getInt("hito_id"));
				objeto.setHito(rs.getString("hito"));
				objeto.setHito_fecha_entrega(rs.getDate("hito_fecha_entrega"));
				objeto.setHito_porcentaje_programado(rs.getInt("hito_porcentaje_programado"));
				objeto.setHito_porcentaje_ejecutado(rs.getInt("hito_porcentaje_ejecutado"));
				objeto.setHito_cantidad_programado(rs.getDouble("hito_cantidad_programado"));
				objeto.setHito_cantidad_ejecutado(rs.getDouble("hito_cantidad_ejecutado"));
				objeto.setHito_costo_programado(rs.getDouble("hito_costo_programado"));
				objeto.setHito_costo_ejecutado(rs.getDouble("hito_costo_ejecutado"));
				objeto.setHito_comentario_aprob(rs.getString("hito_comentario_aprob"));
				objeto.setHito_status(rs.getString("hito_status").toCharArray()[0]);
				objeto.setHito_total_doc(rs.getInt("hito_total_doc"));
				
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
	
	public static List<FactHitos> selectFactHitosSnpp(String condition) throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectarSnpp();
			 String query = " select * from snpp "+condition;
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<FactHitos> objetos = new ArrayList<FactHitos>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					FactHitos objeto = new FactHitos();

					// objeto.setLinea_estrategica_id(rs.getInt("linea_estrategica_id"));
					objeto.setLinea_estrategica(rs.getString("linea_estrategica"));
					// objeto.setLinea_accion_tipo_id(rs.getInt("linea_accion_tipo_id"));
					objeto.setLinea_accion_tipo(rs.getString("linea_accion_tipo"));
					objeto.setLinea_accion_id(rs.getInt("linea_accion_id"));
					objeto.setLinea_accion(rs.getString("linea_accion"));
					objeto.setInstitucion_id(rs.getInt("institucion_id"));
					objeto.setInstitucion(rs.getString("institucion"));
					objeto.setAccion_id(rs.getInt("accion_id"));
					objeto.setAccion(rs.getString("accion"));
					objeto.setCantidad(rs.getDouble("accion_cantidad"));
					objeto.setAccion_unidad_edida(rs.getString("accion_unidad_medida"));
					objeto.setAccion_costo(rs.getDouble("accion_costo"));
					objeto.setAccion_departamento_id(rs.getInt("accion_departamento_id"));
					objeto.setAccion_departamento(rs.getString("accion_departamento"));
					objeto.setAccion_distrito_id(rs.getInt("accion_distrito_id"));
					objeto.setAccion_distrito(rs.getString("accion_distrito"));
					objeto.setAccion_fecha_inicio(rs.getDate("accion_fecha_inicio"));
					objeto.setAccion_fecha_entrega(rs.getDate("accion_fecha_entrega"));
					//objeto.setAccion_status_fin(rs.getString("accion_status_fin").toCharArray()[0]);
					//objeto.setAccion_avance_programado(rs.getDouble("accion_avance_programado"));
					//objeto.setAccion_avance_ejecutado(rs.getDouble("accion_avance_ejecutado"));
					//objeto.setAccion_cantidad_hito(rs.getDouble("accion_cantidad_hito"));
					//objeto.setHito_id(rs.getInt("hito_id"));
					objeto.setHito(rs.getString("hito"));
					objeto.setHito_fecha_entrega(rs.getDate("hito_fecha_entrega"));
					objeto.setHito_porcentaje_programado(rs.getInt("hito_porcentaje_programado"));
					objeto.setHito_porcentaje_ejecutado(rs.getInt("hito_porcentaje_ejecutado"));
					objeto.setHito_cantidad_programado(rs.getDouble("hito_cantidad_programado"));
					objeto.setHito_cantidad_ejecutado(rs.getDouble("hito_cantidad_ejecutado"));
					objeto.setHito_costo_programado(rs.getDouble("hito_costo_programado"));
					objeto.setHito_costo_ejecutado(rs.getDouble("hito_costo_ejecutado"));
					//objeto.setHito_comentario_aprob(rs.getString("hito_comentario_aprob"));
					//objeto.setHito_status(rs.getString("hito_status").toCharArray()[0]);
					//objeto.setHito_total_doc(rs.getInt("hito_total_doc"));


					

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
	
	public static List<Entidad> selectEntidad(String condition) throws SQLException{
   	 Connection conect=ConnectionConfiguration.conectar();
		 String query = " select * from fact_entidades "+condition;
		 
		 Statement statement = null;
		 ResultSet rs=null;
		 List<Entidad> objetos = new ArrayList<Entidad>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				Entidad objeto = new Entidad();
				objeto.setInstitucion_id(rs.getInt("institucion_id"));
				objeto.setInstitucion(rs.getString("institucion"));

				objetos.add(objeto);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			if (statement != null) {statement.close();}
			if (conect != null) {conect.close();}
		}
		return objetos; 
  }
	
	public static List<LineaAccion> seletLineaAccion(String condition) throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " select * from fact_entidad_linea "+condition;
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<LineaAccion> objetos = new ArrayList<LineaAccion>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					LineaAccion objeto = new LineaAccion();
					objeto.setInstitucion_id(rs.getInt("institucion_id"));
					objeto.setInstitucion(rs.getString("institucion"));
					objeto.setLinea_accion_id(rs.getInt("linea_accion_id"));
					objeto.setLinea_accion(rs.getString("linea_accion"));
					objeto.setAccion_unidad_medida(rs.getString("accion_unidad_medida"));
					objeto.setCantidad_ejecutada(rs.getDouble("sum"));
					objeto.setAnho(rs.getInt("date_part"));
					objeto.setSuma_programada_anho(rs.getDouble("sumprog"));
					objeto.setSuma_programada_hoy(rs.getDouble("sumproghoy"));
					objeto.setCosto_ejecutado(rs.getDouble("costo_ejecutado"));
					objeto.setCosto_programado_anho(rs.getDouble("costo_programado_anho"));
					objeto.setCosto_programado_hoy(rs.getDouble("costo_programado_hoy"));
					objeto.setLinea_accion_meta(rs.getDouble("linea_accion_meta"));
					objeto.setHito_cantidad_ejecutado_hoy(rs.getDouble("hito_cantidad_ejecutado_hoy"));
					objeto.setPeriodo(rs.getInt("periodo"));
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
	
	public static List<Generica> selectGenerico(String condition, String tabla) throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " select * from "+tabla+" "+condition;
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<Generica> objetos = new ArrayList<Generica>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					Generica objeto = new Generica();
					objeto.setClave(rs.getInt(1));
					objeto.setValor(rs.getDouble(2));
					objetos.add(objeto);
				}
			}
			catch (SQLException e) {
				e.printStackTrace();}
			finally{
				if (statement != null) {statement.close();}
				if (conect != null) {conect.close();}
			}
			return objetos; 
	  }
	public static List<Generica2> selectGenerico2(String condition, String tabla) throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " select * from "+tabla+" "+condition;
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<Generica2> objetos = new ArrayList<Generica2>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					Generica2 objeto = new Generica2();
					objeto.setClave1(rs.getInt(1));
					objeto.setClave2(rs.getInt(2));
					objeto.setValor(rs.getDouble(3));
					objetos.add(objeto);
				}
			}
			catch (SQLException e) {
				e.printStackTrace();}
			finally{
				if (statement != null) {statement.close();}
				if (conect != null) {conect.close();}
			}
			return objetos; 
	  }
	public static List<Generica3> selectGenerico3(String condition, String tabla) throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " select * from "+tabla+" "+condition;
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<Generica3> objetos = new ArrayList<Generica3>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					Generica3 objeto = new Generica3();
					objeto.setClave1(rs.getInt(1));
					objeto.setClave2(rs.getInt(2));
					objeto.setClave3(rs.getInt(3));
					objeto.setValor(rs.getDouble(4));
					objetos.add(objeto);
				}
			}
			catch (SQLException e) {
				e.printStackTrace();}
			finally{
				if (statement != null) {statement.close();}
				if (conect != null) {conect.close();}
			}
			return objetos; 
	  }
	
	/*public static List<LineaAccion> seletLineaAccionSnpp(String condition) throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectarSnpp();
			 String query = " select * from fact_entidad_linea_snppp "+condition;
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<LineaAccion> objetos = new ArrayList<LineaAccion>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					LineaAccion objeto = new LineaAccion();
					objeto.setInstitucion_id(rs.getInt("institucion_id"));
					objeto.setInstitucion(rs.getString("institucion"));
					objeto.setLinea_accion_id(rs.getInt("linea_accion_id"));
					objeto.setLinea_accion(rs.getString("linea_accion"));
					objeto.setAccion_unidad_medida(rs.getString("accion_unidad_medida"));
					objeto.setCantidad_ejecutada(rs.getDouble("sum"));
					objeto.setAnho(rs.getInt("date_part"));
					objeto.setSuma_programada_anho(rs.getDouble("sumprog"));
					objeto.setSuma_programada_hoy(rs.getDouble("sumproghoy"));
					objeto.setCosto_ejecutado(rs.getDouble("costo_ejecutado"));
					objeto.setCosto_programado_anho(rs.getDouble("costo_programado_anho"));
					objeto.setCosto_programado_hoy(rs.getDouble("costo_programado_hoy"));
					objeto.setLinea_accion_meta(rs.getDouble("linea_accion_meta"));
					objeto.setHito_cantidad_ejecutado_hoy(rs.getDouble("hito_cantidad_ejecutado_hoy"));
					objetos.add(objeto);
				}
			}
			catch (SQLException e) {
				e.printStackTrace();}
			finally{
				if (statement != null) {statement.close();}
				if (conect != null) {conect.close();}
			}
			return objetos; 
	  }*/

	public static List<LineaAccionDepartamento> selectLineaAccionDepartamento() throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " select * from fact_entidad_linea_dpto ";
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<LineaAccionDepartamento> objetos = new ArrayList<LineaAccionDepartamento>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					LineaAccionDepartamento objeto = new LineaAccionDepartamento();
					objeto.setInstitucion(rs.getString("institucion"));
					objeto.setInstitucion_id(rs.getInt("institucion_id"));
					objeto.setLinea_accion(rs.getString("linea_accion"));
					objeto.setLinea_accion_id(rs.getInt("linea_accion_id"));
					objeto.setAccion_unidad_medida(rs.getString("accion_unidad_medida"));
					objeto.setCantidad_ejecutada_hoy(rs.getDouble("sum"));
					objeto.setAnho(rs.getInt("date_part"));
					objeto.setSuma_programada_anho(rs.getDouble("sumprog"));
					objeto.setSuma_programada_hoy(rs.getDouble("sumproghoy"));
					objeto.setCosto_ejecutado(rs.getDouble("costo_ejecutado"));
					objeto.setCosto_programado_anho(rs.getDouble("costo_programado_anho"));
					objeto.setCosto_programado_hoy(rs.getDouble("costo_programado_hoy"));
					objeto.setLinea_accion_meta(rs.getDouble("linea_accion_meta"));
					objeto.setHito_cantidad_ejecutado_hoy(rs.getDouble("hito_cantidad_ejecutado_hoy"));
					objeto.setOrden(rs.getString("orden"));
					objeto.setOrden_linea_accion(rs.getInt("orden_linea_accion"));
					objeto.setAccion_departamento_id(rs.getInt("accion_departamento_id"));
					objeto.setAccion_unidad_medida_id(rs.getInt("accion_unidad_medida_id"));

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
	
	public static List<LineaAccionDistrito> selectLineaAccionDistrito() throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " select * from fact_entidad_linea_dist ";
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<LineaAccionDistrito> objetos = new ArrayList<LineaAccionDistrito>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					LineaAccionDistrito objeto = new LineaAccionDistrito();
					objeto.setInstitucion(rs.getString("institucion"));
					objeto.setInstitucion_id(rs.getInt("institucion_id"));
					objeto.setLinea_accion(rs.getString("linea_accion"));
					objeto.setLinea_accion_id(rs.getInt("linea_accion_id"));
					objeto.setAccion_unidad_medida(rs.getString("accion_unidad_medida"));
					objeto.setCantidad_ejecutada_hoy(rs.getDouble("sum"));
					objeto.setAnho(rs.getInt("date_part"));
					objeto.setSuma_programada_anho(rs.getDouble("sumprog"));
					objeto.setSuma_programada_hoy(rs.getDouble("sumproghoy"));
					objeto.setCosto_ejecutado(rs.getDouble("costo_ejecutado"));
					objeto.setCosto_programado_anho(rs.getDouble("costo_programado_anho"));
					objeto.setCosto_programado_hoy(rs.getDouble("costo_programado_hoy"));
					objeto.setLinea_accion_meta(rs.getDouble("linea_accion_meta"));
					objeto.setHito_cantidad_ejecutado_hoy(rs.getDouble("hito_cantidad_ejecutado_hoy"));
					objeto.setOrden(rs.getString("orden"));
					objeto.setOrden_linea_accion(rs.getInt("orden_linea_accion"));
					objeto.setAccion_departamento_id(rs.getInt("accion_departamento_id"));
					objeto.setAccion_unidad_medida_id(rs.getInt("accion_unidad_medida_id"));
					objeto.setAccion_unidad_medida_id(rs.getInt("accion_unidad_medida_id"));
					objeto.setAccion_distrito_id(rs.getInt("accion_distrito_id"));

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
	
	
	public static List<LineaAccionAcumuladoMes> selectLineaAccionAcumuladoMes(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from linea_accion_acumulado_mes "+condition;

		Statement statement = null;
		ResultSet rs=null;
		List<LineaAccionAcumuladoMes> objetos = new ArrayList<LineaAccionAcumuladoMes>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				LineaAccionAcumuladoMes objeto = new LineaAccionAcumuladoMes();
		
				objeto.setLinea_accion_id(rs.getInt("linea_accion_id"));
				objeto.setLinea_accion(rs.getString("linea_accion"));
				objeto.setInstitucion_id(rs.getInt("institucion_id"));
				objeto.setInstitucion(rs.getString("institucion"));
				objeto.setAccion_unidad_medida(rs.getString("accion_unidad_medida"));
				objeto.setMes(rs.getString("mes"));
				objeto.setCantidad_programada(rs.getDouble("cantidad_programada"));
				objeto.setCantidad_ejecutda(rs.getDouble("cantidad_ejecutada"));
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
	
	public static List<LineaAccionAcumuladoMes> selectLineaAccionAcumuladoMesDepto(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from linea_accion_acumulado_mes_depto "+condition;

		Statement statement = null;
		ResultSet rs=null;
		List<LineaAccionAcumuladoMes> objetos = new ArrayList<LineaAccionAcumuladoMes>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				LineaAccionAcumuladoMes objeto = new LineaAccionAcumuladoMes();
		
				objeto.setLinea_accion_id(rs.getInt("linea_accion_id"));
				objeto.setLinea_accion(rs.getString("linea_accion"));
				objeto.setInstitucion_id(rs.getInt("institucion_id"));
				objeto.setInstitucion(rs.getString("institucion"));
				objeto.setAccion_unidad_medida(rs.getString("accion_unidad_medida"));
				objeto.setMes(rs.getString("mes"));
				objeto.setCantidad_programada(rs.getDouble("cantidad_programada"));
				objeto.setCantidad_ejecutda(rs.getDouble("cantidad_ejecutada"));
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
	public static List<LineaAccionAcumuladoMesDistrito> selectLineaAccionAcumuladoMesDistrito(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from linea_accion_acumulado_mes_distrito "+condition;

		Statement statement = null;
		ResultSet rs=null;
		List<LineaAccionAcumuladoMesDistrito> objetos = new ArrayList<LineaAccionAcumuladoMesDistrito>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				LineaAccionAcumuladoMesDistrito objeto = new LineaAccionAcumuladoMesDistrito();
		
				objeto.setLinea_accion_id(rs.getInt("linea_accion_id"));
				objeto.setLinea_accion(rs.getString("linea_accion"));
				objeto.setInstitucion_id(rs.getInt("institucion_id"));
				objeto.setInstitucion(rs.getString("institucion"));
				objeto.setAccion_unidad_medida(rs.getString("accion_unidad_medida"));
				objeto.setMes(rs.getString("mes"));
				objeto.setCantidad_programada(rs.getDouble("cantidad_programada"));
				objeto.setCantidad_ejecutda(rs.getDouble("cantidad_ejecutada"));
				objeto.setDistrito_id(rs.getInt("accion_distrito_id"));
				objeto.setDepartamento_id(rs.getInt("accion_departamento_id"));
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

	public static List<Departamento> selectDepartamento() throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from departamento ORDER BY id ASC";

		Statement statement = null;
		ResultSet rs=null;
		List<Departamento> objetos = new ArrayList<Departamento>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				Departamento objeto = new Departamento();
		
				objeto.setIdDepartamento(rs.getInt("id"));
				objeto.setNombreDepartamento(rs.getString("nombre"));

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
	
	public static List<Distrito> selectDistritos(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from distrito "+condition;

		Statement statement = null;
		ResultSet rs=null;
		List<Distrito> objetos = new ArrayList<Distrito>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				Distrito objeto = new Distrito();
		
				objeto.setId(rs.getInt("id"));
				objeto.setDescripcion(rs.getString("descripcion"));
				objeto.setDepartamentoId(rs.getInt("departamentoid"));

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
	
	public static List<MetasDistEntLinea> selectMetasDistEntLinea(String condition) throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " select * from fact_meta_dist_entidad_linea WHERE periodo = 2015"+condition;
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<MetasDistEntLinea> objetos = new ArrayList<MetasDistEntLinea>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					MetasDistEntLinea objeto = new MetasDistEntLinea();

					objeto.setAccionDepartamentoId(rs.getInt("accion_departamento_id"));;
					objeto.setAccionDistritoId(rs.getInt("accion_distrito_id"));
					objeto.setOrden(rs.getInt("orden"));
					objeto.setInstitucionId(rs.getInt("institucion_id"));
					objeto.setInstitucion(rs.getString("institucion"));
					objeto.setOrdenLineaAccion(rs.getInt("orden_linea_accion"));
					objeto.setLineaAccionId(rs.getInt("linea_accion_id"));
					objeto.setLineaAccion(rs.getString("linea_accion"));
					objeto.setAccionUnidadMedidaId(rs.getInt("accion_unidad_medida_id"));
					objeto.setAccionUnidadMedida(rs.getString("accion_unidad_medida"));
					objeto.setPeriodo(rs.getInt("periodo"));
					objeto.setLineaAccionMeta(rs.getInt("linea_accion_meta"));
					objeto.setDatePart(rs.getDouble("date_part"));
					objeto.setSumProgAnho(rs.getDouble("sum_prog_anho"));
					objeto.setSumEjecAnho(rs.getDouble("sum_ejec_anho"));
					objeto.setCostoEjecAnho(rs.getDouble("costo_ejec_anho"));
					objeto.setCostoProgAnho(rs.getDouble("costo_prog_anho"));
					objeto.setCostoProgHoy(rs.getDouble("costo_prog_hoy"));
					objeto.setCostoEjecHoy(rs.getDouble("costo_ejec_hoy"));
					objeto.setCantidadProgHoy(rs.getDouble("cantidad_prog_hoy"));
					objeto.setCantidadEjecHoy(rs.getDouble("cantidad_ejec_hoy"));
										
					
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
	
	public static List<AccionHasProducto> selectAccionHasProducto(String condition) throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " select * from accion_has_producto "+condition;
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<AccionHasProducto> objetos = new ArrayList<AccionHasProducto>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					AccionHasProducto objeto = new AccionHasProducto();

					objeto.setNivel(rs.getInt("spr_nivel_id"));
					objeto.setEntidad(rs.getInt("spr_entidad_id"));
					objeto.setTipoPrograma(rs.getInt("spr_tiprograma_id"));
					objeto.setPrograma(rs.getInt("spr_programa_id"));
					objeto.setSubPrograma(rs.getInt("spr_subprograma_id"));
					objeto.setProyecto(rs.getInt("srp_proyecto_id"));
					objeto.setProducto(rs.getInt("spr_producto_id"));
					objeto.setAnho(rs.getInt("spr_anho"));
					objeto.setVersion(rs.getInt("spr_version"));
					objeto.setAccionId(rs.getInt("accion_id"));
					objeto.setuMedida(rs.getString("u_medida"));
					objeto.setCantFisica(rs.getDouble("cant_fisica"));
					objeto.setClase(rs.getString("clase"));
					objeto.setCantFinanciera(rs.getDouble("cant_financiera"));
					objeto.setTotalAsignacion(rs.getDouble("asignacion_financiera"));

					
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
	public static List<AccionCatalogo> selectAccionCatalogo() throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from accion_catalogo";

		Statement statement = null;
		ResultSet rs=null;
		List<AccionCatalogo> objetos = new ArrayList<AccionCatalogo>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				AccionCatalogo objeto = new AccionCatalogo();
		
				objeto.setId(rs.getInt("id"));
				objeto.setNombre(rs.getString("nombre"));
				objeto.setDescripcion(rs.getString("descripcion"));
				objeto.setIdUnidadMedida(rs.getInt("id_unidad_medida"));
				objeto.setVersion(rs.getInt("version"));
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
