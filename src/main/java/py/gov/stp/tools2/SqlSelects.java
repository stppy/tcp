package py.gov.stp.tools2;
import py.gov.stp.objetosV2.*;

import java.io.File;
import java.sql.Connection;

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
	
	public static List<AccionCatalogo> selectAccionCatalogo(String condition) throws SQLException{
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
	
	public static List<LineasAccionAvance> selectPivotAvance(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from v_linea_accion_avance "+condition;

		Statement statement = null;
		ResultSet rs=null;
		List<LineasAccionAvance> objetos = new ArrayList<LineasAccionAvance>();

		try {
		statement = conect.createStatement();
		rs=statement.executeQuery(query);
		while(rs.next()){
		LineasAccionAvance objeto = new LineasAccionAvance();

		objeto.setInstitucionId(rs.getInt("ins_id"));
		objeto.setInstitucionSigla(rs.getString("ins_sigla"));
		objeto.setInstitucionVersion(rs.getInt("ins_ver"));
		objeto.setInstitucionBorrado(rs.getBoolean("ins_borr"));
		objeto.setInsLineaAccionId(rs.getInt("ila_id"));
		objeto.setInsLineaAccionPeriodoId(rs.getInt("periodo"));
		objeto.setInsLineaAccionMeta(rs.getInt("ila_meta"));
		objeto.setInsLineaAccionVersion(rs.getInt("ila_ver"));
		objeto.setInsLineaAccionBorrado(rs.getBoolean("ila_bor"));
		objeto.setAccionId(rs.getInt("accion_id"));
		objeto.setAccionCosto(rs.getInt("accion_costo"));
		objeto.setAccionPeso(rs.getInt("accion_peso"));
		objeto.setAccionFechaIni(rs.getString("accion_fecha_ini"));
		objeto.setAccionFechaFin(rs.getString("accion_fecha_fin"));
		objeto.setAccionVersion(rs.getInt("accion_ver"));
		objeto.setAccionBorrado(rs.getBoolean("accion_bor"));
		objeto.setAccionM1(rs.getInt("m1"));
		objeto.setAccionM2(rs.getInt("m2"));
		objeto.setAccionM3(rs.getInt("m3"));
		objeto.setAccionM4(rs.getInt("m4"));
		objeto.setAccionDeptoId(rs.getInt("depto_id"));
		objeto.setAccionDistId(rs.getInt("dist_id"));
		objeto.setCronoId(rs.getInt("crono_id"));
		objeto.setCronoNombre(rs.getString("crono_nombre"));
		objeto.setCronoDescripcion(rs.getString("crono_descp"));
		objeto.setCronoProporcion(rs.getString("crono_prop"));
		objeto.setCronoPeso(rs.getInt("crono_peso"));
		objeto.setCronoVersion(rs.getInt("crono_ver"));
		objeto.setCronoBorrado(rs.getBoolean("crono_borr"));
		objeto.setCronoUnidadMedida(rs.getString("crono_um_id"));
		objeto.setCronoTipoId(rs.getInt("crono_tipo_id"));
		objeto.setCronoTipoNombre(rs.getString("crono_tipo_nombre"));
		objeto.setCronoTipoDescr(rs.getString("crono_tipo_descripcion"));
		objeto.setCronoTipoVersion(rs.getInt("crono_tipo_version"));
		objeto.setCronoTipoBorrado(rs.getBoolean("crono_tipo_borrado"));
		objeto.setAvanceJustificacion(rs.getString("avance_justificacion"));
		objeto.setAvanceCantidad(rs.getInt("avance_cantidad"));
		objeto.setAvanceFechaEntrega(rs.getString("avance_fecha_entrega"));
		objeto.setAvanceCantidadBeneficiarios(rs.getInt("avance_cantidad_beneficiarios"));
		objeto.setAvanceVersion(rs.getInt("avance_version"));
		objeto.setAvanceBorrado(rs.getBoolean("avance_borrado"));
		objeto.setAvanceCostoId(rs.getInt("avance_costo_id"));
		objeto.setAvanceCostoMonto(rs.getDouble("avance_costo_monto"));
		objeto.setAvanceCostoCodigoContratancional(rs.getString("avance_costo_codigo_contratacional"));
		objeto.setAvanceCostoGasto(rs.getString("avance_costo_objeto_gasto"));
		objeto.setAvanceCostoVersion(rs.getInt("avance_costo_version"));
		objeto.setAvanceCostoBorrado(rs.getBoolean("avance_costo_borrado"));
		
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
	
	public static List<LineaAccion> selectLineaAccion(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from linea_accion "+condition+" ORDER BY nombre";

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
	
	public static List<LineasProgramadas> selectPivotLineasProgramadas(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from linea_accion_programado "+condition;

		Statement statement = null;
		ResultSet rs=null;
		List<LineasProgramadas> objetos = new ArrayList<LineasProgramadas>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				LineasProgramadas objeto = new LineasProgramadas();
		
				objeto.setSigla(rs.getString("sigla"));
				objeto.setLa_nombre(rs.getString("la_nombre"));
				objeto.setLa_um_descp(rs.getString("la_um_descp"));
				objeto.setPeriodo(rs.getString("periodo"));
				objeto.setIla_meta(rs.getString("ila_meta"));
				objeto.setAccion_peso(rs.getString("accion_peso"));
				objeto.setAccion_fecha_ini(rs.getString("accion_fecha_ini")); 
				objeto.setAccion_fecha_fin(rs.getString("accion_fecha_fin"));
				objeto.setM1(rs.getString("m1"));
				objeto.setM2(rs.getString("m2"));
				objeto.setM3(rs.getString("m3")); 
				objeto.setM4(rs.getString("m4")); 
				objeto.setDepto_nombre(rs.getString("depto_nombre")); 
				objeto.setDist_nombre(rs.getString("dist_nombre")); 
				objeto.setAc_nombre(rs.getString("ac_nombre"));
				objeto.setAc_um_descp(rs.getString("ac_um_descp")); 
				objeto.setCrono_nombre(rs.getString("crono_nombre")); 
				objeto.setCrono_descp(rs.getString("crono_descp")); 
				objeto.setCrono_prop(rs.getString("crono_prop")); 
				objeto.setCrono_peso(rs.getString("crono_peso")); 
				objeto.setCrono_um_id(rs.getString("crono_um_id"));
				objeto.setCrono_um_nombre(rs.getString("crono_um_nombre"));
				objeto.setCrono_tipo_nombre(rs.getString("crono_tipo_nombre"));
				objeto.setCant_prog(rs.getString("cant_prog")); 
				objeto.setFecha_entrega(rs.getString("fecha_entrega"));
				objeto.setIns_id(rs.getInt("ins_id"));
				objeto.setLa_id(rs.getInt("la_id"));
				objeto.setLa_tipo_id(rs.getInt("la_tipo_id"));
				objeto.setLa_estrategia_id(rs.getInt("la_estrategia_id"));
				objeto.setLa_um_id(rs.getInt("la_um_id"));
				objeto.setIla_id(rs.getInt("ila_id"));	
				objeto.setAccion_id(rs.getInt("accion_id"));
				objeto.setDepto_id(rs.getInt("depto_id"));
				objeto.setDist_id(rs.getInt("dist_id"));
				objeto.setAc_um_id(rs.getInt("ac_um_id"));
				objeto.setCrono_id(rs.getInt("crono_id"));
				objeto.setCrono_tipo_id(rs.getInt("crono_tipo_id"));

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
	
	public static List<LineaAccionDestinatarios> selectLineaAccionDestinatarios(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from linea_accion_destinatarios "+condition;

		Statement statement = null;
		ResultSet rs=null;
		List<LineaAccionDestinatarios> objetos = new ArrayList<LineaAccionDestinatarios>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				LineaAccionDestinatarios objeto = new LineaAccionDestinatarios();
		
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
				objeto.setDeptoNombre(rs.getString("depto_nombre"));
				objeto.setDistNombre(rs.getString("dist_nombre"));
				objeto.setIdAccionCatalogo(rs.getString("id_accion_catalogo"));
				objeto.setAcNombre(rs.getString("ac_nombre"));
				objeto.setAcUmId(rs.getString("ac_um_id"));
				objeto.setAcUmDescp(rs.getString("ac_um_descp"));	
				objeto.setTipoDestNombre(rs.getString("tipo_dest_nombre"));
				objeto.setGrupoDestNombre(rs.getString("grupo_dest_nombre"));
				objeto.setCantDest(rs.getString("cant_dest"));
				objeto.setDescDest(rs.getString("desc_dest"));
				
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
				
				objeto.setSigla(rs.getString("sigla"));
				objeto.setLaId(rs.getString("la_id"));
				objeto.setLaNombre(rs.getString("la_nombre")); 
				objeto.setLaTipoId(rs.getString("la_tipo_id"));
				objeto.setLaEstrategiaId(rs.getString("la_estrategia_id"));
				objeto.setLaUmId(rs.getString("la_um_id"));
				objeto.setLaUmDescp(rs.getString("la_um_descp")); 
				objeto.setIlaId(rs.getString("ila_id"));;
				objeto.setPeriodo(rs.getString("periodo"));
				objeto.setIlaMeta(rs.getString("ila_meta"));
				objeto.setAccionPeso(rs.getString("accion_peso"));
				objeto.setAccionFechaIni(rs.getString("accion_fecha_ini")); 
				objeto.setAccionFechaFin(rs.getString("accion_fecha_fin"));
				objeto.setM1(rs.getString("m1"));
				objeto.setM2(rs.getString("m2"));
				objeto.setM3(rs.getString("m3")); 
				objeto.setM4(rs.getString("m4")); 
				objeto.setDeptoNombre(rs.getString("depto_nombre")); 
				objeto.setDistNombre(rs.getString("dist_nombre")); 
				objeto.setIdAccionCatalogo(rs.getString("id_accion_catalogo"));
				objeto.setAcNombre(rs.getString("ac_nombre"));
				objeto.setAcUmId(rs.getString("ac_um_id"));
				objeto.setAcUmDescp(rs.getString("ac_um_descp"));	
				objeto.setProporcion(rs.getInt("proporcion"));
				objeto.setSprNivelId(rs.getString("spr_nivel_id"));
				objeto.setSprEntidadId(rs.getString("spr_entidad_id"));
				objeto.setSprTipProgramaId(rs.getString("spr_tiprograma_id"));
				objeto.setSprProgramaId(rs.getString("spr_programa_id"));
				objeto.setSprSubProgramaId(rs.getString("spr_subprograma_id"));
				objeto.setSprProyectoId(rs.getString("srp_proyecto_id"));
				objeto.setSprProductoId(rs.getString("spr_producto_id"));
				objeto.setuMedida(rs.getString("u_medida"));
				objeto.setCantFisica(rs.getString("cant_fisica"));
				objeto.setClase(rs.getString("clase"));
				objeto.setProdAsigFInanciera(rs.getString("prod_asig_financiera"));
				objeto.setAccionCosto(rs.getString("accion_costo"));
				objeto.setSprAño(rs.getString("spr_anho"));
				objeto.setSprVersion(rs.getString("spr_version"));

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
			    objeto.setCant_dest(rs.getDouble("cant_dest"));
			    objeto.setCosto_ac(rs.getDouble("costo_ac"));

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
	
	public static List<Hito> selectHito() throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from hito";

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
	
	public static List<Accion> selectAccion(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from accion "+condition;

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
				objeto.setPeso(rs.getInt("peso"));
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
	
	public static List<AccionHasProducto> selectAccionHasProducto(String condition) throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from accion_has_producto"+condition;

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
	public static String getFileName (String fullPath){
		String fileName = null;
		if (fullPath != null){
			int index = fullPath.lastIndexOf(File.separator);
			fileName = fullPath.substring(index + 1);
		}
		return fileName;
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

}
