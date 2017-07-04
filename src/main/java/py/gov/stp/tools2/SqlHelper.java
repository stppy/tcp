package py.gov.stp.tools2;
import py.gov.stp.tools2.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.xml.datatype.XMLGregorianCalendar;

/**
 * 	@author DGTIC-STP
 *  @email  dgtic@stp.gov.py 
 */
public class SqlHelper {
	public static Connection conectar(){
		 Connection con = null;
	        Statement st = null;
	        ResultSet rs = null;
	        try {Class.forName("com.postgres.jdbc.Driver");}
	        catch (ClassNotFoundException e) {e.printStackTrace();}
	        String url = "";
	        String user = "root";
	        String password = "postgres";

	        try {con = DriverManager.getConnection("jdbc:postgres://pg02.stp.gov.py/stp_crm2", "bpm", "cybiraconsulting2");}
	        catch (SQLException ex) {
	            Logger lgr = Logger.getLogger(SqlHelper.class.getName());
	            lgr.log(Level.SEVERE, ex.getMessage(), ex);
	        } 
	        return con;
	}
    public static void main() {
    		
       
//    }
//    public static void insertIndicadores(int id, String nombre, String descripcion, int tipo_indicador_id, int metodo_calculo_id, int frecuencia_meses, int desagregacion_tipo_zona_geografica_id, int tipo_demografica_id, int fuente_verficacion_id, String observaciones, int objetivo_id){
//   	 Connection conect=conectar();
//		 String query = " insert into indicador (id, nombre, descripcion, tipo_indicador_id, metido_calculo_id, frecuencia_meses, desagregacion_tipo_zona_geografica_id, tipo_demografica_id, fuente_verficacion_id, observaciones, objetivo_id)"
//			        + " values (?,?,?,?,?,?,?,?,?,?)";
//		try {
//			Timestamp timestamp = new Timestamp(new Date().getTime());
//			PreparedStatement preparedStmt;
//			preparedStmt = conect.prepareStatement(query);
//			preparedStmt.setInt (1, id);
//			preparedStmt.setString (2, nombre);
//		    preparedStmt.setString (3, descripcion);
//		    preparedStmt.setInt	(4, tipo_indicador_id);
//		    preparedStmt.setInt(5, metodo_calculo_id);
//		    preparedStmt.setInt(6, frecuencia_meses);
//		    preparedStmt.setInt(7, desagregacion_tipo_zona_geografica_id);
//		    preparedStmt.setInt(8, tipo_demografica_id);
//		    preparedStmt.setInt(9, fuente_verficacion_id);
//		    preparedStmt.setString(10, observaciones);
//		    preparedStmt.setInt(11, objetivo_id);
//		    preparedStmt.execute();
//		    conect.close();
//		} catch (SQLException e) {e.printStackTrace();}
//		
//   }
//    
//    public static void insertNiveles(int cod_nivel, int numeroFila, int anio, int nivel, String nombreNivel, String abrevNivel, String esImputable, int version){
//    	 Connection conect=conectar();
//		 String query = " insert into nivel (id, anho, numero_fila, nombre, abrev, es_imputable, fecha_creacion)"
//			        + " values (?,?,?,?,?,?,?)";
//		try {
//			Timestamp timestamp = new Timestamp(new Date().getTime());
//			PreparedStatement preparedStmt;
//			preparedStmt = conect.prepareStatement(query);
//			preparedStmt.setInt (1, cod_nivel);
//			preparedStmt.setInt (2, anio);
//		    preparedStmt.setInt (3, numeroFila);
//		    preparedStmt.setString	(4, nombreNivel);
//		    preparedStmt.setString(5, abrevNivel);
//		    preparedStmt.setString    (6, esImputable);
//		    preparedStmt.setTimestamp    (7, timestamp);
//		   // preparedStmt.setInt (8, version);
//		    preparedStmt.execute();
//		    conect.close();
//		} catch (SQLException e) {e.printStackTrace();}
//		
//    }
//    public static void insertTpoPrograma(int codTipoPrograma,  int numero_fila, int anio, String nombreTipoPrograma, String abrev){
//   	 Connection conect=conectar();
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
//      	 Connection conect=conectar();
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
//    public static void insertEntidades(int numeroFila, int anio, int nivel, int entidad, String nombreEntidad, String abrevEntidad, String siglaEntidad, String base_legal, String mision, String politica, String objetivo, String diagnostico, String ruc){
//   	 Connection conect=conectar();
//		 String query = " insert into entidad (id, nombre, anho, nivel_id, abrev, sigla, fecha_creacion, base_legal, mision, politica, objetivo, diagnostico, version, numero_fila, ruc)"
//			        + " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
//		    preparedStmt.setString (15, ruc);
//		    preparedStmt.execute();
//		    conect.close();
//		} catch (SQLException e) {e.printStackTrace();}
//	
//   }
//    
//    public static void insertUnidadJerarquica(int codigoUje,  String nombre, String descripcion,  int entidad, int nivel, int anho, int numero_fila){
//     	 Connection conect=conectar();
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
//      	 Connection conect=conectar();
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
//     	 Connection conect=conectar();
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
//    	 Connection conect=conectar();
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
//   	 Connection conect=conectar();
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
//   	 Connection conect=conectar();
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
//    public static void insertProyectoSnip(int id, String nombre, int estado){
//      	 Connection conect=conectar();
//   		 String query = " insert into proyecto_snip (id,nombre,estado)"
//   			        + " values (?,?,?)";
//   		try {
//   			
//   			PreparedStatement preparedStmt;
//   			preparedStmt = conect.prepareStatement(query);
//   			preparedStmt.setInt (1, id);
//   			preparedStmt.setString (2, nombre);
//   			preparedStmt.setInt (3, estado);
//   		    preparedStmt.execute();
//   		    conect.close();
//   		} catch (SQLException e) {e.printStackTrace();}
//      }
//    public static void insertEjePorPlan(int numero_fila, int plan_id, int id, String nombre, String descripcion){
//     	 Connection conect=conectar();
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
//     	 Connection conect=conectar();
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
//  			preparedStmt.setDouble(8, 0);
//  		    preparedStmt.execute();
//  		    conect.close();
//  		} catch (SQLException e) {e.printStackTrace();}
//     }
//    public static void insertFuncionales(int numero_fila, int id, String nombre, String abrev, String es_imputable){
//     	 Connection conect=conectar();
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
//    	 Connection conect=conectar();
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
//   	 Connection conect=conectar();
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
//      	 Connection conect=conectar();
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
//     	 Connection conect=conectar();
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
//    	 Connection conect=conectar();
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
//   	 Connection conect=conectar();
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
//		} catch (SQLException e) {
//			e.printStackTrace();}
//   }
//    public static void insertSubrogramas(int numero_fila,int anho,int programa_entidad_nivel_id,int programa_entidad_id,int programa_tipo_presupuesto_id,int programa_id,int id,String nombre,String abrev,String descripcion,String objetivo,int codigo_departamento){
//      	 Connection conect=conectar();
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
//     	 Connection conect=conectar();
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
//  		} catch (SQLException e) 
//
//  		
//  		
//  		{e.printStackTrace();}
//     }
//    
//    public static void insertCatalogoProductoMeta(int id,String nombre,String descripcion, String clase ,int unidad_medida){
//   	 /*clase y descripcion en producto*/
//   	 /* ni presupuesto ni meta */
//   	Connection conect=conectar();
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
//    public static void insertProductosPresupuesto(int proyecto_subprograma_programma_entidad_nivel_id,int proyecto_subprograma_programma_entidad_id,int proyecto_subprograma_programma_tipo_presupuesto_id, int proyecto_subprograma_programma_id ,int proyecto_subprograma_id,int proyecto_id,int id,int version, int producto_unidad_medida_id, int anho, int numero_fila){
//    	 /*clase y descripcion en producto*/
//    	 /* metas en propducto_presupesto_meta */
//    	Connection conect=conectar();
// 		 String query = " insert into producto_presupusto (proyecto_subprograma_programa_entidad_nivel_id,proyecto_subprograma_programa_entidad_id,proyecto_subprograma_programa_tipo_presupuesto_id,proyecto_subprograma_programa_id,proyecto_subprograma_id,proyecto_id,id,version,producto_unidad_medida_id,producto_id, anho, numero_fila)"
// 			        + " values (?,?,?,?,?,?,?,?,?,?,?,?)";
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
// 			preparedStmt.setInt (10, id);
// 			preparedStmt.setInt (11, anho);
// 			preparedStmt.setInt (12, numero_fila);
// 		    preparedStmt.execute();
// 		    conect.close();
// 		  
// 		} catch (SQLException e) {e.printStackTrace();}
//    }
//    public static void insertProductosPresupuestoMeta(int nivel,int entidad,int tipo, int programa ,int subprograma,int proyecto,int producto, int producto_presupuesto_id, int unidad_medida, int anho, int mes, double cantidad){
//   	 /*clase y descripcion en producto*/
//   	 /* metas en propducto_presupesto_meta */
//   	Connection conect=conectar();
//		 String query = " insert into producto_presupuesto_meta (nivel_id,entidad_id,tipo_presupuesto_id,programa_id,subprograma_id,proyecto_id,producto_id,producto_presupusto_id,unidad_medida_id, anho, mes, cantidad)"
//			        + " values (?,?,?,?,?,?,?,?,?,?,?,?)";
//		try {
//			PreparedStatement preparedStmt;
//			preparedStmt = conect.prepareStatement(query);
//			preparedStmt.setInt (1,nivel );
//			preparedStmt.setInt (2,entidad);
//			preparedStmt.setInt (3, tipo);
//			preparedStmt.setInt (4, programa);
//			preparedStmt.setInt (5, subprograma);
//			preparedStmt.setInt (6, proyecto);
//			preparedStmt.setInt (7, producto);
//			preparedStmt.setInt (8, producto_presupuesto_id);
//			preparedStmt.setInt (9, unidad_medida);
//			preparedStmt.setInt (10, anho);
//			preparedStmt.setInt (11, mes);
//			preparedStmt.setDouble (12, cantidad);
//		    preparedStmt.execute();
//		    conect.close();
//		} catch (SQLException e) {e.printStackTrace();}
   }   	
}
