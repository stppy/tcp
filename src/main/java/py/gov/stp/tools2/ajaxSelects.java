package py.gov.stp.tools2;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;





import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
 

import javax.xml.datatype.DatatypeConfigurationException;

import py.gov.stp.tools2.SqlSelects;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

public class ajaxSelects extends HttpServlet {
 
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  
    	
    	String action = request.getParameter("action");
    	String accion = request.getParameter("accion");
    	
    	Integer nivel = null;
    	Integer entidad = null;
    	Integer tipoPresupuesto = null;
    	Integer unidadResponsable = null;
    	Integer unidadMedida = null;
    	Integer programa = null;
    	Integer subprograma = null;
    	Integer proyecto = null;
    	Integer producto = null;
    	Integer unidadJerarquica = null;
    	Integer anio = null;
    	Integer mes = null;
    	Integer pais = null;
    	Integer departamento = null;
    	Integer objetivo = null;
    	Integer estrategia = null;
    	Integer indicador = null;
    	Integer tipoDestinatario = null;
    	Integer snip = null;
    	Integer snipAutorizado = null;
    	Integer funcional = null;
    	Integer catalogoDestinatario = null;
    	Integer catalogoAccionId = null;
    	
    	Integer institucion_id=null;
    	Integer accion_id=null;
    	Integer accionId = null;
    	Integer linea_accion_id=null;
    	Integer lineaAccionId=null;
    	Integer insLineaAccionId = null;
    	Integer institucionId = null;
    	Integer periodoId = null;

    	
    	Integer cronogramaId=null;
    	Integer programacionId = null;
    	Integer avanceId = null;
    	
    	String institucion=null;
    	String usuario=null;
    	String condition = "";
    	String mision = "";
    	String nombre = "";
    	String vision = "";
    	String resultado = "";
    	String diagnostico = "";
    	String baseLegal = "";
    	String politica = "";
    	String sigla = "";
    	String abrev = "";
    	String descripcion = "";
    	String db = "";

    	
    	
    	if (request.getParameter("usuario")!=null) usuario=request.getParameter("usuario");
    	if (request.getParameter("nivel")!=null) nivel = Integer.parseInt(request.getParameter("nivel"));
    	if (request.getParameter("tipoPresupuesto")!=null) tipoPresupuesto = Integer.parseInt(request.getParameter("tipoPresupuesto"));
    	if (request.getParameter("entidad")!=null) entidad = Integer.parseInt(request.getParameter("entidad"));
    	if (request.getParameter("unidadResponsable")!=null) unidadResponsable = Integer.parseInt(request.getParameter("unidadResponsable"));
    	if (request.getParameter("unidadMedida")!=null) unidadMedida = Integer.parseInt(request.getParameter("unidadMedida"));
    	if (request.getParameter("programa")!=null) programa = Integer.parseInt(request.getParameter("programa"));
    	if (request.getParameter("subprograma")!=null) subprograma = Integer.parseInt(request.getParameter("subprograma"));
    	if (request.getParameter("proyecto")!=null) proyecto = Integer.parseInt(request.getParameter("proyecto"));
    	if (request.getParameter("producto")!=null) producto = Integer.parseInt(request.getParameter("producto"));
    	if (request.getParameter("unidadJerarquica")!=null) producto = Integer.parseInt(request.getParameter("unidadJerarquica"));
    	if (request.getParameter("pais")!=null) pais = Integer.parseInt(request.getParameter("pais")); else pais=1;
    	if (request.getParameter("anio")!=null) anio = Integer.parseInt(request.getParameter("anio")); else anio=0;
    	if (request.getParameter("mes")!=null) mes = Integer.parseInt(request.getParameter("mes")); else mes=0;
    	if (request.getParameter("departamento")!=null) departamento = Integer.parseInt(request.getParameter("departamento")); else departamento=99;
    	if (request.getParameter("objetivo")!=null) objetivo = Integer.parseInt(request.getParameter("objetivo")); else objetivo=0;
    	if (request.getParameter("estrategia")!=null) estrategia = Integer.parseInt(request.getParameter("estrategia")); else estrategia=0;
    	if (request.getParameter("indicador")!=null) indicador = Integer.parseInt(request.getParameter("indicador")); else indicador=0;
    	if (request.getParameter("tipoDestinatario")!=null) tipoDestinatario = Integer.parseInt(request.getParameter("tipoDestinatario")); else tipoDestinatario=0;
    	if (request.getParameter("catalogoDestinatario")!=null) catalogoDestinatario = Integer.parseInt(request.getParameter("catalogoDestinatario")); else catalogoDestinatario=0;
    	//if (request.getParameter("snip")!=null) snip = Integer.parseInt(request.getParameter("snip")); else snip=0;
    	//if (request.getParameter("snipAutorizado")!=null) snip = Integer.parseInt(request.getParameter("snipAutorizado")); else snipAutorizado=0;
      	if (request.getParameter("funcional")!=null) funcional = Integer.parseInt(request.getParameter("funcional")); else funcional=0;
      	if (request.getParameter("nombre")!=null) nombre = request.getParameter("nombre"); else nombre="";
      	if (request.getParameter("institucion")!=null) institucion = request.getParameter("institucion"); else institucion="";
      	if (request.getParameter("accion")!=null) accion = request.getParameter("accion"); else accion="";
      	
