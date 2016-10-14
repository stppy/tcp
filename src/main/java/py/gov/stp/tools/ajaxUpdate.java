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

import org.jasig.cas.client.authentication.AttributePrincipal;

import py.gov.stp.tools.SqlSelects;

import com.google.gson.Gson;
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
    	
    	AttributePrincipal user = (AttributePrincipal) request.getUserPrincipal();
    	Map attributes = user.getAttributes(); 
    	String userCorreo = user.getName();
    	
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
        
        /*
        
        CatalogoDestinatario catalogoDestinatarioT = new CatalogoDestinatario();
        PrecioDNCP catalogoDncpT = new  PrecioDNCP(); //catalogoDNC
        Demografia demografiaT = new Demografia();
        Departamento departamentoT = new Departamento();
        DiccionarioDato diccionarioDatoT = new DiccionarioDato();
        EjeEstrategico ejeEstrategicoT = new EjeEstrategico();
        Entidad entidadT = new Entidad();
        Estrategia estrategiaT = new Estrategia();
        EstrategiaHasObjetivo estrategiaHasObjetivoT = new EstrategiaHasObjetivo();
        FuenteFinanciamiento fuenteFinanciamientoT = new FuenteFinanciamiento();
        FuenteVerificacion fuenteVerificacionT = new FuenteVerificacion();
        Funcional funcionalT = new Funcional();
        Indicador indicadorT = new Indicador();
        LineaTransversal lineaTransversalT = new LineaTransversal();
        Mes mesT = new Mes();
        Meta metaT = new Meta();
        MetodoCalculo metodoCalculoT = new MetodoCalculo();
        Modulo moduloT = new Modulo();
        ModuloHasPermiso moduloHasPermisoT = new ModuloHasPermiso();
        Nivel nivelT = new Nivel();
        Objetivo objetivoT = new Objetivo();
        ObjetoDeGasto objetoDeGastoT = new ObjetoDeGasto();
        OrganismoFinanciador organismoFinanciadorT = new OrganismoFinanciador();
        Permiso permisoT = new Permiso();
        Plan planT = new Plan();
        Producto productoT= new Producto();
        ProductoPresupuestoMeta productoPresupuestoMetaT = new ProductoPresupuestoMeta();
        ProductoPresupuesto productoPresupuestoT = new ProductoPresupuesto();
        Programa programaT = new Programa();
        Programatico programaticoT = new Programatico();
        ProgramaticoHasObjetivo programaticoHasObjetivoT = new ProgramaticoHasObjetivo();
        Proyecto proyectoT = new Proyecto();
        ProyectoSNIP proyectoSnipT = new ProyectoSNIP();
        ProyectoSNIPAutorizado proyectoSnipAutorizadoT = new ProyectoSNIPAutorizado();
        Role roleT = new Role();
        SubPrograma subProgramaT = new SubPrograma();
        TipoCatalogoDestinatario tipoCatalogoDestinatarioT = new TipoCatalogoDestinatario();
        TipoDemografica tipoDemograficaT = new TipoDemografica();
        TipoIndicador tipoIndicadorT = new TipoIndicador();
        TipoObjetivo tipoObjetivoT = new TipoObjetivo();
        TipoPresupuesto tipoPresupuestoT = new TipoPresupuesto();
        TipoProgramatico tipoProgramaticoT = new TipoProgramatico();
        TipoZonaGeografica tipoZonaGeograficaT = new TipoZonaGeografica();
        UnidadJerarquica unidadJerarquicaT = new UnidadJerarquica();
        UnidadMedida unidadMedidaT = new UnidadMedida();
        UnidadResponsable unidadResponsableT = new UnidadResponsable();
        Usuario usuarioT = new Usuario();
        ZonaGeografica zonaGeograficaT = new ZonaGeografica();
     

        */
               
        
        /*
        	if (accion.equals("actPass")){
        		List Usuario=null;
        		Usuario usuarioObj = new Usuario();
        		if (passviejo!="" && passnuevo!="" && passnuevo1!=""){}        		
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                usuarioObj=gsonInsert.fromJson(json, Usuario.class);
				SqlUpdates.updateUsuario(usuarioObj);
        	}
        	
        
        */
        
        
        
 
      /*  
        if (accion!=null && accion!=""){
        	if (accion.equals("actEntidad")){
        		List entidades=null;
        		Entidad entidadObj = new Entidad();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                entidadObj=gsonInsert.fromJson(json, Entidad.class);
				SqlUpdates.updateEntidad(entidadObj);
        	}
        	
        }*/
        
        
        
        if (accion!=null && accion!=""){
        	if (accion.equals("actPass")){
        		List entidades=null;
        		Credenciales entidadObj = new Credenciales();
        		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                String json = "";
                if(br != null){ json = br.readLine();}
                Gson gsonInsert = new Gson();
                entidadObj=gsonInsert.fromJson(json, Credenciales.class);
                boolean status = SqlUpdates.updateCredenciales(entidadObj);
        		myObj.addProperty("success", status);
        		out.println(myObj.toString());
        	}
        	
        }        
        
     
    }
}
