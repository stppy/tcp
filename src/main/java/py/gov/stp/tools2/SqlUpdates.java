package py.gov.stp.tools2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import py.gov.stp.objetosV2.*;


public class SqlUpdates {
//	
//	/*public static void updateEntidad(int id, int nivel,  String descripcion, String abrev, String sigla, String baseLegal, String mision, String vision, String politica, String objetivo, String diagnostico){
//   	 Connection conect=ConnectionConfiguration.conectar();
//   	 Statement statement = null;
//		 String 				query = "update entidad set ";
//		 //if (id!="") 			query+=" id =\""+id+"\", ";
//		 //if (nivel!="") 		query+=" nivel =\""+nivel+"\", ";
//		 if (descripcion!="") 	query+=" descripcion =\""+descripcion+"\", ";
//		 if (abrev!="") 		query+=" abrev =\""+abrev+"\", ";
//		 if (sigla!="") 		query+=" sigla =\""+sigla+"\", ";
//		 if (baseLegal!="") 	query+=" base_legal =\""+baseLegal+"\", ";
//		 if (mision!="") 		query+=" mision =\""+mision+"\", ";
//		 if (vision!="") 		query+=" vision =\""+vision+"\", ";
//		 if (politica!="") 		query+=" politica =\""+politica+"\", ";
//		 if (objetivo!="") 		query+=" objetivo =\""+objetivo+"\", ";
//		 if (diagnostico!="")	query+=" diagnostico =\""+diagnostico+"\", ";
//		 query = query.substring(0, query.length()-2);
//		 query+=" where id = "+id+" and nivel_id = "+nivel;
//
//		try {
//			statement=conect.createStatement();
//			statement.execute(query);
//		    conect.close();
//		} catch (SQLException e) {e.printStackTrace();}
//		
//   }
//	
//*/
//	public static void updateEntidad(Entidad entidadObj){
//		try {
//			Connection conect=ConnectionConfiguration.conectar();
//			
//			String 				query = "update entidad set ";
//			PreparedStatement update =null;
//			
//			 if (entidadObj.getDescripcion()!=null){ 	query+=" descripcion = ?, ";}
//			 if (entidadObj.getAbrev()!=null) 	 {	query+=" abrev = ?,";}
//			 if (entidadObj.getSigla()!=null) 	 {	query+=" sigla = ?,";}
//			 if (entidadObj.getBase_legal()!=null)  {	query+=" base_legal = ?, ";}
//			 if (entidadObj.getMision()!=null) 	 {	query+=" mision = ?, ";}
//			 if (entidadObj.getVision()!=null) 	 {	query+=" vision = ?, ";}
//			 if (entidadObj.getPolitica()!=null) 	 {	query+=" politica = ?, ";}
//			 if (entidadObj.getObjetivo()!=null) 	 {	query+=" objetivo = ?, ";}
//			 if (entidadObj.getDiagnostico()!=null){	query+=" diagnostico = ?, ";}
//			
//			 query = query.substring(0, query.length()-2);
//			 query+=" where id = ? and nivel_id = ?";
//			 
//			 int cantCampos =0;
//			 update = conect.prepareStatement(query);
//			 if (entidadObj.getDescripcion()!=null)	{ 	cantCampos++;update.setString (cantCampos, entidadObj.getDescripcion());}
//			 if (entidadObj.getAbrev()!=null) 	 	{	cantCampos++;update.setString (cantCampos, entidadObj.getAbrev());}
//			 if (entidadObj.getSigla()!=null) 	 	{	cantCampos++;update.setString (cantCampos, entidadObj.getSigla());}
//			 if (entidadObj.getBase_legal()!=null)  {	cantCampos++;update.setString (cantCampos, entidadObj.getBase_legal());}
//			 if (entidadObj.getMision()!=null) 	 	{	cantCampos++;update.setString (cantCampos, entidadObj.getMision());}
//			 if (entidadObj.getVision()!=null) 		{	cantCampos++;update.setString (cantCampos, entidadObj.getVision());}
//			 if (entidadObj.getPolitica()!=null) 	{	cantCampos++;update.setString (cantCampos, entidadObj.getPolitica());}
//			 if (entidadObj.getObjetivo()!=null) 	{	cantCampos++;update.setString (cantCampos, entidadObj.getObjetivo());}
//			 if (entidadObj.getDiagnostico()!=null)	{	cantCampos++;update.setString (cantCampos, entidadObj.getDiagnostico());}
//			
//			 cantCampos++;
//			 update.setInt    (cantCampos, entidadObj.getId());
//			 cantCampos++;
//			 update.setInt    (cantCampos, entidadObj.getNivel_id());
//
//			update.execute();
//			conect.close();
//		} catch (SQLException e) {e.printStackTrace();}
//		
//	}
//	/*
//	public static void updatePrograma(Programa objeto){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 												query = "update programa set ";
//			 
//			 if (objeto.getNombrePrograma()!="")					query+= "nombre=\""+objeto.getNombrePrograma()+"\", ";
//			 if (objeto.getAbrevPrograma()!="")						query+= "abrev=\""+objeto.getAbrevPrograma()+"\", ";
//			
//			 if (objeto.getObjetivo()!="")							query+= "objetivo=\""+objeto.getObjetivo()+"\", ";
//			 if (objeto.getDiagnostico()!="")						query+= "diagnostico=\""+objeto.getDiagnostico()+"\", ";
//			 if (objeto.getBaseLegal()!="")							query+= "base_legal=\""+objeto.getBaseLegal()+"\", ";
//			
//			 if (objeto.getCodigoDepartamento().toString()!="")		query+= "codigoDepartamento=\""+objeto.getCodigoDepartamento()+"\", ";
//
//			 query = query.substring(0, query.length()-2);
//			 query+="where id ="+objeto.getCodigoPrograma()+" and tipo_presupuesto_id ="+objeto.getTipoPrograma()+" and entidad_id="+objeto.getEntidad()+" and entidad_nivel_id ="+objeto.getNivel();
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	*/
//public static void updatePrograma(Programa programaObj){
//		
//		try {
//			Connection conect=ConnectionConfiguration.conectar();
//			
//			String 	query = "update programa set ";
//		
//			PreparedStatement update =null;
//			 
//			 if (programaObj.getNombrePrograma()		!=null)	{ 	query+=" nombre= ?, ";}		
//			 if (programaObj.getAbrevPrograma()			!=null)	{ 	query+=" abrev= ?, ";}	
//			 if (programaObj.getObjetivo()				!=null) {	query+=" objetivo= ?, ";}
//			 if (programaObj.getDiagnostico()			!=null) {	query+=" diagnostico= ?, ";}
//			 if (programaObj.getBaseLegal()				!=null)	{	query+=" base_legal= ?, ";}
//			 if (programaObj.getCodigoDepartamento()	!=null) {	query+=" codigoDepartamento= ?, ";}
//
//			 query = query.substring(0, query.length()-2);
//			 query+=" where id = ?  and tipo_presupuesto_id = ? and entidad_id=? and entidad_nivel_id = ?";
//			 
//			 int cantCampos =0;
//			 update = conect.prepareStatement(query);
//			 if (programaObj.getNombrePrograma()		!=null)	{ 	cantCampos++;update.setString (cantCampos, programaObj.getNombrePrograma());}
//			 if (programaObj.getAbrevPrograma()			!=null)	{ 	cantCampos++;update.setString (cantCampos, programaObj.getAbrevPrograma());}
//			 if (programaObj.getObjetivo()				!=null) {	cantCampos++;update.setString (cantCampos, programaObj.getObjetivo());}
//			 if (programaObj.getDiagnostico()			!=null) {	cantCampos++;update.setString (cantCampos, programaObj.getDiagnostico());}
//			 if (programaObj.getBaseLegal()				!=null) {	cantCampos++;update.setString (cantCampos, programaObj.getBaseLegal());}
//			 if (programaObj.getCodigoDepartamento()	!=null) {	cantCampos++;update.setInt    (cantCampos, programaObj.getCodigoDepartamento());}
//			 
//			 
//			 cantCampos++;
//			 update.setInt    (cantCampos, programaObj.getCodigoPrograma());
//			 cantCampos++;
//			 update.setInt    (cantCampos, programaObj.getTipoPrograma());
//			 cantCampos++;
//			 update.setInt    (cantCampos, programaObj.getEntidad());
//			 cantCampos++;
//			 update.setInt    (cantCampos, programaObj.getNivel());
//
//
//
//			update.execute();
//			conect.close();
//		} catch (SQLException e) {e.printStackTrace();}
//		
//	}
//
//public static void updateSubPrograma (SubPrograma subprogramaObj){
//	
//	try {
//		Connection conect=ConnectionConfiguration.conectar();
//		
//		String 	query = "update subprograma set ";
//	
//		PreparedStatement update =null;
//		 
//		 if (subprogramaObj.getNombre()		!=null)	{ 	query+=" nombre= ?, ";}		
//		 if (subprogramaObj.getAbrev()		!=null)	{ 	query+=" abrev= ?, ";}	
//		 if (subprogramaObj.getDescripcion()!=null) {	query+=" descripcion= ?, ";}
//		 if (subprogramaObj.getObjetivo()	!=null) {	query+=" objetivo= ?, ";}
//		 if (true) 									{	query+=" codigo_departamento= ?, ";}
//		 if (subprogramaObj.getBaseLegal()	!=null)	{	query+=" baseLegal= ?, ";}
//		 
//
//		 query = query.substring(0, query.length()-2);
//		 query+=" where id = ?  and programa_id = ? and programa_tipo_presupuesto_id = ? and programa_entidad_id=? and programa_entidad_nivel_id = ?";
//		 
//		 int cantCampos =0;
//		 update = conect.prepareStatement(query);
//		 if (subprogramaObj.getNombre()		!=null)	{ 	cantCampos++;update.setString (cantCampos, subprogramaObj.getNombre());}
//		 if (subprogramaObj.getAbrev()		!=null)	{ 	cantCampos++;update.setString (cantCampos, subprogramaObj.getAbrev());}
//		 if (subprogramaObj.getDescripcion()!=null) {	cantCampos++;update.setString (cantCampos, subprogramaObj.getDescripcion());}
//		 if (subprogramaObj.getObjetivo()	!=null) {	cantCampos++;update.setString (cantCampos, subprogramaObj.getObjetivo());}
//		 if (true) 									{	cantCampos++;update.setInt    (cantCampos, subprogramaObj.getCodigo_departamento());}
//		 if (subprogramaObj.getBaseLegal()	!=null) {	cantCampos++;update.setString (cantCampos, subprogramaObj.getBaseLegal());}
//		 
//		 
//		 cantCampos++;
//		 update.setInt    (cantCampos, subprogramaObj.getId());
//		 cantCampos++;
//		 update.setInt    (cantCampos, subprogramaObj.getPrograma_id());
//		 cantCampos++;
//		 update.setInt    (cantCampos, subprogramaObj.getPrograma_tipo_presupuesto_id());
//		 cantCampos++;
//		 update.setInt    (cantCampos, subprogramaObj.getPrograma_entidad_id());
//		 cantCampos++;
//		 update.setInt    (cantCampos, subprogramaObj.getPrograma_entidad_nivel_id());
//
//
//
//		update.execute();
//		conect.close();
//	} catch (SQLException e) {e.printStackTrace();}
//	
//}
//
///*
//	
//	public static void updateSubPrograma(SubPrograma objeto){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//	    	 
//			 String										query = "update subprograma set";
//			 //if (programa_id!="")						query+= "programa_id=\""+programa_id+"\", ";
//			 //if (programa_tipo_presupuesto_id!="")	query+= "programa_tipo_presupuesto_id=\""+programa_tipo_presupuesto_id+"\", ";
//			 //if (programa_entidad_id!="")				query+= "programa_entidad_id=\""+programa_entidad_id+"\", ";	
//			 //if (programa_entidad_nivel_id!="")		query+= "programa_entidad_nivel_id=\""+programa_entidad_nivel_id+"\", ";	
//
//			 if (objeto.getNombre()!=null)				query+= " nombre=\""+objeto.getNombre()+"\", ";
//			 if (objeto.getAbrev()!=null)				query+= " abrev=\""+objeto.getAbrev()+"\", ";
//			 if (objeto.getDescripcion()!=null)			query+= " descripcion=\""+objeto.getDescripcion()+"\", ";
//			 if (objeto.getObjetivo()!=null)			query+= " objetivo=\""+objeto.getObjetivo()+"\", ";
//			 if (true)									query+= " codigo_departamento=\""+objeto.getCodigo_departamento()+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id ="+objeto.getId()+" and programa_id = "+objeto.getPrograma_id()+" and programa_tipo_presupuesto_id="+objeto.getPrograma_tipo_presupuesto_id()+" and programa_entidad_nivel_id="+objeto.getPrograma_entidad_nivel_id()+" and programa_entidad_id="+objeto.getPrograma_entidad_id();
//			
//			 try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//			
//	   }
//	
//	*/
//
//	public static void updateProyecto(Proyecto objeto){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 												query = "update proyecto set ";
//			 if (objeto.getNombreProyecto()!="")					query+= "nombre=\""+objeto.getNombreProyecto()+"\", ";
//			 if (objeto.getDescripcionProyecto()!="")				query+= "descripcion=\""+objeto.getDescripcionProyecto()+"\", ";
//			 if (objeto.getAbrevProyecto()!="")						query+= "abrev=\""+objeto.getAbrevProyecto()+"\", ";
//			 if (objeto.getAnio()!=2015)							query+= "anho=\""+objeto.getAnio()+"\", ";
//			 if (objeto.getCodigoUnidadResponsable()!=0)			query+= "unidad_responsable_id=\""+objeto.getCodigoUnidadResponsable()+"\", ";
//			 if (objeto.getCodigoFuncional()!=0)					query+= "funcional_id=\""+objeto.getCodigoFuncional()+"\", ";
//			 if (objeto.getDiagnostico()!="")						query+= "diagnostico=\""+objeto.getDiagnostico()+"\", ";
//			 if (objeto.getResultadoEsperado()!="")					query+= "resultado_esperado=\""+objeto.getResultadoEsperado()+"\", ";
//			 if (objeto.getCodigoDepartamento()!=null)				query+= "codigo_departamento=\""+objeto.getCodigoDepartamento()+"\", ";
//			 if (objeto.getCodigoSnip()!=0)						query+= "codigo_snip=\""+objeto.getCodigoSnip()+"\", ";
//			 if (objeto.getObjetivo_estrategico_id()!=0)						query+= "objetivo_estrategico_id=\""+objeto.getObjetivo_estrategico_id()+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+=" where id = "+objeto.getCodigoProyecto()+" and subprograma_id = "+objeto.getCodigoSubprograma()+" and subprograma_programa_id="+objeto.getCodigoPrograma()+" and subprograma_programa_tipo_presupuesto_id="+objeto.getTipoPrograma()+" and subprograma_programa_entidad_id="+objeto.getEntidad()+" and subprograma_programa_entidad_nivel_id="+objeto.getNivel();
//
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//			
//	   }
//	public static void updateObjetivo(String id, String nombre, String descripcion, String tipo_objetivo_id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 					query = "update objetivo set";
//			 //if (id!="")				query+= "id=\""+id+"\", ";
//			 if (nombre!="")			query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")		query+= "descripcion=\""+descripcion+"\", ";
//			 //if (tipo_objetivo_id!="")	query+= "tipo_objetivo_id=\""+tipo_objetivo_id+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+=" where id = "+id+" and tipo_objetivo_id="+tipo_objetivo_id;
//
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//			
//	   }
//	
//	public static void updateIndicador(String id, String nombre, String descripcion, String tipo_indicador_id, String metodo_calculo_id, String unidad_medida_id, String frecuencia_meses, String desagregacion_tipo_zona_geografica_id, String tipo_demografica_id, String fuente_verificacion_id, String observaciones, String objetivo_id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 											query = "update indicador set";
//			 //if (id!="")										query+= "id=\""+id+"\", ";
//			 if (nombre!="")									query+= "nombre=\""+nombre+"\", ";	
//			 if (descripcion!="")								query+= "descripcion=\""+descripcion+"\", ";	
//			 //if (tipo_indicador_id!="")							query+= "tipo_indicador_id=\""+tipo_indicador_id+"\", ";
//			 //if (metodo_calculo_id!="")							query+= "metodo_calculo_id=\""+metodo_calculo_id+"\", ";	
//			 //if (unidad_medida_id!="")							query+= "unidad_medida_id=\""+unidad_medida_id+"\", ";
//			 if (frecuencia_meses!="")							query+= "frecuencia_meses=\""+frecuencia_meses+"\", ";	
//			 //if (desagregacion_tipo_zona_geografica_id!="")		query+= "desagregacion_tipo_zona_geografica_id=\""+desagregacion_tipo_zona_geografica_id+"\", ";	
//			 //if (tipo_demografica_id!="")						query+= "tipo_demografica_id=\""+tipo_demografica_id+"\", ";
//			 //if (fuente_verificacion_id!="")					query+= "fuente_verificacion_id=\""+fuente_verificacion_id+"\", ";
//			 if (observaciones!="")								query+= "observaciones=\""+observaciones+"\", ";
//			 //if (objetivo_id!="")								query+= "objetivo_id=\""+objetivo_id+"\", ";	
//			 query = query.substring(0, query.length()-2);
//			 query+=" where id = "+id+" and objetivo_id="+objetivo_id+" and tipo_indicador_id="+tipo_indicador_id+" and metodo_calculo_id="+metodo_calculo_id+" and unidad_medida_id="+unidad_medida_id+" and desagregacion_tipo_zona_geografica_id="+desagregacion_tipo_zona_geografica_id+" and tipo_demografica_id="+tipo_demografica_id+" and fuente_verificacion_id="+fuente_verificacion_id;		
//			 
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateMeta(String id, String cantidad, String vencimiento, String indicador_id, String zona_geografica_id, String demografia_id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 						query = "update meta set";
//			 //if (id!="")					query+= "id=\""+id+"\", ";
//			 if (cantidad!="")				query+= "cantidad=\""+cantidad+"\", ";	
//			 if (vencimiento!="")			query+= "vencimiento=\""+vencimiento+"\", ";
//			 //if (indicador_id!="")		query+= "indicador_id=\""+indicador_id+"\", ";
//			 //if (zona_geografica_id!="")	query+= "zona_geografica_id=\""+zona_geografica_id+"\", ";
//			 //if (demografia_id!="")			query+= "demografia_id=\""+demografia_id+"\", ";	
//			 query = query.substring(0, query.length()-2);
//			 query+=" where id = "+id+" and indicador_id="+indicador_id+" and zona_geografica_id="+zona_geografica_id+" demografia_id="+demografia_id;
//
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateProductoPresupuestoMeta(String cantidad, String anho, String mes, String catalogo_destinatario_id, String departamento_id, String producto_presupusto_id, String producto_id, String unidad_medida_id, String proyecto_id, String subprograma_id, String programa_id, String tipo_presupuetso_id, String entidad_id, String nivel_id ){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 							query = "update producto_presupuesto_meta set ";
//			 //if (entidad_id!="")				query+= "entidad_id=\""+entidad_id+"\", ";
//			 //if (nivel_id!="")				query+= "nivel_id=\""+nivel_id+"\", ";
//			 //if (tipo_presupuetso_id!="")		query+= "tipo_presupuetso_id=\""+tipo_presupuetso_id+"\", ";
//			 //if (programa_id!="")				query+= "programa_id=\""+programa_id+"\", ";
//			 //if (subprograma_id!="")			query+= "subprograma_id=\""+subprograma_id+"\", ";
//			 //if (proyecto_id!="")				query+= "proyecto_id=\""+proyecto_id+"\", ";
//			 //if (producto_id!="")				query+= "producto_id=\""+producto_id+"\", ";
//			 //if (producto_presupusto_id!="")	query+= "producto_presupusto_id=\""+producto_presupusto_id+"\", ";
//			 //if (departamento_id!="")			query+= "departamento_id=\""+departamento_id+"\", ";
//			 //if (anho!="")					query+= "anho=\""+anho+"\", ";
//			 //if (mes!="")						query+= "mes=\""+mes+"\", ";
//			 if (cantidad!=null)					query+= "cantidad="+cantidad+", ";	
//			 if (catalogo_destinatario_id!=null)	query+= "catalogo_destinatario_id="+catalogo_destinatario_id+", ";
//			 if (unidad_medida_id!=null)			query+= "unidad_medida_id="+unidad_medida_id+", ";
//			
//			 query = query.substring(0, query.length()-2);
//			 query+=" where entidad_id = "+entidad_id;
//			 query+=" and nivel_id = "+nivel_id;
//			 query+=" and tipo_presupuesto_id = "+tipo_presupuetso_id;
//			 query+=" and programa_id = "+programa_id;
//			 query+=" and subprograma_id = "+subprograma_id;
//			 query+=" and proyecto_id = "+proyecto_id;
//			 query+=" and producto_id = "+producto_id;
//			 query+=" and producto_presupusto_id = "+producto_id;
//			 query+=" and departamento_id = "+departamento_id;
//			 query+=" and anho = "+anho;
//			 query+=" and mes = "+mes;
//
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateCatalogoDestinatario(String id, String nombre, String descripcion, String tipo_catalogo_destinatario_id ){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "update catalogo_destinatario set ";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 if (tipo_catalogo_destinatario_id!="")		query+= "tipo_catalogo_destinatario_id=\""+tipo_catalogo_destinatario_id+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id ="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateCatalogoDncp(String id, String nombre, String descripcion, String anho, String numero_fila, String precio, String objeto_de_gasto_id ){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "update catalogo_dncp set ";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 if (anho!="")								query+= "anho=\""+anho+"\", ";
//			 if (numero_fila!="")						query+= "numero_fila=\""+numero_fila+"\", ";
//			 if (precio!="")							query+= "precio=\""+precio+"\", ";
//			 //if (objeto_de_gasto_id!="")				query+= "objeto_de_gasto_id=\""+objeto_de_gasto_id+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id ="+id+" and objeto_de_gasto_id ="+objeto_de_gasto_id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//
//	public static void updateDemografia(String id, String nombre, String descripcion, String tipo_demografica_id, String abrev ){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "update demografia set ";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 //if (tipo_demografica_id!="")				query+= "tipo_demografica_id=\""+tipo_demografica_id+"\", ";
//			 if (abrev!="")								query+= "abrev=\""+abrev+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id ="+id+" and tipo_demografica_id="+tipo_demografica_id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateDepartamento(String id, String nombre, String descripcion, String pais, String numero_fila, String abrev){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "update departamento set ";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 if (pais!="")								query+= "pais=\""+pais+"\", ";
//			 if (numero_fila!="")						query+= "numero_fila=\""+numero_fila+"\", ";
//			 if (abrev!="")								query+= "abrev=\""+abrev+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id ="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateDiccionarioDato(String id, String clase, String nombre, String titulo, String descripcion, String instructivo){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "update diccionario_dato set ";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 if (clase!="")								query+= "clase=\""+clase+"\", ";
//			 if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (titulo!="")							query+= "titulo=\""+titulo+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 if (instructivo!="")						query+= "instructivo=\""+instructivo+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id ="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateEjeEstrategico(String id, String nombre, String descripcion, String plan_id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "update eje_estrategico set ";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 //if (plan_id!="")							query+= "plan_id=\""+plan_id+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id ="+id+" and plan_id="+plan_id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateEstrategia(String id, String nombre, String descripcion, String numero_fila, String eje_estrategico_id, String linea_transversal_id, String plan){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "update estrategia set ";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 if (numero_fila!="")						query+= "numero_fila=\""+numero_fila+"\", ";
//			 //if (eje_estrategico_id!="")				query+= "eje_estrategico_id=\""+eje_estrategico_id+"\", ";
//			 //if (linea_transversal_id!="")			query+= "linea_transversal_id=\""+linea_transversal_id+"\", ";
//			 //if (plan!="")								query+= "plan=\""+plan+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id ="+id+" and eje_estrategico_id="+eje_estrategico_id+" linea_transversal_id="+linea_transversal_id+" and plan="+plan;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateEstrategiaHasObjetivo(String id, String estrategia_id, String estrategia_eje_estrategico_id, String estrategia_linea_transversal_id, String objetivo_id, String objetivo_tipo_objetivo_id, String es_principal){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "update estrategia_has_objetivo set ";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 if (estrategia_id!="")						query+= "estrategia_id=\""+estrategia_id+"\", ";
//			 if (estrategia_eje_estrategico_id!="")		query+= "estrategia_eje_estrategico_id=\""+estrategia_eje_estrategico_id+"\", ";
//			 if (estrategia_linea_transversal_id!="")	query+= "estrategia_linea_transversal_id=\""+estrategia_linea_transversal_id+"\", ";
//			 if (objetivo_id!="")						query+= "objetivo_id=\""+objetivo_id+"\", ";
//			 if (objetivo_tipo_objetivo_id!="")			query+= "objetivo_tipo_objetivo_id=\""+objetivo_tipo_objetivo_id+"\", ";
//			 if (es_principal!="")						query+= "es_principal=\""+es_principal+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id ="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateFuenteFinanciamiento(String id, String nombre, String descripcion, String anho, String numero_fila){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "update fuente_financiamiento set ";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 if (anho!="")								query+= "anho=\""+anho+"\", ";
//			 if (numero_fila!="")						query+= "numero_fila=\""+numero_fila+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id ="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateFuenteVerificacion(String id, String nombre, String descripcion, String abrev, String uri){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "update fuente_verificacion set ";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 if (abrev!="")								query+= "abrev=\""+abrev+"\", ";
//			 if (uri!="")								query+= "uri=\""+uri+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id ="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateFuncional(String id, String numero_fila, String nombre, String descripcion, String abrev, String es_imputable){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "update funcional set ";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 if (numero_fila!="")						query+= "numero_fila=\""+numero_fila+"\", ";
//			 if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 if (abrev!="")								query+= "abrev=\""+abrev+"\", ";
//			 if (es_imputable!="")						query+= "es_imputable=\""+es_imputable+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id ="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateLineaTransversal(String id, String nombre, String descripcion, String abrev, String plan_id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "update linea_transversal set ";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 if (abrev!="")								query+= "abrev=\""+abrev+"\", ";
//			 //if (plan_id!="")							query+= "plan_id=\""+plan_id+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id ="+id+" and plan_id="+plan_id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateMes(String id, String nombre, String abrev){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "update mes set ";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (abrev!="")								query+= "abrev=\""+abrev+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id ="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateMetodoCalculo(String id, String nombre, String descripcion, String clase){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "update metodo_calculo set ";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 if (clase!="")								query+= "clase=\""+clase+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id ="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateModulo(String id, String nombre){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "update modulo set ";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id ="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateModuloHasPermiso(String role_id, String modulo_id, String permiso_id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "update modulo_has_permiso set ";
//			 //if (role_id!="")							query+= "role_id=\""+role_id+"\", ";
//			 //if (modulo_id!="")							query+= "modulo_id=\""+modulo_id+"\", ";
//			 if (permiso_id!="")							query+= "permiso_id=\""+permiso_id+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where role_id="+role_id+" and modulo_id="+modulo_id+"and permiso_id"+permiso_id;//agregue al query permiso_id
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateNivel(String id, String numero_fila, String cod_nivel, String anho, String nombre, String descripcion, String abrev, String es_imputable, String fecha_creacion, String verion){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "update nivel set ";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 if (numero_fila!="")						query+= "numero_fila=\""+numero_fila+"\", ";
//			 if (cod_nivel!="")							query+= "cod_nivel=\""+cod_nivel+"\", ";
//			 if (anho!="")								query+= "anho=\""+anho+"\", ";
//			 if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 if (abrev!="")								query+= "abrev=\""+abrev+"\", ";
//			 if (es_imputable!="")						query+= "es_imputable=\""+es_imputable+"\", ";
//			 if (fecha_creacion!="")					query+= "fecha_creacion=\""+fecha_creacion+"\", ";
//			 if (verion!="")							query+= "verion=\""+verion+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateObjetoDeGasto(String id, String nombre, String descripcion, String abrev, String es_imputable, String numero_fila, String anho){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "update objeto_de_gasto set ";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 if (abrev!="")								query+= "abrev=\""+abrev+"\", ";
//			 if (es_imputable!="")						query+= "es_imputable=\""+es_imputable+"\", ";
//			 if (anho!="")								query+= "anho=\""+anho+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//
//	public static void updateOrganismoFinanciador(String id, String nombre, String descripcion, String numero_fila, String anho){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "update organismo_financiador set ";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 if (numero_fila!="")						query+= "numero_fila=\""+numero_fila+"\", ";
//			 if (anho!="")								query+= "anho=\""+anho+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updatePermiso(String id, String nombre){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "update permiso set ";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updatePlan(String id, String nombre, String descripcion, String detalle, String entidad_responsable, String fecha_incio, String fecha_fin){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "update plan set ";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 if (detalle!="")							query+= "detalle=\""+detalle+"\", ";
//			 if (entidad_responsable!="")				query+= "entidad_responsable=\""+entidad_responsable+"\", ";
//			 if (fecha_incio!="")						query+= "fecha_incio=\""+fecha_incio+"\", ";
//			 if (fecha_fin!="")							query+= "fecha_fin=\""+fecha_fin+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	//catalogo de productos, productoMeta de hacienda
//	public static void updateProducto(String id, String nombre, String descripcion, String clase, String unidad_medida_id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "update producto set ";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 if (clase!="")								query+= "clase=\""+clase+"\", ";
//			 //if (unidad_medida_id!="")				query+= "unidad_medida_id=\""+unidad_medida_id+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id="+id+" and unidad_medida_id="+unidad_medida_id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateProductoPresupuesto(String id, String numero_fila, String anho, String producto_id, String producto_unidad_medida_id, String proyecto_id, String proyecto_subprograma_id, String proyecto_subprograma_programa_id, String proyecto_subprograma_programa_tipo_presupuesto_id, String proyecto_subprograma_programa_entidad_id, String proyecto_subprograma_programa_entidad_nivel_id, String version){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 														query = "update producto_presupusto set ";
//			 //if (id!="")													query+= "id=\""+id+"\", ";
//			 if (numero_fila!="")											query+= "numero_fila=\""+numero_fila+"\", ";
//			 if (anho!="")													query+= "anho=\""+anho+"\", ";
//			 //if (producto_id!="")											query+= "producto_id=\""+producto_id+"\", ";
//			 //if (producto_unidad_medida_id!="")							query+= "producto_unidad_medida_id=\""+producto_unidad_medida_id+"\", ";
//			 //if (proyecto_id!="")											query+= "proyecto_id=\""+proyecto_id+"\", ";
//			 //if (proyecto_subprograma_id!="")								query+= "proyecto_subprograma_id=\""+proyecto_subprograma_id+"\", ";
//			 //if (proyecto_subprograma_programa_id!="")					query+= "proyecto_subprograma_programa_id=\""+proyecto_subprograma_programa_id+"\", ";
//			 //if (proyecto_subprograma_programa_tipo_presupuesto_id!="")	query+= "proyecto_subprograma_programa_tipo_presupuesto_id=\""+proyecto_subprograma_programa_tipo_presupuesto_id+"\", ";
//			 //if (proyecto_subprograma_programa_entidad_id!="")			query+= "proyecto_subprograma_programa_entidad_id=\""+proyecto_subprograma_programa_entidad_id+"\", ";
//			 //if (proyecto_subprograma_programa_entidad_nivel_id!="")		query+= "proyecto_subprograma_programa_entidad_nivel_id=\""+proyecto_subprograma_programa_entidad_nivel_id+"\", ";
//			 if (version!="")			query+= "version=\""+version+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id="+id+" and producto_id="+producto_id+" and producto_unidad_medida_id="+producto_unidad_medida_id+" and proyecto_id="+proyecto_id+" and proyecto_subprograma_id="+proyecto_subprograma_id+" and proyecto_subprograma_programa_id="+proyecto_subprograma_programa_id+" and proyecto_subprograma_programa_tipo_presupuesto_id="+proyecto_subprograma_programa_tipo_presupuesto_id+" and proyecto_subprograma_programa_entidad_id="+proyecto_subprograma_programa_entidad_id+" and proyecto_subprograma_programa_entidad_nivel_id="+proyecto_subprograma_programa_entidad_nivel_id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateProgramatico(String id, String nombre, String descripcion, String tipo_programatico_id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "update programatico set ";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 //if (tipo_programatico_id!="")			query+= "tipo_programatico_id=\""+tipo_programatico_id+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id="+id+" and tipo_programatico_id="+tipo_programatico_id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateProgramaticoHasObjetivo(String programatico_id, String programatico_tipo_programatico_id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 										query = "update programatico_has_objetivo set ";
//			 //if (programatico_id!="")						query+= "programatico_id=\""+programatico_id+"\", ";
//			 //sacar el where a programatico_tipo_programatico_id
//			 if (programatico_tipo_programatico_id!="")	query+= "programatico_tipo_programatico_id=\""+programatico_tipo_programatico_id+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where programatico_id="+programatico_id+" and programatico_tipo_programatico_id="+programatico_tipo_programatico_id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateProyectoSnip(String id, String nombre, String descripcion, String estado){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 				query = "update proyecto_snip set ";
//			 //if (id!="")			query+= "id=\""+id+"\", ";
//			 if (nombre!="")		query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")	query+= "descripcion=\""+descripcion+"\", ";
//			 if (estado!="")		query+= "estado=\""+estado+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateProyectoSnipAutorizado(String id, String nombre, String descripcion, String anho, String monto, String entidad_id, String entidad_nivel_id, String proyecto_snip_id, String organismo_financiador_id, String fuente_financiamiento_id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 								query = "update proyecto_snip_autorizado set ";
//			 //if (id!="")							query+= "id=\""+id+"\", ";
//			 if (nombre!="")						query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")					query+= "descripcion=\""+descripcion+"\", ";
//			 if (anho!="")							query+= "anho=\""+anho+"\", ";
//			 if (monto!="")							query+= "monto=\""+monto+"\", ";
//			 //if (entidad_id!="")					query+= "entidad_id=\""+entidad_id+"\", ";
//			 //if (entidad_nivel_id!="")			query+= "entidad_nivel_id=\""+entidad_nivel_id+"\", ";
//			 //if (proyecto_snip_id!="")			query+= "proyecto_snip_id=\""+proyecto_snip_id+"\", ";
//			 //if (organismo_financiador_id!="")	query+= "organismo_financiador_id=\""+organismo_financiador_id+"\", ";
//			 //if (fuente_financiamiento_id!="")	query+= "fuente_financiamiento_id=\""+fuente_financiamiento_id+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id="+id+" and entidad_id="+entidad_id+" and entidad_nivel_id="+entidad_nivel_id+" and proyecto_snip_id="+proyecto_snip_id+" and organismo_financiador_id="+organismo_financiador_id+" and fuente_financiamiento_id="+fuente_financiamiento_id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateRole(String id, String nombre){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 				query = "update role set ";
//			 //if (id!="")			query+= "id=\""+id+"\", ";
//			 if (nombre!="")		query+= "nombre=\""+nombre+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateTipoCatalogoDestinatario(String id, String nombre, String descripcion){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 				query = "update tipo_catalogo_destinatario set ";
//			 //if (id!="")			query+= "id=\""+id+"\", ";
//			 if (nombre!="")		query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")	query+= "descripcion=\""+descripcion+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateTipoDemografica(String id, String nombre, String descripcion){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 				query = "update tipo_demografica set ";
//			 //if (id!="")			query+= "id=\""+id+"\", ";
//			 if (nombre!="")		query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")	query+= "descripcion=\""+descripcion+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateTipoIndicador(String id, String nombre, String descripcion){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 				query = "update tipo_indicador set ";
//			 //if (id!="")			query+= "id=\""+id+"\", ";
//			 if (nombre!="")		query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")	query+= "descripcion=\""+descripcion+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateTipoObjetivo(String id, String nombre, String descripcion){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 				query = "update tipo_objetivo set ";
//			 //if (id!="")			query+= "id=\""+id+"\", ";
//			 if (nombre!="")		query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")	query+= "descripcion=\""+descripcion+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateTipoPresupuesto(String id, String nombre, String abrev, String descripcion, String anho, String numero_fila){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 				query = "update tipo_presupuesto set ";
//			 //if (id!="")			query+= "id=\""+id+"\", ";
//			 if (nombre!="")		query+= "nombre=\""+nombre+"\", ";
//			 if (abrev!="")			query+= "abrev=\""+abrev+"\", ";
//			 if (descripcion!="")	query+= "descripcion=\""+descripcion+"\", ";
//			 if (anho!="")			query+= "anho=\""+anho+"\", ";
//			 if (numero_fila!="")	query+= "numero_fila=\""+numero_fila+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateTipoProgramatico(String id, String nombre, String descripcion){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 				query = "update tipo_programatico set ";
//			 //if (id!="")			query+= "id=\""+id+"\", ";
//			 if (nombre!="")		query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")	query+= "descripcion=\""+descripcion+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//
//	public static void updateTipoZonaGeografica(String id, String nombre, String descipcion){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 				query = "update tipo_zona_geografica set ";
//			 //if (id!="")			query+= "id=\""+id+"\", ";
//			 if (nombre!="")		query+= "nombre=\""+nombre+"\", ";
//			 if (descipcion!="")	query+= "descipcion=\""+descipcion+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateUnidadJerarquica(String id, String nombre, String descipcion, String entidad_id, String entidad_nivel_id, String anho, String numero_fila){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 						query = "update unidad_jerarquica set ";
//			 //if (id!="")					query+= "id=\""+id+"\", ";
//			 if (nombre!="")				query+= "nombre=\""+nombre+"\", ";
//			 if (descipcion!="")			query+= "descipcion=\""+descipcion+"\", ";
//			 //if (entidad_id!="")			query+= "entidad_id=\""+entidad_id+"\", ";
//			 //if (entidad_nivel_id!="")	query+= "entidad_nivel_id=\""+entidad_nivel_id+"\", ";
//			 if (anho!="")					query+= "anho=\""+anho+"\", ";
//			 if (numero_fila!="")			query+= "numero_fila=\""+numero_fila+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id="+id+" and entidad_id="+entidad_id+" and entidad_nivel_id="+entidad_nivel_id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateUnidadMedida(String id, String nombre, String abrev, String simbolo, String descripcion){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 						query = "update unidad_medida set ";
//			 //if (id!="")					query+= "id=\""+id+"\", ";
//			 if (nombre!="")				query+= "nombre=\""+nombre+"\", ";
//			 if (abrev!="")					query+= "abrev=\""+abrev+"\", ";
//			 if (simbolo!="")				query+= "simbolo=\""+simbolo+"\", ";
//			 if (descripcion!="")			query+= "descripcion=\""+descripcion+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateUnidadResponsable(String id, String nombre, String descripcion, String abrev, String numero_fila, String entidad_id, String entidad_nivel_id, String unidad_jerarquica_id, String anho){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 							query = "update unidad_responsable set ";
//			 //if (id!="")						query+= "id=\""+id+"\", ";
//			 if (nombre!="")					query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")				query+= "descripcion=\""+descripcion+"\", ";
//			 if (abrev!="")						query+= "abrev=\""+abrev+"\", ";
//			 if (numero_fila!="")				query+= "numero_fila=\""+numero_fila+"\", ";
//			 //if (entidad_id!="")				query+= "entidad_id=\""+entidad_id+"\", ";
//			 //if (entidad_nivel_id!="")		query+= "entidad_nivel_id=\""+entidad_nivel_id+"\", ";
//			 //if (unidad_jerarquica_id!="")	query+= "unidad_jerarquica_id=\""+unidad_jerarquica_id+"\", ";
//			 if (anho!="")						query+= "anho=\""+anho+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id="+id+" and entidad_id="+entidad_id+" and entidad_nivel_id="+entidad_nivel_id+" and unidad_jerarquica_id="+unidad_jerarquica_id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateUsuario(String id, String correo, String passwd, String last_login, String entidad, String role_id, String urlimagen){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 							query = "update usuario set ";
//			 //if (id!="")						query+= "id=\""+id+"\", ";
//			 if (correo!="")					query+= "correo=\""+correo+"\", ";
//			 if (passwd!="")					query+= "passwd=\""+passwd+"\", ";
//			 if (last_login!="")				query+= "last_login=\""+last_login+"\", ";
//			 //if (entidad!="")					query+= "entidad=\""+entidad+"\", ";
//			 //if (role_id!="")					query+= "role_id=\""+role_id+"\", ";
//			 if (urlimagen!="")					query+= "urlimagen=\""+urlimagen+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id="+id+" and role_id="+role_id+" and entidad="+entidad;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateProductoPresupuestoDestinatario(ProductoPresupuestoDestinatarios destinatario){
//		try {
//			int iDest=0;
//			int iDepto=0;
//			int catalogo=0;
//			Double cantidad=0.0;
//			
//			Connection conect=ConnectionConfiguration.conectar();
//			PreparedStatement update =null;
//			
//			String query="";
//			
//			for(iDest=0;iDest<destinatario.catalogo_destinatario.length;iDest++){ //array de ids de catalogo destinatarios iDest es la posicion en el array de ids
//				catalogo = destinatario.catalogo_destinatario[iDest];			  //id de catalogo de destinatio
//				for(iDepto=0;iDepto<18;iDepto++){								  //iDepto = id del departametno, y tambien indice del array
//					cantidad=destinatario.cantidades[iDest][iDepto];
//					query="INSERT INTO producto_presupuesto_destinatario (nivel, entidad, tipo_presupuesto, programa, subprograma, proyecto, producto, catalogo_destinatario, departamento, cantidad)"
//							+"VALUES (?,?,?,?,?,?,?,?,?, ?)"
//							+"ON DUPLICATE KEY UPDATE cantidad  = ?";
//							
//					 update = conect.prepareStatement(query);
//					 update.setInt    (1,  destinatario.getNivel());
//					 update.setInt    (2,  destinatario.getEntidad());
//					 update.setInt    (3,  destinatario.getTipo_presupuesto());
//					 update.setInt    (4,  destinatario.getPrograma());
//					 update.setInt    (5,  destinatario.getSubprograma());
//					 update.setInt    (6,  destinatario.getProyecto());
//					 update.setInt    (7,  destinatario.getProducto());
//					 update.setInt    (8,  catalogo);
//					 update.setInt    (9,  iDepto);
//					 update.setDouble (10, cantidad);
//					 update.setDouble (11, cantidad);
//					 
//
//					update.execute();
//				
//				}
//				
//				cantidad=destinatario.cantidades[iDest][88];
//				query="INSERT INTO producto_presupuesto_destinatario (nivel, entidad, tipo_presupuesto, programa, subprograma, proyecto, producto, catalogo_destinatario, departamento, cantidad)"
//						+"VALUES (?,?,?,?,?,?,?,?,?, ?)"
//						+"ON DUPLICATE KEY UPDATE cantidad  = ?";
//						
//				 update = conect.prepareStatement(query);
//				 update.setInt    (1,  destinatario.getNivel());
//				 update.setInt    (2,  destinatario.getEntidad());
//				 update.setInt    (3,  destinatario.getTipo_presupuesto());
//				 update.setInt    (4,  destinatario.getPrograma());
//				 update.setInt    (5,  destinatario.getSubprograma());
//				 update.setInt    (6,  destinatario.getProyecto());
//				 update.setInt    (7,  destinatario.getProducto());
//				 update.setInt    (8,  catalogo);
//				 update.setInt    (9,  88);
//				 update.setDouble (10, cantidad);
//				 update.setDouble (11, cantidad);
//				 
//
//				update.execute();
//				cantidad=destinatario.cantidades[iDest][99];
//				query="INSERT INTO producto_presupuesto_destinatario (nivel, entidad, tipo_presupuesto, programa, subprograma, proyecto, producto, catalogo_destinatario, departamento, cantidad)"
//						+"VALUES (?,?,?,?,?,?,?,?,?, ?)"
//						+"ON DUPLICATE KEY UPDATE cantidad  = ?";
//						
//				 update = conect.prepareStatement(query);
//				 update.setInt    (1,  destinatario.getNivel());
//				 update.setInt    (2,  destinatario.getEntidad());
//				 update.setInt    (3,  destinatario.getTipo_presupuesto());
//				 update.setInt    (4,  destinatario.getPrograma());
//				 update.setInt    (5,  destinatario.getSubprograma());
//				 update.setInt    (6,  destinatario.getProyecto());
//				 update.setInt    (7,  destinatario.getProducto());
//				 update.setInt    (8,  catalogo);
//				 update.setInt    (9,  99);
//				 update.setDouble (10, cantidad);
//				 update.setDouble (11, cantidad);
//				 
//
//				update.execute();
//				
//			}
//			conect.close();
//			
//		} catch (SQLException e) {e.printStackTrace();}
//	}
//	
//	
//	public static void updateZonaGeografica(String id, String nombre, String descripcion, String abrev, String tipo_zona_geografica_id, String cod_geo_unif){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 							query = "update zona_geografica set ";
//			 //if (id!="")						query+= "id=\""+id+"\", ";
//			 if (nombre!="")					query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")				query+= "descripcion=\""+descripcion+"\", ";
//			 if (abrev!="")						query+= "abrev=\""+abrev+"\", ";
//			 //if (tipo_zona_geografica_id!="")	query+= "tipo_zona_geografica_id=\""+tipo_zona_geografica_id+"\", ";
//			 if (cod_geo_unif!="")				query+= "cod_geo_unif=\""+cod_geo_unif+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id="+id+" and tipo_zona_geografica_id="+tipo_zona_geografica_id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void updateEstructuraProgramatica(String id, String anho, String nivel, String entidad, String tipo, String programa, String subprograma, String proyecto, String funcional, String diagnostico, String base_legal, String nombre, String abrev, String descripcion){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 							query = "update estructura_programatica set ";
//			 //if (id!="")						query+= "id=\""+id+"\", ";
//			 if (diagnostico!="")				query+= "diagnostico=\""+diagnostico+"\", ";
//			 if (base_legal!="")				query+= "base_legal=\""+base_legal+"\", ";
//			 if (nombre!="")					query+= "nombre=\""+nombre+"\", ";
//			 if (abrev!="")						query+= "abrev=\""+abrev+"\", ";
//			 //if (tipo_zona_geografica_id!="")	query+= "tipo_zona_geografica_id=\""+tipo_zona_geografica_id+"\", ";
//			 if (descripcion!="")				query+= "descripcion=\""+descripcion+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id="+id+" and anho="+anho+"and nivel="+nivel+"and entidad="+entidad+"and tipo="+tipo+"and programa"+programa+"and programa="+subprograma+"and proyecto"+proyecto+"and funcional="+funcional;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	public static void updateResultado(String id, String nombre, String descripcion, String tipo_objetivo_id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 					query = "update resultado set";
//			 //if (id!="")				query+= "id=\""+id+"\", ";
//			 if (nombre!="")			query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")		query+= "descripcion=\""+descripcion+"\", ";
//			 //if (tipo_objetivo_id!="")	query+= "tipo_objetivo_id=\""+tipo_objetivo_id+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+=" where id = "+id+" and tipo_objetivo_id="+tipo_objetivo_id;
//
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//			
//	   }
	
	/*
	 */
	
	
	
	public static boolean updateTipoAccion(TipoAccion objeto){
  	 Connection conect=ConnectionConfiguration.conectar();
   	
  	 Statement statement = null;

				 String										query = "update tipo_accion set ";
				 if(objeto.getNombre()!=null)			    query+= "nombre='"+objeto.getNombre()+"'";
				 if(objeto.getDescripcion()!=null)			query+= ", descripcion='"+objeto.getDescripcion()+"'";
				 //if(objeto.isBorrado()!=false)			query+= "borrado=\""+objeto.isBorrado()+"\"";	
				 
				 query+=" where id ="+objeto.getId();
				 
				 try {
					statement=conect.createStatement();
					statement.execute(query);
				    conect.close();
				    return true;
				} catch (SQLException e) {e.printStackTrace(); return false;}

	}
	
	public static boolean borradoTipoAccion(boolean flagBorrado){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
			 String query = "update tipo_accion set borrado=\""+flagBorrado+"\"";	
			 try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}
	
	
	public static boolean updateUnidadMedida(UnidadMedida objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String										query = "update unidad_medida set ";
					 if(objeto.getNombre()!=null)			    query+= "nombre='"+objeto.getNombre()+"'";
					 if(objeto.getDescripcion()!=null)			query+= ", descripcion='"+objeto.getDescripcion()+"'";
					 if(objeto.getSigla()!=null)			 	query+= ", sigla='"+objeto.getSigla()+"'";	
					 
					 
					 query+=" where id ="+objeto.getId();

					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

		}
	
	public static boolean borradoUnidadMedida(boolean flagBorrado){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
			 String query = "update unidad_medida set borrado=\""+flagBorrado+"\"";	
			 try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}	
	
	public static boolean updateLineaEstrategica(LineaEstrategica objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String										query = "update linea_estrategica set ";
					 if(objeto.getNombre()!=null)				query+= "nombre='"+objeto.getNombre()+"'";
					 if(objeto.getDescripcion()!=null)			query+= ", descripcion='"+objeto.getDescripcion()+"'";
					 if(objeto.getOrden()!=0)			 		query+= ", orden="+objeto.getOrden()+"";
					 //if(objeto.isBorrado()!=false)			query+= "borrado=\""+objeto.isBorrado()+"\"";	

					 query+=" where id ="+objeto.getId();
					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

		}	
	
	public static boolean borradoLineaEstrategica(boolean flagBorrado){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
			 String query = "update linea_estrategica set borrado=\""+flagBorrado+"\"";	
			 try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}	
	
	public static boolean updateLineaAccion(LineaAccion objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String										query = "update linea_accion set ";
					 if(objeto.getNombre()!=null)				query+= "nombre='"+objeto.getNombre()+"'";
					 if(objeto.getDescripcion()!=null)			query+= ", descripcion='"+objeto.getDescripcion()+"'";
					 if(objeto.getOrden()!=0)			 		query+= ", orden="+objeto.getOrden()+"";
					 if(objeto.getPeso()!=null)					query+= ", peso='"+objeto.getPeso()+"'";
					 //if(objeto.isAcumular()!=false)				query+= ", acumular='"+objeto.isAcumular()+"'";	
					 if(objeto.getTipoAccionId()!=0)			query+= ", tipo_accion_id="+objeto.getTipoAccionId()+"";
					 if(objeto.getEstrategiaId()!=0)			query+= ", estrategia_id="+objeto.getEstrategiaId()+"";
					 if(objeto.getUnidadMedidaId()!=0)			query+= ", unidad_medida_id="+objeto.getUnidadMedidaId()+"";					 
					 
					 
					 //if(objeto.isBorrado()!=false)			query+= "borrado=\""+objeto.isBorrado()+"\"";	

					 query+=" where id ="+objeto.getId();

					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

		}	
	
	public static boolean borradoLineaAccion(boolean flagBorrado){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
			 String query = "update linea_accion set borrado=\""+flagBorrado+"\"";	
			 try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}		
	
	public static boolean updateInsLineaAccion(InsLineaAccion objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String										query = "update ins_linea_accion set ";
					 if(objeto.getLineaAccionId()!=0)			query+= "linea_accion_id="+objeto.getLineaAccionId()+"";	
					 if(objeto.getInstitucionId()!=0)			query+= ", institucion_id="+objeto.getInstitucionId()+"";
					 if(objeto.getPeriodoId()!=0)				query+= ", periodo_id="+objeto.getPeriodoId()+"";
					 if(objeto.getMeta()!=0)					query+= ", meta="+objeto.getMeta()+"";					 
					 //if(objeto.isBorrado()!=false)			query+= "borrado=\""+objeto.isBorrado()+"\"";	

					 query+=" where id ="+objeto.getId();
					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

		}
	
	public static boolean borradoInsLineaAccion(boolean flagBorrado){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
			 String query = "update ins_linea_accion set borrado=\""+flagBorrado+"\"";	
			 try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}		

	public static boolean updateInstitucion(Institucion objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;  

					 String										query = "update institucion set ";
					 if(objeto.getNombre()!=null)				query+= "nombre='"+objeto.getNombre()+"'";	
					 if(objeto.getDescripcion()!=null)			query+= ", descripcion='"+objeto.getDescripcion()+"'";
					 if(objeto.getSigla()!=null)				query+= ", sigla='"+objeto.getSigla()+"'";
					 if(objeto.getNivelId()!=0)					query+= ", nivel_id="+objeto.getNivelId()+"";	
					 if(objeto.getEntidadId()!=0)				query+= ", entidad_id="+objeto.getEntidadId()+"";
					 if(objeto.getUnidadJerarquicaId()!=0)		query+= ", unidad_jerarquica_id="+objeto.getUnidadJerarquicaId()+"";
					 if(objeto.getUnidadResponsableId()!=0)		query+= ", unidad_responsable_id="+objeto.getUnidadResponsableId()+"";
					 if(objeto.getOrden()!=0)					query+= ", orden="+objeto.getOrden()+"";	
					 //if(objeto.isBorrado()!=false)			query+= "borrado=\""+objeto.isBorrado()+"\"";	
					 
					 
					 query+=" where id ="+objeto.getId();
					 
					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

		}	
	
	 	
	
	public static boolean borradoInstitucion(boolean flagBorrado){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
			 String query = "update institucion set borrado=\""+flagBorrado+"\"";	
			 try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}		
	
	public static boolean updatePeriodo(Periodo objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String										query = "update periodo set ";
					 if(objeto.getNombre()!=null)				query+= "nombre='"+objeto.getNombre()+"'";	
					 if(objeto.getDescripcion()!=null)			query+= ", descripcion='"+objeto.getDescripcion()+"'";
					 if(objeto.getFechaInicio()!=null)			query+= ", fecha_inicio='"+objeto.getFechaInicio()+"'";
					 if(objeto.getFechaFin()!=null)				query+= ", fecha_fin='"+objeto.getFechaFin()+"'";
					 //if(objeto.isBorrado()!=false)			query+= "borrado=\""+objeto.isBorrado()+"\"";	

					 query+=" where id ="+objeto.getId();
					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

		}	
	
	public static boolean borradoPeriodo(Periodo objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
	  	 objeto.changeBorrado();
			 String query = "update periodo set borrado=\""+objeto.isBorrado()+"\"";	
			 try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}		
	
	public static boolean updateHitoTipo(HitoTipo objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String										query = "update hito_tipo set ";
					 if(objeto.getNombre()!=null)				query+= "nombre='"+objeto.getNombre()+"'";	
					 if(objeto.getDescripcion()!=null)			query+= ", descripcion='"+objeto.getDescripcion()+"'";
					 //if(objeto.isBorrado()!=false)			query+= "borrado=\""+objeto.isBorrado()+"\"";	

					 query+=" where id ="+objeto.getId(); 
					 
					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

		}
	
	public static boolean borradoHitoTipo(HitoTipo objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
	  	objeto.changeBorrado();
	  	
			 String query = "update hito_tipo set borrado='"+objeto.isBorrado()+"'";	
			 
			 query+=" where id ="+objeto.getId(); 
			 try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}			
	
	public static boolean updateHito(Hito objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String										query = "update hito set ";
					 if(objeto.getNombre()!=null)				query+= "nombre='"+objeto.getNombre()+"'";	
					 if(objeto.getDescripcion()!=null)			query+= ", descripcion='"+objeto.getDescripcion()+"'";
					 if(objeto.getCantidad()!=0)				query+= ", cantidad="+objeto.getCantidad()+"";
					 if(objeto.getFechaEntrega()!=null)			query+= ", fecha_entrega='"+objeto.getFechaEntrega()+"'";
					 if(objeto.getHitoTipoId()!=0)				query+= ", hito_tipo_id="+objeto.getHitoTipoId()+"";
					 if(objeto.getAccionId()!=0)				query+= ", accion_id="+objeto.getAccionId()+"";
					 if(objeto.getEvidenciaId()!=0)				query+= ", evidencia_id="+objeto.getEvidenciaId()+"";
					 if(objeto.getUnidadMedidaId()!=0)			query+= ", unidad_medida_id="+objeto.getUnidadMedidaId()+"";
					 if(objeto.getPeso()!=0)					query+= ", peso="+objeto.getPeso()+"";
					 //if(objeto.isBorrado()!=false)			query+= "borrado=\""+objeto.isBorrado()+"\"";	
					 
					
					 query+=" where id ="+objeto.getId()+" AND accion_id="+objeto.getAccionId();


					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

		}
	
	public static boolean borradoHito(boolean flagBorrado){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
			 String query = "update hito set borrado=\""+flagBorrado+"\"";	
			 try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}		
	
	public static boolean updateAccion(Accion objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;
					 String										query = "update accion set ";
					 if(objeto.getInsLineaAccionId()!=0)		query+= "ins_linea_accion_id="+objeto.getInsLineaAccionId()+"";	
					 if(objeto.getNombre()!=null)				query+= ", nombre='"+objeto.getNombre()+"'";	
					 if(objeto.getDescripcion()!=null)			query+= ", descripcion='"+objeto.getDescripcion()+"'";
					 if(objeto.getCosto()!=0)					query+= ", costo="+objeto.getCosto()+"";	
					 if(objeto.getPeso()!=0)					query+= ", peso="+objeto.getPeso()+"";
					 if(objeto.getFechaInicio()!=null)			query+= ", fecha_inicio='"+objeto.getFechaInicio()+"'";
					 if(objeto.getFechaFin()!=null)				query+= ", fecha_fin='"+objeto.getFechaFin()+"'";
					 //if(objeto.isBorrado()!=false)				query+= ", borrado='"+objeto.isBorrado()+"' ";	
					 
					 query+=" where id ="+objeto.getId();

					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

		}
	
	public static boolean borradoAccion(boolean flagBorrado){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
			 String query = "update accion set borrado=\""+flagBorrado+"\"";	
			 try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}		
	
	public static boolean updateAccionHasProducto(AccionHasProducto objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String										query = "update accion_has_producto set ";
					 if(objeto.getProporcion()!=0)				query+= "proporcion="+objeto.getProporcion()+"";	
					 if(objeto.getAccionId()!=0)				query+= ", accion_id="+objeto.getAccionId()+"";
					 if(objeto.getSprProductoId()!=0)			query+= ", spr_producto_id="+objeto.getSprProductoId()+"";	

					 query+=" where id ="+objeto.getId();
					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

		}	
	
	public static boolean updateSprProducto(SprProducto objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String										query = "update spr_producto set ";
					 if(objeto.getNivelId()!=0)					query+= "nivel_id="+objeto.getNivelId()+"";	
					 if(objeto.getEntidadId()!=0)				query+= ", entidad_id="+objeto.getEntidadId()+"";
					 if(objeto.getTipoId()!=0)					query+= ", tipo_id="+objeto.getTipoId()+"";	
					 if(objeto.getProgramaId()!=0)				query+= ", programa_id="+objeto.getProgramaId()+"";
					 if(objeto.getSubprogramaId()!=0)			query+= ", subprograma_id="+objeto.getSubprogramaId()+"";
					 if(objeto.getProyectoId()!=0)				query+= ", proyecto_id="+objeto.getProyectoId()+"";	
					 if(objeto.getFuncionalId()!=0)				query+= ", funcional_id="+objeto.getFuncionalId()+"";
					 if(objeto.getUnidadResponsableId()!=0)		query+= ", unidad_responsable_id="+objeto.getUnidadResponsableId()+"";
					 if(objeto.getProductoId()!=0)				query+= ", producto_id="+objeto.getProductoId()+"";	
					 		 
					 query+=" where id ="+objeto.getId();
					 
					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

		}	
	
	public static boolean updateWs(Ws objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String										query = "update ws set ";
					 if(objeto.getNombre()!=null)				query+= "nombre='"+objeto.getNombre()+"'";
					 if(objeto.getDescripcion()!=null)			query+= ", descripcion='"+objeto.getDescripcion()+"'";
					 if(objeto.getUrl()!=null)					query+= ", url='"+objeto.getUrl()+"'";
					 if(objeto.getMetodo()!=null)				query+= ", metodo='"+objeto.getMetodo()+"'";
					 if(objeto.getUsuario()!=null)				query+= ", usuario='"+objeto.getUsuario()+"'";
					 if(objeto.getPass()!=null)					query+= ", pass='"+objeto.getPass()+"'";
					 if(objeto.getIdClave()!=null)				query+= ", id_clave='"+objeto.getIdClave()+"'";
					 if(objeto.getIdValor()!=null)				query+= ", id_valor='"+objeto.getIdValor()+"'";
					 if(objeto.getWsTipoId()!=0)				query+= ", ws_tipo_id="+objeto.getWsTipoId()+"";	
					 //if(objeto.isBorrado()!=false)				query+= "borrado=\""+objeto.isBorrado()+"\"";	

					 query+=" where id ="+objeto.getId();
					 
					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

		}	
	
	public static boolean borradoWs(boolean flagBorrado){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
			 String query = "update ws set borrado=\""+flagBorrado+"\"";	
			 try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}		

	public static boolean updateEvidencia(Evidencia objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String										query = "update evidencia set ";
					 if(objeto.getNombre()!=null)			    query+= "nombre='"+objeto.getNombre()+"'";
					 if(objeto.getDescripcion()!=null)			query+= ", descripcion='"+objeto.getDescripcion()+"'";
					 if(objeto.getWsId()!=0)					query+= ", ws_id="+objeto.getWsId()+"";
					 //if(objeto.isBorrado()!=false)			query+= "borrado=\""+objeto.isBorrado()+"\"";	
					 
					 query+=" where id ="+objeto.getId();
					 
					 		 
					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

		}
	
	public static boolean borradoEvidencia(boolean flagBorrado){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
			 String query = "update evidencia set borrado=\""+flagBorrado+"\"";	
			 try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}		
	
	public static boolean updateWsTipo(WsTipo objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String										query = "update ws_tipo set ";
					 if(objeto.getNombre()!=null)			    query+= "nombre='"+objeto.getNombre()+"'";
					 if(objeto.getDescripcion()!=null)			query+= ", descripcion='"+objeto.getDescripcion()+"'";
					 //if(objeto.isBorrado()!=false)			query+= "borrado=\""+objeto.isBorrado()+"\"";	
					 
					 query+=" where id ="+objeto.getId();
					 		 
					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

		}
	
	public static boolean borradoWsTipo(boolean flagBorrado){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
			 String query = "update ws_tipo set borrado=\""+flagBorrado+"\"";	
			 try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}		
	
	public static boolean updateHitoHasBeneficiario(HitoHasBeneficiario objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String										query = "update hito_has_beneficiario set ";
					 if(objeto.getHitoId()!=0)					query+= "hito_id="+objeto.getHitoId()+"";
					 if(objeto.getHitoAccionId()!=0)			query+= ", hito_accion_id="+objeto.getHitoAccionId()+"";
					 if(objeto.getBeneficiarioId()!=0)			query+= ", beneficiario_id="+objeto.getBeneficiarioId()+"";
					 //if(objeto.isBorrado()!=false)			query+= "borrado=\""+objeto.isBorrado()+"\"";	
					 	
					 //query+=" where accion_id ="+objeto.getHitoId()+" AND hito_accion_id="+objeto.getHitoAccionId()+" AND beneficiario_id="+objeto.getBeneficiarioId();
					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

		}	
	
	public static boolean updateBeneficiarioTipo(BeneficiarioTipo objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

	  	 			String										query = "update beneficiario_tipo set ";
	  	 			if(objeto.getNombre()!=null)			    query+= "nombre='"+objeto.getNombre()+"'";
	  	 			if(objeto.getDescripcion()!=null)			query+= ", descripcion='"+objeto.getDescripcion()+"'";
	  	 			//if(objeto.isBorrado()!=false)			query+= "borrado=\""+objeto.isBorrado()+"\"";	
				 
	  	 			query+=" where id ="+objeto.getId();
					 
					 
					 
					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

		}	
	
	public static boolean updateAccionHasEtiqueta(AccionHasEtiqueta objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String										query = "update accion_has_etiqueta set ";
					 if(objeto.getAccionId()!=0)				query+= "accion_id="+objeto.getAccionId()+"";
					 if(objeto.getEtiquetaId()!=0)				query+= ", etiqueta_id="+objeto.getEtiquetaId()+"";
					 if(objeto.getProporcion()!=0)				query+= ", proporcion="+objeto.getProporcion()+"";
					 //if(objeto.isBorrado()!=false)			query+= "borrado=\""+objeto.isBorrado()+"\"";	
					 
					 query+=" where accion_id ="+objeto.getAccionId()+" AND etiqueta_id="+objeto.getEtiquetaId();
					 		 
					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

		}	
	
	public static boolean updateBeneficiario(Beneficiario objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String										query = "update beneficiario set ";
					 if(objeto.getNombre()!=null)				query+= "nombre='"+objeto.getNombre()+"'";
					 if(objeto.getDescripcion()!=null)			query+= ", descripcion='"+objeto.getDescripcion()+"'";
					 if(objeto.getBeneficiarioTipoId()!=0)		query+= ", beneficiario_tipo_id="+objeto.getBeneficiarioTipoId()+"";
					 //if(objeto.isBorrado()!=false)			query+= "borrado=\""+objeto.isBorrado()+"\"";
					 
					 query+=" where id ="+objeto.getId();
					 		 
					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

		}	
	
	public static boolean updateEtiqueta(Etiqueta objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String										query = "update etiqueta set ";
					 if(objeto.getNombre()!=null)			    query+= "nombre='"+objeto.getNombre()+"'";
					 if(objeto.getDescripcion()!=null)			query+= ", descripcion='"+objeto.getDescripcion()+"'";
					 //if(objeto.isBorrado()!=false)			query+= "borrado=\""+objeto.isBorrado()+"\"";	
					 
					 query+=" where id ="+objeto.getId();
					 		 
					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

		}		
	
	public static boolean updateBeneficiarioDetalle(BeneficiarioDetalle objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String											query = "update beneficiario_detalle set ";
					 if(objeto.getValor()!=null)					query+= "valor='"+objeto.getValor()+"'";
					 if(objeto.getBeneficiarioDetalleClavesId()!=0)	query+= ", beneficiario_detalle_claves_id="+objeto.getBeneficiarioDetalleClavesId()+"";
					 if(objeto.getBeneficiarioId()!=0)				query+= ", beneficiario_id="+objeto.getBeneficiarioId()+"";
					 		 
					 query+=" where id ="+objeto.getId();
	
					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

		}	
	
	
	public static boolean updateBeneficiarioDetalleClave(BeneficiarioDetalleClave objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String											query = "update beneficiario_detalle_clave set ";
					 if(objeto.getClave()!=null)					query+= "clave='"+objeto.getClave()+"'";
					 
					 query+=" where id ="+objeto.getId();
					 		 
					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

		}	
	
	public static boolean updateGeoPoligono(GeoPoligono objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String											query = "update geo_poligono set ";
					 if(objeto.getNombre()!=null)					query+= "nombre=\""+objeto.getNombre()+"\"";
					 if(objeto.getDescripcion()!=null)				query+= "descripcion=\""+objeto.getDescripcion()+"\"";
					 if(objeto.getGeo()!=null)						query+= "geo=\""+objeto.getGeo()+"\"";
					 if(objeto.getGeoPoligonoId()!=0)				query+= "geo_poligono_id=\""+objeto.getGeoPoligonoId()+"\"";
					 if(objeto.getGeoPoligonoTipoId()!=0)			query+= "geo_poligono_tipo_id=\""+objeto.getGeoPoligonoTipoId()+"\"";
					 //if(objeto.isBorrado()!=false)				query+= "borrado=\""+objeto.isBorrado()+"\"";	
					 		 
					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

		}
	
	public static boolean updateAccionHasGeoPoligono(AccionHasGeoPoligono objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String											query = "update accion_has_geo_poligono set ";
					 if(objeto.getAccionId()!=0)					query+= "accion_id="+objeto.getAccionId()+"";
					 if(objeto.getGeoPoligonoId()!=0)				query+= ", geo_poligono_id="+objeto.getGeoPoligonoId()+"";
					 if(objeto.getGeoPoligonoGeoPoligonoId()!=0)	query+= ", geo_poligono_geo_poligono_id="+objeto.getGeoPoligonoGeoPoligonoId()+"";
					 if(objeto.getProporcion()!=0)					query+= ", proporcion="+objeto.getProporcion()+"";
					 //if(objeto.isBorrado()!=false)				query+= "borrado=\""+objeto.isBorrado()+"\"";	
					 
					 query+=" where accion_id ="+objeto.getAccionId()+" AND geo_poligono_id="+objeto.getGeoPoligonoId()+" AND geo_poligono_geo_poligono_id="+objeto.getGeoPoligonoGeoPoligonoId();
		 
					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

		}	
	
	public static boolean updateGeoPoligonoTipo(GeoPoligonoTipo objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String											query = "update geo_poligono_tipo set ";
					 if(objeto.getNombre()!=null)					query+= "nombre='"+objeto.getNombre()+"'";
					 if(objeto.getDescripcion()!=null)				query+= ", descripcion='"+objeto.getDescripcion()+"'";
					 //if(objeto.isBorrado()!=false)				query+= "borrado=\""+objeto.isBorrado()+"\"";	
					 		 
					 query+=" where id ="+objeto.getId();
							 
					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

		}	
}