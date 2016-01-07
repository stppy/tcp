package py.gov.stp.tools;

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

import py.gov.stp.objetosV2.AccionHasProducto;
import py.gov.stp.objetosV2.HitoPrueba;
import py.gov.stp.tools.SqlInserts;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

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
        
      /*  if (accion!=null && accion!=""){
        	if (accion.equals("insProductoPresupuesto")){
        		ProductoPresupuesto productoObj = new ProductoPresupuesto();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                productoObj=gsonInsert.fromJson(json, ProductoPresupuesto.class);
				SqlInserts.insertProductoPresupuesto(productoObj);
        	}
           }*/
        
        if (accion!=null && accion!=""){
    	if (accion.equals("insHitoPrueba")){
    		HitoPrueba obj = new HitoPrueba();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            obj=gsonInsert.fromJson(json, HitoPrueba.class);
			SqlInserts.insertHitoPrueba(obj);
    	}
       }

        
        if (accion!=null && accion!=""){
    	if (accion.equals("insAccionHasProducto")){
    		AccionHasProducto obj = new AccionHasProducto();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            obj=gsonInsert.fromJson(json, AccionHasProducto.class);
			SqlInserts.insertAccionHasProducto(obj);
    	}
       } 
    

    }
}
