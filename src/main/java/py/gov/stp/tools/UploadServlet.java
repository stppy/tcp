package py.gov.stp.tools;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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
        		SimpleDateFormat sdf = new SimpleDateFormat("dd/mm/yyyy hh:mm:ss");
            // obtiene el path absoluto de la aplicación
            String appPath = "/usr/share/tomcat";
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
            Calendar calendar = Calendar.getInstance();
            java.util.Date now = calendar.getTime();
            java.sql.Timestamp currentTimestamp = new java.sql.Timestamp(now.getTime());
            

            
//            Date fecha = new Date();
//            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
//            String fechaStr = sdf.format((fecha)).toString();
            
            file.write(savePath + File.separator +currentTimestamp.toString()+"_"+ fileName);

            response.setContentType("text/plain");
        	response.setCharacterEncoding("UTF-8");        
        	response.getWriter().write(savePath + File.separator +currentTimestamp.toString()+"_"+fileName);
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
