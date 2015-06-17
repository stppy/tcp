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

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

public class ajaxExport  extends HttpServlet {
	
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
        
  /*      if (accion!=null && accion!=""){
        	if (accion.equals("actEntidad")){
        		int anio=2015;

        		Condicion condicionObj = new Condicion();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String jsonS = "";
                if(br != null){ jsonS = br.readLine();}
                Gson gsonInsert = new Gson();
                condicionObj=gsonInsert.fromJson(jsonS, Condicion.class);
				int entidadesActualizadas=0;

				entidadesActualizadas=ClientExport.updateEntidad(anio, condicionObj.nivel, condicionObj.entidad);
				JsonElement json = new Gson().toJsonTree(entidadesActualizadas );
        		myObj.addProperty("success", true);
        		myObj.add("entidadesAct", json);
        		out.println(myObj.toString());
        	}
        	
        }*/
    }
}