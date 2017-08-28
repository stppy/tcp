<div class="modal fade" id="accion" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" >
			<div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">Registrar Acción</h4>
			</div>
		    <div class="modal-body" >
				<form class="form-horizontal" role="form">				
				  <div class="form-group">
				    <label for="insLineaAccionIdAccion" class="col-lg-2 control-label" id="insLineaAccionIdAccionLabel">Ins Linea Acción Id</label>
				    <div class="col-lg-10">
				     <input type="hidden" class="form-control" id="idAccion">
				      <input type="text" class="form-control" id="insLineaAccionIdAccion" placeholder="Ins Linea Acción Id">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="nombreAccion" class="col-lg-2 control-label">Nombre</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="nombreAccion" placeholder="Nombre">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="descripcionAccion" class="col-lg-2 control-label">Descripción</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="descripcionAccion" placeholder="Descripción">
				    </div>
				  </div>	
				  <div class="form-group">
				    <label for="costoAccion" class="col-lg-2 control-label">Costo</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="costoAccion" placeholder="Costo">
				    </div>
				  </div>	
				  <div class="form-group">
				    <label for="pesoAccion" class="col-lg-2 control-label">Peso</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="pesoAccion" placeholder="Peso">
				    </div>
				  </div>	
				  <div class="form-group">
				    <label for="fechaInicioAccion" class="col-lg-2 control-label">Fecha Inicio</label>
				    <div class="col-lg-10">
				      <input type="date" class="form-control" id="fechaInicioAccion" placeholder="Fecha Inicio">
				    </div>
				  </div>	
				  <div class="form-group">
				    <label for="fechaFinAccion" class="col-lg-2 control-label">Fecha Fin</label>
				    <div class="col-lg-10">
				      <input type="date" class="form-control" id="fechaFinAccion" placeholder="Fecha Fin">
				    </div>
				  </div>						  			  				  				  			  			  
				  <div class="form-group">
				    <div class="col-lg-offset-2 col-lg-10">
				      <button type="submit" class="btn btn-primary" id="guardarAccion">Guardar</button>
				    </div>
				  </div>
				</form>		    
		    </div>
			<div class="modal-footer"></div>
		</div> 
	</div>
</div>
	<script>
	$("body").on("click", "#guardarAccion",function(event){		
			var objeto = new Object();
			var accion = "insAccion";
			var insLineaAccionId= $("#insLineaAccionIdAccion").val();
			var nombre= $("#nombreAccion").val();
			var descripcion= $("#descripcionAccion").val();	
			var costo= $("#costoAccion").val();		
			var peso= $("#pesoAccion").val();	
			var fechaInicio= $("#fechaInicioAccion").val();	
			var fechaFin= $("#fechaFinAccion").val();		
		
			objeto.insLineaAccionId=insLineaAccionId;
			objeto.nombre=nombre;
			objeto.descripcion=descripcion;	
			objeto.costo=costo;			
			objeto.peso=peso;			
			objeto.fechaInicio=fechaInicio;			
			objeto.fechaFin=fechaFin;			
 
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
	
$("body").on("click", "#actualizarAccion",function(event){		
	var objeto = new Object();
	var accion = "actAccion";
	var id = $("#idAccion").val();
	var insLineaAccionId= $("#insLineaAccionIdAccion").val();
	var nombre= $("#nombreAccion").val();
	var descripcion= $("#descripcionAccion").val();	
	var costo= $("#costoAccion").val();		
	var peso= $("#pesoAccion").val();	
	var fechaInicio= $("#fechaInicioAccion").val();	
	var fechaFin= $("#fechaFinAccion").val();		
	var borrado= $("#borradoAccion").val();
		
	objeto.id = id;
	objeto.insLineaAccionId = insLineaAccionId;
	objeto.nombre = nombre;
	objeto.descripcion = descripcion;	
	objeto.costo = costo;			
	objeto.peso = peso;			
	objeto.fechaInicio = fechaInicio;		
	objeto.fechaFin = fechaFin;		
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

$("body").on("click", "#iconoBorradoAccion",function(event){		
	var objeto = new Object();
	var accion = "borradoAccion";
	var parametrosBorradoAccion = $(this).attr("parametrosBorradoAccion");
    var idParsed = parametrosBorradoAccion.split("-");                                                            
	var id = idParsed[0];
	var borrado = idParsed[1];
	
	objeto.id = id;
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
		window.location.href = "http://spr.stp.gov.py/tablero/contenedorAccion.jsp";
});	
	</script>	