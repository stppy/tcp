package py.gov.stp.tools;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jasig.cas.client.authentication.AttributePrincipal;

import py.gov.stp.tools.SqlSelects;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
/**
 * 	@author DGTIC-STP
 *  @email  dgtic@stp.gov.py 
 */
public class ajaxSelects extends HttpServlet {
 
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  
    	AttributePrincipal user = (AttributePrincipal) request.getUserPrincipal();
    	Map attributes = user.getAttributes(); 
    	String nivelCas =  attributes.get("nivel_id").toString();
    	String entidadCas =  attributes.get("entidad_id").toString();
    	String userRoleId = attributes.get("role_id_tablero").toString();
    	String userCorreo = user.getName();    	
    	
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
    	Integer departamentoId = null;
    	Integer distrito = null;
    	Integer distritoId = null;
    	Integer objetivo = null;
    	Integer estrategia = null;
    	Integer indicador = null;
    	Integer tipoDestinatario = null;
    	Integer snip = null;
    	Integer snipAutorizado = null;
    	Integer funcional = null;
    	Integer catalogoDestinatario = null;
    	Integer hito_id = null;
    	
    	Integer institucion_id=null;
    	Integer accion_id=null;
    	Integer accionId=null;
    	Integer linea_accion_id=null;
    	Integer usuarioId = null;
    	Integer anho = null;
    	Integer periodoId = null; 
    	Integer etiquetaId = null; 	
    	String institucion=null;
    	String usuario=null;
    	String catalogoAccion=null;
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
    	if (request.getParameter("departamentoId")!=null) departamentoId = Integer.parseInt(request.getParameter("departamentoId"));
    	if (request.getParameter("distrito")!=null) distrito = Integer.parseInt(request.getParameter("distrito")); else distrito=99;
    	if (request.getParameter("distritoId")!=null) distritoId = Integer.parseInt(request.getParameter("distritoId"));
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
      	if (request.getParameter("linea_accion_id")!=null) linea_accion_id=Integer.parseInt(request.getParameter("linea_accion_id")); else linea_accion_id=0;
      	if (request.getParameter("hito_id")!=null) hito_id=Integer.parseInt(request.getParameter("hito_id")); else hito_id=0;
      	if (request.getParameter("usuarioId")!=null) usuarioId=Integer.parseInt(request.getParameter("usuarioId"));
      	if (request.getParameter("anho")!=null) anho=Integer.parseInt(request.getParameter("anho"));
      	if (request.getParameter("periodoId")!=null) periodoId=Integer.parseInt(request.getParameter("periodoId"));
      	if (request.getParameter("catalogoAccion")!=null) catalogoAccion = request.getParameter("catalogoAccion");
      	if (request.getParameter("etiquetaId")!=null) etiquetaId=Integer.parseInt(request.getParameter("etiquetaId"));
    	
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
        	
//        	if (action.equals("getLineasAccionSnpp")){
//        		List objetos=null;
//        		condition = " where true ";
//        		if (institucion!="") condition += " and institucion ='"+institucion+"'";
//        		if (institucion_id!=0) condition += " and institucion_id ='"+institucion_id+"'";
//        		if (linea_accion_id!=0) condition += " and linea_accion_id ='"+linea_accion_id+"'";
//        		if (anio!=0) condition += " and date_part ='"+anio+"'";
//        		
//				try {objetos = SqlSelects.seletLineaAccionSnpp(condition);}
//				catch (SQLException e) {e.printStackTrace();}
//        		JsonElement json = new Gson().toJsonTree(objetos);
//        		out.println(json.toString());
//        	}
        	if (action.equals("getLineasAccionDepartamento")){
        		List objetos=null;
        		try {objetos = SqlSelects.selectLineaAccionDepartamento();}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos);
        		out.println(json.toString());
        	}
        	if (action.equals("getLineasAccionDistrito")){
        		List objetos=null;
        		try {objetos = SqlSelects.selectLineaAccionDistrito();}
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
        	if (action.equals("getAccionesAvances")){
        		String objetos=null;
        		condition = " where true ";
        		if (institucion!="") condition += " and institucion_sigla ='"+institucion+"'";
        		if (institucion_id!=0) condition += " and institucion_id ='"+institucion_id+"'";
        		if (linea_accion_id!=0) condition += " and linea_accion_id ='"+linea_accion_id+"'";
        		if (accion!="") condition += " and accion ='"+accion+"'";
        		if (accion_id!=0) condition += " and accion_id ='"+accion_id+"'";        		
        		if (distritoId!=null) condition += " and accion_distrito_id ='"+distritoId+"'";
        		if (departamentoId!=null) condition += " and accion_departamento_id ='"+departamentoId+"'";
        		if (periodoId!=null) condition += " and periodo_id ='"+periodoId+"'";
        		        		
				try {objetos = SqlSelects.selectAccionesAvances(condition);}
				catch (SQLException e) {e.printStackTrace();}				
        		out.println(objetos);return;
        	}
        	if (action.equals("getAccionesAvancesMensual")){
        		String objetos=null;
        		condition = " where true ";
        		if (institucion!="") condition += " and institucion_sigla ='"+institucion+"'";
        		if (institucion_id!=0 && institucion_id != 0) condition += " AND institucion_id ='"+institucion_id+"'";
        		if (linea_accion_id!=0) condition += " and linea_accion_id ='"+linea_accion_id+"'";
        		if (accion!="") condition += " and accion ='"+accion+"'";
        		if (accion_id!=0) condition += " and accion_id ='"+accion_id+"'";        		
        		if (distritoId!=null) condition += " and accion_distrito_id ='"+distritoId+"'";
        		if (departamentoId!=null) condition += " and accion_departamento_id ='"+departamentoId+"'";
        		if (periodoId!=null) condition += " AND periodo ='"+periodoId+"'";
                if (etiquetaId!=null && etiquetaId!=0) condition += " AND etiqueta_id = "+etiquetaId;

        		        		
				try {objetos = SqlSelects.selectAccionesAvancesMensual(condition);}
				catch (SQLException e) {e.printStackTrace();}				
        		out.println(objetos);return;
        	}

//        	if (action.equals("getAccionesAvancesDepto")){
//        		String objetos=null;
//        		condition = " where true ";
//        		if (institucion!="") condition += " and institucion_sigla ='"+institucion+"'";
//        		if (institucion_id!=0) condition += " and institucion_id ='"+institucion_id+"'";
//        		if (linea_accion_id!=0) condition += " and linea_accion_id ='"+linea_accion_id+"'";
//        		if (accion!="") condition += " and accion ='"+accion+"'";
//        		if (accion_id!=0) condition += " and accion_id ='"+accion_id+"'";        		
//        		if (departamentoId!=null) condition += " and accion_departamento_id ='"+departamentoId+"'";
//        		if (periodoId!=null) condition += " and periodo_id ='"+periodoId+"'";
//        		        		
//				try {objetos = SqlSelects.selectAccionesAvancesDepto(condition);}
//				catch (SQLException e) {e.printStackTrace();}				
//        		out.println(objetos);return;
//        	}
//        	if (action.equals("getAccionesAvancesDistrito")){
//        		String objetos=null;
//        		condition = " where true ";
//        		if (institucion!="") condition += " and institucion_sigla ='"+institucion+"'";
//        		if (institucion_id!=0) condition += " and institucion_id ='"+institucion_id+"'";
//        		if (linea_accion_id!=0) condition += " and linea_accion_id ='"+linea_accion_id+"'";
//        		if (accion!="") condition += " and accion ='"+accion+"'";
//        		if (accion_id!=0) condition += " and accion_id ='"+accion_id+"'";
//        		if (distritoId!=null) condition += " and accion_distrito_id ='"+distritoId+"'";
//        		if (departamentoId!=null) condition += " and accion_departamento_id ='"+departamentoId+"'";
//        		if (periodoId!=null) condition += " and periodo_id ='"+periodoId+"'";
//        		        		
//				try {objetos = SqlSelects.selectAccionesAvancesDistrito(condition);}
//				catch (SQLException e) {e.printStackTrace();}				
//        		out.println(objetos);return;
//        	}
         	if (action.equals("getAccionesCatalogoUnidadMedida")){
        		String objetos=null; 
        		condition = " where true ";        		        		        		
        		if (accionId!=null) condition += " and accion_id ='"+accionId+"'";
        		if (catalogoAccion!=null) condition += " and accion_catalogo ='"+catalogoAccion+"'";        		
           		           		
           		try {objetos = SqlSelects.selectAccionesCatalogoUnidadMedida(condition);}
				catch (SQLException e) {e.printStackTrace();}				
        		out.println(objetos);return;        	
        	}
         	if (action.equals("getHitosAvances")){
        		String objetos=null;
        		condition = " where hito_fecha_entrega > '2015-12-31' and hito_fecha_entrega < '2017-01-01'";
        		if (institucion!="") condition += " and institucion ='"+institucion+"'";
        		if (institucion_id!=0) condition += " and institucion_id ='"+institucion_id+"'";
        		if (linea_accion_id!=0) condition += " and linea_accion_id ='"+linea_accion_id+"'";
        		if (accion!="") condition += " and accion ='"+accion+"'";
        		if (accion_id!=0) condition += " and accion_id ='"+accion_id+"'";
        		if (hito_id!=0) condition += " and hito_id ='"+hito_id+"'";
        		if (distritoId!=null) condition += " and accion_distrito_id ='"+distritoId+"'";
        		if (departamentoId!=null) condition += " and accion_departamento_id ='"+departamentoId+"'";
        		
				try {objetos = SqlSelects.selectHitosAvances(condition);}
				catch (SQLException e) {e.printStackTrace();}        		
				out.println(objetos);return;         		
        	}
//         	if (action.equals("getFactHitosSnpp")){
//        		List objetos=null;
//        		condition = " where true ";
//        		if (institucion!="") condition += " and institucion ='"+institucion+"'";
//        		if (institucion_id!=0) condition += " and institucion_id ='"+institucion_id+"'";
//        		if (linea_accion_id!=0) condition += " and linea_accion_id ='"+linea_accion_id+"'";
//        		if (accion!="") condition += " and accion ='"+accion+"'";
//        		if (accion_id!=0) condition += " and accion_id ='"+accion_id+"'";
//        		        		
//				try {objetos = SqlSelects.selectFactHitosSnpp(condition);}
//				catch (SQLException e) {e.printStackTrace();}
//        		JsonElement json = new Gson().toJsonTree(objetos);
//        		out.println(json.toString());
//        	}        	
//        	if (action.equals("getFactHitos2015")){
//        		List objetos=null;
//        		condition = " where hito_fecha_entrega > '2014-12-31' and hito_fecha_entrega < '2016-01-01'";
//        		if (institucion!="") condition += " and institucion ='"+institucion+"'";
//        		if (institucion_id!=0) condition += " and institucion_id ='"+institucion_id+"'";
//        		if (linea_accion_id!=0) condition += " and linea_accion_id ='"+linea_accion_id+"'";
//        		if (accion!="") condition += " and accion ='"+accion+"'";
//        		if (accion_id!=0) condition += " and accion_id ='"+accion_id+"'";
//        		if (departamento!=99) condition += " and accion_departamento_id ='"+departamento+"'";
//        		if (distrito!=99) condition += " and accion_distrito_id ='"+distrito+"'";
//        		if (hito_id!=0) condition += " and hito_id ='"+hito_id+"'";        		
//        		if (db=="20150731") {
//        			try {objetos = SqlSelects.selectFactHitos2015Base(condition);}
//        			catch (SQLException e) {e.printStackTrace();}}
//        		else{
//	        		
//					try {objetos = SqlSelects.selectFactHitos2015(condition);}
//					catch (SQLException e) {e.printStackTrace();}
//	        		JsonElement json = new Gson().toJsonTree(objetos);
//	        		out.println(json.toString());
//        		}
//        	}
//        	if (action.equals("getFactHitos2016")){
//        		List objetos=null;
//        		condition = " where hito_fecha_entrega > '2015-12-31' and hito_fecha_entrega < '2017-01-01'";
//        		if (institucion!="") condition += " and institucion ='"+institucion+"'";
//        		if (institucion_id!=0) condition += " and institucion_id ='"+institucion_id+"'";
//        		if (linea_accion_id!=0) condition += " and linea_accion_id ='"+linea_accion_id+"'";
//        		if (accion!="") condition += " and accion ='"+accion+"'";
//        		if (accion_id!=0) condition += " and accion_id ='"+accion_id+"'";
//        		if (departamento!=99) condition += " and accion_departamento_id ='"+departamento+"'";
//        		if (distrito!=99) condition += " and accion_distrito_id ='"+distrito+"'";
//        		if (hito_id!=0) condition += " and hito_id ='"+hito_id+"'";        		
//        		if (db=="20150731") {
//        			try {objetos = SqlSelects.selectFactHitos2015Base(condition);}
//        			catch (SQLException e) {e.printStackTrace();}}
//        		else{
//	        		
//					try {objetos = SqlSelects.selectFactHitos2015(condition);}
//					catch (SQLException e) {e.printStackTrace();}
//	        		JsonElement json = new Gson().toJsonTree(objetos);
//	        		out.println(json.toString());
//        		}
//        	}
        	if (action.equals("getFactHitos2015Accion")){
        		List objetos=null;
        		condition = " where hito_fecha_entrega > '2014-12-31' and hito_fecha_entrega < '2016-01-01'";
        		if (institucion!="") condition += " and institucion ='"+institucion+"'";
        		if (institucion_id!=0) condition += " and institucion_id ='"+institucion_id+"'";
        		if (linea_accion_id!=0) condition += " and linea_accion_id ='"+linea_accion_id+"'";
        		if (accion!="") condition += " and accion ='"+accion+"'";
        		if (accion_id!=0) condition += " and accion_id ='"+accion_id+"'";
        		if (departamento!=99) condition += " and accion_departamento_id ='"+departamento+"'";
        		if (distrito!=99) condition += " and accion_distrito_id ='"+distrito+"'";
        		if (db=="20150731") {try {objetos = SqlSelects.selectFactHitos2015Accion(condition);}catch (SQLException e) {e.printStackTrace();}}
        		else{
	        		
					try {objetos = SqlSelects.selectFactHitos2015Accion(condition);}
					catch (SQLException e) {e.printStackTrace();}
	        		JsonElement json = new Gson().toJsonTree(objetos);
	        		out.println(json.toString());
        		}
        	}
        	if (action.equals("getFactHitos2016Accion")){
        		List objetos=null;
        		condition = " where hito_fecha_entrega > '2015-12-31' and hito_fecha_entrega < '2017-01-01'";
        		if (institucion!="") condition += " and institucion ='"+institucion+"'";
        		if (institucion_id!=0) condition += " and institucion_id ='"+institucion_id+"'";
        		if (linea_accion_id!=0) condition += " and linea_accion_id ='"+linea_accion_id+"'";
        		if (accion!="") condition += " and accion ='"+accion+"'";
        		if (accion_id!=0) condition += " and accion_id ='"+accion_id+"'";
        		if (departamento!=99) condition += " and accion_departamento_id ='"+departamento+"'";
        		if (distrito!=99) condition += " and accion_distrito_id ='"+distrito+"'";
        		if (db=="20150731") {try {objetos = SqlSelects.selectFactHitos2016Accion(condition);}catch (SQLException e) {e.printStackTrace();}}
        		else{
	        		
					try {objetos = SqlSelects.selectFactHitos2015Accion(condition);}
					catch (SQLException e) {e.printStackTrace();}
	        		JsonElement json = new Gson().toJsonTree(objetos);
	        		out.println(json.toString());
        		}
        	}
        	if (action.equals("getUsuarios")){
        		List objetos=null;
        		condition = "where true ";
        		if (usuario!=null) condition += " and correo ='"+usuario+"'";
        		if (usuarioId!=null) condition += " and id ='"+usuarioId+"'";
        		try {objetos = SqlSelects.selectUsuario(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("usuarios", json);
        		out.println(myObj.toString());
        	}       	
        	
        	if (action.equals("getPass")){
        		List objetos=null;
        		if (usuario!=null) condition = " where correo ='"+usuario+"'";
				try {objetos = SqlSelects.selectUsuario(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("usuarios", json);
        		out.println(myObj.toString());
        	}
        	
        	
        	if (action.equals("getLineaAccionAcumuladoMes")){
        		List objetos=null;
        		condition = "where true ";
        		if (institucion_id!=0) condition += " and institucion_id ='"+institucion_id+"'";
        		if (linea_accion_id!=0) condition += " and linea_accion_id ='"+linea_accion_id+"'";
        		//if (departamento!=99) condition += " and accion_departamento_id ='"+departamento+"'"; 
        		try {objetos = SqlSelects.selectLineaAccionAcumuladoMes(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        		}
        	if (action.equals("getLineaAccionAcumuladoMesDepto")){
        		List objetos=null;
        		condition = "where true ";
        		if (institucion_id!=0) condition += " and institucion_id ='"+institucion_id+"'";
        		if (linea_accion_id!=0) condition += " and linea_accion_id ='"+linea_accion_id+"'";
        		if (departamento!=99) condition += " and accion_departamento_id ='"+departamento+"'"; 
        		try {objetos = SqlSelects.selectLineaAccionAcumuladoMesDepto(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        		}
        	if (action.equals("getLineaAccionAcumuladoMesDistrito")){
        		List objetos=null;
        		condition = "where true ";
        		if (institucion_id!=0) condition += " and institucion_id ='"+institucion_id+"'";
        		if (linea_accion_id!=0) condition += " and linea_accion_id ='"+linea_accion_id+"'";
        		if (departamento!=99) condition += " and accion_departamento_id ='"+departamento+"'";
        		if (distrito!=99) condition += " and accion_distrito_id ='"+distrito+"'"; 
        		try {objetos = SqlSelects.selectLineaAccionAcumuladoMesDistrito(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        		}
        	if (action.equals("getDepartamento")){
        		List objetos=null;
           		try {objetos = SqlSelects.selectDepartamento();}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        		}
        	if (action.equals("getDistrito")){
        		List objetos=null;
        		condition = "where true ";
        		if (departamento!=99) condition += " and departamentoid ='"+departamento+"'";
        		try {objetos = SqlSelects.selectDistritos(condition);}
        		
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        		}
        	if (action.equals("getDesempPaisPorDepto")){
        		List objetos=null;
           		try {objetos = SqlSelects.selectGenerico("", "fact_desemp_depto");}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        		}
        	if (action.equals("getDesempPaisPorDist")){
        		List objetos=null;
           		try {objetos = SqlSelects.selectGenerico2("", "fact_desemp_dist");}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        		}
        	if (action.equals("getDesempPaisPorDistInst")){
        		List objetos=null;
        		condition = "where true ";
        		if (departamento!=99) condition += "and accion_departamento_id="+departamento+" ";
        		if (distrito!=99) condition += "and accion_distrito_id="+distrito+" ";
           		try {objetos = SqlSelects.selectGenerico3(condition, "fact_desemp_dist_inst");}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        		}
        	if (action.equals("getMetasDistEntLinea")){
        		List objetos=null;
        		if (departamento!=99) condition += " AND accion_departamento_id ='"+departamento+"'";
        		if (distrito!=99) condition += " AND accion_distrito_id ='"+distrito+"'";
        		if (institucion_id!=0) condition += " AND institucion_id ='"+institucion_id+"'"; 
        		try {objetos = SqlSelects.selectMetasDistEntLinea(condition);}

        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos);
        		out.println(json.toString());
        	}   
        	
        	if (action.equals("getAccionHasProducto")){
        		List objetos=null;
        		condition = "where true ";
        		if (accion_id!=0) condition += "and accion_id="+accion_id+" ";
        		try {objetos = SqlSelects.selectAccionHasProducto(condition);}

        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos);
        		out.println(json.toString());
        	}
        	
            if (action.equals("getObjetoGastoCosto")){
        		List objetos=null;
        		String condicion = "where true ";
        		
        		if (nivel != null) condicion += "and nivel = "+nivel;
        		if (entidad != null) condicion += " and entidad = "+entidad;
//        		if (tipoPresupuesto != null) condicion += " and tipo = "+tipoPresupuesto;
        		if (programa != null) condicion += " and programa = "+programa;
        		if (subprograma != null) condicion += " and subprograma = "+subprograma;
        		if (proyecto != null) condicion += " and proyecto = "+proyecto;
        		if (producto != null) condicion += " and producto = "+producto;
        		if (anho != null) condicion += " and anho = "+anho;

        		try {objetos = SqlSelects.selectObjetoGastoCosto(condicion);}
    			catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		myObj.addProperty("success", true);
        		myObj.add("producto", json);
                out.println(myObj.toString());
            }
        }
       out.close();
        
    }
}
