<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<title>Prueba del servlet de uploads</title>
</head>
<body>

<form method="post" enctype="multipart/form-data">
	<table> 
		<tr><td><label for="documentoEvidencia">Adjuntar Documentooo</label>
			<input type="file" id="documentoEvidencia" name="documentoEvidencia" size="50" /></td></tr>
		<tr><td><label id="status"></label></td></tr>
		<tr><td><button type="button" id="botonGuardarEvidencia">Guardar Cambios</button></td></tr>
	</table>	
</form>	 

<script>
//sección de envio del archivo de evidencia
	
    $("body").on("click", "#botonGuardarEvidencia",function(event){
    	
    	var docEvidenciaFile = document.getElementById("documentoEvidencia").files[0];
    	    
   	    var formdata = new FormData();
   	    formdata.append('documentoEvidencia', docEvidenciaFile);
   	    
	   	 $.ajax({
	         type: "POST",
	         url: "/tablero/UploadServlet", /* contextPath + servletPath, */
	         data: formdata, /* + $('#custIdList').val(), */
	         async: false,
	         processData: false,  // tell jQuery not to process the data
	         contentType: false,   // tell jQuery not to set contentType
	         success: function(data){
	               alert(data);
	           }
	     });
   	    
   	    
   	    /* var xhr = new XMLHttpRequest();       
   	    xhr.open("POST","/tablero/UploadServlet", false);      	      	   
   	    xhr.send(formdata);
   	    xhr.onload = function(e) {
   	        if (this.status == 200) {    	         	        
   	            alert(this.responseText);
   	        }else{
   	        	alert("no se pudo cargar el archivo. Intentelo nuevamente");
   	        }
   	    };     */                 
    	    
    	
    });


</script>

</body>
</html>