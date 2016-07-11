package py.gov.stp.tools;
 
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.lowagie.text.DocumentException;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.xhtmlrenderer.pdf.ITextRenderer;

import py.gov.stp.objetosV2.Accion;
import py.gov.stp.objetosV2.AccionCatalogo;
import py.gov.stp.objetosV2.AvanceCualitativo;
import py.gov.stp.objetosV2.InsLineaAccion;
import py.gov.stp.objetosV2.Institucion;
import py.gov.stp.objetosV2.LineaAccion;
import py.gov.stp.objetosV2.Trimestre;
import py.gov.stp.tools2.SqlSelects;
 
/**
 *
 * @author Alcides Benitez
 */
public class CrearPdfServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException { 

		request.setCharacterEncoding("UTF-8");
		
		//Poner el tipo de contenido a la application - pdf
		//El navegador va a abrir el documento solo si éste parametro es seteado 
		response.setContentType("application/octet-stream");
		response.setCharacterEncoding("UTF-8");
		
		//Obtiene el output stream para escribir el objeto PDF        
		OutputStream out=response.getOutputStream();		
	    		
		String filename = request.getParameter("nombreArchivo");			
		String unidadResponsableId = request.getParameter("unidadResponsableId");
		
	    // fuerza la descarga
	    String headerKey = "Content-Disposition";
	    String headerValue = String.format("attachment; filename=\"%s\"", filename);
	    response.setHeader(headerKey, headerValue);
        
		//Obtiene el html que será agregado al documento PDF
        //String contenido = request.getParameter("contenido");
        
	    String idAvanceCualitativo = request.getParameter("idAvanceCualitativo");
        				
    	String contenido = obtenerContenidoAvances(idAvanceCualitativo, unidadResponsableId);
        
   		String html = "<html>"+
						"<head>"+
						      "<style>"+
								  	"@page {"+ 
								  	"@top-center {"+ 
								  		"content: element(header)"+ 
								  	"} "+
								  	"@bottom-center {"+ 
								  		"content: element(footer)"+ 
								  	"}"+
									  
									"size: A4 portrait;"+
									"margin-top: 4cm; "+
									"margin-left: 2.5cm;"+ 
									"margin-right: 2cm; "+
									"margin-bottom: 3cm;"+
									"}"+
									"div.header {"+
										"display: inline-block; text-align: center;"+
										"position: running(header);"+
										"vertical-align: middle;"+
										"padding-top: 2em;"+
								  	"}"+
							        "div.footer {"+
							          	"display: block; text-align: center;"+
							          	"position: running(footer);"+
								  	"}"+
							        "div.content {"+
										"text-align: justify;"+
									"}"+
									".pagenumber:before {"+
							    		"content: counter(page);"+
							    	"}"+
				
								  	".pagecount:before {"+
								  		"content: counter(pages);"+
									"}"+
			
						      "</style>"+
						"</head>"+
						"<body>";	
   				
   				//Header y Footer
   				html += "<div class='header'>" +  						
   							"<img id='logo' src='dist/img/logo_stp_gob.png' height='75' width='620' /> " +		
   						"</div>" +
   						"<div class='footer' >" +   				
   							"<p>Página <span class='pagenumber'></span> de <span class='pagecount'></span></p>" +
   						"</div>";
   						   					
   				//Cuerpo
   				html +=  contenido;
				
				html += "</body>"+
					"</html>";
		
