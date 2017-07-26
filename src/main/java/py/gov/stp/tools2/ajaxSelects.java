package py.gov.stp.tools2;



import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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

import py.gov.stp.objetosV2.*;
import py.gov.stp.tools.Distrito;
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
  
    	AttributePrincipal user = (AttributePrincipal) request.getUserPrincipal();
    	Map attributes = null; 
    	String userCorreo=""; 
    	String userNivelId="";
    	String userEntidadId="";
    	String userUnrId="";
    	String userRoleId="";
    	
    	if (user!=null){
    		 attributes= user.getAttributes();
    		 userCorreo = user.getName(); 
        	 userNivelId = attributes.get("nivel_id").toString();
        	 userEntidadId = attributes.get("entidad_id").toString();
        	 userUnrId = attributes.get("unr_id").toString();
        	 userRoleId = attributes.get("role_id_tablero").toString();
    	}
    	
    	
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
    	Integer anho = null;
    	String  mes = null;
    	Integer pais = null;
    	Integer departamento = null;
    	Integer distrito = null;
    	Integer objetivo = null; 
    	Integer estrategia = null;
    	Integer indicador = null;
    	Integer tipoDestinatario = null;
    	Integer snip = null;
    	Integer snipAutorizado = null;
    	Integer funcional = null;
    	Integer catalogoDestinatario = null;
    	Integer catalogoAccionId = null;    	
    	Integer version = null;
    	Integer institucion_id=null;
    	Integer accion_id=null;
    	Integer accionId = null;
    	Integer linea_accion_id=null;
    	Integer lineaAccionId=null;
    	Integer insLineaAccionId = null;
    	Integer institucionId = null;
    	Integer periodoId = null;
    	Integer versionId = null;
    	Integer beneficiarioTipoId = null;
    	Integer beneficiarioGrupoId = null;
    	Integer departamentoId = null;// nueva columna
    	Integer distritoId = null;
    	Integer tipo=null;
    	
    	Integer cronogramaId=null;
    	Integer programacionId = null;
    	Integer avanceId = null;
    	Integer actividadId = null;
    	Integer idEvidencia = null;
    	Integer costoId = null;
    	Integer beneficiarioId = null;
    	Integer destinatarioId = null;
    	Integer accionHasProductoId = null;
    	Integer productoObjetoGastoId = null;
    	Integer objetoGastoId = null;    	
    	Integer trimestreId = null;
    	Integer idAvanceCualitativo = null;
    	Integer rolId = null;
    	Integer nivelId = null;
    	Integer entidadId = null;
    	Integer etiquetaId = null;
    	Integer idDocumento = null;
    	
    	String institucion=null;
    	String catalogoAccion = null;
    	String usuario=null;
    	String avanceFecha = null;
    	String condition = "";
    	String conditionIdLAGA = "";
		String conditionAccGA = "";
		String conditionAccCat = "";
		String conditionActGA = "";
		String conditionHitoGA = "";
		String conditionLaHasAreasAga ="";
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
    	String institucionIdConcat = "";
    	String insLineaAccionIdConcat = "";
    	String tabla="";

    	Boolean borrado=null;
    	
    	
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
    	if (request.getParameter("anho")!=null) anho = Integer.parseInt(request.getParameter("anho")); 
    	if (request.getParameter("mes")!=null) mes = request.getParameter("mes");
    	if (request.getParameter("departamento")!=null) departamento = Integer.parseInt(request.getParameter("departamento")); //else departamento=99;
    	if (request.getParameter("distrito")!=null) distrito = Integer.parseInt(request.getParameter("distrito")); //else distrito=99;
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
      	if (request.getParameter("versionId")!=null) versionId=Integer.parseInt(request.getParameter("versionId"));
      	if (request.getParameter("institucionId")!=null) institucionId=Integer.parseInt(request.getParameter("institucionId"));
      	if (request.getParameter("insLineaAccionId")!=null) insLineaAccionId=Integer.parseInt(request.getParameter("insLineaAccionId"));
      	if (request.getParameter("linea_accion_id")!=null) linea_accion_id=Integer.parseInt(request.getParameter("linea_accion_id")); else linea_accion_id=0;
      	if (request.getParameter("lineaAccionId")!=null) lineaAccionId=Integer.parseInt(request.getParameter("lineaAccionId"));
      	if (request.getParameter("catalogoAccionId")!=null) catalogoAccionId=Integer.parseInt(request.getParameter("catalogoAccionId"));
      	if (request.getParameter("catalogoAccion")!=null) catalogoAccion=request.getParameter("catalogoAccion"); 
      	if (request.getParameter("cronogramaId")!=null) cronogramaId=Integer.parseInt(request.getParameter("cronogramaId"));
      	if (request.getParameter("programacionId")!=null) programacionId=Integer.parseInt(request.getParameter("programacionId"));
      	if (request.getParameter("avanceId")!=null) avanceId=Integer.parseInt(request.getParameter("avanceId"));
      	if (request.getParameter("actividadId")!=null) actividadId=Integer.parseInt(request.getParameter("actividadId"));
      	if (request.getParameter("idEvidencia")!=null) idEvidencia=Integer.parseInt(request.getParameter("idEvidencia"));
      	if (request.getParameter("costoId")!=null) costoId=Integer.parseInt(request.getParameter("costoId"));
      	if (request.getParameter("beneficiarioTipoId")!=null) beneficiarioTipoId=Integer.parseInt(request.getParameter("beneficiarioTipoId"));
      	if (request.getParameter("beneficiarioGrupoId")!=null) beneficiarioGrupoId=Integer.parseInt(request.getParameter("beneficiarioGrupoId"));
      	if (request.getParameter("beneficiarioId")!=null) beneficiarioId=Integer.parseInt(request.getParameter("beneficiarioId"));
      	if (request.getParameter("destinatarioId")!=null) destinatarioId=Integer.parseInt(request.getParameter("destinatarioId"));
      	if (request.getParameter("accionHasProductoId")!=null) accionHasProductoId=Integer.parseInt(request.getParameter("accionHasProductoId"));
      	if (request.getParameter("productoObjetoGastoId")!=null) productoObjetoGastoId=Integer.parseInt(request.getParameter("productoObjetoGastoId"));
      	if (request.getParameter("objetoGastoId")!=null) objetoGastoId=Integer.parseInt(request.getParameter("objetoGastoId"));
      	if (request.getParameter("trimestreId")!=null) trimestreId=Integer.parseInt(request.getParameter("trimestreId"));      	
      	if (request.getParameter("idAvanceCualitativo")!=null) idAvanceCualitativo=Integer.parseInt(request.getParameter("idAvanceCualitativo")); 
      	if (request.getParameter("borrado")!=null) borrado=Boolean.parseBoolean(request.getParameter("borrado")); 
      	if (request.getParameter("departamentoId")!=null) departamentoId=Integer.parseInt(request.getParameter("departamentoId")); 
      	if (request.getParameter("distritoId")!=null) distritoId=Integer.parseInt(request.getParameter("distritoId")); 
      	if (request.getParameter("rolId")!=null) rolId=Integer.parseInt(request.getParameter("rolId")); 
      	if (request.getParameter("nivelId")!=null) nivelId=Integer.parseInt(request.getParameter("nivelId"));
      	if (request.getParameter("entidadId")!=null) entidadId=Integer.parseInt(request.getParameter("entidadId")); 
      	if (request.getParameter("institucionIdConcat")!=null) institucionIdConcat=request.getParameter("institucionIdConcat");      	
      	if (request.getParameter("insLineaAccionIdConcat")!=null) insLineaAccionIdConcat=request.getParameter("insLineaAccionIdConcat");
      	if (request.getParameter("etiquetaId")!=null) etiquetaId=Integer.parseInt(request.getParameter("etiquetaId"));
      	if (request.getParameter("idDocumento")!=null) idDocumento= Integer.parseInt(request.getParameter("idDocumento"));
      	if (request.getParameter("tipo")!=null) tipo = Integer.parseInt(request.getParameter("tipo"));
      	if (request.getParameter("version")!=null) version= Integer.parseInt(request.getParameter("version"));
      	if (request.getParameter("tabla")!=null) tabla=request.getParameter("tabla");
      	if (request.getParameter("avanceFecha")!=null) avanceFecha=request.getParameter("avanceFecha");


      	
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
        String callback = request.getParameter("callback");

        
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
        		condition = " where true ";
        		if (avanceId!=null) condition += " and avance_id ='"+avanceId+"'"; 
        		if (idEvidencia!=null) condition += " and id ='"+idEvidencia+"'"; 
           		try {objetos = SqlSelects.selectEvidencia(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());        	        	        	
        	}
        	if (action.equals("getEvidenciaAvanceLineaAccion")){
        		List objetos=null;
        		condition = " ";
        		if (avanceId!=null) condition += " and avance_id ='"+avanceId+"'"; 
        		if (idEvidencia!=null) condition += " and id ='"+idEvidencia+"'";
        		if (lineaAccionId!=null) condition += " and linea_accion.id ='"+lineaAccionId+"'";
        		if (anho!=null) condition += " and ins_linea_accion.periodo_id ="+anho+" and to_char(avance.fecha_entrega,'YYYY') = '"+anho+"'";
        		if (mes!=null) condition += " and to_char(avance.fecha_entrega,'MM') = '"+mes+"'";
        		if (avanceFecha!=null) condition += " and avance.fecha_entrega = '"+avanceFecha+"'";
           		try {objetos = SqlSelects.selectEvidenciaAvanceLineaAccion(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());        	        	        	
        	}  
        	if (action.equals("getTotalEvidenciasPorLineaAccion")){//utilizado en monitoreoInstitucional.jsp
        		String objetos=null;
        		condition = " ";
        		if (lineaAccionId!=null) condition += " and linea_accion.id ='"+lineaAccionId+"'";
        		if (avanceFecha!=null) condition += " and avance.fecha_entrega = '"+avanceFecha+"'";
        		try {objetos = SqlSelects.selectTotalEvidenciasLineaAccion(condition);}
				catch (SQLException e) {e.printStackTrace();}        		
        		
        		out.println(objetos.toString());return;   	        	        	
        	}
        	if (action.equals("getTipoDocumento")){
        		List objetos=null;
        		String condicion = " where true ";
        		if (tipo != null) condicion += " and id ='"+tipo+"'";
        		if (borrado != null) condicion += " and borrado is "+borrado;

        		try {objetos = SqlSelects.selectAllTipoDocumento(condicion);}			
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );        	
                out.println(json.toString());
        	}
        	if (action.equals("getDocumento")){
        		List objetos=null;
        		String condicion = " where true ";
        		if (tipo != null) condicion += " and tipos_id ='"+tipo+"'";
        		if (idDocumento != null) condicion += " and id ='"+idDocumento+"'";
        		
        		try {objetos = SqlSelects.selectAllDocumento(condicion);}			
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
        		condition = " where true";
        		if (avanceId!=null) condition += " and avance_id ='"+avanceId+"'";
        		if (beneficiarioId!=null) condition += " and id ='"+beneficiarioId+"'";

           		try {objetos = SqlSelects.selectBeneficiario(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());        	
        	
        	
       }        	
        	if (action.equals("getBeneficiarioTipo")){
        		List objetos=null;
        		condition = " where true";
        		if (beneficiarioTipoId!=null) condition += " and id ='"+beneficiarioTipoId+"'";
           		try {objetos = SqlSelects.selectBeneficiarioTipo(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());        	
        	
        	
       }
        	if (action.equals("getBeneficiarioGrupo")){
        		List objetos=null;
        		condition = " where true ";
        		if (beneficiarioTipoId!=null) condition += " and tipo_beneficiario_grupo_id ='"+beneficiarioTipoId+"'";
        		if (beneficiarioGrupoId!=null) condition += " and id ='"+beneficiarioGrupoId+"'";

           		try {objetos = SqlSelects.selectBeneficiarioGrupo(condition);}
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
        		if (borrado!=null) condition += " and borrado is "+ borrado;
           		try {objetos = SqlSelects.selectLineaAccion(condition, "");}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}  
        	/* se obtienen las lineas de acción restantes que pueden ser asignadas a una institución */
        	if (action.equals("getLineasAccionRestantes")){
        		List objetos=null; 
        		condition = "";        		
        		if (institucionId!=null) condition += " and ila.institucion_id ='"+institucionId+"'";
        		if (periodoId!=null) condition += " and ila.periodo_id ='"+periodoId+"'";
        		if (versionId!=null) condition += " and ila.version ='"+versionId+"'";        		
        		
           		try {objetos = SqlSelects.selectLineasAccionesRestantes(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}
        	if (action.equals("getInsLineaAccion")){
        		List objetos=null; 
        		condition = " where true ";
        		String condition2 = " where entidad_id="+userEntidadId+" and nivel_id="+userNivelId ;
        		if (!userUnrId.equals("0")){ condition2+= " and unidad_responsable_id="+userUnrId;}
        		condition += " and institucion_id IN (select id from institucion "+condition2+") ";
        		if (insLineaAccionId!=null) condition += " and id ='"+insLineaAccionId+"'";
        		if (periodoId!=null) condition += " and periodo_id ='"+periodoId+"'";        		
           		try {objetos = SqlSelects.selectInsLineaAccion(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}        	
/*===========GOBIERNO ABIERTO==============*/        	
        	if (action.equals("getGobiernoAbierto")){
        		List<AreasAga> areasAgaCat= null;
        		List<LaHasAreasAga> laHasAreasAga= null;
        		List<LineaAccion> children = null;
        		List<InsLineaAccion> insLineaAccion = null;
        		List<LaHasPnd> laHasPnd = null;
        		List<Pnd> pnd = null;
        		List<LaHasOds> laHasOds = null;
        		List<Ods> ods = null; 
        		List<Accion> axion = null; 
        		List<AccionCatalogo> accionCatalogo = null;
        		List<Actividad> actividad = null;
        		List<Institucion> institu = null;
        		List<Hito> hito = null;
        		List<Avance> avances = null;
        		List<Evidencia> eviden = null;
        		
        		ArrayList<AreasAgaGA> objectAreas = new ArrayList <AreasAgaGA>();
                ArrayList<LineaAccionGA> objectLa = new ArrayList<LineaAccionGA>();
                ArrayList<AccionGA> childrenAcc = new ArrayList<AccionGA>();
                ArrayList<EvidenciaGA> childrenAnex = new ArrayList<EvidenciaGA>();
                ArrayList<Object> childrenRes = new ArrayList<Object>();
                ArrayList<PndGA> childrenPnd = new ArrayList<PndGA>();
                ArrayList<OdsGA> childrenOds = new ArrayList<OdsGA>();
                
                String colores[] = new String[4] ;
                colores[0]="#556270";
                colores[1]="#4ECDC4";
                colores[2]="#C7F464";
                colores[3]="#FF6B6B";
                
                //Date fechaFin = new Date();
                
        		condition = "";
        		String condition2 = " where entidad_id="+userEntidadId+" and nivel_id="+userNivelId ;
        		if (!userUnrId.equals("0")){ condition2 += " and unidad_responsable_id="+userUnrId;} ;
        		if (insLineaAccionId!=null) condition += " and id ='"+insLineaAccionId+"'";
        		if (periodoId!=null) condition += " and periodo_id ='"+periodoId+"'";
        		
        			conditionIdLAGA += " WHERE id BETWEEN 235 AND 245 AND borrado = false"; 					//para linea de accion de gobierno abierto
        			conditionAccGA += " WHERE id BETWEEN 7424 AND 7477 AND borrado = false"; 				//para accion de gobierno abierto
        			conditionAccCat += " WHERE borrado = false"; 											//para accion catalogo de gobierno abierto
        			conditionActGA += " WHERE accion_id BETWEEN 7424 AND 7477 AND borrado = false"; 		//para actividad de gobierno abierto
        			conditionHitoGA += " WHERE ins_linea_accion_id BETWEEN 235 AND 245 AND borrado = false"; //para hito de gobierno abierto
        			conditionLaHasAreasAga += "WHERE peso = 1 ";
           		try {
           			areasAgaCat = SqlSelects.selectAreasAgaCat();
           			laHasAreasAga = SqlSelects.selectLaHasAreasAga(conditionLaHasAreasAga);
           			insLineaAccion = SqlSelects.selectInsLineaAccion(condition);
           			children = SqlSelects.selectLineaAccion(condition, conditionIdLAGA);
           			laHasPnd = SqlSelects.selectLaHasPND();
           			pnd = SqlSelects.selectPND();
           			laHasOds = SqlSelects.selectLaHasODS();
           			ods = SqlSelects.selectODS();
           			axion = SqlSelects.selectAccion(condition, conditionAccGA);
           			accionCatalogo = SqlSelects.selectAccionCatalogo(condition, conditionAccCat);
           			actividad = SqlSelects.selectActividad(conditionActGA);
           			institu = SqlSelects.selectInstitucion(condition);
           			hito = SqlSelects.selectHito(conditionHitoGA);
           			avances = SqlSelects.selectAvance(condition);
           			eviden = SqlSelects.selectEvidencia(condition);
           			
           			
           			for(int c = 0; c < areasAgaCat.size(); c += 1){ //
           				objectLa = new ArrayList<LineaAccionGA>();
           				AreasAga aaCat = areasAgaCat.get(c);
           				AreasAgaGA ArAgGA = new AreasAgaGA();
           				ArAgGA.setNombre(aaCat.getNombre());
           				ArAgGA.setColour(colores[c]);
           				for(int b = 0; b < laHasAreasAga.size(); b += 1){
           					if(laHasAreasAga.get(b).getAreasAgaId() == areasAgaCat.get(c).getId()){ // para cada area
		           				for(int e = 0; e < children.size(); e += 1) {
		           					if(laHasAreasAga.get(b).getLineaAccionId() == children.get(e).getId() && 
		           					   laHasAreasAga.get(b).getAreasAgaId() ==  areasAgaCat.get(c).getId()){
		           						childrenAcc = new ArrayList<AccionGA>();
		           						LineaAccion la = children.get(e);
		           						LineaAccionGA laGA = new LineaAccionGA();
		           						laGA.setNombre(la.getNombre());
		           						laGA.setDescripcion(la.getDescripcion());
		           						laGA.setColour(colores[c]);
		           						
		           						childrenPnd = new ArrayList<PndGA>();
		           						for(int d = 0; d < laHasPnd.size(); d += 1){
		           							if(laHasPnd.get(d).getLineaAccionId() == children.get(e).getId()){
		           								for(int f = 0; f < pnd.size(); f += 1){
			           								if(pnd.get(f).getId() == laHasPnd.get(d).getPndId()){				           									
			           									Pnd pnde = pnd.get(f);
			           									LaHasPnd HasPnd = laHasPnd.get(d);
			           									PndGA pndGA = new PndGA();
			           									pndGA.setName(pnde.getNombre());
			           									pndGA.setWeight(HasPnd.getPeso());
			           									childrenPnd.add(pndGA);
			           								}
				           						}
		           							}
		           						}
		           						laGA.setPnd(childrenPnd);
		           						
		           						childrenOds= new ArrayList<OdsGA>();
		           						for(int g = 0; g < laHasOds.size(); g += 1){
		           							if(laHasOds.get(g).getLineaAccionId() == children.get(e).getId()){
		           								for(int h = 0; h < ods.size(); h += 1){
			           								if(ods.get(h).getId() == laHasOds.get(g).getOdsId()){				           									
			           									Ods odse = ods.get(h);
			           									LaHasOds HasOds = laHasOds.get(g);
			           									OdsGA odsGA = new OdsGA();
			           									odsGA.setName(odse.getNombre());
			           									odsGA.setWeight(HasOds.getPeso());
			           									childrenOds.add(odsGA);
			           								}
				           						}
		           							}
		           						}
		           						laGA.setOds(childrenOds);
		           						for(int i = 0; i < axion.size(); i += 1) { 											//se recorren las acciones de cada linea de accion
		           							for(int o = 0; o < accionCatalogo.size(); o += 1) {								//se recorre el catalogo para nombras las acciones
		           								if(accionCatalogo.get(o).getId() == axion.get(i).getAccionCatalogoId()){           									
		           									for (int a = 0; a < insLineaAccion.size(); a += 1) {
			           									if(insLineaAccion.get(a).getId() == axion.get(i).getInsLineaAccionId() && 
			           											insLineaAccion.get(a).getLineaAccionId() == children.get(e).getId()){
			           										AccionCatalogo acc = accionCatalogo.get(o);
			           					           			AccionGA axGA = new AccionGA();
			           										axGA.setNombre(acc.getNombre());
			           										axGA.setDescripcion(acc.getDescripcion());
			           										axGA.setColor(colores[c]);
			           										
			           										childrenRes = new ArrayList<Object>();
			   					           					for(int y = 0; y < institu.size(); y +=1){							//se cargan las instituciones responsables
				           										if(institu.get(y).getId() == insLineaAccion.get(a).getInstitucionId()){
				           											Institucion insti = institu.get(y);
				           											childrenRes.add(insti.getNombre());
				           										}
				           									}
			   					           					axGA.setResponsables(childrenRes);	
				           					           		
			   					           					Date fecha_fin = new Date();
				           					           		for(int x = 0; x < hito.size(); x +=1){								//se cargan las fechas fin
				           										if(hito.get(x).getAccionId() == axion.get(i).getId()){
				           											Hito fechas = hito.get(x);
				           											String fechaFin =  fechas.getFechaEntrega().toString();
						           					           		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
						           					           		fecha_fin = sdf1.parse(fechaFin);
				           										}
				           									}
				           					           		axGA.setFecha_fin(fecha_fin);
				           					           		
				           					           		Date fecha_inicio = new Date();
				           					           		String startDate = "2016-06-01";
				           					           		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
				           					           		fecha_inicio = sdf1.parse(startDate);
				           					           		axGA.setFecha_inicio(fecha_inicio);
			   					           					
				           					           		/*childrenAnex = new ArrayList<EvidenciaGA>();
				           					           		for(int w = 0; w < avances.size(); w +=1){							//carga de anexos
				           					           			for(int u = 0; u < actividad.size(); u+=1){
					           					           			if(avances.get(w).getActividadId() == actividad.get(u).getId()){
					           					           				for(int z = 0; z < eviden.size(); z +=1){
					           					           					if(eviden.get(z).getAvanceId() == avances.get(w).getId()){
					           					           						Evidencia evide = eviden.get(z);
					           					           						EvidenciaGA anexos = new EvidenciaGA();
					           					           						anexos.setDescripcion(evide.getDescripcion());
					           					           						anexos.setUrl(evide.getUrl());
					           					           						childrenAnex.add(anexos);
					           					           					}
					           					           				}
					           					           			}
				           					           			}
				           					           		}
				           					           		axGA.setAnexos(childrenAnex);*/
			           					           			childrenAcc.add(axGA);
			           									}
			           								}
			           							}
			           						}
		           						}
		           						laGA.setAcciones(childrenAcc);
		           						objectLa.add(laGA);
		           					}
		           				}
	           				}
	           			}
           				ArAgGA.setLineaAccion(objectLa);
           				objectAreas.add(ArAgGA);
           			}
           		}
        		catch (SQLException e) {e.printStackTrace();} catch (ParseException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
        		JsonElement json = new Gson().toJsonTree(objectAreas);
        		out.println(json.toString());
        	}
////////////Privot programado        	
        	if (action.equals("getPivotLineasProgramadas")){
        		List objetos=null; 
        		condition = " where true ";
        		String condition2=" where true ";
        		if (!userRoleId.equals("0") && !userRoleId.equals("1")){ 
        			condition2 += " and entidad_id="+userEntidadId+" and nivel_id="+userNivelId;
        			if ( !userUnrId.equals("0") ){
        				condition2+= " and unidad_responsable_id="+userUnrId;
        			}
        		};
        		condition += " and ins_id IN (select id from institucion "+condition2+") ";
        		if (insLineaAccionId!=null) condition += " and id ='"+insLineaAccionId+"'";
           		try {objetos = SqlSelects.selectPivotLineasProgramadas(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}
////////////Pivot Costo Avance
        	if (action.equals("getPivotCostoAvance")){
        		List objetos=null; 
        		condition = " where true ";
        		String condition2=" where true ";
        		if (!userRoleId.equals("0") && !userRoleId.equals("1")){ 
        			condition2 += " and entidad_id="+userEntidadId+" and nivel_id="+userNivelId;
	        		if ( !userUnrId.equals("0") ){
	        			condition2+= " and unidad_responsable_id="+userUnrId;
	        		}
        		};
        		condition += " and ins_id IN (select id from institucion "+condition2+") ";
        		if (insLineaAccionId!=null) condition += " and id ='"+insLineaAccionId+"'";
        		try {objetos = SqlSelects.selectPivotCostoAvance(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        		}
/////////////Pivot Beneficiario Avance
        	if (action.equals("getPivotBeneficiarioAvance")){
        		List objetos=null; 
        		condition = " where true ";
        		String condition2=" where true ";
        		if (!userRoleId.equals("0") && !userRoleId.equals("1")){ 
        			condition2 += " and entidad_id="+userEntidadId+" and nivel_id="+userNivelId;
	        		if ( !userUnrId.equals("0") ){
	        			condition2+= " and unidad_responsable_id="+userUnrId;
	        		}
        		};
        		condition += " and ins_id IN (select id from institucion "+condition2+") ";
        		if (insLineaAccionId!=null) condition += " and id ='"+insLineaAccionId+"'";
        		try {objetos = SqlSelects.selectPivotBeneficiarioAvance(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        		}
////////////Pivot Evidencia Avance        	
        	if (action.equals("getPivotEvidenciaAvance")){
        		List objetos=null; 
        		condition = " where true ";
        		String condition2=" where true ";
        		if (!userRoleId.equals("0") && !userRoleId.equals("1")){ 
        			condition2 += " and entidad_id="+userEntidadId+" and nivel_id="+userNivelId;
	        		if ( !userUnrId.equals("0") ){
	        			condition2+= " and unidad_responsable_id="+userUnrId;
	        		}
        		};
        		condition += " and ins_id IN (select id from institucion "+condition2+") ";
        		if (insLineaAccionId!=null) condition += " and id ='"+insLineaAccionId+"'";
        		try {objetos = SqlSelects.selectPivotEvidenciaAvance(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        		}
////////////Pivot Avance        	
        	if (action.equals("getPivotAvance")){
        		List objetos=null; 
        		condition = " where true ";
        		String condition2=" where true ";
        		if (etiquetaId!=null) condition += " and ins_linea_accion_has_etiqueta.etiqueta_id = "+etiquetaId;
        		if (anho!=null) condition += " and periodo ="+anho+" and to_char(avance_fecha,'YYYY') = '"+anho+"'";
        		if (mes!=null) condition += " and to_char(avance_fecha,'MM') = '"+mes+"'";
        		if (!userRoleId.equals("0") && !userRoleId.equals("1")){ 
        			condition2 += " and entidad_id="+userEntidadId+" and nivel_id="+userNivelId;
	        		if ( !userUnrId.equals("0") ){
	        			condition2+= " and unidad_responsable_id="+userUnrId;
	        		}
        		};
        		condition += " and ins_id IN (select id from institucion "+condition2+") ";
        		if (insLineaAccionId!=null) condition += " and id ='"+insLineaAccionId+"'";
        		try {objetos = SqlSelects.selectPivotAvance(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        		}
////////////Pivot Destinatarios 
        	if (action.equals("getLineaAccionDestinatarios")){
        		List objetos=null; 
        		condition = " where true ";
        		String condition2=" where true ";
        		if (!userRoleId.equals("0") && !userRoleId.equals("1") ){ 
        			condition2 += " and entidad_id="+userEntidadId+" and nivel_id="+userNivelId;
        			if ( !userUnrId.equals("0") ){
        				condition2+= " and unidad_responsable_id="+userUnrId;
        			}
        		};
        		condition += " and ins_id IN (select id from institucion "+condition2+") ";
        		if (insLineaAccionId!=null) condition += " and id ='"+insLineaAccionId+"'";
        		try {objetos = SqlSelects.selectLineaAccionDestinatarios(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}
////////////Pivot Plan de Acción        	
        	if (action.equals("getPivotPlanDeAccion")){
        		List objetos=null;
        		condition = " where true ";
//        		String condition2=" where true ";
//        		if (!userRoleId.equals("0") && !userRoleId.equals("1")){ 
//        			condition2 += " and entidad_id="+userEntidadId+" and nivel_id="+userNivelId;
//	        		if ( !userUnrId.equals("0") ){
//	        			condition2+= " and unidad_responsable_id="+userUnrId;
//	        		}
//        		};
//        		condition += " and ins_id IN (select id from institucion "+condition2+") ";
//        		if (insLineaAccionId!=null) condition += " and id ='"+insLineaAccionId+"'";
        		try {objetos = SqlSelects.selectPivotPlanAccionAvances(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        		}
////////////Pivot Presupuesto   
        	if (action.equals("getPivotLineaAccionPresupuesto")){
        		List objetos=null; 
        		condition = " where true ";
        		String condition2=" where true ";
        		if (!userRoleId.equals("0") && !userRoleId.equals("1")){ 
        			condition2 += " and entidad_id="+userEntidadId+" and nivel_id="+userNivelId;
        			if ( !userUnrId.equals("0") ){
        				condition2+= " and unidad_responsable_id="+userUnrId;
        			}
        		};
        		condition += " and ins_id IN (select id from institucion "+condition2+") ";
        		if (insLineaAccionId!=null) condition += " and id ='"+insLineaAccionId+"'";
        		try {objetos = SqlSelects.selectLineaAccionPresupuesto(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}
           	
        	if (action.equals("getLineasProgramadas")){
        		List objetos=null; 

        		if (institucionId!=null) condition += " and id ='"+institucionId+"'";
        		
        		condition = " where true ";
        		String condition2=" where true ";
        		if (!userRoleId.equals("0") && !userRoleId.equals("1") && !userRoleId.equals("2")){ 
        			condition2 += " and entidad_id="+userEntidadId+" and nivel_id="+userNivelId;
        			if ( !userUnrId.equals("0") ){
        				condition2+= " and unidad_responsable_id="+userUnrId;
        			}
        		};
        		condition += " and ins_id IN (select id from institucion "+condition2+") ";
        		if (insLineaAccionId!=null) condition += " and id ='"+insLineaAccionId+"'";
           		try {objetos = SqlSelects.selectLineasProgramadas(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}
           	
        	if (action.equals("getInstitucion")){
        		List objetos=null;
        		condition = " where true ";
        		if (unidadResponsable!=null) condition += " and unidad_responsable_id ='"+unidadResponsable+"'";
        		String condition2="";
        		if (!userRoleId.equals("0") && !userRoleId.equals("1") && !userRoleId.equals("2")){ 
        			condition2 += " and entidad_id="+userEntidadId+" and nivel_id="+userNivelId;
        			if ( !userUnrId.equals("0") ){
        				condition2+= " and unidad_responsable_id="+userUnrId;
        			}
        		};
        		
        		if (institucionId!=null) condition += " and id ='"+institucionId+"'";
           		try {objetos = SqlSelects.selectInstitucion(condition+condition2);}
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
        	if (action.equals("getVersion")){
        		List objetos=null; 
        		condition = " where true ";
        		if (anho!=null) condition += " and anho ="+anho; 
        		if (versionId!=null) condition += " and nro ='"+versionId+"'"; 
           		try {objetos = SqlSelects.selectVersion(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	} 
        	if (action.equals("getVersionInsLineaAccion")){
        		List objetos=null; 
        		condition = " where true and not borrado ";
        		if (anho!=null) condition += " and periodo_id ="+anho; 
        		if (versionId!=null) condition += " and version ='"+versionId+"'"; 
           		try {objetos = SqlSelects.selectVersionInsLineaAccion(condition);}
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
           		try {objetos = SqlSelects.selectHito(conditionHitoGA);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	} 
        	if (action.equals("getAccion")){
        		List objetos=null; 
        		condition = " where true ";
        		if (lineaAccionId!=null) condition += " and ins_linea_accion_id ='"+lineaAccionId+"'";
        		if (departamento!=null) condition += " and depto_id ='"+departamento+"'";
        		if (distrito!=null) condition += " and dist_id ='"+distrito+"'";
        		if (catalogoAccionId!=null) condition += " and id_accion_catalogo ='"+catalogoAccionId+"'";
        		if (accionId!=null) condition += " and id ='"+accionId+"'";
           		try {objetos = SqlSelects.selectAccion(condition, "");}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}          
        	if (action.equals("getAccionHasProducto")){
        		List objetos=null;
        		condition = " where true and not borrado ";
        		if (accionId!=null) condition += " and accion_id ='"+accionId+"'";
        		if (accionHasProductoId!=null) condition += " and id ='"+accionHasProductoId+"'";
        		if (nivel != null) condition += " and spr_nivel_id ="+nivel;
        		if (entidad!=null) condition += " and spr_entidad_id="+entidad;
        		if (tipoPresupuesto!=null) condition += " and spr_tipo_presupuesto_id="+tipoPresupuesto;
        		if (programa!=null) condition += " and spr_programa_id="+programa;
        		if (subprograma!=null) condition += " and spr_subprograma_id="+subprograma;
        		if (proyecto!=null) condition += " and srp_proyecto_id="+proyecto;
        		if (producto!=null) condition += " and spr_producto_id="+producto;
        		if (anho!=null) condition += " and spr_anho="+anho;
        		if (version!=null) condition += " and spr_version="+version;
//        		if (nivel!=null && entidad!=null && (nivel!=0 && entidad!=0)){
//        			condition+=" and ur.entidad_nivel_id="+nivel+" and ur.entidad_id="+entidad;
//	        		if (unidadResponsable!=null &&(unidadResponsable!= -1)) condition+=" and ur.id="+unidadResponsable+" ";
//        		};
           		try {objetos = SqlSelects.selectAccionHasProducto(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}
        	if (action.equals("getAccionesCatalogoUnidadMedida")){
        		List objetos=null; 
        		condition = " where true ";        		        		        		
        		if (accionId!=null) condition += " and accion_id ='"+accionId+"'";
        		if (catalogoAccion!=null) condition += " and accion ='"+catalogoAccion+"'";        		
           		try {objetos = SqlSelects.selectAccion(condition, "");}
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
           		try {objetos = SqlSelects.selectAccionCatalogo(condition, "");}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}
        	
        	if (action.equals("getAccionCatalogoUM")){
        		List objetos=null; 
        		condition = " where true ";
        		if (catalogoAccionId!=null) condition += " and id ='"+catalogoAccionId+"'";
           		try {objetos = SqlSelects.selectAccionCatalogoUM(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}
        	if (action.equals("getAccionCatalogoPorLineaAccion")){
        		List objetos=null; 
        		condition = " where true";
        		if (insLineaAccionId!=null) condition += " and a.ins_linea_accion_id ='"+insLineaAccionId+"'";        		
           		try {objetos = SqlSelects.selectAccionCatalogoPorLineaAccion(condition);}
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
        		if (actividadId!=null) condition += " and actividad_id ='"+actividadId+"'";

           		try {objetos = SqlSelects.selectProgramacion(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}
        	if (action.equals("getAvance")){
        		List objetos=null; 
        		condition = " where true ";
        		if (actividadId!=null) condition += " and actividad_id ='"+actividadId+"'";
        		if (avanceId!=null) condition += " and id ='"+avanceId+"'";
           		try {objetos = SqlSelects.selectAvance(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}
        	
        	if (action.equals("getAvanceCosto")){
        		List objetos=null; 
        		condition = " where true ";
        		if (avanceId!=null) condition += " and avance_id ='"+avanceId+"'";
        		if (costoId!=null) condition += " and id ='"+costoId+"'";
           		try {objetos = SqlSelects.selectAvanceCosto(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}
        	
        	if (action.equals("getAccionDestinatario")){
        		List objetos=null; 
        		condition = " where true ";
        		if (beneficiarioTipoId!=null) condition += " and beneficiario_tipo_id ='"+beneficiarioTipoId+"'";
        		if (accionId!=null) condition += " and accion_id ='"+accionId+"'";
        		if (beneficiarioGrupoId!=null) condition += " and beneficiario_grupo_id ='"+beneficiarioGrupoId+"'";
        		if (destinatarioId!=null) condition += " and id ='"+destinatarioId+"'";

           		try {objetos = SqlSelects.selectAccionDestinatario(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}
        	
        	if (action.equals("getProductoObjetoGasto")){
        		List objetos=null;
        		condition = " where true";
        		if (accionId!=null) condition += " and accion_id ='"+accionId+"'";
        		if (productoObjetoGastoId!=null) condition += " and id ='"+productoObjetoGastoId+"'";
           		try {objetos = SqlSelects.selectProductoObjetoGasto(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());        	
        	}
        	if (action.equals("getProductos")){
        		List productos=null;
        		if (producto!=null ) condition = " where id ="+producto.toString();
				try {productos = SqlSelects.selectAllProductosSPR(condition);}
				catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(productos );
        		out.println(json.toString());          		
          	}
        	//usado para selector de filtros en reporte pnd -- Re-utilizado del spr 
        	if (action.equals("getProductosPresupuestoPND")){
        		String objetos=null;
        		String condicion =" where true ";

        		if (nivel != null) condicion += " and pp.proyecto_subprograma_programa_entidad_nivel_id ="+nivel;
        		if (entidad!=null) condicion += " and pp.proyecto_subprograma_programa_entidad_id="+entidad;
        		if (tipoPresupuesto!=null) condicion += " and pp.proyecto_subprograma_programa_tipo_presupuesto_id="+tipoPresupuesto;
        		if (programa!=null) condicion += " and pp.proyecto_subprograma_programa_id="+programa;
        		if (subprograma!=null) condicion += " and pp.proyecto_subprograma_id="+subprograma;
        		if (proyecto!=null) condicion += " and pp.proyecto_id="+proyecto;
        		if (producto!=null) condicion += " and pp.producto_id="+producto;
        		if (anho!=null) condicion += " and pp.anho="+anho;
        		if (version!=null) condicion += " and pp.version="+version;
        		if (nivel!=null && entidad!=null && (nivel!=0 && entidad!=0)){
        			condition+=" and ur.entidad_nivel_id="+nivel+" and ur.entidad_id="+entidad;
	        		if (unidadResponsable!=null &&(unidadResponsable!= -1)) condicion+=" and ur.id="+unidadResponsable+" ";
        		};
        		if (borrado!=null) condicion += " and pp.borrado is "+ borrado;
        		
        		try {objetos = SqlSelects.selectAllProductosPresupuestoPND(condicion);}
				catch (SQLException e) {e.printStackTrace();}        		
        		
        		out.println(objetos.toString());return;
        	}
        	if (action.equals("getProgramacionPorMes")){
        		List objetos=null;
        		if (actividadId!=null) condition += " and actividad_id ='"+actividadId+"'";
           		try {objetos = SqlSelects.selectProgramacionPorMes(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());        	
        	}
        	if (action.equals("getTrimestre")){
        		List objetos=null;
        		condition = " where true";
        		if (trimestreId!=null) condition += " and id ='"+trimestreId+"'";
           		try {objetos = SqlSelects.selectTrimestre(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());        	
        	}
        	if (action.equals("getAvanceCualitativo")){
        		List objetos=null;
        		condition = " where true";
        		if (insLineaAccionId!=null) condition += " and ins_linea_accion_id ='"+insLineaAccionId+"'";
        		if (idAvanceCualitativo!=null) condition += " and id ='"+idAvanceCualitativo+"'";        		
           		try {objetos = SqlSelects.selectAvanceCualitativo(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());        	
        	}
        	

        	if (action.equals("getResumenLineasAccionProgramacion")){
        		List objetos=null; 
        		condition = " where true";


//        		if (institucionId!=null) condition += " and id ='"+institucionId+"'";
//        		
//        		String condition2="";
//        		if (!userRoleId.equals("0") && !userRoleId.equals("1") && !userRoleId.equals("2")){ 
//        			condition2 += " and entidad_id="+userEntidadId+" and nivel_id="+userNivelId;
//        			if ( !userUnrId.equals("0") ){
//        				condition2+= " and unidad_responsable_id="+userUnrId;
//        			}
//        		};
//        		condition += " and ins_id IN (select id from institucion "+condition2+") ";
//        		if (insLineaAccionId!=null) condition += " and id ='"+insLineaAccionId+"'";
        		if (institucionId!=null) condition += " and ins_linea_accion_base.institucion_id='"+institucionId+"'";
                if (institucionIdConcat!="" && institucionIdConcat!=null) condition += " and ins_linea_accion_base.institucion_id in("+institucionIdConcat+")";
                if (departamentoId!=null) condition += " and ins_linea_accion_base.depto_id='"+departamentoId+"'";
                if (distritoId!=null) condition += " and ins_linea_accion_base.dist_id='"+distritoId+"'";
                if (periodoId!=null) condition += " and periodo ='"+periodoId+"'";
           		try {objetos = SqlSelects.selectResumenLineasAccionProgramacion(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}
        	
        	if (action.equals("getResumenLineasAccionProgramacionDepto")){
        		List objetos=null; 
        		if (institucionId!=null) condition += " and ins_linea_accion_base_dd.institucion_id='"+institucionId+"'";
        		if (institucionIdConcat!=null) condition += " and ins_linea_accion_base_dd.institucion_id in("+institucionIdConcat+")";
        		if (departamento!=null) condition += " and ins_linea_accion_base_dd.depto_id ='"+departamento+"'";
        		if (distritoId!=null) condition += " and ins_linea_accion_base_dd.dist_id='"+distritoId+"'";
           		try {objetos = SqlSelects.selectResumenLineasAccionProgramacionDepto(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}
        	if (action.equals("getResumenLineasAccionProgramacionInstitucion")){
        		List objetos=null; 
        		if (institucionId!=null) condition += " and ins_linea_accion_base.institucion_id ='"+institucionId+"'";
        		if (departamentoId!=null) condition += " and ins_linea_accion_base_dd.depto_id='"+departamentoId+"'";
           		try {objetos = SqlSelects.selectResumenLineasAccionProgramacionInstitucion(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}
        	if (action.equals("getResumenLineasAccionProgramacionInstDptoDist")){
                List<LineaAccionProgramacion> objetos=null;
                ArrayList<Object> desempenhoDpto= new ArrayList<Object>();
                if (institucionId!=null) condition += " and ins_linea_accion_base_dd.institucion_id='"+institucionId+"'";
                if (departamentoId!=null) condition += " and ins_linea_accion_base_dd.depto_id='"+departamentoId+"'";
                if (distritoId!=null) condition += " and ins_linea_accion_base_dd.dist_id='"+distritoId+"'";
                try {                	
                	double acum=0, promedio=0;
                	int cont=0;
                	objetos = SqlSelects.selectResumenLineasAccionProgramacionInstDptoDist(condition);
                
                	if(institucionId==null && departamentoId==null && distritoId==null){
                		for (int x = 0; x < 18; x += 1) {
                			acum=0; promedio=0; cont=0;
    						for (int i = 0; i < objetos.size(); i += 1) {
    							if(x == objetos.get(i).getDepartamentoId()){
    								if ((objetos.get(i).getCantidadHoy() == 0 || objetos.get(i).getCantidadHoy() == null) && objetos.get(i).getCantidadAvance() > 0) {	
										acum += 100;
										cont+=1;
									} else if (objetos.get(i).getCantidadHoy() > 0 && (objetos.get(i).getCantidadAvance() == 0 || objetos.get(i).getCantidadAvance() == null)) {
										acum += 0;
										cont+=1;
									} else if ((objetos.get(i).getCantidadHoy() == 0 || objetos.get(i).getCantidadHoy() == null) && (objetos.get(i).getCantidadAvance() == 0 || objetos.get(i).getCantidadAvance() == null)) {
										acum += 0;
									} else {
										acum += objetos.get(i).getCantidadAvance() / objetos.get(i).getCantidadHoy() * 100;
										cont+=1;
									}
    							}
    						}
    						if(cont != 0){
    							promedio = acum / cont;
    						}
    						desempenhoDpto.add(promedio);
    					}//fin deparmento
                	}else{
						for (int i = 0; i < objetos.size(); i += 1) {
							if ((objetos.get(i).getCantidadHoy() == 0 || objetos.get(i).getCantidadHoy() == null) && objetos.get(i).getCantidadAvance() > 0) {	
								acum += 100;
								cont+=1;
							} else if (objetos.get(i).getCantidadHoy() > 0 && (objetos.get(i).getCantidadAvance() == 0 || objetos.get(i).getCantidadAvance() == null)) {
								acum += 0;
								cont+=1;
							} else if ((objetos.get(i).getCantidadHoy() == 0 || objetos.get(i).getCantidadHoy() == null) && (objetos.get(i).getCantidadAvance() == 0 || objetos.get(i).getCantidadAvance() == null)) {
								acum += 0;
							} else {
								acum += objetos.get(i).getCantidadAvance() / objetos.get(i).getCantidadHoy() * 100;
								cont+=1;
							}
						}
						if(cont != 0){
							promedio = acum / cont;
						}
						desempenhoDpto.add(promedio);
                	}
				}catch (SQLException e) {e.printStackTrace();}
                JsonElement json = new Gson().toJsonTree(desempenhoDpto);
                out.println(json.toString());
            } 
        	
        	if (action.equals("getResumenLineasAccionProgramacionInstDptoDist3")){
        		List<LineaAccionProgramacion> objetos=null;
        		ArrayList<DesempDistrito> desempenhoDist= new  ArrayList<DesempDistrito>();              		
	            if (departamentoId!=null) condition += " and ins_linea_accion_base_dd.depto_id='"+departamentoId+"'";
	            if (distritoId!=null) condition += " and ins_linea_accion_base_dd.dist_id='"+distritoId+"'";
                try {                	
                	double acum=0, promedio=0;
                	int cont=0;
                	objetos = SqlSelects.selectResumenLineasAccionProgramacionInstDptoDist3(condition);
                                	             	
        			acum=0; promedio=0; cont=0; 
        			int distritoAct = 0;
        			int departamentoAct = 0;                			
						for (int i = 0; i < objetos.size(); i += 1) {
							
							if (i==0){/*Se almacenan los valores del departamento y el distrito en variables
								la primera vez para comenzar el proceso de corte y control.*/
								departamentoAct = objetos.get(i).getDepartamentoId();
								distritoAct = objetos.get(i).getDistritoId();    									
							}
							
							if (departamentoAct == objetos.get(i).getDepartamentoId()){//realiza el corte por departamento.
								
    							if (distritoAct == objetos.get(i).getDistritoId()){//realiza el corte por distrito.
    								/*si el valor del distrito no cambia se realiza el proceso de obtención del desempeño 
    								y acumulación para el distrito actual.*/
    								if ((objetos.get(i).getCantidadHoy() == 0 || objetos.get(i).getCantidadHoy() == null) && objetos.get(i).getCantidadAvance() > 0) {	
										acum += 100;
										cont+=1;
									} else if (objetos.get(i).getCantidadHoy() > 0 && (objetos.get(i).getCantidadAvance() == 0 || objetos.get(i).getCantidadAvance() == null)) {
										acum += 0;
										cont+=1;
									} else if ((objetos.get(i).getCantidadHoy() == 0 || objetos.get(i).getCantidadHoy() == null) && (objetos.get(i).getCantidadAvance() == 0 || objetos.get(i).getCantidadAvance() == null)) {
										acum += 0;
									} else {
										acum += objetos.get(i).getCantidadAvance() / objetos.get(i).getCantidadHoy() * 100;
										cont+=1;
									}
									
									//Si es el último elemento, realiza el promedio y almacena el desemp. en el array.
		    						if (i == (objetos.size()-1)){
		    							if(cont != 0){
			    							promedio = acum / cont;
			    						}    							
		    							DesempDistrito desempDist = new DesempDistrito();
			    						desempDist.setClave1(departamentoAct);
			    						desempDist.setClave2(distritoAct);
			    						desempDist.setValor(promedio);
			    						desempenhoDist.add(desempDist);
		    						}
    							} else {//si la condición no se cumple realiza el corte por distritos.
    								
    								//procesa los datos del distrito anterior.
		    						if(cont != 0){
		    							promedio = acum / cont;
		    						}    							
		    						DesempDistrito desempDist = new DesempDistrito();
		    						desempDist.setClave1(departamentoAct);
		    						desempDist.setClave2(distritoAct);
		    						desempDist.setValor(promedio);
		    						desempenhoDist.add(desempDist);
		    						
		    						//cera de vuelta para el distrito que realizó el corte.
		    						departamentoAct = objetos.get(i).getDepartamentoId();
									distritoAct = objetos.get(i).getDistritoId();
		    						acum=0;
		    						promedio=0;
		    						cont=0;
		    						
		    						//realiza el proceso de obtención del desempeño para el distrito que realizo el corte.				    					
		    						if ((objetos.get(i).getCantidadHoy() == 0 || objetos.get(i).getCantidadHoy() == null) && objetos.get(i).getCantidadAvance() > 0) {	
										acum += 100;
										cont+=1;
									} else if (objetos.get(i).getCantidadHoy() > 0 && (objetos.get(i).getCantidadAvance() == 0 || objetos.get(i).getCantidadAvance() == null)) {
										acum += 0;
										cont+=1;
									} else if ((objetos.get(i).getCantidadHoy() == 0 || objetos.get(i).getCantidadHoy() == null) && (objetos.get(i).getCantidadAvance() == 0 || objetos.get(i).getCantidadAvance() == null)) {
										acum += 0;
									} else {
										acum += objetos.get(i).getCantidadAvance() / objetos.get(i).getCantidadHoy() * 100;
										cont+=1;
									}
		    						
		    						//Si es el último elemento, realiza el promedio y almacena el desemp. en el array.
		    						if (i == (objetos.size()-1)){
		    							if(cont != 0){
			    							promedio = acum / cont;
			    						}    							
			    						desempDist = new DesempDistrito();
			    						desempDist.setClave1(departamentoAct);
			    						desempDist.setClave2(distritoAct);
			    						desempDist.setValor(promedio);
			    						desempenhoDist.add(desempDist);
		    						}
    							}	    							
							} else {
								//procesa los datos del distrito del departamento anterior.
	    						if(cont != 0){
	    							promedio = acum / cont;
	    						}    							
	    						DesempDistrito desempDist = new DesempDistrito();
	    						desempDist.setClave1(departamentoAct);
	    						desempDist.setClave2(distritoAct);
	    						desempDist.setValor(promedio);
	    						desempenhoDist.add(desempDist);
	    						
	    						//cera de vuelta para el departamento que realizó el corte.
	    						departamentoAct = objetos.get(i).getDepartamentoId();
								distritoAct = objetos.get(i).getDistritoId();
	    						acum=0;
	    						promedio=0;
	    						cont=0;
							}
							
						}                			
				}catch (SQLException e) {e.printStackTrace();}
                JsonElement json = new Gson().toJsonTree(desempenhoDist);
                out.println(json.toString());
            } 
        	
        	if (action.equals("getResumenLineasAccionProgramacionInstDptoDist4")){
        		List<LineaAccionProgramacion> objetos = new ArrayList<LineaAccionProgramacion>();
        		ArrayList<DesempDistritoInst> desempenhoInstDist= new  ArrayList<DesempDistritoInst>();
	    		if (institucionId!=null) condition += " and ins_linea_accion_base_dd.institucion_id='"+institucionId+"'";
	            if (departamentoId!=null) condition += " and ins_linea_accion_base_dd.depto_id='"+departamentoId+"'";
	            if (distritoId!=null) condition += " and ins_linea_accion_base_dd.dist_id='"+distritoId+"'";
                try {                	
                	double acum=0, promedio=0;
                	int cont=0;
                	objetos = SqlSelects.selectResumenLineasAccionProgramacionInstDptoDist4(condition);
                                	             	
        			acum=0; promedio=0; cont=0; 
        			int distritoAct = 0;
        			int departamentoAct = 0;
        			int institucionAct = 0; 
						for (int i = 0; i < objetos.size(); i += 1) {
							
							if (i==0){/*Se almacenan los valores del departamento y el distrito en variables
								la primera vez para comenzar el proceso de corte y control.*/
								institucionAct = objetos.get(i).getInstitucionId();
								departamentoAct = objetos.get(i).getDepartamentoId();
								distritoAct = objetos.get(i).getDistritoId();    									
							}
							
							if (institucionAct == objetos.get(i).getInstitucionId()){//realiza el corte por institucion.
							
								if (departamentoAct == objetos.get(i).getDepartamentoId()){//realiza el corte por departamento.
									
	    							if (distritoAct == objetos.get(i).getDistritoId()){//realiza el corte por distrito.
	    								
	    								/*si el valor del distrito no cambia se realiza el proceso de obtención del desempeño 
	    								y acumulación para el distrito actual.*/
										if ((objetos.get(i).getCantidadHoy() == 0 || objetos.get(i).getCantidadHoy() == null) && objetos.get(i).getCantidadAvance() > 0) {	
											acum += 100;
											cont++;
										} else if (objetos.get(i).getCantidadHoy() > 0 && (objetos.get(i).getCantidadAvance() == 0 || objetos.get(i).getCantidadAvance() == null)) {
											acum += 0;
											cont++;
										} else if ((objetos.get(i).getCantidadHoy() == 0 || objetos.get(i).getCantidadHoy() == null) && (objetos.get(i).getCantidadAvance() == 0 || objetos.get(i).getCantidadAvance() == null)) {
											acum += 0;
										} else {
											acum += objetos.get(i).getCantidadAvance() / objetos.get(i).getCantidadHoy() * 100;
											cont++;
										}
										
										//Si es el último elemento, realiza el promedio y almacena el desemp. en el array.
			    						if (i == (objetos.size()-1)){
			    							if(cont != 0){
				    							promedio = acum / cont;
				    						}    							
			    							DesempDistritoInst desempDistInst = new DesempDistritoInst();
			    							desempDistInst.setClave1(departamentoAct);
			    							desempDistInst.setClave2(distritoAct);
			    							desempDistInst.setClave3(institucionAct);
			    							desempDistInst.setValor(promedio);
				    						desempenhoInstDist.add(desempDistInst);
			    						}
	    							} else {//si la condición no se cumple realiza el corte por distritos.
	    								
	    								//procesa los datos del distrito anterior.
			    						if(cont != 0){
			    							promedio = acum / cont;
			    						}    							
			    						DesempDistritoInst desempDistInst = new DesempDistritoInst();
			    						desempDistInst.setClave1(departamentoAct);
			    						desempDistInst.setClave2(distritoAct);
			    						desempDistInst.setClave3(institucionAct);
			    						desempDistInst.setValor(promedio);
			    						desempenhoInstDist.add(desempDistInst);
			    						
			    						//cera de vuelta para el distrito que realizó el corte.
			    						departamentoAct = objetos.get(i).getDepartamentoId();
										distritoAct = objetos.get(i).getDistritoId();
			    						acum=0;
			    						promedio=0;
			    						cont=0;
			    						
			    						//realiza el proceso de obtención del desempeño para el distrito que realizo el corte.				    					
			    						if ((objetos.get(i).getCantidadHoy() == 0 || objetos.get(i).getCantidadHoy() == null) && objetos.get(i).getCantidadAvance() > 0) {	
											acum += 100;
											cont++;
										} else if (objetos.get(i).getCantidadHoy() > 0 && (objetos.get(i).getCantidadAvance() == 0 || objetos.get(i).getCantidadAvance() == null)) {
											acum += 0;
											cont++;
										} else if ((objetos.get(i).getCantidadHoy() == 0 || objetos.get(i).getCantidadHoy() == null) && (objetos.get(i).getCantidadAvance() == 0 || objetos.get(i).getCantidadAvance() == null)) {
											acum += 0;
										} else {
											acum += objetos.get(i).getCantidadAvance() / objetos.get(i).getCantidadHoy() * 100;
											cont++;
										}
			    						
			    						//Si es el último elemento, realiza el promedio y almacena el desemp. en el array.
			    						if (i == (objetos.size()-1)){
			    							if(cont != 0){
				    							promedio = acum / cont;
				    						}    							
			    							desempDistInst = new DesempDistritoInst();
			    							desempDistInst.setClave1(departamentoAct);
			    							desempDistInst.setClave2(distritoAct);
			    							desempDistInst.setClave3(institucionAct);
			    							desempDistInst.setValor(promedio);
				    						desempenhoInstDist.add(desempDistInst);
			    						}
	    							}	    							
								} else {
									//procesa los datos del distrito del departamento anterior.
		    						if(cont != 0){
		    							promedio = acum / cont;
		    						}    							
		    						DesempDistritoInst desempDistInst = new DesempDistritoInst();
		    						desempDistInst.setClave1(departamentoAct);
		    						desempDistInst.setClave2(distritoAct);
		    						desempDistInst.setClave3(institucionAct);
		    						desempDistInst.setValor(promedio);
		    						desempenhoInstDist.add(desempDistInst);
		    						
		    						//cera de vuelta para el departamento que realizó el corte.
		    						departamentoAct = objetos.get(i).getDepartamentoId();
									distritoAct = objetos.get(i).getDistritoId();
		    						acum=0;
		    						promedio=0;
		    						cont=0;
								}
							} else {
								/*procesa los datos de la institucion, el distrito y del departamento anterior 
								  cuando la institucion no es igual a la anterior.*/
	    						if(cont != 0){
	    							promedio = acum / cont;
	    						}    							
	    						DesempDistritoInst desempDistInst = new DesempDistritoInst();
	    						desempDistInst.setClave1(departamentoAct);
	    						desempDistInst.setClave2(distritoAct);
	    						desempDistInst.setClave3(institucionAct);
	    						desempDistInst.setValor(promedio);
	    						desempenhoInstDist.add(desempDistInst);
	    						
	    						//cera de vuelta para el departamento que realizó el corte.
	    						institucionAct = objetos.get(i).getInstitucionId();
	    						departamentoAct = objetos.get(i).getDepartamentoId();
								distritoAct = objetos.get(i).getDistritoId();								
	    						acum=0;
	    						promedio=0;
	    						cont=0;
							}
							
						}                			
				}catch (SQLException e) {e.printStackTrace();}
                JsonElement json = new Gson().toJsonTree(desempenhoInstDist);
                out.println(json.toString());
            }
        	
        	
        	if (action.equals("getResumenLineasAccionProgramacionDptoDistInst")){
        		List<LineaAccionProgramacion> objetos = new ArrayList<LineaAccionProgramacion>();
        		ArrayList<DesempDistritoInst> desempenhoInstDist= new  ArrayList<DesempDistritoInst>();
        		condition = " where true";
	    		if (institucionId!=null) condition += " and ins_linea_accion_base_dd.institucion_id='"+institucionId+"'";
	            if (departamentoId!=null) condition += " and ins_linea_accion_base_dd.depto_id='"+departamentoId+"'";
	            if (distritoId!=null) condition += " and ins_linea_accion_base_dd.dist_id='"+distritoId+"'";
	            if (periodoId!=null) condition += " and periodo ='"+periodoId+"'";
	            
                try {                	
                	double acum=0, promedio=0;
                	int cont=0;
                	objetos = SqlSelects.selectResumenLineasAccionProgramacionDptoDistInst (condition);
                                	             	
        			acum=0; promedio=0; cont=0; 
        			int distritoAct = 0;
        			int departamentoAct = 0;
        			int institucionAct = 0; 
						for (int i = 0; i < objetos.size(); i += 1) {
							
							if (i==0){/*Se almacenan los valores del departamento y el distrito en variables
								la primera vez para comenzar el proceso de corte y control.*/
								institucionAct = objetos.get(i).getInstitucionId();
								departamentoAct = objetos.get(i).getDepartamentoId();
								distritoAct = objetos.get(i).getDistritoId();    									
							}
							
							if (institucionAct == objetos.get(i).getInstitucionId()){//realiza el corte por institucion.
							
								if (departamentoAct == objetos.get(i).getDepartamentoId()){//realiza el corte por departamento.
									
	    							if (distritoAct == objetos.get(i).getDistritoId()){//realiza el corte por distrito.
	    								
	    								/*si el valor del distrito no cambia se realiza el proceso de obtención del desempeño 
	    								y acumulación para el distrito actual.*/
										if ((objetos.get(i).getCantidadHoy() == 0 || objetos.get(i).getCantidadHoy() == null) && objetos.get(i).getCantidadAvance() > 0) {	
											acum += 100;
											cont++;
										} else if (objetos.get(i).getCantidadHoy() > 0 && (objetos.get(i).getCantidadAvance() == 0 || objetos.get(i).getCantidadAvance() == null)) {
											acum += 0;
											cont++;
										} else if ((objetos.get(i).getCantidadHoy() == 0 || objetos.get(i).getCantidadHoy() == null) && (objetos.get(i).getCantidadAvance() == 0 || objetos.get(i).getCantidadAvance() == null)) {
											acum += 0;
										} else {
											acum += objetos.get(i).getCantidadAvance() / objetos.get(i).getCantidadHoy() * 100;
											cont++;
										}
										
										//Si es el último elemento, realiza el promedio y almacena el desemp. en el array.
			    						if (i == (objetos.size()-1)){
			    							if(cont != 0){
				    							promedio = acum / cont;
				    						}    							
			    							DesempDistritoInst desempDistInst = new DesempDistritoInst();
			    							desempDistInst.setClave1(departamentoAct);
			    							desempDistInst.setClave2(distritoAct);
			    							desempDistInst.setClave3(institucionAct);
			    							desempDistInst.setValor(promedio);
				    						desempenhoInstDist.add(desempDistInst);
			    						}
	    							} else {//si la condición no se cumple realiza el corte por distritos.
	    								
	    								//procesa los datos del distrito anterior.
			    						if(cont != 0){
			    							promedio = acum / cont;
			    						}    							
			    						DesempDistritoInst desempDistInst = new DesempDistritoInst();
			    						desempDistInst.setClave1(departamentoAct);
			    						desempDistInst.setClave2(distritoAct);
			    						desempDistInst.setClave3(institucionAct);
			    						desempDistInst.setValor(promedio);
			    						desempenhoInstDist.add(desempDistInst);
			    						
			    						//cera de vuelta para el distrito que realizó el corte.
			    						departamentoAct = objetos.get(i).getDepartamentoId();
										distritoAct = objetos.get(i).getDistritoId();
			    						acum=0;
			    						promedio=0;
			    						cont=0;
			    						
			    						//realiza el proceso de obtención del desempeño para el distrito que realizo el corte.				    					
			    						if ((objetos.get(i).getCantidadHoy() == 0 || objetos.get(i).getCantidadHoy() == null) && objetos.get(i).getCantidadAvance() > 0) {	
											acum += 100;
											cont++;
										} else if (objetos.get(i).getCantidadHoy() > 0 && (objetos.get(i).getCantidadAvance() == 0 || objetos.get(i).getCantidadAvance() == null)) {
											acum += 0;
											cont++;
										} else if ((objetos.get(i).getCantidadHoy() == 0 || objetos.get(i).getCantidadHoy() == null) && (objetos.get(i).getCantidadAvance() == 0 || objetos.get(i).getCantidadAvance() == null)) {
											acum += 0;
										} else {
											acum += objetos.get(i).getCantidadAvance() / objetos.get(i).getCantidadHoy() * 100;
											cont++;
										}
			    						
			    						//Si es el último elemento, realiza el promedio y almacena el desemp. en el array.
			    						if (i == (objetos.size()-1)){
			    							if(cont != 0){
				    							promedio = acum / cont;
				    						}    							
			    							desempDistInst = new DesempDistritoInst();
			    							desempDistInst.setClave1(departamentoAct);
			    							desempDistInst.setClave2(distritoAct);
			    							desempDistInst.setClave3(institucionAct);
			    							desempDistInst.setValor(promedio);
				    						desempenhoInstDist.add(desempDistInst);
			    						}
	    							}	    							
								} else {
									//procesa los datos del distrito del departamento anterior.
		    						if(cont != 0){
		    							promedio = acum / cont;
		    						}    							
		    						DesempDistritoInst desempDistInst = new DesempDistritoInst();
		    						desempDistInst.setClave1(departamentoAct);
		    						desempDistInst.setClave2(distritoAct);
		    						desempDistInst.setClave3(institucionAct);
		    						desempDistInst.setValor(promedio);
		    						desempenhoInstDist.add(desempDistInst);
		    						
		    						//cera de vuelta para el departamento que realizó el corte.
		    						departamentoAct = objetos.get(i).getDepartamentoId();
									distritoAct = objetos.get(i).getDistritoId();
		    						acum=0;
		    						promedio=0;
		    						cont=0;
								}
							} else {
								/*procesa los datos de la institucion, el distrito y del departamento anterior 
								  cuando la institucion no es igual a la anterior.*/
	    						if(cont != 0){
	    							promedio = acum / cont;
	    						}    							
	    						DesempDistritoInst desempDistInst = new DesempDistritoInst();
	    						desempDistInst.setClave1(departamentoAct);
	    						desempDistInst.setClave2(distritoAct);
	    						desempDistInst.setClave3(institucionAct);
	    						desempDistInst.setValor(promedio);
	    						desempenhoInstDist.add(desempDistInst);
	    						
	    						//cera de vuelta para el departamento que realizó el corte.
	    						institucionAct = objetos.get(i).getInstitucionId();
	    						departamentoAct = objetos.get(i).getDepartamentoId();
								distritoAct = objetos.get(i).getDistritoId();								
	    						acum=0;
	    						promedio=0;
	    						cont=0;
							}
							
						}                			
				}catch (SQLException e) {e.printStackTrace();}
                JsonElement json = new Gson().toJsonTree(desempenhoInstDist);
                out.println(json.toString());
            }
        	
        	
        	if (action.equals("getResumenLineasAccionProgramacion2")){
        		List objetos=null;
        		if (institucionId!=null) condition += " and ins_linea_accion_base_dd.institucion_id='"+institucionId+"'";
                if (institucionIdConcat!=null) condition += " and ins_linea_accion_base_dd.institucion_id in("+institucionIdConcat+")";
                if (departamentoId!=null) condition += " and ins_linea_accion_base_dd.depto_id='"+departamentoId+"'";
                if (distritoId!=null) condition += " and ins_linea_accion_base_dd.dist_id='"+distritoId+"'";
           		try {objetos = SqlSelects.selectResumenLineasAccionProgramacionInstDptoDist2(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        	}
        	if (action.equals("getRol")){
        		List objetos=null;
        		condition = " where true";
        		if (rolId!=null) condition += " and id ='"+rolId+"'";
           		try {objetos = SqlSelects.selectRoles(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());        	
        	}
        	if (action.equals("getUnidadResponsable")){
        		List objetos=null;
        		condition = " where true";
        		if (nivelId!=null) condition += " and entidad_nivel_id ='"+nivelId+"'";
        		if (entidadId!=null) condition += " and entidad_id ='"+entidadId+"'";
           		try {objetos = SqlSelects.selectUnidadResponsable(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());        	
        	}
        	//obtenemos todas las instituciones en el back end y su desempeño institucional a nivel país
        	if (action.equals("getResumenLineasAccionProgramacionDesempenoInstitucional")){
                List<LineaAccionProgramacion> objetos=null;
                List<Institucion> instituciones= null ;
                ArrayList<Object> desempenhoDpto= new ArrayList<Object>();
                condition = " where true";
                
                String condition2="";
        		if (!userRoleId.equals("0") && !userRoleId.equals("1") && !userRoleId.equals("2")){ 
        			condition2 += " and entidad_id="+userEntidadId+" and nivel_id="+userNivelId;
        			if ( !userUnrId.equals("0") ){
        				condition2+= " and unidad_responsable_id="+userUnrId;
        			}
        		};
                
                try {
					instituciones = SqlSelects.selectInstitucion(condition+condition2);
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
                condition += " AND ins_linea_accion_base.institucion_id in(";
				for (int s = 0; s < instituciones.size(); s += 1) {
					if(instituciones.size() == s+1)
					{
						condition += instituciones.get(s).getId();
					}else{
						condition += instituciones.get(s).getId()+",";
					}
				}           
				condition += ")";

	                try {                	

	                	double acum, promedio;
	                	int cont;
	    	            if (periodoId!=null) condition += " and periodo ='"+periodoId+"'";
	                	objetos = SqlSelects.selectResumenLineasAccionProgramacionInstDptoDistrito(condition);
	                	
	                	for(int j = 0; j < instituciones.size(); j+= 1){
		                	acum=0;
		                	promedio=0;
		                	cont=0;
							for (int i = 0; i < objetos.size(); i += 1) {
    							if(instituciones.get(j).getId() == objetos.get(i).getInstitucionId()){
									if ((objetos.get(i).getCantidadHoy() == 0 || objetos.get(i).getCantidadHoy() == null) && objetos.get(i).getCantidadAvance() > 0) {	
										acum += 100;
										cont+=1;
									} else if (objetos.get(i).getCantidadHoy() > 0 && (objetos.get(i).getCantidadAvance() == 0 || objetos.get(i).getCantidadAvance() == null)) {
										acum += 0;
										cont+=1;
									} else if ((objetos.get(i).getCantidadHoy() == 0 || objetos.get(i).getCantidadHoy() == null) && (objetos.get(i).getCantidadAvance() == 0 || objetos.get(i).getCantidadAvance() == null)) {
										acum += 0;
									} else {
										acum += objetos.get(i).getCantidadAvance() / objetos.get(i).getCantidadHoy() * 100;
										cont+=1;
									}
    							}
							}
		    						
							if(cont != 0){
								promedio = acum / cont;
							}
							desempenhoDpto.add(promedio);
	
    					}
              	
					}catch (SQLException e) {e.printStackTrace();}
				
                JsonElement json = new Gson().toJsonTree(desempenhoDpto);
                out.println(json.toString());
            } 
// Esta funcion es mejor que el de arriba por que solo una vez recorre el vector
//        	if (action.equals("getResumenLineasAccionProgramacionDesempenoInstitucional")){
//                List<LineaAccionProgramacion> objetos=null;
//                List<Institucion> instituciones= null ;
//                ArrayList<Object> desempenhoDpto= new ArrayList<Object>();
//                //condition = " where true";
//                
//                try {
//					instituciones = SqlSelects.selectInstitucion(condition);
//				} catch (SQLException e1) {
//					e1.printStackTrace();
//				}
//                
//				for (int s = 0; s < instituciones.size(); s += 1) {
//	                 condition += " OR ins_linea_accion_base_dd.institucion_id='"+instituciones.get(s).getId()+"'";
//				}
//	                try {                	
//
//	                	double acum, promedio;
//	                	int cont, instId;
//	                	objetos = SqlSelects.selectResumenLineasAccionProgramacionInstDptoDistrito(condition);
//	                		
//	                		acum=0;
//	                		promedio=0;
//	                		cont=0;
//		                	instId=0;
//		                	
//							for (int i = 0; i < objetos.size(); i += 1) {
//								if(i == 0){
//									instId = objetos.get(i).getInstitucionId();
//								}
//								
//									if ((objetos.get(i).getCantidadHoy() == 0 || objetos.get(i).getCantidadHoy() == null) && objetos.get(i).getCantidadAvance() > 0) {	
//										acum += 100;
//										cont+=1;
//									} else if (objetos.get(i).getCantidadHoy() > 0 && (objetos.get(i).getCantidadAvance() == 0 || objetos.get(i).getCantidadAvance() == null)) {
//										acum += 0;
//										cont+=1;
//									} else if ((objetos.get(i).getCantidadHoy() == 0 || objetos.get(i).getCantidadHoy() == null) && (objetos.get(i).getCantidadAvance() == 0 || objetos.get(i).getCantidadAvance() == null)) {
//										acum += 0;
//									} else {
//										acum += objetos.get(i).getCantidadAvance() / objetos.get(i).getCantidadHoy() * 100;
//										cont+=1;
//									}
//    							
//	    						if (i == (objetos.size()-1)){
//
//									instId = objetos.get(i).getInstitucionId();
//									if(cont != 0){
//										promedio = acum / cont;
//									}
//									desempenhoDpto.add(promedio);
//				                	acum=0;
//				                	promedio=0;
//				                	cont=0;
//	    						}else{
//	    							if(objetos.get(i+1).getInstitucionId() != instId)
//	    							{
//	    								if(cont != 0){
//	    									promedio = acum / cont;
//	    								}
//	    								desempenhoDpto.add(promedio);
//	    			                	acum=0;
//	    			                	promedio=0;
//	    			                	cont=0;
//										instId = objetos.get(i+1).getInstitucionId();
//
//	    							}
//	    						}
//
//
//							}   					
//              	
//					}catch (SQLException e) {e.printStackTrace();}
//				
//                JsonElement json = new Gson().toJsonTree(desempenhoDpto);
//                out.println(json.toString());
//            } 
        	//obtenemos todas las instituciones en el back end y su desempeño institucional a nivel DEPARTAMENTAL
        	if (action.equals("getResumenLineasAccionProgramacionDesempenoInstitucionalDepto")){
                List<LineaAccionProgramacion> objetos=null;
                List<Institucion> instituciones= null ;
                ArrayList<Object> desempenhoDpto= new ArrayList<Object>();
                condition = " where true"; 
//        		if (periodoId!=null) condition += " and periodo ='"+periodoId+"'";
                
                String condition2="";
        		if (!userRoleId.equals("0") && !userRoleId.equals("1") && !userRoleId.equals("2")){ 
        			condition2 += " and entidad_id="+userEntidadId+" and nivel_id="+userNivelId;
        			if ( !userUnrId.equals("0") ){
        				condition2+= " and unidad_responsable_id="+userUnrId;
        			}
        		};
                
                try {
					instituciones = SqlSelects.selectInstitucion(condition+condition2);
				} catch (SQLException e1) {
					e1.printStackTrace();
				}

                condition = " where true"; 
        		if (periodoId!=null) condition += " AND periodo ='"+periodoId+"'";
        		if (departamentoId!=null) condition += " AND ins_linea_accion_base_dd.depto_id = '"+departamentoId+"'";
	            if (distritoId!=null) condition += " and ins_linea_accion_base_dd.dist_id='"+distritoId+"'";

				condition += " AND ins_linea_accion_base_dd.institucion_id in(";

				for (int s = 0; s < instituciones.size(); s += 1) {
					if(instituciones.size() == s+1){
						condition += instituciones.get(s).getId();
					}else{
						condition += instituciones.get(s).getId()+",";
					}
				}
				condition +=")";

	                try {                	

	                	double acum, promedio;
	                	int cont;
	                	objetos = SqlSelects.selectResumenLineasAccionProgramacionInstitucionDepto(condition);
	                	
	                	for(int j = 0; j < instituciones.size(); j+= 1){
		                	acum=0;
		                	promedio=0;
		                	cont=0;
							for (int i = 0; i < objetos.size(); i += 1) {
    							if(instituciones.get(j).getId() == objetos.get(i).getInstitucionId()){
									if ((objetos.get(i).getCantidadHoy() == 0 || objetos.get(i).getCantidadHoy() == null) && objetos.get(i).getCantidadAvance() > 0) {	
										acum += 100;
										cont+=1;
									} else if (objetos.get(i).getCantidadHoy() > 0 && (objetos.get(i).getCantidadAvance() == 0 || objetos.get(i).getCantidadAvance() == null)) {
										acum += 0;
										cont+=1;
									} else if ((objetos.get(i).getCantidadHoy() == 0 || objetos.get(i).getCantidadHoy() == null) && (objetos.get(i).getCantidadAvance() == 0 || objetos.get(i).getCantidadAvance() == null)) {
										acum += 0;
									} else {
										acum += objetos.get(i).getCantidadAvance() / objetos.get(i).getCantidadHoy() * 100;
										cont+=1;
									}
    							}
							}
							if(cont != 0){
								promedio = acum / cont;
							}
							desempenhoDpto.add(promedio);
	                	}

						                	
					}catch (SQLException e) {e.printStackTrace();}
				
                JsonElement json = new Gson().toJsonTree(desempenhoDpto);
                out.println(json.toString());
            } 
        	//Obtenemos todas las lineas a nivel departamental y distrital ordenado por institución, departamento y distrito
        	if (action.equals("getLineaAccionDepartamentalDistrital")){
        		String objetos=null;
        		condition = " where true";
                if (institucionIdConcat!="") condition += " and ins_linea_accion_base_dd.institucion_id in("+institucionIdConcat+")";
	            if (departamentoId!=null) condition += " and ins_linea_accion_base_dd.depto_id='"+departamentoId+"'";
	            if (distritoId!=null) condition += " and ins_linea_accion_base_dd.dist_id='"+distritoId+"'";
	            if (periodoId!=null) condition += " and periodo='"+periodoId+"'";
           		try {objetos = SqlSelects.selectResumenLineasAccionProgramacionDepartamentalDistrital(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		//JsonElement json = new Gson().toJsonTree(objetos );
        		//out.println(json.toString()); 
           		out.println(objetos);return;
        	}
        	if (action.equals("getUsuarioLineaAccion")){
        		String objetos=null;
        		condition = " where true ";
        		if (usuario!=null){
        			condition += " and usuario_correo ='"+usuario+"'";
        		}else{
        			condition += " and usuario_correo ='"+userCorreo+"'";
        		}
        		try {objetos = SqlSelects.selectUsuarioLineaAccion(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		out.println(objetos);return;        	
        	}
        	if (action.equals("getInsLineaAccionHasEtiqueta")){
        		String objetos=null;
        		condition = " where true ";
        		if (insLineaAccionIdConcat!="") condition += " and ins_linea_accion_id in("+insLineaAccionIdConcat+")";
        		if (insLineaAccionId!=null) condition += " and ins_linea_accion_id ='"+insLineaAccionId+"'";
        		if (etiquetaId!=null) condition += " and etiqueta_id ='"+etiquetaId+"'";
           		try {objetos = SqlSelects.selectInsLineaAccionHasEtiqueta(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		out.println(objetos);return;        	
        	}
        	if (action.equals("getAllTablas")){
        		String objetos=null;
        		condition = " where true ";
           		try {objetos = SqlSelects.selectAllTablas(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		out.println(objetos);return;        	
        	}
        	if (action.equals("getColumna")){
        		String objetos=null;
        		condition = " where true and table_schema = 'public'";
        		if (tabla!="") condition += " and table_name = '"+tabla+"'";
           		try {objetos = SqlSelects.selectAllColumnas(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		out.println(objetos);return;        	
        	}
        	//Información de las etiquetas que el usuario logueado puede visualizar o tiene acceso
        	if (action.equals("getUsuarioEtiqueta")){
        		String objetos=null;
        		condition = " where true ";
        		if (usuario!=null){
        			condition += " and usuario_correo ='"+usuario+"'";
        		}else{
        			condition += " and usuario_correo ='"+userCorreo+"'";
        		}
           		try {objetos = SqlSelects.selectUsuarioEtiqueta(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		//out.println(objetos);return;        	
        		
        		if(callback != null) {
                    out.println(callback + "(" + objetos + ");");
                }else{
                    out.println(objetos);return;
                }	
        	}
        	
        	if (action.equals("getCiDestinatarios")){
        		String objetos=null;
        		condition = " where true";
              /*  if (institucionIdConcat!="") condition += " and ins_linea_accion_base_dd.institucion_id in("+institucionIdConcat+")";
	            if (departamentoId!=null) condition += " and ins_linea_accion_base_dd.depto_id='"+departamentoId+"'";
	            if (distritoId!=null) condition += " and ins_linea_accion_base_dd.dist_id='"+distritoId+"'";*/
           		try {objetos = SqlSelects.selectCiDestinatarios(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		//JsonElement json = new Gson().toJsonTree(objetos );
        		//out.println(json.toString()); 
           		out.println(objetos);return;
        	}
        	if (action.equals("getPresupuestoAsignado")){
        		String objetos=null;
        		condition = " where true";
                if (nivel!=null) condition += " and spr_nivel_id ="+nivel;
                if (entidad!=null) condition += " and spr_entidad_id ="+entidad;
                if (tipoPresupuesto!=null) condition += " and spr_tiprograma_id ="+tipoPresupuesto;
                if (programa!=null) condition += " and spr_programa_id ="+programa;
                if (subprograma!=null) condition += " and spr_subprograma_id ="+subprograma;
                if (proyecto!=null) condition += " and srp_proyecto_id ="+proyecto;
                if (producto!=null) condition += " and spr_producto_id ="+producto;
                if (anio!=null) condition += " and spr_anho ="+anio;
                if (version!=null) condition += " and spr_version ="+version;                
           		try {objetos = SqlSelects.selectPresupuestoAsignado(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		//JsonElement json = new Gson().toJsonTree(objetos );
        		//out.println(json.toString()); 
           		out.println(objetos);return;
        	}
        	if (action.equals("getObjetoGasto")){
        		String objetos=null;
        		condition = " where true";
                if (objetoGastoId!=null) condition += " and id = "+objetoGastoId;
           		try {objetos = SqlSelects.selectObjetoGasto(condition);}
        		catch (SQLException e) {e.printStackTrace();}
           		out.println(objetos);return;
        	}
        	//Avances Monitoreo Institucional segun etiqueta seleccionado
        	if (action.equals("getMonitoreoAvance")){
        		List objetos=null; 
        		condition = " where true ";
        		String condition2=" where true ";
        		if (etiquetaId!=null) condition += " and ins_linea_accion_has_etiqueta.etiqueta_id = "+etiquetaId;
        		if (anho!=null) condition += " and periodo ="+anho+" and to_char(avance_fecha,'YYYY') = '"+anho+"'";
        		if (mes!=null) condition += " and to_char(avance_fecha,'MM') = '"+mes+"'";
        		if (!userRoleId.equals("0") && !userRoleId.equals("1")){ 
        			condition2 += " and entidad_id="+userEntidadId+" and nivel_id="+userNivelId;
	        		if ( !userUnrId.equals("0") ){
	        			condition2+= " and unidad_responsable_id="+userUnrId;
	        		}
        		};
        		condition += " and ins_id IN (select id from institucion "+condition2+") ";
        		if (insLineaAccionId!=null) condition += " and id ='"+insLineaAccionId+"'";
        		try {objetos = SqlSelects.selectMonitoreoAvance(condition);}
        		catch (SQLException e) {e.printStackTrace();}
        		JsonElement json = new Gson().toJsonTree(objetos );
        		out.println(json.toString());
        		}
       }
       out.close();
        
    }
}



