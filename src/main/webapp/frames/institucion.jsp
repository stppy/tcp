<div class="modal fade" id="institucion" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" >
			<div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">Registrar Institución</h4>
			</div>
		    <div class="modal-body" >
				<form class="form-horizontal" role="form">
				  <div class="form-group">
				    <label for="nombreInstitucion" class="col-lg-2 control-label">Nombre</label>
				    <div class="col-lg-10">
				      <input type="hidden" class="form-control" id="idInstitucion">
				      <input type="text" class="form-control" id="nombreInstitucion" placeholder="Nombre">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="descripcionInstitucion" class="col-lg-2 control-label">Descripción</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="descripcionInstitucion" placeholder="Descripción">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="siglaInstitucion" class="col-lg-2 control-label">Sigla</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="siglaInstitucion" placeholder="Sigla">
				    </div>
				  </div>	
				  <div class="form-group">
				    <label for="nivelIdInstitucion" class="col-lg-2 control-label">Nivel Id</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="nivelIdInstitucion" placeholder="Nivel Id">
				    </div>
				  </div>	
				  <div class="form-group">
				    <label for="entidadIdInstitucion" class="col-lg-2 control-label">Entidad Id</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="entidadIdInstitucion" placeholder="Entidad Id">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="unidadJerarquicaIdInstitucion" class="col-lg-2 control-label">Unidad Jerarquica Id</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="unidadJerarquicaIdInstitucion" placeholder="Unidad Jerarquica Id">
				    </div>
				  </div>	
				  <div class="form-group">
				    <label for="unidadResponsableIdInstitucion" class="col-lg-2 control-label">Unidad Responsable Id</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="unidadResponsableIdInstitucion" placeholder="Unidad Responsable Id">
				    </div>
				  </div>	
				  <div class="form-group">
				    <label for="ordenInstitucion" class="col-lg-2 control-label">Orden</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="ordenInstitucion" placeholder="Orden">
				    </div>
				  </div>					  				  				  				  			  			  			  
				  <div class="form-group">
				    <div class="col-lg-offset-2 col-lg-10">
				      <button type="submit" class="btn btn-primary" id="guardarInstitucion">Guardar</button>
				    </div>
				  </div>
				</form>		    
		    </div>
			<div class="modal-footer"></div>
		</div> 
	</div>
</div>
	<script>
	$("body").on("click", "#guardarInstitucion",function(event){		
			var objeto = new Object();
			var accion = "insInstitucion";
			var nombre= $("#nombreInstitucion").val();
			var descripcion= $("#descripcionInstitucion").val();		
			var sigla= $("#siglaInstitucion").val();	
			var nivelId= $("#nivelIdInstitucion").val();		
			var entidadId= $("#entidadIdInstitucion").val();		
			var unidadJerarquicaId= $("#unidadJerarquicaIdInstitucion").val();
			var unidadResponsableId= $("#unidadResponsableIdInstitucion").val();
			var orden= $("#ordenInstitucion").val();

			objeto.nombre=nombre;
			objeto.descripcion=descripcion;		
			objeto.sigla=sigla;	
			objeto.nivelId=nivelId;	
			objeto.entidadId=entidadId;				
			objeto.unidadJerarquicaId=unidadJerarquicaId;				
			objeto.unidadResponsableId=unidadResponsableId;		
			objeto.orden=orden;		
				

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