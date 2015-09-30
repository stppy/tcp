<div class="modal fade" id="hito" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" >
			<div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">Registrar Hito</h4>
			</div>
		    <div class="modal-body" >
				<form class="form-horizontal" role="form">
				  <div class="form-group">
				    <label for="nombreHito" class="col-lg-2 control-label">Nombre</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="nombreHito" placeholder="Nombre">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="descripcionHito" class="col-lg-2 control-label">Descripción</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="descripcionHito" placeholder="Descripción">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="cantidadHito" class="col-lg-2 control-label">Cantidad</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="cantidadHito" placeholder="Cantidad">
				    </div>
				  </div>	
				  <div class="form-group">
				    <label for="fechaEntregaHito" class="col-lg-2 control-label">Fecha Entrega</label>
				    <div class="col-lg-10">
				      <input type="date" class="form-control" id="fechaEntregaHito" placeholder="Fecha Entrega">
				    </div>
				  </div>	
				  <div class="form-group">
				    <label for="hitoTipoIdHito" class="col-lg-2 control-label">Hito Tipo Id</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="hitoTipoIdHito" placeholder="Hito Tipo Id">
				    </div>
				  </div>	
				  <div class="form-group">
				    <label for="accionIdHito" class="col-lg-2 control-label">Acción Id</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="accionIdHito" placeholder="Acción Id">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="evidenciaIdHito" class="col-lg-2 control-label">Evidencia Id</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="evidenciaIdHito" placeholder="Evidencia Id">
				    </div>
				  </div>	
				  <div class="form-group">
				    <label for="unidadMedidaIdHito" class="col-lg-2 control-label">Unidad Medida Id</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="unidadMedidaIdHito" placeholder="Unidad Medida Id">
				    </div>
				  </div>	
				  <div class="form-group">
				    <label for="pesoHito" class="col-lg-2 control-label">Peso</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="pesoHito" placeholder="Peso">
				    </div>
				  </div>					  				  				  				  			  			  			  
				  <div class="form-group">
				    <div class="col-lg-offset-2 col-lg-10">
				      <button type="submit" class="btn btn-primary" id="guardarHito">Guardar</button>
				    </div>
				  </div>
				</form>		    
		    </div>
			<div class="modal-footer"></div>
		</div> 
	</div>
</div>
	<script>
	$("body").on("click", "#guardarHito",function(event){		
			var objeto = new Object();
			var accion = "insHito";
			var nombre= $("#nombreHito").val();
			var descripcion= $("#descripcionHito").val();		
			var cantidad= $("#cantidadHito").val();	
			var fechaEntrega= $("#fechaEntregaHito").val();		
			var hitoTipoId= $("#hitoTipoIdHito").val();		
			var accionId= $("#accionIdHito").val();
			var evidenciaId= $("#evidenciaIdHito").val();
			var unidadMedidaId= $("#unidadMedidaIdHito").val();
			var peso= $("#pesoHito").val();

			objeto.nombre=nombre;
			objeto.descripcion=descripcion;		
			objeto.cantidad=cantidad;	
			objeto.fechaEntrega=fechaEntrega;				
			objeto.hitoTipoId=hitoTipoId;				
			objeto.accionId=accionId;		
			objeto.evidenciaId=evidenciaId;	
			objeto.unidadMedidaId=unidadMedidaId;	
			objeto.peso=peso;				

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