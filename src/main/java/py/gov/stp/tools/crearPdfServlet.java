package py.gov.stp.tools;
 
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Paragraph;
import com.lowagie.text.html.simpleparser.HTMLWorker;
import com.lowagie.text.pdf.PdfWriter;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.StringReader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
/**
 *
 * @author Alcides Benitez
 */
public class crearPDF extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Poner el tipo de contenido a la application - pdf
        //El navegador va a abrir el documento solo si éste parametro es seteado 
        response.setContentType("application/pdf");
        //Obtiene el output stream para escribir el objeto PDF        
        OutputStream out=response.getOutputStream();
        try {
        	//Obtiene el html que será agregado al documento PDF
            String text = request.getParameter("html");
            if (text == null || text.trim().length() == 0) {
                 text = "No has agregado ningún código HTML. Agrega algo para que aparezca aquí...";
            }
            Document document = new Document();            
            PdfWriter.getInstance(document, out);
            document.open();
            
            HTMLWorker htmlWorker = new HTMLWorker(document);
            htmlWorker.parse(new StringReader(text));
            
            document.close();
        }
        catch (DocumentException exc){
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
        return "Este Servlet Genera PDF Usando librería de iText";
    }

	/**
     * Gestiona la generación de archivos pdf a partir de cadenas HTML.
     */        
	public void createPdf(String html) {    	
	    try {
    		OutputStream file1 = new FileOutputStream(new File("C:\\Test.pdf"));
	        Document document = new Document();       
	        PdfWriter.getInstance(document, file1);
	        document.open();
	        
	        //String k = "<html><body> This is my Project </body></html>";
	        StringBuilder sb = new StringBuilder();
	        sb.append("<div>\n<p align=\"center\">");
	        sb.append("<font size=\"5\">");
	        sb.append("<b>&nbsp;<font color=\"#32cd32\">My centered Para</font></b>");
	        sb.append("</font>");
	        sb.append("<font color=\"#32cd32\">&nbsp;</font>");
	        sb.append("</p>\n</div>");
	         
	        HTMLWorker htmlWorker = new HTMLWorker(document);
	        htmlWorker.parse(new StringReader(sb.toString()));	 
	        
	        document.close();
	        file1.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
    }
}