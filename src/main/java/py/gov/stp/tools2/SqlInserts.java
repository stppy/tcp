package py.gov.stp.tools2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import py.gov.stp.objetosV2.*;


public class SqlInserts {
	

	public static void insertTipoAccion(TipoAccion tipoAccion){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into tipo_accion (id,nombre,descripcion,borrado)"
	+ " values (?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		//insert.setInt (1, tipoAccion.getId());
		insert.setString (2, tipoAccion.getNombre());
		insert.setString (3, tipoAccion.getDescripcion());
		insert.setBoolean (4, tipoAccion.isBorrado());
							
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}
	public static void insertUnidadMedida(UnidadMedida unidadMedida){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into unidad_medida (id,nombre,descripcion,sigla,borrado)"
	+ " values (?, ?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		//insert.setInt (1, unidadMedida.getId());
		insert.setString (2, unidadMedida.getNombre());
		insert.setString (3, unidadMedida.getDescripcion());
		insert.setString (4, unidadMedida.getSigla());
		insert.setBoolean (5, unidadMedida.isBorrado());
		
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}
	public static void insertLineaEstrategica(LineaEstrategica lineaEstrategica){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into linea_estrategica (id,nombre,descripcion,orden,borrado)"
	+ " values (?, ?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		//insert.setInt (1, lineaEstrategica.getId());
		insert.setString (2, lineaEstrategica.getNombre());
		insert.setString (3, lineaEstrategica.getDescripcion());
		insert.setInt (4, lineaEstrategica.getOrden());
		insert.setBoolean (5, lineaEstrategica.isBorrado());
		
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}
	public static void insertLineaAccion(LineaAccion lineaAccion){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into linea_accion (id,nombre,descripcion,orden,peso,acumulador,tipo_accion_id,estrategia_id,unidad_medida_id,borrado)"
	+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		//insert.setInt (1, lineaAccion.getId());
		insert.setString (2, lineaAccion.getNombre());
		insert.setString (3, lineaAccion.getDescripcion());
		insert.setInt (4, lineaAccion.getOrden());
		insert.setString (5, lineaAccion.getPeso());
		insert.setBoolean (6, lineaAccion.isAcumulador());
		insert.setInt (7, lineaAccion.getTipoAccionId());
		insert.setInt (8, lineaAccion.getEstrategiaId());
		insert.setInt (9, lineaAccion.getUnidadMedidaId());
		insert.setBoolean (10, lineaAccion.isBorrado());		
		
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}
	public static void insertInsLineaAccion(InsLineaAccion insLineaAccion){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into ins_linea_accion (linea_accion_id,institucion_id,periodo_id,meta,borrado)"
	+ " values (?, ?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		//insert.setInt (1, insLineaAccion.getId());
		insert.setInt (1, insLineaAccion.getLineaAccionId());
		insert.setInt (2, insLineaAccion.getInstitucionId());
		insert.setInt (3, insLineaAccion.getPeriodoId());
		insert.setDouble (4, insLineaAccion.getMeta());
		insert.setBoolean (5, insLineaAccion.isBorrado());		
		
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}
	public static void insertInstitucion( Institucion institucion){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into institucion (nombre,descripcion,sigla,nivel_id,entidad_id,unidad_jerarquica_id,unidad_responsable_id,orden,borrado)"
	+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		//insert.setInt (1, insLineaAccion.getId());
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
		insert.setDate (3, periodo.getFechaInicio());
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
	   	
		String query = " insert into hito (nombre,descripcion,cantidad,fecha_entrega,hito_tipo_id,evidencia_id,unidad_medida_id,peso,borrado)"
	+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		//insert.setInt (1, insLineaAccion.getId());
		insert.setString (1, hito.getNombre());
		insert.setString (2, hito.getDescripcion());
		insert.setDouble (3, hito.getCantidad());
		insert.setDate (4, hito.getFechaEntrega());
		insert.setInt (5, hito.getHitoTipoId());
		insert.setInt (6, hito.getEvidenciaId());
		insert.setInt (7, hito.getUnidadMedidaId());
		insert.setInt (8, hito.getPeso());
		insert.setBoolean (9, hito.isBorrado());		
		
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}
	public static void insertAccion(Accion accion){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into accion (ins_linea_accion_id,nombre,descripcion,costo,peso,fecha_inicio,fecha_fin,borrado)"
	+ " values (?, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		//insert.setInt (1, insLineaAccion.getId());
		insert.setInt (1, accion.getInsLineaAccionId());
		insert.setString (2, accion.getNombre());
		insert.setString (3, accion.getDescripcion());
		insert.setDouble (4, accion.getCosto());
		insert.setInt (5, accion.getPeso());
		insert.setDate (6, accion.getFechaInicio());
		insert.setDate (7, accion.getFechaFin());
		insert.setBoolean (8, accion.isBorrado());		
		
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}
	public static void insertAccionHasProducto(AccionHasProducto accionHasProducto){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into accion_has_producto (proporcion,accion_id,spr-producto_id)"
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
	   	
		String query = " insert into spr-producto (nivel_id,entidad_id,tipo_id,programa_id,subprograma_id,proyecto_id,funcional_id,unidad_responsable_id,producto_id)"
	+ " values (?, ?, ?)";
		
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
	   	
		String query = " insert into ws (nombre,descripcion,borrado)"
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
	public static void insertEvidencia(Evidencia evidencia){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into evidencia (nombre,descripcion,ws_id,borrado)"
	+ " values (?, ?, ?,?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		//insert.setInt (1, evidencia.getId());
		insert.setString (1, evidencia.getNombre());
		insert.setString (2, evidencia.getDescripcion());
		insert.setInt (3, evidencia.getWsId());
		insert.setBoolean (4, evidencia.isBorrado());
							
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}
	public static void insertAccionHasEtiqueta(AccionHasEtiqueta accionHasEtiqueta){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into accion_has_etiqueta (proporcion,borrado)"
	+ " values (?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		//insert.setInt (1, accionHasEtiqueta.getAccionId());
		//insert.setInt (2, accionHasEtiqueta.getEtiquetaId());
		insert.setInt (1, accionHasEtiqueta.getProporcion());
		insert.setBoolean (2, accionHasEtiqueta.isBorrado());
							
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}
	public static void insertEtiqueta(Etiqueta etiqueta){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into accion_has_etiqueta (nombre,descripcion,borrado)"
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
	   	
		String query = " insert into accion_has_etiqueta (borrado)"
	+ " values (?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		//insert.setInt (1, hitoHasBeneficiario.getHitoId());
		//insert.setInt (2, hitoHasBeneficiario.getHitoAccionId());
		//insert.setInt (3, hitoHasBeneficiario.getBeneficiarioId());
		insert.setBoolean (1, hitoHasBeneficiario.isBorrado());
							
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}
	public static void insertBeneficiario(Beneficiario beneficiario){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = " insert into beneficiario (nombre,descripcion,beneficiario_tipo_id,borrado)"
	+ " values (?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		//insert.setInt (1, beneficiario.getId());
		insert.setString (1, beneficiario.getNombre());
		insert.setString (2, beneficiario.getDescripcion());
		insert.setInt (3, beneficiario.getBeneficiarioTipoId());
		insert.setBoolean (4, beneficiario.isBorrado());
							
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
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
		insert.setInt (2, beneficiarioDetalle.getBeneficiarioDetalleClaves());
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
	   	
		String query = " insert into beneficiario_detalle_clave (nombre,descripcion,geo,geo_poligono_id,geo_poligono_tipo_id,borrado)"
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
	   	
		String query = " insert into accion_has_geo_poligono (proporcion,borrado)"
	+ " values (?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		//insert.setInt (1, accionHAsGeoPoligono.getAccionId());
		//insert.setInt (2, accionHAsGeoPoligono.getGeoPoligonoId());
		//insert.setInt (3, accionHAsGeoPoligono.getGeoPoligonoGeoPoligonoId());
		insert.setInt (1, accionHAsGeoPoligono.getProporcion());
		insert.setBoolean (2, accionHAsGeoPoligono.isBorrado());	
		
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
	
	
}