<div class="modal fade" id="geoPoligono" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" >
			<div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">Registrar Geo Polígono</h4>
			</div>
		    <div class="modal-body" >
				<form class="form-horizontal" role="form">
				  <div class="form-group">
				    <label for="nombreGeoPoligono" class="col-lg-2 control-label">Nombre</label>
				    <div class="col-lg-10">
				      <input type="hidden" class="form-control" id="idGeoPoligono">
				      <input type="text" class="form-control" id="nombreGeoPoligono" placeholder="Nombre">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="descripcionGeoPoligono" class="col-lg-2 control-label">Descripción</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="descripcionGeoPoligono" placeholder="Descripción">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="geoGeoPoligono" class="col-lg-2 control-label">Geo</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="geoGeoPoligono" placeholder="Geo">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="geoPoligonoIdGeoPoligono" class="col-lg-2 control-label">Geo Polígono Id</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="geoPoligonoIdGeoPoligono" placeholder="Geo Poligono Tipo Id">
				    </div>
				  </div>				  
				  <div class="form-group">
				    <label for="geoPoligonoTipoIdGeoPoligono" class="col-lg-2 control-label">Geo Polígono Tipo Id</label>
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
$("body").on("click", "#guardarGeoPoligono",function(event){		
		var objeto = new Object();
		var accion = "insGeoPoligono";
		var nombre= $("#nombreGeoPoligono").val();
		var descripcion= $("#descripcionGeoPoligono").val();
		var geo=$("#geoGeoPoligono").val();
		var geoPoligonoId = $("#geoPoligonoIdGeoPoligono").val();
		var geoPoligonoTipoId=$("#geoPoligonoTipoIdGeoPoligono").val();
						
		objeto.nombre=nombre;
		objeto.descripcion=descripcion;
		objeto.geo=geo;
		objeto.geoPoligonoId=geoPoligonoId;
		objeto.geoPoligonoTipoId=geoPoligonoTipoId;
		 
		$.ajax({
		        url: "/tablero/ajaxInserts2?accion="+accion,
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

$("body").on("click", "#actualizarGeoPoligono",function(event){		
	var objeto = new Object();
	var accion = "actGeoPoligono";
	var id = $("#idGeoPoligono").val();
	var nombre= $("#nombreGeoPoligono").val();
	var descripcion= $("#descripcionGeoPoligono").val();
	var geo= $("#geoGeoPoligono").val();
	var geoPoligonoId= $("#geoPoligonoIdGeoPoligono").val();
	var geoPoligonoTipoId= $("#geoPoligonoTipoIdGeoPoligono").val();
	
		
	objeto.id = id;
	objeto.nombre = nombre;
	objeto.descripcion = descripcion;
	objeto.geo = geo;
	objeto.geoPoligonoId = geoPoligonoId;
	objeto.geoPoligonoTipoId = geoPoligonoTipoId;

	$.ajax({
	        url: "/tablero/ajaxUpdate2?accion="+accion,
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

$("body").on("click", "#iconoBorradoGeoPoligono",function(event){		
	var objeto = new Object();
	var accion = "borradoGeoPoligono";
	var parametrosBorradoGeoPoligono = $(this).attr("parametrosBorradoGeoPoligono");
    var idParsed = parametrosBorradoGeoPoligono.split("-");                                                            
	var id = idParsed[0];
	var geoPoligonoId = idParsed[1];
	var borrado = idParsed[2];
	
	objeto.id = id;
	objeto.geoPoligonoId = geoPoligonoId;
	objeto.borrado = borrado;

	$.ajax({
	    url: "/tablero/ajaxUpdate2?accion="+accion,
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
		window.location.href = "http://spr.stp.gov.py/tablero/contenedorGeoPoligono.jsp";
});
	</script>	






