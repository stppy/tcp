<div class="modal fade" id="insLineaAccion" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" >
			<div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">Registrar Linea de Acción por Institución</h4>
			</div>
		    <div class="modal-body" id="insLineaAccion" >
				<form class="form-horizontal" role="form">
				  <div class="form-group">
				    <label for="lineaAccionIdInsLineaAccion" class="col-lg-2 control-label">Linea de Accion Id</label>
				    <div class="col-lg-10">
				      <input type="hidden" class="form-control" id="idInsLineaAccion">
				      <input type="text" class="form-control" id="lineaAccionIdInsLineaAccion" placeholder="Linea de Accion Id">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="institucionIdInsLineaAccion" class="col-lg-2 control-label">Institución Id</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="institucionIdInsLineaAccion" placeholder="Institución Id">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="periodoIdInsLineaAccion" class="col-lg-2 control-label">Periodo</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="periodoIdInsLineaAccion" placeholder="Periodo Id">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="metaInsLineaAccion" class="col-lg-2 control-label">Meta</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="metaInsLineaAccion" placeholder="Meta">
				    </div>
				  </div>				  				  
				  <div class="form-group">
				    <div class="col-lg-offset-2 col-lg-10">
				      <button type="submit" class="btn btn-primary" id="guardarInsLineaAccion">Guardar</button>
				    </div>
				  </div>
				</form>		    
		    </div>
			<div class="modal-footer"></div>
		</div> 
	</div>
</div>
	<script>
	$("body").on("click", "#guardarInsLineaAccion",function(event){		
			var objeto = new Object();
			var accion = "insInsLineaAccion";
			var lineaAccionId= $("#lineaAccionIdInsLineaAccion").val();
			var institucionId= $("#institucionIdInsLineaAccion").val();
			var periodoId= $("#periodoIdInsLineaAccion").val();
			var meta= $("#metaInsLineaAccion").val();			
							
			objeto.lineaAccionId=lineaAccionId;
			objeto.institucionId=institucionId;
			objeto.periodoId=periodoId;
			objeto.meta=meta;
			
				 
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
	</script>	
