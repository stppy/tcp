package py.gov.stp.tools;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
//import java.sql.Date;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import py.gov.stp.objetosV2.AccionHasProducto;
import py.gov.stp.objetosV2.HitoPrueba;
import py.gov.stp.tools.ConnectionConfiguration;

//import py.gov.stp.mh.clasificadores.Departamento;
//import py.gov.stp.mh.clasificadores.FuenteFinanciamiento;
//import py.gov.stp.mh.clasificadores.Funcional;
//import py.gov.stp.mh.clasificadores.Mes;
//import py.gov.stp.mh.clasificadores.Nivel;
//import py.gov.stp.mh.clasificadores.OrganismoFinanciador;
//import py.gov.stp.mh.clasificadores.Plan;
//import py.gov.stp.mh.clasificadores.PrecioDNCP;
//import py.gov.stp.mh.clasificadores.Programa;
//import py.gov.stp.mh.clasificadores.ProyectoSNIP;
//import py.gov.stp.mh.clasificadores.ProyectoSNIPAutorizado;
//import py.gov.stp.mh.clasificadores.UnidadJerarquica;
//import py.gov.stp.mh.clasificadores.UnidadMedida;
//import py.gov.stp.mh.clasificadores.UnidadResponsable;
//import py.gov.stp.mh.tools.Proyecto;
//import py.gov.stp.mh.tools.SqlSelects;

