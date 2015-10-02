<div class="modal fade" id="accionHasEtiqueta" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" >
			<div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">Registrar Acción Has Etiqueta</h4>
			</div>
		    <div class="modal-body" id="accionHasEtiqueta" >
				<form class="form-horizontal" role="form">
				  <div class="form-group">
				    <label for="accionIdAccionHasEtiqueta" class="col-lg-2 control-label">Accion Id</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="accionIdAccionHasEtiqueta" placeholder="Accion Id">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="etiquetaIdAccionHasEtiqueta" class="col-lg-2 control-label">Etiqueta Id</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="etiquetaIdAccionHasEtiqueta" placeholder="Etiqueta Id">
				    </div>
				  </div>				  				
				  <div class="form-group">
				    <label for="proporcionAccionHasEtiqueta" class="col-lg-2 control-label">Proporcion</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="proporcionAccionHasEtiqueta" placeholder="Proporcion">
				    </div>
				  </div>			  				  
				  <div class="form-group">
				    <div class="col-lg-offset-2 col-lg-10">
				      <button type="submit" class="btn btn-primary" id="guardarAccionHasEtiqueta">Guardar</button>
				    </div>
				  </div>
				</form>		    
		    </div>
			<div class="modal-footer"></div>
		</div> 
	</div>
</div>
	<script>
	$("body").on("click", "#guardarAccionHasEtiqueta",function(event){		
			var objeto = new Object();
			var accion = "insAccionHasEtiqueta";
			var accionId = $("#accionIdAccionHasEtiqueta").val();	
			var etiquetaId = $("#etiquetaIdAccionHasEtiqueta").val();	
			var proporcion= $("#proporcionAccionHasEtiqueta").val();	
							
			objeto.accionId=accionId;
			objeto.etiquetaId=etiquetaId;
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
	
	$("body").on("click", "#actualizarAccionHasEtiqueta",function(event)
	{
		var objeto = new Object();
		var accion = "actAccionHasEtiqueta";
		var accionId = $("#accionIdAccionHasEtiqueta").val();
		var etiquetaId = $("#etiquetaIdAccionHasEtiqueta").val();
		var proporcion= $("#proporcionAccionHasEtiqueta").val();
		objeto.accionId = accionId;
		objeto.etiquetaId = etiquetaId;
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
	</script>	