package py.gov.stp.tools;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

/**
 * 	@author DGTIC-STP
 *  @email  dgtic@stp.gov.py 
 */
public class ajaxDelete extends HttpServlet {
		
private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  
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
    	Integer destinatario = null;
    	Integer objetoGasto = null;
    	Integer catalogoDncp = null;
    	Integer demografia = null;
    	Integer tipoDemografica = null;
    	Integer diccionarioDato = null;
    	Integer ejeEstrategico = null;
    	Integer plan = null;
    	Integer estrategia = null;
    	Integer lineaTransversal = null;
    	Integer estrategiaHasObjetivo = null;
    	Integer fuenteFinanciamiento = null;
    	Integer fuenteVerificacion = null;
    	Integer funcional = null;
    	Integer indicador = null;
    	Integer tipoIndicador = null;
    	Integer metodoCalculo = null;
    	Integer zonaGeografica = null;
    	Integer objetivoId = null;
    	Integer meta = null;
    	Integer modulo = null;
    	Integer role = null;
    	Integer permiso = null;
       	Integer tipoObjetivo = null;
       	Integer objetoDeGasto = null;
    	Integer organismoFinanciador = null;
    	Integer productoPresupuesto = null;
    	Integer productoPresupuestoMeta = null;
    	Integer programatico = null;
    	Integer tipoProgramatico = null;
    	Integer proyectoSnip = null;
    	Integer proyectoSnipAutorizado = null;
    	Integer usuario = null;
    	Integer tipoZonaGeografica = null;
    	   	
    	
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
    	