public class SqlInserts {
	
//	private static final String UnidadJerarquica = null;
//	
//	public static void insertCatalogoDestinatario(CatalogoDestinatario catalogoDestinatario){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into catalogo_destinatario (id,nombre,descripcion,tipo_catalogo_destinatario_id)"
//			+ " values (?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, catalogoDestinatario.getId());
//			insert.setString (2, catalogoDestinatario.getNombre());
//			insert.setString (4, catalogoDestinatario.getDescripcion());
//			insert.setInt (3, catalogoDestinatario.getTipo_catalogo_destianatario_id());
//						
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//			
//	}
//
//	public static void insertPrecioDncp(PrecioDNCP preciodncp){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into catalogo_dncp (id,nombre,descripcion,anho,numero_fila,precio,objeto_de_gasto_id)"
//			+ " values (?, ?, ?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, preciodncp.getCodCatalogo());
//			insert.setString (2, preciodncp.getNombreCatalogo());
//			insert.setString (3, preciodncp.getSiglaCatalogo());
//			insert.setInt (4, preciodncp.getAnio());
//			insert.setInt (5, preciodncp.getNumeroFila());
//			insert.setDouble (6, preciodncp.getPrecio());
//			insert.setInt (7, preciodncp.getCodObjetoGasto());
//						
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//			
//	}
//	
//	
//	
//	public static void insertDemografia(Demografia demografia){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into demografia (id,nombre,descipcion,tipo_demografica_id_abrev)"
//			+ " values (?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, demografia.getId());
//			insert.setString (2, demografia.getNombre());
//			insert.setString (3, demografia.getDescripcion());
//			insert.setInt (4, demografia.getTipo_demografica_id());
//			insert.setString (5, demografia.getAbrev());
//						
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//	}
//	
//	public static void insertDepartamento(Departamento departamento){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into departamento (id,nombre,descripcion,pais,numero_fila,abrev)"
//			+ " values (?, ?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, departamento.getDeptoPais());
//			insert.setString (2, departamento.getNombreDepartamento());
//			insert.setInt (3, departamento.getCodigoPais());
//			insert.setInt (4, departamento.getNumeroFila());
//			insert.setString (5, departamento.getAbrevDepartamento());
//						
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//	}
//	
//	public static void insertDiccionarioDato(DiccionarioDato diccionarioDato){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into diccionario_dato (id,clase,nombre,titulo,descripcion,instructivo)"
//			+ " values (?, ?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, diccionarioDato.getId());
//			insert.setString (2, diccionarioDato.getClase());
//			insert.setString (3, diccionarioDato.getNombre());
//			insert.setString (4, diccionarioDato.getTitulo());
//			insert.setString (5, diccionarioDato.getDescripcion());
//			insert.setString (6, diccionarioDato.getInstructivo());
//						
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//	}
//
//	public static void insertEjeEstrategico(EjeEstrategico ejeEstrategico){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into eje_estrategico (id,nombre,descripcion,plan_id)"
//			+ " values (?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, ejeEstrategico.getId());
//			insert.setString (2, ejeEstrategico.getNombre());
//			insert.setString (3, ejeEstrategico.getDescripcion());
//			insert.setInt (4, ejeEstrategico.getPlan_id());
//						
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//	}	
//	
//	public static void insertEstrategia(Estrategia estrategia){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into estrategia (id,nombre,descripcion,numero_fila,eje_estrategico_id,linea_transversal_id,plan)"
//			+ " values (?, ?, ?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, estrategia.getEje_estrategico_id());
//			insert.setString (2, estrategia.getNombre());
//			insert.setString (3, estrategia.getDescripcion());
//			insert.setInt (4, estrategia.getNumero_fila());
//			insert.setInt (5, estrategia.getEje_estrategico_id());
//			insert.setInt (6, estrategia.getLinea_transversal_id());
//			insert.setInt (7, estrategia.getPlan());
//			
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//	}
//	
//	public static void insertEstrategiaHasObjetivo(EstrategiaHasObjetivo estrategiaHasObjetivo){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into estrategia_has_objetivo (id,estrategia_id,estrategia_eje_estrategico_id,estrategia_linea_transversal_id,objetivo_id,objetivo_tipo_objetivo_id,es_principal)"
//			+ " values (?, ?, ?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, estrategiaHasObjetivo.getId());
//			insert.setInt (2, estrategiaHasObjetivo.getEstrategia_id());
//			insert.setInt (3, estrategiaHasObjetivo.getEstrategia_eje_estrategico_id());
//			insert.setInt (4, estrategiaHasObjetivo.getEstrategia_linea_transversal_id());
//			insert.setInt (5, estrategiaHasObjetivo.getObjetivo());
//			insert.setInt (6, estrategiaHasObjetivo.getObjetivo_tipo_objetivo_id());
//			insert.setInt (7, estrategiaHasObjetivo.getEs_principal());
//			
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//	}
//	
//	//en el campo descripcion de la tabla lleva getAbrevFuenteFinanciamiento ademas hay 6 variable en la clase y 5 campos en la bd
//	public static void insertFuenteFinanciamiento(FuenteFinanciamiento fuenteFinanciamiento){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into fuente_financiamiento (id,nombre,descripcion,anho,numero_fila)"
//			+ " values (?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, fuenteFinanciamiento.getCodFuenteFinanciamiento());
//			insert.setString (2, fuenteFinanciamiento.getNombreFuenteFinanciamiento());
//			insert.setString (3, fuenteFinanciamiento.getAbrevFuenteFinanciamiento());
//			insert.setInt (4, fuenteFinanciamiento.getAnio());
//			insert.setInt (5, fuenteFinanciamiento.getNumeroFila());
//			
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//	}
//	
//	public static void insertFuenteVerificacion(FuenteVerificacion fuenteVerificacion){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into fuente_verificacion (id,nombre,descripcion,abrev,uri)"
//			+ " values (?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, fuenteVerificacion.getId());
//			insert.setString (2, fuenteVerificacion.getNombre());
//			insert.setString (3, fuenteVerificacion.getDescripcion());
//			insert.setString (4, fuenteVerificacion.getAbrev());
//			insert.setString (5, fuenteVerificacion.getUri());
//			
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//	}
//	
//	//No se inserta descripcion en la bd no es importante segun RP
//	public static void insertFuncional(Funcional funcional){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into funcional (id,numero_fila,nombre,abrev,es_imputable)"
//			+ " values (?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, funcional.getCodigoFuncional());
//			insert.setInt (2, funcional.getNumeroFila());
//			insert.setString (3, funcional.getNombre());
//			insert.setString (4, funcional.getAbreviacion());
//			insert.setString (5, funcional.getEsImputable());
//			
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//	}
//	
//	public static void insertIndicador(Indicador indicador){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into indicador (id,nombre,descripcion,tipo_indicador_id,metodo_calculo_id,unidad_medida_id,frecuencia_meses,desagregacion_tipo_zona_geografica_id,tipo_demografica_id,fuente_verificacion_id,observaciones,objetivo_id)"
//			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, indicador.getId());
//			insert.setString (2, indicador.getNombre());
//			insert.setString (3, indicador.getDescripcion());
//			insert.setInt (4, indicador.getTipo_indicador_id());
//			insert.setInt (5, indicador.getMetodo_calculo_id());
//			insert.setInt (6, indicador.getUnidad_medida_id());
//			insert.setInt (7, indicador.getFrecuencia_meses());
//			insert.setInt (8, indicador.getDesagregacion_tipo_zona_geografica_id());
//			insert.setInt (9, indicador.getTipo_demografica_id());
//			insert.setInt (10, indicador.getFuente_verificacion_id());
//			insert.setString (11, indicador.getObservaciones());
//			insert.setInt (12, indicador.getObjetivo_id());
//			
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//	}
//	
//	public static void insertIndicadorResultado(IndicadorResultado indicador){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into indicador (id,nombre,descripcion,tipo_indicador_id,metodo_calculo_id,unidad_medida_id,frecuencia_meses,desagregacion_tipo_zona_geografica_id,tipo_demografica_id,fuente_verificacion_id,observaciones,objetivo_id)"
//			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, indicador.getId());
//			insert.setString (2, indicador.getNombre());
//			insert.setString (3, indicador.getDescripcion());
//			insert.setInt (4, indicador.getTipo_indicador_id());
//			insert.setInt (5, indicador.getMetodo_calculo_id());
//			insert.setInt (6, indicador.getUnidad_medida_id());
//			insert.setInt (7, indicador.getFrecuencia_meses());
//			insert.setInt (8, indicador.getDesagregacion_tipo_zona_geografica_id());
//			insert.setInt (9, indicador.getTipo_demografica_id());
//			insert.setInt (10, indicador.getFuente_verificacion_id());
//			insert.setString (11, indicador.getObservaciones());
//			insert.setInt (12, indicador.getObjetivo_id());
//			
//			insert.execute();
//			
//			List<Indicador> objetos = new ArrayList<Indicador>();
//			int id=0;
//			try {
//			objetos = SqlSelects.selectAllIndicadores("where objetivo_id="+indicador.getObjetivo_id()+" and nombre LIKE '%"+indicador.getNombre()+"%'");
//			id=objetos.get(0).getId();
//			
//			//SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//	        String fecha2014 = "2014-12-31";
//	        String fecha2015 =  "2015-12-31";
//	        String fecha2016 =  "2016-12-31";
//	        String fecha2017 =  "2017-12-31";
//	        String fecha2018 =  "2018-12-31";
//			
//			Meta meta2014 = new Meta();
//			meta2014.setCantidad(indicador.getMeta2014());
//			meta2014.setDemografia_id(1);
//			meta2014.setIndicador_id(id);
//			meta2014.setZona_geografica_id(indicador.getDesagregacion_tipo_zona_geografica_id());
//			meta2014.setVencimiento(fecha2014);
//			insertMeta(meta2014);
//			
//			Meta meta2015 = new Meta();
//			meta2015.setCantidad(indicador.getMeta2015());
//			meta2015.setDemografia_id(1);
//			meta2015.setIndicador_id(id);
//			meta2015.setZona_geografica_id(indicador.getDesagregacion_tipo_zona_geografica_id());
//			meta2015.setVencimiento(fecha2015);
//			insertMeta(meta2015);
//			
//			Meta meta2016 = new Meta();
//			meta2016.setCantidad(indicador.getMeta2016());
//			meta2016.setDemografia_id(1);
//			meta2016.setIndicador_id(id);
//			meta2016.setZona_geografica_id(indicador.getDesagregacion_tipo_zona_geografica_id());
//			meta2016.setVencimiento(fecha2016);
//			insertMeta(meta2016);
//			
//			Meta meta2017 = new Meta();
//			meta2017.setCantidad(indicador.getMeta2017());
//			meta2017.setDemografia_id(1);
//			meta2017.setIndicador_id(id);
//			meta2017.setZona_geografica_id(indicador.getDesagregacion_tipo_zona_geografica_id());
//			meta2017.setVencimiento(fecha2017);
//			insertMeta(meta2017);
//			
//			Meta meta2018 = new Meta();
//			meta2018.setCantidad(indicador.getMeta2018());
//			meta2018.setDemografia_id(1);
//			meta2018.setIndicador_id(id);
//			meta2018.setZona_geografica_id(indicador.getDesagregacion_tipo_zona_geografica_id());
//			meta2018.setVencimiento(fecha2018);
//			insertMeta(meta2018);
//			
//			
//			
//			}
//			catch (SQLException e) {e.printStackTrace();}
//			
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//	}
//	
//
//	public static void insertLineaTransversal(LineaTransversal lineaTransversal){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into linea_transversal (id,nombre,descripcion,plan_id)"
//			+ " values (?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, lineaTransversal.getId());
//			insert.setString (2, lineaTransversal.getNombre());
//			insert.setString (3, lineaTransversal.getDescripcion());
//			insert.setInt (4, lineaTransversal.getPlan_id());
//			
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//	}	
//	
//	public static void insertMes(Mes mes){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into mes (id,nombre,abrev)"
//			+ " values (?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, mes.getId());
//			insert.setString (2, mes.getNombre());
//			insert.setString (3, mes.getAbrev());
//			
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//	}
//
//	public static void insertMeta(Meta meta){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into meta (id,cantidad,vencimiento,indicador_id,zona_geografica_id,demografia_id)"
//			+ " values (?, ?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, meta.getId());
//			insert.setDouble (2, meta.getCantidad());
//			insert.setString (3, meta.getVencimiento());
//			insert.setInt (4, meta.getIndicador_id());
//			insert.setInt (5, meta.getZona_geografica_id());
//			insert.setInt (6, meta.getDemografia_id());
//			
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//	}	
//	
//	public static void insertMetodoCalculo(MetodoCalculo metodoCalculo){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into metodo_calculo (id,nombre,descripcion,clase)"
//			+ " values (?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, metodoCalculo.getId());
//			insert.setString (2, metodoCalculo.getNombre());
//			insert.setString (3, metodoCalculo.getDescripcion());
//			insert.setString (4, metodoCalculo.getClase());
//		
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//	}
//	
//	public static void insertModulo(Modulo modulo){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into modulo (id,nombre)"
//			+ " values (?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, modulo.getId());
//			insert.setString (2, modulo.getNombre());
//		
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//	}
//	
//	public static void insertModuloHasPermiso(ModuloHasPermiso moduloHasPermiso){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into modulo_has_permiso (role_id,modulo_id,permiso_id)"
//			+ " values (?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			
//			insert.setInt (1, moduloHasPermiso.getRole_id());
//			insert.setInt (2, moduloHasPermiso.getModulo_id());
//			insert.setInt (3, moduloHasPermiso.getPermiso_id());
//								
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//			
//	}
//	
//	//getNivel = cod_nivel de la tabla y no al id de la tabla veerificar si esta correcto
//	public static void insertNivel(Nivel nivel){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into nivel (numero_fila,anho,cod_nivel,nombre,abrev,es_imputable)"
//			+ " values (?, ?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			
//			insert.setInt (1, nivel.getNumeroFila());
//			insert.setInt (2, nivel.getAnio());
//			insert.setInt (3, nivel.getNivel());
//			insert.setString (4, nivel.getNombreNivel());
//			insert.setString (5, nivel.getAbrevNivel());
//			insert.setString (6, nivel.getEsImputable());
//								
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//			
//	}
//	
//	public static void insertObjetivo(Objetivo objetivo){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into objetivo (id,nombre,descripcion,tipo_objetivo_id)"
//			+ " values (?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			
//			insert.setInt (1, objetivo.getId());
//			insert.setString (2, objetivo.getNombre());
//			insert.setString (3, objetivo.getDescripcion());
//			insert.setInt (4, objetivo.getTipo_objetivo_id());
//								
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//			
//	}	
//	
//	public static void insertObjetoDeGasto(ObjetoDeGasto objetoDeGasto){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into objeto_de_gasto (id,nombre,descripcion,abrev,es_imputable,numero_fila,anho)"
//			+ " values (?, ?, ?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			
//			insert.setInt (1, objetoDeGasto.getId());
//			insert.setString (2, objetoDeGasto.getNombre());
//			insert.setString (3, objetoDeGasto.getDescripcion());
//			insert.setString (4, objetoDeGasto.getAbrev());
//			insert.setString (5, objetoDeGasto.getEs_imputable());
//			insert.setInt (6, objetoDeGasto.getNumero_fila());
//			insert.setInt (7, objetoDeGasto.getAnho());
//								
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//			
//	}
//	
//	//no insertamos descripcion verificar si hace falta y crear la clase en el paquete tools
//	public static void insertOrganismoFinanciador(OrganismoFinanciador organismoFinanciador){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into organismo_financiador (id,nombre,numero_fila,anho)"
//			+ " values (?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			
//			insert.setInt (1, organismoFinanciador.getCodOrgFinanciador());
//			insert.setString (2, organismoFinanciador.getNombreOrgFinanciador());
//			insert.setInt (3, organismoFinanciador.getNumeroFila());
//			insert.setInt (4, organismoFinanciador.getAnio());
//								
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//			
//	}
//	
//	public static void insertPermiso(Permiso permiso){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into permiso (id,nombre)"
//			+ " values (?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			
//			insert.setInt (1, permiso.getId());
//			insert.setString (2, permiso.getNombre());
//								
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//			
//	}
//	
//	//verificar entidad_responsable en la table es int y en la clase string ademas las fechas desde y hasta
//	public static void insertPlan(Plan plan){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into plan (id,nombre,descripcion,detalle,entidad_responsable,fecha_inicio,fecha_fin)"
//			+ " values (?, ?, ?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			
//			insert.setInt (1, plan.getCodigoPlan());
//			insert.setString (2, plan.getPlanNombre());
//			insert.setString (3, plan.getPlanDescripcion());
//			insert.setString (4, plan.getPlanDetalle());
//			insert.setString (5, plan.getEntidadResponsable());
//			//insert.setDate (6, plan.getPlanDesde());
//			//insert.setDate (7, plan.getPlanHasta());
//								
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//			
//	}
//	
//	//Cree una clase nueva en tools porque en clasificadores no tenia todos los campos verificar si esta bien.
//	public static void insertProducto(Producto producto){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into producto (id,nombre,descripcion,clase,unidad_medida_id)"
//			+ " values (?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			
//			insert.setInt (1, producto.getId());
//			insert.setString (2, producto.getNombre());
//			insert.setString (3, producto.getDescripcion());
//			insert.setString (4, producto.getClase());
//			insert.setInt (5, producto.getUnidad_medida_id());
//								
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//			
//	}
//	
//	public static void insertProductoPresupuestoMeta( ProductoPresupuestoMeta productoPresupuestoMeta){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into producto_presupuesto_meta (id, mes, anho, cantidad, catalogo_destinatario_id, departamento_id, producto_presupusto_id, producto_id, unidad_medida_id, proyecto_id, subprograma_id, programa_id, tipo_presupuesto_id, entidad_id, nivel_id)"
//			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, productoPresupuestoMeta.getId());
//			insert.setInt (2, productoPresupuestoMeta.getMes());
//			insert.setInt (3, productoPresupuestoMeta.getAnho());
//			insert.setDouble (4, productoPresupuestoMeta.getCantidad());
//			insert.setInt (5, productoPresupuestoMeta.getCatalogo_destianatario_id());
//			insert.setInt (6, productoPresupuestoMeta.getDepartamento());
//			insert.setInt (7, productoPresupuestoMeta.getProducto_presupusto_id());
//			insert.setInt (8, productoPresupuestoMeta.getProducto_id());
//			insert.setInt (9, productoPresupuestoMeta.getUnidad_medida_id());
//			insert.setInt (10, productoPresupuestoMeta.getProyecto_id());
//			insert.setInt (11, productoPresupuestoMeta.getSubprograma_id());
//			insert.setInt (12, productoPresupuestoMeta.getPrograma_id());
//			insert.setInt (13, productoPresupuestoMeta.getTipo_presupuesto_id());
//			insert.setInt (14, productoPresupuestoMeta.getEntidad_id());
//			insert.setInt (15, productoPresupuestoMeta.getNivel_id());
//			
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//			
//	}
//	
//	public static void insertProductoPresupuesto( ProductoPresupuesto productoPresupuesto){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into producto_presupusto (id, numero_fila, anho, producto_id, producto_unidad_medida_id, proyecto_id, proyecto_subprograma_id, proyecto_subprograma_programa_id, proyecto_subprograma_programa_tipo_presupuesto_id,proyecto_subprograma_programa_entidad_id, proyecto_subprograma_programa_entidad_nivel_id, version)"
//			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, productoPresupuesto.getId());
//			insert.setInt (2, productoPresupuesto.getNumero_fila());
//			insert.setInt (3, productoPresupuesto.getAnho());
//			insert.setInt (4, productoPresupuesto.getProducto_id());
//			insert.setInt (5, productoPresupuesto.getUnidad_medida_id());
//			insert.setInt (6, productoPresupuesto.getProyecto_id());
//			insert.setInt (7, productoPresupuesto.getSubprograma_id());
//			insert.setInt (8, productoPresupuesto.getPrograma_id());
//			insert.setInt (9, productoPresupuesto.getTipo_presupuesto_id());
//			insert.setInt (10, productoPresupuesto.getEntidad_id());
//			insert.setInt (11, productoPresupuesto.getNivel_id());
//			insert.setInt (12, productoPresupuesto.getVersion());
//			
//			insert.execute();
//			for (int mes = 1; mes < 13; mes++){
//				for (int departamento = 0; departamento<= 17; departamento++){
//					String query2 = " insert into producto_presupuesto_meta (mes, anho, cantidad, catalogo_destinatario_id, departamento_id, producto_presupusto_id, producto_id, unidad_medida_id, proyecto_id, subprograma_id, programa_id, tipo_presupuesto_id, entidad_id, nivel_id)"
//						+ " values ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?)";
//						
//						PreparedStatement insert2 = conn.prepareStatement(query2);
//						insert2.setInt (1, mes);
//						insert2.setInt (2, productoPresupuesto.getAnho());
//						insert2.setInt (3, 0);
//						insert2.setInt (4, 1);
//						insert2.setInt (5, departamento);
//						insert2.setInt (6, productoPresupuesto.getId());
//						insert2.setInt (7, productoPresupuesto.getId());
//						insert2.setInt (8, productoPresupuesto.getUnidad_medida_id());
//						insert2.setInt (9, productoPresupuesto.getProyecto_id());
//						insert2.setInt (10, productoPresupuesto.getSubprograma_id());
//						insert2.setInt (11, productoPresupuesto.getPrograma_id());
//						insert2.setInt (12, productoPresupuesto.getTipo_presupuesto_id());
//						insert2.setInt (13, productoPresupuesto.getEntidad_id());
//						insert2.setInt (14, productoPresupuesto.getNivel_id());
//						
//						insert2.execute();
//				}
//				String query2 = " insert into producto_presupuesto_meta (mes, anho, cantidad, catalogo_destinatario_id, departamento_id, producto_presupusto_id, producto_id, unidad_medida_id, proyecto_id, subprograma_id, programa_id, tipo_presupuesto_id, entidad_id, nivel_id)"
//						+ " values ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?)";
//						
//						PreparedStatement insert2 = conn.prepareStatement(query2);
//						insert2.setInt (1, mes);
//						insert2.setInt (2, productoPresupuesto.getAnho());
//						insert2.setInt (3, 0);
//						insert2.setInt (4, 1);
//						insert2.setInt (5, 88);
//						insert2.setInt (6, productoPresupuesto.getId());
//						insert2.setInt (7, productoPresupuesto.getId());
//						insert2.setInt (8, productoPresupuesto.getUnidad_medida_id());
//						insert2.setInt (9, productoPresupuesto.getProyecto_id());
//						insert2.setInt (10, productoPresupuesto.getSubprograma_id());
//						insert2.setInt (11, productoPresupuesto.getPrograma_id());
//						insert2.setInt (12, productoPresupuesto.getTipo_presupuesto_id());
//						insert2.setInt (13, productoPresupuesto.getEntidad_id());
//						insert2.setInt (14, productoPresupuesto.getNivel_id());
//						
//						insert2.execute();
//				String query3 = " insert into producto_presupuesto_meta (mes, anho, cantidad, catalogo_destinatario_id, departamento_id, producto_presupusto_id, producto_id, unidad_medida_id, proyecto_id, subprograma_id, programa_id, tipo_presupuesto_id, entidad_id, nivel_id)"
//						+ " values ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?)";
//						
//						PreparedStatement insert3 = conn.prepareStatement(query3);
//						insert3.setInt (1, mes);
//						insert3.setInt (2, productoPresupuesto.getAnho());
//						insert3.setInt (3, 0);
//						insert3.setInt (4, 1);
//						insert3.setInt (5, 99);
//						insert3.setInt (6, productoPresupuesto.getId());
//						insert3.setInt (7, productoPresupuesto.getId());
//						insert3.setInt (8, productoPresupuesto.getUnidad_medida_id());
//						insert3.setInt (9, productoPresupuesto.getProyecto_id());
//						insert3.setInt (10, productoPresupuesto.getSubprograma_id());
//						insert3.setInt (11, productoPresupuesto.getPrograma_id());
//						insert3.setInt (12, productoPresupuesto.getTipo_presupuesto_id());
//						insert3.setInt (13, productoPresupuesto.getEntidad_id());
//						insert3.setInt (14, productoPresupuesto.getNivel_id());
//						
//						insert3.execute();
//				
//			}
//			String query3 = " insert into producto_presupuesto_meta (mes, anho, cantidad, catalogo_destinatario_id, departamento_id, producto_presupusto_id, producto_id, unidad_medida_id, proyecto_id, subprograma_id, programa_id, tipo_presupuesto_id, entidad_id, nivel_id)"
//					+ " values ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?)";
//					
//					PreparedStatement insert3 = conn.prepareStatement(query3);
//					insert3.setInt (1, 1);
//					insert3.setInt (2, 2017);
//					insert3.setInt (3, 0);
//					insert3.setInt (4, 1);
//					insert3.setInt (5, 99);
//					insert3.setInt (6, productoPresupuesto.getId());
//					insert3.setInt (7, productoPresupuesto.getId());
//					insert3.setInt (8, productoPresupuesto.getUnidad_medida_id());
//					insert3.setInt (9, productoPresupuesto.getProyecto_id());
//					insert3.setInt (10, productoPresupuesto.getSubprograma_id());
//					insert3.setInt (11, productoPresupuesto.getPrograma_id());
//					insert3.setInt (12, productoPresupuesto.getTipo_presupuesto_id());
//					insert3.setInt (13, productoPresupuesto.getEntidad_id());
//					insert3.setInt (14, productoPresupuesto.getNivel_id());
//					
//					insert3.execute();
//			String query4 = " insert into producto_presupuesto_meta (mes, anho, cantidad, catalogo_destinatario_id, departamento_id, producto_presupusto_id, producto_id, unidad_medida_id, proyecto_id, subprograma_id, programa_id, tipo_presupuesto_id, entidad_id, nivel_id)"
//					+ " values ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?)";
//					
//					PreparedStatement insert4 = conn.prepareStatement(query4);
//					insert4.setInt (1, 1);
//					insert4.setInt (2, 2018);
//					insert4.setInt (3, 0);
//					insert4.setInt (4, 1);
//					insert4.setInt (5, 99);
//					insert4.setInt (6, productoPresupuesto.getId());
//					insert4.setInt (7, productoPresupuesto.getId());
//					insert4.setInt (8, productoPresupuesto.getUnidad_medida_id());
//					insert4.setInt (9, productoPresupuesto.getProyecto_id());
//					insert4.setInt (10, productoPresupuesto.getSubprograma_id());
//					insert4.setInt (11, productoPresupuesto.getPrograma_id());
//					insert4.setInt (12, productoPresupuesto.getTipo_presupuesto_id());
//					insert4.setInt (13, productoPresupuesto.getEntidad_id());
//					insert4.setInt (14, productoPresupuesto.getNivel_id());
//					
//					insert4.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//			
//	}
//	
//	public static void insertPrograma(Programa programa){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into programa (id, numeroFila, anho, cod_programa, nombre, abrev, descripcion, objetivo, diagnostico, base_legal, resultado, codigoDepartamento, tipo_presupuesto_id, entidad_id, entidad_nivel_id)"
//			+ " values (?, ?, ?, ?, ?, ?, '*', ?, ?, ?, '*', ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, programa.getCodigoPrograma());
//			insert.setInt (2, programa.getNumeroFila());
//			insert.setInt (3, programa.getAnio());
//			insert.setInt (4, programa.getCodigoPrograma());
//			insert.setString (5, programa.getNombrePrograma());
//			insert.setString (6, programa.getAbrevPrograma());
//			//insert.setString (7, programa.getDescripcionPrograma());
//			insert.setString (8, programa.getObjetivo());
//			insert.setString (9, programa.getDiagnostico());
//			insert.setString (10, programa.getBaseLegal());
//			//insert.setString (11, programa.getResultado());
//			insert.setInt (12, programa.getCodigoDepartamento());
//			insert.setInt (13, programa.getTipoPrograma());
//			insert.setInt (14, programa.getEntidad());
//			insert.setInt (15, programa.getNivel());
//			
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//			
//	}
//	
//	public static void insertProgramaCompleto(Programa programa){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into programa (id, numeroFila, anho, cod_programa, nombre, abrev, descripcion, objetivo, diagnostico, base_legal, resultado, codigoDepartamento, tipo_presupuesto_id, entidad_id, entidad_nivel_id)"
//			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, programa.getCodigoPrograma());
//			insert.setInt (2, programa.getNumeroFila());
//			insert.setInt (3, programa.getAnio());
//			insert.setInt (4, programa.getCodigoPrograma());
//			insert.setString (5, programa.getNombrePrograma());
//			insert.setString (6, programa.getAbrevPrograma());
//			insert.setString (7, programa.getDescripcionPrograma());
//			insert.setString (8, programa.getObjetivo());
//			insert.setString (9, programa.getDiagnostico());
//			insert.setString (10, programa.getBaseLegal());
//			insert.setString (11, programa.getResultado());
//			insert.setInt (12, programa.getCodigoDepartamento());
//			insert.setInt (13, programa.getTipoPrograma());
//			insert.setInt (14, programa.getEntidad());
//			insert.setInt (15, programa.getNivel());
//			
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//			
//	}
//	
//	public static void insertProgramatico(Programatico programatico){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into programatico (id, nombre, descripcion, tipo_programatico_id)"
//			+ " values (?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, programatico.getId());
//			insert.setString (2, programatico.getNombre());
//			insert.setString (3, programatico.getDescripcion());
//			insert.setInt (4, programatico.getTipo_programatico_id());
//			
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//			
//	}
//	
//	public static void insertProgramaticoHasObjetivo(ProgramaticoHasObjetivo programaticoHasObjetivo){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into programatico_has_objetivo (programatico_id, programatico_tipo_programatico_id)"
//			+ " values (?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, programaticoHasObjetivo.getProgramatico_id());
//			insert.setInt (2, programaticoHasObjetivo.getProgramatico_tipo_programatico_id());
//			
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//			
//	}	
//
//	//subprograma_programa_tipo_presupuesto_id = getTipoPrograma, 
//	public static void insertProyecto(Proyecto proyectoObj){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into proyecto (id, nombre, descripcion, abrev, anho, subprograma_id, subprograma_programa_id, subprograma_programa_tipo_presupuesto_id, subprograma_programa_entidad_id, subprograma_programa_entidad_nivel_id, unidad_responsable_id, funcional_id, diagnostico, resultado_esperado, codigo_departamento )"
//			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, proyectoObj.getCodigoProyecto());
//			insert.setString (2, proyectoObj.getNombreProyecto());
//			insert.setString (3, proyectoObj.getDescripcionProyecto());
//			insert.setString (4, proyectoObj.getAbrevProyecto());
//			insert.setInt (5, proyectoObj.getAnio());
//			insert.setInt (6, proyectoObj.getCodigoSubprograma());
//			insert.setInt (7, proyectoObj.getCodigoPrograma());
//			insert.setInt (8, proyectoObj.getTipoPrograma());
//			insert.setInt (9, proyectoObj.getEntidad());
//			insert.setInt (10, proyectoObj.getNivel());
//			insert.setInt (11, proyectoObj.getCodigoUnidadResponsable());
//			insert.setInt (12, proyectoObj.getCodigoFuncional());
//			insert.setString (13, proyectoObj.getDiagnostico());
//			insert.setString (14, proyectoObj.getResultadoEsperado());
//			insert.setInt (15, proyectoObj.getCodigoDepartamento() );
//			
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//			
//	}
//
//	public static void insertProyectoSnip(ProyectoSNIP proyectoSnip){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into proyecto_snip (id, nombre, estado )"
//			+ " values (?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, proyectoSnip.getCodigoSnip());
//			insert.setString (2, proyectoSnip.getNombreProyecto());
//			insert.setInt (3, proyectoSnip.getEstado());
//			
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//			
//	}
//	
//	public static void insertProyectoSnipAutorizado(ProyectoSNIPAutorizado proyectoSnipAutorizado){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into proyecto_snip_autorizado (anho, monto, entidad_id, entidad_nivel_id, proyecto_snip_id, organismo_financiador_id, fuente_financiamiento_id )"
//			+ " values (?, ?, ?, ?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, proyectoSnipAutorizado.getAnio());
//			insert.setDouble (2, proyectoSnipAutorizado.getMonto());
//			insert.setDouble (3, proyectoSnipAutorizado.getEntidad());
//			insert.setDouble (4, proyectoSnipAutorizado.getNivel());
//			insert.setDouble (5, proyectoSnipAutorizado.getCodigoSnip());
//			insert.setInt (6, proyectoSnipAutorizado.getCodOrganismoFinanciador());
//			insert.setInt (7, proyectoSnipAutorizado.getCodFuenteFinanciamiento());
//			
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//			
//	}	
//	
//	public static void insertRole(Role role){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into role (id, nombre )"
//			+ " values (?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, role.getId());
//			insert.setString (2, role.getNombre());
//			
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//			
//	}
//	
//	public static void insertSubPrograma(SubPrograma subPrograma){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into subprograma (id, programa_id, programa_tipo_presupuesto_id, programa_entidad_id, programa_entidad_nivel_id, anho, nombre, abrev, descripcion, objetivo, codigo_departamento )"
//			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, subPrograma.getId());
//			insert.setInt (2, subPrograma.getPrograma_id());
//			insert.setInt (3, subPrograma.getPrograma_tipo_presupuesto_id());
//			insert.setInt (4, subPrograma.getPrograma_entidad_id());
//			insert.setInt (5, subPrograma.getPrograma_entidad_nivel_id());
//			insert.setInt (6, subPrograma.getAnho());
//			insert.setString (7, subPrograma.getNombre());
//			insert.setString (8, subPrograma.getAbrev());
//			insert.setString (9, subPrograma.getDescripcion());
//			insert.setString (10, subPrograma.getObjetivo());
//			insert.setInt (11, subPrograma.getCodigo_departamento());
//			
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//			
//	}
//	
//	public static void insertTipoCatalogoDestinatario(TipoCatalogoDestinatario tipoCatalogoDestinatario){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into tipo_catalogo_destinatario (id, nombre, descripcion)"
//			+ " values (?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, tipoCatalogoDestinatario.getId());
//			insert.setString (2, tipoCatalogoDestinatario.getNombre());
//			insert.setString (3, tipoCatalogoDestinatario.getDescripcion());
//			
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//			
//	}
//	
//	public static void insertTipoDemografica(TipoDemografica tipoDemografica){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into tipo_demografica (id, nombre, descripcion)"
//			+ " values (?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, tipoDemografica.getId());
//			insert.setString (2, tipoDemografica.getNombre());
//			insert.setString (3, tipoDemografica.getDescripcion());
//			
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//			
//	}
//	
//	public static void insertTipoIndicador(TipoIndicador tipoIndicador){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into tipo_indicador (id,nombre,descripcion)"
//			+ " values (?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, tipoIndicador.getId());
//			insert.setString (2, tipoIndicador.getNombre());
//			insert.setString (3, tipoIndicador.getDescripcion());
//						
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//	}
//	
//	public static void insertTipoObjetivo(TipoObjetivo tipoObjetivo){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into tipo_objetivo (id,nombre,descripcion)"
//			+ " values (?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, tipoObjetivo.getId());
//			insert.setString (2, tipoObjetivo.getNombre());
//			insert.setString (3, tipoObjetivo.getDescripcion());
//						
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//	}
//	
//	public static void insertTipoPresupuesto(TipoPresupuesto tipoPresupuesto){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into tipo_presupuesto (id,nombre,abrev,descipcion,anho,numero_fila)"
//			+ " values (?, ?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, tipoPresupuesto.getId());
//			insert.setString (2, tipoPresupuesto.getNombre());
//			insert.setString (3, tipoPresupuesto.getAbrev());
//			insert.setString (4, tipoPresupuesto.getDescripcion());
//			insert.setInt (5, tipoPresupuesto.getAnho());
//			insert.setInt (6, tipoPresupuesto.getNumero_fila());
//						
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//	}
//	
//	public static void insertTipoProgramatico(TipoProgramatico tipoProgramatico){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into tipo_programatico (id,nombre,descripcion)"
//			+ " values (?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, tipoProgramatico.getId());
//			insert.setString (2, tipoProgramatico.getNombre());
//			insert.setString (3, tipoProgramatico.getDescripcion());
//						
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//	}
//	
//	public static void insertTipoZonaGeografica(TipoZonaGeografica tipoZonaGeografica){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into tipo_zona_geografica (id,nombre,descipcion)"
//			+ " values (?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, tipoZonaGeografica.getId());
//			insert.setString (2, tipoZonaGeografica.getNombre());
//			insert.setString (3, tipoZonaGeografica.getDescripcion());
//						
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//	}
//	
//	public static void insertUnidadJerarquica(UnidadJerarquica unidadJerarquica){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into unidad_jerarquica (id,nombre,entidad_id,entidad_nivel_id,anho,numero_fila)"
//			+ " values (?, ?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, unidadJerarquica.getUjeCodigo());
//			insert.setString (2, unidadJerarquica.getUjeNombre());
//			insert.setInt (3, unidadJerarquica.getEntidad());
//			insert.setInt (4, unidadJerarquica.getNivel());
//			insert.setInt (5, unidadJerarquica.getAnio());
//			insert.setInt (6, unidadJerarquica.getNumeroFila());
//						
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//	}
//	
//	//No tiene simbolo y descripcion creo que rafa dijo que no es importante incluir esos campos
//	public static void insertUnidadMedida(UnidadMedida unidadMedida){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into unidad_medida (id,nombre,abrev)"
//			+ " values (?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, unidadMedida.getCodigoUnidadMedida());
//			insert.setString (2, unidadMedida.getNombre());
//			insert.setString (2, unidadMedida.getAbreviacion());
//						
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//	}
//	
//	//No tiene descripcion y anho 
//	public static void insertUnidadResponsable(UnidadResponsable unidadResponsable){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into unidad_responsable (id,nombre,abrev,numero_fila,entidad_id,entidad_nivel_id,unidad_jerarquica_id)"
//			+ " values (?, ?, ?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, unidadResponsable.getUnrCodigo());
//			insert.setString (2, unidadResponsable.getUnrNombre());
//			insert.setString (3, unidadResponsable.getUnrAbrev());
//			insert.setInt (4, unidadResponsable.getNumeroFila());
//			insert.setInt (5, unidadResponsable.getEntidad());
//			insert.setInt (6, unidadResponsable.getNivel());
//			insert.setInt (7, unidadResponsable.getUjeCodigo());
//						
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//	}
//	
//	public static void insertUsuario(Usuario usuario){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into usuario (id,correo,passwd,last_login,entidad,role_id, urlimagen)"
//			+ " values (?, ?, ?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, usuario.getId());
//			insert.setString (2, usuario.getCorreo());
//			insert.setString (3, usuario.getPasswd());
//			insert.setDate (4, usuario.getLast_login());
//			insert.setString (5, usuario.getEntidad());
//			insert.setInt (6, usuario.getRol_id());
//			insert.setString (7, usuario.getUrlimagen());
//						
//			insert.execute(); 
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//	}
//
//	
//	
//	public static void insertZonaGeografica(ZonaGeografica zonaGeografica){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into zona_geografica (id,nombre,descripcion,abrev,tipo_zona_geografica_id,cod_geo_unif)"
//			+ " values (?, ?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, zonaGeografica.getId());
//			insert.setString (2, zonaGeografica.getNombre());
//			insert.setString (3, zonaGeografica.getDescripcion());
//			insert.setString (4, zonaGeografica.getAbrev());
//			insert.setInt (5, zonaGeografica.getTipo_zona_geografica_id());
//			insert.setString (6, zonaGeografica.getCod_geo_unif());
//						
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//	}
//	
//	public static void insertEstructuraProgramatica(EstructuraProgramatica estructuraProgramatica){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into estructura_programatica (id, anho, nivel, entidad, tipo, programa, proyecto, nfprograma, nfsubprograma, nfproyecto, departamento, unidad_responsable, funcional)"
//			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			insert.setInt (1, estructuraProgramatica.getId());
//			insert.setInt (2, estructuraProgramatica.getAnho());
//			insert.setInt (3, estructuraProgramatica.getNivel());
//			insert.setInt (4, estructuraProgramatica.getEntidad());
//			insert.setInt (5, estructuraProgramatica.getTipo());
//			insert.setInt (6, estructuraProgramatica.getPrograma());
//			insert.setInt (7, estructuraProgramatica.getProyecto());
//			insert.setInt (8, estructuraProgramatica.getNfprograma());
//			insert.setInt (9, estructuraProgramatica.getNfsubprograma());
//			insert.setInt (10, estructuraProgramatica.getNfproyecto());
//			insert.setInt (11, estructuraProgramatica.getDepartamento());
//			insert.setInt (12, estructuraProgramatica.getUnidad_responsable());
//			insert.setInt (13, estructuraProgramatica.getFuncional());
//			
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//			
//	}
//	
//	public static void insertResultado(Resultado resultado){
//		try {
//			Connection conn=ConnectionConfiguration.conectar();
//		   	
//			String query = " insert into objetivo (id,nombre,descripcion,tipo_objetivo_id, proyecto, subprograma, programa, tipo_presupuesto, entidad, nivel, funcional)"
//			+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
//			
//			PreparedStatement insert = conn.prepareStatement(query);
//			
//			insert.setInt (1, resultado.getId());
//			insert.setString (2, resultado.getNombre());
//			insert.setString (3, resultado.getDescripcion());
//			insert.setInt (4, resultado.getTipo_objetivo_id());
//			insert.setInt (5, resultado.getProyecto());
//			insert.setInt (6, resultado.getSubprograma());
//			insert.setInt (7, resultado.getPrograma());
//			insert.setInt (8, resultado.getTipo_presupuesto());
//			insert.setInt (9, resultado.getEntidad());
//			insert.setInt (10, resultado.getNivel());
//			insert.setInt (11, resultado.getFuncional());
//								
//			insert.execute();
//			   
//			conn.close();
//		} catch (SQLException e) {e.printStackTrace();}
//			
//	}	
	
