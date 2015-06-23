package py.gov.stp.tools;



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
    	
    	Integer institucion_id=null;
    	Integer accion_id=null;
    	Integer linea_accion_id=null;
    	
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
      	if (request.getParameter("linea_accion_id")!=null) linea_accion_id=Integer.parseInt(request.getParameter("linea_accion_id")); else linea_accion_id=0;
    	
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
        	
        	if (action.equals("getEntidades")){
        		List objetos=null;
        		condition = " where true ";
        		if (institucion!="") condition += " and institucion ='"+institucion+"'";
        		if (institucion_id!=0) condition += " and institucion_id ='"+institucion_id+"'";
				try {objetos = SqlSelects.selectEntidad(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos);
        		out.println(json.toString());
        	}
        	
        	if (action.equals("getLineasAccion")){
        		List objetos=null;
        		condition = " where true ";
        		if (institucion!="") condition += " and institucion ='"+institucion+"'";
        		if (institucion_id!=0) condition += " and institucion_id ='"+institucion_id+"'";
        		if (linea_accion_id!=0) condition += " and linea_accion_id ='"+linea_accion_id+"'";
        		if (anio!=0) condition += " and date_part ='"+anio+"'";
        		
				try {objetos = SqlSelects.seletLineaAccion(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos);
        		out.println(json.toString());
        	}
        	
        	
        	if (action.equals("getFactHitos")){
        		List objetos=null;
        		condition = " where true ";
        		if (institucion!="") condition += " and institucion ='"+institucion+"'";
        		if (institucion_id!=0) condition += " and institucion_id ='"+institucion_id+"'";
        		if (linea_accion_id!=0) condition += " and linea_accion_id ='"+linea_accion_id+"'";
        		if (accion!="") condition += " and accion ='"+accion+"'";
        		if (accion_id!=0) condition += " and accion_id ='"+accion_id+"'";
        		
        		
				try {objetos = SqlSelects.selectFactHitos(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos);
        		out.println(json.toString());
        	}
       }
       out.close();
        
    }
}