      	if (request.getParameter("institucion_id")!=null) institucion_id=Integer.parseInt(request.getParameter("institucion_id")); else institucion_id=0;
      	if (request.getParameter("accion_id")!=null) accion_id=Integer.parseInt(request.getParameter("accion_id")); else accion_id=0;
      	if (request.getParameter("accionId")!=null) accionId=Integer.parseInt(request.getParameter("accionId"));
      	if (request.getParameter("periodoId")!=null) periodoId=Integer.parseInt(request.getParameter("periodoId"));
      	if (request.getParameter("institucionId")!=null) institucionId=Integer.parseInt(request.getParameter("institucionId"));
      	if (request.getParameter("insLineaAccionId")!=null) insLineaAccionId=Integer.parseInt(request.getParameter("insLineaAccionId"));
      	if (request.getParameter("linea_accion_id")!=null) linea_accion_id=Integer.parseInt(request.getParameter("linea_accion_id")); else linea_accion_id=0;
      	if (request.getParameter("lineaAccionId")!=null) lineaAccionId=Integer.parseInt(request.getParameter("lineaAccionId"));
      	if (request.getParameter("catalogoAccionId")!=null) catalogoAccionId=Integer.parseInt(request.getParameter("catalogoAccionId"));
      	if (request.getParameter("cronogramaId")!=null) cronogramaId=Integer.parseInt(request.getParameter("cronogramaId"));
      	if (request.getParameter("programacionId")!=null) lineaAccionId=Integer.parseInt(request.getParameter("programacionId"));
      	if (request.getParameter("avanceId")!=null) catalogoAccionId=Integer.parseInt(request.getParameter("avanceId"));

      	
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        response.setHeader("Cache-control", "no-cache, no-store");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "-1");
 
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
        response.setHeader("Access-Control-Max-Age", "1");
        
        /*response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");*/
        
        Gson gson = new Gson(); 
        JsonObject myObj = new JsonObject();
 
        
        if (action!=null && action!=""){
      
        	if (action.equals("getWs")){
        		List objetos=null;
           		try {objetos = SqlSelects.selectWs();}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());        	
        	}
        	if (action.equals("getEvidencia")){
        		List objetos=null;
           		try {objetos = SqlSelects.selectEvidencia();}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());        	
        	
        	
       }    
        	if (action.equals("getWsTipo")){
        		List objetos=null;
           		try {objetos = SqlSelects.selectWsTipo();}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());        	
        	
        	
       }    
        	if (action.equals("getAccionHasEtiqueta")){
        		List objetos=null;
           		try {objetos = SqlSelects.selectAccionHasEtiqueta();}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());        	
        	
        	
       }
        	if (action.equals("getEtiqueta")){
        		List objetos=null;
           		try {objetos = SqlSelects.selectEtiqueta();}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());        	
        	
        	
       }
        	if (action.equals("getHitoHasBeneficiario")){
        		List objetos=null;
           		try {objetos = SqlSelects.selectHitoHasBeneficiario();}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());        	
        	
        	
       }
        	if (action.equals("getBeneficiario")){
        		List objetos=null;
           		try {objetos = SqlSelects.selectBeneficiario();}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());        	
        	
        	
       }        	
        	if (action.equals("getBeneficiarioTipo")){
        		List objetos=null;
           		try {objetos = SqlSelects.selectBeneficiarioTipo();}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());        	
        	
        	
       }
        	if (action.equals("getBeneficiarioDetalle")){
        		List objetos=null;
           		try {objetos = SqlSelects.selectBeneficiarioDetalle();}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());        	
        	
        	
       }
        	if (action.equals("getBeneficiarioDetalleClave")){
        		List objetos=null;
           		try {objetos = SqlSelects.selectBeneficiarioDetalleClave();}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());        	
        	
        	
       }
        	if (action.equals("getGeoPoligono")){
        		List objetos=null;
           		try {objetos = SqlSelects.selectGeoPoligono();}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());        	
        	
        	
       }
        	if (action.equals("getGeoPoligonoTipo")){
        		List objetos=null;
           		try {objetos = SqlSelects.selectGeoPoligonoTipo();}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());        	
        	
        	
       }
        	if (action.equals("getAccionHasGeoPoligono")){
        		List objetos=null;
           		try {objetos = SqlSelects.selectAccionHasGeoPoligono();}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());        	
       }         	

        	if (action.equals("getTipoAccion")){
        		List objetos=null; 
           		try {objetos = SqlSelects.selectTipoAccion();}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        		} 
        	if (action.equals("getUnidadMedida")){
        		List objetos=null; 
           		try {objetos = SqlSelects.selectUnidadMedida();}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        		}            	
        	if (action.equals("getLineaEstrategica")){
        		List objetos=null; 
           		try {objetos = SqlSelects.selectLineaEstrategica();}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        		}      
        	if (action.equals("getLineaAccion")){
        		List objetos=null; 
        		condition = " where true ";
        		if (lineaAccionId!=null) condition += " and id ='"+lineaAccionId+"'";
           		try {objetos = SqlSelects.selectLineaAccion(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}  
        	if (action.equals("getInsLineaAccion")){
        		List objetos=null; 
        		condition = " where true ";
        		if (insLineaAccionId!=null) condition += " and id ='"+insLineaAccionId+"'";
           		try {objetos = SqlSelects.selectInsLineaAccion(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}    
        	if (action.equals("getInstitucion")){
        		List objetos=null;
        		condition = " where true ";
        		if (institucionId!=null) condition += " and id ='"+institucionId+"'";
           		try {objetos = SqlSelects.selectInstitucion(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}  
        	if (action.equals("getPeriodo")){
        		List objetos=null; 
        		condition = " where true ";
        		if (periodoId!=null) condition += " and id ='"+periodoId+"'"; 
           		try {objetos = SqlSelects.selectPeriodo(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}  
        	if (action.equals("getHitoTipo")){
        		List objetos=null; 
           		try {objetos = SqlSelects.selectHitoTipo();}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}   
        	if (action.equals("getHito")){
        		List objetos=null; 
           		try {objetos = SqlSelects.selectHito();}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	} 
        	if (action.equals("getAccion")){
        		List objetos=null; 
        		condition = " where true ";
        		if (lineaAccionId!=null) condition += " and ins_linea_accion_id ='"+lineaAccionId+"'";
        		if (accionId!=null) condition += " and id ='"+accionId+"'";
           		try {objetos = SqlSelects.selectAccion(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}          
        	if (action.equals("getAccionHasProducto")){
        		List objetos=null; 
           		try {objetos = SqlSelects.selectAccionHasProducto();}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}         
        	if (action.equals("getSprProducto")){
        		List objetos=null; 
           		try {objetos = SqlSelects.selectSprProducto();}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}
        	
        	if (action.equals("getAccionCatalogo")){
        		List objetos=null; 
        		condition = " where true ";
        		if (catalogoAccionId!=null) condition += " and id ='"+catalogoAccionId+"'";
           		try {objetos = SqlSelects.selectAccionCatalogo(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}
        	
        	if (action.equals("getCronograma")){
        		List objetos=null; 
        		condition = " where true ";
        		if (cronogramaId!=null) condition += " and id ='"+cronogramaId+"'";
        		if (accionId!=null) condition += " and accion_id ='"+accionId+"'";
           		try {objetos = SqlSelects.selectCronograma(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}
        	if (action.equals("getProgramacion")){
        		List objetos=null; 
        		condition = " where true ";
        		if (programacionId!=null) condition += " and id ='"+programacionId+"'";
           		try {objetos = SqlSelects.selectProgramacion(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}
        	if (action.equals("getProgramacion")){
        		List objetos=null; 
        		condition = " where true ";
        		if (avanceId!=null) condition += " and id ='"+avanceId+"'";
           		try {objetos = SqlSelects.selectAvance(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}

       }

       out.close();
        
    }
}