	public static void insertHitoPrueba(HitoPrueba hito, String usuarioResponsable){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = "insert into \"hitoPrueba\" (\"accion\",\"nombreHito\",\"tipoHito\",\"unidadMedida\",\"cantidadPrevista\",\"cantidadReal\", usuario_responsable)"
	+ " values (?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		insert.setString (1, hito.getAccion());
		insert.setString (2, hito.getNombreHito());
		insert.setString (3, hito.getTipoHito());	
		insert.setString (4, hito.getUnidadMedida());	
		insert.setInt (5, hito.getCantidadPrevista());	
		insert.setInt (6, hito.getCantidadReal());
		insert.setString (7, usuarioResponsable);
		
		insert.execute();
		   
		conn.close();
	} catch (SQLException e) {e.printStackTrace();}
		
}	
	
	public static boolean insertAccionHasProducto(AccionHasProducto dato, String usuarioResponsable){
	try {
		Connection conn=ConnectionConfiguration.conectar();
	   	
		String query = "insert into \"accion_has_producto\" (\"spr_nivel_id\",\"spr_entidad_id\",\"spr_tiprograma_id\",\"spr_programa_id\",\"spr_subprograma_id\",\"srp_proyecto_id\",\"spr_producto_id\",\"accion_id\",\"spr_anho\",\"spr_version\",\"u_medida\",\"cant_fisica\",\"clase\",\"cant_financiera\",\"asignacion_financiera\", usuario_responsable)"
	+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement insert = conn.prepareStatement(query);
		
		insert.setInt (1, dato.getNivel());
		insert.setInt (2, dato.getEntidad());
		insert.setInt (3, dato.getTipoPrograma());	
		insert.setInt (4, dato.getPrograma());	
		insert.setInt (5, dato.getSubPrograma());	
		insert.setInt (6, dato.getProyecto());
		insert.setInt (7, dato.getSprProductoId());	
		insert.setInt (8, dato.getAccionId());
		insert.setInt (9, dato.getAnho());
		insert.setInt (10, dato.getVersion());
		insert.setString (11, dato.getUnidadMedida());	
		insert.setDouble (12, dato.getCantidadFisica());	
		insert.setString (13, dato.getClase());	
		insert.setDouble (14, dato.getCantidadFinanciera());
		insert.setDouble(15, dato.getTotalAsignacion());
		insert.setString (16, usuarioResponsable );	
		
		insert.execute();
		   
		conn.close();
		return true;
	} catch (SQLException e) {e.printStackTrace();return false;}
		
}	
	
	
}
