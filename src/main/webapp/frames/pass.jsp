	<!-- MODAL PASSWORD -->
	<div id="pass_modal" class="modal fade" role="dialog">
	  <div class="pass_mod">
	
	    <!-- Modal content-->
	    <div class="modal-content">	
    	  <div class="modal-header">
	        <h4 class="modal-title" id="tituloModalUsuario"> Cambiar contraseña</h4>
	      </div>					      
	      <div class="modal-body">
	         <div class="control-group">						            
	            <div class="controls">
	                <input id="pass-viejo-form" name="current_password" class="feedback-input" placeholder="Clave Actual" type="password" required pattern="\w+">
	            </div>
	        </div>
	        <div class="control-group">						            
	            <div class="controls">
	                <input id="pass-nuevo-form" name="new_password" class="feedback-input"
	                 title="La contraseña debe incluir al menos 6 caracteres, además e minusculas y mayusculas"
	                 placeholder="Clave Nueva" type="password"
	                 required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" onchange="
	  					this.setCustomValidity(this.validity.patternMismatch ? this.title : '');
	  					if(this.checkValidity()) confirm_password.pattern = this.value;
						">
	            </div>
	        </div>
	        <div class="control-group">						            
	            <div class="controls">
	                <input id="pass-nuevo1-form" name="confirm_password" class="feedback-input" 
	                title="Please enter the same Password as above." placeholder="Confirmar Clave"
	                type="password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" onchange="
	 					this.setCustomValidity(this.validity.patternMismatch ? this.title : '');
					" >
	            </div>
	        </div> 
	      </div>						      
	      <div class="modal-footer">
	        <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
	        <button type="submit" class="btn btn-primary" id="password_modal_save">Guardar </button>						      
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
					url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getUsuarios&usuario=<%=user.getName()%>',
				  	type:'get',
				  	dataType:'json',
				  	async:false       
				}).responseText;
				obtenerUsuario = JSON.parse(obtenerUsuario);
				obtenerUsuario = obtenerUsuario.usuarios;
							
				todojunto.correoUsuario=obtenerUsuario[0].correo;
				 
				$.ajax({
				        url: "http://tablero2015.stp.gov.py/tablero/ajaxUpdate?accion="+accion,
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