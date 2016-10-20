package py.gov.stp.tools;

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

public class SqlDelete {
	
	public static void deleteRespuestasViviendas(int nroFicha, int preguntaId){
	   	 Connection conect=ConnectionConfiguration.conectarFichaSocial();
	   	 Statement statement = null;
			 String 					query = "delete from respuestas_viviendas";
			
			 query+=" where nro_ficha='"+nroFicha+"' and pregunta_id="+preguntaId;

			try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			} catch (SQLException e) {e.printStackTrace();}
			
	   }
	
//
//	
//	//preguntar si esta bien solo recibir los parametro para el where o todos
//	public static void deleteCatalogoDestinatario(String id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "delete from catalogo_destinatario ";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 if (tipo_catalogo_destinatario_id!="")		query+= "tipo_catalogo_destinatario_id=\""+tipo_catalogo_destinatario_id+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id ="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteCatalogoDncp(String id, String objeto_de_gasto_id ){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "delete from catalogo_dncp ";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 if (anho!="")								query+= "anho=\""+anho+"\", ";
//			 if (numero_fila!="")						query+= "numero_fila=\""+numero_fila+"\", ";
//			 if (precio!="")							query+= "precio=\""+precio+"\", ";*/
//			 //if (objeto_de_gasto_id!="")				query+= "objeto_de_gasto_id=\""+objeto_de_gasto_id+"\", ";
//			 //query = query.substring(0, query.length()-2);
//			 query+="where id ="+id+" and objeto_de_gasto_id ="+objeto_de_gasto_id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteDemografia(String id, String tipo_demografica_id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "delete from demografia";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";*/
//			 //if (tipo_demografica_id!="")				query+= "tipo_demografica_id=\""+tipo_demografica_id+"\", ";
//			 /*if (abrev!="")								query+= "abrev=\""+abrev+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id ="+id+" and tipo_demografica_id="+tipo_demografica_id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteDepartamento(String id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "delete from departamento";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";*/
//			 //if (pais!="")								query+= "pais=\""+pais+"\", ";
//			 /*if (numero_fila!="")						query+= "numero_fila=\""+numero_fila+"\", ";
//			 if (abrev!="")								query+= "abrev=\""+abrev+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id ="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//
//	public static void deleteDiccionarioDato(String id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "delete from diccionario_dato";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 /*if (clase!="")								query+= "clase=\""+clase+"\", ";
//			 if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (titulo!="")							query+= "titulo=\""+titulo+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 if (instructivo!="")						query+= "instructivo=\""+instructivo+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id ="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteEjeEstrategico(String id, String plan_id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "delete from eje_estrategico";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";*/
//			 //if (plan_id!="")							query+= "plan_id=\""+plan_id+"\", ";
//			 //query = query.substring(0, query.length()-2);
//			 query+="where id ="+id+" and plan_id="+plan_id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteEntidad(String id, String nivel){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 				query = "delete from entidad ";
//			 //if (id!="") 			query+=" id =\""+id+"\", ";
//			 //if (nivel!="") 		query+=" nivel =\""+nivel+"\", ";
//			 /*if (descripcion!="") 	query+=" descripcion =\""+descripcion+"\", ";
//			 if (abrev!="") 		query+=" abrev =\""+abrev+"\", ";
//			 if (sigla!="") 		query+=" sigla =\""+sigla+"\", ";
//			 if (baseLegal!="") 	query+=" base_legal =\""+baseLegal+"\", ";
//			 if (mision!="") 		query+=" mision =\""+mision+"\", ";
//			 if (vision!="") 		query+=" vision =\""+vision+"\", ";
//			 if (politica!="") 		query+=" politica =\""+politica+"\", ";
//			 if (objetivo!="") 		query+=" objetivo =\""+objetivo+"\", ";
//			 if (diagnostico!="")	query+=" diagnostico =\""+diagnostico+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+=" where id = "+id+" and nivel_id = "+nivel;
//
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//			
//	   }
//	
//	public static void deleteEstrategia(String id, String eje_estrategico_id, String linea_transversal_id, String plan){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "delete from estrategia ";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 if (numero_fila!="")						query+= "numero_fila=\""+numero_fila+"\", ";*/
//			 //if (eje_estrategico_id!="")				query+= "eje_estrategico_id=\""+eje_estrategico_id+"\", ";
//			 //if (linea_transversal_id!="")			query+= "linea_transversal_id=\""+linea_transversal_id+"\", ";
//			 //if (plan!="")								query+= "plan=\""+plan+"\", ";
//			 //query = query.substring(0, query.length()-2);
//			 query+="where id ="+id+" and eje_estrategico_id="+eje_estrategico_id+" linea_transversal_id="+linea_transversal_id+" and plan="+plan;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteEstrategiaHasObjetivo(String id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "delete from estrategia_has_objetivo ";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 /*if (estrategia_id!="")						query+= "estrategia_id=\""+estrategia_id+"\", ";
//			 if (estrategia_eje_estrategico_id!="")		query+= "estrategia_eje_estrategico_id=\""+estrategia_eje_estrategico_id+"\", ";
//			 if (estrategia_linea_transversal_id!="")	query+= "estrategia_linea_transversal_id=\""+estrategia_linea_transversal_id+"\", ";
//			 if (objetivo_id!="")						query+= "objetivo_id=\""+objetivo_id+"\", ";
//			 if (objetivo_tipo_objetivo_id!="")			query+= "objetivo_tipo_objetivo_id=\""+objetivo_tipo_objetivo_id+"\", ";
//			 if (es_principal!="")						query+= "es_principal=\""+es_principal+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id ="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteFuenteFinanciamiento(String id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "delete from fuente_financiamiento ";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 if (anho!="")								query+= "anho=\""+anho+"\", ";
//			 if (numero_fila!="")						query+= "numero_fila=\""+numero_fila+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id ="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteFuenteVerificacion(String id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "delete from fuente_verificacion";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 if (abrev!="")								query+= "abrev=\""+abrev+"\", ";
//			 if (uri!="")								query+= "uri=\""+uri+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id ="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteFuncional(String id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "delete from funcional";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 /*if (numero_fila!="")						query+= "numero_fila=\""+numero_fila+"\", ";
//			 if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 if (abrev!="")								query+= "abrev=\""+abrev+"\", ";
//			 if (es_imputable!="")						query+= "es_imputable=\""+es_imputable+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id ="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteIndicador(String id, String tipo_indicador_id, String metodo_calculo_id, String unidad_medida_id, String desagregacion_tipo_zona_geografica_id, String tipo_demografica_id, String fuente_verificacion_id, String objetivo_id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 											query = "delete from indicador";
//			 //if (id!="")										query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")									query+= "nombre=\""+nombre+"\", ";	
//			 if (descripcion!="")								query+= "descripcion=\""+descripcion+"\", ";*/	
//			 //if (tipo_indicador_id!="")							query+= "tipo_indicador_id=\""+tipo_indicador_id+"\", ";
//			 //if (metodo_calculo_id!="")							query+= "metodo_calculo_id=\""+metodo_calculo_id+"\", ";	
//			 //if (unidad_medida_id!="")							query+= "unidad_medida_id=\""+unidad_medida_id+"\", ";
//			 //if (frecuencia_meses!="")							query+= "frecuencia_meses=\""+frecuencia_meses+"\", ";	
//			 //if (desagregacion_tipo_zona_geografica_id!="")		query+= "desagregacion_tipo_zona_geografica_id=\""+desagregacion_tipo_zona_geografica_id+"\", ";	
//			 //if (tipo_demografica_id!="")						query+= "tipo_demografica_id=\""+tipo_demografica_id+"\", ";
//			 //if (fuente_verificacion_id!="")					query+= "fuente_verificacion_id=\""+fuente_verificacion_id+"\", ";
//			 //if (observaciones!="")								query+= "observaciones=\""+observaciones+"\", ";
//			 //if (objetivo_id!="")								query+= "objetivo_id=\""+objetivo_id+"\", ";	
//			 //query = query.substring(0, query.length()-2);
//			 query+=" where id = "+id+" and objetivo_id="+objetivo_id+" and tipo_indicador_id="+tipo_indicador_id+" and metodo_calculo_id="+metodo_calculo_id+" and unidad_medida_id="+unidad_medida_id+" and desagregacion_tipo_zona_geografica_id="+desagregacion_tipo_zona_geografica_id+" and tipo_demografica_id="+tipo_demografica_id+" and fuente_verificacion_id="+fuente_verificacion_id;		
//			 
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteLineaTransversal(String id, String plan_id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "delete from linea_transversal";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 if (abrev!="")								query+= "abrev=\""+abrev+"\", ";*/
//			 //if (plan_id!="")							query+= "plan_id=\""+plan_id+"\", ";
//			 //query = query.substring(0, query.length()-2);
//			 query+="where id ="+id+" and plan_id="+plan_id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteMes(String id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "delete from mes ";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (abrev!="")								query+= "abrev=\""+abrev+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id ="+id;
//					
//			try {  
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteMeta(String id, String indicador_id, String zona_geografica_id, String demografia_id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 						query = "delete from meta";
//			 //if (id!="")					query+= "id=\""+id+"\", ";
//			 /*if (cantidad!="")				query+= "cantidad=\""+cantidad+"\", ";	
//			 if (vencimiento!="")			query+= "vencimiento=\""+vencimiento+"\", ";*/
//			 //if (indicador_id!="")		query+= "indicador_id=\""+indicador_id+"\", ";
//			 //if (zona_geografica_id!="")	query+= "zona_geografica_id=\""+zona_geografica_id+"\", ";
//			 //if (demografia_id!="")			query+= "demografia_id=\""+demografia_id+"\", ";	
//			 //query = query.substring(0, query.length()-2);
//			 query+=" where id = "+id+" and indicador_id="+indicador_id+" and zona_geografica_id="+zona_geografica_id+" demografia_id="+demografia_id;
//
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteMetodoCalculo(String id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "delete from metodo_calculo ";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 if (clase!="")								query+= "clase=\""+clase+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id ="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteModulo(String id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "delete from modulo";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id ="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteModuloHasPermiso(String role_id, String modulo_id, String permiso_id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "delete from modulo_has_permiso";
//			 //if (role_id!="")							query+= "role_id=\""+role_id+"\", ";
//			 //if (modulo_id!="")							query+= "modulo_id=\""+modulo_id+"\", ";
//			 /*if (permiso_id!="")							query+= "permiso_id=\""+permiso_id+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where role_id="+role_id+" and modulo_id="+modulo_id+"and permiso_id"+permiso_id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteNivel(String id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "delete from nivel";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 /*if (numero_fila!="")						query+= "numero_fila=\""+numero_fila+"\", ";
//			 if (cod_nivel!="")							query+= "cod_nivel=\""+cod_nivel+"\", ";
//			 if (anho!="")								query+= "anho=\""+anho+"\", ";
//			 if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 if (abrev!="")								query+= "abrev=\""+abrev+"\", ";
//			 if (es_imputable!="")						query+= "es_imputable=\""+es_imputable+"\", ";
//			 if (fecha_creacion!="")					query+= "fecha_creacion=\""+fecha_creacion+"\", ";
//			 if (verion!="")							query+= "verion=\""+verion+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteObjetivo(String id, String tipo_objetivo_id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 					query = "delete from objetivo";
//			 //if (id!="")				query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")			query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")		query+= "descripcion=\""+descripcion+"\", ";
//			 //if (tipo_objetivo_id!="")	query+= "tipo_objetivo_id=\""+tipo_objetivo_id+"\", ";
//			 query = query.substring(0, query.length()-2);*/
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
//	public static void deleteObjetoDeGasto(String id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "delete from objeto_de_gasto";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 if (abrev!="")								query+= "abrev=\""+abrev+"\", ";
//			 if (es_imputable!="")						query+= "es_imputable=\""+es_imputable+"\", ";
//			 if (anho!="")								query+= "anho=\""+anho+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteOrganismoFinanciador(String id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "delete from organismo_financiador";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 if (numero_fila!="")						query+= "numero_fila=\""+numero_fila+"\", ";
//			 if (anho!="")								query+= "anho=\""+anho+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deletePermiso(String id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "delete from permiso";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deletePlan(String id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "delete from plan";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 if (detalle!="")							query+= "detalle=\""+detalle+"\", ";
//			 if (entidad_responsable!="")				query+= "entidad_responsable=\""+entidad_responsable+"\", ";
//			 if (fecha_incio!="")						query+= "fecha_incio=\""+fecha_incio+"\", ";
//			 if (fecha_fin!="")							query+= "fecha_fin=\""+fecha_fin+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteProducto(String id, String unidad_medida_id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "delete from producto ";
//			 //if (id!="")								query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 if (clase!="")								query+= "clase=\""+clase+"\", ";
//			 //if (unidad_medida_id!="")				query+= "unidad_medida_id=\""+unidad_medida_id+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id="+id+" and unidad_medida_id="+unidad_medida_id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteProductoPresupuestoMeta(String id, String catalogo_destinatario_id, String departamento_id, String producto_presupusto_id, String producto_id, String unidad_medida_id, String proyecto_id, String subprograma_id, String programa_id, String tipo_presupuetso_id, String entidad_id, String nivel_id ){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 							query = "delete from producto_presupuesto_meta ";
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
//			 /*if (cantidad!="")					query+= "cantidad=\""+cantidad+"\", ";	
//			 if (catalogo_destinatario_id!="")	query+= "catalogo_destinatario_id=\""+catalogo_destinatario_id+"\", ";
//			 if (unidad_medida_id!="")			query+= "unidad_medida_id=\""+unidad_medida_id+"\", ";
//			
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id="+id; //agregue este campo que no esta en el update
//			 query+=" where entidad_id = "+entidad_id;
//			 query+=" and nivel_id = "+nivel_id;
//			 query+=" and tipo_presupuetso_id = "+tipo_presupuetso_id;
//			 query+=" and programa_id = "+programa_id;
//			 query+=" and subprograma_id = "+subprograma_id;
//			 query+=" and proyecto_id = "+proyecto_id;
//			 query+=" and producto_id = "+producto_id;
//			 query+=" and producto_presupuesto_id = "+producto_presupusto_id;
//			 query+=" and departamento_id = "+departamento_id;
//			 query+=" and catalogo_destinatario_id = "+catalogo_destinatario_id;//agregue este campo que no esta en el update
//			 query+="and unidad_medida_id="+unidad_medida_id;//agregue este campo que no esta en el update
//			 
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteProductoPresupuesto(String id, String producto_id, String producto_unidad_medida_id, String proyecto_id, String proyecto_subprograma_id, String proyecto_subprograma_programa_id, String proyecto_subprograma_programa_tipo_presupuesto_id, String proyecto_subprograma_programa_entidad_id, String proyecto_subprograma_programa_entidad_nivel_id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 														query = "delete from producto_presupusto ";
//			 //if (id!="")													query+= "id=\""+id+"\", ";
//			 /*if (numero_fila!="")											query+= "numero_fila=\""+numero_fila+"\", ";
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
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id="+id+" and producto_id="+producto_id+" and producto_unidad_medida_id="+producto_unidad_medida_id+" and proyecto_id="+proyecto_id+" and proyecto_subprograma_id="+proyecto_subprograma_id+" and proyecto_subprograma_programa_id="+proyecto_subprograma_programa_id+" and proyecto_subprograma_programa_tipo_presupuesto_id="+proyecto_subprograma_programa_tipo_presupuesto_id+" and proyecto_subprograma_programa_entidad_id="+proyecto_subprograma_programa_entidad_id+" and proyecto_subprograma_programa_entidad_nivel_id="+proyecto_subprograma_programa_entidad_nivel_id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deletePrograma(String id, String tipo_presupuesto_id, String entidad_id, String entidad_nivel_id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 						query = "delete from programa ";
//			 //if (id!="")					query+= "id=\""+id+"\", ";
//			 //if (tipo_presupuesto_id!="")	query+= "tipo_presupuesto_id=\""+tipo_presupuesto_id+"\", ";
//			 //if (entidad_nivel_id!="")	query+= "entidad_nivel_id=\""+entidad_nivel_id+"\", ";
//			 /*if (numeroFila!="")			query+= "numeroFila=\""+numeroFila+"\", ";
//			 if (anho!="")					query+= "anho=\""+anho+"\", ";
//			 if (cod_programa!="")			query+= "cod_programa=\""+cod_programa+"\", ";
//			 if (nombre!="")				query+= "nombre=\""+nombre+"\", ";
//			 if (abrev!="")					query+= "abrev=\""+abrev+"\", ";
//			 if (descripcion!="")			query+= "descripcion=\""+descripcion+"\", ";
//			 if (objetivo!="")				query+= "objetivo=\""+objetivo+"\", ";
//			 if (diagnostico!="")			query+= "diagnostico=\""+diagnostico+"\", ";
//			 if (base_legal!="")			query+= "base_legal=\""+base_legal+"\", ";
//			 if (resultado!="")				query+= "resultado=\""+resultado+"\", ";
//			 if (codigoDepartamento!="")	query+= "codigoDepartamento=\""+codigoDepartamento+"\", ";
//			 //if (entidad_id!="")			query+= "entidad_id=\""+entidad_id+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id ="+id+" and tipo_presupuesto_id ="+tipo_presupuesto_id+" and entidad_id="+entidad_id+" and entidad_nivel_id ="+entidad_nivel_id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteProgramatico(String id, String tipo_programatico_id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 									query = "delete from programatico ";
//			 /*//if (id!="")								query+= "id=\""+id+"\", ";
//			 if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 //if (tipo_programatico_id!="")			query+= "tipo_programatico_id=\""+tipo_programatico_id+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id="+id+" and tipo_programatico_id="+tipo_programatico_id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteProgramaticoHasObjetivo(String programatico_id, String programatico_tipo_programatico_id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 										query = "delete from programatico_has_objetivo ";
//			 //if (programatico_id!="")						query+= "programatico_id=\""+programatico_id+"\", ";
//			 //sacar el where a programatico_tipo_programatico_id
//			 /*if (programatico_tipo_programatico_id!="")	query+= "programatico_tipo_programatico_id=\""+programatico_tipo_programatico_id+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where programatico_id="+programatico_id+" and programatico_tipo_programatico_id="+programatico_tipo_programatico_id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteProyecto(String id, String subprograma_id, String subprograma_programa_id, String subprograma_programa_tipo_presupuesto_id, String subprograma_programa_entidad_id, String subprograma_programa_entidad_nivel_id, String unidad_responsable_id, String funcional_id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 												query = "delete from proyecto ";
//			 //if (id!="")											query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")										query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")									query+= "descripcion=\""+descripcion+"\", ";
//			 if (abrev!="")											query+= "abrev=\""+abrev+"\", ";
//			 if (anho!="")											query+= "anho=\""+anho+"\", ";
//			 //if (subprograma_id!="")								query+= "subprograma_id=\""+subprograma_id+"\", ";
//			 //if (subprograma_programa_id!="")						query+= "subprograma_programa_id=\""+subprograma_programa_id+"\", ";
//			 //if (subprograma_programa_tipo_presupuesto_id!="")	query+= "subprograma_programa_tipo_presupuesto_id=\""+subprograma_programa_tipo_presupuesto_id+"\", ";
//			 //if (subprograma_programa_entidad_id!="")				query+= "subprograma_programa_entidad_id=\""+subprograma_programa_entidad_id+"\", ";
//			 //if (subprograma_programa_entidad_nivel_id!="")		query+= "subprograma_programa_entidad_nivel_id=\""+subprograma_programa_entidad_nivel_id+"\", ";
//			 if (unidad_responsable_id!="")							query+= "unidad_responsable_id=\""+unidad_responsable_id+"\", ";
//			 if (funcional_id!="")									query+= "funcional_id=\""+funcional_id+"\", ";
//			 if (diagnostico!="")									query+= "diagnostico=\""+diagnostico+"\", ";
//			 if (resultado_esperado!="")							query+= "resultado_esperado=\""+resultado_esperado+"\", ";
//			 if (codigo_departamento!="")							query+= "codigo_departamento=\""+codigo_departamento+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+=" where id = "+id+" and subprograma_id = "+subprograma_id+" and subprograma_programa_id="+subprograma_programa_id+", and subprograma_programa_tipo_presupuesto_id="+subprograma_programa_tipo_presupuesto_id+", and subprograma_programa_entidad_id="+subprograma_programa_entidad_id+" and subprograma_programa_entidad_nivel_id="+subprograma_programa_entidad_nivel_id+"and unidad_responsable_id="+unidad_responsable_id+"and funcional_id="+funcional_id;
//
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//			
//	   }
//	
//	public static void deleteProyectoSnip(String id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 				query = "delete from proyecto_snip ";
//			 //if (id!="")			query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")		query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")	query+= "descripcion=\""+descripcion+"\", ";
//			 if (estado!="")		query+= "estado=\""+estado+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteProyectoSnipAutorizado(String id, String entidad_id, String entidad_nivel_id, String proyecto_snip_id, String organismo_financiador_id, String fuente_financiamiento_id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 								query = "delete from proyecto_snip_autorizado ";
//			 //if (id!="")							query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")						query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")					query+= "descripcion=\""+descripcion+"\", ";
//			 if (anho!="")							query+= "anho=\""+anho+"\", ";
//			 if (monto!="")							query+= "monto=\""+monto+"\", ";
//			 //if (entidad_id!="")					query+= "entidad_id=\""+entidad_id+"\", ";
//			 //if (entidad_nivel_id!="")			query+= "entidad_nivel_id=\""+entidad_nivel_id+"\", ";
//			 //if (proyecto_snip_id!="")			query+= "proyecto_snip_id=\""+proyecto_snip_id+"\", ";
//			 //if (organismo_financiador_id!="")	query+= "organismo_financiador_id=\""+organismo_financiador_id+"\", ";
//			 //if (fuente_financiamiento_id!="")	query+= "fuente_financiamiento_id=\""+fuente_financiamiento_id+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id="+id+" and entidad_id="+entidad_id+" and entidad_nivel_id="+entidad_nivel_id+" and proyecto_snip_id="+proyecto_snip_id+" and organismo_financiador_id="+organismo_financiador_id+" and fuente_financiamiento_id="+fuente_financiamiento_id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteRole(String id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 				query = "delete from role ";
//			 //if (id!="")			query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")		query+= "nombre=\""+nombre+"\", ";
//			 query = query.substring(0, query.length()-2);
//			 query+="where id="+id;*/
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteSubPrograma(String id, String programa_id, String programa_tipo_presupuesto_id, String programa_entidad_id, String programa_entidad_nivel_id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//	    	 
//			 String										query = "delete from subprograma ";
//			 //if (programa_id!="")						query+= "programa_id=\""+programa_id+"\", ";
//			 //if (programa_tipo_presupuesto_id!="")	query+= "programa_tipo_presupuesto_id=\""+programa_tipo_presupuesto_id+"\", ";
//			 //if (programa_entidad_id!="")				query+= "programa_entidad_id=\""+programa_entidad_id+"\", ";	
//			 //if (programa_entidad_nivel_id!="")		query+= "programa_entidad_nivel_id=\""+programa_entidad_nivel_id+"\", ";	
//			 /*if (anho!="")								query+= "anho=\""+anho+"\", ";
//			 if (nombre!="")							query+= "nombre=\""+nombre+"\", ";
//			 if (abrev!="")								query+= "abrev=\""+abrev+"\", ";
//			 if (descripcion!="")						query+= "descripcion=\""+descripcion+"\", ";
//			 if (objetivo!="")							query+= "objetivo=\""+objetivo+"\", ";
//			 if (codigo_departamento!="")				query+= "codigo_departamento=\""+codigo_departamento+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id ="+id+" and programa_id = "+programa_id+" and programa_tipo_presupuesto_id="+programa_tipo_presupuesto_id+", and programa_entidad_nivel_id="+programa_entidad_nivel_id+" and programa_entidad_id="+programa_entidad_id;
//			
//			 try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//			
//	   }
//	
//	public static void deleteTipoCatalogoDestinatario(String id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 				query = "delete from tipo_catalogo_destinatario ";
//			 //if (id!="")			query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")		query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")	query+= "descripcion=\""+descripcion+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteTipoDemografica(String id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 				query = "delete from tipo_demografica ";
//			 //if (id!="")			query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")		query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")	query+= "descripcion=\""+descripcion+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteTipoIndicador(String id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 				query = "delete from tipo_indicador ";
//			 //if (id!="")			query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")		query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")	query+= "descripcion=\""+descripcion+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteTipoObjetivo(String id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 				query = "delete from tipo_objetivo ";
//			 //if (id!="")			query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")		query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")	query+= "descripcion=\""+descripcion+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteTipoPresupuesto(String id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 				query = "delete from tipo_presupuesto ";
//			 //if (id!="")			query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")		query+= "nombre=\""+nombre+"\", ";
//			 if (abrev!="")			query+= "abrev=\""+abrev+"\", ";
//			 if (descripcion!="")	query+= "descripcion=\""+descripcion+"\", ";
//			 if (anho!="")			query+= "anho=\""+anho+"\", ";
//			 if (numero_fila!="")	query+= "numero_fila=\""+numero_fila+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteTipoProgramatico(String id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 				query = "delete from tipo_programatico ";
//			 //if (id!="")			query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")		query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")	query+= "descripcion=\""+descripcion+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteTipoZonaGeografica(String id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 				query = "delete from tipo_zona_geografica ";
//			 //if (id!="")			query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")		query+= "nombre=\""+nombre+"\", ";
//			 if (descipcion!="")	query+= "descipcion=\""+descipcion+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteUnidadJerarquica(String id, String entidad_id, String entidad_nivel_id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 						query = "delete from unidad_jerarquica ";
//			 //if (id!="")					query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")				query+= "nombre=\""+nombre+"\", ";
//			 if (descipcion!="")			query+= "descipcion=\""+descipcion+"\", ";
//			 //if (entidad_id!="")			query+= "entidad_id=\""+entidad_id+"\", ";
//			 //if (entidad_nivel_id!="")	query+= "entidad_nivel_id=\""+entidad_nivel_id+"\", ";
//			 if (anho!="")					query+= "anho=\""+anho+"\", ";
//			 if (numero_fila!="")			query+= "numero_fila=\""+numero_fila+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id="+id+" and entidad_id="+entidad_id+" and entidad_nivel_id="+entidad_nivel_id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteUnidadMedida(String id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 						query = "delete from unidad_medida ";
//			 //if (id!="")					query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")				query+= "nombre=\""+nombre+"\", ";
//			 if (abrev!="")					query+= "abrev=\""+abrev+"\", ";
//			 if (simbolo!="")				query+= "simbolo=\""+simbolo+"\", ";
//			 if (descripcion!="")			query+= "descripcion=\""+descripcion+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id="+id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteUnidadResponsable(String id, String entidad_id, String entidad_nivel_id, String unidad_jerarquica_id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 							query = "delete from unidad_responsable ";
//			 //if (id!="")						query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")					query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")				query+= "descripcion=\""+descripcion+"\", ";
//			 if (abrev!="")						query+= "abrev=\""+abrev+"\", ";
//			 if (numero_fila!="")				query+= "numero_fila=\""+numero_fila+"\", ";
//			 //if (entidad_id!="")				query+= "entidad_id=\""+entidad_id+"\", ";
//			 //if (entidad_nivel_id!="")		query+= "entidad_nivel_id=\""+entidad_nivel_id+"\", ";
//			 //if (unidad_jerarquica_id!="")	query+= "unidad_jerarquica_id=\""+unidad_jerarquica_id+"\", ";
//			 if (anho!="")						query+= "anho=\""+anho+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id="+id+" and entidad_id="+entidad_id+" and entidad_nivel_id="+entidad_nivel_id+" and unidad_jerarquica_id="+unidad_jerarquica_id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteUsuario(String id, String role_id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 							query = "delete from usuario ";
//			 //if (id!="")						query+= "id=\""+id+"\", ";
//			 /*if (correo!="")					query+= "correo=\""+correo+"\", ";
//			 if (passwd!="")					query+= "passwd=\""+passwd+"\", ";
//			 if (last_login!="")				query+= "last_login=\""+last_login+"\", ";
//			 //if (entidad!="")					query+= "entidad=\""+entidad+"\", ";
//			 //if (role_id!="")					query+= "role_id=\""+role_id+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id="+id+" and role_id="+role_id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteZonaGeografica(String id, String tipo_zona_geografica_id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 							query = "delete from zona_geografica ";
//			 //if (id!="")						query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")					query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")				query+= "descripcion=\""+descripcion+"\", ";
//			 if (abrev!="")						query+= "abrev=\""+abrev+"\", ";
//			 //if (tipo_zona_geografica_id!="")	query+= "tipo_zona_geografica_id=\""+tipo_zona_geografica_id+"\", ";
//			 if (cod_geo_unif!="")				query+= "cod_geo_unif=\""+cod_geo_unif+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id="+id+" and tipo_zona_geografica_id="+tipo_zona_geografica_id;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	
//	public static void deleteEstructuraProgramatica(String id, String anho, String nivel, String entidad, String tipo, String programa, String subprograma, String proyecto, String funcional ){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 							query = "delete from estructura_programatica ";
//			 //if (id!="")						query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")					query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")				query+= "descripcion=\""+descripcion+"\", ";
//			 if (abrev!="")						query+= "abrev=\""+abrev+"\", ";
//			 //if (tipo_zona_geografica_id!="")	query+= "tipo_zona_geografica_id=\""+tipo_zona_geografica_id+"\", ";
//			 if (cod_geo_unif!="")				query+= "cod_geo_unif=\""+cod_geo_unif+"\", ";
//			 query = query.substring(0, query.length()-2);*/
//			 query+="where id="+id+" and anho="+anho+"and nivel="+nivel+"and entidad="+entidad+"and tipo="+tipo+"and programa"+programa+"and programa="+subprograma+"and proyecto"+proyecto+"and funcional="+funcional;
//					
//			try {
//				statement=conect.createStatement();
//				statement.execute(query);
//			    conect.close();
//			} catch (SQLException e) {e.printStackTrace();}
//	   }
//	public static void deleteResultado(String id, String tipo_objetivo_id){
//	   	 Connection conect=ConnectionConfiguration.conectar();
//	   	 Statement statement = null;
//			 String 					query = "update objetivo set borrado =1";
//			 //if (id!="")				query+= "id=\""+id+"\", ";
//			 /*if (nombre!="")			query+= "nombre=\""+nombre+"\", ";
//			 if (descripcion!="")		query+= "descripcion=\""+descripcion+"\", ";
//			 //if (tipo_objetivo_id!="")	query+= "tipo_objetivo_id=\""+tipo_objetivo_id+"\", ";
//			 query = query.substring(0, query.length()-2);*/
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
	
}
