 		var rol_jsp=<%=attributes.get("role_id").toString() %>;
 		var rol_movil_jsp=<%=attributes.get("role_id_movil").toString() %>;
 		var rol_tablero_jsp=<%=attributes.get("role_id_tablero").toString() %>;
 		var usr_nivel_id=<%=attributes.get("nivel_id").toString() %>;
 		var usr_entidad_id=<%=attributes.get("entidad_id").toString() %>;
 		var usr_unr_id=<%=attributes.get("unr_id").toString() %>;
 		var usr_name='<%=user.getName()%>';
 		var usr_responsable='<%=attributes.get("usuario_responsable").toString() %>';
 		
	function renderUsuarios(){
			var tablaUsuarios = "";
			var cuerpoTabla = "";
			$("#cuerpoUsuario").html("");
			
			var url="";
			
			if (rol_jsp == 0){
				url = 'http://sprtest.stp.gov.py/ajaxSelects?accion=getUsuarios&mayorIgual='+rol_jsp;				
			} else if(usr_unr_id == 0){
				url = 'http://sprtest.stp.gov.py/ajaxSelects?accion=getUsuarios&mayorIgual='+rol_jsp+'&nivelId='+usr_nivel_id+'&entidadId='+usr_entidad_id;			
			} else {
				url = 'http://sprtest.stp.gov.py/ajaxSelects?accion=getUsuarios&mayorIgual='+rol_jsp+'&nivelId='+usr_nivel_id+'&entidadId='+usr_entidad_id+'&unidadResponsableId='+usr_unr_id;
			}
			
			var usuarios = $.ajax({
				url: url,
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			usuarios = JSON.parse(usuarios);
			usuarios = usuarios.usuarios;
			
			var roles = $.ajax({
				url:'http://sprtest.stp.gov.py/ajaxSelects?accion=getRol',
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			roles = JSON.parse(roles);
			
			var rolId;
			for(var q = 0; q < usuarios.length; q++){
				
				if (usr_name != usuarios[q].correo){//hace que el usuario logeado no aparezca en la lista.
													
					rolId = "";
					for(var r = 0; r < roles.length; r++){
						if(usuarios[q].rol_id == roles[r].id){
							rolId = roles[r].nombre;
						}
					}
					if(usuarios[q].borrado == true)
					{
						<%if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") ){%>
							cuerpoTabla += '<tr><td><del>'+usuarios[q].entidad+'</del></td>';
							if(usuarios[q].url){
								cuerpoTabla += '<td><del><a href="http://spr.stp.gov.py/tablero/DownloadServlet?urlDocumento='+usuarios[q].url+'" Download="Nota_usuario_'+usuarios[q].nombre+'" >'+usuarios[q].nombre+'</a></del></td><td><del>'+usuarios[q].correo+'</del></td><td><del>'+rolId+'</del></td>';
							}else{
								cuerpoTabla += '<td><del>'+usuarios[q].nombre+'</del></td><td><del>'+usuarios[q].correo+'</del></td><td><del>'+rolId+'</del></td>';
							}
							// Despliega el botÃ³n de restaurar si cumple las condiciones.
							if (rol_jsp < usuarios[q].rol_id || rol_jsp == 0 || usuarios[q].unr_id == 0){
								cuerpoTabla += '<td></td></tr>';
							} else {						
								cuerpoTabla += '<td></td></tr>';
							}
						<%}%>
					}else{
						<%if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("2")){%>
							cuerpoTabla += '<tr><td>'+usuarios[q].entidad+'</td>';						
								if (usuarios[q].url) {
									cuerpoTabla += '<td><a href="http://spr.stp.gov.py/tablero/DownloadServlet?urlDocumento='+usuarios[q].url+'" Download="Nota_usuario_'+usuarios[q].nombre+'" >'+usuarios[q].nombre+'</a></td><td>'+usuarios[q].correo+'</td><td>'+rolId+'</td>';
								} else {
									cuerpoTabla += '<td>'+ usuarios[q].nombre+'</td><td>'+usuarios[q].correo+'</td><td>'+rolId+'</td>';	
								}
								// Despliega el botÃ³n de editar y borrar si cumple las condiciones.
								if (rol_jsp < usuarios[q].rol_id || rol_jsp == 0 || usuarios[q].unr_id == 0 || usr_name == usuarios[q].correo){
									cuerpoTabla += '<td class="text-center"><button type="button" class="btn btn-default btn-sm consultaEditarUsuarioLineas" data-toggle="tooltip" data-placement="top" title="Editar Usuario" parametros="'+usuarios[q].id+'" ><span class="glyphicon glyphicon-pencil"></span></button></td></tr>';								
								} else {						
									cuerpoTabla += '<td></td></tr>';
								}
						<%} if (attributes.get("role_id").toString().equals("3")){%>
							cuerpoTabla += '<tr><td>'+usuarios[q].entidad+'</td>';
							if (usuarios[q].url) {
								cuerpoTabla += '<td><a href="http://spr.stp.gov.py/tablero/DownloadServlet?urlDocumento='+usuarios[q].url+'" Download="Nota_usuario_'+usuarios[q].nombre+'" >'+usuarios[q].nombre+'</a></td><td>'+usuarios[q].correo+'</td><td>'+rolId+'</td><td class="text-center"></td></tr>';
							}else{
								cuerpoTabla += '<td>'+usuarios[q].nombre+'</td><td>'+usuarios[q].correo+'</td><td>'+rolId+'</td><td class="text-center"></td></tr>';
							}
						<%}%>
					}
				}
			}
			
			
			var tablaUsuarios ='<div class="table-responsive">'+
			'	              	<table class="table table-hover table-bordered" id="dataTablesUsuarios">'+
			'	                	<thead>'+
			'	                		<tr class="active"><th class="text-center" colspan="5">Agregar Nuevo Usuario</th></tr>'+
			'	                		<tr class="active"><th class="text-center">Entidad</th><th class="text-center">Nombre</th><th class="text-center">Correo</th><th class="text-center">Rol</th><th class="text-center">Administrar</th></tr>'+
			'	                	</thead>'+
			'	                	<tbody id="tablaUsuariosPrecargados">'+
			'	                	</tbody>'+
			'	                </table>'+
			'	              </div>';
			
			$('#cuerpoUsuario').append(tablaUsuarios);
			$('#tablaUsuariosPrecargados').append(cuerpoTabla);
			$("#dataTablesUsuarios").DataTable();

		}
		
		renderUsuarios();
		
		
	function getEtiquetaSeleccionadas(){						
		var etiquetaSelected=[];
		$(".cmbEtiqueta:checked").each(function(){
			var idEtiqueta=$(this).attr('id').split("-");
		    if (idEtiqueta[1]!='a'){
		    	etiquetaSelected.push(idEtiqueta[1]);	
		    }
		     
		})
		return etiquetaSelected;
	}
	
	$("body").on("click", ".consultaEditarUsuarioLineas",function(event){
		
		if ( $("#modalUsuario").length )
		{
			$("#modalUsuario").remove();
		}
		if ( $("#modalBorrarUsuario").length )
		{
			$("#modalBorrarUsuario").remove();
		}
		if ( $("#modalEditarUsuario").length )
		{
			$("#modalEditarUsuario").remove();
		}
		if ( $("#modalUsuarioLinea").length )
		{
			$("#modalUsuarioLinea").remove();
		}
		if ( $("#modalEditarUsuarioLineas").length )
		{
			$("#modalEditarUsuarioLineas").remove();
		}	
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-"); 
	    var usuarioId = idParsed[0];		
			
		var usuarioSelec = $.ajax({
			url:'http://sprtest.stp.gov.py/ajaxSelects?accion=getUsuarios&usuarioId='+usuarioId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		usuarioSelec = JSON.parse(usuarioSelec);
		usuarioSelec = usuarioSelec.usuarios;
		
		var lineasAccion = $.ajax({
			url:'http://sprtest.stp.gov.py/tablero/ajaxSelects2?action=getLineaAccion',
			type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		lineasAccion = JSON.parse(lineasAccion);
		
		var usuarioLineaAccion = $.ajax({
			url:'http://sprtest.stp.gov.py/tablero/ajaxSelects2?action=getUsuarioLineaAccion&usuario='+usuarioSelec[0].correo,
			type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		usuarioLineaAccion = JSON.parse(usuarioLineaAccion);
	    
	    
		var roles = $.ajax({
			url:'http://sprtest.stp.gov.py/ajaxSelects?accion=getRol',
			type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		roles = JSON.parse(roles);
		
		var usuarioLineas = '';

		var lineasSeleccionada = [];
		if(usuarioLineaAccion != null){
			for(var i = 0; i < lineasAccion.length; i++){
				for(var l = 0; l < usuarioLineaAccion.length; l++){
					if(usuarioLineaAccion[l].lineaAccionId == lineasAccion[i].id && usuarioLineaAccion[l].borrado != true && lineasAccion[i].borrado != true){
						usuarioLineas += '<tr><td><input type="checkbox" class="cmbEditarUsuarioLinea" id='+usuarioLineaAccion[l].borrado+'-'+usuarioLineaAccion[l].id+'-e-'+usuarioId+' checked="true"><a> '+lineasAccion[i].nombre+'</a></td><td>'+lineasAccion[i].descripcion+'</td></tr> ';
						lineasSeleccionada.push(lineasAccion[i].id);
					}else if(usuarioLineaAccion[l].lineaAccionId == lineasAccion[i].id && usuarioLineaAccion[l].borrado != false && lineasAccion[i].borrado != true){
						usuarioLineas += '<tr><td><input type="checkbox" class="cmbEditarUsuarioLinea" id='+usuarioLineaAccion[l].borrado+'-'+usuarioLineaAccion[l].id+'-e-'+usuarioId+' ><a> '+lineasAccion[i].nombre+'</a></td><td>'+lineasAccion[i].descripcion+'</td></tr> ';
						lineasSeleccionada.push(lineasAccion[i].id);
					}
				}
			}
		}//fin if
			
		for(var h = 0; h < lineasAccion.length; h++){
			if (lineasSeleccionada.indexOf(lineasAccion[h].id)<0 && lineasAccion[h].borrado != true ){
				usuarioLineas += '<tr><td><input type="checkbox" class="cmbEditarUsuarioLinea" id='+lineasAccion[h].id+'-'+usuarioId+'-n><a> '+lineasAccion[h].nombre+'</a></td><td>'+lineasAccion[h].descripcion+'</td></tr> ';
				lineasSeleccionada.push(lineasAccion[h].id);
			}
		}
		

		
		var cuerpoModalUsuario = "";

	    cuerpoModalUsuario =	'<div class="modal fade" id="modalEditarUsuarioLineas" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
		'	<div class="modal-dialog modal-lg">'+
		'		<div class="modal-content" >'+
		'			<div class="modal-header">'+
		'		        <button type="button" id="botonCloseUsuario" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>'+
		'		        <h4 class="modal-title">Editar Usuario Lineas de Acción</h4>'+   
		'			</div>'+
		'		    <div class="modal-body" id="cuerpoModal">'+


		
		'								<div id="mensajeBorradoUsuario"></div>'+
		'								<form role="form" id="formulario">'+
		'									<div class="table-responsive">'+
		'										<table class="table table-hover" id="dataTablesUsuarioLineas">'+
		'						                	<thead>'+
		'												<tr class="active"><th>Catalogo Linea de Acción</th><th>Descripción</th></tr>'+
		'						                	</thead>'+
		'											<tbody>'+
														usuarioLineas
		'											</tbody>'+							           
		'										</table>'+
		'									</div>'+
		'								</form>'+
		


		
		'			</div>'+

		'		</div>'+ 
		'	</div>'+
		'</div>';  

		$("body").append(cuerpoModalUsuario); 
		$("#modalEditarUsuarioLineas").modal('show');
		$("#dataTablesUsuarioLineas").DataTable();
		

	});
	
	$("body").on("click", ".cmbEditarUsuarioLinea",function(event){
		var idEtiqueta=$(this).attr('id').split("-");

		var nombreEtiqueta = "";
		
		if ( $("#modalEditarUsuarioLineas").length )
		{
			$("#modalEditarUsuarioLineas").remove();
		}	
		if ( $("#modalUsuarioLinea").length )
		{
			$("#modalUsuarioLinea").remove();
		}	
				
		if(idEtiqueta[2] == "n" ){
			var lineaAccionId = idEtiqueta[0];
			var usuarioId = idEtiqueta[1];

			var usuarioSelec = $.ajax({
				url:'http://sprtest.stp.gov.py/ajaxSelects?accion=getUsuarios&usuarioId='+usuarioId,
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			usuarioSelec = JSON.parse(usuarioSelec);
			usuarioSelec = usuarioSelec.usuarios;
			
			var lineaAccion = $.ajax({
				url:'http://sprtest.stp.gov.py/tablero/ajaxSelects2?action=getLineaAccion&lineaAccionId'+lineaAccionId,
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			lineaAccion = JSON.parse(lineaAccion);
				    	
			var cuerpoModalUsuarioLinea = "";

		    cuerpoModalUsuarioLinea =	'<div class="modal fade" id="modalUsuarioLinea" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
			'	<div class="modal-dialog modal-lg" style="width:90%">'+
			'		<div class="modal-content" >'+
			'			<div class="modal-header">'+
			'		        <button type="button" class="close consultaEditarUsuarioLineas" data-dismiss="modal" parametros="'+usuarioId+'"><span aria-hidden="true">&times;</span></button>'+
			'		        <h4 class="modal-title">Usuario Linea de Acción</h4>'+   
			'			</div>'+
			'		    <div class="modal-body" id="cuerpoModal">'+

			'		      	<div class="row">'+ 
			'		      		<div class="col-md-12">'+
			'						<div class="box box-warning">'+
			'		                	<div class="box-header with-border">'+
			'		                  		<h3 class="box-title"></h3>'+
			'               			</div>'+//fin box-heder
			'               			<div class="box-body" id="cuerpoModalUsuario">'+
			
			'								<div id="mensajeUsuarioLinea"></div>'+
			
			'							</div>'+
			'						</div>'+
			'					</div>'+
			'				</div>'+

			
			'			</div>'+
			'			<div class="modal-footer"  id="agregarBotonUsuario">'+
			'				<button type="button" class="btn btn-success btn-sm consultaEditarUsuarioLineas" parametros="'+usuarioId+'">Volver</button>'+
			'			</div>'+
			'		</div>'+ 
			'	</div>'+
			'</div>';  

			$("body").append(cuerpoModalUsuarioLinea);
			$("#modalUsuarioLinea").modal('show');
			
			var mensaje ='';
			var objeto = new Object();
				
			objeto.usuarioCorreo = usuarioSelec[0].correo;
			objeto.lineaAccionId = lineaAccionId;
			
   		  	var info2 = JSON.stringify(objeto);
   		    $.ajax({
   		        url: "http://sprtest.stp.gov.py/tablero/ajaxInserts2?accion=insUsuarioLineaAccion",
   		        type: 'POST',
   		        dataType: 'json',
   		        data: info2,
   		        contentType: 'application/json',
   		        mimeType: 'application/json',
   		        success: function (data) {
   		        	if(data.success == true)
   		        	{
                    	mensaje = '<center><h1>El usuario '+usuarioSelec[0].correo+' esta habilitado para visualizar la Linea de Acción '+lineaAccion[0].nombre+' </h1></center>';
                    	$("#mensajeUsuarioLinea").append(mensaje);
                    	
   		        	}else{
						mensaje = '<center><h1><center>Error al intentar insertar este Registro!!</center></h1></center>';
						$("#mensajeUsuarioLinea").append(mensaje);
   		        	}
   		        },
   		        error: function(data,status,er) {
   		        	
   		        	}
   			 });

		}else{
			var estado = idEtiqueta[0];
			var id = idEtiqueta[1];
			var usuarioId = idEtiqueta[3]; 
						
		    var objeto = new Object();
		    objeto.id = id;
		    objeto.borrado= estado;
		    
			var cuerpoModalUsuarioLinea = "";

		    cuerpoModalUsuarioLinea =	'<div class="modal fade" id="modalUsuarioLinea" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
			'	<div class="modal-dialog modal-lg" style="width:90%">'+
			'		<div class="modal-content" >'+
			'			<div class="modal-header">'+
			'		        <button type="button" class="close consultaEditarUsuarioLineas" data-dismiss="modal" parametros="'+usuarioId+'"><span aria-hidden="true">&times;</span></button>'+
			'		        <h4 class="modal-title">Usuario Linea de Acción</h4>'+   
			'			</div>'+
			'		    <div class="modal-body" id="cuerpoModal">'+

			'		      	<div class="row">'+ 
			'		      		<div class="col-md-12">'+
			'						<div class="box box-warning">'+
			'		                	<div class="box-header with-border">'+
			'		                  		<h3 class="box-title"></h3>'+
			'               			</div>'+//fin box-heder
			'               			<div class="box-body" id="cuerpoModalUsuario">'+
			
			'								<div id="mensajeUsuarioLinea"></div>'+
			
			'							</div>'+
			'						</div>'+
			'					</div>'+
			'				</div>'+

			
			'			</div>'+
			'			<div class="modal-footer"  id="agregarBotonUsuario">'+
			'				<button type="button" class="btn btn-success btn-sm consultaEditarUsuarioLineas" parametros="'+usuarioId+'">Volver</button>'+
			'			</div>'+
			'		</div>'+ 
			'	</div>'+
			'</div>';  

			$("body").append(cuerpoModalUsuarioLinea);
			$("#modalUsuarioLinea").modal('show');


		  	var info = JSON.stringify(objeto);
		    $.ajax({
		        url: "http://sprtest.stp.gov.py/tablero/ajaxUpdate2?accion=borradoUsuarioLineaAccion",
		        type: 'POST',
		        dataType: 'json',
		        data: info,
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        success: function (data) {
		        	
		        	if(data.success == true){
                    	mensaje = '<center><h1>Usted modifico el estado de la linea de acción</h1></center>';
                    	$("#mensajeUsuarioLinea").append(mensaje);
		        	}else{
						mensaje = '<center><h1><center>Error al intentar insertar este Registro!!</center></h1></center>';
						$("#mensajeUsuarioLinea").append(mensaje);
		        	}

		        },

		        error: function(data,status,er) {
		        	
		        	}
			 });

		}

	});
	

	    	