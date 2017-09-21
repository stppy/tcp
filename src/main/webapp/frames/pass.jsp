	<!-- MODAL PASSWORD -->
	<div id="pass_modal" class="modal fade" role="dialog">
		<div class="modal-dialog modal-sm">
		    <!-- Modal content-->
			<div class="modal-content">	
	    		<div class="modal-header">
		        	<h4 class="modal-title" id="tituloModalUsuario">Cambiar Contraseña</h4>
		      	</div>					      
				<div class="modal-body">
		      		<form role="form">
			      		<div class="form-group">
			            	<input id="pass-viejo-form" name="current_password" class="form-control" placeholder="Clave Actual" title="Completa este campo" type="password" pattern="\w+" required>
						</div>
				        <div class="form-group">						            
				        	<input id="pass-nuevo-form" name="new_password" class="form-control" placeholder="Clave Nueva" type="password" title="Completa este campo" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}">
				        </div>
				        <div class="form-group">						            
				        	<input id="pass-nuevo1-form" name="confirm_password" class="form-control" placeholder="Confirmar Clave Nueva" type="password" title="Completa este campo" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}"> 
				        </div> 						      
				      	<div class="modal-footer">
				        	<button class="btn btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
				        	<button type="submit" class="btn btn-primary" id="password_modal_save">Guardar </button>						      
						</div>
					</form>
				</div>
		    </div>

	
	  </div>
	</div>
	
	<script>
	$("body").on("click", "#password_modal_save",function(event){		
			var todojunto = new Object();
			var accion = "actPass";
			var contrasenaVieja= $.md5($("#pass-viejo-form").val());
			var contrasenaNueva= $.md5($("#pass-nuevo-form").val());
			var contrasenaNueva1=$.md5($("#pass-nuevo1-form").val());		
							
			todojunto.contrasenaVieja=contrasenaVieja;
			todojunto.contrasenaNueva=contrasenaNueva;
			todojunto.contrasenaNueva1=contrasenaNueva1;
			
			if(todojunto.contrasenaNueva == todojunto.contrasenaNueva1 && todojunto.contrasenaNueva!="d41d8cd98f00b204e9800998ecf8427e" && todojunto.contrasenaNueva1!="d41d8cd98f00b204e9800998ecf8427e")
			{
				
				
				var obtenerUsuario = $.ajax({
					<%-- url:'/tablero/ajaxSelects?action=getUsuarios&usuario=<%=user.getName()%>',--%>
					url:'/tablero/ajaxSelects?action=getUsuarios&usuario=rpalau@stp.gov.py',
				  	type:'get',
				  	dataType:'json',
				  	async:false       
				}).responseText;
				obtenerUsuario = JSON.parse(obtenerUsuario);
				obtenerUsuario = obtenerUsuario.usuarios;
							
				todojunto.correoUsuario=obtenerUsuario[0].correo;
				 
				$.ajax({
				        url: "http://spr.stp.gov.py/tablero/ajaxUpdate?accion="+accion,
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
								$("#tituloModalUsuario").append('<p class="text-success">CAMBIO EXITOSO</p>');
					    		$("#pass-viejo-form").val("");
								$("#pass-nuevo-form").val("");
								$("#pass-nuevo1-form").val("");	
				        	}else{
				        		if (data.success == false){
				        			$("#tituloModalUsuario").html('');
						        	$("#tituloModalUsuario").append('<p class="text-danger">Error: CONTRASEÑA ANTERIOR INVÁLIDA</p>');
				        		}
				        	}
				        },
				        error: function(data,status,er)
				        {
				        	$("#tituloModalUsuario").html('');
				        	$("#tituloModalUsuario").append('<p class="text-danger">Error de conexion intente de nuevo</p>');
				        }
				 });

			}


			
		});
	$("body").on("click", "#pass-viejo-form",function(event){		
		
		$("#tituloModalUsuario").html('');
		$("#pass-viejo-form").val("");
		$("#pass-nuevo-form").val("");
		$("#pass-nuevo1-form").val("");		
		
	});
	</script>