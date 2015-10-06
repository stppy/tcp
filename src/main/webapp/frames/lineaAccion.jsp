<div class="modal fade" id="lineaAccion" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" >
			<div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">Registrar Linea Acción</h4>
			</div>
		    <div class="modal-body">
				<form class="form-horizontal" role="form">
				  <div class="form-group">
				    <label for="nombreLineaAccion" class="col-lg-2 control-label">Nombre</label>
				    <div class="col-lg-10">
				      <input type="hidden" class="form-control" id="idLineaAccion">
				      <input type="text" class="form-control" id="nombreLineaAccion" placeholder="Nombre">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="descripcionLineaAccion" class="col-lg-2 control-label">Descripción</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="descripcionLineaAccion" placeholder="Descripción">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="ordenLineaAccion" class="col-lg-2 control-label">Orden</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="ordenLineaAccion" placeholder="Orden">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="pesoLineaAccion" class="col-lg-2 control-label">Peso</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="pesoLineaAccion" placeholder="Peso">
				    </div>
				  </div>	
				  <div class="form-group">
				    <label for="acumularLineaAccion" class="col-lg-2 control-label">Acumular</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="acumularLineaAccion" placeholder="Acumulador">
				    </div>
				  </div>		
				  <div class="form-group">
				    <label for="tipoAccionIdLineaAccion" class="col-lg-2 control-label">Tipo_accion_id</label>
				    <div class="col-lg-10">
				      <input type="number" class="form-control" id="tipoAccionIdLineaAccion" placeholder="Tipo accion id">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="estrategiaIdLineaAccion" class="col-lg-2 control-label">Estrategia_id</label>
				    <div class="col-lg-10">
				      <input type="number" class="form-control" id="estrategiaIdLineaAccion" placeholder="Estrategia id">
				    </div>
				  </div>	
				  <div class="form-group">
				    <label for="unidadMedidaIdLineaAccion" class="col-lg-2 control-label">Unidad_medida_id</label>
				    <div class="col-lg-10">
				      <input type="number" class="form-control" id="unidadMedidaIdLineaAccion" placeholder="Unidad medida id">
				    </div>
				  </div>					  			  				  		  			  				  
				  <div class="form-group">
				    <div class="col-lg-offset-2 col-lg-10">
				      <button type="submit" class="btn btn-primary" id="guardarLineaAccion">Guardar</button>
				    </div>
				  </div>
				</form>		    
		    </div>
			<div class="modal-footer"></div>
		</div> 
	</div>
</div>
	<script>
	$("body").on("click", "#guardarLineaAccion",function(event){		
			var objeto = new Object();
			var accion = "insLineaAccion";
			var nombre= $("#nombreLineaAccion").val();
			var descripcion= $("#descripcionLineaAccion").val();	
			var orden= $("#ordenLineaAccion").val();
			var peso= $("#pesoLineaAccion").val();
			var acumular= $("#acumularLineaAccion").val();				
			var tipoAccionId= $("#tipoAccionIdLineaAccion").val();	
			var estrategiaId= $("#estrategiaIdLineaAccion").val();	
			var unidadMedidaId= $("#unidadMedidaIdLineaAccion").val();				
	
			objeto.nombre=nombre;
			objeto.descripcion=descripcion;
			objeto.orden=orden;
			objeto.peso=peso;
			objeto.acumular=acumular;			
			objeto.tipoAccionId=tipoAccionId;
			objeto.estrategiaId=estrategiaId;
			objeto.unidadMedidaId=unidadMedidaId;

				 
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
	
	
	$("body").on("click", "#actualizarLineaAccion",function(event)
			{
				var objeto = new Object();
				var accion = "actLineaAccion";
				var id = $("#idLineaAccion").val();
				var nombre = $("#nombreLineaAccion").val();
				var descripcion= $("#descripcionLineaAccion").val();
				var orden= $("#ordenLineaAccion").val();
				var peso= $("#pesoLineaAccion").val();
				var acumular= $("#acumularLineaAccion").val();
				var tipoAccionId= $("#tipoAccionIdLineaAccion").val();
				var estrategiaId= $("#estrategiaIdLineaAccion").val();
				var unidadMedidaId= $("#unidadMedidaIdLineaAccion").val();
				
				objeto.id = id;
				objeto.nombre=nombre;
				objeto.descripcion=descripcion;
				objeto.orden=orden;
				objeto.peso=peso;
				objeto.acumular=acumular;
				objeto.tipoAccionId=tipoAccionId;
				objeto.estrategiaId=estrategiaId;
				objeto.unidadMedidaId=unidadMedidaId;
				
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