<div class="modal fade" id="accionHasGeoPoligono" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" >
			<div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">Registrar Acción Has Geo Polígono</h4>
			</div>
		    <div class="modal-body" >
				<form class="form-horizontal" role="form">
				  <div class="form-group">
				    <label for="geoPoligonoIdAccionHasGeoPoligono" class="col-lg-2 control-label">Geo Poligono Id</label>
				    <div class="col-lg-10">
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
			var todojunto = new Object();
			var accion = "insAccionHasGeoPoligono";
			var geoPoligonoId= $("#geoPoligonoIdAccionHasGeoPoligono").val();
			var geoPoligonoGeoPoligonoId= $("#geoPoligonoGeoPoligonoIdAccionHasGeoPoligono").val();
			var proporcion = $("#proporcionAccionHasGeoPoligono").val();
							
			todojunto.geoPoligonoId=geoPoligonoId;
			todojunto.geoPoligonoGeoPoligonoId=geoPoligonoGeoPoligonoId;
			todojunto.proporcion=proporcion;
			
				 
			$.ajax({
			        url: "http://tablero2015.stp.gov.py/tablero/ajaxInserts2?accion="+accion,
			        type: 'POST',
			        dataType: 'json',
			        data: JSON.stringify(todojunto),
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







