package py.gov.stp.tools;



import java.sql.Connection;

import py.gov.stp.tools.ConnectionConfiguration;

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
import objetos.LineaAccion;
import objetos.LineaAccionAcumuladoMes;
import objetos.LineaAccionDepartamento;

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
		catch (SQLException e) {e.printStackTrace();}
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

//    public static List<ProyectoSNIP> selectProyectoSnip(String condition) throws SQLException{
//     	 Connection conect=ConnectionConfiguration.conectar();
//  		 String query = " select * from proyecto_snip "+condition;
//  		 
//  		 Statement statement = null;
//  		 ResultSet rs=null;
//  		 List<ProyectoSNIP> objetos = new ArrayList<ProyectoSNIP>();
//
//  		try {
//  			statement = conect.createStatement();
//  			rs=statement.executeQuery(query);
//  			while(rs.next()){
//  				ProyectoSNIP objeto = new ProyectoSNIP();
//
//  				objeto.setCodigoSnip(rs.getShort("id"));
//  				objeto.setNombreProyecto(rs.getString("nombre"));
//  				objeto.setEstado(rs.getShort("estado"));
//
//  				objetos.add(objeto);
//  			}
//  		}
//  		catch (SQLException e) {e.printStackTrace();}
//  		finally{
//  			if (statement != null) {statement.close();}
//  			if (conect != null) {conect.close();}
//  		}
//  		return objetos;
//    }
//    public static List<ProyectoSNIPAutorizado> selectProyectoSnipAutorizado(String condition) throws SQLException{
//    	 Connection conect=ConnectionConfiguration.conectar();
// 		 String query = " select * from proyecto_snip_autorizado "+condition;
// 		 
// 		 Statement statement = null;
// 		 ResultSet rs=null;
// 		 List<ProyectoSNIPAutorizado> objetos = new ArrayList<ProyectoSNIPAutorizado>();
//
// 		try {
// 			statement = conect.createStatement();
// 			rs=statement.executeQuery(query);
// 			while(rs.next()){
// 				ProyectoSNIPAutorizado objeto = new ProyectoSNIPAutorizado();
//
// 				objeto.setNumeroFila(rs.getShort("id"));
// 				objeto.setAnio(rs.getShort("anho"));
// 				objeto.setCodFuenteFinanciamiento(rs.getShort("fuente_financiamiento_id"));
// 				objeto.setCodOrganismoFinanciador(rs.getShort("organismo_financiador_id"));
// 				objeto.setCodigoSnip(rs.getShort("proyecto_snip_id"));
// 				objeto.setEntidad(rs.getShort("entidad_id"));
// 				objeto.setNivel(rs.getShort("entidad_nivel_id"));
// 				objeto.setMonto(rs.getDouble("monto"));
//
// 				objetos.add(objeto);
// 			}
// 		}
// 		catch (SQLException e) {e.printStackTrace();}
// 		finally{
// 			if (statement != null) {statement.close();}
// 			if (conect != null) {conect.close();}
// 		}
// 		return objetos;
//   }
//    public static List<Usuario> selectUsuario(String condition) throws SQLException{
//      	 Connection conect=ConnectionConfiguration.conectar();
//   		 String query = " select * from usuario "+condition;
//   		 
//   		 Statement statement = null;
//   		 ResultSet rs=null;
//   		 List<Usuario> objetos = new ArrayList<Usuario>();
//
//   		try {
//   			statement = conect.createStatement();
//   			rs=statement.executeQuery(query);
//   			while(rs.next()){
//   				Usuario objeto = new Usuario();
//
//   				objeto.setId(rs.getInt("id"));
//   				objeto.setCorreo(rs.getString("correo"));
//   				objeto.setNombre(rs.getString("nombre"));
//   				objeto.setEntidad(rs.getString("entidad"));
//   				objeto.setEntidad_id(rs.getInt("entidad_id"));
//   				objeto.setNivel_id(rs.getInt("nivel_id"));
//   				
//   				
//   				objetos.add(objeto);
//   			}
//   		}
//   		catch (SQLException e) {e.printStackTrace();}
//   		finally{
//   			if (statement != null) {statement.close();}
//   			if (conect != null) {conect.close();}
//   		}
//   		return objetos;
//     }
//    
//    public static List<ObjetivoEstrategia> selectObjetivosPorEstrategiaPnd(String condition) throws SQLException{
//   	 Connection conect=ConnectionConfiguration.conectar();
//		 String query = " select DISTINCT(objetivo.nombre), objetivo.id as objetivo_id, estrategia.id as estrategia_id from estrategia_has_objetivo "+
//				 	"inner join estrategia on estrategia_id=estrategia.id "+
//				 	"inner join objetivo on objetivo_id=objetivo.id "+
//				 	"where estrategia_has_objetivo.objetivo_tipo_objetivo_id =1 "+condition;
//		 
//		 Statement statement = null;
//		 ResultSet rs=null;
//		 List<ObjetivoEstrategia> objetos = new ArrayList<ObjetivoEstrategia>();
//
//		try {
//			statement = conect.createStatement();
//			rs=statement.executeQuery(query);
//			while(rs.next()){
//				ObjetivoEstrategia objeto = new ObjetivoEstrategia();
//
//				objeto.setEstrategia_id(rs.getInt("estrategia_id"));
//				objeto.setObjetivo_id(rs.getInt("objetivo_id"));
//				objeto.setObjetivoNombre(rs.getString("nombre"));
//				
//				
//				objetos.add(objeto);
//			}
//		}
//		catch (SQLException e) {e.printStackTrace();}
//		finally{
//			if (statement != null) {statement.close();}
//			if (conect != null) {conect.close();}
//		}
//		return objetos;
//  }
//    public static List<Indicador> selectAllIndicadores(String condition) throws SQLException{
//    	 Connection conect=ConnectionConfiguration.conectar();
//		 String query = " select * from indicador "+condition;
//		 Statement statement = null;
//		 ResultSet rs=null;
//		 List<Indicador> objetos = new ArrayList<Indicador>();
//
//		try {
//			statement = conect.createStatement();
//			rs=statement.executeQuery(query);
//			while(rs.next()){
//				Indicador objeto = new Indicador();
//				objeto.setId(rs.getInt("id"));
//				objeto.setNombre(rs.getString("nombre"));
//				objeto.setDescripcion(rs.getString("descripcion"));
//				objeto.setTipo_indicador_id(rs.getInt("tipo_indicador_id"));
//				objeto.setMetodo_calculo_id(rs.getShort("metodo_calculo_id"));
//				objeto.setFrecuencia_meses(rs.getShort("frecuencia_meses"));
//				objeto.setUnidad_medida_id(rs.getShort("unidad_medida_id"));
//				objeto.setDesagregacion_tipo_zona_geografica_id(rs.getShort("desagregacion_tipo_zona_geografica_id"));
//				objeto.setTipo_demografica_id(rs.getShort("tipo_demografica_id"));
//				objeto.setFuente_verificacion_id(rs.getShort("fuente_verificacion_id"));
//				objeto.setObservaciones(rs.getString("observaciones"));
//				objeto.setObjetivo_id(rs.getShort("objetivo_id"));
//				objeto.setBorrado(rs.getShort("borrado"));
//				
//				
//				objetos.add(objeto);
//			}
//		}
//		catch (SQLException e) {e.printStackTrace();}
//		finally{
//			if (statement != null) {statement.close();}
//			if (conect != null) {conect.close();}
//		}
//		return objetos;
//   }
//    
//    public static List<Meta> selectMetasPnd(String condition) throws SQLException{
//   	 Connection conect=ConnectionConfiguration.conectar();
//		 String query = " select * from meta "+condition;
//		 Statement statement = null;
//		 ResultSet rs=null;
//		 List<Meta> objetos = new ArrayList<Meta>();
//
//		try {
//			statement = conect.createStatement();
//			rs=statement.executeQuery(query);
//			
//			while(rs.next()){
//				Meta objeto = new Meta();
//				objeto.setId(rs.getInt("id"));
//				objeto.setCantidad(rs.getDouble("cantidad"));
//				objeto.setVencimiento(rs.getString("vencimiento"));
//				objeto.setIndicador_id(rs.getInt("indicador_id"));
//				objeto.setZona_geografica_id(rs.getInt("zona_geografica_id"));
//				objeto.setDemografia_id(rs.getInt("demografia_id"));
//				objeto.setBorrado(rs.getInt("borrado"));
//				
//				objetos.add(objeto);
//			}
//		}
//		catch (SQLException e) {e.printStackTrace();}
//		finally{
//			if (statement != null) {statement.close();}
//			if (conect != null) {conect.close();}
//		}
//		return objetos;
//  }
//    
//    public static List<ProductoPresupuestoMeta> selectAllProductosPresupuestoMeta(String condition) throws SQLException{
//   	 Connection conect=ConnectionConfiguration.conectar();
//		 String query = " select * from producto_presupuesto_meta "+condition;
//		 Statement statement = null;
//		 ResultSet rs=null;
//		 List<ProductoPresupuestoMeta> objetos = new ArrayList<ProductoPresupuestoMeta>();
//		 try {
//			statement = conect.createStatement();
//			rs=statement.executeQuery(query);
//			while(rs.next()){
//				ProductoPresupuestoMeta objeto = new ProductoPresupuestoMeta();
//				
//				objeto.setId(rs.getInt("id"));
//				objeto.setMes(rs.getShort("mes"));
//				objeto.setAnho(rs.getShort("anho"));
//				objeto.setCantidad(rs.getDouble("cantidad"));
//				objeto.setCatalogo_destianatario_id (rs.getInt("catalogo_destinatario_id"));
//				objeto.setDepartamento(rs.getShort("departamento_id"));
//				objeto.setProducto_presupusto_id(rs.getShort("producto_presupusto_id"));
//				objeto.setProducto_id(rs.getShort("producto_id"));
//				objeto.setUnidad_medida_id(rs.getShort("unidad_medida_id"));
//				objeto.setProyecto_id(rs.getShort("proyecto_id"));
//				objeto.setSubprograma_id(rs.getShort("subprograma_id"));
//				objeto.setPrograma_id(rs.getShort("programa_id"));
//				objeto.setTipo_presupuesto_id(rs.getShort("tipo_presupuesto_id"));
//				objeto.setEntidad_id(rs.getShort("entidad_id"));
//				objeto.setNivel_id(rs.getShort("nivel_id"));
//				objetos.add(objeto);
//			}
//		}
//		catch (SQLException e) {e.printStackTrace();}
//		finally{
//			if (statement != null) {statement.close();}
//			if (conect != null) {conect.close();}
//		}
//		return objetos;
//   }
//    public static List<ProductoPresupuestoDestinatario> selectAllProductosDestinatarios(String condition) throws SQLException{
//      	 Connection conect=ConnectionConfiguration.conectar();
//   		 String query = " select * from producto_presupuesto_destinatario "+condition;
//   		 Statement statement = null;
//   		 ResultSet rs=null;
//   		 List<ProductoPresupuestoDestinatario> objetos = new ArrayList<ProductoPresupuestoDestinatario>();
//
//   		try {
//   			statement = conect.createStatement();
//   			rs=statement.executeQuery(query);
//   			while(rs.next()){
//   				ProductoPresupuestoDestinatario objeto = new ProductoPresupuestoDestinatario();
//   				
//   				objeto.setId(rs.getInt("id"));
//   				objeto.setDepartamento(rs.getShort("departamento"));
//   				objeto.setCantidad(rs.getDouble("cantidad"));
//   				objeto.setCatalogo_destinatario (rs.getInt("catalogo_destinatario"));
//   				
//   				objeto.setProducto(rs.getShort("producto"));
//   				objeto.setProyecto(rs.getShort("proyecto"));
//   				objeto.setSubprograma(rs.getShort("subprograma"));
//   				objeto.setPrograma(rs.getShort("programa"));
//   				objeto.setTipo_presupuesto(rs.getShort("tipo_presupuesto"));
//   				objeto.setEntidad(rs.getShort("entidad"));
//   				objeto.setNivel(rs.getShort("nivel"));
//   				objetos.add(objeto);
//   			}
//   		}
//   		catch (SQLException e) {e.printStackTrace();}
//   		finally{
//   			if (statement != null) {statement.close();}
//   			if (conect != null) {conect.close();}
//   		}
//   		return objetos;
//      }
//    
//    
//    public static List<CatalogoProductoMeta> selectAllCatalogProductosHacienda(String condition) throws SQLException{
//    	 Connection conect=ConnectionConfiguration.conectar();
//		 String query = " select * from producto "+condition;
//		 query += " order by nombre ASC";
//		 Statement statement = null;
//		 ResultSet rs=null;
//		 List<CatalogoProductoMeta> productos = new ArrayList<CatalogoProductoMeta>();
//
//		try {
//			statement = conect.createStatement();
//			rs=statement.executeQuery(query);
//			while(rs.next()){
//				CatalogoProductoMeta producto = new CatalogoProductoMeta();
//				producto.setClase(rs.getString("clase"));
//				producto.setNombreCatalogo(rs.getString("nombre"));
//				producto.setCodigoCatalogo(rs.getShort("id"));
//				producto.setCodUnidadMedida(rs.getShort("unidad_medida_id"));
//				productos.add(producto);
//			}
//		}
//		catch (SQLException e) {e.printStackTrace();}
//		finally{
//			if (statement != null) {statement.close();}
//			if (conect != null) {conect.close();}
//		}
//		return productos;
//    }
//    public static List<UnidadMedida> selectAllUnidadesMedida(String condition) throws SQLException{
//   	 Connection conect=ConnectionConfiguration.conectar();
//		 String query = " select * from unidad_medida "+condition+" order by nombre ASC";
//		 Statement statement = null;
//		 ResultSet rs=null;
//		 List<UnidadMedida> objetos = new ArrayList<UnidadMedida>();
//
//		try {
//			statement = conect.createStatement();
//			rs=statement.executeQuery(query);
//			while(rs.next()){
//				UnidadMedida objeto = new UnidadMedida();
//				objeto.setCodigoUnidadMedida(rs.getShort("id"));
//				objeto.setNombre(rs.getString("nombre"));
//				objeto.setAbreviacion(rs.getString("abrev"));
//				objetos.add(objeto);
//			}
//		}
//		catch (SQLException e) {e.printStackTrace();}
//		finally{
//			if (statement != null) {statement.close();}
//			if (conect != null) {conect.close();}
//		}
//		return objetos;
//   }
//    public static List<Departamento> selectAllDepartamentos() throws SQLException{
//   	 	Connection conect=ConnectionConfiguration.conectar();String query = " select * from departamento";
//		 Statement statement = null; ResultSet rs=null;
//		 List<Departamento> objetos = new ArrayList<Departamento>();
//
//		try {
//			statement = conect.createStatement();
//			rs=statement.executeQuery(query);
//			
//			while(rs.next()){
//				Departamento objeto = new Departamento();
//				objeto.setAbrevDepartamento(rs.getString("abrev"));
//				objeto.setNombreDepartamento(rs.getString("nombre"));
//				objeto.setDeptoPais(rs.getShort("id"));
//				objeto.setCodigoPais(rs.getShort("pais"));
//				objeto.setNumeroFila(rs.getShort("numero_fila"));
//				objetos.add(objeto);
//			}
//		}
//		catch (SQLException e) {e.printStackTrace();}
//		finally{
//			if (statement != null) {statement.close();}
//			if (conect != null) {conect.close();}
//		}
//		return objetos;
//   }
//    public static List<Mes> selectAllMeses() throws SQLException{
//   	 	Connection conect=ConnectionConfiguration.conectar();String query = " select * from mes";
//		 Statement statement = null; ResultSet rs=null;
//		 List<Mes> objetos = new ArrayList<Mes>();
//
//		try {
//			statement = conect.createStatement();
//			rs=statement.executeQuery(query);
//			
//			while(rs.next()){
//				Mes objeto = new Mes();
//				objeto.setAbrev(rs.getString("abrev"));
//				objeto.setNombre(rs.getString("nombre"));
//				objeto.setId(rs.getShort("id"));
//				objetos.add(objeto);
//			}
//		}
//		catch (SQLException e) {e.printStackTrace();}
//		finally{
//			if (statement != null) {statement.close();}
//			if (conect != null) {conect.close();}
//		}
//		return objetos;
//   }
//    public static List<PlanEje> selectAllPLanEje() throws SQLException{
//   	 	Connection conect=ConnectionConfiguration.conectar();String query = " select * from eje_estrategico";
//		 Statement statement = null; ResultSet rs=null;
//		 List<PlanEje> objetos = new ArrayList<PlanEje>();
//
//		try {
//			statement = conect.createStatement();
//			rs=statement.executeQuery(query);
//			
//			while(rs.next()){
//				PlanEje objeto = new PlanEje();
//				objeto.setEjeNombre(rs.getString("nombre"));
//				objeto.setEjeDescripcion(rs.getString("descripcion"));
//				objeto.setCodigoPlan(rs.getShort("plan_id"));
//				objeto.setEjeCodigo(rs.getShort("id"));
//				objetos.add(objeto);
//			}
//		}
//		catch (SQLException e) {e.printStackTrace();}
//		finally{
//			if (statement != null) {statement.close();}
//			if (conect != null) {conect.close();}
//		}
//		return objetos;
//   }
//    public static List<py.gov.stp.mh.clasificadores.Entidad> selectAllEntidades(String condition) throws SQLException{
//   	 	Connection conect=ConnectionConfiguration.conectar();String query = " select * from entidad "+condition;
//		 Statement statement = null; ResultSet rs=null;
//		 List<py.gov.stp.mh.clasificadores.Entidad> objetos = new ArrayList<py.gov.stp.mh.clasificadores.Entidad>();
//
//		try {
//			statement = conect.createStatement();
//			rs=statement.executeQuery(query);
//			
//			while(rs.next()){
//				py.gov.stp.mh.clasificadores.Entidad objeto = new py.gov.stp.mh.clasificadores.Entidad();
//				objeto.setEntidad(rs.getShort("id"));
//				objeto.setNombreEntidad(rs.getString("nombre"));
//				//objeto.setDescripcion(rs.getString("descripcion"));
//				objeto.setAnio(rs.getShort("anho"));
//				//objeto.setVersion(rs.getShort("version"));
//				objeto.setDiagnostico(rs.getString("diagnostico"));
//				objeto.setAbrevEntidad(rs.getString("abrev"));
//				objeto.setBaseLegal(rs.getString("base_legal"));
//				objeto.setMision(rs.getString("mision"));
//				objeto.setNivel(rs.getShort("nivel_id"));
//				objeto.setNumeroFila(rs.getShort("numero_fila"));
//				objeto.setObjetivo(rs.getString("objetivo"));
//				objeto.setPolitica(rs.getString("politica"));
//				objeto.setVision(rs.getString("vision"));
//				objeto.setRuc(rs.getString("ruc"));
//				
//				objetos.add(objeto);
//			}
//		}
//		catch (SQLException e) {e.printStackTrace();}
//		finally{
//			if (statement != null) {statement.close();}
//			if (conect != null) {conect.close();}
//		}
//		return objetos;
//   }
//    public static List<FuenteFinanciamiento> selectAllFuentesFinanciamiento() throws SQLException{
//   	 	Connection conect=ConnectionConfiguration.conectar();String query = " select * from fuente_financiamiento";
//		 Statement statement = null; ResultSet rs=null;
//		 List<FuenteFinanciamiento> objetos = new ArrayList<FuenteFinanciamiento>();
//
//		try {
//			statement = conect.createStatement();
//			rs=statement.executeQuery(query);
//			
//			while(rs.next()){
//				FuenteFinanciamiento objeto = new FuenteFinanciamiento();
//				objeto.setCodFuenteFinanciamiento(rs.getShort("id"));
//				objeto.setNombreFuenteFinanciamiento(rs.getString("nombre"));
//				objeto.setSiglaFuenteFinanciamiento(rs.getString("descripcion"));
//				objeto.setAnio(rs.getShort("anho"));
//				objeto.setNumeroFila(rs.getShort("numero_fila"));
//				objetos.add(objeto);
//			}
//		}
//		catch (SQLException e) {e.printStackTrace();}
//		finally{
//			if (statement != null) {statement.close();}
//			if (conect != null) {conect.close();}
//		}
//		return objetos;
//   }
//    public static List<Funcional> selectAllFuncionales() throws SQLException{
//   	 	Connection conect=ConnectionConfiguration.conectar();String query = " select * from funcional where es_imputable ='S'";
//		 Statement statement = null; ResultSet rs=null;
//		 List<Funcional> objetos = new ArrayList<Funcional>();
//
//		try {
//			statement = conect.createStatement();
//			rs=statement.executeQuery(query);
//			
//			while(rs.next()){
//				Funcional objeto = new Funcional();
//				objeto.setCodigoFuncional(rs.getShort("id"));
//				objeto.setNombre(rs.getString("nombre"));
//				objeto.setAbreviacion(rs.getString("abrev"));
//				objeto.setEsImputable(rs.getString("es_imputable"));
//				objeto.setNumeroFila(rs.getShort("numero_fila"));
//				objetos.add(objeto);
//			}
//		}
//		catch (SQLException e) {e.printStackTrace();}
//		finally{
//			if (statement != null) {statement.close();}
//			if (conect != null) {conect.close();}
//		}
//		return objetos;
//   }
//    public static List<Nivel> selectAllNiveles(String condition) throws SQLException{
//   	 	Connection conect=ConnectionConfiguration.conectar();String query = " select * from nivel "+condition;
//		 Statement statement = null; ResultSet rs=null;
//		 List<Nivel> objetos = new ArrayList<Nivel>();
//
//		try {
//			statement = conect.createStatement();
//			rs=statement.executeQuery(query);
//			
//			while(rs.next()){
//				Nivel objeto = new Nivel();
//				objeto.setNivel(rs.getShort("id"));
//				objeto.setNombreNivel(rs.getString("nombre"));
//				objeto.setAbrevNivel(rs.getString("abrev"));
//				objeto.setEsImputable(rs.getString("es_imputable"));
//				objeto.setNumeroFila(rs.getShort("numero_fila"));
//				objeto.setAnio(rs.getShort("anho"));
//				objetos.add(objeto);
//			}
//		}
//		catch (SQLException e) {e.printStackTrace();}
//		finally{
//			if (statement != null) {statement.close();}
//			if (conect != null) {conect.close();}
//		}
//		return objetos;
//   }
//    public static List<ObjetoGasto> selectAllObjetosDeGasto() throws SQLException{
//   	 	Connection conect=ConnectionConfiguration.conectar();String query = " select * from objeto_de_gasto";
//		 Statement statement = null; ResultSet rs=null;
//		 List<ObjetoGasto> objetos = new ArrayList<ObjetoGasto>();
//
//		try {
//			statement = conect.createStatement();
//			rs=statement.executeQuery(query);
//			
//			while(rs.next()){
//				ObjetoGasto objeto = new ObjetoGasto();
//				objeto.setCodObjetoGasto(rs.getShort("id"));
//				objeto.setDescripcionObjetoGasto(rs.getString("descripcion"));
//				objeto.setAbrevObjetoGasto(rs.getString("abrev"));
//				objeto.setEsImputable(rs.getString("es_imputable"));
//				objeto.setNumeroFila(rs.getShort("numero_fila"));
//				objeto.setAnio(rs.getShort("anho"));
//				objetos.add(objeto);
//			}
//		}
//		catch (SQLException e) {e.printStackTrace();}
//		finally{
//			if (statement != null) {statement.close();}
//			if (conect != null) {conect.close();}
//		}
//		return objetos;
//   } 
//    public static List<OrganismoFinanciador> selectAllOrganismosFinanciadores() throws SQLException{
//   	 	Connection conect=ConnectionConfiguration.conectar();String query = " select * from organismo_financiador";
//		 Statement statement = null; ResultSet rs=null;
//		 List<OrganismoFinanciador> objetos = new ArrayList<OrganismoFinanciador>();
//
//		try {
//			statement = conect.createStatement();
//			rs=statement.executeQuery(query);
//			
//			while(rs.next()){
//				OrganismoFinanciador objeto = new OrganismoFinanciador();
//				objeto.setCodOrgFinanciador(rs.getShort("id"));
//				objeto.setNombreOrgFinanciador(rs.getString("nombre"));
//				objeto.setAnio(rs.getShort("anho"));
//				objeto.setNumeroFila(rs.getShort("numero_fila"));
//				objetos.add(objeto);
//			}
//		}
//		catch (SQLException e) {e.printStackTrace();}
//		finally{
//			if (statement != null) {statement.close();}
//			if (conect != null) {conect.close();}
//		}
//		return objetos;
//   }
//    public static List<Pilar> selectAllPilares() throws SQLException{
//   	 	Connection conect=ConnectionConfiguration.conectar();String query = " select * from estrategia where plan=9";
//		 Statement statement = null; ResultSet rs=null;
//		 List<Pilar> objetos = new ArrayList<Pilar>();
//
//		try {
//			statement = conect.createStatement();
//			rs=statement.executeQuery(query);
//			
//			while(rs.next()){
//				Pilar objeto = new Pilar();
//				objeto.setCodigoPilar(rs.getShort("id"));
//				objeto.setPilarNombre(rs.getString("nombre"));
//				objeto.setCodigoPlan(rs.getShort("plan"));
//				objeto.setNumeroFila(rs.getShort("numero_fila"));
//			//	objeto.setEje_estrategico(rs.getShort("eje_estrategico_id"));
//			//	objeto.setLinea_transversal(rs.getShort("linea_transversal_id"));
//				objetos.add(objeto);
//			}
//		}
//		catch (SQLException e) {e.printStackTrace();}
//		finally{
//			if (statement != null) {statement.close();}
//			if (conect != null) {conect.close();}
//		}
//		return objetos;
//   }
//    public static List<Plan> selectAllPlanes() throws SQLException, DatatypeConfigurationException{
//   	 	Connection conect=ConnectionConfiguration.conectar();String query = " select * from plan";
//		 Statement statement = null; ResultSet rs=null;
//		 List<Plan> objetos = new ArrayList<Plan>();
//
//		try {
//			statement = conect.createStatement();
//			rs=statement.executeQuery(query);
//			
//			while(rs.next()){
//				GregorianCalendar c = new GregorianCalendar();c.setTime(rs.getDate("fecha_inicio"));
//				XMLGregorianCalendar fini = DatatypeFactory.newInstance().newXMLGregorianCalendar(c);
//				GregorianCalendar c2 = new GregorianCalendar();c2.setTime(rs.getDate("fecha_fin"));
//				XMLGregorianCalendar ffin = DatatypeFactory.newInstance().newXMLGregorianCalendar(c2);
//				Plan objeto = new Plan();
//				objeto.setCodigoPlan(rs.getShort("id"));
//				objeto.setEntidadResponsable(rs.getString("entidad_responsable"));
//				objeto.setPlanNombre(rs.getString("nombre"));
//				objeto.setPlanDescripcion(rs.getString("descripcion"));
//				objeto.setPlanDetalle(rs.getString("detalle"));
//				objeto.setPlanDesde(fini);
//				objeto.setPlanHasta(ffin);
//				
//				objetos.add(objeto);
//			}
//		}
//		catch (SQLException e) {e.printStackTrace();}
//		finally{
//			if (statement != null) {statement.close();}
//			if (conect != null) {conect.close();}
//		}
//		return objetos;
//   }
//    public static List<PrecioDNCP> selectAllCatalogoDNCP()  throws SQLException{
// 	Connection conect=ConnectionConfiguration.conectar();String query = " select * from catalogo_dncp";
//	 Statement statement = null; ResultSet rs=null;
//	 List<PrecioDNCP> objetos = new ArrayList<PrecioDNCP>();
//
//	try {
//		statement = conect.createStatement();
//		rs=statement.executeQuery(query);
//		
//		while(rs.next()){
//			PrecioDNCP objeto = new PrecioDNCP();
//			objeto.setNumeroFila(rs.getShort("numero_fila"));
//			objeto.setAnio(rs.getShort("anho"));
//			objeto.setCodCatalogo(rs.getInt("id"));
//			objeto.setNombreCatalogo(rs.getString("nombre"));
//			objeto.setSiglaCatalogo("");
//			objeto.setPrecio(rs.getDouble("precio"));
//			objeto.setCodObjetoGasto(rs.getShort("objeto_de_gasto_id"));
//			objetos.add(objeto);
//		}
//	}
//	catch (SQLException e) {e.printStackTrace();}
//	finally{
//		if (statement != null) {statement.close();}
//		if (conect != null) {conect.close();}
//	}
//	return objetos;
//    }
//    public static List<TipoPrograma> selectAllTiposPrograma()  throws SQLException{
//     	Connection conect=ConnectionConfiguration.conectar();String query = " select * from tipo_presupuesto";
//    	 Statement statement = null; ResultSet rs=null;
//    	 List<TipoPrograma> objetos = new ArrayList<TipoPrograma>();
//
//    	try {
//    		statement = conect.createStatement();
//    		rs=statement.executeQuery(query);
//    		
//    		while(rs.next()){
//    			TipoPrograma objeto = new TipoPrograma();
//    			objeto.setNumeroFila(rs.getShort("numero_fila"));
//    			objeto.setAnio(rs.getShort("anho"));
//    			objeto.setAbrevTipoPrograma(rs.getString("abrev"));
//    			objeto.setNombreTipoPrograma(rs.getString("nombre"));
//    			objetos.add(objeto);
//    		}
//    	}
//    	catch (SQLException e) {e.printStackTrace();}
//    	finally{
//    		if (statement != null) {statement.close();}
//    		if (conect != null) {conect.close();}
//    	}
//    	return objetos;
//        }
//    public static List<TipoCatalogoDestinatario> selectAllTiposDestinatarios()  throws SQLException{
//     	Connection conect=ConnectionConfiguration.conectar();String query = " select * from tipo_catalogo_destinatario";
//    	 Statement statement = null; ResultSet rs=null;
//    	 List<TipoCatalogoDestinatario> objetos = new ArrayList<TipoCatalogoDestinatario>();
//
//    	try {
//    		statement = conect.createStatement();
//    		rs=statement.executeQuery(query);
//    		
//    		while(rs.next()){
//    			TipoCatalogoDestinatario objeto = new TipoCatalogoDestinatario();
//    			objeto.setId(rs.getShort("id"));
//    			objeto.setNombre(rs.getString("nombre"));
//    			objeto.setDescripcion(rs.getString("descripcion"));
//    			
//    			objetos.add(objeto);
//    		}
//    	}
//    	catch (SQLException e) {e.printStackTrace();}
//    	finally{
//    		if (statement != null) {statement.close();}
//    		if (conect != null) {conect.close();}
//    	}
//    	return objetos;
//        }
//    // destinatarios
//    public static List<CatalogoDestinatario> selectAllDestinatarios(String condition)  throws SQLException{
//     	Connection conect=ConnectionConfiguration.conectar();String query = " select * from catalogo_destinatario "+condition;
//    	 Statement statement = null; ResultSet rs=null;
//    	 List<CatalogoDestinatario> objetos = new ArrayList<CatalogoDestinatario>();
//
//    	try {
//    		statement = conect.createStatement();
//    		rs=statement.executeQuery(query);
//    		
//    		while(rs.next()){
//    			CatalogoDestinatario objeto = new CatalogoDestinatario();
//    			objeto.setId(rs.getShort("id"));
//    			objeto.setNombre(rs.getString("nombre"));
//    			objeto.setDescripcion(rs.getString("descripcion"));
//    			
//    			objetos.add(objeto);
//    		}
//    	}
//    	catch (SQLException e) {e.printStackTrace();}
//    	finally{
//    		if (statement != null) {statement.close();}
//    		if (conect != null) {conect.close();}
//    	}
//    	return objetos;
//        }
//	public static List<Programa> selectAllProgramas(String condition)  throws SQLException{
//	 	Connection conect=ConnectionConfiguration.conectar();String query = " select * from programa "+condition;
//		 Statement statement = null; ResultSet rs=null;
//		 List<Programa> objetos = new ArrayList<Programa>();
//
//		try {
//			statement = conect.createStatement();
//			rs=statement.executeQuery(query);
//			
//			while(rs.next()){
//				Programa objeto = new Programa();
//				objeto.setNumeroFila(rs.getShort("numeroFila"));
//				objeto.setAnio(rs.getShort("anho"));
//				objeto.setNivel(rs.getShort("entidad_nivel_id"));
//				objeto.setEntidad(rs.getShort("entidad_id"));
//				objeto.setTipoPrograma(rs.getShort("tipo_presupuesto_id"));
//				objeto.setCodigoPrograma(rs.getShort("id"));
//				objeto.setNombrePrograma(rs.getString("nombre"));
//				objeto.setAbrevPrograma(rs.getString("abrev"));
//				objeto.setDescripcionPrograma(rs.getString("descripcion"));
//				objeto.setObjetivo(rs.getString("objetivo"));
//				objeto.setDiagnostico(rs.getString("diagnostico"));
//				objeto.setBaseLegal(rs.getString("base_legal"));
//				objeto.setResultado(rs.getString("resultado"));
//				objeto.setCodigoDepartamento(rs.getShort("codigoDepartamento"));
//				objetos.add(objeto);
//			}
//		}
//		catch (SQLException e) {e.printStackTrace();}
//		finally{
//			if (statement != null) {statement.close();}
//			if (conect != null) {conect.close();}
//		}
//		return objetos;
//	}
//		public static List<SubPrograma> selectAllSubprogramas(String condition)  throws SQLException{
//			Connection conect=ConnectionConfiguration.conectar();String query = " select * from subprograma "+condition;
//			 Statement statement = null; ResultSet rs=null;
//			 List<SubPrograma> objetos = new ArrayList<SubPrograma>();
//
//			try {
//				statement = conect.createStatement();
//				rs=statement.executeQuery(query);
//				
//				while(rs.next()){
//					SubPrograma objeto = new SubPrograma();
//					//objeto.setNumeroFila(rs.getShort("numeroFila"));
//					objeto.setAnho(rs.getShort("anho"));
//					objeto.setPrograma_entidad_nivel_id(rs.getShort("programa_entidad_nivel_id"));
//					objeto.setPrograma_entidad_id(rs.getShort("programa_entidad_id"));
//					objeto.setPrograma_tipo_presupuesto_id(rs.getShort("programa_tipo_presupuesto_id"));
//					objeto.setPrograma_id(rs.getShort("programa_id"));
//					objeto.setId(rs.getShort("id"));
//					objeto.setNombre(rs.getString("nombre"));
//					objeto.setAbrev(rs.getString("abrev"));
//					objeto.setDescripcion(rs.getString("descripcion"));
//					objeto.setObjetivo(rs.getString("objetivo"));
//					objeto.setCodigo_departamento(rs.getShort("codigo_departamento"));
//					objeto.setBaseLegal(rs.getString("baseLegal"));
//					objetos.add(objeto);
//				}
//			}
//			catch (SQLException e) {e.printStackTrace();}
//			finally{
//				if (statement != null) {statement.close();}
//				if (conect != null) {conect.close();}
//			}
//			return objetos;
//		}
//		public static List<Proyecto> selectAllProyectos(String condition)  throws SQLException{
//			Connection conect=ConnectionConfiguration.conectar();String query = " select * from proyecto "+condition;
//		 	
//			 Statement statement = null; ResultSet rs=null;
//			 List<Proyecto> objetos = new ArrayList<Proyecto>();
//
//			try {
//				statement = conect.createStatement();
//				rs=statement.executeQuery(query);
//				
//				while(rs.next()){
//					Proyecto objeto = new Proyecto();
//					//objeto.setNumeroFila(rs.getShort("numeroFila"));
//					objeto.setAnio(rs.getShort("anho"));
//					objeto.setNivel(rs.getShort("subprograma_programa_entidad_nivel_id"));
//					objeto.setEntidad(rs.getShort("subprograma_programa_entidad_id"));
//					objeto.setTipoPrograma(rs.getShort("subprograma_programa_tipo_presupuesto_id"));
//					objeto.setCodigoPrograma(rs.getShort("subprograma_programa_id"));
//					objeto.setCodigoSubprograma(rs.getShort("subprograma_id"));
//					objeto.setCodigoProyecto(rs.getShort("id"));
//					objeto.setNombreProyecto(rs.getString("nombre"));
//					objeto.setAbrevProyecto(rs.getString("abrev"));
//					objeto.setDescripcionProyecto(rs.getString("descripcion"));
//					objeto.setCodigoUnidadResponsable(rs.getShort("unidad_responsable_id"));
//					objeto.setCodigoFuncional(rs.getShort("funcional_id"));
//					objeto.setDiagnostico(rs.getString("diagnostico"));
//					objeto.setResultadoEsperado(rs.getString("resultado_esperado"));
//					objeto.setCodigoDepartamento(rs.getShort("codigo_departamento"));
//					objeto.setCodigoSnip(rs.getShort("codigo_snip"));
//					objeto.setObjetivo_estrategico_id(rs.getShort("objetivo_estrategico_id"));
//					objetos.add(objeto);
//				}
//			}
//			catch (SQLException e) {e.printStackTrace();}
//			finally{
//				if (statement != null) {statement.close();}
//				if (conect != null) {conect.close();}
//			}
//			return objetos;
//		}
//		public static List<ProductoPresupuesto> selectAllProductosPresupuesto(String condition)  throws SQLException{
//			Connection conect=ConnectionConfiguration.conectar();String query = " select * from producto_presupusto "+condition;
//		 	
//			 Statement statement = null; ResultSet rs=null;
//			 List<ProductoPresupuesto> objetos = new ArrayList<ProductoPresupuesto>();
//
//			try {
//				statement = conect.createStatement();
//				rs=statement.executeQuery(query);
//				
//				while(rs.next()){
//					ProductoPresupuesto objeto = new ProductoPresupuesto();
//					//objeto.setNumeroFila(rs.getShort("numeroFila"));
//					objeto.setId(rs.getShort("id"));
//					objeto.setNumero_fila(rs.getShort("numero_fila"));
//					objeto.setAnho(rs.getShort("anho"));
//					objeto.setProducto_id(rs.getShort("producto_id"));
//					objeto.setUnidad_medida_id(rs.getShort("producto_unidad_medida_id"));
//					objeto.setProyecto_id(rs.getShort("proyecto_id"));
//					objeto.setSubprograma_id(rs.getShort("proyecto_subprograma_id"));
//					objeto.setPrograma_id(rs.getShort("proyecto_subprograma_programa_id"));
//					objeto.setTipo_presupuesto_id(rs.getShort("proyecto_subprograma_programa_tipo_presupuesto_id"));
//					objeto.setEntidad_id(rs.getShort("proyecto_subprograma_programa_entidad_id"));
//					objeto.setNivel_id(rs.getShort("proyecto_subprograma_programa_entidad_nivel_id"));
//					objeto.setVersion(rs.getShort("version"));
//					objetos.add(objeto);
//				}
//			}
//			catch (SQLException e) {e.printStackTrace();}
//			finally{
//				if (statement != null) {statement.close();}
//				if (conect != null) {conect.close();}
//			}
//			return objetos;
//}
//
//	    public static List<UnidadResponsable> selectAllUnidadResponsable(String condition) throws SQLException{
//	      	 Connection conect=ConnectionConfiguration.conectar();
//	   		 String query = " select * from unidad_responsable "+condition;
//	   		 Statement statement = null;
//	   		 ResultSet rs=null;
//	   		 List<UnidadResponsable> objetos = new ArrayList<UnidadResponsable>();
//
//	   		try {
//	   			statement = conect.createStatement();
//	   			rs=statement.executeQuery(query);
//	   			while(rs.next()){
//	   				UnidadResponsable objeto = new UnidadResponsable();
//	   				objeto.setUnrCodigo(rs.getShort("id"));
//	   				objeto.setUnrNombre(rs.getString("nombre"));
//	   				objeto.setUnrAbrev(rs.getString("abrev"));
//	   				objeto.setEntidad(rs.getShort("entidad_id"));
//	   				objeto.setNivel(rs.getShort("entidad_nivel_id"));
//	   				objeto.setUjeCodigo(rs.getInt("unidad_jerarquica_id"));
//	   				
//	   				objetos.add(objeto);
//	   			}
//	   		}
//	   		catch (SQLException e) {e.printStackTrace();}
//	   		finally{
//	   			if (statement != null) {statement.close();}
//	   			if (conect != null) {conect.close();}
//	   		}
//	   		return objetos;
//	      }
//	    public static List<EstructuraProgramatica> selectAllEstructuraProgramatica(String condition) throws SQLException{
//	      	 Connection conect=ConnectionConfiguration.conectar();
//	   		 String query = " select * from estructura_programatica "+condition;
//	   		 Statement statement = null;
//	   		 ResultSet rs=null;
//	   		 List<EstructuraProgramatica> objetos = new ArrayList<EstructuraProgramatica>();
//
//	   		try {
//	   			statement = conect.createStatement();
//	   			rs=statement.executeQuery(query);
//	   			while(rs.next()){
//	   				EstructuraProgramatica objeto = new EstructuraProgramatica();
//	   				objeto.setId(rs.getShort("id"));
//	   				objeto.setAnho(rs.getShort("anho"));
//	   				objeto.setNivel(rs.getShort("nivel"));
//	   				objeto.setEntidad(rs.getShort("entidad"));
//	   				objeto.setTipo(rs.getShort("tipo"));
//	   				objeto.setPrograma(rs.getShort("programa"));
//	   				objeto.setSubprograma(rs.getShort("subprograma"));
//	   				objeto.setProyecto(rs.getShort("proyecto"));
//	   				objeto.setNfprograma(rs.getShort("nfprograma"));
//	   				objeto.setNfsubprograma(rs.getShort("nfsubprograma"));
//	   				objeto.setNfproyecto(rs.getShort("nfproyecto"));
//	   				objeto.setDepartamento(rs.getShort("departamento"));
//	   				objeto.setUnidad_responsable(rs.getShort("unidad_responsable"));
//	   				objeto.setFuncional(rs.getShort("funcional"));
//	   				objeto.setDiagnostico(rs.getString("diagnostico"));
//	   				objeto.setBase_legal(rs.getString("base_legal"));
//	   				objeto.setNombre(rs.getString("nombre"));
//	   				objeto.setAbrev(rs.getString("abrev"));
//	   				objeto.setDescripcion(rs.getString("descripcion"));
//	   				
//	   				objetos.add(objeto);
//	   			}
//	   		}
//	   		catch (SQLException e) {e.printStackTrace();}
//	   		finally{
//	   			if (statement != null) {statement.close();}
//	   			if (conect != null) {conect.close();}
//	   		}
//	   		return objetos;
//	      }
//	    
//	    public static List<Resultado> selectAllResultados(String condition) throws SQLException{
//	      	 Connection conect=ConnectionConfiguration.conectar();
//	   		 String query = " select * from objetivo "+condition;
//	   		 Statement statement = null;
//	   		 ResultSet rs=null;
//	   		 List<Resultado> objetos = new ArrayList<Resultado>();
//
//	   		try {
//	   			statement = conect.createStatement();
//	   			rs=statement.executeQuery(query);
//	   			while(rs.next()){
//	   				Resultado objeto = new Resultado();
//	   				objeto.setId(rs.getShort("id"));
//	   				objeto.setNivel(rs.getShort("nivel"));
//	   				objeto.setEntidad(rs.getShort("entidad"));
//	   				objeto.setTipo_presupuesto(rs.getShort("tipo_presupuesto"));
//	   				objeto.setPrograma(rs.getShort("programa"));
//	   				objeto.setSubprograma(rs.getShort("subprograma"));
//	   				objeto.setProyecto(rs.getShort("proyecto"));
//	   				objeto.setFuncional(rs.getShort("funcional"));
//	   				objeto.setNombre(rs.getString("nombre"));
//	   				objeto.setDescripcion(rs.getString("descripcion"));
//	   				
//	   				objetos.add(objeto);
//	   			}
//	   		}
//	   		catch (SQLException e) {e.printStackTrace();}
//	   		finally{
//	   			if (statement != null) {statement.close();}
//	   			if (conect != null) {conect.close();}
//	   		}
//	   		return objetos;
//	      }	    	    
//    
//	    
//	    public static List<ProductoPresupuestoDestinatario> selectProductoPresupuestoDestinatario(String condition) throws SQLException{
//	      	 Connection conect=ConnectionConfiguration.conectar();
//	   		 String query = " select * from producto_presupuesto_destinatario "+condition;
//	   		 
//	   		 Statement statement = null;
//	   		 ResultSet rs=null;
//	   		 List<ProductoPresupuestoDestinatario> objetos = new ArrayList<ProductoPresupuestoDestinatario>();
//
//	   		try {
//	   			statement = conect.createStatement();
//	   			rs=statement.executeQuery(query);
//	   			while(rs.next()){
//	   				ProductoPresupuestoDestinatario objeto = new ProductoPresupuestoDestinatario();
//
//	   				objeto.setId(rs.getInt("id"));
//	   				objeto.setNivel(rs.getInt("nivel"));
//	   				objeto.setPrograma(rs.getInt("programa"));
//	   				objeto.setSubprograma(rs.getInt("subprograma"));
//	   				objeto.setProyecto(rs.getInt("proyecto"));
//	   				objeto.setProducto(rs.getInt("producto"));
//	   				objeto.setCatalogo_destinatario(rs.getInt("catalogo_destinatario"));
//	   				objeto.setDepartamento(rs.getInt("departamento"));
//	   				objeto.setCantidad(rs.getDouble("cantidad"));		   				
//	   				
//	   				objetos.add(objeto);
//	   			}
//	   		}
//	   		catch (SQLException e) {e.printStackTrace();}
//	   		finally{
//	   			if (statement != null) {statement.close();}
//	   			if (conect != null) {conect.close();}
//	   		}
//	   		return objetos;
//	     }
//	    
//	    
//	    
//	    /*
//    public static void insertTpoPrograma(int codTipoPrograma,  int numero_fila, int anio, String nombreTipoPrograma, String abrev){
//   	 Connection conect=ConnectionConfiguration.conectar();
//		 String query = " insert into tipo_presupuesto (id, numero_fila, anho, nombre, descipcion, abrev)"
//			        + " values (?,?,?,?,?,?)";
//		try {
//			
//			PreparedStatement preparedStmt;
//			preparedStmt = conect.prepareStatement(query);
//			preparedStmt.setInt (1, codTipoPrograma);
//			preparedStmt.setInt (2, numero_fila);
//			preparedStmt.setInt (3, anio);
//		    preparedStmt.setString (4, nombreTipoPrograma);
//		    preparedStmt.setString	(5, "");
//		    preparedStmt.setString	(6, abrev);
//		    preparedStmt.execute();
//		    conect.close();
//		} catch (SQLException e) {e.printStackTrace();}
//   }
//    public static void insertDepartamento(int codDeptoPais,  int numero_fila, int pais, String nombre, String abrev){
//      	 Connection conect=ConnectionConfiguration.conectar();
//   		 String query = " insert into departamento (id, numero_fila, pais, nombre, abrev)"
//   			        + " values (?, ?, ?,?,?)";
//   		try {
//   			
//   			PreparedStatement preparedStmt;
//   			preparedStmt = conect.prepareStatement(query);
//   			preparedStmt.setInt (1, codDeptoPais);
//   			preparedStmt.setInt (2, numero_fila);
//   			preparedStmt.setInt (3, 1);
//   		    preparedStmt.setString (4, nombre);
//   		    preparedStmt.setString	(5, abrev);
//   		    preparedStmt.execute();
//   		    conect.close();
//   		} catch (SQLException e) {e.printStackTrace();}
//      }
//    public static void insertEntidades(int numeroFila, int anio, int nivel, int entidad, String nombreEntidad, String abrevEntidad, String siglaEntidad, String base_legal, String mision, String politica, String objetivo, String diagnostico){
//   	 Connection conect=ConnectionConfiguration.conectar();
//		 String query = " insert into entidad (id, nombre, anho, nivel_id, abrev, sigla, fecha_creacion, base_legal, mision, politica, objetivo, diagnostico, version, numero_fila)"
//			        + " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
//		try {
//			
//			Timestamp timestamp = new Timestamp(new Date().getTime());
//			PreparedStatement preparedStmt;
//			preparedStmt = conect.prepareStatement(query);
//			preparedStmt.setInt (1, entidad);
//			preparedStmt.setString (2, nombreEntidad);
//		    preparedStmt.setInt (3, anio);
//		    preparedStmt.setInt	(4, nivel);
//		    preparedStmt.setString(5, abrevEntidad);
//		    preparedStmt.setString    (6, siglaEntidad);
//		    preparedStmt.setTimestamp    (7, timestamp);
//		    preparedStmt.setString    (8, base_legal);
//		    preparedStmt.setString    (9, mision);
//		    preparedStmt.setString    (10, politica);
//		    preparedStmt.setString    (11, objetivo);
//		    preparedStmt.setString    (12, diagnostico);
//		    preparedStmt.setInt	(13, 50);
//		    preparedStmt.setInt	(14, numeroFila);   
//		    preparedStmt.execute();
//		    conect.close();
//		} catch (SQLException e) {e.printStackTrace();}
//	
//   }
//    
//    public static void insertUnidadJerarquica(int codigoUje,  String nombre, String descripcion,  int entidad, int nivel, int anho, int numero_fila){
//     	 Connection conect=ConnectionConfiguration.conectar();
//  		 String query = " insert into unidad_jerarquica (id, nombre, descipcion, entidad_id, entidad_nivel_id, anho, numero_fila)"
//  			        + " values (?, ?, ?,?,?,?,?)";
//  		try {
//  			
//  			PreparedStatement preparedStmt;
//  			preparedStmt = conect.prepareStatement(query);
//  			preparedStmt.setInt (1, codigoUje);
//  			preparedStmt.setString (2, nombre);
//  			preparedStmt.setString (3, descripcion);
//  			preparedStmt.setInt (4, entidad);
//  			preparedStmt.setInt (5, nivel);
//  			preparedStmt.setInt (6, anho);
//  			preparedStmt.setInt (7, numero_fila);
//  		    preparedStmt.execute();
//  		    conect.close();
//  		} catch (SQLException e) {e.printStackTrace();}
//    }
//    
//    public static void insertUnidadResponsable(int codigoUnr, int codigoUje,  String nombre, String descripcion, String abrev, int numero_fila, int entidad, int nivel, int anho ){
//      	 Connection conect=ConnectionConfiguration.conectar();
//   		 String query = " insert into unidad_responsable (id, nombre, descripcion, abrev, numero_fila,  entidad_id, entidad_nivel_id, unidad_jerarquica_id, anho)"
//   			        + " values (?, ?, ?,?,?,?,?,?,?)";
//   		try {
//   			
//   			PreparedStatement preparedStmt;
//   			preparedStmt = conect.prepareStatement(query);
//   			preparedStmt.setInt (1, codigoUnr);
//   			preparedStmt.setString (2, nombre);
//   			preparedStmt.setString (3, descripcion);
//   			preparedStmt.setString (4, abrev);
//   			preparedStmt.setInt (5, numero_fila);
//   			preparedStmt.setInt (6, entidad);
//   			preparedStmt.setInt (7, nivel);
//   			preparedStmt.setInt (8, codigoUje);
//   			preparedStmt.setInt (9, anho);
//   		    preparedStmt.execute();
//   		    conect.close();
//   		} catch (SQLException e) {e.printStackTrace();}
//      }
//    public static void insertUnidadDeMedida(int id,  String nombre, String descripcion, String abrev, String simbolo){
//     	 Connection conect=ConnectionConfiguration.conectar();
//  		 String query = " insert into unidad_medida (id, nombre, abrev, simbolo,  descripcion)"
//  			        + " values (?,?,?,?,?)";
//  		try {
//  			
//  			PreparedStatement preparedStmt;
//  			preparedStmt = conect.prepareStatement(query);
//  			preparedStmt.setInt (1, id);
//  			preparedStmt.setString (2, nombre);
//  			preparedStmt.setString (3, abrev);
//  			preparedStmt.setString (4, simbolo);
//  			preparedStmt.setString (5, descripcion);
//  		    preparedStmt.execute();
//  		    conect.close();
//  		} catch (SQLException e) {e.printStackTrace();}
//     }
//    public static void insertPilares(int id,  String nombre, String descripcion, int numero_fila, int eje, int linea, int plan){
//    	 Connection conect=ConnectionConfiguration.conectar();
// 		 String query = " insert into estrategia (id, nombre, descripcion, numero_fila, eje_estrategico_id,  linea_transversal_id, plan)"
// 			        + " values (?,?,?,?,?,?, ?)";
// 		try {
// 			
// 			PreparedStatement preparedStmt;
// 			preparedStmt = conect.prepareStatement(query);
// 			preparedStmt.setInt (1, id);
// 			preparedStmt.setString (2, nombre);
// 			preparedStmt.setString (3, descripcion);
// 			preparedStmt.setInt (4, numero_fila);
// 			preparedStmt.setInt (5, eje);
// 			preparedStmt.setInt (6, linea);
// 			preparedStmt.setInt (7, plan);
// 		    preparedStmt.execute();
// 		    conect.close();
// 		} catch (SQLException e) {e.printStackTrace();}
//    }
//    public static void insertLineasTransversales(int id, String nombre, String descripcion, int plan){
//   	 Connection conect=ConnectionConfiguration.conectar();
//		 String query = " insert into linea_transversal (id, nombre, descripcion,plan_id)"
//			        + " values (?,?,?,?)";
//		try {
//			
//			PreparedStatement preparedStmt;
//			preparedStmt = conect.prepareStatement(query);
//			
//			preparedStmt.setInt (1, id);
//			preparedStmt.setString (2, nombre);
//			preparedStmt.setString (3, descripcion);
//			preparedStmt.setInt (4, plan);
//			preparedStmt.execute();
//		    conect.close();
//		} catch (SQLException e) {e.printStackTrace();}
//   }
//    
//    public static void insertPlanes(int id,String entidad_responsable, String nombre, String descripcion, String detalle, XMLGregorianCalendar fecha_inicio,XMLGregorianCalendar fecha_fin){
//   	 Connection conect=ConnectionConfiguration.conectar();
//		 String query = " insert into plan (id,entidad_responsable,nombre,descripcion,detalle,fecha_inicio,fecha_fin)"
//			        + " values (?,?,?,?,?,?,?)";
//		try {
//			java.sql.Date dtsini=null;
//			java.sql.Date dtsfin=null;
//			if (fecha_inicio!=null){GregorianCalendar dtini = fecha_inicio.toGregorianCalendar();  dtsini = new java.sql.Date(dtini.getTime().getTime());}
//			if (fecha_inicio!=null){GregorianCalendar dtfin = fecha_fin.toGregorianCalendar(); dtsfin = new java.sql.Date(dtfin.getTime().getTime());}
//			PreparedStatement preparedStmt;
//			preparedStmt = conect.prepareStatement(query);
//			preparedStmt.setInt (1, id);
//			preparedStmt.setString (2, entidad_responsable);
//			preparedStmt.setString (3, nombre);
//			preparedStmt.setString (4, descripcion);
//			preparedStmt.setString (5, detalle);
//			preparedStmt.setDate (6, dtsini);
//			preparedStmt.setDate (7, dtsfin);
//		    preparedStmt.execute();
//		    conect.close();
//		} catch (SQLException e) {e.printStackTrace();}
//   }
//   
//    public static void insertEjePorPlan(int numero_fila, int plan_id, int id, String nombre, String descripcion){
//     	 Connection conect=ConnectionConfiguration.conectar();
//  		 String query = " insert into eje_estrategico (plan_id,id,nombre,descripcion)"
//  			        + " values (?,?,?,?)";
//  		try {
//  			
//  			PreparedStatement preparedStmt;
//  			preparedStmt = conect.prepareStatement(query);
//  			
//  			preparedStmt.setInt (1, plan_id);
//  			preparedStmt.setInt (2, id);
//  			preparedStmt.setString (3, nombre);
//  			preparedStmt.setString (4, descripcion);
//  		    preparedStmt.execute();
//  		    conect.close();
//  		} catch (SQLException e) {e.printStackTrace();}
//     }
//    public static void insertProyectoSnipAutorizado(int id, int proyecto_snip_id, int anho, int entidad_nivel_id, int entidad_id, int fuente_financiamiento_id, int	organisimo_financiador_id, Double monto){
//     	 Connection conect=ConnectionConfiguration.conectar();
//  		 String query = " insert into proyecto_snip_autorizado ( id, proyecto_snip_id, anho, entidad_nivel_id, entidad_id, fuente_financiamiento_id, organismo_financiador_id, monto)"
//  			        + " values (?,?,?,?,?,?,?,?)";
//  		try {
//  			
//  			PreparedStatement preparedStmt;
//  			preparedStmt = conect.prepareStatement(query);
//  			preparedStmt.setInt (1, id);
//  			preparedStmt.setInt (2, proyecto_snip_id);
//  			preparedStmt.setInt (3, anho);
//  			preparedStmt.setInt (4, entidad_nivel_id);
//  			preparedStmt.setInt (5, entidad_id);
//  			preparedStmt.setInt (6, fuente_financiamiento_id);
//  			preparedStmt.setInt (7, organisimo_financiador_id);
//  			preparedStmt.setDouble(8, monto);
//  		    preparedStmt.execute();
//  		    conect.close();
//  		} catch (SQLException e) {e.printStackTrace();}
//     }
//    public static void insertFuncionales(int numero_fila, int id, String nombre, String abrev, String es_imputable){
//     	 Connection conect=ConnectionConfiguration.conectar();
//  		 String query = " insert into funcional (numero_fila, id, nombre, abrev, es_imputable)"
//  			        + " values (?,?,?,?,?)";
//  		try {
//  			
//  			PreparedStatement preparedStmt;
//  			preparedStmt = conect.prepareStatement(query);
//  			preparedStmt.setInt (1, numero_fila);
//  			preparedStmt.setInt (2, id);
//  			preparedStmt.setString (3, nombre);
//  			preparedStmt.setString (4, abrev);
//  			preparedStmt.setString (5, es_imputable);
//  		    preparedStmt.execute();
//  		    conect.close();
//  		} catch (SQLException e) {e.printStackTrace();}
//     }
//     
//    public static void insertCatalogoDncp(int numero_fila, int anho, int id, String nombre, double precio, int objeto_de_gasto_id){
//    	 Connection conect=ConnectionConfiguration.conectar();
// 		 String query = " insert into catalogo_dncp (numero_fila,anho,id,nombre,precio,objeto_de_gasto_id)"
// 			        + " values (?,?,?,?,?,?)";
// 		try {
// 			
// 			PreparedStatement preparedStmt;
// 			preparedStmt = conect.prepareStatement(query);
// 			preparedStmt.setInt (1, numero_fila);
// 			preparedStmt.setInt (2,anho);
// 			preparedStmt.setInt (3, id);
// 			preparedStmt.setString (4, nombre);
// 			preparedStmt.setDouble (5, precio);
// 			preparedStmt.setInt (6, objeto_de_gasto_id);
// 		    preparedStmt.execute();
// 		    conect.close();
// 		} catch (SQLException e) {e.printStackTrace();}
//    }
//    
//    public static void insertProductosMeta(int id, String nombre, int unidad_medida_id, String clase, String descripcion){
//   	 Connection conect=ConnectionConfiguration.conectar();
//		 String query = " insert into producto (id,nombre,unidad_medida_id,clase,descripcion)"
//			        + " values (?,?,?,?,?)";
//		try {
//			
//			PreparedStatement preparedStmt;
//			preparedStmt = conect.prepareStatement(query);
//			preparedStmt.setInt (1, id);
//			preparedStmt.setString (2,nombre);
//			preparedStmt.setInt (3, unidad_medida_id);
//			preparedStmt.setString (4, clase);
//			preparedStmt.setString (5, descripcion);
//		    preparedStmt.execute();
//		    conect.close();
//		} catch (SQLException e) {e.printStackTrace();}
//   }
//    public static void insertObjetoDeGasto(int numero_fila,int anho,int id,String descripcion, String abrev, String es_imputable, String nombre){
//      	 Connection conect=ConnectionConfiguration.conectar();
//   		 String query = " insert into objeto_de_gasto (numero_fila,anho,id,descripcion,abrev,es_imputable,nombre)"
//   			        + " values (?,?,?,?,?,?,?)";
//   		try {
//   			
//   			PreparedStatement preparedStmt;
//   			preparedStmt = conect.prepareStatement(query);
//   			preparedStmt.setInt (1, numero_fila);
//   			preparedStmt.setInt (2,anho);
//   			preparedStmt.setInt (3, id);
//   			preparedStmt.setString (4, descripcion);
//   			preparedStmt.setString (5, abrev);
//   			preparedStmt.setString (6, es_imputable);
//   			preparedStmt.setString (7, nombre);
//   		    preparedStmt.execute();
//   		    conect.close();
//   		} catch (SQLException e) {e.printStackTrace();}
//      }
//    public static void insertOrganismoFinanciador(int numero_fila,int anho,int id,String nombre, String descripcion){
//     	 Connection conect=ConnectionConfiguration.conectar();
//  		 String query = " insert into organismo_financiador (numero_fila,anho,id,nombre,descripcion)"
//  			        + " values (?,?,?,?,?)";
//  		try {
//  			
//  			PreparedStatement preparedStmt;
//  			preparedStmt = conect.prepareStatement(query);
//  			preparedStmt.setInt (1, numero_fila);
//  			preparedStmt.setInt (2,anho);
//  			preparedStmt.setInt (3, id);
//  			preparedStmt.setString (4, nombre);
//  			preparedStmt.setString (5, descripcion);
//  		    preparedStmt.execute();
//  		    conect.close();
//  		} catch (SQLException e) {e.printStackTrace();}
//     }
//    public static void insertFuenteFinanciamietno(int numero_fila,int anho,int id,String nombre, String descripcion){
//    	 Connection conect=ConnectionConfiguration.conectar();
// 		 String query = " insert into fuente_financiamiento (numero_fila,anho,id,nombre,descripcion)"
// 			        + " values (?,?,?,?,?)";
// 		try {
// 			
// 			PreparedStatement preparedStmt;
// 			preparedStmt = conect.prepareStatement(query);
// 			preparedStmt.setInt (1, numero_fila);
// 			preparedStmt.setInt (2,anho);
// 			preparedStmt.setInt (3, id);
// 			preparedStmt.setString (4, nombre);
// 			preparedStmt.setString (5, descripcion);
// 		    preparedStmt.execute();
// 		    conect.close();
// 		} catch (SQLException e) {e.printStackTrace();}
//    }
//    public static void insertProgramas(int numero_fila, int anho, int nivel_entidad_id, int entidad_id,int tipo_presupuesto_id, int id, String nombre,String abrev,String descripcion,String objetivo,String diagnostico,String base_legal,String resultado,int codigoDepartamento){
//   	 Connection conect=ConnectionConfiguration.conectar();
//		 String query = " insert into programa (numeroFila,anho,entidad_nivel_id,entidad_id,tipo_presupuesto_id,id,nombre,abrev,descripcion,objetivo,diagnostico,base_legal,resultado,codigoDepartamento)"
//			        + " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
//		try {
//			
//			PreparedStatement preparedStmt;
//			preparedStmt = conect.prepareStatement(query);
//			preparedStmt.setInt (1, numero_fila);
//			preparedStmt.setInt (2,anho);
//			preparedStmt.setInt (3, nivel_entidad_id);
//			preparedStmt.setInt (4, entidad_id);
//			preparedStmt.setInt (5, tipo_presupuesto_id);
//			preparedStmt.setInt (6, id);
//			preparedStmt.setString (7, nombre);
//			preparedStmt.setString (8, abrev);
//			preparedStmt.setString (9, descripcion);
//			preparedStmt.setString (10, objetivo);
//			preparedStmt.setString (11, diagnostico);
//			preparedStmt.setString (12, base_legal);
//			preparedStmt.setString (13, resultado);
//			preparedStmt.setInt (14, codigoDepartamento);
//		    preparedStmt.execute();
//		    conect.close();
//		} catch (SQLException e) {e.printStackTrace();}
//   }
//    public static void insertSubrogramas(int numero_fila,int anho,int programa_entidad_nivel_id,int programa_entidad_id,int programa_tipo_presupuesto_id,int programa_id,int id,String nombre,String abrev,String descripcion,String objetivo,int codigo_departamento){
//      	 Connection conect=ConnectionConfiguration.conectar();
//   		 String query = " insert into subprograma (anho,programa_entidad_nivel_id,programa_entidad_id,programa_tipo_presupuesto_id,programa_id,id,nombre,abrev,descripcion,objetivo,codigo_departamento)"
//   			        + " values (?,?,?,?,?,?,?,?,?,?,?)";
//   		try {
//   			
//   			PreparedStatement preparedStmt;
//   			preparedStmt = conect.prepareStatement(query);
//   			//preparedStmt.setInt (1, numero_fila);
//   			preparedStmt.setInt (1,anho);
//   			preparedStmt.setInt (2, programa_entidad_nivel_id);
//   			preparedStmt.setInt (3, programa_entidad_id);
//   			preparedStmt.setInt (4, programa_tipo_presupuesto_id);
//   			preparedStmt.setInt (5, programa_id);
//   			preparedStmt.setInt (6, id);
//   			preparedStmt.setString (7, nombre);
//   			preparedStmt.setString (8, abrev);
//   			preparedStmt.setString (9, descripcion);
//   			preparedStmt.setString (10, objetivo);
//   			preparedStmt.setInt (11, codigo_departamento);
//   		    preparedStmt.execute();
//   		    conect.close();
//   		} catch (SQLException e) {e.printStackTrace();}
//      }
//    public static void insertProyectos(int numero_fila,int anho,int subprograma_programa_entidad_nivel_id,int subprograma_programa_entidad_id,int subprograma_programa_tipo_presupuesto_id,int subprograma_programa_id,int subprograma_id,int id,String nombre,String descripcion,String abrev, int unidad_responsable_id,int funcional_id,String diagnostico,String resultado_esperado,int codigo_departamento){
//     	 Connection conect=ConnectionConfiguration.conectar();
//  		 String query = " insert into proyecto (anho,subprograma_programa_entidad_nivel_id,subprograma_programa_entidad_id,subprograma_programa_tipo_presupuesto_id,subprograma_programa_id,subprograma_id,id,nombre,descripcion,abrev,unidad_responsable_id,funcional_id,diagnostico,resultado_esperado,codigo_departamento)"
//  			        + " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
//  		try {
//  			PreparedStatement preparedStmt;
//  			preparedStmt = conect.prepareStatement(query);
//  			
//  			preparedStmt.setInt (1,anho);
//  			preparedStmt.setInt (2, subprograma_programa_entidad_nivel_id);
//  			preparedStmt.setInt (3, subprograma_programa_entidad_id);
//  			preparedStmt.setInt (4, subprograma_programa_tipo_presupuesto_id);
//  			preparedStmt.setInt (5, subprograma_programa_id);
//  			preparedStmt.setInt (6, subprograma_id);
//  			preparedStmt.setInt (7, id);
//  			preparedStmt.setString (8, nombre);
//  			preparedStmt.setString (9, descripcion);
//  			preparedStmt.setString (10, abrev);
//  			preparedStmt.setInt (11, unidad_responsable_id);
//  			preparedStmt.setInt (12, funcional_id);
//  			preparedStmt.setString (13, diagnostico);
//  			preparedStmt.setString (14, resultado_esperado);
//  			preparedStmt.setInt (15, codigo_departamento);
//  		    preparedStmt.execute();
//  		    conect.close();
//  		} catch (SQLException e) {e.printStackTrace();}
//     }
//    
//    public static void insertCatalogoProductoMeta(int id,String nombre,String descripcion, String clase ,int unidad_medida){
//   	 clase y descripcion en producto
//   	  ni presupuesto ni meta 
//   	Connection conect=ConnectionConfiguration.conectar();
//		 String query = " insert into producto (id,nombre,descripcion,clase,unidad_medida_id)"
//			        + " values (?,?,?,?,?)";
//		try {
//			PreparedStatement preparedStmt;
//			preparedStmt = conect.prepareStatement(query);
//			preparedStmt.setInt (1,id );
//			preparedStmt.setString (2,nombre);
//			preparedStmt.setString (3, descripcion);
//			preparedStmt.setString (4, clase);
//			preparedStmt.setInt (5, unidad_medida);
//			
//		    preparedStmt.execute();
//		    conect.close();
//		} catch (SQLException e) {e.printStackTrace();}
//   }
//    public static void insertProductosPresupuesto(int proyecto_subprograma_programma_entidad_nivel_id,int proyecto_subprograma_programma_entidad_id,int proyecto_subprograma_programma_tipo_presupuesto_id, int proyecto_subprograma_programma_id ,int proyecto_subprograma_id,int proyecto_id,int id,int version, int producto_unidad_medida_id){
//    	 clase y descripcion en producto
//    	  metas en propducto_presupesto_meta 
//    	Connection conect=ConnectionConfiguration.conectar();
// 		 String query = " insert into producto_presupusto (proyecto_subprograma_programa_entidad_nivel_id,proyecto_subprograma_programa_entidad_id,proyecto_subprograma_programa_tipo_presupuesto_id,proyecto_subprograma_programa_id,proyecto_subprograma_id,proyecto_id,id,version,producto_unidad_medida_id, poducto_id)"
// 			        + " values (?,?,?,?,?,?,?,?,?,?)";
// 		try {
// 			PreparedStatement preparedStmt;
// 			preparedStmt = conect.prepareStatement(query);
// 			preparedStmt.setInt (1,proyecto_subprograma_programma_entidad_nivel_id );
// 			preparedStmt.setInt (2,proyecto_subprograma_programma_entidad_id);
// 			preparedStmt.setInt (3, proyecto_subprograma_programma_tipo_presupuesto_id);
// 			preparedStmt.setInt (4, proyecto_subprograma_programma_id);
// 			preparedStmt.setInt (5, proyecto_subprograma_id);
// 			preparedStmt.setInt (6, proyecto_id);
// 			preparedStmt.setInt (7, id);
// 			preparedStmt.setInt (8, version);
// 			preparedStmt.setInt (9, producto_unidad_medida_id);
// 			preparedStmt.setInt (10, producto_unidad_medida_id);
// 			preparedStmt.setInt (10, id);
// 		    preparedStmt.execute();
// 		    conect.close();
// 		} catch (SQLException e) {e.printStackTrace();}
//    }

}
