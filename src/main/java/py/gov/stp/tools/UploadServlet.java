package py.gov.stp.tools;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class UploadServlet
 */
@MultipartConfig
public class UploadServlet extends HttpServlet {	                
		private static final long serialVersionUID = 1L;
		
		/**
         * Nombre del directorio donde se subirán los archivos, relativo al 
         * directorio de la aplicación web.
         */
        private static final String SAVE_DIR = "uploads";
         
        /**
         * Gestiona la subida de archivos
         */
        
        @Override
        protected void doPost(HttpServletRequest request,
                HttpServletResponse response) throws ServletException, IOException {
            // obtiene el path absoluto de la aplicación
            String appPath = request.getServletContext().getRealPath("");
            // construye el path del directorio para guardar el archivo subido
            String savePath = appPath + File.separator + SAVE_DIR;
             
            // creates the save directory if it does not exists
            File fileSaveDir = new File(savePath);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdir();
            }
            
            Part file = request.getPart("documentoEvidencia");
            String fileName = getFilename(file);
            //InputStream filecontent = file.getInputStream();
            
               
            file.write(savePath + File.separator + fileName);
                        
            
            response.setContentType("text/plain");
        	response.setCharacterEncoding("UTF-8");        
        	response.getWriter().write("/tablero/uploads" + File.separator + fileName);
        }
     
    	private static String getFilename(Part part) {
            for (String cd : part.getHeader("content-disposition").split(";")) {
                if (cd.trim().startsWith("filename")) {
                    String filename = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                    return filename.substring(filename.lastIndexOf('/') + 1).substring(filename.lastIndexOf('\\') + 1); // MSIE fix.
                }
            }
            return null;
        }        
     
}