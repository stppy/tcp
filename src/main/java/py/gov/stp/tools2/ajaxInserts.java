package py.gov.stp.tools2;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.text.ParseException;
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

import org.jasig.cas.client.authentication.AttributePrincipal;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import py.gov.stp.objetosV2.*;
import py.gov.stp.tools.SqlSelects;
import py.gov.stp.tools2.*;

/**
 * 	@author DGTIC-STP
 *  @email  dgtic@stp.gov.py 
 */
public class ajaxInserts  extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 
    	String accion = request.getParameter("accion");
    	
    	AttributePrincipal user = (AttributePrincipal) request.getUserPrincipal();
    	Map attributes = user.getAttributes(); 
    	String userCorreo = user.getName(); 
    	String userNivelId = attributes.get("nivel_id").toString();
    	String userEntidadId = attributes.get("entidad_id").toString();
    	String userUnrId = attributes.get("unr_id").toString();
    	String userRoleId = attributes.get("role_id_tablero").toString();

        
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
			SqlInserts.insertTipoAccion(productoObj, userCorreo);
    	}
       }      
        if (accion!=null && accion!=""){
    	if (accion.equals("insAccion")){
    		Accion objeto = new Accion();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            //Gson gsonInsert = new Gson();
            Gson gsonInsert = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();            
            objeto=gsonInsert.fromJson(json, Accion.class);
			try {
				boolean status = SqlInserts.insertAccion(objeto, userCorreo);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
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
			SqlInserts.insertAccionHasEtiqueta(productoObj, userCorreo);
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
			SqlInserts.insertAccionHasGeoPoligono(productoObj, userCorreo);
    	}
       }
        if (accion!=null && accion!=""){
    	if (accion.equals("insAccionHasProducto")){
    		AccionHasProducto objeto = new AccionHasProducto();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            objeto=gsonInsert.fromJson(json, AccionHasProducto.class);
			SqlInserts.insertAccionHasProducto(objeto, userCorreo);
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
			boolean status = SqlInserts.insertBeneficiario(productoObj, userCorreo);
    		myObj.addProperty("success", status);
    		out.println(myObj.toString());
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
			SqlInserts.insertBeneficiarioDetalle(productoObj, userCorreo);
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
			SqlInserts.insertBeneficiarioDetalleClave(productoObj, userCorreo);
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
			SqlInserts.insertBeneficiarioTipo(productoObj, userCorreo);
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
			SqlInserts.insertEtiqueta(productoObj, userCorreo);
    	}
       }
        if (accion!=null && accion!=""){
	    	if (accion.equals("insEvidencia")){
	    		Evidencia productoObj = new Evidencia();
	    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
	            String json = "";
	            if(br != null){ json = br.readLine();}
	            Gson gsonInsert = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	            productoObj=gsonInsert.fromJson(json, Evidencia.class);
				int idEvidencia = SqlInserts.insertEvidencia(productoObj, userCorreo);			
	    		if (idEvidencia >= 0){ 
	    			myObj.addProperty("success", true);
	    			myObj.addProperty("idEvidencia",idEvidencia);
	    		} else {
	    			myObj.addProperty("success", false);
	    		}	    		
	    		out.println(myObj.toString());
	    	}
        }
        if (accion!=null && accion!=""){
        	if (accion.equals("insEvidenciaHasDocumento")){
        		EvidenciaHasDocumento objeto = new EvidenciaHasDocumento();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                objeto=gsonInsert.fromJson(json, EvidenciaHasDocumento.class);
    			SqlInserts.insertEvidenciaHasDocumento(objeto, userCorreo);
        	}
        }
        if (accion!=null && accion!=""){
        	if (accion.equals("insDocumento")){
        		Documento objeto = new Documento();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
                objeto=gsonInsert.fromJson(json, Documento.class);
    			boolean status = SqlInserts.insertDocumento(objeto, userCorreo);			
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
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
			SqlInserts.insertGeoPoligono(productoObj, userCorreo);
    	}
       }
        if (accion!=null && accion!=""){
    	if (accion.equals("insGeoPoligonoTipo")){
    		GeoPoligonoTipo objeto = new GeoPoligonoTipo();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            objeto=gsonInsert.fromJson(json, GeoPoligonoTipo.class);
			SqlInserts.insertGeoPoligonoTipo(objeto, userCorreo);
    	}
       }
        if (accion!=null && accion!=""){
    	if (accion.equals("insHito")){
    		Hito productoObj = new Hito();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            //Gson gsonInsert = new Gson();
            Gson gsonInsert = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();            
            productoObj=gsonInsert.fromJson(json, Hito.class);
			SqlInserts.insertHito(productoObj, userCorreo);
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
			SqlInserts.insertHitoHasBeneficiario(productoObj, userCorreo);
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
			SqlInserts.insertHitoTipo(objeto, userCorreo);
    	}
       }
//ES UN EJEMPLO cuando insertamos un registro y necesitamos el id de ese registro para insertar en otra tabla
//        if (accion!=null && accion!=""){
//    	if (accion.equals("insInsLineaAccion")){
//    		InsLineaAccion productoObj = new InsLineaAccion();
//    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
//            String json = "";
//            if(br != null){ json = br.readLine();}
//            Gson gsonInsert = new Gson();
//            productoObj=gsonInsert.fromJson(json, InsLineaAccion.class);
//			//SqlInserts.insertInsLineaAccion(productoObj);
//            int idInsLineaAccion = SqlInserts.insertInsLineaAccion(productoObj);
//            if(idInsLineaAccion > 0){
//                boolean status = true;
//        		myObj.addProperty("success", status);
//        		myObj.addProperty("id", idInsLineaAccion);
//            }else{
//        		myObj.addProperty("success", false);
//            }
//    		out.println(myObj.toString());
//    	}
//       }
        if (accion!=null && accion!=""){
    	if (accion.equals("insInsLineaAccion")){
    		InsLineaAccion productoObj = new InsLineaAccion();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            productoObj=gsonInsert.fromJson(json, InsLineaAccion.class);
            boolean status = SqlInserts.insertInsLineaAccion(productoObj, userCorreo);
        	myObj.addProperty("success", status);

    		out.println(myObj.toString());
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
			SqlInserts.insertInstitucion(productoObj, userCorreo);
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
			SqlInserts.insertLineaAccion(productoObj, userCorreo);
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
			SqlInserts.insertLineaEstrategica(productoObj, userCorreo);
    	}
       }         
        if (accion!=null && accion!=""){
    	if (accion.equals("insPeriodo")){
    		Periodo Objeto = new Periodo();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            //Gson gsonInsert = new Gson();
            Gson gsonInsert = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
            Objeto=gsonInsert.fromJson(json, Periodo.class);
			SqlInserts.insertPeriodo(Objeto, userCorreo);
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
			SqlInserts.insertSprProducto(productoObj,userCorreo);
    	}
       }
        if (accion!=null && accion!=""){
    	if (accion.equals("insTipoAccion")){
    		TipoAccion objeto = new TipoAccion();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            objeto=gsonInsert.fromJson(json, TipoAccion.class);
			SqlInserts.insertTipoAccion(objeto, userCorreo);
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
			SqlInserts.insertUnidadMedida(productoObj, userCorreo);
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
			SqlInserts.insertWs(productoObj, userCorreo);
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
			SqlInserts.insertWsTipo(productoObj, userCorreo);
    	}
       }
        if (accion!=null && accion!=""){
    	if (accion.equals("insHitoPrueba")){
    		HitoPrueba obj = new HitoPrueba();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            obj=gsonInsert.fromJson(json, HitoPrueba.class);
			SqlInserts.insertHitoPrueba(obj, userCorreo);
    	}
       }
        if (accion!=null && accion!=""){
    	if (accion.equals("insAccionCatalogo")){
    		AccionCatalogo obj = new AccionCatalogo();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            obj=gsonInsert.fromJson(json, AccionCatalogo.class);
			SqlInserts.insertAccionCatalogo(obj, userCorreo);
    	}
       }     
        if (accion!=null && accion!=""){
    	if (accion.equals("insActividad")){
    		Cronograma obj = new Cronograma();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            obj=gsonInsert.fromJson(json, Cronograma.class);
			SqlInserts.insertActividad(obj, userCorreo);
    	}
       }  
        if (accion!=null && accion!=""){
    	if (accion.equals("insProgramacion")){
    		Programacion obj = new Programacion();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
            obj=gsonInsert.fromJson(json, Programacion.class);
            
			try {
				boolean status = SqlInserts.insertProgramacion(obj, userCorreo);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace(); 
			}
    	}
       }    
        
        if (accion!=null && accion!=""){
    	if (accion.equals("insAvance")){
    		Avance obj = new Avance();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
            obj=gsonInsert.fromJson(json, Avance.class);
            try {
            	boolean status = SqlInserts.insertAvance(obj, userCorreo);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
    	}
       }   
        
        if (accion!=null && accion!=""){
    	if (accion.equals("insAvanceCosto")){
    		AvanceCosto obj = new AvanceCosto();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            obj=gsonInsert.fromJson(json, AvanceCosto.class);
            boolean status = SqlInserts.insertAvanceCosto(obj, userCorreo);
    		myObj.addProperty("success", status);
    		out.println(myObj.toString());
    	}
       } 
        
        
        if (accion!=null && accion!=""){
    	if (accion.equals("insAccionDestinatario")){
    		AccionDestinatario obj = new AccionDestinatario();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            obj=gsonInsert.fromJson(json, AccionDestinatario.class);
            boolean status = SqlInserts.insertAccionDestinatario(obj, userCorreo);
    		myObj.addProperty("success", status);
    		out.println(myObj.toString());
    	}
       } 
        
        if (accion!=null && accion!=""){
    	if (accion.equals("insAvanceCualitativo")){
    		AvanceCualitativo objeto = new AvanceCualitativo();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            //Gson gsonInsert = new Gson();
            Gson gsonInsert = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();            
            objeto=gsonInsert.fromJson(json, AvanceCualitativo.class);
			try {
				boolean status = SqlInserts.insertAvanceCualitativo(objeto, userCorreo);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
       }
        
        if (accion!=null && accion!=""){
    	if (accion.equals("insEtiquetaUsuario")){
    		EtiquetaUsuario obj = new EtiquetaUsuario();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            obj=gsonInsert.fromJson(json, EtiquetaUsuario.class);
            boolean status = SqlInserts.insertEtiquetaUsuario(obj,userCorreo);
    		myObj.addProperty("success", status);
    		out.println(myObj.toString());
    	}
       }
        
        if (accion!=null && accion!=""){
    	if (accion.equals("insLineaAccionHasEtiqueta")){
    		InsLineaAccionHasEtiqueta obj = new InsLineaAccionHasEtiqueta();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            obj=gsonInsert.fromJson(json, InsLineaAccionHasEtiqueta.class);
            boolean status = SqlInserts.insertInsLineaAccionHasEtiqueta(obj,userCorreo);
    		myObj.addProperty("success", status);
    		out.println(myObj.toString());
    	}
       } 
        
        if (accion!=null && accion!=""){
    	if (accion.equals("insUsuarioLineaAccion")){
    		UsuarioLineaAccion obj = new UsuarioLineaAccion();
    		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String json = "";
            if(br != null){ json = br.readLine();}
            Gson gsonInsert = new Gson();
            obj=gsonInsert.fromJson(json, UsuarioLineaAccion.class);
            boolean status = SqlInserts.insertUsuarioLineaAccion(obj,userCorreo);
    		myObj.addProperty("success", status);
    		out.println(myObj.toString());
    	}
       }
        if (accion!=null && accion!=""){
        	if (accion.equals("insMigrar")){        		
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String datos = null;
                if(br != null){ datos = br.readLine();}
                boolean status = SqlInserts.insertMigrar(datos);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}
           }
    }
}
