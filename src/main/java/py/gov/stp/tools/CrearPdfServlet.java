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
		String institucion = request.getParameter("nombreInstitucion");
		
	    // fuerza la descarga
	    String headerKey = "Content-Disposition";
	    String headerValue = String.format("attachment; filename=\"%s\"", filename);
	    response.setHeader(headerKey, headerValue);
        
		//Obtiene el html que será agregado al documento PDF
        //String contenido = request.getParameter("contenido");
        
	    String idAvanceCualitativo = request.getParameter("idAvanceCualitativo");
        				
    	String contenido = obtenerContenidoAvances(idAvanceCualitativo, institucion);
        
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
    
    public String obtenerContenidoAvances(String idAvanceCualitativo, String institucion) {
    
		String contenido = "";
    	String condition = "";
		
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
    		contenido += "<br><h1 class='text-center'><u>SPR-PA-03: Informe de Avance Cualitativo por Institución para el Periodo 2016 </u></h1>";
    		
    		// verificar periodo en los avances!! Esto se debe implementar..
    		
    		condition = " where true and borrado=false";                    
			List<AvanceCualitativo> avanceCualitativo=null;						        
			try {avanceCualitativo = SqlSelects.selectAvanceCualitativo(condition);}
			catch (SQLException e) {e.printStackTrace();}
    		
			Iterator<AvanceCualitativo> avanceCualitativoIterador = avanceCualitativo.iterator();
			while (avanceCualitativoIterador.hasNext()) {
				AvanceCualitativo avanceCualitativoAux = avanceCualitativoIterador.next();											
					
				condition = " where true ";
				Integer catalogoAccionId = avanceCualitativoAux.getAccionCatalogoId();
				List<AccionCatalogo> catalogo=null; 		
				if (catalogoAccionId!=null) {condition += " and id ='"+catalogoAccionId+"'";
				try {catalogo = SqlSelects.selectAccionCatalogo(condition);}
				catch (SQLException e) {e.printStackTrace();}}
				
				condition = " where true ";
				Integer trimestreId = avanceCualitativoAux.getTrimestreId();
				List<Trimestre> trimestre=null;
				if (trimestreId!=null) {condition += " and id ='"+trimestreId+"'";
				try {trimestre = SqlSelects.selectTrimestre(condition);}
				catch (SQLException e) {e.printStackTrace();}}			
			
				contenido += "<div class='content'>"+				
					
		   							"<h3 style='text-align:center;'><u>SPR-PA-03: Informe Cualitativo de Avance Trimestral</u></h3>"+
		   							
		   							"<p id='impresionInstitucion'><strong>Institución: </strong><span>"+ institucion +"</span></p>"		+
		   							"<p id='impresionAccionesTrimestre'><strong>Acción: </strong><span>"+ catalogo.get(0).getNombre() +"</span></p>"+
		   							"<p id='impresionTrimestreAño'><strong>Periodo: </strong><span>"+ trimestre.get(0).getDescripcion() + " " + trimestre.get(0).getAnho() + " </span></p>" +
		   							"<p id='impresionGestionesRealizadas'><strong>Gestiones Realizadas: </strong><span>"+ avanceCualitativoAux.getGestionesRealizadas() +"</span></p>" +
		   							"<p id='impresionLogrosAlcanzados'><strong>Principales Logros Alcanzados: </strong><span>"+ avanceCualitativoAux.getPrincipalesLogrosAlcanzados() +"</span></p>"	+
		   							"<p id='impresionLeccionesAprendidas'><strong>Dificultades y Lecciones aprendidas: </strong><span>"+ avanceCualitativoAux.getDificultadesLeccionesAprendidas() +"</span></p>" +
		   							"<p id='impresionSiguienteTrimestre'><strong>Objetivos del Siguiente Trimestre: </strong><span>"+ avanceCualitativoAux.getObjetivosTrimestre() +"</span></p>"	+
		   							
						    	 "</div>";
    		}
    	}
				
		return contenido;
    }
	
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//    		throws ServletException, IOException {
//		//Poner el tipo de contenido a la application - pdf
//		//El navegador va a abrir el documento solo si éste parametro es seteado 
//		response.setContentType("application/pdf");
//		//Obtiene el output stream para escribir el objeto PDF        
//		OutputStream out=response.getOutputStream();
//		try {
//			//Obtiene el html que será agregado al documento PDF
//		  String text = request.getParameter("html");
//		  if (text == null || text.trim().length() == 0) {
//		       text = "No has agregado ningún código HTML. Agrega algo para que aparezca aquí...";
//		  }
//		  Document document = new Document();            
//		  PdfWriter.getInstance(document, out);
//		  document.open();
//		  
//		  HTMLWorker htmlWorker = new HTMLWorker(document);
//		  htmlWorker.parse(new StringReader(text));
//		  
//		  document.close();
//		}
//		catch (DocumentException exc){
//		      throw new IOException(exc.getMessage());
//		}
//		finally {            
//		  out.close();
//		}
//    }
    
//    /**
//     * Gestiona la generación de archivos pdf a partir de cadenas HTML.
//     */        
//	public void createPdf(String html) {    	
//	    try {
//    		OutputStream file1 = new FileOutputStream(new File("C:\\Test.pdf"));
//	        Document document = new Document();       
//	        PdfWriter.getInstance(document, file1);
//	        document.open();
//	        
//	        //String k = "<html><body> This is my Project </body></html>";
//	        StringBuilder sb = new StringBuilder();
//	        sb.append("<div>\n<p align=\"center\">");
//	        sb.append("<font size=\"5\">");
//	        sb.append("<b>&nbsp;<font color=\"#32cd32\">My centered Para</font></b>");
//	        sb.append("</font>");
//	        sb.append("<font color=\"#32cd32\">&nbsp;</font>");
//	        sb.append("</p>\n</div>");
//	         
//	        HTMLWorker htmlWorker = new HTMLWorker(document);
//	        htmlWorker.parse(new StringReader(sb.toString()));	 
//	        
//	        document.close();
//	        file1.close();
//	    } catch (Exception e) {
//	        e.printStackTrace();
//	    }
//    }  
	
}