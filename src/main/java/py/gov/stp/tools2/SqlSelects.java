package py.gov.stp.tools2;
import py.gov.stp.objetosV2.*;

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
		String query = " select * from unidad_medida";

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
	
	public static List<LineaAccion> selectLineaAccion() throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from linea_accion";

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
				objeto.setPeso(rs.getString("peso"));
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
	
	public static List<InsLineaAccion> selectInsLineaAccion() throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from ins_linea_accion";

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
	
	public static List<Institucion> selectInstitucion() throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from institucion";

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
	
	public static List<Periodo> selectPeriodo() throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from periodo";

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
		String query = " select * from hito_tipo";

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
	
	public static List<Accion> selectAccion() throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from accion";

		Statement statement = null;
		ResultSet rs=null;
		List<Accion> objetos = new ArrayList<Accion>();

		try {
			statement = conect.createStatement();
			rs=statement.executeQuery(query);
			while(rs.next()){
				Accion objeto = new Accion();
				
				objeto.setId(rs.getInt("id"));
				objeto.setInsLineaAccionId(rs.getInt("ins_linea_accion_id")); 
				objeto.setNombre(rs.getString("nombre"));
				objeto.setDescripcion(rs.getString("descripcion"));
				objeto.setCosto(rs.getDouble("costo"));
				objeto.setPeso(rs.getInt("peso"));
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
	
	public static List<AccionHasProducto> selectAccionHasProducto() throws SQLException{
		Connection conect=ConnectionConfiguration.conectar();
		String query = " select * from accion_has_producto";

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
	
	
	public static List<Evidencia> selectEvidencia() throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " select * from evidencia";
			 
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
					objeto.setWsId(rs.getInt("ws_id"));
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
	public static List<BeneficiarioTipo> selectBeneficiarioTipo() throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " select * from beneficiario_tipo";
			 
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
	public static List<Beneficiario> selectBeneficiario() throws SQLException{
	   	 Connection conect=ConnectionConfiguration.conectar();
			 String query = " select * from beneficiario";
			 
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
					objeto.setBeneficiarioTipoId(rs.getInt("beneficiario_tipo_id"));
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

}
