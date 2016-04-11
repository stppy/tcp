package py.gov.stp.tools;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * implementación Servlet de la clase DownloadServlet
 */
public class DownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		 // lee el archivo del path absoluto
		String filePath = request.getParameter("urlDocumento");
//	    String filePath = "/usr/share/tomcat/uploads/ips_marzo.pdf";
	    File downloadFile = new File(filePath);
	    FileInputStream inStream = new FileInputStream(downloadFile);
	     
//	    // if you want to use a relative path to context root:
//	    String relativePath = getServletContext().getRealPath("");
//	    System.out.println("relativePath = " + relativePath);
	     
	    // obtiene ServletContext
	    ServletContext context = getServletContext();
	     
	    // obtiene el tipo de MIME 
	    String mimeType = context.getMimeType(filePath);
	    if (mimeType == null) {        
	        // setea en tipo binario el MIME cuando el tomcat no identifica el tipo de aplicación.
	        mimeType = "application/octet-stream";
	    }
	    System.out.println("MIME type: " + mimeType);
	     
	    // modifica la respuesta
	    response.setContentType(mimeType);
	    response.setContentLength((int) downloadFile.length());
	     
	    // fuerza la descarga
	    String headerKey = "Content-Disposition";
	    String headerValue = String.format("attachment; filename=\"%s\"", downloadFile.getName());
	    response.setHeader(headerKey, headerValue);
	     
	    // obtiene la respuesta en output stream
	    OutputStream outStream = response.getOutputStream();
	     
	    byte[] buffer = new byte[15360];// 15 MB MaxFileSize del UploadServlet
	    int bytesRead = -1;
	     
	    while ((bytesRead = inStream.read(buffer)) != -1) {
	        outStream.write(buffer, 0, bytesRead);
	    }
	     
	    inStream.close();
	    outStream.close();     
	}

}
