<div class="modal fade" id="sprProducto" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" >
			<div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">Registrar Spr Producto</h4>
			</div>
		    <div class="modal-body" >
				<form class="form-horizontal" role="form">
				  <div class="form-group">
				    <label for="nivelIdSprProducto" class="col-lg-2 control-label">Nivel Id</label>
				    <div class="col-lg-10">
				      <input type="hidden" class="form-control" id="idSprProducto">
				      <input type="number" class="form-control" id="nivelIdSprProducto" placeholder="NIvel Id">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="entidadIdSprProducto" class="col-lg-2 control-label">Entidad Id</label>
				    <div class="col-lg-10">
				      <input type="number" class="form-control" id="entidadIdSprProducto" placeholder="Entidad Id">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="tipoIdSprProducto" class="col-lg-2 control-label">Tipo Id</label>
				    <div class="col-lg-10">
				      <input type="number" class="form-control" id="tipoIdSprProducto" placeholder="Tipo Id">
				    </div>
				  </div>	
				  <div class="form-group">
				    <label for="programaIdSprProducto" class="col-lg-2 control-label">Programa Id</label>
				    <div class="col-lg-10">
				      <input type="number" class="form-control" id="programaIdSprProducto" placeholder="Programa Id">
				    </div>
				  </div>	
				  <div class="form-group">
				    <label for="subprogramaIdSprProducto" class="col-lg-2 control-label">Subprograma Id</label>
				    <div class="col-lg-10">
				      <input type="number" class="form-control" id="subprogramaIdSprProducto" placeholder="Subprograma Id">
				    </div>
				  </div>	
				  <div class="form-group">
				    <label for="proyectoIdSprProducto" class="col-lg-2 control-label">Proyecto Id</label>
				    <div class="col-lg-10">
				      <input type="number" class="form-control" id="proyectoIdSprProducto" placeholder="Proyecto Id">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="funcionalIdSprProducto" class="col-lg-2 control-label">Funcional Id</label>
				    <div class="col-lg-10">
				      <input type="number" class="form-control" id="funcionalIdSprProducto" placeholder="Funcional Id">
				    </div>
				  </div>	
				  <div class="form-group">
				    <label for="unidadResponsableIdSprProducto" class="col-lg-2 control-label">Unidad Responsable Id</label>
				    <div class="col-lg-10">
				      <input type="number" class="form-control" id="unidadResponsableIdSprProducto" placeholder="Unidad Responsable Id">
				    </div>
				  </div>	
				  <div class="form-group">
				    <label for="productoIdSprProducto" class="col-lg-2 control-label">Producto Id</label>
				    <div class="col-lg-10">
				      <input type="number" class="form-control" id="productoIdSprProducto" placeholder="Producto Id">
				    </div>
				  </div>					  				  				  				  			  			  			  
				  <div class="form-group">
				    <div class="col-lg-offset-2 col-lg-10">
				      <button type="submit" class="btn btn-primary" id="guardarSprProducto">Guardar</button>
				    </div>
				  </div>
				</form>		    
		    </div>
			<div class="modal-footer"></div>
		</div> 
	</div>
</div>
	<script>
	$("body").on("click", "#guardarSprProducto",function(event){		
			var objeto = new Object();
			var accion = "insSprProducto";
			var nivelId= $("#nivelIdSprProducto").val();
			var entidadId= $("#entidadIdSprProducto").val();		
			var tipoId= $("#tipoIdSprProducto").val();	
			var programaId= $("#programaIdSprProducto").val();		
			var subprogramaId= $("#subprogramaIdSprProducto").val();		
			var proyectoId= $("#proyectoIdSprProducto").val();
			var funcionalId= $("#funcionalIdSprProducto").val();
			var unidadResponsableId= $("#unidadResponsableIdSprProducto").val();
			var productoId= $("#productoIdSprProducto").val();
			

			objeto.nivelId=nivelId;
			objeto.entidadId=entidadId;		
			objeto.tipoId=tipoId;	
			objeto.programaId=programaId;	
			objeto.subprogramaId=subprogramaId;				
			objeto.proyectoId=proyectoId;				
			objeto.funcionalId=funcionalId;		
			objeto.unidadResponsableId=unidadResponsableId;		
			objeto.productoId=productoId;		
				

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
	
	
	$("body").on("click", "#actualizarSprProducto",function(event){		
		var objeto = new Object();
		var accion = "actSprProducto";
		var id = $("#idSprProducto").val();
		var nivelId= $("#nivelIdSprProducto").val();
		var entidadId= $("#entidadIdSprProducto").val();		
		var tipoId= $("#tipoIdSprProducto").val();	
		var programaId= $("#programaIdSprProducto").val();		
		var subprogramaId= $("#subprogramaIdSprProducto").val();		
		var proyectoId= $("#proyectoIdSprProducto").val();
		var funcionalId= $("#funcionalIdSprProducto").val();
		var unidadResponsableId= $("#unidadResponsableIdSprProducto").val();
		var productoId= $("#productoIdSprProducto").val();
		
		objeto.id=id;
		objeto.nivelId=nivelId;
		objeto.entidadId=entidadId;		
		objeto.tipoId=tipoId;	
		objeto.programaId=programaId;	
		objeto.subprogramaId=subprogramaId;				
		objeto.proyectoId=proyectoId;				
		objeto.funcionalId=funcionalId;		
		objeto.unidadResponsableId=unidadResponsableId;		
		objeto.productoId=productoId;		
		

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