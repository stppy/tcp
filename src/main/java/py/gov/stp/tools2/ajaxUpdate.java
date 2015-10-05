package py.gov.stp.tools2;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
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

import py.gov.stp.tools2.*;
import py.gov.stp.objetosV2.*;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;



public class ajaxUpdate extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html;charset=UTF-8");
    	request.setCharacterEncoding("UTF-8");
    	
    	
    	
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
    	Integer cantidad = null;
    	
    	
    	String condition = "";
    	
    	String vision = "";
    	String objetivo = "";
    	String resultado = "";
    	String diagnostico = "";
    	String baseLegal = "";
    	String politica = "";
    	String sigla = "";
    	String abrev = "";
    	String nombre = "";
    	String descripcion = "";
    	String mision = "";
    	
    	if (request.getParameter("vision")!=null)  vision = 			new String(request.getParameter("vision").getBytes("ISO8859_1"), "UTF-8");
    	if (request.getParameter("objetivo")!=null) objetivo = 			new String(request.getParameter("objetivo").getBytes("ISO8859_1"), "UTF-8"); 
    	if (request.getParameter("resultado")!=null) resultado = 		new String(request.getParameter("resultado").getBytes("ISO8859_1"), "UTF-8"); 
    	if (request.getParameter("diagnostico")!=null) diagnostico = 	new String(request.getParameter("diagnostico").getBytes("ISO8859_1"), "UTF-8"); 
    	if (request.getParameter("baseLegal")!=null) baseLegal =  		new String(request.getParameter("baseLegal").getBytes("ISO8859_1"), "UTF-8");
    	if (request.getParameter("politica")!=null) politica = 			new String(request.getParameter("politica").getBytes("ISO8859_1"), "UTF-8");
    	if (request.getParameter("sigla")!=null) sigla = 				new String(request.getParameter("sigla").getBytes("ISO8859_1"), "UTF-8");
    	if (request.getParameter("abrev")!=null) abrev = 				new String(request.getParameter("abrev").getBytes("ISO8859_1"), "UTF-8");
    	if (request.getParameter("nombre")!=null) nombre = 				new String(request.getParameter("nombre").getBytes("ISO8859_1"), "UTF-8");
    	if (request.getParameter("descripcion")!=null) descripcion = 	new String(request.getParameter("descripcion").getBytes("ISO8859_1"), "UTF-8");
    	if (request.getParameter("mision")!=null) mision = 	new String(request.getParameter("mision").getBytes("ISO8859_1"), "UTF-8");
    	
    	if (request.getParameter("nivel")!=null) nivel = 				Integer.parseInt(request.getParameter("nivel"));
    	if (request.getParameter("tipoPresupuesto")!=null) tipoPresupuesto = Integer.parseInt(request.getParameter("tipoPresupuesto"));
    	if (request.getParameter("entidad")!=null) entidad = 			Integer.parseInt(request.getParameter("entidad"));
    	if (request.getParameter("unidadResponsable")!=null) unidadResponsable = Integer.parseInt(request.getParameter("unidadResponsable"));
    	if (request.getParameter("unidadMedida")!=null) unidadMedida = 	Integer.parseInt(request.getParameter("unidadMedida"));
    	if (request.getParameter("programa")!=null) programa = 			Integer.parseInt(request.getParameter("programa"));
    	if (request.getParameter("subprograma")!=null) subprograma = 	Integer.parseInt(request.getParameter("subprograma"));
    	if (request.getParameter("proyecto")!=null) proyecto = 			Integer.parseInt(request.getParameter("proyecto"));
    	if (request.getParameter("producto")!=null) producto =			Integer.parseInt(request.getParameter("producto"));
    	if (request.getParameter("unidadJerarquica")!=null) producto = 	Integer.parseInt(request.getParameter("unidadJerarquica"));
    	if (request.getParameter("pais")!=null) pais = 					Integer.parseInt(request.getParameter("pais")); else pais=0;
    	if (request.getParameter("anio")!=null) anio = 					Integer.parseInt(request.getParameter("anio")); else anio=2015;
    	if (request.getParameter("mes")!=null) mes = 					Integer.parseInt(request.getParameter("mes")); else mes=0;
    	if (request.getParameter("departamento")!=null) departamento = 	Integer.parseInt(request.getParameter("departamento")); else departamento=99;
    	if (request.getParameter("cantidad")!=null) cantidad = 			Integer.parseInt(request.getParameter("cantidad")); else cantidad=0;
    	
        Map<String,String[]> solicitud =request.getParameterMap();
        PrintWriter out = response.getWriter();
        
        response.setHeader("Cache-control", "no-cache, no-store");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "-1");
 
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST");
        response.setHeader("Access-Control-Allow-Methods", "PUT");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
        response.setHeader("Access-Control-Max-Age", "86400");
        
        
        
        Gson gson = new Gson(); 
        JsonObject myObj = new JsonObject();
        
    
        
        if (accion!=null && accion!=""){
        	if (accion.equals("actTipoAccion")){
        		TipoAccion objeto = new TipoAccion();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, TipoAccion.class);
                boolean status = SqlUpdates.updateTipoAccion(objeto);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("borradoTipoAccion")){
        		TipoAccion objeto = new TipoAccion();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, TipoAccion.class);
                boolean status = SqlUpdates.borradoTipoAccion(objeto.isBorrado());
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}
        	if (accion.equals("actUnidadMedida")){
        		UnidadMedida objeto = new UnidadMedida();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, UnidadMedida.class);
                boolean status = SqlUpdates.updateUnidadMedida(objeto);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}   
        	if (accion.equals("borradoUnidadMedida")){
        		UnidadMedida objeto = new UnidadMedida();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, UnidadMedida.class);
                boolean status = SqlUpdates.borradoUnidadMedida(objeto.isBorrado());
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}         	
        	if (accion.equals("actLineaEstrategica")){
        		LineaEstrategica objeto = new LineaEstrategica();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, LineaEstrategica.class);
                boolean status = SqlUpdates.updateLineaEstrategica(objeto);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	} 
        	if (accion.equals("borradoLineaEstrategica")){
        		LineaEstrategica objeto = new LineaEstrategica();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, LineaEstrategica.class);
                boolean status = SqlUpdates.borradoLineaEstrategica(objeto.isBorrado());
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}         	
        	if (accion.equals("actLineaAccion")){
        		LineaAccion objeto = new LineaAccion();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, LineaAccion.class);
                boolean status = SqlUpdates.updateLineaAccion(objeto);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}  
        	if (accion.equals("borradoLineaAccion")){
        		InsLineaAccion objeto = new InsLineaAccion();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, InsLineaAccion.class);
                boolean status = SqlUpdates.borradoLineaAccion(objeto.isBorrado());
        		myObj.addProperty("success", status); 
        		out.println(myObj.toString());
        	}           	
        	if (accion.equals("actInsLineaAccion")){
        		InsLineaAccion objeto = new InsLineaAccion();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, InsLineaAccion.class);
                boolean status = SqlUpdates.updateInsLineaAccion(objeto);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}  
        	if (accion.equals("borradoInsLineaAccion")){
        		InsLineaAccion objeto = new InsLineaAccion();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, InsLineaAccion.class);
                boolean status = SqlUpdates.borradoInsLineaAccion(objeto.isBorrado());
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}           	
        	if (accion.equals("actInstitucion")){
        		Institucion objeto = new Institucion();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Institucion.class);
                boolean status = SqlUpdates.updateInstitucion(objeto);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}    
        	if (accion.equals("borradoInstitucion")){
        		Institucion objeto = new Institucion();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Institucion.class);
                boolean status = SqlUpdates.borradoInstitucion(objeto.isBorrado());
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}          	
        	if (accion.equals("actPeriodo")){
        		Periodo objeto = new Periodo();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                //Gson gsonInsert = new Gson();
                Gson gsonInsert = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
                objeto=gsonInsert.fromJson(json, Periodo.class);
                boolean status = SqlUpdates.updatePeriodo(objeto);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	} 
        	if (accion.equals("borradoPeriodo")){
        		Periodo objeto = new Periodo();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Periodo.class);
                boolean status = SqlUpdates.borradoPeriodo(objeto.isBorrado());
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}         	
        	if (accion.equals("actHitoTipo")){
        		HitoTipo objeto = new HitoTipo();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, HitoTipo.class);
                boolean status = SqlUpdates.updateHitoTipo(objeto);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}   
        	if (accion.equals("borradoHitoTipo")){
        		HitoTipo objeto = new HitoTipo();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, HitoTipo.class);
                boolean status = SqlUpdates.borradoHitoTipo(objeto.isBorrado());
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}           	
        	if (accion.equals("actHito")){
        		Hito objeto = new Hito();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Hito.class);
                boolean status = SqlUpdates.updateHito(objeto);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	} 
        	if (accion.equals("borradoHito")){
        		Hito objeto = new Hito();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Hito.class);
                boolean status = SqlUpdates.borradoHito(objeto.isBorrado());
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}         	
        	if (accion.equals("actAccion")){
        		Accion objeto = new Accion();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                //Gson gsonInsert = new Gson();
                Gson gsonInsert = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
                objeto=gsonInsert.fromJson(json, Accion.class);
                boolean status = SqlUpdates.updateAccion(objeto);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	} 
        	if (accion.equals("borradoAccion")){
        		Accion objeto = new Accion();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Accion.class);
                boolean status = SqlUpdates.borradoAccion(objeto.isBorrado());
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}         	
        	if (accion.equals("actAccionHasProducto")){
        		AccionHasProducto objeto = new AccionHasProducto();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, AccionHasProducto.class);
                boolean status = SqlUpdates.updateAccionHasProducto(objeto); 
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}        
        	if (accion.equals("actSprProducto")){
        		SprProducto objeto = new SprProducto();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, SprProducto.class);
                boolean status = SqlUpdates.updateSprProducto(objeto); 
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}  
        	if (accion.equals("actWs")){
        		Ws objeto = new Ws();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Ws.class);
                boolean status = SqlUpdates.updateWs(objeto); 
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	} 
        	if (accion.equals("borradoWs")){
        		Ws objeto = new Ws();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Ws.class);
                boolean status = SqlUpdates.borradoWs(objeto.isBorrado()); 
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}         	
        	if (accion.equals("actEvidencia")){
        		Evidencia objeto = new Evidencia();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Evidencia.class);
                boolean status = SqlUpdates.updateEvidencia(objeto);  
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}   
        	if (accion.equals("borradoEvidencia")){
        		Evidencia objeto = new Evidencia();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Evidencia.class);
                boolean status = SqlUpdates.borradoEvidencia(objeto.isBorrado());  
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}          	
        	if (accion.equals("actWsTipo")){
        		WsTipo objeto = new WsTipo();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, WsTipo.class);
                boolean status = SqlUpdates.updateWsTipo(objeto);  
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}  
        	if (accion.equals("borradoWsTipo")){
        		WsTipo objeto = new WsTipo();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, WsTipo.class);
                boolean status = SqlUpdates.borradoWsTipo(objeto.isBorrado());  
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}            	
        	if (accion.equals("actHitoHasBeneficiario")){
        		HitoHasBeneficiario objeto = new HitoHasBeneficiario();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, HitoHasBeneficiario.class);
                boolean status = SqlUpdates.updateHitoHasBeneficiario(objeto);   
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}    
        	if (accion.equals("actBeneficiarioTipo")){
        		BeneficiarioTipo objeto = new BeneficiarioTipo();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, BeneficiarioTipo.class);
                boolean status = SqlUpdates.updateBeneficiarioTipo(objeto);    
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}    
        	if (accion.equals("actAccionHasEtiqueta")){
        		AccionHasEtiqueta objeto = new AccionHasEtiqueta();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, AccionHasEtiqueta.class);
                boolean status = SqlUpdates.updateAccionHasEtiqueta(objeto);    
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}          
        	if (accion.equals("actBeneficiario")){
        		Beneficiario objeto = new Beneficiario();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Beneficiario.class);
                boolean status = SqlUpdates.updateBeneficiario(objeto);    
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}     
        	if (accion.equals("actEtiqueta")){
        		Etiqueta objeto = new Etiqueta();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, Etiqueta.class);
                boolean status = SqlUpdates.updateEtiqueta(objeto);    
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}  
        	if (accion.equals("actBeneficiarioDetalle")){
        		BeneficiarioDetalle objeto = new BeneficiarioDetalle();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, BeneficiarioDetalle.class);
                boolean status = SqlUpdates.updateBeneficiarioDetalle(objeto);    
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}  
        	if (accion.equals("actBeneficiarioDetalleClave")){
        		BeneficiarioDetalleClave objeto = new BeneficiarioDetalleClave();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, BeneficiarioDetalleClave.class);
                boolean status = SqlUpdates.updateBeneficiarioDetalleClave(objeto);    
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}   
        	if (accion.equals("actGeoPoligono")){
        		GeoPoligono objeto = new GeoPoligono();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, GeoPoligono.class);
                boolean status = SqlUpdates.updateGeoPoligono(objeto);    
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}  
        	if (accion.equals("actAccionHasGeoPoligono")){
        		AccionHasGeoPoligono objeto = new AccionHasGeoPoligono();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, AccionHasGeoPoligono.class);
                boolean status = SqlUpdates.updateAccionHasGeoPoligono(objeto);     
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}      
        	if (accion.equals("actGeoPoligonoTipo")){
        		GeoPoligonoTipo objeto = new GeoPoligonoTipo();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, GeoPoligonoTipo.class);
                boolean status = SqlUpdates.updateGeoPoligonoTipo(objeto);     
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}          	
        	
        }     
        
     
    }
}
