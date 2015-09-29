<div class="modal fade" id="ws" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" >
			<div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">Registrar Ws</h4>
			</div>  
		    <div class="modal-body" >
				<form class="form-horizontal" role="form">
				  <div class="form-group">
				    <label for="nombreWs" class="col-lg-2 control-label">Nombre</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="nombreWs" placeholder="Nombre">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="descripcionWs" class="col-lg-2 control-label">Descripción</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="descripcionWs" placeholder="Descripción">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="urlWs" class="col-lg-2 control-label">Url</label>
				    <div class="col-lg-10">
				      <input type="url" class="form-control" id="urlWs" placeholder="Url">
				    </div>
				  </div>	
				  <div class="form-group">
				    <label for="metodoWs" class="col-lg-2 control-label">Metodo</label>
				    <div class="col-lg-10">
				      <input type="date" class="form-control" id="metodoWs" placeholder="Metodo">
				    </div>
				  </div>	
				  <div class="form-group">
				    <label for="usuarioWs" class="col-lg-2 control-label">Usuario</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="usuarioWs" placeholder="Usuario">
				    </div>
				  </div>	
				  <div class="form-group">
				    <label for="passWs" class="col-lg-2 control-label">Pass</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="passWs" placeholder="Pass">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="idClaveWs" class="col-lg-2 control-label">Id Clave</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="idClaveWs" placeholder="Id Clave">
				    </div>
				  </div>	
				  <div class="form-group">
				    <label for="idValorWs" class="col-lg-2 control-label">Id Valor</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="idValorWs" placeholder="Id Valor">
				    </div>
				  </div>	
				  <div class="form-group">
				    <label for="wsTipoIdWs" class="col-lg-2 control-label">Ws Tipo Id</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="wsTipoIdWs" placeholder="Ws Tipo Id">
				    </div>
				  </div>					  				  				  				  			  			  			  
				  <div class="form-group">
				    <div class="col-lg-offset-2 col-lg-10">
				      <button type="submit" class="btn btn-primary" id="guardarWs">Guardar</button>
				    </div>
				  </div>
				</form>		    
		    </div>
			<div class="modal-footer"></div>
		</div> 
	</div>
</div>
	<script>
	$("body").on("click", "#guardarWs",function(event){		
			var objeto = new Object();
			var accion = "insWs";
			var nombre= $("#nombreWs").val();
			var descripcion= $("#descripcionWs").val();		
			var url= $("#urlWs").val();	
			var metodo= $("#metodoWs").val();		
			var usuario= $("#usuarioWs").val();		
			var pass= $("#passWs").val();
			var idClave= $("#idClaveWs").val();
			var idValor= $("#idValorWs").val();
			var wsTipoId= $("#wsTipoIdWs").val();

			objeto.nombre=nombre;
			objeto.descripcion=descripcion;		
			objeto.url=url;	
			objeto.metodo=metodo;	
			objeto.usuario=usuario;				
			objeto.pass=pass;				
			objeto.idClave=idClave;		
			objeto.idValor=idValor;		
			objeto.wsTipoId=wsTipoId;				

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