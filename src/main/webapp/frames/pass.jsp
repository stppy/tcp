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
	
	<!-- MODAL FORMULARIO DE RECEPCIÓN DE SUGERENCIA -->
	<div id="form_sugerencia" class="modal fade" role="dialog">
		<div class="modal-dialog modal-lg">
		    <!-- Modal content-->
			<div class="modal-content">	
	    		<div class="modal-header">
		        	<h4 class="modal-title" id="tituloFormulario">Formulario de Reporte de Sugerencias e Incidencias del Sistema </h4>
		      	</div>					      
				<div class="modal-body" id="cuerpoFormulario">

				    <form role="form">
		              <div class="box-body">
		              	<div class="form-group">
		                  <label>Descripción</label>
		                  <textarea class="form-control" rows="3" id="descripcion" placeholder="Por favor describa su sugerencia o inconveniente al utilizar el sistema"></textarea>
		                </div>
		                  <input type="hidden" class="form-control" id="usuario" value="<%=user.getName()%>">
		                  <input type="hidden" class="form-control" id="fecha">
		                  <input type="hidden" class="form-control" id="url">	
		              </div>
		              <!-- /.box-body -->
		
		              <div class="box-footer">
		                <button type="submit" class="btn btn-primary crear" >Enviar Sugerencia</button>
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
				        url: "/tablero/ajaxUpdate?accion="+accion,
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
	
	$("body").on("click", ".crear",function(event){
	    var descripcion = $("#descripcion").val();
	    var url = $("#url").val();
	    descripcion += ' ||<%=user.getName()%>||'+url;

	    var arr = [];
		var llave = new Object();
		
		llave.key = "a07888bdc60c529428c80661952ea3d4b40d21b6";
		
		var objeto = new Object();        	
		objeto.project_id =  280;
		objeto.subject = "Tarea nueva";
		objeto.priority_id = 3;
		objeto.description = descripcion;
		objeto.tracker_id = 22;
		objeto.status_id = 1;
		objeto.URL = url;

				        	
		llave.issue = objeto;
		
		var objeto2 = new Object();
		var objeto3 = new Object();

		objeto2.value = url;
		objeto2.id = 113;
		
		objeto3.value = "rodrigo";
		objeto3.id = 114;
		
		arr.push(objeto2);
		arr.push(objeto3);


		llave.custom_fields = arr;
	
	  	var info = JSON.stringify(llave);
	
	    $.ajax({
	        url: "/rmClient/issues.json",
	        type: 'POST',
	        contentType: 'application/json; charset=utf-8',
	      	dataType:'json',
	        async: false, 
	        data: info,
	        success: function (data) {
				$("#cuerpoFormulario").empty();
				$("#tituloFormulario").empty();
				$("#cuerpoFormulario").append('<div class="callout callout-success text-center"><h4>La solicitud ha sido enviada con exito</h4></div>');
	        },
	        error: function () {
	            alert('Failed!');
	        }
	    });
        event.preventDefault();    

	});
	 	        
	$("body").on("click", ".formualarioSugerencia",function(event){
	    
		if ( $("#form_sugerencia").length )
		{
			$("#form_sugerencia").remove();
		}
	    
	    var modalSugerencia = 	'<div id="form_sugerencia" class="modal fade" role="dialog">'+
								'	<div class="modal-dialog modal-lg">'+
								    <!-- Modal content-->
								'	<div class="modal-content">'+	
							    '		<div class="modal-header">'+
								'        	<h4 class="modal-title" id="tituloFormulario">Formulario de Reporte de Sugerencias e Incidencias del Sistema </h4>'+
								'      	</div>'+					      
								'		<div class="modal-body" id="cuerpoFormulario">'+
							    
								'		    <form role="form">'+
								'              <div class="box-body">'+
								'              	<div class="form-group">'+
								'                  <label>Descripción</label>'+
								'                  <textarea class="form-control" rows="3" id="descripcion" placeholder="Por favor describa su sugerencia o inconveniente al utilizar el sistema"></textarea>'+
								'                </div>'+
								'                  <input type="hidden" class="form-control" id="usuario" value="<%=user.getName()%>">'+
								'                  <input type="hidden" class="form-control" id="fecha">'+
								'                  <input type="hidden" class="form-control" id="url">	'+
								'              </div>'+
								              <!-- /.box-body -->
								'              <div class="box-footer">'+
								'                <button type="submit" class="btn btn-primary crear" >Enviar Sugerencia</button>'+
								'              </div>'+
								'            </form>'+
								
								'			</div>'+
								'	    </div>'+
								' </div>'+
								'</div>';

		$("body").append(modalSugerencia);
		$("#form_sugerencia").modal('show');		

		var strDate;
		var d = new Date();
		
		if(d.getDate() < 10 ){
			strDate = d.getFullYear() + "-" + (d.getMonth()+1) + "-" + "0"+d.getDate();
		}else{
			 strDate = d.getFullYear() + "-" + (d.getMonth()+1) + "-" + d.getDate();
		}
		
        var pathname = window.location;

		$("#fecha").val(strDate);
		$("#url").val(pathname);
		$("#tituloFormulario").html('');
		$("#tituloFormulario").append('Formulario de Reporte de Sugerencias e Incidencias del Sistema');

	});
	        
	</script>