<div class="modal fade" id="accionHasGeoPoligono" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" >
			<div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">Registrar Acción Has Geo Polígono</h4><h4 id="asd"></h4>
			</div>
		    <div class="modal-body" >
				<form class="form-horizontal" role="form">				
				  <div class="form-group">
				    <label for="geoPoligonoIdAccionHasGeoPoligono" class="col-lg-2 control-label">Geo Poligono Id</label>
				    <div class="col-lg-10">
				    	<input type="hidden" class="form-control" id="accionIdAccionHasGeoPoligono">
				      <input type="text" class="form-control" id="geoPoligonoIdAccionHasGeoPoligono" placeholder="Geo Polígono Id">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="geoPoligonoGeoPoligonoIdAccionHasGeoPoligono" class="col-lg-2 control-label">Geo Polígono Geo Polígono Id</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="geoPoligonoGeoPoligonoIdAccionHasGeoPoligono" placeholder="Geo Polígono Geo Polígono Id">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="proporcionAccionHasGeoPoligono" class="col-lg-2 control-label">Proporción</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="proporcionAccionHasGeoPoligono" placeholder="Proporción">
				    </div>
				  </div>			  				  				  			  				  
				  <div class="form-group">
				    <div class="col-lg-offset-2 col-lg-10">
				      <button type="submit" class="btn btn-primary" id="guardarAccionHasGeoPoligono">Guardar</button>
				    </div>
				  </div>
				</form>		    
		    </div>
			<div class="modal-footer"></div>
		</div> 
	</div>
</div>
	<script>
$("body").on("click", "#guardarAccionHasGeoPoligono",function(event){		
		var objeto = new Object();
		var accion = "insAccionHasGeoPoligono";
		var accionId = $("#accionIdAccionHasGeoPoligono").val();
		var geoPoligonoId= $("#geoPoligonoIdAccionHasGeoPoligono").val();
		var geoPoligonoGeoPoligonoId= $("#geoPoligonoGeoPoligonoIdAccionHasGeoPoligono").val();
		var proporcion = $("#proporcionAccionHasGeoPoligono").val();
						
		objeto.accionId=accionId;
		objeto.geoPoligonoId=geoPoligonoId;
		objeto.geoPoligonoGeoPoligonoId=geoPoligonoGeoPoligonoId;
		objeto.proporcion=proporcion;
		
			 
		$.ajax({
		        url: "http://tablero2015.stp.gov.py/tablero/ajaxInserts2?accion="+accion,
		        type: 'POST',
		        dataType: 'json',
		        data: JSON.stringify(objeto),
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        
		        success: function (data)
		        {
		        	if (data.success == true)
		        	{
		        		$("#tituloModalUsuario").html('');
						$("#tituloModalUsuario").append('<p class="text-success">GUARDADO</p>');
			    		$("#pass-viejo-form").val("");
						$("#pass-nuevo-form").val("");
						$("#pass-nuevo1-form").val("");	
		        	}else{
		        		if (data.success == false){
		        			$("#tituloModalUsuario").html('');
				        	$("#tituloModalUsuario").append('<p class="text-danger">Error no se ha guardado</p>');
		        		}
		        	}
		        },
		        error: function(data,status,er)
		        {
		        	$("#tituloModalUsuario").html('');
		        	$("#tituloModalUsuario").append('<p class="text-danger">Error de conexion intente de nuevo</p>');
		        }
		 });

	});
	
$("body").on("click", "#actualizarAccionHasGeoPoligono",function(event){		
	var objeto = new Object();
	var accion = "actAccionHasGeoPoligono";
	var accionId = $("#accionIdAccionHasGeoPoligono").val();
	var geoPoligonoId= $("#geoPoligonoIdAccionHasGeoPoligono").val();
	var geoPoligonoGeoPoligonoId= $("#geoPoligonoGeoPoligonoIdAccionHasGeoPoligono").val();
	var proporcion= $("#proporcionAccionHasGeoPoligono").val();	
		
	objeto.accionId = accionId;
	objeto.geoPoligonoId = geoPoligonoId;
	objeto.geoPoligonoGeoPoligonoId = geoPoligonoGeoPoligonoId;
	objeto.proporcion = proporcion;	

	$.ajax({
	        url: "http://tablero2015.stp.gov.py/tablero/ajaxUpdate2?accion="+accion,
	        type: 'POST',
	        dataType: 'json',
	        data: JSON.stringify(objeto),
	        contentType: 'application/json',
	        mimeType: 'application/json',
	        
	        success: function (data)
	        {
	        	if (data.success == true)
	        	{
	        		$("#asd").html('');
					$("#asd").append('<p class="text-success">GUARDADO</p>');
		    		$("#pass-viejo-form").val("");
					$("#pass-nuevo-form").val("");
					$("#pass-nuevo1-form").val("");	
	        	}else{
	        		if (data.success == false){
	        			$("#tituloModalUsuario").html('');
			        	$("#tituloModalUsuario").append('<p class="text-danger">Error no se ha guardado</p>');
	        		}
	        	}
	        },
	        error: function(data,status,er)
	        {
	        	$("#tituloModalUsuario").html('');
	        	$("#tituloModalUsuario").append('<p class="text-danger">Error de conexion intente de nuevo</p>');
	        }
	 });		
});		
$("body").on("click", "#iconoBorradoAccionHasGeoPoligono",function(event){		
	var objeto = new Object();
	var accion = "borradoAccionHasGeoPoligono";
	var parametrosBorradoAccionHasGeoPoligono = $(this).attr("parametrosBorradoAccionHasGeoPoligono");
    var idParsed = parametrosBorradoAccionHasGeoPoligono.split("-");                                                            
	var accionId = idParsed[0];
	var geoPoligonoId = idParsed[1];
	var geoPoligonoGeoPoligonoId = idParsed[2];
	var borrado = idParsed[3];

	
	objeto.accionId = accionId;
	objeto.geoPoligonoId = geoPoligonoId;
	objeto.geoPoligonoGeoPoligonoId = geoPoligonoGeoPoligonoId;
	objeto.borrado = borrado;


	$.ajax({
	    url: "http://tablero2015.stp.gov.py/tablero/ajaxUpdate2?accion="+accion,
	    type: 'POST',
	    dataType: 'json',
	    data: JSON.stringify(objeto),
	    contentType: 'application/json',
	    mimeType: 'application/json',
    
	    success: function (data)
	    {
	    	if (data.success == true)
	    	{
	    		$("#asd").html('');
				$("#asd").append('<p class="text-success">GUARDADO</p>');
				$("#pass-viejo-form").val("");
				$("#pass-nuevo-form").val("");
				$("#pass-nuevo1-form").val("");	
			}else{
	    		if (data.success == false)
	    		{
	    			$("#tituloModalUsuario").html('');
	      			$("#tituloModalUsuario").append('<p class="text-danger">Error no se ha guardado</p>');
	    		}
	    	}
	    },
	    error: function(data,status,er)
	    {
	    	$("#tituloModalUsuario").html('');
	    	$("#tituloModalUsuario").append('<p class="text-danger">Error de conexion intente de nuevo</p>');
	    }
	});
		window.location.href = "http://tablero2015.stp.gov.py/tablero/contenedorAccionHasGeoPoligono.jsp";
});	
	</script>	







