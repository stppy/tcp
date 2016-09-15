package py.gov.stp.tools2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import py.gov.stp.objetosV2.*;


public class SqlInserts {
	

	public static void insertTipoAccion(TipoAccion tipoAccion){ 
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into tipo_accion (nombre,descripcion,borrado)"
	+ " values (?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		//insert.setInt (1, tipoAccion.getId());
		insert.setString (1, tipoAccion.getNombre());
		insert.setString (2, tipoAccion.getDescripcion());
		insert.setBoolean (3, tipoAccion.isBorrado());
							
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}
	public static void insertUnidadMedida(UnidadMedida unidadMedida){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into unidad_medida (nombre,descripcion,sigla,borrado)"
	+ " values (?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		//insert.setInt (1, unidadMedida.getId());
		insert.setString (1, unidadMedida.getNombre());
		insert.setString (2, unidadMedida.getDescripcion());
		insert.setString (3, unidadMedida.getSigla());
		insert.setBoolean (4, unidadMedida.isBorrado());
		
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}
	public static void insertLineaEstrategica(LineaEstrategica lineaEstrategica){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into linea_estrategica (nombre,descripcion,orden,borrado)"
	+ " values (?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		//insert.setInt (1, lineaEstrategica.getId());
		insert.setString (1, lineaEstrategica.getNombre());
		insert.setString (2, lineaEstrategica.getDescripcion());
		insert.setInt (3, lineaEstrategica.getOrden());
		insert.setBoolean (4, lineaEstrategica.isBorrado());
		
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}
	public static void insertLineaAccion(LineaAccion lineaAccion){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into linea_accion (nombre,descripcion,orden,peso,acumular,tipo_accion_id,estrategia_id,unidad_medida_id,borrado)"
	+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		//insert.setInt (1, lineaAccion.getId());
		insert.setString (1, lineaAccion.getNombre());
		insert.setString (2, lineaAccion.getDescripcion());
		insert.setInt (3, lineaAccion.getOrden());
		insert.setInt (4, lineaAccion.getPeso());
		insert.setBoolean(5, lineaAccion.isAcumular());
		insert.setInt (6, lineaAccion.getTipoAccionId());
		insert.setInt (7, lineaAccion.getEstrategiaId());
		insert.setInt (8, lineaAccion.getUnidadMedidaId());
		insert.setBoolean (9, lineaAccion.isBorrado());		
		
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}
	public static int insertInsLineaAccion(InsLineaAccion insLineaAccion){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into ins_linea_accion (linea_accion_id, institucion_id, periodo_id, meta, version, borrado)"
	+ " values (?, ?, ?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query,PreparedStatement.RETURN_GENERATED_KEYS);
		
		//insert.setInt (1, insLineaAccion.getId());
		insert.setInt (1, insLineaAccion.getLineaAccionId());
		insert.setInt (2, insLineaAccion.getInstitucionId());
		insert.setInt (3, insLineaAccion.getPeriodoId());
		insert.setDouble (4, insLineaAccion.getMeta());
		insert.setInt(5, insLineaAccion.getVersion());
		insert.setBoolean (6, insLineaAccion.isBorrado());		
		
		insert.execute();
		
		ResultSet keyset = insert.getGeneratedKeys();
		keyset.next();
		int valor = keyset.getInt(1);
		   
		conn.close();
		return valor;
	} catch (SQLException e) {e.printStackTrace();return 0;}
		
}
	public static void insertInstitucion( Institucion institucion){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into institucion (nombre,descripcion,sigla,nivel_id,entidad_id,unidad_jerarquica_id,unidad_responsable_id,orden,borrado)"
	+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		insert.setString (1, institucion.getNombre());
		insert.setString (2, institucion.getDescripcion());
		insert.setString (3, institucion.getSigla());
		insert.setInt (4, institucion.getNivelId());
		insert.setInt (5, institucion.getEntidadId());	
		insert.setInt (6, institucion.getUnidadJerarquicaId());
		insert.setInt (7, institucion.getUnidadResponsableId());
		insert.setInt (8, institucion.getOrden());
		insert.setBoolean (9, institucion.isBorrado());
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}
	public static void insertPeriodo( Periodo periodo){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into periodo (nombre,descripcion,fecha_inicio,fecha_fin,borrado)"
	+ " values (?, ?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);

		
		
		//insert.setInt (1, insLineaAccion.getId());
		insert.setString (1, periodo.getNombre());
		insert.setString (2, periodo.getDescripcion());
		insert.setDate(3, periodo.getFechaInicio());
		insert.setDate (4, periodo.getFechaFin());
		insert.setBoolean (5, periodo.isBorrado());	

		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}
	public static void insertHitoTipo( HitoTipo hitoTipo){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into hito_tipo (nombre,descripcion,borrado)"
	+ " values (?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		//insert.setInt (1, insLineaAccion.getId());
		insert.setString (1, hitoTipo.getNombre());
		insert.setString (2, hitoTipo.getDescripcion());
		insert.setBoolean (3, hitoTipo.isBorrado());
		
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}
	public static void insertHito( Hito hito){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into hito (nombre,descripcion,cantidad,fecha_entrega,hito_tipo_id,accion_id,evidencia_id,unidad_medida_id,peso,borrado)"
	+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		//insert.setInt (1, insLineaAccion.getId());
		insert.setString (1, hito.getNombre());
		insert.setString (2, hito.getDescripcion());
		insert.setDouble (3, hito.getCantidad());
		insert.setDate (4, hito.getFechaEntrega());
		insert.setInt (5, hito.getHitoTipoId());
		insert.setInt(6, hito.getAccionId());
		insert.setInt (7, hito.getEvidenciaId());
		insert.setInt (8, hito.getUnidadMedidaId());
		insert.setInt (9, hito.getPeso());
		insert.setBoolean (10, hito.isBorrado());		
		
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}
	public static boolean insertAccion(Accion accion) throws ParseException{
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into accion (costo,peso,fecha_inicio,fecha_fin,version,borrado,meta1,meta2,meta3,meta4,ins_linea_accion_id,depto_id,dist_id,id_accion_catalogo)"
	+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		String startDate = accion.getFechaInicio();
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date = sdf1.parse(startDate);
		java.sql.Date sqlStartDate = new java.sql.Date(date.getTime());
		
		String endDate=accion.getFechaFin();
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date2 = sdf1.parse(endDate);
		java.sql.Date sqlEndDate = new java.sql.Date(date2.getTime());
		
		insert.setDouble (1, accion.getCosto());
		insert.setInt (2, accion.getPeso());
		insert.setDate (3, sqlStartDate);
		insert.setDate (4, sqlEndDate);
		insert.setInt(5, accion.getVersion());
		insert.setBoolean (6, accion.isBorrado());		
		insert.setDouble (7, accion.getMeta1());
		insert.setDouble (8, accion.getMeta2());
		insert.setDouble (9, accion.getMeta3());
		insert.setDouble (10, accion.getMeta4());
		insert.setInt (11, accion.getInsLineaAccionId());
		insert.setInt (12, accion.getDepartamentoId());
		insert.setInt (13, accion.getDistritoId());
		insert.setInt (14, accion.getAccionCatalogoId());
		
		insert.execute();
		   
		conn.close();
		return true;
	} catch (SQLException e) {e.printStackTrace(); return false;}
		
}
	public static void insertAccionHasProducto(AccionHasProducto accionHasProducto){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into accion_has_producto (proporcion,accion_id,spr_producto_id)"
	+ " values (?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		//insert.setInt (1, insLineaAccion.getId());
		insert.setInt (1, accionHasProducto.getProporcion());
		insert.setInt (2, accionHasProducto.getAccionId());
		insert.setInt (3, accionHasProducto.getSprProductoId());
		
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}
	public static void insertSprProducto(SprProducto sprProducto){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into spr_producto (nivel_id,entidad_id,tipo_id,progama_id,subprograma_id,proyecto_id,funcional_id,unidad_responsable_id,producto_id)"
	+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		//insert.setInt (1, insLineaAccion.getId());
		insert.setInt (1, sprProducto.getNivelId());
		insert.setInt (2, sprProducto.getEntidadId());
		insert.setInt (3, sprProducto.getTipoId());
		insert.setInt (4, sprProducto.getProgramaId());
		insert.setInt (5, sprProducto.getSubprogramaId());
		insert.setInt (6, sprProducto.getProyectoId());
		insert.setInt (7, sprProducto.getFuncionalId());
		insert.setInt (8, sprProducto.getUnidadResponsableId());
		insert.setInt (9, sprProducto.getProductoId());		
		
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}	
	
	public static void insertWs(Ws ws){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into ws (nombre,descripcion,url,metodo,usuario,pass,id_clave,id_valor,ws_tipo_id,borrado)"
	+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		//insert.setInt (1, ws.getId());
		insert.setString (1, ws.getNombre());
		insert.setString (2, ws.getDescripcion());
		insert.setString (3, ws.getUrl());
		insert.setString (4, ws.getMetodo());
		insert.setString (5, ws.getUsuario());
		insert.setString (6, ws.getPass());
		insert.setString (7, ws.getIdClave());
		insert.setString (8, ws.getIdValor());
		insert.setInt (9, ws.getWsTipoId());
		insert.setBoolean (10, ws.isBorrado());
							
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}
	public static void insertWsTipo(WsTipo wsTipo){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into ws_tipo (nombre,descripcion,borrado)"
	+ " values (?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		//insert.setInt (1, wsTipo.getId());
		insert.setString (1, wsTipo.getNombre());
		insert.setString (2, wsTipo.getDescripcion());
		insert.setBoolean (3, wsTipo.isBorrado());
							
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}
	public static int insertEvidencia(Evidencia evidencia){
		try {
			Connection conn=ConnectionConfiguration.conectar();
		   	
			String query = " insert into evidencia (nombre,descripcion,url,ws_id,version,avance_id, url_documento, latitud, longitud)"
		+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
			
			insert.setString (1, evidencia.getNombre());
			insert.setString (2, evidencia.getDescripcion());
			insert.setString (3, evidencia.getUrl());
			insert.setInt (4, evidencia.getWsId());
			insert.setInt (5, evidencia.getVersion());
			insert.setInt (6, evidencia.getAvanceId());
			insert.setString (7, evidencia.getUrlDocumento());
			insert.setDouble (8, evidencia.getLatitud());
			insert.setDouble (9, evidencia.getLongitud());
								
			insert.execute();
			   
			/*try (ResultSet generatedKeys = insert.getGeneratedKeys()) {
	            if (generatedKeys.next()) {
	                evidencia.setId(generatedKeys.getInt(1));
	            }
	            else {
	            	return -1;
	            }
	        }*/
			
			conn.close();
			return 1;
		} catch (SQLException e) {e.printStackTrace(); return -1;}
			
	}
	public static boolean insertEvidenciaHasDocumento(EvidenciaHasDocumento evidenciaHasDocumento){
		
		try {
			Connection conn=ConnectionConfiguration.conectar();		  		
			
			String query = " insert into evidencia_has_documento (evidencia_id, documento_id)"
						 	+ " values (?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			
			insert.setInt (1, evidenciaHasDocumento.getEvidenciaId());
			insert.setInt (2, evidenciaHasDocumento.getDocumentoId());				
								
			insert.execute();
			   
			conn.close();
			return true;
		} catch (SQLException e) {e.printStackTrace(); return false;}
		
	}	
	public static boolean insertDocumento(Documento documento){
		try {
			Connection conn=ConnectionConfiguration.conectar();		  		
			
			
			String query = " insert into documento (nombre, descripcion, url)"
						    + " values (?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);	
			
			insert.setString (1, documento.getNombre());
			insert.setString (2, documento.getDescripcion());
			insert.setString (3, documento.getUrl());			
								
			insert.execute();			
			   
			conn.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace(); 
			return false;
		}
			
	}
	public static void insertAccionHasEtiqueta(AccionHasEtiqueta accionHasEtiqueta){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into accion_has_etiqueta (accion_id, etiqueta_id, proporcion,borrado)"
	+ " values (?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		insert.setInt (1, accionHasEtiqueta.getAccionId());
		insert.setInt (2, accionHasEtiqueta.getEtiquetaId());
		insert.setInt (3, accionHasEtiqueta.getProporcion());
		insert.setBoolean (4, accionHasEtiqueta.isBorrado());
							
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}
	public static void insertEtiqueta(Etiqueta etiqueta){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into etiqueta (nombre,descripcion,borrado)"
	+ " values (?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		//insert.setInt (1, etiqueta.getId());
		insert.setString (1, etiqueta.getNombre());
		insert.setString (2, etiqueta.getDescripcion());
		insert.setBoolean (3, etiqueta.isBorrado());
							
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}
	public static void insertHitoHasBeneficiario(HitoHasBeneficiario hitoHasBeneficiario){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into hito_has_beneficiario (hito_id,hito_accion_id,beneficiario_id,borrado)"
	+ " values (?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		insert.setInt (1, hitoHasBeneficiario.getHitoId());
		insert.setInt (2, hitoHasBeneficiario.getHitoAccionId());
		insert.setInt (3, hitoHasBeneficiario.getBeneficiarioId());
		insert.setBoolean (4, hitoHasBeneficiario.isBorrado());
							
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}
	public static boolean insertBeneficiario(Beneficiario beneficiario){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into beneficiario (nombre,descripcion,beneficiario_tipo_id,version,cantidad,avance_id,beneficiario_grupo_id)"
	+ " values (?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		insert.setString (1, beneficiario.getNombre());
		insert.setString (2, beneficiario.getDescripcion());
		insert.setInt (3, beneficiario.getTipoId());
		insert.setInt (4, beneficiario.getVersion());
		insert.setInt (5, beneficiario.getCantidad());
		insert.setInt (6, beneficiario.getAvanceId());
		insert.setInt (7, beneficiario.getGrupoId());
							
		insert.execute();
		   
		conn.close();
		return true;
	} catch (SQLException e) {e.printStackTrace(); return false;}
		
}
	public static void insertBeneficiarioTipo(BeneficiarioTipo beneficiarioTipo){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into beneficiario_tipo (nombre,descripcion,borrado)"
	+ " values (?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		//insert.setInt (1, beneficiarioTipo.getId());
		insert.setString (1, beneficiarioTipo.getNombre());
		insert.setString (2, beneficiarioTipo.getDescripcion());
		insert.setBoolean (3, beneficiarioTipo.isBorrado());
							
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}
	public static void insertBeneficiarioDetalle(BeneficiarioDetalle beneficiarioDetalle){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into beneficiario_detalle (valor,beneficiario_detalle_claves_id,beneficiario_id)" 
	+ " values (?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		//insert.setInt (1, beneficiarioDetalle.getId());
		insert.setString (1, beneficiarioDetalle.getValor());
		insert.setInt (2, beneficiarioDetalle.getBeneficiarioDetalleClavesId());
		insert.setInt (3, beneficiarioDetalle.getBeneficiarioId());
							
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}	
	public static void insertBeneficiarioDetalleClave(BeneficiarioDetalleClave beneficiarioDetalleClave){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into beneficiario_detalle_clave (clave)"
	+ " values (?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		//insert.setInt (1, beneficiarioDetalleClave.getId());
		insert.setString (1, beneficiarioDetalleClave.getClave());
							
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}
	public static void insertGeoPoligono(GeoPoligono geoPoligono){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into geo_poligono (nombre,descripcion,geo,geo_poligono_id,geo_poligono_tipo_id,borrado)"
	+ " values (?, ?, ?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		//insert.setInt (1, geoPoligono.getId());
		insert.setString (1, geoPoligono.getNombre());
		insert.setString (2, geoPoligono.getDescripcion());
		insert.setString (3, geoPoligono.getGeo());
		insert.setInt (4, geoPoligono.getGeoPoligonoId());
		insert.setInt (5, geoPoligono.getGeoPoligonoTipoId());
		insert.setBoolean (6, geoPoligono.isBorrado());		
		
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}
	public static void insertAccionHasGeoPoligono(AccionHasGeoPoligono accionHAsGeoPoligono){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into accion_has_geo_poligono (accion_id,geo_poligono_id,geo_poligono_geo_poligono_id,proporcion,borrado)"
	+ " values (?, ?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		insert.setInt (1, accionHAsGeoPoligono.getAccionId());
		insert.setInt (2, accionHAsGeoPoligono.getGeoPoligonoId());
		insert.setInt (3, accionHAsGeoPoligono.getGeoPoligonoGeoPoligonoId());
		insert.setInt (4, accionHAsGeoPoligono.getProporcion());
		insert.setBoolean (5, accionHAsGeoPoligono.isBorrado());	
		
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}
	public static void insertGeoPoligonoTipo(GeoPoligonoTipo geoPoligonoTipo){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into geo_poligono_tipo (nombre,descripcion,borrado)"
	+ " values (?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		//insert.setInt (1, geoPoligonoTipo.getId());
		insert.setString (1, geoPoligonoTipo.getNombre());
		insert.setString (2, geoPoligonoTipo.getDescripcion());
		insert.setBoolean (3, geoPoligonoTipo.isBorrado());	
		
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}	
	public static void insertHitoPrueba(HitoPrueba hito){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into hitoPrueba (accion,nombreHito,tipoHito,unidadMedida,cantidadPrevista,cantidadReal)"
	+ " values (?, ?, ?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		insert.setString (1, hito.getAccion());
		insert.setString (2, hito.getNombreHito());
		insert.setString (3, hito.getTipoHito());	
		insert.setString (4, hito.getUnidadMedida());	
		insert.setInt (5, hito.getCantidadPrevista());	
		insert.setInt (6, hito.getCantidadReal());	
		
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}
	public static void insertAccionCatalogo(AccionCatalogo accionCatalogo){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into hitoPrueba (id,nombre,descdripcion,version,borrado,id_unidad_medida)"
	+ " values (?, ?, ?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		insert.setInt (1, accionCatalogo.getId());
		insert.setString (2, accionCatalogo.getNombre());
		insert.setString (3, accionCatalogo.getDescripcion());
		insert.setInt (4, accionCatalogo.getIdUnidadMedida());
		insert.setInt (5, accionCatalogo.getVersion());	
		insert.setBoolean (6, accionCatalogo.isBorrado());	
	
		
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}		
	public static void insertActividad(Cronograma actividad){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into actividad (nombre,descripcion,proporcion,peso,version,borrado,accion_id,unidad_medida_id,hito_tipo_id,acumulable)"
	+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		insert.setString (1, actividad.getNombre());
		insert.setString (2, actividad.getDescripcion());
		insert.setDouble (3, actividad.getProporcion());
		insert.setDouble (4, actividad.getPeso());
		insert.setInt (5, actividad.getVersion());
		insert.setBoolean (6, actividad.isBorrado());
		insert.setInt (7, actividad.getAccion_id());
		insert.setInt (8, actividad.getUnidad_medida_id());
		insert.setInt (9, actividad.getHito_tipo_id());	
		insert.setBoolean(10, actividad.isAcumulable());

		
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
	
}		
	
	public static boolean insertProgramacion(Programacion programacion) throws ParseException{
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into programacion (cantidad,fecha_entrega,version,actividad_id)"
	+ " values (?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		String startDate = programacion.getFechaEntrega();
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date = sdf1.parse(startDate);
		java.sql.Date sqlStartDate = new java.sql.Date(date.getTime());
		
		
		insert.setDouble (1, programacion.getCantidad());
		insert.setDate (2, sqlStartDate);
		insert.setInt (3, programacion.getVersion());
		insert.setInt (4, programacion.getActividad());
		
		insert.execute();
		   
		conn.close();
		return true;
	} catch (SQLException e) {e.printStackTrace(); return false;}
	
}	
////////////////////////////////////////////////////
	public static boolean insertAvance(Avance avance) throws ParseException{
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into avance (justificacion,cantidad,fecha_entrega,actividad_id,version)"
	+ " values (?, ?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		String inicio = avance.getFechaEntrega();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date1 = sdf.parse(inicio);
		java.sql.Date sqlStart = new java.sql.Date(date1.getTime());
		
		insert.setString (1, avance.getJustificacion());
		insert.setDouble (2, avance.getCantidad());
		insert.setDate (3, sqlStart); 
		//insert.setInt (4, avance.getCantidadBeneficiarios());
		insert.setInt (4, avance.getActividadId());
		insert.setInt (5, avance.getVersion());
		
		insert.execute();
		   
		conn.close();
		return true;
	} catch (SQLException e) {e.printStackTrace(); return false;}
	
}	
	
	public static boolean insertAvanceCosto(AvanceCosto costo){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into avance_costo (monto,codigo_contratacionl,objeto_gasto,avance_id, producto_concat)"
	+ " values (?, ?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		
		insert.setDouble (1, costo.getMonto());
		insert.setString (2, costo.getCodigoContratacion());
		insert.setInt (3, costo.getObjetoGasto());
		insert.setInt (4, costo.getAvanceId());
		insert.setString(5, costo.getProductoConcat());
		
		insert.execute();
		   
		conn.close();
		return true;
	} catch (SQLException e) {e.printStackTrace(); return false;}
	
}	

	public static boolean insertAccionDestinatario(AccionDestinatario destinatario){
		try {
			Connection conn=ConnectionConfiguration.conectar();

			String query = " insert into accion_destinatario (cantidad, descripcion, version, borrado, beneficiario_tipo_id, accion_id, beneficiario_grupo_id)"
		+ " values (?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			
			insert.setInt (1, destinatario.getCantidad());
			insert.setString (2, destinatario.getDescripcion());
			insert.setInt (3, destinatario.getVersion());
			insert.setBoolean (4, destinatario.isBorrado());
			insert.setInt (5, destinatario.getBeneficiarioTipoId());
			insert.setInt (6, destinatario.getAccionId());
			insert.setInt (7, destinatario.getBeneficiarioGrupoId());
			
			insert.execute();
			   
			conn.close();
			return true;
		} catch (SQLException e) {e.printStackTrace(); return false;}
		
	}	
	
	public static boolean insertAvanceCualitativo(AvanceCualitativo avanceCualitativo)throws ParseException{
		try {
			Connection conn=ConnectionConfiguration.conectar();

			String query = " insert into avance_cualitativo (accion_catalogo_id, ins_linea_accion_id, trimestre_id, gestiones_realizadas, principales_logros_alcanzados, dificultades_lecciones_aprendidas, objetivos_del_siguiente_trimestre)"
		+ " values (?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement insert = conn.prepareStatement(query);
			
			insert.setInt (1, avanceCualitativo.getAccionCatalogoId());
			insert.setInt (2, avanceCualitativo.getInsLineaAccionId());
			insert.setInt (3, avanceCualitativo.getTrimestreId());
			insert.setString (4, avanceCualitativo.getGestionesRealizadas());
			insert.setString (5, avanceCualitativo.getPrincipalesLogrosAlcanzados());
			insert.setString (6, avanceCualitativo.getDificultadesLeccionesAprendidas());
			insert.setString (7, avanceCualitativo.getObjetivosTrimestre());
			
			insert.execute();
			   
			conn.close();
			return true;
		} catch (SQLException e) {e.printStackTrace(); return false;}
		
	}
	
	public static boolean insertEtiquetaUsuario(EtiquetaUsuario etiqueta){
		try {
			Connection conn=ConnectionConfiguration.conectar();

			String query = " insert into usuario_etiqueta (usuario_correo, etiqueta_id, usuario_responsable)"
		+ " values (?, ?, ?)";
						
			PreparedStatement insert = conn.prepareStatement(query);		
			
			insert.setString (1, etiqueta.getUsuarioCorreo());
			insert.setInt (2, etiqueta.getEtiquetaId());
			insert.setString(3, etiqueta.getUsuarioResponsable());
			
			insert.execute();
						
			conn.close();
			return true;
		} catch (SQLException e) {e.printStackTrace(); return false;}
		
	}	
	
	public static boolean insertInsLineaAccionHasEtiqueta(InsLineaAccionHasEtiqueta objeto, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();

			String query = " insert into ins_linea_accion_has_etiqueta (ins_linea_accion_id, etiqueta_id, version, usuario_responsable)"
		+ " values (?, ?, ?, ?)";
						
			PreparedStatement insert = conn.prepareStatement(query);		
			
			insert.setInt (1, objeto.getInsLineaAccionId());
			insert.setInt (2, objeto.getEtiquetaId());
			insert.setInt (3, objeto.getVersion());
			insert.setString(4, usuarioResponsable);
			
			insert.execute();
			
			conn.close();
			return true;
		} catch (SQLException e) {e.printStackTrace(); return false;}
		
	}
	
	public static boolean insertUsuarioLineaAccion(UsuarioLineaAccion objeto, String usuarioResponsable){
		try {
			Connection conn=ConnectionConfiguration.conectar();

			String query = " insert into usuario_linea_accion (usuario_correo, linea_accion_id, usuario_responsable)"
		+ " values (?, ?, ?)";
						
			PreparedStatement insert = conn.prepareStatement(query);		
			
			insert.setString (1, usuarioResponsable);
			insert.setInt (2, objeto.getLineaAccionId());
			insert.setString(3, usuarioResponsable);
			
			insert.execute();
			
			conn.close();
			return true;
		} catch (SQLException e) {e.printStackTrace(); return false;}
		
	}
	
		
}
