package py.gov.stp.tools2;

import py.gov.stp.objetosV2.*;

import java.io.File;
import java.sql.Connection;

import py.gov.stp.tools.Departamento;
import py.gov.stp.tools.Distrito;
import py.gov.stp.tools2.ConnectionConfiguration;

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

import com.google.gson.Gson;
import com.google.gson.JsonObject;


public class SqlSelects {

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
		
				objeto.setId(rs.getInt("id"));
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
		String query = " select * from unidad_medida ORDER BY descripcion";

		Statement statement = null;
		ResultSet rs=null;
		List<UnidadMedida> objetos = new ArrayList<UnidadMedida>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				UnidadMedida objeto = new UnidadMedida();
		
				objeto.setId(rs.getInt("id"));
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
	
	public static List<AccionCatalogo> selectAccionCatalogo(String condition, String conditionAccCat) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from accion_catalogo"+condition+" ORDER BY nombre";

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
	
	public static List<AccionCatalogoUM> selectAccionCatalogoUM(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select accion_catalogo.*, unidad_medida.descripcion as nombreUnidadMedida from accion_catalogo inner join unidad_medida on unidad_medida.id=accion_catalogo.id_unidad_medida "+condition+" ORDER BY nombre";

		Statement statement = null;
		ResultSet rs=null;
		List<AccionCatalogoUM> objetos = new ArrayList<AccionCatalogoUM>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				AccionCatalogoUM objeto = new AccionCatalogoUM();
		
				objeto.setId(rs.getInt("id"));
				objeto.setNombre(rs.getString("nombre"));
				objeto.setDescripcion(rs.getString("descripcion"));
				objeto.setIdUnidadMedida(rs.getInt("id_unidad_medida"));
				objeto.setVersion(rs.getInt("version"));
				objeto.setBorrado(rs.getBoolean("borrado"));
				objeto.setNombreUnidadMedida(rs.getString("nombreUnidadMedida"));
				

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
	
	public static List<Cronograma> selectCronograma(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from actividad "+condition;

		Statement statement = null;
		ResultSet rs=null;
		List<Cronograma> objetos = new ArrayList<Cronograma>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				Cronograma objeto = new Cronograma();
		
				objeto.setId(rs.getInt("id"));
				objeto.setNombre(rs.getString("nombre"));
				objeto.setDescripcion(rs.getString("descripcion"));
				objeto.setProporcion(rs.getDouble("proporcion"));
				objeto.setPeso(rs.getDouble("peso"));
				objeto.setVersion(rs.getInt("version"));
				objeto.setBorrado(rs.getBoolean("borrado"));
				objeto.setAccion_id(rs.getInt("accion_id"));
				objeto.setHito_tipo_id(rs.getInt("hito_tipo_id"));
				objeto.setUnidad_medida_id(rs.getInt("unidad_medida_id"));
				objeto.setAcumulable(rs.getBoolean("acumulable"));
				objeto.setProdConcat(rs.getString("prod_concat"));

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
	
	public static List<Programacion> selectProgramacion(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from programacion "+condition;

		Statement statement = null;
		ResultSet rs=null;
		List<Programacion> objetos = new ArrayList<Programacion>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				Programacion objeto = new Programacion();
		
				objeto.setId(rs.getInt("id"));
				objeto.setCantidad(rs.getDouble("cantidad"));
				objeto.setFechaEntrega(rs.getString("fecha_entrega"));
				objeto.setActividad(rs.getInt("actividad_id"));
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
	
	public static String selectPivotCostoAvance(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		
		String query = " select array_to_json(array_agg(row_to_json(t))) as resultado from(select * from costos "+condition+")t ";

		Statement statement = null;
   		ResultSet rs=null;
   		
   		String objetos = "";

    		try {
    			statement = conect.createStatement();
    			rs=statement.executeQuery(query);
    			while(rs.next()){
    				objetos+=rs.getString("resultado");
    			}
    		}
   		catch (SQLException e) {e.printStackTrace();}
   		finally{
   			if (statement != null) {statement.close();}
   			if (conect != null) {conect.close();}
   		}
   		return objetos;
   		}

	
	public static String selectPivotBeneficiarioAvance(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		
		String query = "select array_to_json(array_agg(row_to_json(t))) as resultado from(select * from avances "+condition+")t";

		Statement statement = null;
		ResultSet rs=null;		
		String objetos = "";

		try {
 			statement = conect.createStatement();
 			rs=statement.executeQuery(query);
 			while(rs.next()){
 				objetos+=rs.getString("resultado");
 			}
 		}
		catch (SQLException e) {e.printStackTrace();}
		finally{
			if (statement != null) {statement.close();}
			if (conect != null) {conect.close();}
		}
		return objetos; 
		}
	
	
	public static String selectPivotEvidenciaAvance(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		
		String query = "select array_to_json(array_agg(row_to_json(t))) as resultado from(select * from evidencias "+condition+")t";

		Statement statement = null;
		ResultSet rs=null;		
		String objetos = "";

		try {
 			statement = conect.createStatement();
 			rs=statement.executeQuery(query);
 			while(rs.next()){
 				objetos+=rs.getString("resultado");
 			}
 		}
		catch (SQLException e) {e.printStackTrace();}
		finally{
			if (statement != null) {statement.close();}
			if (conect != null) {conect.close();}
		}
		return objetos; 
	}
	
	public static String selectPivotPlanAccionAvances(String condition) throws SQLException{
		
		Connection conect = ConnectionConfiguration.conectar();
		String query = " select array_to_json(array_agg(row_to_json(t))) as resultado from(select * from plan_accion_avances)t ";

		Statement statement = null;
   		ResultSet rs=null;
   		
   		String objetos = "";

    		try {
    			statement = conect.createStatement();
    			rs=statement.executeQuery(query);
    			while(rs.next()){
    				objetos+=rs.getString("resultado");
    			}
    		}
   		catch (SQLException e) {e.printStackTrace();}
   		finally{
   			if (statement != null) {statement.close();}
   			if (conect != null) {conect.close();}
   		}
   		return objetos;
	}		
	
	public static String selectPivotAvance(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		
		String query = "select array_to_json(array_agg(row_to_json(t))) as resultado from(select * from avances "+condition+")t";

		Statement statement = null;
		ResultSet rs=null;		
		String objetos = "";

		try {
 			statement = conect.createStatement();
 			rs=statement.executeQuery(query);
 			while(rs.next()){
 				objetos+=rs.getString("resultado");
 			}
 		}
		catch (SQLException e) {e.printStackTrace();}
		finally{
			if (statement != null) {statement.close();}
			if (conect != null) {conect.close();}
		}
		return objetos; 
		}

	
	public static List<Avance> selectAvance(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from avance "+condition;

		Statement statement = null;
		ResultSet rs=null;
		List<Avance> objetos = new ArrayList<Avance>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				Avance objeto = new Avance();
		
				objeto.setId(rs.getInt("id"));
				objeto.setDepartamentoId(rs.getInt("departamento_id"));
				objeto.setDistritoAvance(rs.getInt("distrito_avance"));
				objeto.setJustificacion(rs.getString("justificacion"));
				objeto.setCantidad(rs.getDouble("cantidad"));
				objeto.setFechaEntrega(rs.getString("fecha_entrega"));
				//objeto.setCantidadBeneficiarios(rs.getInt("cantidad_beneficiarios"));
				objeto.setActividadId(rs.getInt("actividad_id"));
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
	
	public static List<AvanceCosto> selectAvanceCosto(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from avance_costo "+condition;

		Statement statement = null;
		ResultSet rs=null;
		List<AvanceCosto> objetos = new ArrayList<AvanceCosto>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				AvanceCosto objeto = new AvanceCosto();
		
				objeto.setId(rs.getInt("id"));
				objeto.setMonto(rs.getDouble("monto"));
				objeto.setCodigoContratacion(rs.getString("codigo_contratacionl"));
				objeto.setObjetoGasto(rs.getInt("objeto_gasto"));
				objeto.setAvanceId(rs.getInt("avance_id"));	
				objeto.setBorrado(rs.getBoolean("borrado"));
				objeto.setProductoConcat(rs.getString("producto_concat"));

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
		
				objeto.setId(rs.getInt("id"));
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
	
	public static List<LineaAccion> selectLineaAccion(String condition, String conditionIdLAGA) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from linea_accion " +condition+ " " +conditionIdLAGA+ " ORDER BY nombre";

		Statement statement = null;
		ResultSet rs=null;
		List<LineaAccion> objetos = new ArrayList<LineaAccion>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				LineaAccion objeto = new LineaAccion();
		
				objeto.setId(rs.getInt("id"));
				objeto.setNombre(rs.getString("nombre"));
				objeto.setDescripcion(rs.getString("descripcion"));
				objeto.setOrden(rs.getInt("orden"));
				objeto.setPeso(rs.getInt("peso"));
				objeto.setAcumular(rs.getBoolean("acumular"));
				objeto.setTipoAccionId(rs.getInt("tipo_accion_id"));
				objeto.setEstrategiaId(rs.getInt("estrategia_id"));
				objeto.setUnidadMedidaId(rs.getInt("unidad_medida_id"));
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
	
	public static List<InsLineaAccion> selectInsLineaAccion(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from ins_linea_accion "+condition;

		Statement statement = null;
		ResultSet rs=null;
		List<InsLineaAccion> objetos = new ArrayList<InsLineaAccion>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				InsLineaAccion objeto = new InsLineaAccion();
		
				objeto.setId(rs.getInt("id"));
				objeto.setLineaAccionId(rs.getInt("linea_accion_id"));
				objeto.setInstitucionId(rs.getInt("institucion_id"));
				objeto.setPeriodoId(rs.getInt("periodo_id"));
				objeto.setMeta(rs.getDouble("meta"));
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
	
	public static List<AreasAga> selectAreasAgaCat() throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from areas_aga ";

		Statement statement = null;
		ResultSet rs=null;
		List<AreasAga> objetos = new ArrayList<AreasAga>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				AreasAga objeto = new AreasAga();
		
				objeto.setId(rs.getInt("id"));
				objeto.setNombre(rs.getString("nombre"));
				
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
	
	public static List<LaHasAreasAga> selectLaHasAreasAga(String conditionLaHasAreasAga) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from la_has_areas_aga "+conditionLaHasAreasAga;

		Statement statement = null;
		ResultSet rs=null;
		List<LaHasAreasAga> objetos = new ArrayList<LaHasAreasAga>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				LaHasAreasAga objeto = new LaHasAreasAga();
		
				objeto.setLineaAccionId(rs.getInt("linea_accion_id"));
				objeto.setAreasAgaId(rs.getInt("areas_aga_id"));
				
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
	
	public static List<LaHasPnd> selectLaHasPND() throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from la_has_pnd ";

		Statement statement = null;
		ResultSet rs=null;
		List<LaHasPnd> objetos = new ArrayList<LaHasPnd>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				LaHasPnd objeto = new LaHasPnd();
		
				objeto.setLineaAccionId(rs.getInt("linea_accion_id"));
				objeto.setPndId(rs.getInt("pnd_id"));
				objeto.setPeso(rs.getDouble("peso"));
				
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
	
	
	public static List<Pnd> selectPND() throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from pnd ";

		Statement statement = null;
		ResultSet rs=null;
		List<Pnd> objetos = new ArrayList<Pnd>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				Pnd objeto = new Pnd();
		
				objeto.setId(rs.getInt("id"));
				objeto.setNombre(rs.getString("nombre"));
				
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
	
	public static List<LaHasOds> selectLaHasODS() throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from la_has_ods ";

		Statement statement = null;
		ResultSet rs=null;
		List<LaHasOds> objetos = new ArrayList<LaHasOds>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				LaHasOds objeto = new LaHasOds();
		
				objeto.setLineaAccionId(rs.getInt("linea_accion_id"));
				objeto.setOdsId(rs.getInt("ods_id"));
				objeto.setPeso(rs.getDouble("peso"));
				
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
	
	
	public static List<Ods> selectODS() throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from ods ";

		Statement statement = null;
		ResultSet rs=null;
		List<Ods> objetos = new ArrayList<Ods>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				Ods objeto = new Ods();
		
				objeto.setId(rs.getInt("id"));
				objeto.setNombre(rs.getString("nombre"));
				
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
	
	
	public static List<LineaAccion> selectInsLineaAccionGobiernoAbierto(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = 	" SELECT 	la.nombre AS name_laccion,"+
						"	acc_cat.nombre AS name_accion,"+
						"	acc_cat.descripcion AS descripcion_accion,"+
						//falta agregar cronograma
						"	ins.nombre AS institucion "+
						//falta agregar avances
						" FROM linea_accion la"+
						" JOIN ins_linea_accion insla ON insla.linea_accion_id = la.id"+
						" JOIN accion acc ON acc.ins_linea_accion_id = insla.id"+
						" JOIN accion_catalogo acc_cat ON  acc.id_accion_catalogo = acc_cat.id"+
						" JOIN institucion ins ON insla.institucion_id = ins.id"+
						
						" Where la.id BETWEEN 235 AND 245"+
						"	AND la.borrado=false "+
						"	AND acc.id BETWEEN 7424 AND 7477"+
						"	AND acc.borrado = false "+
						"	AND acc_cat.borrado = false  "+condition;

		Statement statement = null;
		ResultSet rs=null;
		List<LineaAccion> objetos = new ArrayList<LineaAccion>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				LineaAccion objeto = new LineaAccion();
		
				objeto.setNombre(rs.getString("la.nombre"));

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
		
	
	public static String selectPivotLineasProgramadas(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select array_to_json(array_agg(row_to_json(t))) as resultado from(select * from linea_accion_programado2 "+condition+")t ";

		Statement statement = null;
   		ResultSet rs=null;
   		
   		String objetos = "";

    		try {
    			statement = conect.createStatement();
    			rs=statement.executeQuery(query);
    			while(rs.next()){
    				objetos+=rs.getString("resultado");
    			}
    		}
   		catch (SQLException e) {e.printStackTrace();}
   		finally{
   			if (statement != null) {statement.close();}
   			if (conect != null) {conect.close();}
   		}
   		return objetos;
	}
	
	public static List<LineaAccionDestinatario> selectLineaAccionDestinatarios(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from linea_accion_destinatarios_1 "+condition;

		Statement statement = null;
		ResultSet rs=null;
		List<LineaAccionDestinatario> objetos = new ArrayList<LineaAccionDestinatario>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				LineaAccionDestinatario objeto = new LineaAccionDestinatario();
		
				objeto.setSigla(rs.getString("sigla"));
				objeto.setLaId(rs.getInt("la_id"));
				objeto.setLaNombre(rs.getString("la_nombre")); 
				objeto.setLaTipoId(rs.getInt("la_tipo_id"));
				objeto.setLaEstrategiaId(rs.getInt("la_estrategia_id"));
				objeto.setLaUmId(rs.getInt("la_um_id"));
				objeto.setLaUmDescp(rs.getString("la_um_descp")); 
				objeto.setIlaId(rs.getInt("ila_id"));;
				objeto.setPeriodo(rs.getInt("periodo"));
				objeto.setIlaMeta(rs.getDouble("ila_meta"));
				objeto.setAccionPeso(rs.getInt("accion_peso"));
				objeto.setAccionFechaIni(rs.getString("accion_fecha_ini")); 
				objeto.setAccionFechaFin(rs.getString("accion_fecha_fin"));
				objeto.setM1(rs.getString("m1"));
				objeto.setM2(rs.getString("m2"));
				objeto.setM3(rs.getString("m3")); 
				objeto.setM4(rs.getString("m4")); 
				objeto.setDeptoId(rs.getInt("depto_id"));
				objeto.setDepartamento(rs.getString("depto_nombre"));
				objeto.setDistId(rs.getInt("dist_id"));
				objeto.setDistrito(rs.getString("dist_nombre"));
				objeto.setIdAccionCatalogo(rs.getString("id_accion_catalogo"));
				objeto.setAcNombre(rs.getString("ac_nombre"));
				objeto.setAcUmId(rs.getString("ac_um_id"));
				objeto.setAcUmDescp(rs.getString("ac_um_descp"));	
				objeto.setTipoDestNombre(rs.getString("tipo_dest_nombre"));
				objeto.setGrupoDestNombre(rs.getString("grupo_dest_nombre"));
				objeto.setCantDest(rs.getString("cant_dest"));
				objeto.setDescDest(rs.getString("desc_dest"));
				objeto.setEtiquetaId(rs.getInt("etiqueta_id"));
				objeto.setEtiquetaNombre(rs.getString("etiqueta_nombre"));
				
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
	
	public static List<LineaAccionPresupuesto> selectLineaAccionPresupuesto(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from linea_accion_presupuesto "+condition;

		Statement statement = null;
		ResultSet rs=null;
		List<LineaAccionPresupuesto> objetos = new ArrayList<LineaAccionPresupuesto>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				LineaAccionPresupuesto objeto = new LineaAccionPresupuesto();
				
				objeto.setInsId(rs.getInt("ins_id"));
				objeto.setInstitucion(rs.getString("sigla"));
				objeto.setLaId(rs.getInt("la_id"));
				objeto.setLineaAccion(rs.getString("la_nombre")); 
				objeto.setLaTipoId(rs.getInt("la_tipo_id"));
				objeto.setLaEstId(rs.getInt("la_estrategia_id"));
				objeto.setLaUmId(rs.getInt("la_um_id"));
				objeto.setLaUnidadMedida(rs.getString("la_um_descp")); 
				objeto.setIlaId(rs.getInt("ila_id"));;
				objeto.setPeriodo(rs.getInt("periodo"));
				objeto.setLaMeta(rs.getDouble("ila_meta"));
				objeto.setAccionId(rs.getInt("accion_id"));
				objeto.setAccionPeso(rs.getInt("accion_peso"));
				objeto.setAccionFechaIni(rs.getString("accion_fecha_ini")); 
				objeto.setAccionFechaFin(rs.getString("accion_fecha_fin"));
				objeto.setAccMeta1(rs.getDouble("m1"));
				objeto.setAccMeta2(rs.getDouble("m2"));
				objeto.setAccMeta3(rs.getDouble("m3")); 
				objeto.setAccMeta4(rs.getDouble("m4"));
				objeto.setDeptoId(rs.getInt("depto_id"));
				objeto.setDepartamento(rs.getString("depto_nombre"));
				objeto.setDistId(rs.getInt("dist_id"));
				objeto.setDistrito(rs.getString("dist_nombre")); 
				objeto.setAcatId(rs.getInt("id_accion_catalogo"));
				objeto.setAccion(rs.getString("ac_nombre"));	
				objeto.setAcatUmId(rs.getInt("ac_um_id"));
				objeto.setAccionUnidadMedida(rs.getString("ac_um_descp"));
				objeto.setProporcion(rs.getInt("proporcion"));
				objeto.setNiv(rs.getString("spr_nivel_id"));
				objeto.setEnt(rs.getString("spr_entidad_id"));
				objeto.setTp(rs.getString("spr_tiprograma_id"));
				objeto.setPro(rs.getString("spr_programa_id"));
				objeto.setSub(rs.getString("spr_subprograma_id"));
				objeto.setPry(rs.getString("srp_proyecto_id"));
				objeto.setProd(rs.getString("spr_producto_id"));
				objeto.setProdId(rs.getInt("prod_id"));
				objeto.setProdNombre(rs.getString("prod_nombre"));
				objeto.setuMedida(rs.getString("u_medida"));
				objeto.setCantFisica(rs.getString("cant_fisica"));
				objeto.setProdTipo(rs.getString("clase"));
				objeto.setProdAsigFInanciera(rs.getString("prod_asig_financiera"));
				objeto.setAccionCosto(rs.getString("accion_costo"));
				objeto.setSprAño(rs.getString("spr_anho"));
				objeto.setSprVersion(rs.getString("spr_version"));
				objeto.setProductoConcat(rs.getString("producto_concat"));
				objeto.setEtiquetaId(rs.getInt("etiqueta_id"));
				objeto.setEtiquetaNombre(rs.getString("etiqueta_nombre"));

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
	
		public static List<ResumenLineaAccion> selectLineasProgramadas(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from resumen_linea_accion "+condition;

		Statement statement = null;
		ResultSet rs=null;
		List<ResumenLineaAccion> objetos = new ArrayList<ResumenLineaAccion>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				ResumenLineaAccion objeto = new ResumenLineaAccion();
		
				objeto.setInstitucionId(rs.getInt("ins_id"));
			    objeto.setInstitucionSigla(rs.getString("sigla"));
			    objeto.setLineaAccionId(rs.getInt("la_id"));
			    objeto.setLineaAccionNombre(rs.getString("la_nombre"));
			    objeto.setLineaAccionTipoId(rs.getInt("la_tipo_id"));
			    objeto.setLineaAccionEstratagiaId(rs.getInt("la_estrategia_id"));
			    objeto.setLineaAccionUnidadMedidaId(rs.getInt("la_um_id"));
			    objeto.setLineaAccionUnidadMedidaNombre(rs.getString("la_um_descp"));
			    objeto.setInsLineaAccionId(rs.getInt("ila_id"));
			    objeto.setInsLineaAccionPeriodoId(rs.getInt("periodo"));
			    objeto.setInsLineaAccionMeta(rs.getDouble("ila_meta"));
			    objeto.setCantidadProgramada(rs.getDouble("cant_prog"));
			    objeto.setInsOrden(rs.getInt("ins_orden"));
			    objeto.setLineaAccionOrden(rs.getInt("la_orden"));
			    objeto.setCantDest(rs.getDouble("cant_dest"));
			    objeto.setCostoAc(rs.getDouble("costo_ac"));

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
	
	public static List<Institucion> selectInstitucion(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from institucion "+condition;

		Statement statement = null;
		ResultSet rs=null;
		List<Institucion> objetos = new ArrayList<Institucion>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				Institucion objeto = new Institucion();
		
				objeto.setId(rs.getInt("id"));
				objeto.setNombre(rs.getString("nombre"));
				objeto.setDescripcion(rs.getString("descripcion"));
				objeto.setSigla(rs.getString("sigla"));
				objeto.setNivelId(rs.getInt("nivel_id"));
				objeto.setEntidadId(rs.getInt("entidad_id"));
				objeto.setUnidadJerarquicaId(rs.getInt("unidad_jerarquica_id"));
				objeto.setUnidadResponsableId(rs.getInt("unidad_responsable_id"));
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
	
	public static List<InstitucionGA> selectInstitucionGA(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from accion_has_responsable "+condition;

		Statement statement = null;
		ResultSet rs=null;
		List<InstitucionGA> objetos = new ArrayList<InstitucionGA>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				InstitucionGA objeto = new InstitucionGA();
		
				objeto.setAccionId(rs.getInt("accion_id"));
				objeto.setInstitucionId(rs.getInt("institucion_id"));
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
	
	public static List<Departamento> selectDepartamento(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from departamento "+condition; // where paisid = 'PY' ORDER BY id ASC";

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
	
	public static List<Periodo> selectPeriodo(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from periodo "+condition;

		Statement statement = null;
		ResultSet rs=null;
		List<Periodo> objetos = new ArrayList<Periodo>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				Periodo objeto = new Periodo();
		
				objeto.setId(rs.getInt("id"));
				objeto.setNombre(rs.getString("nombre"));
				objeto.setDescripcion(rs.getString("descripcion"));
				objeto.setFechaInicio(rs.getDate("fecha_inicio"));
				objeto.setFechaFin(rs.getDate("fecha_fin"));
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
	
	public static List<Version> selectVersion(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectarSpr();
		String query = " select * from version "+condition + " order by nro desc ";

		Statement statement = null;
		ResultSet rs=null;
		List<Version> objetos = new ArrayList<Version>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				Version objeto = new Version();
		
				objeto.setNro(rs.getInt("nro"));
				objeto.setAnho(rs.getInt("anho"));
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
	
	public static List<HitoTipo> selectHitoTipo() throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from hito_tipo order by id";

		Statement statement = null;
		ResultSet rs=null;
		List<HitoTipo> objetos = new ArrayList<HitoTipo>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				HitoTipo objeto = new HitoTipo();
		
				objeto.setId(rs.getInt("id"));
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
	
	public static List<Hito> selectHito(String conditionHitoGA) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from hito "+conditionHitoGA;

		Statement statement = null;
		ResultSet rs=null;
		List<Hito> objetos = new ArrayList<Hito>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				Hito objeto = new Hito();
				
				objeto.setId(rs.getInt("id"));;
				objeto.setNombre(rs.getString("nombre"));
				objeto.setDescripcion(rs.getString("descripcion"));
				objeto.setCantidad(rs.getDouble("cantidad"));
				objeto.setFechaEntrega(rs.getDate("fecha_entrega"));
				objeto.setHitoTipoId(rs.getInt("hito_tipo_id"));
				objeto.setAccionId(rs.getInt("accion_id"));
				objeto.setEvidenciaId(rs.getInt("evidencia_id"));
				objeto.setUnidadMedidaId(rs.getInt("unidad_medida_id"));
				objeto.setPeso(rs.getInt("peso"));
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
	
	public static List<Accion> selectAccion(String condition, String conditionAccGA) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from accion "+condition + " " +conditionAccGA;

		Statement statement = null;
		ResultSet rs=null;
		List<Accion> objetos = new ArrayList<Accion>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				Accion objeto = new Accion();
				
				objeto.setId(rs.getInt("id"));
				objeto.setCosto(rs.getDouble("costo"));
				objeto.setPeso(rs.getDouble("peso"));
				objeto.setFechaInicio(rs.getString("fecha_inicio"));
				objeto.setFechaFin(rs.getString("fecha_fin"));
				objeto.setVersion(rs.getInt("version"));
				objeto.setBorrado(rs.getBoolean("borrado"));
				objeto.setMeta1(rs.getDouble("meta1"));
				objeto.setMeta2(rs.getDouble("meta2"));
				objeto.setMeta3(rs.getDouble("meta3"));
				objeto.setMeta4(rs.getDouble("meta4"));
				objeto.setInsLineaAccionId(rs.getInt("ins_linea_accion_id")); 
				objeto.setDepartamentoId(rs.getInt("depto_id"));
				objeto.setDistritoId(rs.getInt("dist_id"));
				objeto.setAccionCatalogoId(rs.getInt("id_accion_catalogo"));

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
	
	public static List<Actividad> selectActividad(String conditionActGA) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from actividad "+conditionActGA;

		Statement statement = null;
		ResultSet rs=null;
		List<Actividad> objetos = new ArrayList<Actividad>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				Actividad objeto = new Actividad();
				
				objeto.setId(rs.getInt("id"));
				objeto.setVersion(rs.getInt("version"));
				objeto.setAccionId(rs.getInt("accion_id"));
				objeto.setVersion(rs.getInt("version"));
				objeto.setUnidadMedidaId(rs.getInt("unidad_medida_id"));
				objeto.setHitoTipoId(rs.getInt("hito_tipo_id"));
				objeto.setNombre(rs.getString("nombre"));
				objeto.setDescripcion(rs.getString("descripcion"));
				objeto.setProporcion(rs.getDouble("porporcion"));
				objeto.setPeso(rs.getDouble("peso"));
				objeto.setBorrado(rs.getBoolean("borrado"));
				objeto.setAcumulable(rs.getBoolean("acumulable"));
				
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
	
	
	public static List<AccionPorLineaAccion> selectAccionCatalogoPorLineaAccion(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " SELECT DISTINCT id_accion_catalogo , ac.nombre  " +
				       " FROM accion AS a " +
				       " INNER JOIN accion_catalogo AS ac " +
				       " ON	ac.id = a.id_accion_catalogo" + condition;

		Statement statement = null;
		ResultSet rs=null;
		List<AccionPorLineaAccion> objetos = new ArrayList<AccionPorLineaAccion>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				AccionPorLineaAccion objeto = new AccionPorLineaAccion();
								
				objeto.setAccionCatalogoId(rs.getInt("id_accion_catalogo"));
				objeto.setNombreAccionCatalogo(rs.getString("nombre")); 				

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
	public static List<Producto> selectAllProductosSPR(String condition) throws SQLException{
   	 Connection conect=ConnectionConfiguration.conectarSpr();
		 String query = " select * from producto "+condition;
		 query += " order by nombre ASC";
		 Statement statement = null;
		 ResultSet rs=null;
		 List<Producto> productos = new ArrayList<Producto>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				Producto producto = new Producto();
				producto.setId(rs.getInt("id"));
				producto.setClase(rs.getString("clase"));
				producto.setNombre(rs.getString("nombre"));			
				producto.setUnidad_medida_id(rs.getInt("unidad_medida_id"));
				productos.add(producto);
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		finally{
			if (statement != null) {statement.close();}
			if (conect != null) {conect.close();}
		}
		return productos;
   }
	public static List<AccionHasProducto> selectAccionHasProducto(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
//		Connection conect=ConnectionConfiguration.conectarSpr();
		String query = " select * "+/* , ur.id as spr_unidad_responsable_id "+*/					    
					   " from accion_has_producto " +
					   " 	     " + condition;
//					   " join proyecto py " +
//					   " 		ON py.id = ahp.srp_proyecto_id "+
//					   " 		and py.subprograma_id = ahp.spr_subprograma_id "+   
//					   " 		and py.subprograma_programa_id = ahp.spr_programa_id "+  
//					   " 		and py.subprograma_programa_tipo_presupuesto_id = ahp.spr_tiprograma_id "+   
//					   " 		and py.subprograma_programa_entidad_id = ahp.spr_entidad_id "+
//					   " 		and py.subprograma_programa_entidad_nivel_id = ahp.spr_nivel_id "+  
//					   " JOIN unidad_responsable ur   "+
//					   " 		ON ur.id = py.unidad_responsable_id "+  
//					   " 		and ur.entidad_id = py.subprograma_programa_entidad_id "+  
//					   " 		and ur.entidad_nivel_id = py.subprograma_programa_entidad_nivel_id " + condition;

		Statement statement = null;
		ResultSet rs=null;
		List<AccionHasProducto> objetos = new ArrayList<AccionHasProducto>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				AccionHasProducto objeto = new AccionHasProducto();
		
				objeto.setId(rs.getInt("id"));
				objeto.setProporcion(rs.getInt("proporcion"));
				objeto.setAccionId(rs.getInt("accion_id"));
				objeto.setSprProductoId(rs.getInt("spr_producto_id"));				
				objeto.setVersion(rs.getInt("version"));
				objeto.setBorrado(rs.getBoolean("borrado"));
				objeto.setProyecto(rs.getInt("srp_proyecto_id"));
				objeto.setSubPrograma(rs.getInt("spr_subprograma_id"));
				objeto.setPrograma(rs.getInt("spr_programa_id"));
				objeto.setTipoPrograma(rs.getInt("spr_tiprograma_id"));				
				objeto.setEntidad(rs.getInt("spr_entidad_id"));
				objeto.setNivel(rs.getInt("spr_nivel_id"));
				objeto.setAnho(rs.getInt("spr_anho"));
				objeto.setUnidadMedida(rs.getString("u_medida"));
				objeto.setCantidadFisica(rs.getDouble("cant_fisica"));
				objeto.setClase(rs.getString("clase"));
				objeto.setCantidadFinanciera(rs.getDouble("cant_financiera"));
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

	public static List<SprProducto> selectSprProducto() throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from spr_producto";

		Statement statement = null;
		ResultSet rs=null;
		List<SprProducto> objetos = new ArrayList<SprProducto>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				SprProducto objeto = new SprProducto();
		
				objeto.setId(rs.getInt("id"));
				objeto.setNivelId(rs.getInt("nivel_id"));
				objeto.setEntidadId(rs.getInt("entidad_id"));
				objeto.setTipoId(rs.getInt("tipo_id"));
				objeto.setProgramaId(rs.getInt("progama_id"));
				objeto.setSubprogramaId(rs.getInt("subprograma_id"));
				objeto.setProyectoId(rs.getInt("proyecto_id"));
				objeto.setFuncionalId(rs.getInt("funcional_id"));
				objeto.setUnidadResponsableId(rs.getInt("unidad_responsable_id"));
				objeto.setProductoId(rs.getInt("producto_id"));	
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
	
	
	public static List<Ws> selectWs() throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " select * from ws";
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<Ws> objetos = new ArrayList<Ws>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					Ws objeto = new Ws();
					objeto.setId(rs.getInt("id"));
					objeto.setNombre(rs.getString("nombre"));
					objeto.setDescripcion(rs.getString("descripcion"));
					objeto.setUrl(rs.getString("url"));
					objeto.setMetodo(rs.getString("metodo"));
					objeto.setUsuario(rs.getString("usuario"));
					objeto.setPass(rs.getString("pass"));
					objeto.setIdClave(rs.getString("id_clave"));
					objeto.setIdValor(rs.getString("id_valor"));
					objeto.setWsTipoId(rs.getInt("ws_tipo_id"));
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
	
	
	public static List<Evidencia> selectEvidencia(String condition) throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " select * from evidencia"+condition;
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<Evidencia> objetos = new ArrayList<Evidencia>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					Evidencia objeto = new Evidencia();
					objeto.setId(rs.getInt("id"));
					objeto.setNombre(rs.getString("nombre"));
					objeto.setDescripcion(rs.getString("descripcion"));
					objeto.setUrl(rs.getString("url"));
					objeto.setWsId(rs.getInt("ws_id"));
					objeto.setVersion(rs.getInt("version"));
					objeto.setBorrado(rs.getBoolean("borrado"));
					objeto.setAvanceId(rs.getInt("avance_id"));
					objeto.setLatitud(rs.getDouble("latitud"));
					objeto.setLongitud(rs.getDouble("longitud"));					
					// se envia solo el nombre del archivo de url_documento
					objeto.setUrlDocumento(getFileName(rs.getString("url_documento")));
					
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
	public static List<Evidencia> selectEvidenciaAvanceLineaAccion(String condition) throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " SELECT linea_accion.id AS linea_accion_id, linea_accion.nombre AS linea_accion_nombre, avance.fecha_entrega as avance_fecha, "+
			 		 		"		 ins_linea_accion.periodo_id AS periodo, evidencia.* "+
			 		 		" FROM evidencia "+
					 		" JOIN avance ON avance.id = evidencia.avance_id "+
					 		" JOIN actividad ON actividad.id = avance.actividad_id"+
					 		" JOIN accion ON accion.id = actividad.accion_id"+
					 		" JOIN accion_catalogo ON accion.id_accion_catalogo = accion_catalogo.id"+
					 		" JOIN ins_linea_accion ON accion.ins_linea_accion_id = ins_linea_accion.id"+
					 		" JOIN linea_accion ON linea_accion.id = ins_linea_accion.linea_accion_id"+
					 		" WHERE NOT linea_accion.borrado "+ 
					 		" 	AND NOT ins_linea_accion.borrado  "+
					 		" 	AND NOT accion_catalogo.borrado "+ 
					 		" 	AND NOT accion.borrado  "+
					 		" 	AND NOT actividad.borrado  "+
					 		" 	AND NOT avance.borrado  "+
					 		"	AND NOT evidencia.borrado "+condition+
					 		" ORDER BY linea_accion.id, ins_linea_accion.id, evidencia.id, avance.fecha_entrega ";
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<Evidencia> objetos = new ArrayList<Evidencia>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					Evidencia objeto = new Evidencia();
					objeto.setId(rs.getInt("id"));
					objeto.setNombre(rs.getString("nombre"));
					objeto.setDescripcion(rs.getString("descripcion"));
					objeto.setLineaAccionId(rs.getInt("linea_accion_id"));
					objeto.setLineaAccionNombre(rs.getString("linea_accion_nombre"));					
					objeto.setUrl(rs.getString("url"));
					objeto.setWsId(rs.getInt("ws_id"));
					objeto.setVersion(rs.getInt("version"));
					objeto.setBorrado(rs.getBoolean("borrado"));
					objeto.setAvanceId(rs.getInt("avance_id"));
					objeto.setAvanceFecha(rs.getString("avance_fecha"));
					objeto.setLatitud(rs.getDouble("latitud"));
					objeto.setLongitud(rs.getDouble("longitud"));					
					// se envia solo el nombre del archivo de url_documento
					objeto.setUrlDocumento(getFileName(rs.getString("url_documento")));
					
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
	public static String selectTotalEvidenciasLineaAccion(String condition) throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			String query =	"	select array_to_json(array_agg(row_to_json(t))) as resultado from( "+						
					 				" SELECT linea_accion.id as linea_accion_id, avance.fecha_entrega as avance_fecha, count(*) AS total "+
					 		 		" FROM evidencia "+
							 		" JOIN avance ON avance.id = evidencia.avance_id "+
							 		" JOIN actividad ON actividad.id = avance.actividad_id"+
							 		" JOIN accion ON accion.id = actividad.accion_id"+
							 		" JOIN accion_catalogo ON accion.id_accion_catalogo = accion_catalogo.id"+
							 		" JOIN ins_linea_accion ON accion.ins_linea_accion_id = ins_linea_accion.id"+
							 		" JOIN linea_accion ON linea_accion.id = ins_linea_accion.linea_accion_id"+
							 		" WHERE NOT linea_accion.borrado "+ 
							 		" 	AND NOT ins_linea_accion.borrado  "+
							 		" 	AND NOT accion_catalogo.borrado "+ 
							 		" 	AND NOT accion.borrado  "+
							 		" 	AND NOT actividad.borrado  "+
							 		" 	AND NOT avance.borrado  "+
							 		"	AND NOT evidencia.borrado "+condition+
							 		" GROUP BY linea_accion.id, avance.fecha_entrega "+
							 		" ORDER BY linea_accion.id, avance.fecha_entrega "+
					 		"	)t ";
					 							 	
			 
			Statement statement = null;
	   		ResultSet rs=null;
	   		
	   		String objetos = "";

	    		try {
	    			statement = conect.createStatement();
	    			rs=statement.executeQuery(query);
	    			while(rs.next()){
	    				objetos+=rs.getString("resultado");
	    			}
	    		}
	   		catch (SQLException e) {e.printStackTrace();}
	   		finally{
	   			if (statement != null) {statement.close();}
	   			if (conect != null) {conect.close();}
	   		}
	   		return objetos;
	  }
	public static String getFileName (String fullPath){
		String fileName = null;
		if (fullPath != null){
			int index = fullPath.lastIndexOf(File.separator);
			fileName = fullPath.substring(index + 1);
		}
		return fileName;
	}
	public static List<TipoDocumento> selectAllTipoDocumento(String condicion) throws SQLException  {
		Connection conect = ConnectionConfiguration.conectarSpr();
		String query = " select * from tipo_documentos " + condicion;

		Statement statement = null;
		ResultSet rs = null;
		List<TipoDocumento> objetos = new ArrayList<TipoDocumento>();
		try {
			statement = conect.createStatement();
			rs = statement.executeQuery(query);
			while (rs.next()) {
				TipoDocumento objeto = new TipoDocumento();

				objeto.setId(rs.getInt("id"));
				objeto.setNombre(rs.getString("nombre"));
				objeto.setBorrado(rs.getBoolean("borrado"));
				objeto.setFechaActualizacion(rs.getString("fecha_actualizacion"));
				objeto.setFechaInsercion(rs.getString("fecha_insercion"));

				objetos.add(objeto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {
				statement.close();
			}
			if (conect != null) {
				conect.close();
			}
		}
		return objetos;
	}
	public static List<Documentos> selectAllDocumento(String condicion) throws SQLException  {
		Connection conect = ConnectionConfiguration.conectarSpr();
		String query = " select * from documentos " + condicion;

		Statement statement = null;
		ResultSet rs = null;
		List<Documentos> objetos = new ArrayList<Documentos>();
		try {
			statement = conect.createStatement();
			rs = statement.executeQuery(query);
			while (rs.next()) {
				Documentos objeto = new Documentos();

				objeto.setId(rs.getInt("id"));
				objeto.setNombre(rs.getString("nombre"));
   				objeto.setUrl(getFileName(rs.getString("url")));
				objeto.setDescripcion(rs.getString("descripcion"));
				objeto.setBorrado(rs.getBoolean("borrado"));
				objeto.setFecha(rs.getString("fecha_valides"));
				objeto.setTipoId(rs.getInt("tipos_id"));
				objeto.setUsuarioResponsable(rs.getString("usuario_responsable"));

				objetos.add(objeto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {
				statement.close();
			}
			if (conect != null) {
				conect.close();
			}
		}
		return objetos;
	}
	public static List<WsTipo> selectWsTipo() throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " select * from ws_tipo";
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<WsTipo> objetos = new ArrayList<WsTipo>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					WsTipo objeto = new WsTipo();
					objeto.setId(rs.getInt("id"));
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
	public static List<AccionHasEtiqueta> selectAccionHasEtiqueta() throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " select * from accion_has_etiqueta";
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<AccionHasEtiqueta> objetos = new ArrayList<AccionHasEtiqueta>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					AccionHasEtiqueta objeto = new AccionHasEtiqueta();
					objeto.setAccionId(rs.getInt("accion_id"));
					objeto.setEtiquetaId(rs.getInt("etiqueta_id"));
					objeto.setProporcion(rs.getInt("proporcion"));
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
	public static List<Etiqueta> selectEtiqueta() throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " select * from etiqueta";
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<Etiqueta> objetos = new ArrayList<Etiqueta>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					Etiqueta objeto = new Etiqueta();
					objeto.setId(rs.getInt("id"));
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
	public static List<HitoHasBeneficiario> selectHitoHasBeneficiario() throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " select * from hito_has_beneficiario";
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<HitoHasBeneficiario> objetos = new ArrayList<HitoHasBeneficiario>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					HitoHasBeneficiario objeto = new HitoHasBeneficiario();
					objeto.setHitoId(rs.getInt("hito_id"));
					objeto.setHitoAccionId(rs.getInt("hito_accion_id"));
					objeto.setBeneficiarioId(rs.getInt("beneficiario_id"));
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
	public static List<BeneficiarioTipo> selectBeneficiarioTipo(String condition) throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " select * from beneficiario_tipo"+condition;
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<BeneficiarioTipo> objetos = new ArrayList<BeneficiarioTipo>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					BeneficiarioTipo objeto = new BeneficiarioTipo();
					objeto.setId(rs.getInt("id"));
					objeto.setNombre(rs.getString("nombre"));
					objeto.setDescripcion(rs.getString("descripcion"));
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
	
	public static List<BeneficiarioGrupo> selectBeneficiarioGrupo(String condition) throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " select * from beneficiario_grupo"+condition;
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<BeneficiarioGrupo> objetos = new ArrayList<BeneficiarioGrupo>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					BeneficiarioGrupo objeto = new BeneficiarioGrupo();
					objeto.setId(rs.getInt("id"));
					objeto.setNombre(rs.getString("nombre"));
					objeto.setDescripcion(rs.getString("descripcion"));
					objeto.setBeneficiarioTipoId(rs.getInt("tipo_beneficiario_grupo_id"));

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
	public static List<Beneficiario> selectBeneficiario(String condition) throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " select * from beneficiario"+condition;
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<Beneficiario> objetos = new ArrayList<Beneficiario>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					Beneficiario objeto = new Beneficiario();
					objeto.setId(rs.getInt("id"));
					objeto.setNombre(rs.getString("nombre"));
					objeto.setDescripcion(rs.getString("descripcion"));
					objeto.setTipoId(rs.getInt("beneficiario_tipo_id"));
					objeto.setVersion(rs.getInt("version"));
					objeto.setBorrado(rs.getBoolean("borrado"));
					objeto.setCantidad(rs.getInt("cantidad"));
					objeto.setAvanceId(rs.getInt("avance_id"));
					objeto.setGrupoId(rs.getInt("beneficiario_grupo_id"));
					
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
	public static List<BeneficiarioDetalle> selectBeneficiarioDetalle() throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " select * from beneficiario_detalle";
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<BeneficiarioDetalle> objetos = new ArrayList<BeneficiarioDetalle>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					BeneficiarioDetalle objeto = new BeneficiarioDetalle();
					objeto.setId(rs.getInt("id"));
					objeto.setValor(rs.getString("valor"));
					objeto.setBeneficiarioDetalleClavesId(rs.getInt("beneficiario_detalle_claves_id"));
					objeto.setBeneficiarioId(rs.getInt("beneficiario_id"));
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
	public static List<BeneficiarioDetalleClave> selectBeneficiarioDetalleClave() throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " select * from beneficiario_detalle_clave";
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<BeneficiarioDetalleClave> objetos = new ArrayList<BeneficiarioDetalleClave>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					BeneficiarioDetalleClave objeto = new BeneficiarioDetalleClave();
					objeto.setId(rs.getInt("id"));
					objeto.setClave(rs.getString("clave"));
					
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
	public static List<GeoPoligono> selectGeoPoligono() throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " select * from geo_poligono";
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<GeoPoligono> objetos = new ArrayList<GeoPoligono>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					GeoPoligono objeto = new GeoPoligono();
					objeto.setId(rs.getInt("id"));
					objeto.setNombre(rs.getString("nombre"));
					objeto.setDescripcion(rs.getString("descripcion"));
					objeto.setGeo(rs.getString("geo"));
					objeto.setGeoPoligonoId(rs.getInt("geo_poligono_id"));
					objeto.setGeoPoligonoTipoId(rs.getInt("geo_poligono_tipo_id"));
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
	public static List<GeoPoligonoTipo> selectGeoPoligonoTipo() throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " select * from geo_poligono_tipo";
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<GeoPoligonoTipo> objetos = new ArrayList<GeoPoligonoTipo>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					GeoPoligonoTipo objeto = new GeoPoligonoTipo();
					objeto.setId(rs.getInt("id"));
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
	
	public static List<AccionHasGeoPoligono> selectAccionHasGeoPoligono() throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " select * from accion_has_geo_poligono";
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<AccionHasGeoPoligono> objetos = new ArrayList<AccionHasGeoPoligono>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					AccionHasGeoPoligono objeto = new AccionHasGeoPoligono();
					objeto.setAccionId(rs.getInt("accion_id"));
					objeto.setGeoPoligonoId(rs.getInt("geo_poligono_id"));
					objeto.setGeoPoligonoGeoPoligonoId(rs.getInt("geo_poligono_geo_poligono_id"));
					objeto.setProporcion(rs.getInt("proporcion"));
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
	
	public static List<AccionDestinatario> selectAccionDestinatario(String condition) throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " select * from accion_destinatario " + condition;
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<AccionDestinatario> objetos = new ArrayList<AccionDestinatario>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					AccionDestinatario objeto = new AccionDestinatario();
					objeto.setId(rs.getInt("id"));
					objeto.setCantidad(rs.getInt("cantidad"));
					objeto.setDescripcion(rs.getString("descripcion"));
					objeto.setVersion(rs.getInt("version"));
					objeto.setBorrado(rs.getBoolean("borrado"));
					objeto.setBeneficiarioTipoId(rs.getInt("beneficiario_tipo_id"));
					objeto.setAccionId(rs.getInt("accion_id"));
					objeto.setBeneficiarioGrupoId(rs.getInt("beneficiario_grupo_id"));

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
	
	public static List<ProductoObjetoGasto> selectProductoObjetoGasto(String condition) throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " select * from producto_objeto_gasto"+condition;
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<ProductoObjetoGasto> objetos = new ArrayList<ProductoObjetoGasto>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					ProductoObjetoGasto objeto = new ProductoObjetoGasto();
					objeto.setId(rs.getInt("id"));
					objeto.setAccionId(rs.getInt("accion_id"));
					objeto.setNivelId(rs.getInt("spr_nivel_id"));
					objeto.setEntidadId(rs.getInt("spr_entidad_id"));
					objeto.setTiprogramaId(rs.getInt("spr_tiprograma_id"));
					objeto.setProgramaId(rs.getInt("spr_programa_id"));
					objeto.setSubprogramaId(rs.getInt("spr_subprograma_id"));
					objeto.setProyectoId(rs.getInt("srp_proyecto_id"));
					objeto.setProductoId(rs.getInt("spr_producto_id"));
					objeto.setProductoConcat(rs.getString("producto_concat"));
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
	public static String selectAllProductosPresupuestoPND(String condition)  throws SQLException{
		Connection conect=ConnectionConfiguration.conectarSpr();			
		
		String query =  "	select array_to_json(array_agg(row_to_json(t))) as resultado from( "+
						"		select pp.id as producto_id, p.nombre as producto_nombre, "+
						" 			   concat(pp.proyecto_subprograma_programa_entidad_nivel_id, '-', pp.proyecto_subprograma_programa_entidad_id, " +
						"			   '-', pp.proyecto_subprograma_programa_tipo_presupuesto_id, '-', pp.proyecto_subprograma_programa_id, '-', " +
						" 			   pp.proyecto_subprograma_id, '-', pp.proyecto_id, '-', pp.producto_id) as producto_concat " +
						"		from producto_presupusto pp " + 
						"		join proyecto py " +
						"			ON py.id = pp.proyecto_id " +
						"			and py.subprograma_id = pp.proyecto_subprograma_id " +
						"			and py.subprograma_programa_id = pp.proyecto_subprograma_programa_id " +
						"			and py.subprograma_programa_tipo_presupuesto_id = pp.proyecto_subprograma_programa_tipo_presupuesto_id " + 
						"			and py.subprograma_programa_entidad_id = pp.proyecto_subprograma_programa_entidad_id " +
						" 			and py.subprograma_programa_entidad_nivel_id = pp.proyecto_subprograma_programa_entidad_nivel_id " +
						" 		JOIN producto p ON pp.id = p.id "+
						"		JOIN unidad_responsable ur " +
						"			ON ur.id = py.unidad_responsable_id " +
						"			and ur.entidad_id = py.subprograma_programa_entidad_id " +
						"			and ur.entidad_nivel_id = py.subprograma_programa_entidad_nivel_id " + condition +
						"		group by pp.id, p.nombre, producto_concat " +
						"		order by pp.id, p.nombre, producto_concat " +
						"	)t ";
				
				
		Statement statement = null;
   		ResultSet rs=null;
   		
   		String objetos = "";

    		try {
    			statement = conect.createStatement();
    			rs=statement.executeQuery(query);
    			while(rs.next()){
    				objetos+=rs.getString("resultado");
    			}
    		}
   		catch (SQLException e) {e.printStackTrace();}
   		finally{
   			if (statement != null) {statement.close();}
   			if (conect != null) {conect.close();}
   		}
   		return objetos;
	}
	public static List<ProgramacionPorMes> selectProgramacionPorMes(String condition) throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " SELECT actividad_id, to_char(fecha_entrega, 'YYYY-MM') as mes, sum(cantidad) as cantidad FROM programacion where not borrado "+condition+" group by  actividad_id, mes order by actividad_id, mes";
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<ProgramacionPorMes> objetos = new ArrayList<ProgramacionPorMes>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					ProgramacionPorMes objeto = new ProgramacionPorMes();
					objeto.setActividadId(rs.getInt("actividad_id"));
					objeto.setCantidad(rs.getDouble("cantidad"));
					objeto.setMes(rs.getString("mes"));
					


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
	
	public static List<Trimestre> selectTrimestre(String condition) throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " SELECT * from trimestre "+condition;
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<Trimestre> objetos = new ArrayList<Trimestre>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					Trimestre objeto = new Trimestre();
					objeto.setId(rs.getInt("id"));
					objeto.setNumero(rs.getInt("nro"));
					objeto.setAnho(rs.getString("anho"));
					objeto.setDescripcion(rs.getString("descripcion"));
					
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
	
	public static List<AvanceCualitativo> selectAvanceCualitativo(String condition) throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " SELECT * from avance_cualitativo "+condition;
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<AvanceCualitativo> objetos = new ArrayList<AvanceCualitativo>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					AvanceCualitativo objeto = new AvanceCualitativo();
					objeto.setId(rs.getInt("id"));
					objeto.setAccionCatalogoId(rs.getInt("accion_catalogo_id"));
					objeto.setInsLineaAccionId(rs.getInt("ins_linea_accion_id"));
					objeto.setTrimestreId(rs.getInt("trimestre_id"));
					objeto.setGestionesRealizadas(rs.getString("gestiones_realizadas"));
					objeto.setPrincipalesLogrosAlcanzados(rs.getString("principales_logros_alcanzados"));
					objeto.setDificultadesLeccionesAprendidas(rs.getString("dificultades_lecciones_aprendidas"));
					objeto.setObjetivosTrimestre(rs.getString("objetivos_del_siguiente_trimestre"));
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
	
	
	public static List<LineaAccionProgramacion> selectResumenLineasAccionProgramacion(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select ins_linea_accion_base.institucion_sigla,"

						+"ins_linea_accion_base.institucion_id,"
						+"ins_linea_accion_base.linea_accion_id,"
						
						+ "		ins_linea_accion_base.linea_estrategia as tipo_estrategia_id,"
						+ "		ins_linea_accion_base.linea_accion_nombre,"
						+ "		ins_linea_accion_base.linea_um_nombre,"
						+ "		ins_linea_accion_base.periodo,"
						+ "		ins_linea_accion_base.meta as meta_comprometida,"
						+ "		ins_linea_accion_base.ins_linea_accion_id,"

						+ "		ins_linea_accion_programacion_anho.cantidad_anho as programado_anho,"
						+ "		ins_linea_accion_programacion_hoy.cantidad_hoy as programado_hoy,"
						+ "		ins_linea_accion_destinatarios_corregido.cant_dest as destinatarios_estimados,"
						+ "		ins_linea_accion_costo_estimado.inversion_estimada,"
						+ "		ins_linea_accion_avance.cantidad as avance_real,"
						+ "		ins_linea_accion_destinatario_real.beneficiarios_real as destinatarios_real,"
						+ "		ins_linea_accion_costo.costo as inversion_real"
						+ " from ins_linea_accion_base"
						+ " left join ins_linea_accion_avance on "
						+ "			 ins_linea_accion_avance.ins_linea_accion_id=ins_linea_accion_base.ins_linea_accion_id"
						+ " left join ins_linea_accion_destinatarios_corregido on "
						+ "			 ins_linea_accion_destinatarios_corregido.ila_id=ins_linea_accion_base.ins_linea_accion_id"
						+ " left join ins_linea_accion_programacion_hoy on "
						+ "			 ins_linea_accion_programacion_hoy.ins_linea_accion_id =ins_linea_accion_base.ins_linea_accion_id"
						+ " left join ins_linea_accion_programacion_anho on "
						+ "			 ins_linea_accion_programacion_anho.ins_linea_accion_id = ins_linea_accion_base.ins_linea_accion_id"
						+ " left join ins_linea_accion_costo on "
						+ "			 ins_linea_accion_costo.ins_linea_accion_id=ins_linea_accion_base.ins_linea_accion_id"
						+ " left join ins_linea_accion_costo_estimado on "
						+ "			 ins_linea_accion_costo_estimado.ins_linea_accion_id=ins_linea_accion_base.ins_linea_accion_id"
						+ " left join ins_linea_accion_destinatario_real on "
						+ "			 ins_linea_accion_destinatario_real.ins_linea_accion_id=ins_linea_accion_base.ins_linea_accion_id"
						+ "  "+condition+" order by institucion_orden, la_orden ";

		Statement statement = null;
		ResultSet rs=null;
		List<LineaAccionProgramacion> objetos = new ArrayList<LineaAccionProgramacion>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				LineaAccionProgramacion objeto = new LineaAccionProgramacion();
		
			    objeto.setInstitucionSigla(rs.getString("institucion_sigla"));
			    objeto.setInstitucionId(rs.getInt("institucion_id"));
			    objeto.setLineaAccionId(rs.getInt("linea_accion_id"));
			    objeto.setInsLineaAccionId(rs.getInt("ins_linea_accion_id"));
			    
			    objeto.setLineaAccionEstratagiaId(rs.getInt("tipo_estrategia_id"));
			    objeto.setLineaAccionNombre(rs.getString("linea_accion_nombre"));
			    objeto.setLineaAccionUnidadMedidaNombre(rs.getString("linea_um_nombre"));
			    objeto.setInsLineaAccionPeriodoId(rs.getInt("periodo"));
			    objeto.setMeta(rs.getDouble("meta_comprometida"));
			    objeto.setCantidadAnho(rs.getDouble("programado_anho"));
			    objeto.setCantidadHoy(rs.getDouble("programado_hoy"));
			    objeto.setCantDest(rs.getDouble("destinatarios_estimados"));
			    objeto.setInversionEstimada(rs.getDouble("inversion_estimada"));
			    objeto.setCantidadAvance(rs.getDouble("avance_real"));
			    objeto.setCantDestinatarioReal(rs.getBigDecimal("destinatarios_real"));
			    objeto.setCostoAc(rs.getDouble("inversion_real"));
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
	
	public static List<LineaAccionProgramacion> selectResumenLineasAccionProgramacionDepto(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = "select "+
						"ins_linea_accion_base_dd.institucion_sigla,"+
						"ins_linea_accion_base_dd.institucion_id,"+
						"ins_linea_accion_base_dd.linea_tipo as tipo_estrategia_id,"+
						"ins_linea_accion_base_dd.linea_accion_nombre,"+ 
						"ins_linea_accion_base_dd.linea_um_nombre,"+
						"ins_linea_accion_base_dd.periodo,"+
						"ins_linea_accion_base_dd.meta as meta_comprometida,"+
						"ins_linea_accion_programacion_anho_dd.cantidad_anho as programado_anho,"+
						"ins_linea_accion_programacion_hoy_dd.cantidad_hoy as programado_hoy,"+
						"ins_linea_accion_destinatarios_dd.cant_dest as destinatarios_estimados,"+
						"ins_linea_accion_costo_estimado_dd.inversion_estimada,"+
						"ins_linea_accion_avance_dd.cantidad as avance_real,"+
						"ins_linea_accion_destinatario_real_dd.beneficiarios_real as destinatarios_real,"+
						"ins_linea_accion_costo_dd.costo as inversion_real,"+
						"ins_linea_accion_base_dd.depto_id,"+
						"ins_linea_accion_base_dd.la_orden,"+
						"ins_linea_accion_base_dd.institucion_orden"+
						" from ins_linea_accion_base_dd"+
						" left join ins_linea_accion_avance_dd on ins_linea_accion_avance_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_avance_dd.depto_id=ins_linea_accion_base_dd.depto_id"+
						" left join ins_linea_accion_destinatarios_dd on ins_linea_accion_destinatarios_dd.ila_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_destinatarios_dd.depto_id=ins_linea_accion_base_dd.depto_id"+
						" left join ins_linea_accion_programacion_hoy_dd on ins_linea_accion_programacion_hoy_dd.ins_linea_accion_id =ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_programacion_hoy_dd.depto_id=ins_linea_accion_base_dd.depto_id"+
						" left join ins_linea_accion_programacion_anho_dd on ins_linea_accion_programacion_anho_dd.ins_linea_accion_id = ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_programacion_anho_dd.depto_id=ins_linea_accion_base_dd.depto_id"+
						" left join ins_linea_accion_costo_dd on ins_linea_accion_costo_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_costo_dd.depto_id=ins_linea_accion_base_dd.depto_id"+
						" left join ins_linea_accion_costo_estimado_dd on ins_linea_accion_costo_estimado_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_costo_estimado_dd.depto_id=ins_linea_accion_base_dd.depto_id"+
						" left join ins_linea_accion_destinatario_real_dd on ins_linea_accion_destinatario_real_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id  and ins_linea_accion_destinatario_real_dd.depto_id=ins_linea_accion_base_dd.depto_id"+
						" where periodo = 2016"+condition+" order by institucion_orden, la_orden";

		Statement statement = null;
		ResultSet rs=null;
		List<LineaAccionProgramacion> objetos = new ArrayList<LineaAccionProgramacion>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				LineaAccionProgramacion objeto = new LineaAccionProgramacion();
		
			    objeto.setInstitucionSigla(rs.getString("institucion_sigla"));    
			    objeto.setInstitucionId(rs.getInt("institucion_id"));    

			    objeto.setLineaAccionTipoId(rs.getInt("tipo_estrategia_id"));
			    objeto.setLineaAccionNombre(rs.getString("linea_accion_nombre"));
			    objeto.setLineaAccionUnidadMedidaNombre(rs.getString("linea_um_nombre"));
			    objeto.setInsLineaAccionPeriodoId(rs.getInt("periodo"));
			    objeto.setMeta(rs.getInt("meta_comprometida"));
			    objeto.setCantidadAnho(rs.getDouble("programado_anho"));
			    objeto.setCantidadHoy(rs.getDouble("programado_hoy"));
			    objeto.setCantDest(rs.getDouble("destinatarios_estimados"));
			    objeto.setInversionEstimada(rs.getDouble("inversion_estimada"));
			    objeto.setCantidadAvance(rs.getDouble("avance_real"));
			    objeto.setCantDestinatarioReal(rs.getBigDecimal("destinatarios_real"));
			    objeto.setCostoAc(rs.getDouble("inversion_real"));
			    objeto.setDepartamentoId(rs.getInt("depto_id"));
			    objeto.setLineaAccionOrden(rs.getInt("la_orden"));
			    objeto.setInsOrden(rs.getInt("institucion_orden"));

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
	
	public static List<LineaAccionProgramacion> selectResumenLineasAccionProgramacionInstitucion(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select ins_linea_accion_base.institucion_sigla,"
						+"ins_linea_accion_base.institucion_id,"
						+"ins_linea_accion_base.linea_accion_id,"
						
						+ "		ins_linea_accion_base.linea_estrategia as tipo_estrategia_id,"
						+ "		ins_linea_accion_base.linea_accion_nombre,"
						+ "		ins_linea_accion_base.linea_um_nombre,"
						+ "		ins_linea_accion_base.periodo,"
						+ "		ins_linea_accion_base.meta as meta_comprometida,"
						+ "		ins_linea_accion_programacion_anho.cantidad_anho as programado_anho,"
						+ "		ins_linea_accion_programacion_hoy.cantidad_hoy as programado_hoy,"
						+ "		ins_linea_accion_destinatarios.cant_dest as destinatarios_estimados,"
						+ "		ins_linea_accion_costo_estimado.inversion_estimada,"
						+ "		ins_linea_accion_avance.cantidad as avance_real,"
						+ "		ins_linea_accion_destinatario_real.beneficiarios_real as destinatarios_real,"
						+ "		ins_linea_accion_costo.costo as inversion_real"
						+ " from ins_linea_accion_base"
						+ " left join ins_linea_accion_avance on "
						+ "			 ins_linea_accion_avance.ins_linea_accion_id=ins_linea_accion_base.ins_linea_accion_id"
						+ " left join ins_linea_accion_destinatarios on "
						+ "			 ins_linea_accion_destinatarios.ila_id=ins_linea_accion_base.ins_linea_accion_id"
						+ " left join ins_linea_accion_programacion_hoy on "
						+ "			 ins_linea_accion_programacion_hoy.ins_linea_accion_id =ins_linea_accion_base.ins_linea_accion_id"
						+ " left join ins_linea_accion_programacion_anho on "
						+ "			 ins_linea_accion_programacion_anho.ins_linea_accion_id = ins_linea_accion_base.ins_linea_accion_id"
						+ " left join ins_linea_accion_costo on "
						+ "			 ins_linea_accion_costo.ins_linea_accion_id=ins_linea_accion_base.ins_linea_accion_id"
						+ " left join ins_linea_accion_costo_estimado on "
						+ "			 ins_linea_accion_costo_estimado.ins_linea_accion_id=ins_linea_accion_base.ins_linea_accion_id"
						+ " left join ins_linea_accion_destinatario_real on "
						+ "			 ins_linea_accion_destinatario_real.ins_linea_accion_id=ins_linea_accion_base.ins_linea_accion_id"
						+ " where periodo=2016 "+condition +" order by institucion_orden, la_orden ";

		Statement statement = null;
		ResultSet rs=null;
		List<LineaAccionProgramacion> objetos = new ArrayList<LineaAccionProgramacion>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				LineaAccionProgramacion objeto = new LineaAccionProgramacion();
		
			    objeto.setInstitucionSigla(rs.getString("institucion_sigla"));
			    objeto.setInstitucionId(rs.getInt("institucion_id"));
			    objeto.setLineaAccionId(rs.getInt("linea_accion_id"));
			    
			    objeto.setLineaAccionEstratagiaId(rs.getInt("tipo_estrategia_id"));
			    objeto.setLineaAccionNombre(rs.getString("linea_accion_nombre"));
			    objeto.setLineaAccionUnidadMedidaNombre(rs.getString("linea_um_nombre"));
			    objeto.setInsLineaAccionPeriodoId(rs.getInt("periodo"));
			    objeto.setMeta(rs.getInt("meta_comprometida"));
			    objeto.setCantidadAnho(rs.getDouble("programado_anho"));
			    objeto.setCantidadHoy(rs.getDouble("programado_hoy"));
			    objeto.setCantDest(rs.getDouble("destinatarios_estimados"));
			    objeto.setInversionEstimada(rs.getDouble("inversion_estimada"));
			    objeto.setCantidadAvance(rs.getDouble("avance_real"));
			    objeto.setCantDestinatarioReal(rs.getBigDecimal("destinatarios_real"));
			    objeto.setCostoAc(rs.getDouble("inversion_real"));
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
	/*
	public static List<LineaAccionProgramacion> selectResumenLineasAccionProgramacionInstDptoDist(
			String condition) throws SQLException {
		Connection conect = ConnectionConfiguration.conectar();
		String query = "select "
				+ "ins_linea_accion_base_dd.institucion_sigla,"
				+ "ins_linea_accion_base_dd.institucion_id,"
				+ "ins_linea_accion_base_dd.linea_tipo as tipo_estrategia_id,"
				+ "ins_linea_accion_base_dd.linea_accion_nombre, "
				+ "ins_linea_accion_base_dd.linea_um_nombre,"
				+ "ins_linea_accion_base_dd.periodo,"
				+ "ins_linea_accion_base_dd.meta as meta_comprometida,"
				+ "ins_linea_accion_base_dd.depto_id as depto_id,"
				+ "ins_linea_accion_base_dd.dist_id as dist_id,"
				+ "ins_linea_accion_programacion_anho_dd.cantidad_anho as programado_anho,"
				+ "ins_linea_accion_programacion_hoy_dd.cantidad_hoy as programado_hoy,"
				+ "ins_linea_accion_destinatarios_dd.cant_dest as destinatarios_estimados,"
				+ "ins_linea_accion_costo_estimado_dd.inversion_estimada,"
				+ "ins_linea_accion_avance_dd.cantidad as avance_real,"
				+ "ins_linea_accion_destinatario_real_dd.beneficiarios_real as destinatarios_real,"
				+ "ins_linea_accion_costo_dd.costo as inversion_real"
				+ " from ins_linea_accion_base_dd"
				+ " left join ins_linea_accion_avance_dd on"
				+ " ins_linea_accion_avance_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_avance_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_avance_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_destinatarios_dd on"
				+ " ins_linea_accion_destinatarios_dd.ila_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_destinatarios_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_destinatarios_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_programacion_hoy_dd on "
				+ " ins_linea_accion_programacion_hoy_dd.ins_linea_accion_id =ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_programacion_hoy_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_programacion_hoy_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_programacion_anho_dd on "
				+ " ins_linea_accion_programacion_anho_dd.ins_linea_accion_id = ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_programacion_anho_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_programacion_anho_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_costo_dd on "
				+ " ins_linea_accion_costo_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_costo_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_costo_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_costo_estimado_dd on "
				+ " ins_linea_accion_costo_estimado_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_costo_estimado_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_costo_estimado_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_destinatario_real_dd on "
				+ " ins_linea_accion_destinatario_real_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_destinatario_real_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_destinatario_real_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " where periodo=2016 " + condition;
		Statement statement = null;
		ResultSet rs = null;
		List<LineaAccionProgramacion> objetos = new ArrayList<LineaAccionProgramacion>();

		try {
			statement = conect.createStatement();
			rs = statement.executeQuery(query);
			while (rs.next()) {
				LineaAccionProgramacion objeto = new LineaAccionProgramacion();

				objeto.setInstitucionSigla(rs.getString("institucion_sigla"));
				objeto.setInstitucionId(rs.getInt("institucion_id"));
				objeto.setLineaAccionEstratagiaId(rs.getInt("tipo_estrategia_id"));
				objeto.setLineaAccionNombre(rs.getString("linea_accion_nombre"));
				objeto.setLineaAccionUnidadMedidaNombre(rs.getString("linea_um_nombre"));
				objeto.setInsLineaAccionPeriodoId(rs.getInt("periodo"));
				objeto.setMeta(rs.getInt("meta_comprometida"));
				objeto.setDepartamentoId(rs.getInt("depto_id"));
				objeto.setDistritoId(rs.getInt("dist_id"));
				objeto.setCantidadAnho(rs.getDouble("programado_anho"));
				objeto.setCantidadHoy(rs.getDouble("programado_hoy"));
				objeto.setCantDest(rs.getDouble("destinatarios_estimados"));
				objeto.setInversionEstimada(rs.getDouble("inversion_estimada"));
				objeto.setCantidadAvance(rs.getDouble("avance_real"));
				objeto.setCantDestinatarioReal(rs.getBigDecimal("destinatarios_real"));
				objeto.setCostoAc(rs.getDouble("inversion_real"));
				
				
				objetos.add(objeto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {
				statement.close();
			}
			if (conect != null) {
				conect.close();
			}
		}
		return objetos;
	}*/
	
	public static List<LineaAccionProgramacion> selectResumenLineasAccionProgramacionInstDptoDist(
			String condition) throws SQLException {
		Connection conect = ConnectionConfiguration.conectar();
		String query = "select "
				+ "ins_linea_accion_base_dd.institucion_sigla,"
				+ "ins_linea_accion_base_dd.institucion_id,"
				+ "ins_linea_accion_base_dd.depto_id as depto_id,"
				+ "ins_linea_accion_base_dd.dist_id as dist_id,"
				+ "ins_linea_accion_programacion_hoy_dd.cantidad_hoy as programado_hoy,"
				+ "ins_linea_accion_avance_dd.cantidad as avance_real,"
				+ "ins_linea_accion_destinatario_real_dd.beneficiarios_real as destinatarios_real,"
				+ "ins_linea_accion_costo_dd.costo as inversion_real"
				+ " from ins_linea_accion_base_dd"
				+ " left join ins_linea_accion_avance_dd on"
				+ " ins_linea_accion_avance_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_avance_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_avance_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_programacion_hoy_dd on "
				+ " ins_linea_accion_programacion_hoy_dd.ins_linea_accion_id =ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_programacion_hoy_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_programacion_hoy_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_costo_dd on "
				+ " ins_linea_accion_costo_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_costo_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_costo_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_destinatario_real_dd on "
				+ " ins_linea_accion_destinatario_real_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_destinatario_real_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_destinatario_real_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " where periodo=2016 " + condition;
		Statement statement = null;
		ResultSet rs = null;
		List<LineaAccionProgramacion> objetos = new ArrayList<LineaAccionProgramacion>();

		try {
			statement = conect.createStatement();
			rs = statement.executeQuery(query);
			while (rs.next()) {
				LineaAccionProgramacion objeto = new LineaAccionProgramacion();

				objeto.setInstitucionSigla(rs.getString("institucion_sigla"));
				objeto.setInstitucionId(rs.getInt("institucion_id"));
				objeto.setDepartamentoId(rs.getInt("depto_id"));
				objeto.setDistritoId(rs.getInt("dist_id"));
				objeto.setCantidadHoy(rs.getDouble("programado_hoy"));
				objeto.setCantidadAvance(rs.getDouble("avance_real"));
				objeto.setCantDestinatarioReal(rs.getBigDecimal("destinatarios_real"));
				objeto.setCostoAc(rs.getDouble("inversion_real"));
				
				
				objetos.add(objeto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {
				statement.close();
			}
			if (conect != null) {
				conect.close();
			}
		}
		return objetos;
	}
	
	public static List<LineaAccionProgramacion> selectResumenLineasAccionProgramacionInstDptoDistrito(
			String condition) throws SQLException {
		Connection conect = ConnectionConfiguration.conectar();
		String query = "select "
//				+ "ins_linea_accion_base_dd.institucion_sigla,"
//				+ "ins_linea_accion_base_dd.institucion_id,"								
//				+ "ins_linea_accion_programacion_hoy_dd.cantidad_hoy as programado_hoy,"
//				+ "ins_linea_accion_avance_dd.cantidad as avance_real"				
//				+ " from ins_linea_accion_base_dd"
//				+ " left join ins_linea_accion_avance_dd on"
//				+ " 	ins_linea_accion_avance_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_avance_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_avance_dd.dist_id=ins_linea_accion_base_dd.dist_id"				
//				+ " left join ins_linea_accion_programacion_hoy_dd on "
//				+ " 	ins_linea_accion_programacion_hoy_dd.ins_linea_accion_id =ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_programacion_hoy_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_programacion_hoy_dd.dist_id=ins_linea_accion_base_dd.dist_id"
//				+ " where periodo=2016 " + condition;
		
		+ "ins_linea_accion_base.institucion_sigla,"
		+ "ins_linea_accion_base.institucion_id,"								
		+ "ins_linea_accion_programacion_hoy.cantidad_hoy as programado_hoy,"
		+ "ins_linea_accion_avance.cantidad as avance_real"				
		+ " from ins_linea_accion_base"
		+ " left join ins_linea_accion_avance on"
		+ " 	ins_linea_accion_avance.ins_linea_accion_id=ins_linea_accion_base.ins_linea_accion_id"				
		+ " left join ins_linea_accion_programacion_hoy on "
		+ " 	ins_linea_accion_programacion_hoy.ins_linea_accion_id =ins_linea_accion_base.ins_linea_accion_id"
		//+ " where periodo=2016 " + condition;
		+ " " + condition;

		Statement statement = null;
		ResultSet rs = null;
		List<LineaAccionProgramacion> objetos = new ArrayList<LineaAccionProgramacion>();

		try {
			statement = conect.createStatement();
			rs = statement.executeQuery(query);
			while (rs.next()) {
				LineaAccionProgramacion objeto = new LineaAccionProgramacion();

				objeto.setInstitucionSigla(rs.getString("institucion_sigla"));
				objeto.setInstitucionId(rs.getInt("institucion_id"));
				objeto.setCantidadHoy(rs.getDouble("programado_hoy"));
				objeto.setCantidadAvance(rs.getDouble("avance_real"));				
				
				objetos.add(objeto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {
				statement.close();
			}
			if (conect != null) {
				conect.close();
			}
		}
		return objetos;
	}
	
	public static List<LineaAccionProgramacion> selectResumenLineasAccionProgramacionInstDptoDist3(
			String condition) throws SQLException {
		Connection conect = ConnectionConfiguration.conectar();
		String query = "select "
				+ "ins_linea_accion_base_dd.institucion_sigla,"
				+ "ins_linea_accion_base_dd.institucion_id as institucion_id,"				
				+ "ins_linea_accion_programacion_hoy_dd.cantidad_hoy as programado_hoy,"
				+ "ins_linea_accion_avance_dd.cantidad as avance_real,"
				+ "ins_linea_accion_base_dd.linea_accion_nombre, "
				+ "ins_linea_accion_base_dd.linea_um_nombre,"
				+ "ins_linea_accion_base_dd.periodo,"
				+ "ins_linea_accion_base_dd.meta as meta_comprometida,"
				+ "ins_linea_accion_base_dd.depto_id as depto_id,"
				+ "ins_linea_accion_base_dd.dist_id as dist_id,"
				+ "ins_linea_accion_programacion_anho_dd.cantidad_anho as programado_anho,"				
				+ "ins_linea_accion_destinatarios_dd.cant_dest as destinatarios_estimados,"
				+ "ins_linea_accion_costo_estimado_dd.inversion_estimada,"				
				+ "ins_linea_accion_destinatario_real_dd.beneficiarios_real as destinatarios_real,"
				+ "ins_linea_accion_costo_dd.costo as inversion_real"
				+ " from ins_linea_accion_base_dd"
				+ " left join ins_linea_accion_avance_dd on"
				+ " ins_linea_accion_avance_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_avance_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_avance_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_destinatarios_dd on"
				+ " ins_linea_accion_destinatarios_dd.ila_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_destinatarios_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_destinatarios_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_programacion_hoy_dd on "
				+ " ins_linea_accion_programacion_hoy_dd.ins_linea_accion_id =ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_programacion_hoy_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_programacion_hoy_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_programacion_anho_dd on "
				+ " ins_linea_accion_programacion_anho_dd.ins_linea_accion_id = ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_programacion_anho_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_programacion_anho_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_costo_dd on "
				+ " ins_linea_accion_costo_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_costo_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_costo_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_costo_estimado_dd on "
				+ " ins_linea_accion_costo_estimado_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_costo_estimado_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_costo_estimado_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_destinatario_real_dd on "
				+ " ins_linea_accion_destinatario_real_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_destinatario_real_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_destinatario_real_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " where periodo=2016 " + condition+ " order by depto_id, dist_id";
		Statement statement = null;
		ResultSet rs = null;
		List<LineaAccionProgramacion> objetos = new ArrayList<LineaAccionProgramacion>();

		try {
			statement = conect.createStatement();
			rs = statement.executeQuery(query);
			while (rs.next()) {
				LineaAccionProgramacion objeto = new LineaAccionProgramacion();

				objeto.setInstitucionSigla(rs.getString("institucion_sigla"));
				objeto.setInstitucionId(rs.getInt("institucion_id"));
				objeto.setCantidadHoy(rs.getDouble("programado_hoy"));			
				objeto.setCantidadAvance(rs.getDouble("avance_real"));
				objeto.setLineaAccionNombre(rs.getString("linea_accion_nombre"));
				objeto.setLineaAccionUnidadMedidaNombre(rs
						.getString("linea_um_nombre"));
				objeto.setInsLineaAccionPeriodoId(rs.getInt("periodo"));
				objeto.setMeta(rs.getInt("meta_comprometida"));
				objeto.setDepartamentoId(rs.getInt("depto_id"));
				objeto.setDistritoId(rs.getInt("dist_id"));
				objeto.setCantidadAnho(rs.getDouble("programado_anho"));				
				objeto.setCantDest(rs.getDouble("destinatarios_estimados"));
				objeto.setInversionEstimada(rs.getDouble("inversion_estimada"));				
				objeto.setCantDestinatarioReal(rs
						.getBigDecimal("destinatarios_real"));
				objeto.setCostoAc(rs.getDouble("inversion_real"));
				
				
				objetos.add(objeto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {
				statement.close();
			}
			if (conect != null) {
				conect.close();
			}
		}
		return objetos;
	}
	
	public static List<LineaAccionProgramacion> selectResumenLineasAccionProgramacionInstDptoDist4(String condition) throws SQLException {
		Connection conect = ConnectionConfiguration.conectar();
		
		String query = "select "
				+ "ins_linea_accion_base_dd.institucion_sigla,"
				+ "ins_linea_accion_base_dd.institucion_id as institucion_id,"								
				+ "ins_linea_accion_programacion_hoy_dd.cantidad_hoy as programado_hoy,"
				+ "ins_linea_accion_avance_dd.cantidad as avance_real,"
				+ "ins_linea_accion_base_dd.linea_accion_nombre, "
				+ "ins_linea_accion_base_dd.linea_um_nombre,"
				+ "ins_linea_accion_base_dd.periodo,"
				+ "ins_linea_accion_base_dd.meta as meta_comprometida,"
				+ "ins_linea_accion_base_dd.depto_id as depto_id,"
				+ "ins_linea_accion_base_dd.dist_id as dist_id,"
				+ "ins_linea_accion_programacion_anho_dd.cantidad_anho as programado_anho,"				
				+ "ins_linea_accion_destinatarios_dd.cant_dest as destinatarios_estimados,"
				+ "ins_linea_accion_costo_estimado_dd.inversion_estimada,"				
				+ "ins_linea_accion_destinatario_real_dd.beneficiarios_real as destinatarios_real,"
				+ "ins_linea_accion_costo_dd.costo as inversion_real"
				+ " from ins_linea_accion_base_dd"
				+ " left join ins_linea_accion_avance_dd on"
				+ " ins_linea_accion_avance_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_avance_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_avance_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_destinatarios_dd on"
				+ " ins_linea_accion_destinatarios_dd.ila_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_destinatarios_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_destinatarios_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_programacion_hoy_dd on "
				+ " ins_linea_accion_programacion_hoy_dd.ins_linea_accion_id =ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_programacion_hoy_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_programacion_hoy_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_programacion_anho_dd on "
				+ " ins_linea_accion_programacion_anho_dd.ins_linea_accion_id = ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_programacion_anho_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_programacion_anho_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_costo_dd on "
				+ " ins_linea_accion_costo_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_costo_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_costo_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_costo_estimado_dd on "
				+ " ins_linea_accion_costo_estimado_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_costo_estimado_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_costo_estimado_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_destinatario_real_dd on "
				+ " ins_linea_accion_destinatario_real_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_destinatario_real_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_destinatario_real_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " where periodo=2016 " + condition+ " order by institucion_id, depto_id, dist_id";
		Statement statement = null;
		ResultSet rs = null;
		List<LineaAccionProgramacion> objetos = new ArrayList<LineaAccionProgramacion>();

		try {
			statement = conect.createStatement();
			rs = statement.executeQuery(query);

			while (rs.next()) {
				LineaAccionProgramacion objeto = new LineaAccionProgramacion();

				objeto.setInstitucionSigla(rs.getString("institucion_sigla"));
				objeto.setInstitucionId(rs.getInt("institucion_id"));
				objeto.setCantidadHoy(rs.getDouble("programado_hoy"));
				objeto.setCantidadAvance(rs.getDouble("avance_real"));
				objeto.setLineaAccionId(rs.getInt("linea_accion_id"));
				objeto.setLineaAccionNombre(rs.getString("linea_accion_nombre"));
				objeto.setLineaAccionUnidadMedidaNombre(rs.getString("linea_um_nombre"));
				objeto.setInsLineaAccionPeriodoId(rs.getInt("periodo"));
				objeto.setMeta(rs.getInt("meta_comprometida"));
				objeto.setDepartamentoId(rs.getInt("depto_id"));
				objeto.setDistritoId(rs.getInt("dist_id"));
				objeto.setCantidadAnho(rs.getDouble("programado_anho"));				
				objeto.setCantDest(rs.getDouble("destinatarios_estimados"));
				objeto.setInversionEstimada(rs.getDouble("inversion_estimada"));				
				objeto.setCantDestinatarioReal(rs.getBigDecimal("destinatarios_real"));
				objeto.setCostoAc(rs.getDouble("inversion_real"));
				
				
				objetos.add(objeto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {
				statement.close();
			}
			if (conect != null) {
				conect.close();
			}
		}
		return objetos;
	}
	
	
	public static String selectCiDestinatarios(String condition) throws SQLException {
		Connection conect = ConnectionConfiguration.conectar();
 		 String query = " select array_to_json(array_agg(row_to_json(t))) as resultado from( "+
 				"select * from ci_destinatarios "+condition+
   				" )t";

		Statement statement = null;
		ResultSet rs = null;
 		 String objetos = "";

		try {
			statement = conect.createStatement();
			rs = statement.executeQuery(query);
  			while(rs.next()){
  				//ObjetivoEstrategia objeto = new ObjetivoEstrategia();

  				objetos+=rs.getString("resultado");
  			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {
				statement.close();
			}
			if (conect != null) {
				conect.close();
			}
		}
		return objetos;
	}
	
	public static String selectResumenLineasAccionProgramacionDepartamentalDistrital(String condition) throws SQLException {
		Connection conect = ConnectionConfiguration.conectar();
 		 String query = " select array_to_json(array_agg(row_to_json(t))) as resultado from( "+
 				"select "
				+ "ins_linea_accion_base_dd.institucion_sigla as \"institucionSigla\","
				+ "ins_linea_accion_base_dd.institucion_id as \"institucionId\","
				+ "ins_linea_accion_base_dd.institucion_orden as \"orden\","


				+ "ins_linea_accion_programacion_hoy_dd.cantidad_hoy as \"cantidadHoy\","
				+ "ins_linea_accion_avance_dd.cantidad as \"cantidadAvance\","
				+ "ins_linea_accion_base_dd.linea_accion_id as \"lineaAccionId\", "
				+ "ins_linea_accion_base_dd.linea_accion_nombre as \"lineaAccionNombre\", "
				+ "ins_linea_accion_base_dd.linea_um_nombre as \"lineaAccionUnidadMedidaNombre\","
				+ "ins_linea_accion_base_dd.periodo as \"insLineaAccionPeriodoId\","
				+ "ins_linea_accion_base_dd.meta as meta,"
				+ "ins_linea_accion_base_dd.depto_id as \"departamentoId\","
				+ "ins_linea_accion_base_dd.dist_id as \"distritoId\","
				+ "ins_linea_accion_base_dd.ins_linea_accion_id as \"insLineaAccionId\","

				+ "ins_linea_accion_programacion_anho_dd.cantidad_anho as \"cantidadAnho\","				
				+ "ins_linea_accion_destinatarios_dd.cant_dest as \"cantDest\","
				+ "ins_linea_accion_costo_estimado_dd.inversion_estimada as \"inversionEstimada\","				
				+ "ins_linea_accion_destinatario_real_dd.beneficiarios_real as \"cantDestinatarioReal\","
				+ "ins_linea_accion_costo_dd.costo as \"costoAc\""
				+ " from ins_linea_accion_base_dd"
				+ " left join ins_linea_accion_avance_dd on"
				+ " ins_linea_accion_avance_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_avance_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_avance_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_destinatarios_dd on"
				+ " ins_linea_accion_destinatarios_dd.ila_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_destinatarios_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_destinatarios_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_programacion_hoy_dd on "
				+ " ins_linea_accion_programacion_hoy_dd.ins_linea_accion_id =ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_programacion_hoy_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_programacion_hoy_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_programacion_anho_dd on "
				+ " ins_linea_accion_programacion_anho_dd.ins_linea_accion_id = ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_programacion_anho_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_programacion_anho_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_costo_dd on "
				+ " ins_linea_accion_costo_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_costo_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_costo_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_costo_estimado_dd on "
				+ " ins_linea_accion_costo_estimado_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_costo_estimado_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_costo_estimado_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_destinatario_real_dd on "
				+ " ins_linea_accion_destinatario_real_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_destinatario_real_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_destinatario_real_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " " + condition+ " order by \"orden\", \"institucionId\", \"lineaAccionId\", \"departamentoId\", \"distritoId\""+
   				")t";

		Statement statement = null;
		ResultSet rs = null;
 		 String objetos = "";

		try {
			statement = conect.createStatement();
			rs = statement.executeQuery(query);
  			while(rs.next()){
  				//ObjetivoEstrategia objeto = new ObjetivoEstrategia();

  				objetos+=rs.getString("resultado");
  			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {
				statement.close();
			}
			if (conect != null) {
				conect.close();
			}
		}
		return objetos;
	}
	
	public static List<LineaAccionProgramacion> selectResumenLineasAccionProgramacionDptoDistInst(
			String condition) throws SQLException {
		Connection conect = ConnectionConfiguration.conectar();
		String query = "select "
				+ "ins_linea_accion_base_dd.institucion_id as institucion_id,"
				+ "ins_linea_accion_programacion_hoy_dd.cantidad_hoy as programado_hoy,"
				+ "ins_linea_accion_avance_dd.cantidad as avance_real,"
				+ "ins_linea_accion_base_dd.depto_id as depto_id,"
				+ "ins_linea_accion_base_dd.dist_id as dist_id"
				+ " from ins_linea_accion_base_dd"
				+ " left join ins_linea_accion_avance_dd on"
				+ " ins_linea_accion_avance_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_avance_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_avance_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_programacion_hoy_dd on "
				+ " ins_linea_accion_programacion_hoy_dd.ins_linea_accion_id =ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_programacion_hoy_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_programacion_hoy_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " " + condition+ " order by institucion_id, depto_id, dist_id";
		Statement statement = null;
		ResultSet rs = null;
		List<LineaAccionProgramacion> objetos = new ArrayList<LineaAccionProgramacion>();

		try {
			statement = conect.createStatement();
			rs = statement.executeQuery(query);
			while (rs.next()) {
				LineaAccionProgramacion objeto = new LineaAccionProgramacion();

				objeto.setInstitucionId(rs.getInt("institucion_id"));
				objeto.setCantidadHoy(rs.getDouble("programado_hoy"));
				objeto.setCantidadAvance(rs.getDouble("avance_real"));
				objeto.setDepartamentoId(rs.getInt("depto_id"));
				objeto.setDistritoId(rs.getInt("dist_id"));
				
				objetos.add(objeto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {
				statement.close();
			}
			if (conect != null) {
				conect.close();
			}
		}
		return objetos;
	}
	
	public static List<LineaAccionProgramacion> selectResumenLineasAccionProgramacionInstDptoDist2(String condition) throws SQLException {
		Connection conect = ConnectionConfiguration.conectar();
		String query = "select "
				+"ins_linea_accion_base_dd.ins_linea_accion_id,"
				+ "ins_linea_accion_base_dd.institucion_sigla,"
				+ "ins_linea_accion_base_dd.institucion_id,"
				+ "ins_linea_accion_base_dd.linea_tipo as tipo_estrategia_id,"
				+ "ins_linea_accion_base_dd.linea_accion_nombre, "
				+ "ins_linea_accion_base_dd.linea_um_nombre,"
				+ "ins_linea_accion_base_dd.periodo,"
				+ "ins_linea_accion_base_dd.meta as meta_comprometida,"
				+ "ins_linea_accion_base_dd.depto_id as depto_id,"
				+ "ins_linea_accion_base_dd.dist_id as dist_id,"
				+ "ins_linea_accion_programacion_anho_dd.cantidad_anho as programado_anho,"
				+ "ins_linea_accion_programacion_hoy_dd.cantidad_hoy as programado_hoy,"
				+ "ins_linea_accion_destinatarios_dd.cant_dest as destinatarios_estimados,"
				+ "ins_linea_accion_costo_estimado_dd.inversion_estimada,"
				+ "ins_linea_accion_avance_dd.cantidad as avance_real,"
				+ "ins_linea_accion_destinatario_real_dd.beneficiarios_real as destinatarios_real,"
				+ "ins_linea_accion_costo_dd.costo as inversion_real"
				+ " from ins_linea_accion_base_dd"
				+ " left join ins_linea_accion_avance_dd on"
				+ " ins_linea_accion_avance_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_avance_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_avance_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_destinatarios_dd on"
				+ " ins_linea_accion_destinatarios_dd.ila_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_destinatarios_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_destinatarios_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_programacion_hoy_dd on "
				+ " ins_linea_accion_programacion_hoy_dd.ins_linea_accion_id =ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_programacion_hoy_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_programacion_hoy_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_programacion_anho_dd on "
				+ " ins_linea_accion_programacion_anho_dd.ins_linea_accion_id = ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_programacion_anho_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_programacion_anho_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_costo_dd on "
				+ " ins_linea_accion_costo_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_costo_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_costo_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_costo_estimado_dd on "
				+ " ins_linea_accion_costo_estimado_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_costo_estimado_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_costo_estimado_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " left join ins_linea_accion_destinatario_real_dd on "
				+ " ins_linea_accion_destinatario_real_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_destinatario_real_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_destinatario_real_dd.dist_id=ins_linea_accion_base_dd.dist_id"
				+ " where periodo=2016 " + condition +" order by ins_linea_accion_base_dd.institucion_sigla, ins_linea_accion_base_dd.ins_linea_accion_id";
		Statement statement = null;
		ResultSet rs = null;
		List<LineaAccionProgramacion> objetos = new ArrayList<LineaAccionProgramacion>();

		try {
			statement = conect.createStatement();
			rs = statement.executeQuery(query);
			while (rs.next()) {
				LineaAccionProgramacion objeto = new LineaAccionProgramacion();
				
				objeto.setInsLineaAccionId(rs.getInt("ins_linea_accion_id"));
				objeto.setInstitucionSigla(rs.getString("institucion_sigla"));
				objeto.setInstitucionId(rs.getInt("institucion_id"));
				objeto.setLineaAccionEstratagiaId(rs
						.getInt("tipo_estrategia_id"));
				objeto.setLineaAccionNombre(rs.getString("linea_accion_nombre"));
				objeto.setLineaAccionUnidadMedidaNombre(rs
						.getString("linea_um_nombre"));
				objeto.setInsLineaAccionPeriodoId(rs.getInt("periodo"));
				objeto.setMeta(rs.getInt("meta_comprometida"));
				objeto.setDepartamentoId(rs.getInt("depto_id"));
				objeto.setDistritoId(rs.getInt("dist_id"));
				objeto.setCantidadAnho(rs.getDouble("programado_anho"));
				objeto.setCantidadHoy(rs.getDouble("programado_hoy"));
				objeto.setCantDest(rs.getDouble("destinatarios_estimados"));
				objeto.setInversionEstimada(rs.getDouble("inversion_estimada"));
				objeto.setCantidadAvance(rs.getDouble("avance_real"));
				objeto.setCantDestinatarioReal(rs
						.getBigDecimal("destinatarios_real"));
				objeto.setCostoAc(rs.getDouble("inversion_real"));
				
				
				objetos.add(objeto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {
				statement.close();
			}
			if (conect != null) {
				conect.close();
			}
		}
		return objetos;
	}
	public static List<Rol> selectRoles(String condition) throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectarSpr();
			 String query = " select * from role " + condition;
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<Rol> objetos = new ArrayList<Rol>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					Rol objeto = new Rol();
					objeto.setRolId(rs.getInt("id"));
					objeto.setNombre(rs.getString("nombre"));

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
	public static List<UnidadResponsable> selectUnidadResponsable(String condition) throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectarSpr();
			 String query = " select * from unidad_responsable " + condition;
			 
			 Statement statement = null;
			 ResultSet rs=null;
			 List<UnidadResponsable> objetos = new ArrayList<UnidadResponsable>();

			try {
				statement = conect.createStatement();
				rs=statement.executeQuery(query);
				while(rs.next()){
					UnidadResponsable objeto = new UnidadResponsable();
					objeto.setId(rs.getInt("id"));
					objeto.setNombre(rs.getString("nombre"));
					objeto.setDescripcion(rs.getString("descripcion"));
					objeto.setAbrev(rs.getString("abrev"));
					objeto.setNumeroFila(rs.getInt("numero_fila"));
					objeto.setEntidadId(rs.getInt("entidad_id"));
					objeto.setNivelId(rs.getInt("entidad_nivel_id"));
					objeto.setUnidadJerarquica(rs.getInt("unidad_jerarquica_id"));
					objeto.setAnho(rs.getString("anho"));
					
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
	public static List<LineaAccionProgramacion> selectResumenLineasAccionProgramacionInstitucionDepto(
			String condition) throws SQLException {
		Connection conect = ConnectionConfiguration.conectar();
//		String query = "select "
//				+ "ins_linea_accion_base_dd.institucion_sigla,"
//                + "ins_linea_accion_base_dd.institucion_id,"
//                + "ins_linea_accion_base_dd.depto_id as depto_id,"
//                + "ins_linea_accion_base_dd.dist_id as dist_id,"
//				+ "ins_linea_accion_base_dd.periodo,"
//                + "ins_linea_accion_programacion_hoy_dd.cantidad_hoy as programado_hoy,"
//                + "ins_linea_accion_avance_dd.cantidad as avance_real,"
//                + "ins_linea_accion_destinatario_real_dd.beneficiarios_real as destinatarios_real,"
//                + "ins_linea_accion_costo_dd.costo as inversion_real"
//                 + " from ins_linea_accion_base_dd"
//                 + " left join ins_linea_accion_avance_dd on"
//                 + " ins_linea_accion_avance_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_avance_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_avance_dd.dist_id=ins_linea_accion_base_dd.dist_id"
//                 + " left join ins_linea_accion_programacion_hoy_dd on "
//                 + " ins_linea_accion_programacion_hoy_dd.ins_linea_accion_id =ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_programacion_hoy_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_programacion_hoy_dd.dist_id=ins_linea_accion_base_dd.dist_id"
//                 + " left join ins_linea_accion_costo_dd on "
//                 + " ins_linea_accion_costo_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_costo_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_costo_dd.dist_id=ins_linea_accion_base_dd.dist_id"
//                 + " left join ins_linea_accion_destinatario_real_dd on "
//                 + " ins_linea_accion_destinatario_real_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_destinatario_real_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_destinatario_real_dd.dist_id=ins_linea_accion_base_dd.dist_id"
//                 + " "+ condition;

		String query = "select "
				+ "ins_linea_accion_base_dd.institucion_sigla,"
                + "ins_linea_accion_base_dd.institucion_id,"
                + "ins_linea_accion_base_dd.depto_id as depto_id,"
                + "ins_linea_accion_base_dd.dist_id as dist_id,"
				+ "ins_linea_accion_base_dd.periodo,"
                + "ins_linea_accion_programacion_hoy_dd.cantidad_hoy as programado_hoy,"
                + "ins_linea_accion_avance_dd.cantidad as avance_real,"
                + "ins_linea_accion_destinatario_real_dd.beneficiarios_real as destinatarios_real,"
                + "ins_linea_accion_costo_dd.costo as inversion_real"
                 + " from ins_linea_accion_base_dd"
                 + " left join ins_linea_accion_avance_dd on"
                 + " ins_linea_accion_avance_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_avance_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_avance_dd.dist_id=ins_linea_accion_base_dd.dist_id"
                 + " left join ins_linea_accion_programacion_hoy_dd on "
                 + " ins_linea_accion_programacion_hoy_dd.ins_linea_accion_id =ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_programacion_hoy_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_programacion_hoy_dd.dist_id=ins_linea_accion_base_dd.dist_id"
                 + " left join ins_linea_accion_costo_dd on "
                 + " ins_linea_accion_costo_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_costo_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_costo_dd.dist_id=ins_linea_accion_base_dd.dist_id"
                 + " left join ins_linea_accion_destinatario_real_dd on "
                 + " ins_linea_accion_destinatario_real_dd.ins_linea_accion_id=ins_linea_accion_base_dd.ins_linea_accion_id and ins_linea_accion_destinatario_real_dd.depto_id=ins_linea_accion_base_dd.depto_id and ins_linea_accion_destinatario_real_dd.dist_id=ins_linea_accion_base_dd.dist_id"
                 + " "+ condition;

		Statement statement = null;
		ResultSet rs = null;
		List<LineaAccionProgramacion> objetos = new ArrayList<LineaAccionProgramacion>();

		try {
			statement = conect.createStatement();
			rs = statement.executeQuery(query);
			while (rs.next()) {
				LineaAccionProgramacion objeto = new LineaAccionProgramacion();

				objeto.setInstitucionSigla(rs.getString("institucion_sigla"));
				objeto.setInstitucionId(rs.getInt("institucion_id"));
				objeto.setDepartamentoId(rs.getInt("depto_id"));
				objeto.setDistritoId(rs.getInt("dist_id"));
				objeto.setCantidadHoy(rs.getDouble("programado_hoy"));
				objeto.setCantidadAvance(rs.getDouble("avance_real"));				
				
				objetos.add(objeto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {
				statement.close();
			}
			if (conect != null) {
				conect.close();
			}
		}
		return objetos;
	}
	public static String selectUsuarioLineaAccion(String condition) throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
	   	 String query = " select array_to_json(array_agg(row_to_json(t))) as resultado from( select"
	   	 		+ " id,"
	   	 		+ "usuario_correo,"
	   	 		+ "linea_accion_id as \"lineaAccionId\","
	   	 		+ "fecha_actualizacion,"
	   	 		+ "fecha_insercion,"
	   	 		+ "usuario_responsable,"
	   	 		+ "borrado"
	   	 		+ " from usuario_linea_accion"+condition+")t";


		Statement statement = null;
		ResultSet rs = null;
 		 String objetos = "";

		try {
			statement = conect.createStatement();
			rs = statement.executeQuery(query);
  			while(rs.next()){

  				objetos+=rs.getString("resultado");
  			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {
				statement.close();
			}
			if (conect != null) {
				conect.close();
			}
		}
		return objetos;
	  }
	public static String selectInsLineaAccionHasEtiqueta(String condition) throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
	   	 String query = " select array_to_json(array_agg(row_to_json(t))) as resultado from( select * from ins_linea_accion_has_etiqueta"+condition+")t";


		Statement statement = null;
		ResultSet rs = null;
		 String objetos = "";

		try {
			statement = conect.createStatement();
			rs = statement.executeQuery(query);
 			while(rs.next()){

 				objetos+=rs.getString("resultado");
 			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {
				statement.close();
			}
			if (conect != null) {
				conect.close();
			}
		}
		return objetos;
	  }
	
	public static String selectAllTablas(String condition) throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
	   	 String query = "select array_to_json(array_agg(row_to_json(t))) as resultado from(SELECT tablename::text FROM tablero2015v3.pg_catalog.pg_tables where schemaname='public' order by tablename)t";


		Statement statement = null;
		ResultSet rs = null;
		 String objetos = "";

		try {
			statement = conect.createStatement();
			rs = statement.executeQuery(query);
			while(rs.next()){

				objetos+=rs.getString("resultado");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {
				statement.close();
			}
			if (conect != null) {
				conect.close();
			}
		}
		return objetos;
	  }
	public static String selectAllColumnas(String condition) throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
	   	 String query = "select array_to_json(array_agg(row_to_json(t))) as resultado from(SELECT CAST( column_name AS text),CAST( data_type AS text),CAST(column_default  AS text),CAST(is_nullable  AS text) FROM information_schema.columns "+condition+")t";

		Statement statement = null;
		ResultSet rs = null;
		 String objetos = "";

		try {
			statement = conect.createStatement();
			rs = statement.executeQuery(query);
			while(rs.next()){

				objetos+=rs.getString("resultado");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {
				statement.close();
			}
			if (conect != null) {
				conect.close();
			}
		}
		return objetos;
	  }
	public static String selectUsuarioEtiqueta(String condition) throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
	   	 String query = " select array_to_json(array_agg(row_to_json(t))) as resultado from( select * from usuario_etiqueta"+condition+")t";


		Statement statement = null;
		ResultSet rs = null;
		 String objetos = "";

		try {
			statement = conect.createStatement();
			rs = statement.executeQuery(query);
 			while(rs.next()){

 				objetos+=rs.getString("resultado");
 			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {
				statement.close();
			}
			if (conect != null) {
				conect.close();
			}
		}
		return objetos;
	  }
	public static String selectPresupuestoAsignado(String condition) throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
	   	 String query = " select array_to_json(array_agg(row_to_json(t))) as resultado from "
	   	 		+ "(select sum(asignacion_financiera) as AsignacionUsada from accion_has_producto ahp join accion a "
	   	 		+ " on a.id=ahp.accion_id "+condition+" and ahp.borrado=false and a.borrado=false)t";


		Statement statement = null;
		ResultSet rs = null;
		 String objetos = "";

		try {
			statement = conect.createStatement();
			rs = statement.executeQuery(query);
			while(rs.next()){

				objetos+=rs.getString("resultado");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {
				statement.close();
			}
			if (conect != null) {
				conect.close();
			}
		}
		return objetos;
	  }
	public static String selectObjetoGasto(String condition) throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
	   	 String query = " select array_to_json(array_agg(row_to_json(t))) as resultado from(select * from grupo_subgrupo_objeto_gasto "+condition+")t";


		Statement statement = null;
		ResultSet rs = null;
		 String objetos = "";

		try {
			statement = conect.createStatement();
			rs = statement.executeQuery(query);
			while(rs.next()){

				objetos+=rs.getString("resultado");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {
				statement.close();
			}
			if (conect != null) {
				conect.close();
			}
		}
		return objetos;
	  }
	public static List<LineasAccionAvances> selectMonitoreoAvance(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		
		String query =    " SELECT *,ins_linea_accion_has_etiqueta.ins_linea_accion_id,ins_linea_accion_has_etiqueta.etiqueta_id AS ins_etiqueta "+
						  " FROM avances"+
						  " JOIN ins_linea_accion_has_etiqueta ON ins_linea_accion_has_etiqueta.ins_linea_accion_id =  ila_id "+condition+
						  " ORDER BY ins_id, la_id, avance_fecha DESC, avance_cant DESC ";

		Statement statement = null;
		ResultSet rs=null;
		List<LineasAccionAvances> objetos = new ArrayList<LineasAccionAvances>();

		try {
		statement = conect.createStatement();
		rs=statement.executeQuery(query);
		while(rs.next()){
			LineasAccionAvances objeto = new LineasAccionAvances();

		objeto.setInsId(rs.getInt("ins_id"));
		objeto.setInstitucion(rs.getString("sigla"));
		objeto.setLaId(rs.getInt("la_id"));
		objeto.setLineaAccion(rs.getString("la_nombre"));
		objeto.setLaEstId(rs.getInt("la_est_id"));
		objeto.setLaTipoId(rs.getInt("la_tipo_id"));
		objeto.setLaUmId(rs.getInt("la_um_id"));
		objeto.setLaUnidadMedida(rs.getString("la_um_descp"));
		objeto.setIlaId(rs.getInt("ila_id"));
		objeto.setPeriodo(rs.getInt("periodo"));
		objeto.setLaMeta(rs.getDouble("ila_meta"));
		objeto.setAccionId(rs.getInt("accion_id"));
		objeto.setAccionPeso(rs.getInt("accion_peso"));
		objeto.setAcatId(rs.getInt("ac_id"));
		objeto.setAccion(rs.getString("ac_nombre"));
		objeto.setAcatUmId(rs.getInt("ac_um_id"));
		objeto.setAccionUnidadMedida(rs.getString("ac_um_descp"));
		objeto.setAccionFechaIni(rs.getString("accion_fecha_ini"));
		objeto.setAccionFechaFin(rs.getString("accion_fecha_fin"));
		objeto.setDeptoId(rs.getInt("depto_id"));
		objeto.setDepartamento(rs.getString("depto_nombre"));
		objeto.setDistId(rs.getInt("dist_id"));
		objeto.setDistrito(rs.getString("dist_nombre"));
		objeto.setAccMeta1(rs.getDouble("m1"));
		objeto.setAccMeta2(rs.getDouble("m2"));
		objeto.setAccMeta3(rs.getDouble("m3"));
		objeto.setAccMeta4(rs.getDouble("m4"));
		objeto.setCronoId(rs.getInt("crono_id"));
		objeto.setCronograma(rs.getString("crono_nombre"));
		objeto.setCronoDescripcion(rs.getString("crono_descp"));
		objeto.setCronoProporcion(rs.getDouble("crono_prop"));
		objeto.setCronoPeso(rs.getDouble("crono_peso"));
		objeto.setCronoUmId(rs.getInt("crono_um_id"));
		objeto.setCronoUnidadMedida(rs.getString("crono_um_descp"));
		objeto.setCronoTipoId(rs.getInt("crono_tipo_id"));
		objeto.setCronoTipoNombre(rs.getString("crono_tipo_nombre"));
		objeto.setAcumula(rs.getBoolean("acumula"));
		objeto.setAvanceId(rs.getInt("avance_id"));
		objeto.setAvanceFecha(rs.getString("avance_fecha"));
		objeto.setAvanceCantidad(rs.getInt("avance_cant"));
		objeto.setAvanceJustificacion(rs.getString("avance_just"));
		
	
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
