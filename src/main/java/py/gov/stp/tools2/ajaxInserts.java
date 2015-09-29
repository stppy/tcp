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

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import py.gov.stp.objetosV2.*;

public class ajaxInserts  extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 
    	String accion = request.getParameter("accion");

        
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
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
    	if (accion.equals("insTipoAccion")){
    		TipoAccion productoObj = new TipoAccion();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            productoObj=gsonInsert.fromJson(json, TipoAccion.class);
			SqlInserts.insertTipoAccion(productoObj);
    	}
       }
        if (accion!=null && accion!=""){
    	if (accion.equals("insAccion")){
    		Accion productoObj = new Accion();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            productoObj=gsonInsert.fromJson(json, Accion.class);
			SqlInserts.insertAccion(productoObj);
    	}
       }
        if (accion!=null && accion!=""){
    	if (accion.equals("insAccionHasEtiqueta")){
    		AccionHasEtiqueta productoObj = new AccionHasEtiqueta();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            productoObj=gsonInsert.fromJson(json, AccionHasEtiqueta.class);
			SqlInserts.insertAccionHasEtiqueta(productoObj);
    	}
       }
        if (accion!=null && accion!=""){
    	if (accion.equals("insAccionHasGeoPoligono")){
    		AccionHasGeoPoligono productoObj = new AccionHasGeoPoligono();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            productoObj=gsonInsert.fromJson(json, AccionHasGeoPoligono.class);
			SqlInserts.insertAccionHasGeoPoligono(productoObj);
    	}
       }
        if (accion!=null && accion!=""){
    	if (accion.equals("insAccionHasProducto")){
    		AccionHasProducto productoObj = new AccionHasProducto();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            productoObj=gsonInsert.fromJson(json, AccionHasProducto.class);
			SqlInserts.insertAccionHasProducto(productoObj);
    	}
       }
        if (accion!=null && accion!=""){
    	if (accion.equals("insBeneficiario")){
    		Beneficiario productoObj = new Beneficiario();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            productoObj=gsonInsert.fromJson(json, Beneficiario.class);
			SqlInserts.insertBeneficiario(productoObj);
    	}
       }
        if (accion!=null && accion!=""){
    	if (accion.equals("insBeneficiarioDetalle")){
    		BeneficiarioDetalle productoObj = new BeneficiarioDetalle();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            productoObj=gsonInsert.fromJson(json, BeneficiarioDetalle.class);
			SqlInserts.insertBeneficiarioDetalle(productoObj);
    	}
       }
        if (accion!=null && accion!=""){
    	if (accion.equals("insBeneficiarioDetalleClave")){
    		BeneficiarioDetalleClave productoObj = new BeneficiarioDetalleClave();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            productoObj=gsonInsert.fromJson(json, BeneficiarioDetalleClave.class);
			SqlInserts.insertBeneficiarioDetalleClave(productoObj);
    	}
       }
        if (accion!=null && accion!=""){
    	if (accion.equals("insBeneficiarioTipo")){
    		BeneficiarioTipo productoObj = new BeneficiarioTipo();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            productoObj=gsonInsert.fromJson(json, BeneficiarioTipo.class);
			SqlInserts.insertBeneficiarioTipo(productoObj);
    	}
       }
        if (accion!=null && accion!=""){
    	if (accion.equals("insEtiqueta")){
    		Etiqueta productoObj = new Etiqueta();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            productoObj=gsonInsert.fromJson(json, Etiqueta.class);
			SqlInserts.insertEtiqueta(productoObj);
    	}
       }
        if (accion!=null && accion!=""){
    	if (accion.equals("insEvidencia")){
    		Evidencia productoObj = new Evidencia();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            productoObj=gsonInsert.fromJson(json, Evidencia.class);
			SqlInserts.insertEvidencia(productoObj);
    	}
       }
        if (accion!=null && accion!=""){
    	if (accion.equals("insGeoPoligono")){
    		GeoPoligono productoObj = new GeoPoligono();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            productoObj=gsonInsert.fromJson(json, GeoPoligono.class);
			SqlInserts.insertGeoPoligono(productoObj);
    	}
       }
        if (accion!=null && accion!=""){
    	if (accion.equals("insGeoPoligonoTipo")){
    		GeoPoligonoTipo productoObj = new GeoPoligonoTipo();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            productoObj=gsonInsert.fromJson(json, GeoPoligonoTipo.class);
			SqlInserts.insertGeoPoligonoTipo(productoObj);
    	}
       }
        if (accion!=null && accion!=""){
    	if (accion.equals("insHito")){
    		Hito productoObj = new Hito();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            productoObj=gsonInsert.fromJson(json, Hito.class);
			SqlInserts.insertHito(productoObj);
    	}
       }
        if (accion!=null && accion!=""){
    	if (accion.equals("insHitoHasBeneficiario")){
    		HitoHasBeneficiario productoObj = new HitoHasBeneficiario();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            productoObj=gsonInsert.fromJson(json, HitoHasBeneficiario.class);
			SqlInserts.insertHitoHasBeneficiario(productoObj);
    	}
       }
        if (accion!=null && accion!=""){
    	if (accion.equals("insHitoTipo")){
    		HitoTipo objeto = new HitoTipo();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            objeto=gsonInsert.fromJson(json, HitoTipo.class);
			SqlInserts.insertHitoTipo(objeto);
    	}
       }
        if (accion!=null && accion!=""){
    	if (accion.equals("insInsLineaAccion")){
    		InsLineaAccion productoObj = new InsLineaAccion();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            productoObj=gsonInsert.fromJson(json, InsLineaAccion.class);
			SqlInserts.insertInsLineaAccion(productoObj);
    	}
       }
        if (accion!=null && accion!=""){
    	if (accion.equals("insInstitucion")){
    		Institucion productoObj = new Institucion();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            productoObj=gsonInsert.fromJson(json, Institucion.class);
			SqlInserts.insertInstitucion(productoObj);
    	}
       }
        if (accion!=null && accion!=""){
    	if (accion.equals("insLineaAccion")){
    		LineaAccion productoObj = new LineaAccion();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            productoObj=gsonInsert.fromJson(json, LineaAccion.class);
			SqlInserts.insertLineaAccion(productoObj);
    	}
       }
        if (accion!=null && accion!=""){
    	if (accion.equals("insLineaEstrategica")){
    		LineaEstrategica productoObj = new LineaEstrategica();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            productoObj=gsonInsert.fromJson(json, LineaEstrategica.class);
			SqlInserts.insertLineaEstrategica(productoObj);
    	}
       }         
        if (accion!=null && accion!=""){
    	if (accion.equals("insPeriodo")){
    		Periodo productoObj = new Periodo();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            productoObj=gsonInsert.fromJson(json, Periodo.class);
			SqlInserts.insertPeriodo(productoObj);
    	}
       }
        if (accion!=null && accion!=""){
    	if (accion.equals("insSprProducto")){
    		SprProducto productoObj = new SprProducto();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            productoObj=gsonInsert.fromJson(json, SprProducto.class);
			SqlInserts.insertSprProducto(productoObj);
    	}
       }
        if (accion!=null && accion!=""){
    	if (accion.equals("insUnidadMedida")){
    		UnidadMedida productoObj = new UnidadMedida();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            productoObj=gsonInsert.fromJson(json, UnidadMedida.class);
			SqlInserts.insertUnidadMedida(productoObj);
    	}
       }
        if (accion!=null && accion!=""){
    	if (accion.equals("insWs")){
    		Ws productoObj = new Ws();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            productoObj=gsonInsert.fromJson(json, Ws.class);
			SqlInserts.insertWs(productoObj);
    	}
       }
        if (accion!=null && accion!=""){
    	if (accion.equals("insWsTipo")){
    		WsTipo productoObj = new WsTipo();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            productoObj=gsonInsert.fromJson(json, WsTipo.class);
			SqlInserts.insertWsTipo(productoObj);
    	}
       }        
    
    }
}