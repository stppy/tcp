package py.gov.stp.tools;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class UploadServlet
 * @author DGTIC-STP
 * @email  dgtic@stp.gov.py 
 */
@MultipartConfig(maxFileSize=1024*1024*15,      // 15MB
				 maxRequestSize=1024*1024*50)   // 50MB		
public class UploadServlet extends HttpServlet {	                
		private static final long serialVersionUID = 1L;		       
         
        /**
         * Gestiona la subida de archivos
         */        
        @Override
        protected void doPost(HttpServletRequest request,
                HttpServletResponse response) throws ServletException, IOException {        		
            //obtiene el path relativo de subida de archivos de la aplicación
            String savePath = getServletContext().getInitParameter("file-upload"); 
             
            // crea la carpeta donde se guardaran los archivos si no existe
            File fileSaveDir = new File(savePath);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdir();
            }
            
            //Obtiene el archivo desde la petición
            Part file = request.getPart("documentoEvidencia");
            String fileName = getFilename(file);
            
            
            //extrae la extension y el nombre de archivo por separado
            int dot = fileName.lastIndexOf(".");
            String fileNameExt = fileName.substring(dot);
            fileName = fileName.substring(0, dot);            
            
            //remplaza cualquier caracter del tipo espacio, puntos y otros por guión bajo.
            fileName = fileName.replaceAll("\\W","_");                        
            
            Date fecha = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss_SSS");	
            String fechaStr = (String)sdf.format((fecha));
            
            file.write(savePath + File.separator + fechaStr +"_"+ fileName + fileNameExt);

            response.setContentType("text/plain");
        	response.setCharacterEncoding("UTF-8");        
        	
        	if(fileName != null) response.getWriter().write(savePath + File.separator + fechaStr +"_"+ fileName + fileNameExt);
        	else
        		response.getWriter().write("");
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
