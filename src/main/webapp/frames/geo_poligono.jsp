<div class="modal fade" id="geoPoligono" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" >
			<div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">Registrar Geo Pol�gono</h4>
			</div>
		    <div class="modal-body" >
				<form class="form-horizontal" role="form">
				  <div class="form-group">
				    <label for="nombreGeoPoligono" class="col-lg-2 control-label">Nombre</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="nombreGeoPoligono" placeholder="Nombre">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="descripcionGeoPoligono" class="col-lg-2 control-label">Descripci�n</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="descripcionGeoPoligono" placeholder="Descripci�n">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="geoGeoPoligono" class="col-lg-2 control-label">Geo</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="geoGeoPoligono" placeholder="Geo">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="geoPoligonoTipoIdGeoPoligono" class="col-lg-2 control-label">Geo Pol�gono Tipo Id</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="geoPoligonoTipoIdGeoPoligono" placeholder="Geo Poligono Tipo Id">
				    </div>
				  </div>				  				  				  			  				  
				  <div class="form-group">
				    <div class="col-lg-offset-2 col-lg-10">
				      <button type="submit" class="btn btn-primary" id="guardarGeoPoligono">Guardar</button>
				    </div>
				  </div>
				</form>		    
		    </div>
			<div class="modal-footer"></div>
		</div> 
	</div>
</div>
	<script>
	$("body").on("click", "#guardarTipoAccion",function(event){		
			var todojunto = new Object();
			var accion = "insGeoPoligono";
			var nombre= $("#nombreGeoPoligono").val();
			var descripcion= $("#descripcionGeoPoligono").val();	
			var geo=$("#geoGeoPoligono").val();
			var geoPoligonoTipoId=$("#geoPoligonoTipoIdGeoPoligono").val();
							
			todojunto.nombre=nombre;
			todojunto.descripcion=descripcion;
			todojunto.geo=geo;
			todojunto.geoPoligonoTipoId=geoPoligonoTipoId;
			
				 
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