    	if (request.getParameter("vision")!=null)  vision = request.getParameter("vision"); 
    	if (request.getParameter("objetivo")!=null) objetivo = request.getParameter("objetivo"); 
    	if (request.getParameter("resultado")!=null) resultado = request.getParameter("resultado"); 
    	if (request.getParameter("diagnostico")!=null) diagnostico = request.getParameter("diagnostico"); 
    	if (request.getParameter("baseLegal")!=null) baseLegal = request.getParameter("baseLegal"); 
    	if (request.getParameter("politica")!=null) politica = request.getParameter("politica");
    	if (request.getParameter("sigla")!=null) sigla = request.getParameter("sigla");
    	if (request.getParameter("abrev")!=null) abrev = request.getParameter("abrev");
    	if (request.getParameter("nombre")!=null) nombre = request.getParameter("nombre");
    	if (request.getParameter("descripcion")!=null) descripcion = request.getParameter("descripcion");
    	
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
    	if (request.getParameter("pais")!=null) pais = Integer.parseInt(request.getParameter("pais")); else pais=0;
    	if (request.getParameter("anio")!=null) anio = Integer.parseInt(request.getParameter("anio")); else anio=2015;
    	if (request.getParameter("mes")!=null) mes = Integer.parseInt(request.getParameter("mes")); else mes=0;
    	if (request.getParameter("departamento")!=null) departamento = Integer.parseInt(request.getParameter("departamento")); else departamento=0;
    	if (request.getParameter("cantidad")!=null) cantidad = Integer.parseInt(request.getParameter("cantidad")); else cantidad=0;
    	if (request.getParameter("destinatario")!=null) destinatario = Integer.parseInt(request.getParameter("destinatario")); else destinatario=0;
    	if (request.getParameter("objetoGasto")!=null) objetoGasto = Integer.parseInt(request.getParameter("objetoGasto")); else objetoGasto=0;
    	if (request.getParameter("catalogoDncp")!=null) catalogoDncp = Integer.parseInt(request.getParameter("catalogoDncp")); else catalogoDncp=0;
    	if (request.getParameter("demografia")!=null) demografia = Integer.parseInt(request.getParameter("demografia")); else demografia=0;
    	if (request.getParameter("tipoDemografica")!=null) tipoDemografica = Integer.parseInt(request.getParameter("tipoDemografica")); else tipoDemografica=0;
    	if (request.getParameter("diccionarioDato")!=null) diccionarioDato = Integer.parseInt(request.getParameter("diccionarioDato")); else diccionarioDato=0;
    	if (request.getParameter("ejeEstrategico")!=null) ejeEstrategico = Integer.parseInt(request.getParameter("ejeEstrategico")); else ejeEstrategico=0;
    	if (request.getParameter("plan")!=null) plan = Integer.parseInt(request.getParameter("plan")); else plan=0;
    	if (request.getParameter("estrategia")!=null) estrategia = Integer.parseInt(request.getParameter("estrategia")); else estrategia=0;
    	if (request.getParameter("lineaTransversal")!=null) lineaTransversal = Integer.parseInt(request.getParameter("lineaTransversal")); else lineaTransversal=0;
    	if (request.getParameter("estrategiaHasObjetivo")!=null) estrategiaHasObjetivo = Integer.parseInt(request.getParameter("estrategiaHasObjetivo")); else estrategiaHasObjetivo=0;
    	if (request.getParameter("fuenteFinanciamiento")!=null) fuenteFinanciamiento = Integer.parseInt(request.getParameter("fuenteFinanciamiento")); else fuenteFinanciamiento=0;
    	if (request.getParameter("fuenteVerificacion")!=null) fuenteVerificacion = Integer.parseInt(request.getParameter("fuenteVerificacion")); else fuenteVerificacion=0;
    	if (request.getParameter("funcional")!=null) funcional = Integer.parseInt(request.getParameter("funcional")); else funcional=0;
    	if (request.getParameter("indicador")!=null) indicador = Integer.parseInt(request.getParameter("indicador")); else indicador=0;
    	if (request.getParameter("tipoIndicador")!=null) tipoIndicador = Integer.parseInt(request.getParameter("tipoIndicador")); else tipoIndicador=0;
    	if (request.getParameter("metodoCalculo")!=null) metodoCalculo = Integer.parseInt(request.getParameter("metodoCalculo")); else metodoCalculo=0;
    	if (request.getParameter("zonaGeografica")!=null) zonaGeografica = Integer.parseInt(request.getParameter("zonaGeografica")); else zonaGeografica=0;
    	if (request.getParameter("objetivoId")!=null) objetivoId = Integer.parseInt(request.getParameter("objetivoId")); else objetivoId=0;
    	if (request.getParameter("meta")!=null) meta = Integer.parseInt(request.getParameter("meta")); else meta=0;
    	if (request.getParameter("modulo")!=null) modulo = Integer.parseInt(request.getParameter("modulo")); else modulo=0;
    	if (request.getParameter("role")!=null) role = Integer.parseInt(request.getParameter("role")); else role=0;
    	if (request.getParameter("permiso")!=null) permiso = Integer.parseInt(request.getParameter("permiso")); else permiso=0;
    	if (request.getParameter("tipoObjetivo")!=null) tipoObjetivo = Integer.parseInt(request.getParameter("tipoObjetivo")); else tipoObjetivo=0;
    	if (request.getParameter("ObjetoDeGasto")!=null) objetoDeGasto = Integer.parseInt(request.getParameter("ObjetoDeGasto")); else objetoDeGasto=0;
    	if (request.getParameter("productoPresupuesto")!=null) productoPresupuesto = Integer.parseInt(request.getParameter("productoPresupuesto")); else productoPresupuesto=0;
    	if (request.getParameter("productoPresupuestoMeta")!=null) productoPresupuestoMeta = Integer.parseInt(request.getParameter("productoPresupuestoMeta")); else productoPresupuestoMeta=0;
    	if (request.getParameter("programatico")!=null) programatico = Integer.parseInt(request.getParameter("programatico")); else programatico=0;
    	if (request.getParameter("tipoProgramatico")!=null) tipoProgramatico = Integer.parseInt(request.getParameter("tipoProgramatico")); else tipoProgramatico=0;
    	if (request.getParameter("proyectoSnip")!=null) proyectoSnip = Integer.parseInt(request.getParameter("proyectoSnip")); else proyectoSnip=0;
    	if (request.getParameter("proyectoSnipAutorizado")!=null) proyectoSnipAutorizado = Integer.parseInt(request.getParameter("proyectoSnipAutorizado")); else proyectoSnipAutorizado=0;
    	if (request.getParameter("usuario")!=null) usuario = Integer.parseInt(request.getParameter("usuario")); else usuario=0;
    	if (request.getParameter("tipoZonaGeografica")!=null) tipoZonaGeografica = Integer.parseInt(request.getParameter("tipoZonaGeografica")); else tipoZonaGeografica=0;
    	
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
        	if (accion.equals("delEntidad")){
        		List entidades=null;
				SqlDelete.deleteEntidad(entidad.toString(), nivel.toString());
        		JsonElement json = new Gson().toJsonTree(entidades );
        		myObj.addProperty("success", true);
        		myObj.add("entidades", json);
        		out.println(myObj.toString());
        		response.sendRedirect("/entidad.jsp");
        	}

        }*/
     
    }
}