		try {			
			ITextRenderer renderer = new ITextRenderer();
			renderer.getSharedContext().setReplacedElementFactory(new MediaReplacedElementFactory(renderer.getSharedContext().getReplacedElementFactory()));
			renderer.setDocumentFromString(html);
	        renderer.layout();
	        renderer.createPDF(out);	        
	        out.flush();	    
		}
		catch (DocumentException exc){
				exc.printStackTrace();
		        throw new IOException(exc.getMessage());
		}
		finally {            
		    out.close();
		}
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    	
    }

    @Override
    public String getServletInfo() {
        return "Este Servlet Genera PDF Usando librería de Flying Saucer.";
    }	
    
    
    public String obtenerContenidoAvances(String idAvanceCualitativo, String unidadResponsableId) {
    
		String contenido = "";
    	String condition = "";
    	String institucion = "";
    	
		List<Institucion> inst= new ArrayList<Institucion>();
		condition = " where true ";
		if (unidadResponsableId!=null) condition += " and unidad_responsable_id ='"+unidadResponsableId+"'";						
   		try {inst = SqlSelects.selectInstitucion(condition);}
		catch (SQLException e) {e.printStackTrace();}
   		   		
   		institucion = inst.get(0).getNombre();
		
    	if (idAvanceCualitativo != null) {
    		condition = " where true";                    
			List<AvanceCualitativo> avanceCualitativo= new ArrayList<AvanceCualitativo>();		
			if (idAvanceCualitativo!=null) {condition += " and id ='"+idAvanceCualitativo+"'";		        	
			try {avanceCualitativo = SqlSelects.selectAvanceCualitativo(condition);}
			catch (SQLException e) {e.printStackTrace();}}
				
			condition = " where true ";
			Integer catalogoAccionId = avanceCualitativo.get(0).getAccionCatalogoId();
			List<AccionCatalogo> catalogo=null; 		
			if (catalogoAccionId!=null) {condition += " and id ='"+catalogoAccionId+"'";
			try {catalogo = SqlSelects.selectAccionCatalogo(condition);}
			catch (SQLException e) {e.printStackTrace();}}
			
			condition = " where true ";
			Integer trimestreId = avanceCualitativo.get(0).getTrimestreId();
			List<Trimestre> trimestre=null;
			if (trimestreId!=null) {condition += " and id ='"+trimestreId+"'";
			try {trimestre = SqlSelects.selectTrimestre(condition);}
			catch (SQLException e) {e.printStackTrace();}}	
		
			contenido = "<div class='content'>"+				
			
   							"<h3 style='text-align:center;'><u>SPR-PA-03: Informe Cualitativo de Avance Trimestral</u></h3>"+
   							
   							"<p id='impresionInstitucion'><strong>Institución: </strong><span>"+ institucion +"</span></p>"		+
   							"<p id='impresionAccionesTrimestre'><strong>Acción: </strong><span>"+ catalogo.get(0).getNombre() +"</span></p>"+
   							"<p id='impresionTrimestreAño'><strong>Periodo: </strong><span>"+ trimestre.get(0).getDescripcion() + " " + trimestre.get(0).getAnho() + " </span></p>" +
   							"<p id='impresionGestionesRealizadas'><strong>Gestiones Realizadas: </strong><span>"+ avanceCualitativo.get(0).getGestionesRealizadas() +"</span></p>" +
   							"<p id='impresionLogrosAlcanzados'><strong>Principales Logros Alcanzados: </strong><span>"+ avanceCualitativo.get(0).getPrincipalesLogrosAlcanzados() +"</span></p>"	+
   							"<p id='impresionLeccionesAprendidas'><strong>Dificultades y Lecciones aprendidas: </strong><span>"+ avanceCualitativo.get(0).getDificultadesLeccionesAprendidas() +"</span></p>" +
   							"<p id='impresionSiguienteTrimestre'><strong>Objetivos del Siguiente Trimestre: </strong><span>"+ avanceCualitativo.get(0).getObjetivosTrimestre() +"</span></p>"	+
   							
				    	 "</div>";
    	}
    	else {
    		String periodoAct = "2016";
    		
    		contenido += "<h1 style='text-align:center;'><u>Informe de Avance Cualitativo por Institución - Periodo "+periodoAct+" </u></h1>";
    		
    		//Obtiene todas las lineas de acción
    		condition = " where true and borrado is false ";
			List<LineaAccion> lineaAccion=null; 		
			try {lineaAccion = SqlSelects.selectLineaAccion(condition);}
			catch (SQLException e) {e.printStackTrace();}
			
			//Recorre las lineas de acción
	    	Iterator<LineaAccion> lineaAccionIterador = lineaAccion.iterator();
			while (lineaAccionIterador.hasNext()) {
				LineaAccion lineaAccionAux = lineaAccionIterador.next();							
    		    		 
				//Obtiene las acciones del periodo actual
				condition = " where true and borrado is false and periodo_id="+ periodoAct +" and institucion_id="+inst.get(0).getId();
				Integer lineaAccionId = lineaAccionAux.getId();
				List<InsLineaAccion> insLineaAccion=null; 		
				if (lineaAccionId != null) {condition += " and linea_accion_id ='"+lineaAccionId+"'";
				try {insLineaAccion = SqlSelects.selectInsLineaAccion(condition);}
				catch (SQLException e) {e.printStackTrace();}}
				
				//Recorre las acciones
				Iterator<InsLineaAccion> insLineaAccionIterador = insLineaAccion.iterator();
				while (insLineaAccionIterador.hasNext()) {
					InsLineaAccion insLineaAccionAux = insLineaAccionIterador.next();
				
					//Obtiene los avances cualitativos de esa acción
		    		condition = " where true and borrado is false";
		    		Integer insLineaAccionId = insLineaAccionAux.getId();
					List<AvanceCualitativo> avanceCualitativo=null;					
					if (insLineaAccionId!=null) condition += " and ins_linea_accion_id='"+insLineaAccionId+"'";
					try {avanceCualitativo = SqlSelects.selectAvanceCualitativo(condition);}
					catch (SQLException e) {e.printStackTrace();}					
				
					
					//Recorre los avances obtenidos
					Iterator<AvanceCualitativo> avanceCualitativoIterador = avanceCualitativo.iterator();
					while (avanceCualitativoIterador.hasNext()) {
						AvanceCualitativo avanceCualitativoAux = avanceCualitativoIterador.next();	
						
						//Imprime la cabecera de la linea de acción solo si posee avances
						if (avanceCualitativo != null && avanceCualitativo.get(0) == avanceCualitativoAux) {
							contenido += "<h3 style='text-align:center;'><u>Linea de Acción: "+ lineaAccionAux.getNombre() +" </u></h3>";
						} /*else {
							contenido += "<div style='text-align:center;'><span>-----</span></div>";
						} */
						
						//Obtiene el Catalogo de la acción del avance
						condition = " where true ";
						Integer catalogoAccionId = avanceCualitativoAux.getAccionCatalogoId();
						List<AccionCatalogo> catalogo=null; 		
						if (catalogoAccionId!=null) {condition += " and id ='"+catalogoAccionId+"'";
						try {catalogo = SqlSelects.selectAccionCatalogo(condition);}
						catch (SQLException e) {e.printStackTrace();}}
						
						//Obtiene el trimestre del avance
						condition = " where true ";
						Integer trimestreId = avanceCualitativoAux.getTrimestreId();
						List<Trimestre> trimestre=null;
						if (trimestreId!=null) {condition += " and id ='"+trimestreId+"'";
						try {trimestre = SqlSelects.selectTrimestre(condition);}
						catch (SQLException e) {e.printStackTrace();}}			
					
						contenido += "<div class='content'>"+				
							
				   							"<!--h3 style='text-align:center;'><u>SPR-PA-03: Informe Cualitativo de Avance Trimestral</u></h3-->"+
				   							
				   							"<p id='impresionInstitucion'><strong>Institución: </strong><span>"+ institucion +"</span></p>"		+
				   							"<p id='impresionAccionesTrimestre'><strong>Acción: </strong><span>"+ catalogo.get(0).getNombre() +"</span></p>"+
				   							"<p id='impresionTrimestreAño'><strong>Periodo: </strong><span>"+ trimestre.get(0).getDescripcion() + " " + trimestre.get(0).getAnho() + " </span></p>" +
				   							"<p id='impresionGestionesRealizadas'><strong>Gestiones Realizadas: </strong><span>"+ avanceCualitativoAux.getGestionesRealizadas() +"</span></p>" +
				   							"<p id='impresionLogrosAlcanzados'><strong>Principales Logros Alcanzados: </strong><span>"+ avanceCualitativoAux.getPrincipalesLogrosAlcanzados() +"</span></p>"	+
				   							"<p id='impresionLeccionesAprendidas'><strong>Dificultades y Lecciones aprendidas: </strong><span>"+ avanceCualitativoAux.getDificultadesLeccionesAprendidas() +"</span></p>" +
				   							"<p id='impresionSiguienteTrimestre'><strong>Objetivos del Siguiente Trimestre: </strong><span>"+ avanceCualitativoAux.getObjetivosTrimestre() +"</span></p>"	+
				   							
								    	 "</div><br />";
		    		}
				}
			}
    	}
				
		return contenido;
    }
		
}