<script>
	
	$("body").on("click", ".nuevaInsLineaAccion",function(event){		
		event.stopPropagation();
		event.preventDefault();
		var lineaAccion = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getLineaAccion',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		lineaAccion = JSON.parse(lineaAccion);
		var optionLineaAccion;

		for(i = 0;i<lineaAccion.length; i++){
			optionLineaAccion+='<option value="'+lineaAccion[i].id+'" >'+lineaAccion[i].nombre+'</option>';
		}


		var institucion = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getInstitucion',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		institucion = JSON.parse(institucion);
		var optionInstitucion;

		for(m = 0;m<institucion.length; m++){
			optionInstitucion+='<option value="'+institucion[m].id+'" >'+institucion[m].nombre+'</option>';
		}

		var periodo = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getPeriodo',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		periodo = JSON.parse(periodo);
		var optionPeriodo;

		for(p = 0;p<periodo.length; p++)
		{
			if(periodo[p].id == 2016)
			{
				optionPeriodo+='<option value="'+periodo[p].id+'" selected>'+periodo[p].nombre+'</option>';
			}else{
				optionPeriodo+='<option value="'+periodo[p].id+'" >'+periodo[p].nombre+'</option>';
			}
		}
		if ( $("#insLineaAccion").length )
		{
			$("#insLineaAccion").remove();
		}
		if ( $("#modalAccion").length )
		{
			$("#modalAccion").remove();
		}
		
		var contenido = "";

		contenido =			'<div class="modal fade" id="insLineaAccion" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
							'	<div class="modal-dialog modal-lg">'+
							'		<div class="modal-content" >'+
							'			<div class="modal-header">'+
							'		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
							'		        <h4 class="modal-title">Registrar Linea de Acción por Institución</h4>'+
							'			</div>'+
							'		    <div class="modal-body" >'+
									    
							'				<form role="form" id="formularioInsLineaAccion">'+
							'					<div class="form-group">'+
							'						<label for="nombreLineaAccion">Nombre Linea Acción</label>'+
							'						<input type="hidden" id="idInsLineaAccion" value="">'+					
							'						<select name="lineaAccion" id="nombreLineaAccionInsLineaAccion" class="form-control">'+optionLineaAccion+'</select>'+
							'					</div>'+
							'					<div class="form-group">'+
							'						<label for="nombreInstitucion">Nombre Institución</label>'+
							'						<select name="institucion" id="nombreInstitucionInsLineaAccion" class="form-control">'+optionInstitucion+'</select>'+
							'					</div>'+
							'					<div class="form-group">'+
							'						<label for="periodo">Periodo</label>'+
							'						<select id="periodoInsLineaAccion" class="form-control">'+optionPeriodo+'</select>'+
							'					</div>'+
							'					<div class="form-group">'+
							'						<label for="meta">Meta</label>'+
							'						<input type="number" id="metaInsLineaAccion" class="form-control" name="meta" placeholder="Ingrese Meta">'+
							'					</div>'+
							'					<div class="form-group">'+
							'						<label for="version">Versión</label>'+
							'						<input type="number" id="versionInsLineaAccion" class="form-control" name="version" placeholder="Ingrese Versión">'+
							'					</div>'+				
							'				</form>'+			  
							
							'		    </div>'+
							'		</div>'+ 
							'	</div>'+
							'</div>';
							
			$("#programacion").append(contenido);
			$("#insLineaAccion").find("#formularioInsLineaAccion").append('<div class="form-group" id="guardarInsLineaAccionBoton"><button type="submit" class="btn btn-success" id="guardarInsLineaAccion" data-dismiss="modal">Guardar</button></div>');
			$('#insLineaAccion').modal('show');

	});

	$("body").on("click", "#guardarInsLineaAccion",function(event){		
		//event.stopPropagation();
		//event.preventDefault(); 
		$("#actualizarInsLineaAccionBoton").remove();
		$("#guardarInsLineaAccionBoton").remove();
		$("#insLineaAccion").find("#formularioInsLineaAccion").append('<div class="form-group" id="guardarInsLineaAccionBoton"><button type="submit" class="btn btn-success" id="guardarInsLineaAccion">Guardar</button></div>');
		var accion = "insInsLineaAccion";
		var lineaAccionId = $("#nombreLineaAccionInsLineaAccion option:selected").val();
		var institucionId = $("#nombreInstitucionInsLineaAccion option:selected").val();
		var periodoId = $("#periodoInsLineaAccion option:selected").val();
	    var meta = document.getElementById('metaInsLineaAccion').value; 
	    var version = document.getElementById('versionInsLineaAccion').value; 

	    var datos = new Object();
	    datos.lineaAccionId = lineaAccionId;
	    datos.institucionId = institucionId;
	    datos.periodoId = periodoId;
	    datos.meta = meta;
	    datos.version = version;		

				 
		$.ajax({
		        url: "http://spr.stp.gov.py/tablero/ajaxInserts2?accion="+accion,
		        type: 'POST',
		        dataType: 'json',
		        data: JSON.stringify(datos),
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        
		        success: function (data)
		        {
		        	if (data.success == true)
		        	{						
						var insLineaAccion = $.ajax({
							url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getInsLineaAccion',
						  	type:'get',
						  	dataType:'json',
						  	async:false       
						}).responseText;		
						insLineaAccion=JSON.parse(insLineaAccion);
						
						var lineaAccion = $.ajax({
							url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getLineaAccion',
						  	type:'get',
						  	dataType:'json',
						  	async:false       
						}).responseText;
						lineaAccion = JSON.parse(lineaAccion);
						
						var institucion = $.ajax({
							url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getInstitucion',
						  	type:'get',
						  	dataType:'json',
						  	async:false       
						}).responseText;
						institucion = JSON.parse(institucion);
						
						var periodo = $.ajax({
							url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getPeriodo',
						  	type:'get',
						  	dataType:'json',
						  	async:false       
						}).responseText;
						periodo = JSON.parse(periodo);
						
						var unidadMedida = $.ajax({
							url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getUnidadMedida',
						  	type:'get',
						  	dataType:'json',
						  	async:false       
						}).responseText;
						unidadMedida = JSON.parse(unidadMedida);
							
						$('.box-body').html('');
						var tablaInsLineaAccion="";
						tablaInsLineaAccion += 	'<div class="table-responsive">'+
												'<table class="table table-hover">'+
												  '<tr class="active"><td colspan="6">Linea de Acción por Institución</td></tr>'+
												  '<tr class="active"><td style="min-width:110px">Periodo</td><td>Institución</td><td>Linea de Acción</td><td>Meta</td><td class="text-center">U.Medida</td><td style="min-width:250px" class="text-center">Administrar Linea Acción</td></tr>';
												  
					 	var bandLineaAccion;
					 	var bandInstitucion;
					 	var bandPeriodo;
						for(var w=0; w<insLineaAccion.length;w++)
						{
						 	bandLineaAccion = 0;
						 	bandInstitucion = 0;
						 	bandPeriodo = 0;
						 	
							for(p = 0;p<periodo.length; p++)
							{
								if(insLineaAccion[w].periodoId == periodo[p].id)
								{
									if(insLineaAccion[w].borrado == true){
										tablaInsLineaAccion+='<td><del>'+periodo[p].nombre+'</del></td>';
									}else{
										tablaInsLineaAccion+='<td>'+periodo[p].nombre+'</td>';	
									}
									bandPeriodo = 1;
								}
							}
							
							if(bandPeriodo == 0)
							{
								tablaInsLineaAccion+='<td>'+insLineaAccion[w].periodoId+'</td>';
							}
						
							for(m = 0;m<institucion.length; m++){
								if(insLineaAccion[w].institucionId == institucion[m].id)
								{
									if(insLineaAccion[w].borrado == true){
										tablaInsLineaAccion+='<td><del>'+institucion[m].sigla+'</del></td>';
									}else{
										tablaInsLineaAccion+='<td>'+institucion[m].sigla+'</td>';	
									}
									bandInstitucion = 1;
								}
							}
							
							if(bandInstitucion == 0)
							{
								tablaInsLineaAccion+='<td>'+insLineaAccion[w].institucionId+'</td>';
							}
							
							for(i = 0;i<lineaAccion.length; i++){				
								if(insLineaAccion[w].lineaAccionId == lineaAccion[i].id)
								{
									if(insLineaAccion[w].borrado == true){
										tablaInsLineaAccion+='<td><del>'+lineaAccion[i].nombre+'</del></td>';
									}else{
										tablaInsLineaAccion+='<td>'+lineaAccion[i].nombre+'</td>';	
									}
									bandLineaAccion = 1;
								}
							}
										
							if(bandLineaAccion == 0)
							{
								tablaInsLineaAccion+='<td>'+insLineaAccion[w].lineaAccionId+'</td>';
							}
													
							var codigoUnidadMedida;
							var nombreUnidadMedida;
							for(h = 0;h<lineaAccion.length; h++){				
								if(insLineaAccion[w].lineaAccionId == lineaAccion[h].id)
								{
									codigoUnidadMedida=lineaAccion[h].unidadMedidaId;
									
									for(var k = 0; k < unidadMedida.length; k++)
									{
										if(codigoUnidadMedida == unidadMedida[k].id)
										{
											nombreUnidadMedida = unidadMedida[k].descripcion;
										}
									}
								}
							}
							
							if(insLineaAccion[w].borrado == true){
								tablaInsLineaAccion+='<td><del>'+insLineaAccion[w].meta+'</del></td><td class="text-center"><del>'+nombreUnidadMedida+'</del></td><td class="text-center"><span class="glyphicon glyphicon-pencil registrosInsLineaAccion" codigoRegistroInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'-'+insLineaAccion[w].meta+'-'+insLineaAccion[w].version+'></span></td><td><span class="glyphicon glyphicon-trash" parametrosBorradoInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].borrado+' id="iconoBorradoInsLineaAccion"></span></td><td><span class="glyphicon glyphicon-list-alt" parametros="'+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'"></span></td></tr>';
							}else{
								tablaInsLineaAccion+='<td>'+insLineaAccion[w].meta+'</td><td class="text-center">'+nombreUnidadMedida+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="Editar Acción"><span class="glyphicon glyphicon-pencil registrosInsLineaAccion" codigoRegistroInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'-'+insLineaAccion[w].meta+'-'+insLineaAccion[w].version+'></span></button><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="Borrar Acción"><span class="glyphicon glyphicon-trash" parametrosBorradoInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].borrado+' id="iconoBorradoInsLineaAccion"></span></button><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="Agregar Acción"><span class="glyphicon glyphicon-list-alt agregarAccion" parametros="'+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'"></span></button></td></tr>';	
							}
							
						}
						
						tablaInsLineaAccion +='</table></div>';				
						
						$('.box-body').html(tablaInsLineaAccion);
												
						
		        	}else{
		        		if (data.success == false){
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
	
	$("body").on("click", ".registrosInsLineaAccion",function(event){
		var codigoRegistro = $(this).attr("codigoRegistroInsLineaAccion");
	    var idParsed = codigoRegistro.split("-"); 
	    var id = idParsed[0];
		var lineaAccionId = idParsed[1];
		var institucionId = idParsed[2];
		var periodoId = idParsed[3];
		var meta = idParsed[4];
		var version = idParsed[5];
		
		if ( $("#insLineaAccion").length )
		{
			$("#insLineaAccion").remove();
		}
		if ( $("#modalAccion").length )
		{
			$("#modalAccion").remove();
		}		
		
		var lineaAccion = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getLineaAccion',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		lineaAccion = JSON.parse(lineaAccion);
		var optionLineaAccion;

		for(i = 0;i<lineaAccion.length; i++){
			optionLineaAccion+='<option value="'+lineaAccion[i].id+'" >'+lineaAccion[i].nombre+'</option>';
		}


		var institucion = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getInstitucion',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		institucion = JSON.parse(institucion);
		var optionInstitucion;

		for(m = 0;m<institucion.length; m++){
			optionInstitucion+='<option value="'+institucion[m].id+'" >'+institucion[m].nombre+'</option>';
		}

		var periodo = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getPeriodo',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		periodo = JSON.parse(periodo);
		var optionPeriodo;

		for(p = 0;p<periodo.length; p++)
		{
			if(periodo[p].id == 2016)
			{
				optionPeriodo+='<option value="'+periodo[p].id+'" selected>'+periodo[p].nombre+'</option>';
			}else{
				optionPeriodo+='<option value="'+periodo[p].id+'" >'+periodo[p].nombre+'</option>';
			}
		}
		
		var contenido = "";

		contenido =			'<div class="modal fade" id="insLineaAccion" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
							'	<div class="modal-dialog modal-lg">'+
							'		<div class="modal-content" >'+
							'			<div class="modal-header">'+
							'		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
							'		        <h4 class="modal-title">Registrar Linea de Acción por Institución</h4>'+
							'			</div>'+
							'		    <div class="modal-body" id="insLineaAccion" >'+
									    
							'				<form role="form" id="formularioInsLineaAccion">'+
							'					<div class="form-group">'+
							'						<label for="nombreLineaAccion">Nombre Linea Acción</label>'+
							'						<input type="hidden" id="idInsLineaAccion" value="">'+					
							'						<select name="lineaAccion" id="nombreLineaAccionInsLineaAccion" class="form-control">'+optionLineaAccion+'</select>'+
							'					</div>'+
							'					<div class="form-group">'+
							'						<label for="nombreInstitucion">Nombre Institución</label>'+
							'						<select name="institucion" id="nombreInstitucionInsLineaAccion" class="form-control">'+optionInstitucion+'</select>'+
							'					</div>'+
							'					<div class="form-group">'+
							'						<label for="periodo">Periodo</label>'+
							'						<select id="periodoInsLineaAccion" class="form-control">'+optionPeriodo+'</select>'+
							'					</div>'+
							'					<div class="form-group">'+
							'						<label for="meta">Meta</label>'+
							'						<input type="number" id="metaInsLineaAccion" class="form-control" name="meta" placeholder="Ingrese Meta">'+
							'					</div>'+
							'					<div class="form-group">'+
							'						<label for="version">Versión</label>'+
							'						<input type="number" id="versionInsLineaAccion" class="form-control" name="version" placeholder="Ingrese Versión">'+
							'					</div>'+				
							'				</form>'+			  
							
							'		    </div>'+
							'		</div>'+ 
							'	</div>'+
							'</div>';
							
		$("#programacion").append(contenido);
		$("#actualizarInsLineaAccionBoton").remove();
		$("#guardarInsLineaAccionBoton").remove();
		$('#insLineaAccion').modal('show');
		$("#insLineaAccion").find("#formularioInsLineaAccion").append('<div class="form-group" id="actualizarInsLineaAccionBoton"><button type="submit" class="btn btn-success" id="actualizarInsLineaAccion">Actualizar</button></div>');
		$("#idInsLineaAccion").val(id);
		
		var lineaAccion = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getLineaAccion',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		lineaAccion = JSON.parse(lineaAccion);

		for(i = 0;i<lineaAccion.length; i++)
		{
			if(lineaAccion[i].id == lineaAccionId)
			{
				$('#nombreLineaAccionInsLineaAccion > option[value="'+lineaAccion[i].id+'"]').attr('selected', 'selected');
			}
		}
		
		var institucion = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getInstitucion',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		institucion = JSON.parse(institucion);

		for(m = 0;m<institucion.length; m++){
			if(institucion[m].id == institucionId)
			{
				$('#nombreInstitucionInsLineaAccion > option[value="'+institucion[m].id+'"]').attr('selected', 'selected');
			}
		}	

		var periodo = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getPeriodo',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		periodo = JSON.parse(periodo);
		var optionPeriodo;

		for(p = 0;p<periodo.length; p++)
		{
			if(periodo[p].id == periodoId)
			{
				$('#periodoInsLineaAccion > option[value="'+periodo[p].id+'"]').attr('selected', 'selected');
			}
		}
		
		$("#metaInsLineaAccion").val(meta);
		$("#versionInsLineaAccion").val(version);
		
	});
	
	
	$("body").on("click", "#actualizarInsLineaAccion",function(event){		
		var accion = "actInsLineaAccion";
		var id = $("#idInsLineaAccion").val();
		var lineaAccionId= $("#nombreLineaAccionInsLineaAccion").val();
		var institucionId= $("#nombreInstitucionInsLineaAccion").val();
		var periodoId= $("#periodoInsLineaAccion").val();
		var meta= $("#metaInsLineaAccion").val();	
		var version= $("#versionInsLineaAccion").val();
		
		var objeto = new Object();
		objeto.id=id;				
		objeto.lineaAccionId=lineaAccionId;
		objeto.institucionId=institucionId;
		objeto.periodoId=periodoId;
		objeto.meta=meta;
		objeto.version = version;
		

		$.ajax({
		        url: "http://spr.stp.gov.py/tablero/ajaxUpdate2?accion="+accion,
		        type: 'POST',
		        dataType: 'json',
		        data: JSON.stringify(objeto),
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        
		        success: function (data)
		        {
		        	if (data.success == true)
		        	{
		        		alert("Actualizado");
		        		var insLineaAccion = $.ajax({
		        			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getInsLineaAccion',
		        		  	type:'get',
		        		  	dataType:'json',
		        		  	async:false       
		        		}).responseText;		
		        		insLineaAccion=JSON.parse(insLineaAccion);
		        		
		        		var lineaAccion = $.ajax({
		        			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getLineaAccion',
		        		  	type:'get',
		        		  	dataType:'json',
		        		  	async:false       
		        		}).responseText;
		        		lineaAccion = JSON.parse(lineaAccion);
		        		
		        		var institucion = $.ajax({
		        			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getInstitucion',
		        		  	type:'get',
		        		  	dataType:'json',
		        		  	async:false       
		        		}).responseText;
		        		institucion = JSON.parse(institucion);
		        		
		        		var periodo = $.ajax({
		        			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getPeriodo',
		        		  	type:'get',
		        		  	dataType:'json',
		        		  	async:false       
		        		}).responseText;
		        		periodo = JSON.parse(periodo);
		        			
		        		$('.box-body').html('');
		        		var tablaInsLineaAccion="";
		        		tablaInsLineaAccion = 	'<div class="table-responsive">'+
		        								'<table class="table table-hover">'+
		        								  '<tr class="active"><td colspan="7">Tabla InsLineaAccion</td><td><a href="#" data-toggle="modal" data-target="#insLineaAccion"><span class="glyphicon glyphicon-plus nuevaInsLineaAccion"></span></a></td></tr>'+
		        								  '<tr class="active"><td>Id</td><td>lineaAccionId</td><td>institucionId</td><td>periodoId</td><td>meta</td><td>borrado</td><td>Editar</td><td>Borrar</td></tr>';  
		        	 	var bandLineaAccion;
		        	 	var bandInstitucion;
		        	 	var bandPeriodo;
		        		for(var w=0; w<insLineaAccion.length;w++)
		        		{
		        		 	bandLineaAccion = 0;
		        		 	bandInstitucion = 0;
		        		 	bandPeriodo = 0;
		        			
		        			if(insLineaAccion[w].borrado == true){
		        				tablaInsLineaAccion+='<tr><td><del>'+insLineaAccion[w].id+'</del></td>';
		        			}else{
		        				tablaInsLineaAccion+='<tr><td>'+insLineaAccion[w].id+'</td>';	
		        			}
		        		
		        			
		        			for(i = 0;i<lineaAccion.length; i++){				
		        				if(insLineaAccion[w].lineaAccionId == lineaAccion[i].id)
		        				{
		        					if(insLineaAccion[w].borrado == true){
		        						tablaInsLineaAccion+='<td><del>'+lineaAccion[i].nombre+'</del></td>';
		        					}else{
		        						tablaInsLineaAccion+='<td>'+lineaAccion[i].nombre+'</td>';	
		        					}
		        					bandLineaAccion = 1;
		        				}
		        			}
		        			
		        			if(bandLineaAccion == 0)
		        			{
		        				tablaInsLineaAccion+='<td>'+insLineaAccion[w].lineaAccionId+'</td>';
		        			}
		        						
		        			for(m = 0;m<institucion.length; m++){
		        				if(insLineaAccion[w].institucionId == institucion[m].id)
		        				{
		        					if(insLineaAccion[w].borrado == true){
		        						tablaInsLineaAccion+='<td><del>'+institucion[m].sigla+'</del></td>';
		        					}else{
		        						tablaInsLineaAccion+='<td>'+institucion[m].sigla+'</td>';	
		        					}
		        					bandInstitucion = 1;
		        				}
		        			}
		        			
		        			if(bandInstitucion == 0)
		        			{
		        				tablaInsLineaAccion+='<td>'+insLineaAccion[w].institucionId+'</td>';
		        			}
		        						
		        			for(p = 0;p<periodo.length; p++)
		        			{
		        				if(insLineaAccion[w].periodoId == periodo[p].id)
		        				{
		        					if(insLineaAccion[w].borrado == true){
		        						tablaInsLineaAccion+='<td><del>'+periodo[p].nombre+'</del></td>';
		        					}else{
		        						tablaInsLineaAccion+='<td>'+periodo[p].nombre+'</td>';	
		        					}
		        					bandPeriodo = 1;
		        				}
		        			}
		        			
		        			if(bandPeriodo == 0)
		        			{
		        				tablaInsLineaAccion+='<td>'+insLineaAccion[w].periodoId+'</td>';
		        			}
		        			
		        			if(insLineaAccion[w].borrado == true){
		        				tablaInsLineaAccion+='<td><del>'+insLineaAccion[w].meta+'</del></td><td><del>'+insLineaAccion[w].borrado+'</del></td><td><span class="glyphicon glyphicon-pencil registrosInsLineaAccion" codigoRegistroInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'-'+insLineaAccion[w].meta+'-'+insLineaAccion[w].version+'></span></td><td><span class="glyphicon glyphicon-trash" parametrosBorradoInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].borrado+' id="iconoBorradoInsLineaAccion"></span></td></tr>';
		        			}else{
		        				tablaInsLineaAccion+='<td>'+insLineaAccion[w].meta+'</td><td>'+insLineaAccion[w].borrado+'</td><td><span class="glyphicon glyphicon-pencil registrosInsLineaAccion" codigoRegistroInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'-'+insLineaAccion[w].meta+'-'+insLineaAccion[w].version+'></span></td><td><span class="glyphicon glyphicon-trash" parametrosBorradoInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].borrado+' id="iconoBorradoInsLineaAccion"></span></td></tr>';	
		        			}
		        			
		        		}

		        		tablaInsLineaAccion +='</table></div>';				
		        		
		        		$('.box-body').html(tablaInsLineaAccion);
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
	
	$("body").on("click", "#iconoBorradoInsLineaAccion",function(event){
				var objeto = new Object();
				var accion = "borradoInsLineaAccion";
				var parametrosBorradoInsLineaAccion = $(this).attr("parametrosBorradoInsLineaAccion");
			    var idParsed = parametrosBorradoInsLineaAccion.split("-");                                                            
				var id = idParsed[0];
				var borrado = idParsed[1];
				
				objeto.id = id;
				objeto.borrado=borrado;
				
				$.ajax({
					url: "http://spr.stp.gov.py/tablero/ajaxUpdate2?accion="+accion,
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
							window.location.href = "http://spr.stp.gov.py/tablero/contenedorInsLineaAccion.jsp";

				       	}else
				       	{
				       		if (data.success == false)
				       		{
				       			$("#tituloModalUsuario").html('');
					        	$("#tituloModalUsuario").append('<p class="text-danger">Error no se ha guardado</p>');
				       		}
							window.location.href = "http://spr.stp.gov.py/tablero/contenedorInsLineaAccion.jsp";

				       	}
					},
					error: function(data,status,er)
					{
						$("#tituloModalUsuario").html('');
						$("#tituloModalUsuario").append('<p class="text-danger">Error de conexion intente de nuevo</p>');
					}
				});
	});	
	
	$("body").on("click", ".agregarAccion",function(event){
		var codigoRegistro = $(this).attr("parametros");
	    var idParsed = codigoRegistro.split("-"); 
	    var insLineaAccionId = idParsed[0];
	    var lineaAccionId = idParsed[1];
	    var institucionId = idParsed[2];
	    var periodoId = idParsed[3];
		
		if ( $("#insLineaAccion").length )
		{
			$("#insLineaAccion").remove();
		}
		if ( $("#modalAccion").length )
		{
			$("#modalAccion").remove();
		}		
		if ( $("#modalVincularProductos").length )
		{
			$("#modalVincularProductos").remove();
		}	
		
		var lineaAccion = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getLineaAccion',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		lineaAccion = JSON.parse(lineaAccion);

		for(i = 0;i<lineaAccion.length; i++)
		{
			if(lineaAccion[i].id == lineaAccionId)
			{
				var nombreLineaAccion = lineaAccion[i].nombre;
			}
		}
		
		var catalogoAccion = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAccionCatalogo',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		catalogoAccion = JSON.parse(catalogoAccion);
		var optionCatalogoAccion = "";

		for(l = 0; l < catalogoAccion.length; l++)
		{
			optionCatalogoAccion+='<option value="'+catalogoAccion[l].id+'" parametro="'+catalogoAccion[l].id+'">'+catalogoAccion[l].nombre+'</option>';
		}
		
		var institucion = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getInstitucion',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		institucion = JSON.parse(institucion);

		for(m = 0;m<institucion.length; m++)
		{
			if(institucion[m].id == institucionId)
			{
				var nombreInstitucion = institucion[m].sigla;
			}
		}
		
		var periodo = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getPeriodo',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		periodo = JSON.parse(periodo);

		for(p = 0;p<periodo.length; p++)
		{
			if(periodo[p].id == periodoId)
			{
				var nombrePeriodo = periodo[p].nombre;
			}
		}
		
		var unidadMedida = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getUnidadMedida',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		unidadMedida = JSON.parse(unidadMedida);
		var optionUnidadMedida;
		for(var u = 0; u < unidadMedida.length; u++)
		{
			optionUnidadMedida+='<option value="'+unidadMedida[u].id+'" parametro="'+unidadMedida[u].id+'">'+unidadMedida[u].descripcion+'</option>';
		}
		
		var departamentos = $.ajax({
	    	url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getDepartamento',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		departamentos = JSON.parse(departamentos);
		
		var optionDepartamentos = "";
		for(i = 0;i<18; i++){
			optionDepartamentos+='<option value="'+departamentos[i].idDepartamento+'" parametro="'+departamentos[i].idDepartamento+'">'+departamentos[i].nombreDepartamento+'</option>';
		}
		optionDepartamentos+='<option value="99" parametro="99">ALC.NACIONAL</option>';
		
		var distritos = $.ajax({
	    	url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getDistrito',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		distritos = JSON.parse(distritos);
		
		var accion = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAccion&lineaAccionId='+insLineaAccionId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		accion = JSON.parse(accion);
		
		var nombreDepartamento;
		var nombreDistrito;
		var cuerpoAccion = "";

		for(var a = 0; a < accion.length; a++)
		{
			var catalogoAccion = $.ajax({
				url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAccionCatalogo&catalogoAccionId='+accion[a].accionCatalogoId,
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			catalogoAccion = JSON.parse(catalogoAccion);
			
			cuerpoAccion +="<tr><td class='text-center'>"+catalogoAccion[0].nombre+"</td>";
			
			for(var d = 0; d < 18; d++)
			{
				if(accion[a].departamentoId == departamentos[d].idDepartamento){
					nombreDepartamento = departamentos[d].nombreDepartamento;
					cuerpoAccion +="<td class='text-center'>"+nombreDepartamento+"</td>";
				}
			}
			

			for(var e = 0; e < distritos.length; e++)
			{
				if(accion[a].distritoId == distritos[e].id && accion[a].departamentoId == distritos[e].departamentoId){
					nombreDistrito = distritos[e].descripcion;
					cuerpoAccion +="<td class='text-center'>"+nombreDistrito+"</td>";
				}
			}

			cuerpoAccion +="<td class='text-center'>"+accion[a].fechaInicio+"</td><td class='text-center'>"+accion[a].fechaFin+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[a].meta1).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[a].meta2).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[a].meta3).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[a].meta4).toFixed(2))+"</td><td class='text-center'><button type='button' class='btn btn-default btn-sm' data-toggle='tooltip' data-placement='top' title='Vincular Acción a Productos'><span class='glyphicon glyphicon-usd modalVincularProducto' parametros="+accion[a].id+"-"+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"></span></button><button type='button' class='btn btn-default btn-sm'><span class='glyphicon glyphicon-time agregarActividad' parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+"></span></button><button type='button' class='btn btn-default btn-sm' data-toggle='tooltip' data-placement='top' title='Editar Acción'><span class='glyphicon glyphicon-pencil'></span></button><button type='button' class='btn btn-default btn-sm' data-toggle='tooltip' data-placement='top' title='Borrar Acción'><span class='glyphicon glyphicon-trash'></span></button></td></tr>";
		}
		
		
				
		var cuerpoModalAccion = "";

		cuerpoModalAccion =	'<div class="modal fade" id="modalAccion" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
							'	<div class="modal-dialog modal-lg" style="width:90%">'+
							'		<div class="modal-content" >'+
							'			<div class="modal-header">'+
							'		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
							'		        <h4 class="modal-title">Registrar Acción de '+nombreLineaAccion+' ('+nombreInstitucion+') - '+nombrePeriodo+'</h4>'+ 
							'			</div>'+
							'		    <div class="modal-body" id="accionCuerpo" >'+
							
							
							'		      	<div class="row">'+ 
							'		      		<div class="col-md-12">'+
							'						<div class="box box-warning">'+
							'		                	<div class="box-header with-border">'+
							'		                  		<h3 class="box-title">Agregar Acción</h3>'+
							'	                  			<div class="box-tools pull-right">'+
							'				                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>'+
							'		                    		</button>'+
							'		                    		<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i>'+
							'		                    		</button>'+
							'		                  		</div>'+
							'               			</div>'+//fin box-heder
							'               			<div class="box-body">'+
							
							'								<form role="form">'+
							'									<div class="table-responsive">'+
							'										<table class="table table-hover">'+
							'											<tbody>'+
							'												<tr><td><div class="form-group"><label for="nombreAccion">Acción</label><select id="selectorCatalogoAccion" class="form-control">'+optionCatalogoAccion+'</select><input type="hidden" class="form-control" id="insLineaAccionId" value="'+insLineaAccionId+'"></div></td><td><div class="form-group"><label for="umedida">U. medida</label><input type="text" id="unidadMedidaAccion" value="" class="form-control" disabled> </div></td></tr>'+
							'												<tr><td><div class="form-group"><label for="departamento">Departamento</label><select id="selectorDepartamento" name="departamento" class="form-control">'+optionDepartamentos+'</select></div></td><td><div class="form-group"><label for="distrito">Distrito</label><select name="departamento" class="form-control" id="distritosDepartamento"></select></div></td></tr>'+
							'												<tr><td><div class="form-group"><label for="fechaInicioAccion">Fecha Inicio</label><input type="date" id="fechaInicioAccion" class="form-control" /></div></td><td><div class="form-group"><label for="fechaFinAccion">Fecha Fin</label><input type="date" id="fechaFinAccion" class="form-control" /></div></td></tr>'+							
							'											</tbody>'+							           
							'										</table>'+
							'									</div>'+
							'									<div class="row">'+
							'			      					    <div class="form-group col-md-3">'+
							'						  						<label for="totalFinanciero-formulario">Primer Trimestre</label>'+
							'				      						<div class="input-group input-group-sm">'+						      			
							'								    				<input type="text" name="primerTrimestre" id="primerTrimestre-formulario" value="" class="form-control">'+
							'													<input type="hidden" class="form-control" id="versionAccion" value="3">'+//Aqui estan los input hidden que en este formulario son 3
							'													<input type="hidden" class="form-control" id="costoAccion" value="0">'+
							'													<input type="hidden" class="form-control" id="pesoAccion" value="1">'+
							
							
							'				      						</div>'+
							'			  					    	</div>'+
										  					    		
							'				     					<div class="form-group col-md-3">'+
							'							  					<label for="totalFinanciero-formulario">Segundo Trimestre</label>'+
							'					      					<div class="input-group input-group-sm">'+
							'			  					    			<input type="text" name="segundoTrimestre" id="segundoTrimestre-formulario" value="" class="form-control">'+
							'					      					</div>'+
							'								    		</div>'+
															    		
							'				     					<div class="form-group col-md-3">'+
							'							  					<label for="totalFinanciero-formulario">Tercer Trimestre</label>'+
							'					      					<div class="input-group input-group-sm">'+
							'			  					    			<input type="text" name="tercerTrimestre" id="tercerTrimestre-formulario" value="" class="form-control">'+
							'					      					</div>'+
							'								    		</div>'+
														    		
							'			      					    <div class="form-group col-md-3">'+
							'						  					<label for="totalFinanciero-formulario">Cuarto Trimestre</label>'+
							'				      						<div class="input-group input-group-sm">'+
							'								    				<input type="text" name="cuartoTrimestre" id="cuartoTrimestre-formulario" value="" class="form-control">'+
							'				      						</div>'+
							'							    		</div>'+
							'			  						</div>'+							
							'								</form>'+
											
							'               			</div>'+//fin box-body
							'							<div class="modal-footer">'+
							'								<button type="button" class="btn btn-success btn-sm guardarAccion" parametros = '+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'>Guardar Acción</button>'+
							'							</div>'+
							'                		</div>'+	
							'                	</div>'+
							'                </div>'+											
											
							'		      	<div class="row">'+ 
							'		      		<div class="col-md-12">'+
							'						<div class="box box-warning">'+
							'		                	<div class="box-header with-border">'+
							'		                  		<h3 class="box-title">Acciones Precargadas</h3>'+
							'	                  			<div class="box-tools pull-right">'+
							'				                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>'+
							'		                    		</button>'+
							'		                    		<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i>'+
							'		                    		</button>'+
							'		                  		</div>'+
							'               			</div>'+//fin box-heder
							'               			<div class="box-body">'+
							
							'	                			<div class="table-responsive">'+
							'	                				<table class="table table-hover table-bordered">'+
							'	                					<thead>'+
							'	                						<tr class="active"><th rowspan="2" class="text-center">Acción</th><th rowspan="2" class="text-center">Depto</th><th rowspan="2" class="text-center">Distrito</th><th rowspan="2" class="text-center">FechaInicio</th><th rowspan="2" class="text-center">FechaFin</th><th colspan="4" class="text-center">Metas</th><th rowspan="2" class="text-center" style="min-width:160px">Administrar Acción</th></tr>'+
							'	                						<tr class="active"><th class="text-center">1er Trimestre</th><th class="text-center">2do Trimestre</th><th class="text-center">3er Trimestre</th><th class="text-center">4to Trimestre</th></tr>'+
							'	                					</thead>'+
							'	                						<tbody id="tablaAccionesPrecargadas">'+
							'	                						</tbody>'+
							'	                				</table>'+
							'	                			</div>'+		                			
					
							'               			</div>'+//fin box-body
							'                		</div>'+	
							'                	</div>'+
							'                </div>'+
							

							'		    </div>'+
							'			<div class="modal-footer">'+
					      	'			</div>'+														
							'		</div>'+ 
							'	</div>'+
							'</div>';
							
		$("#programacion").append(cuerpoModalAccion);
		$('#tablaAccionesPrecargadas').html("");
		$('#tablaAccionesPrecargadas').append(cuerpoAccion);
		$('#modalAccion').modal('show');
		$("#selectorCatalogoAccion").change();
		$("#selectorDepartamento").change();		

	});
	
	function numeroConComa(x) {
		return x.toString().replace(".", ",").replace(/\B(?=(\d{3})+(?!\d))/g, ".");
	}
	
	
	$("body").on("click", ".agregarAccion2",function(event){
		
		function numeroConComa(x) {
			return x.toString().replace(".", ",").replace(/\B(?=(\d{3})+(?!\d))/g, ".");
		}
		
		var codigoRegistro = $(this).attr("parametrosAccionInsLineaAccion");
	    var idParsed = codigoRegistro.split("-"); 
	    var insLineaAccionId = idParsed[0];
	    var lineaAccionId = idParsed[1];
	    var institucionId = idParsed[2];
	    var periodoId = idParsed[3];
		
/* 		if ( $("#insLineaAccion").length )
		{
			$("#insLineaAccion").remove();
		}*/
		if ( $("#myModal").length )
		{
			$("#myModal").remove();
		}		 
		
		var lineaAccion = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getLineaAccion',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		lineaAccion = JSON.parse(lineaAccion);

		for(i = 0;i<lineaAccion.length; i++)
		{
			if(lineaAccion[i].id == lineaAccionId)
			{
				var nombreLineaAccion = lineaAccion[i].nombre;
			}
		}
		
		var institucion = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getInstitucion',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		institucion = JSON.parse(institucion);

		for(m = 0;m<institucion.length; m++)
		{
			if(institucion[m].id == institucionId)
			{
				var nombreInstitucion = institucion[m].sigla;
			}
		}
		
		var periodo = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getPeriodo',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		periodo = JSON.parse(periodo);

		for(p = 0;p<periodo.length; p++)
		{
			if(periodo[p].id == periodoId)
			{
				var nombrePeriodo = periodo[p].nombre;
			}
		}
		
		var unidadMedida = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getUnidadMedida',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		unidadMedida = JSON.parse(unidadMedida);
		var optionUnidadMedida;
		for(var u = 0; u < unidadMedida.length; u++)
		{
			optionUnidadMedida+='<option value="'+unidadMedida[u].id+'" parametro="'+unidadMedida[u].id+'">'+unidadMedida[u].descripcion+'</option>';
		}
		
		var departamentos = $.ajax({
	    	url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getDepartamento',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		departamentos = JSON.parse(departamentos);
		
		
		var distritos = $.ajax({
	    	url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getDistrito',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		distritos = JSON.parse(distritos);		
		
		var optionDepartamentos = "";
		for(i = 0;i<18; i++){
			optionDepartamentos+='<option value="'+departamentos[i].idDepartamento+'" parametro="'+departamentos[i].idDepartamento+'">'+departamentos[i].nombreDepartamento+'</option>';
		}
		optionDepartamentos+='<option value="99" parametro="99">ALC.NACIONAL</option>';


		
		var accion_catalogo = $.ajax({
	    	url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAccionCatalogo',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		accion_catalogo = JSON.parse(accion_catalogo);
		
		var optionAccionCatalogo = "";
		for(var i = 0;i<accion_catalogo.length; i++){
			optionAccionCatalogo+='<option value="'+accion_catalogo[i].id+'" parametro="'+accion_catalogo[i].id+'">'+accion_catalogo[i].nombre+'</option>';
		}		
		
		var accion = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAccion&lineaAccionId='+insLineaAccionId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		accion = JSON.parse(accion);
		var cuerpoAccion="";
		
		var nombreDepartamento;
		for(var a = 0; a < accion.length; a++)
		{
			for(var d = 0; d < 18; d++)
			{
				if(accion[a].departamentoId == departamentos[d].idDepartamento){
					nombreDepartamento = departamentos[d].nombreDepartamento;
				}
			}
			
		}
		
		var nombreDistrito;
		for(var a = 0; a < accion.length; a++)
		{
			for(var d = 0; d < distritos.length; d++)
			{
				if(accion[a].distritoId == distritos[d].id && accion[a].departamentoId == distritos[d].departamentoId){
					nombreDistrito = distritos[d].descripcion;
				}
			}
			
		}																																																												
		
		for(var z = 0; z < accion.length; z++)
		{
			cuerpoAccion +="<tr><td class='text-center'>"+nombreDepartamento+"</td><td class='text-center'>"+nombreDistrito+"</td><td class='text-center'>"+accion[z].fechaInicio+"</td><td class='text-center'>"+accion[z].fechaFin+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[z].costo).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[z].meta1).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[z].meta2).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[z].meta3).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[z].meta4).toFixed(2))+"</td><td class='text-center'>"+accion[z].peso+"</td><td class='text-center'>"+accion[z].version+"</td><td class='text-center'><span class='glyphicon glyphicon-plus modalVincularProducto' parametros="+accion[z].id+"></span></td></tr>";
		}
		

				
		//var cuerpoModalAccion = "";
		$('#modalAgregarAccion').find("#selectorDepartamento").append(optionDepartamentos);
		$('#modalAgregarAccion').find("#selectorUnidadMedida").append(optionUnidadMedida);
		$('#modalAgregarAccion').find("#selectorAccion").append(optionAccionCatalogo);
		
		$('#modalAgregarAccion').find("#tablaAcciones").html("");
		$('#modalAgregarAccion').find("#tablaAcciones").append(cuerpoAccion);
		$('#modalAgregarAccion').modalSteps();
		$('#modalAgregarAccion').modal('show');
		

	});

	
	$("body").on("change", "#selectorDepartamento",function(event){
		//var departamentoId = $(this).attr("parametro");
		var departamentoId = $("#selectorDepartamento option:selected").val();
    	
		var distritos = $.ajax({
	    	url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getDistrito&departamento='+departamentoId,
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		distritos = JSON.parse(distritos);
		optionDistritos="";
		for(k = 0;k<distritos.length; k++){
			
			optionDistritos+='<option value="'+distritos[k].id+'">'+distritos[k].descripcion+'</option>';
		}
		$("#distritosDepartamento").html("");
		$("#distritosDepartamento").append(optionDistritos);
		
	});
	
	$("body").on("change", "#selectorCatalogoAccion",function(event){
		//var departamentoId = $(this).attr("parametro");
		var catalogoAccionId = $("#selectorCatalogoAccion option:selected").val();
    	
		var catalogoAccion = $.ajax({
	    	url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAccionCatalogo&catalogoAccionId='+catalogoAccionId,
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		catalogoAccion = JSON.parse(catalogoAccion);
		
		var unidadMedida = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getUnidadMedida',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		unidadMedida = JSON.parse(unidadMedida);
		var nombreUnidadMedida
		
		for(k = 0;k<catalogoAccion.length; k++)
		{

			for(var u = 0; u < unidadMedida.length; u++)
			{
				if(catalogoAccion[k].idUnidadMedida == unidadMedida[u].id)
				{
					nombreUnidadMedida = unidadMedida[u].descripcion
				}
			}
			
		}
		
		$("#unidadMedidaAccion").val(nombreUnidadMedida);
		
	});
	
	$("body").on("click", ".guardarComboProducto",function(event){
		event.stopPropagation();
		event.preventDefault();
		
		var parametros = $(this).attr("parametros");
    	var idParsed = parametros.split("-");                                                            
	/*	var institucionId=idParsed[0];
		var lineaAccionId=idParsed[1];
		var idDepartamento= idParsed[2];
		var idDistrito= idParsed[3];
		var accionId = idParsed[4];*/
		
		var accionId = idParsed[0];

		
		
    	var nivel = 12;
      	var entidad = 1;
	    var tipoPrograma = document.getElementById("tipoPrograma-formulario").value;
	    var programa = document.getElementById('programa-formulario').value;
	    var subPrograma = document.getElementById('subPrograma-formulario').value;
	    var proyecto = document.getElementById('proyecto-formulario').value; 
	    var producto = document.getElementById('producto-formulario').value; 
	    var anho = document.getElementById('anhoProducto-formulario').value; 
	    var version = document.getElementById('versionProducto-formulario').value; 
	    var totalFisico = document.getElementById('totalFisico-formulario').value; 
	    var unidadMedida = document.getElementById('unidadMedida-formulario').value; 
	    var clase = document.getElementById('clase-formulario').value; 
	    var totalFinanciero = document.getElementById('totalFinanciero-formulario').value; 
	    var totalAsignacion = document.getElementById('total-formulario').value; 

	    var datos = new Object();
	    
	    datos.nivel = nivel;
	    datos.entidad = entidad;
	    datos.tipoPrograma = tipoPrograma;
	    datos.programa = programa;
	    datos.subPrograma = subPrograma;
	    datos.proyecto = proyecto;
	    datos.producto = producto;
	    datos.accionId = accionId;
	    datos.anho = anho;
	    datos.version = version;
	    datos.uMedida = unidadMedida;
	    datos.cantFisica = totalFisico;
	    datos.clase = clase;
	    datos.cantFinanciera = totalFinanciero;
	    datos.totalAsignacion = totalAsignacion;


	  	var info = JSON.stringify(datos);
	    $.ajax({
	        url: "ajaxInserts?accion=insAccionHasProducto",
	        type: 'POST',
	        dataType: 'json',
	        data: info,
	        contentType: 'application/json',
	        mimeType: 'application/json',
	        success: function (data) {
	        	cargarTablaAccionHasProducto(accionId);
	        	//cargarTablaAccionHasProducto(institucionId, lineaAccionId, idDepartamento, idDistrito, accionId); asi esta el original

	        	},
	        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
	        error: function(data,status,er) {
	        	cargarTablaAccionHasProducto(accionId);
	        	}
		 });
		$('#tipoPrograma-formulario').val('');
		$('#programa-formulario').val('');
		$('#subPrograma-formulario').val('');
		$('#proyecto-formulario').val('');
		$('#producto-formulario').val('');
		$('#totalFisico-formulario').val('');
		$('#unidadMedida-formulario').val('');
		$('#clase-formulario').val('');
		$('#totalFinanciero-formulario').val('');
		$('#anhoProducto-formulario').val('');
		$('#versionProducto-formulario').val('');
		$('#total-formulario').val('');
		
	});
	
	function cargarTablaAccionHasProducto(accionId){
		
		var accionId= accionId;
/*		var institucionId= institucionId;
		var lineaAccionId= lineaAccionId;
		var idDepartamento= idDepartamento;
		var idDistrito= idDistrito;*/
		
		var accionHasProducto = $.ajax({
	    	url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getAccionHasProducto&accion_id='+accionId,
	      	type:'get',
	      	dataType:'json',
	      	crossDomain:true,
	      	async:false       
	    }).responseText;		
		accionHasProducto=JSON.parse(accionHasProducto);
		
		
		$("#TablaAccionHasProductos").html("");
		var fila ="";
		for(var f = 0; f < accionHasProducto.length; f++)
		{
			
			fila += "<tr><td>"+accionHasProducto[f].nivel+"</td><td>"+accionHasProducto[f].entidad+"</td><td>"+accionHasProducto[f].tipoPrograma+"</td><td>"+accionHasProducto[f].programa+"</td><td>"+accionHasProducto[f].subPrograma+"</td><td>"+accionHasProducto[f].proyecto+"</td><td>"+accionHasProducto[f].producto+"</td><td>"+accionHasProducto[f].cantFisica+"</td><td>"+accionHasProducto[f].uMedida+"</td><td>"+accionHasProducto[f].clase+"</td><td>Gs."+accionHasProducto[f].cantFinanciera+"</td><td>Gs."+accionHasProducto[f].totalAsignacion+"</td><td><center><button type='submit' class='btn btn-success verificarDestinatarios' parametros="+accionHasProducto[f].nivel+"-"+accionHasProducto[f].entidad+"-"+accionHasProducto[f].tipoPrograma+"-"+accionHasProducto[f].programa+"-"+accionHasProducto[f].subPrograma+"-"+accionHasProducto[f].proyecto+"-"+accionHasProducto[f].producto+"><span class='glyphicon glyphicon-user'></span></button></center></td></tr>";
		}
		
		$("#TablaAccionHasProductos").append(fila);
		
	}
	
	$("body").on("click", ".modalVincularProducto",function(event){
		
		if ( $("#modalVincularProductos").length )
		{
			$("#modalVincularProductos").remove();
		}	
				
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-");                                                            
		var accionId = idParsed[0];
		//Las siguentes 4 variables se utiliza en esta funcion para redibujar el modal anterior
		var insLineaAccionId = idParsed[1];
		var lineaAccionId = idParsed[2];
		var institucionId = idParsed[3];
		var periodoId = idParsed[4];
				
		var accion = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAccion&accionId='+accionId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		accion = JSON.parse(accion);
		
		var catalogoAccion = $.ajax({
	    	url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAccionCatalogo&catalogoAccionId='+accion[0].accionCatalogoId,
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		catalogoAccion = JSON.parse(catalogoAccion);
		
		var insLineaAccion = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getInsLineaAccion&insLineaAccionId='+insLineaAccionId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;		
		insLineaAccion=JSON.parse(insLineaAccion);
		
		var institucion = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getInstitucion&institucionId='+insLineaAccion[0].institucionId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		institucion = JSON.parse(institucion);
		
		var lineaAccion = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getLineaAccion&lineaAccionId='+lineaAccionId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		lineaAccion = JSON.parse(lineaAccion);


		
		var modalProductos = "";

		modalProductos =	 '<div class="modal fade" role="dialog" id="modalVincularProductos" data-backdrop="static" data-keyboard="false">'+ 
							    '<div class="modal-dialog modal-lg" style="width:90%">'+ 
							    
							      '<div class="modal-content">'+ 
							        '<div class="modal-header">'+ 
							          '<button type="button" class="close agregarAccion" data-dismiss="modal" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'>&times;</button>'+ 
							          '<h4 class="modal-title">Vincular Producto con '+catalogoAccion[0].nombre+' de '+lineaAccion[0].nombre+' ('+institucion[0].sigla+') año '+insLineaAccion[0].periodoId+'</h4>'+ 
							        '</div>'+ 
							        '<div class="modal-body">'+ 				        

						      		'	<div class="table-responsive">'+
						            '    <table class="table table-striped table-bordered  table-hover">'+
						            '    	<tr>'+
						            '    		<th>Nivel</th>'+
						            '    		<th>Entidad</th>'+
						            '    		<th>Tipo</th>'+
						            '    		<th>Programa</th>'+
						            '    		<th>Subprograma</th>'+
						            '   		<th>Proyecto</th>'+
						            '   		<th>Producto</th>'+
						            '    		<th>Total Fisico</th>'+
						            '    		<th>U. Medida</th>'+
						            '    		<th>Clase</th>'+
						            '    		<th>Total Financiero</th>'+
						            '    		<th>Asignación Financiera</th>'+
						            '    		<th>Destinatarios</th>'+
						            '    	</tr>'+
						            '    <tbody class="table-body-producto" id="TablaAccionHasProductos">'+
						            '    </tbody>'+
						            '   </table>'+
						            '    </div>'+
					                
									' 	<br>'+
									'  	<br>'+
					   				'	<div id="tituloFormulario"></div>'+
					      			'		<form class="form-horizontal" role="form" id="formulario" method="post" action="/ajaxUpdate">'+
					      			'			<input type="hidden" name="accion" value="actEntidad">'+
					      			'			<input type="hidden" name="anho" value="" id="anhoProducto-formulario">'+
					      			'			<input type="hidden" name="version" value="" id="versionProducto-formulario">'+
									'			<div class="row">'+
						      		'				<div class="form-group col-md-1">'+
						      		'					<input type="text" name="nivel" id="nivel-formulario" value="12" class="form-control" disabled>'+
						      		'				</div>'+
						      		'				<div class="form-group col-md-1">'+
						  			'					<input type="text" name="entidad" id="entidad-formulario" value="1" class="form-control" disabled>'+
						  			'				</div>'+
						      		'			    <div class="form-group col-md-1">'+
						      		'			    	<input type="text" name="tipoPrograma" id="tipoPrograma-formulario" placeholder="Tipo Programa" list="listaf3c2" class="form-control">'+
						      		'			    </div>'+
						      		'			    <div class="form-group col-md-1">'+
						      		'			    	<input type="text" name="programa" id="programa-formulario" placeholder="Programa" list="listaf4c2" class="form-control">'+
						      		'			    </div>'+
						      		'			    <div class="form-group col-md-1">'+
						      		'			    	<input type="text" name="subPrograma" id="subPrograma-formulario" placeholder="SubPrograma" list="listaf5c2" class="form-control">'+
						      		'			    </div>'+
						      		'			    <div class="form-group col-md-2">'+
						      		'			    	<input type="text" name="proyecto" id="proyecto-formulario" placeholder="Proyecto" list="listaf6c2" class="form-control">'+
						      		'			    </div>'+
						  			'		    	<div class="form-group col-md-2">'+
						  			'		    		<input type="text" name="producto" id="producto-formulario" placeholder="Producto" list="listaf7c2" class="form-control">'+
						      		'			  	</div>'+
						  			'		    	<div class="form-group col-md-3">'+
							      	'					<div class="input-group input-group-md">'+
							      	'						<span class="input-group-addon">Gs</span>'+
				      				'	    				<input type="text" name="total" id="total-formulario" value="" class="form-control">'+
				      				'	                    <div class="input-group-btn">'+
					      			'		                	<button type="submit" class="btn btn-success guardarComboProducto" parametros='+accionId+'><span class="glyphicon glyphicon-plus"></span></button>'+
					      			'		                </div>'+	      					    				
				      				'	    			</div>'+
						  			'		    	</div>'+
						  			'		    </div>'+
					      			'		</form>	'+
					      					
					      			'			<div class="row">'+
						      		'			    <div class="form-group col-md-3">'+
						      		'			  		<label for="totalFisico-formulario">Total Fisico</label>'+
					      			'		    		<input type="text" name="totalFisico" id="totalFisico-formulario" value="" class="form-control" disabled>'+
					      			'		    	</div>'+
						      		'			    <div class="form-group col-md-3">'+
					      			'		  			<label for="unidadMedida-formulario">U. Medida</label>'+
				      				'	    			<input type="text" name="totalFisico" id="unidadMedida-formulario" value="" class="form-control" disabled>'+
				      				'	    		</div>'+
						      		'			    <div class="form-group col-md-3">'+
				      				'	  				<label for="clase-formulario">Clase</label>'+
			      					'    				<input type="text" name="totalFisico" id="clase-formulario" value="" class="form-control" disabled>'+
			      					'    			</div>'+
						      		'			    <div class="form-group col-md-3">'+
			      					'  					<label for="totalFinanciero-formulario">Total Financiero</label>'+
								    '  					<div class="input-group input-group-sm">'+
								    '  						<span class="input-group-addon">Gs</span>'+
					      			'		    			<input type="text" name="totalFinanciero" id="totalFinanciero-formulario" value="" class="form-control" disabled>'+
								    ' 					</div>'+
				      				'	    		</div>'+ 					    				
				      				'	    	</div>'+	
							        
							        '</div>'+ 
							        '<div class="modal-footer">'+ 
							          '<button type="button" class="btn btn-default agregarAccion" data-dismiss="modal" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'>Cerrar</button>'+ 
							        '</div>'+ 
							      '</div>'+ 
							      
							    '</div>'+ 
							  '</div>';

		$("body").append(modalProductos);
		$("#modalVincularProductos").modal('show');
		cargarTablaAccionHasProducto(accionId);
		
		
		function Combo(){

		    this.nivelFocus = function(){
			
		   	  var listaDatalist=document.getElementsByTagName('datalist');
		      var datosNiveles = $.ajax({
		          url:'http://spr.stp.gov.py/ajaxSelects?accion=getNiveles',
		          type:'get',
		          	crossDomain: 'true',
		          	dataType:'jsonp',	
		          async:false       
		        }).responseText;  
		  
		        
		        datosNiveles = JSON.parse(datosNiveles);
				
		        if(listaDatalist.length === 0 )
		        {
			        var datalistNiveles = document.createElement('datalist');
			        datalistNiveles.setAttribute('id','listaf1c2');
			        datalistNiveles.setAttribute('size','5'); 
			        var ubicacionDatalistNiveles = document.getElementById('formulario');
			        ubicacionDatalistNiveles.appendChild(datalistNiveles);
			
			        for(var i = 0; i < datosNiveles.niveles.length ; i++) 
			        {    
			        	var option = document.createElement('option');
			          	option.setAttribute('value',datosNiveles.niveles[i].nivel);
			          	option.setAttribute('label',datosNiveles.niveles[i].nombreNivel);
			          	datalistNiveles.appendChild(option);      
			      	} 
		        }
		    } 

		    this.nivel = function(){
		    	//var rutaNivel = document.getElementById('nivel-formulario').value;
		    	var rutaNivel = 12;
		    	var datosNiveles = $.ajax({
		        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getNiveles',
		          	type:'get',
		          	crossDomain: 'true',
		          	dataType:'jsonp',		          	
		          	async:false       
		        }).responseText;

		        
		        datosNiveles = JSON.parse(datosNiveles);
		      	for(var x = 0; x < datosNiveles.niveles.length; x++)
		      	{
		        	if(datosNiveles.niveles[x].nivel === parseInt(rutaNivel))
		        	{
			        	var mostrarNivel = datosNiveles.niveles[x].nombreNivel;
			          	var nt=document.createTextNode(mostrarNivel+" >");
			          	var nparrafo=document.getElementById('tituloFormulario');
			          	nparrafo.innerHTML="";
			          	nparrafo.appendChild(nt);
			        }
		      	}
		    }  


		    this.entidadFocus = function(){ 
		      	//var linkEntidad = document.getElementById('nivel-formulario').value;
		    	var linkEntidad = 12;
		    	var datosEntidades = $.ajax({
		         	 url:'http://spr.stp.gov.py/ajaxSelects?accion=getEntidades&nivel='+linkEntidad,
		          	type:'get',
		          	crossDomain: 'true',
		          	dataType:'jsonp',
		          	async:false
		    	}).responseText;

		          	option.setAttribute('value',datosEntidades.entidades[i].entidad);
		          	option.setAttribute('label',datosEntidades.entidades[i].nombreEntidad);
		          	datalistEntidades.appendChild(option);      
		      	}   
		     


		    this.entidad = function(){ 
		    	//var linkEntidad = document.getElementById('nivel-formulario').value;
		      	//var rutaEntidad2 = document.getElementById('entidad-formulario').value;
		    	var linkEntidad = 12;
		      	var rutaEntidad2 = 1;
		      	

		      	var datosEntidades = $.ajax({
		        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getEntidades&nivel='+linkEntidad,
		          	type:'get',
		          	dataType:'json',
		          	async:false       
		        }).responseText;

		        datosEntidades = JSON.parse(datosEntidades);
		 
		    	for(var x = 0; x < datosEntidades.entidades.length; x++)
		      	{
		        	if(datosEntidades.entidades[x].entidad === parseInt(rutaEntidad2)) 
		        	{
		        		document.getElementById('entidad-formulario').setAttribute("entidad",rutaEntidad2 );
		        		var mostrarEntidad = datosEntidades.entidades[x].nombreEntidad;
		          		var nt=document.createTextNode(mostrarEntidad);
		          		var nparrafo=document.getElementById('tituloFormulario');
		          		//nparrafo.innerHTML="";
		          		nparrafo.appendChild(nt);
		        	} 
		      	} 
		    }  

		    this.tipoProgramaFocus = function(){

		    	var rutaNivel = 12;
		    	var datosNiveles = [];
		    	
				if ( $("#listaf3c2").length ) {
					$("#listaf3c2").remove();
					$('#tipoPrograma-formulario').val('');
					$("#listaf4c2").remove();
					$('#programa-formulario').val('');
					$("#listaf5c2").remove();
					$('#subPrograma-formulario').val('');
					$("#listaf6c2").remove();
					$('#proyecto-formulario').val('');
					$("#listaf7c2").remove();
					$('#producto-formulario').val('');
					$('#totalFisico-formulario').val('');
					$('#unidadMedida-formulario').val('');
					$('#clase-formulario').val('');
					$('#totalFinanciero-formulario').val('');
				}
				
			    $.ajax({
			        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getNiveles',
			          	type:'get',
			          	crossDomain: 'true',
			          	dataType:'jsonp',
		                jsonp: 'callback',
		                jsonpCallback: 'jsonpCallback',
			          	async:false,
			          	success: function( data, textStatus, jqXHR) {
			          		if(data.success){
			          			jsonpCallback(data)
			          		}
			          	}
			        });
		    			
				    	 function jsonpCallback(data) {
			          		datosNiveles= data;
			          		
					      	for(var y = 0; y < datosNiveles.niveles.length; y++)
					      	{
					        	if(datosNiveles.niveles[y].nivel === parseInt(rutaNivel))
					        	{
						        	var mostrarNivel = datosNiveles.niveles[y].nombreNivel;
						          	var nt=document.createElement('small');
						          	var ntText = document.createTextNode(mostrarNivel);
						          	nt.appendChild(ntText);
						          	var separador=document.createTextNode(" > ");
						          	var nparrafo=document.getElementById('tituloFormulario');
						          	var strong = document.createElement('strong');
						          	strong.appendChild(separador);
						          	nparrafo.innerHTML="";
						          	nparrafo.appendChild(nt);
						          	nparrafo.appendChild(strong);
						          	
						        }
					      	}
					    	
					    	var linkEntidad = 12;
					      	var rutaEntidad2 = 1;
					      	

					      	var datosEntidades =[];
					      		$.ajax({
					        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getEntidades&nivel='+linkEntidad,
					          	type:'get',
					          	crossDomain: 'true',
					          	dataType:'jsonp',
				                jsonp: 'callback',
				                jsonpCallback: 'jsonpCallbackEntidad',
					          	async:false,
					          	success: function( data, textStatus, jqXHR) {
					          		if(data.success){
					          			jsonpCallbackEntidad(data)
					          		}
					          	}
					        });
					      		
					      	function jsonpCallbackEntidad(data) {
					      		datosEntidades= data;
					 
						    	for(var x = 0; x < datosEntidades.entidades.length; x++)
						      	{
						        	if(datosEntidades.entidades[x].entidad === parseInt(rutaEntidad2)) 
						        	{
						        		document.getElementById('entidad-formulario').setAttribute("entidad",rutaEntidad2 );
						        		var mostrarEntidad = datosEntidades.entidades[x].nombreEntidad;
						        		var nt=document.createElement('small');
						          		var ntText=document.createTextNode(mostrarEntidad);
						          		nt.appendChild(ntText);
							          	var separador=document.createTextNode(" > ");
							          	var nparrafo=document.getElementById('tituloFormulario');
							          	var strong = document.createElement('strong');
							          	strong.appendChild(separador);
						          		nparrafo.appendChild(nt);
							          	nparrafo.appendChild(strong);

						        	} 
						      	}
						    	
						      	var datosTipoPrograma = [];
						      		$.ajax({
						        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getTiposPrograma',
						          	type:'get',
						          	crossDomain: 'true',
						          	dataType:'jsonp',
					                jsonp: 'callback',
					                jsonpCallback: 'jsonpCallbackTipoPrograma',
						          	async:false,
						          	success: function( data, textStatus, jqXHR) {
						          		if(data.success){
						          			jsonpCallbackTipoPrograma(data)
						          		}
						          	}    
						        });

							    function jsonpCallbackTipoPrograma(data) {
							    	datosTipoPrograma= data;
							    	
							      	var datalistEntidades = document.createElement('datalist'); 
							        datalistEntidades.setAttribute('id','listaf3c2'); 
							        var ubicacionDatalistEntidades = document.getElementById('formulario');
							        ubicacionDatalistEntidades.appendChild(datalistEntidades);
		
							        for(var i = 0; i < datosTipoPrograma.tiposPrograma.length ; i++) 
							        {       
							        	var option = document.createElement('option');
							          	option.setAttribute('value',datosTipoPrograma.tiposPrograma[i].numeroFila);
							          	option.setAttribute('label',datosTipoPrograma.tiposPrograma[i].nombreTipoPrograma);
							          	datalistEntidades.appendChild(option);      
							      	}   
							        
							    }
			          		
					      	}

				    	 } 	    	   
		    }
		    
		    this.tipoPrograma = function(){
		    	var linkTipoPrograma = document.getElementById('tipoPrograma-formulario').value;

		      	var datosTipoPrograma = [];
		      	
		      	$.ajax({
		        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getTiposPrograma',
		          	type:'get',
		          	crossDomain: 'true',
		          	dataType:'jsonp',
	                jsonp: 'callback',
	                jsonpCallback: 'jsonpCallbackTipoPrograma',
		          	async:false,
		          	success: function( data, textStatus, jqXHR) {
		          		if(data.success){
		          			jsonpCallbackTipoPrograma(data)
		          		}
		          	}        
		        });
		      	
			    function jsonpCallbackTipoPrograma(data) {
			    	datosTipoPrograma= data;

			    	for(var x = 0; x < datosTipoPrograma.tiposPrograma.length; x++)
			      	{
			        	if(datosTipoPrograma.tiposPrograma[x].numeroFila === parseInt(linkTipoPrograma)) 
			        	{
			        		var mostrarTipoPrograma = datosTipoPrograma.tiposPrograma[x].nombreTipoPrograma;
			          		var ntText=document.createTextNode(mostrarTipoPrograma);
			              	var nt=document.createElement('small');
			              	var ntText = document.createTextNode(mostrarTipoPrograma);
			              	nt.appendChild(ntText);
			              	var separador=document.createTextNode(" > ");
			          		var nparrafo=document.getElementById('tituloFormulario');
			              	var strong = document.createElement('strong');
			              	strong.appendChild(separador);
			              	nparrafo.appendChild(nt);
			              	nparrafo.appendChild(strong);
			        	} 
			      	}
			    }
		    }    	

		    this.programasFocus = function(){
		      	//var linkNivel = document.getElementById('nivel-formulario').value;
		      	//var linkEntidad = document.getElementById("entidad-formulario").value;
		    	var linkNivel = 12;
		      	var linkEntidad = 1;
		      	var linkTipoPrograma = parseInt(document.getElementById("tipoPrograma-formulario").value)
		      	;

		    	var datosProgramas = [];
		    	
				if ( $("#listaf4c2").length ) {
					$("#listaf4c2").remove();
					$('#programa-formulario').val('');
					$("#listaf5c2").remove();
					$('#subPrograma-formulario').val('');
					$("#listaf6c2").remove();
					$('#proyecto-formulario').val('');
					$("#listaf7c2").remove();
					$('#producto-formulario').val('');
					$('#totalFisico-formulario').val('');
					$('#unidadMedida-formulario').val('');
					$('#clase-formulario').val('');
					$('#totalFinanciero-formulario').val('');

				}
		    	
		    	$.ajax({
		        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getProgramas&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPrograma,
		          	type:'get',
		          	crossDomain: 'true',
		          	dataType:'jsonp',
	                jsonp: 'callback',
	                jsonpCallback: 'jsonpCallbackPrograma',
		          	async:false,
		          	success: function( data, textStatus, jqXHR) {
		          		if(data.success){
		          			jsonpCallbackPrograma(data)
		          		}
		          	}         
		        });
		        
			    function jsonpCallbackPrograma(data) {
			    	datosProgramas = data;

			    	$("#listaf4c2").remove();
			        var datalistProgramas = document.createElement('datalist');
			        datalistProgramas.setAttribute('id','listaf4c2'); 
			        var ubicacionDatalistProgramas = document.getElementById('formulario');
			        ubicacionDatalistProgramas.appendChild(datalistProgramas);

			        for(var i = 0; i < datosProgramas.programas.length ; i++) 
			        {       
				        var option = document.createElement('option');
			    	    option.setAttribute('value',datosProgramas.programas[i].codigoPrograma);
			    	    option.setAttribute('label',datosProgramas.programas[i].nombrePrograma);
			        	datalistProgramas.appendChild(option);       
			      	} 
			    }
		    }
		    
		    this.programas = function(){
		      	//var linkNivel = document.getElementById('nivel-formulario').value;
		      	//var linkEntidad = document.getElementById("entidad-formulario").value;
		    	var linkNivel = 12;
		      	var linkEntidad = 1;
		      	var linkTipoPrograma = document.getElementById("tipoPrograma-formulario").value;
		      	var numeroProgramaIngresado = document.getElementById("programa-formulario").value;

		    	var datosProgramas =  [];
		    	
		    	$.ajax({
		        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getProgramas&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPrograma,
		          	type:'get',
		          	crossDomain: 'true',
		          	dataType:'jsonp',
	                jsonp: 'callback',
	                jsonpCallback: 'jsonpCallbackPrograma',
		          	async:false,
		          	success: function( data, textStatus, jqXHR) {
		          		if(data.success){
		          			jsonpCallbackPrograma(data)
		          		}
		          	}      
		        });

			    function jsonpCallbackPrograma(data) {
			    	datosProgramas = data;
			    	
			    	for(var x = 0; x < datosProgramas.programas.length; x++)
			    	{
			        	if(datosProgramas.programas[x].codigoPrograma === parseInt(numeroProgramaIngresado))
			        	{
			        		var mostrarNombrePrograma = datosProgramas.programas[x].nombrePrograma;
			        		var nt=document.createElement('small');
					        var ntText=document.createTextNode(mostrarNombrePrograma);
					        nt.appendChild(ntText);
					        var separador=document.createTextNode(" > ");
					        var nparrafo=document.getElementById('tituloFormulario');
				          	var strong = document.createElement('strong');
				          	strong.appendChild(separador);
				          	nparrafo.appendChild(nt);
				          	nparrafo.appendChild(strong);

					    }
			      	}
			    }
		    } 

		    this.subProgramasFocus = function(){
			    //var linkNivel = document.getElementById('nivel-formulario').value;
			    //var linkEntidad = document.getElementById('entidad-formulario').value;
		    	var linkNivel = 12;
		      	var linkEntidad = 1;    	
			    var linkTipoPrograma = document.getElementById("tipoPrograma-formulario").value;
			    var linkPrograma = document.getElementById("programa-formulario").value;

		    	var datosSubProgramas = [];
		    	
				if ( $("#listaf5c2").length ) {
					$("#listaf5c2").remove();
					$('#subPrograma-formulario').val('');
					$("#listaf6c2").remove();
					$('#proyecto-formulario').val('');
					$("#listaf7c2").remove();
					$('#producto-formulario').val('');
					$('#totalFisico-formulario').val('');
					$('#unidadMedida-formulario').val('');
					$('#clase-formulario').val('');
					$('#totalFinanciero-formulario').val('');
				}
		    	
		    	$.ajax({
		        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getSubprogramas&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPrograma+'&programa='+linkPrograma,
		          	type:'get',
		          	crossDomain: 'true',
		          	dataType:'jsonp',
	                jsonp: 'callback',
	                jsonpCallback: 'jsonpCallbackSubPrograma',
		          	async:false,
		          	success: function( data, textStatus, jqXHR) {
		          		if(data.success){
		          			jsonpCallbackSubPrograma(data)
		          		}
		          	}       
		        });

			    function jsonpCallbackSubPrograma(data) {
			    	datosSubProgramas = data;
			    	
			        var datalistSubProgramas = document.createElement('datalist');
			        datalistSubProgramas.setAttribute('id','listaf5c2'); 
			        var ubicacionDatalistProgramas = document.getElementById('formulario');
			        ubicacionDatalistProgramas.appendChild(datalistSubProgramas);

			          for(var i = 0; i < datosSubProgramas.subprogramas.length ; i++) 
			          {       
				          var option = document.createElement('option');
				          option.setAttribute('value', datosSubProgramas.subprogramas[i].id);
				          option.setAttribute('label', datosSubProgramas.subprogramas[i].nombre);
				          datalistSubProgramas.appendChild(option);     
			      	  } 
			    }
		    } 
		    
		    this.subProgramas = function(){
			    //var linkNivel = document.getElementById('nivel-formulario').value;
			    //var linkEntidad = document.getElementById('entidad-formulario').value;
		    	var linkNivel = 12;
		      	var linkEntidad = 1;
			    var linkTipoPrograma = document.getElementById("tipoPrograma-formulario").value;
			    var linkPrograma = document.getElementById("programa-formulario").value;
			    var numeroSubProgramaIngresado = document.getElementById("subPrograma-formulario").value;

		    	var datosSubProgramas = [];
		    	
		    	$.ajax({
		        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getSubprogramas&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPrograma+'&programa='+linkPrograma,
		          	type:'get',
		          	crossDomain: 'true',
		          	dataType:'jsonp',
	                jsonp: 'callback',
	                jsonpCallback: 'jsonpCallbackSubPrograma',
		          	async:false,
		          	success: function( data, textStatus, jqXHR) {
		          		if(data.success){
		          			jsonpCallbackSubPrograma(data)
		          		}
		          	} 
		        });

			    function jsonpCallbackSubPrograma(data) {
			    	datosSubProgramas = data;
			    	
			      	for(var x = 0; x < datosSubProgramas.subprogramas.length; x++)
			      	{
			        	if(datosSubProgramas.subprogramas[x].id === parseInt(numeroSubProgramaIngresado))
			        	{
				        	var mostrarNombrePrograma = datosSubProgramas.subprogramas[x].nombre;
				        	var nt=document.createElement('small');
				          	var ntText=document.createTextNode(mostrarNombrePrograma);
					        nt.appendChild(ntText);
					        var separador=document.createTextNode(" > ");
				          	var nparrafo=document.getElementById('tituloFormulario');
				          	var strong = document.createElement('strong');
				          	strong.appendChild(separador);
				          	nparrafo.appendChild(nt);
				          	nparrafo.appendChild(strong);
				        }
			      	}
			    }
		    } 
		    
		    this.proyectoFocus = function(){
			    //var linkNivel = document.getElementById("nivel-formulario").value;
			    //var linkEntidad = document.getElementById("entidad-formulario").value;
		    	var linkNivel = 12;
		      	var linkEntidad = 1;
			    var linkTipoPrograma = document.getElementById("tipoPrograma-formulario").value;
			    var linkPrograma = document.getElementById('programa-formulario').value;
			    var linkSubPrograma = document.getElementById('subPrograma-formulario').value;

		    	var datosProyectos = [];
		    	
				if ( $("#listaf6c2").length ) {
					$("#listaf6c2").remove();
					$('#proyecto-formulario').val('');
					$("#listaf7c2").remove();
					$('#producto-formulario').val('');
					$('#totalFisico-formulario').val('');
					$('#unidadMedida-formulario').val('');
					$('#clase-formulario').val('');
					$('#totalFinanciero-formulario').val('');
				}
		    	
		    	$.ajax({
		         	 url:'http://spr.stp.gov.py/ajaxSelects?accion=getProyectos&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPrograma+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma,
		          	type:'get',
		          	crossDomain: 'true',
		          	dataType:'jsonp',
	                jsonp: 'callback',
	                jsonpCallback: 'jsonpCallbackProyecto',
		          	async:false,
		          	success: function( data, textStatus, jqXHR) {
		          		if(data.success){
		          			jsonpCallbackProyecto(data)
		          		}
		          	}    
		        });

			    function jsonpCallbackProyecto(data) {
			    	datosProyectos = data;

			        var datalistProyectos = document.createElement('datalist');
			        datalistProyectos.setAttribute('id','listaf6c2'); 
			        var ubicacionDatalistProyectos = document.getElementById('formulario');
			        ubicacionDatalistProyectos.appendChild(datalistProyectos);

			          for(var i = 0; i < datosProyectos.proyectos.length ; i++) 
			          {       
				          var option = document.createElement('option');
				          option.setAttribute('value', datosProyectos.proyectos[i].codigoProyecto);
				          option.setAttribute('label', datosProyectos.proyectos[i].nombreProyecto);
				          datalistProyectos.appendChild(option);      
			      	  } 
			    }
		    }
		    this.proyecto = function(){
			    //var linkNivel = document.getElementById("nivel-formulario").value;
			    //var linkEntidad = document.getElementById("entidad-formulario").value;
		    	var linkNivel = 12;
		      	var linkEntidad = 1;
			    var linkTipoPrograma = document.getElementById("tipoPrograma-formulario").value;
			    var linkPrograma = document.getElementById('programa-formulario').value;
			    var linkSubPrograma = document.getElementById('subPrograma-formulario').value;
			    var numeroProyectoIngresado = document.getElementById("proyecto-formulario").value;

		    	var datosProyectos = [];
		    	$.ajax({
		          url:'http://spr.stp.gov.py/ajaxSelects?accion=getProyectos&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPrograma+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma,
		          type:'get',
		          	crossDomain: 'true',
		          	dataType:'jsonp',
	                jsonp: 'callback',
	                jsonpCallback: 'jsonpCallbackProyecto',
		          	async:false,
		          	success: function( data, textStatus, jqXHR) {
		          		if(data.success){
		          			jsonpCallbackProyecto(data)
		          		}
		          	}    
		        });

			    function jsonpCallbackProyecto(data) {
			    	datosProyectos = data;
				    for(var x = 0; x < datosProyectos.proyectos.length; x++)
			      	{
			        	if(datosProyectos.proyectos[x].codigoProyecto === parseInt(numeroProyectoIngresado))
			        	{
			        		var mostrarNombreProyecto = datosProyectos.proyectos[x].nombreProyecto;
			        		var nt=document.createElement('small');
			          		var ntText=document.createTextNode(mostrarNombreProyecto);
			    	        nt.appendChild(ntText);
			    	        var separador=document.createTextNode(" > ");
			          		var nparrafo=document.getElementById('tituloFormulario');
			              	var strong = document.createElement('strong');
			              	strong.appendChild(separador);
			              	nparrafo.appendChild(nt);
			              	nparrafo.appendChild(strong);

			        	}
			      	}
			   }
		    }
		    
		    this.productoFocus = function(){
			    //var linkNivel = document.getElementById("nivel-formulario").value;
			    //var linkEntidad = document.getElementById("entidad-formulario").value;
		    	var linkNivel = 12;
		      	var linkEntidad = 1;
			    var linkTipoPrograma = document.getElementById("tipoPrograma-formulario").value;
			    var linkPrograma = document.getElementById('programa-formulario').value;
			    var linkSubPrograma = document.getElementById('subPrograma-formulario').value;
			    var linkProyecto = document.getElementById('proyecto-formulario').value;   


		    	var datosProductos = [];
		    	var datosProductosDetalle = [];
		    	
				if ( $("#listaf7c2").length ) {
					$("#listaf7c2").remove();
					$('#producto-formulario').val('');
					$('#totalFisico-formulario').val('');
					$('#unidadMedida-formulario').val('');
					$('#clase-formulario').val('');
					$('#totalFinanciero-formulario').val('');
					
				}
		    	$.ajax({
		         	 url:'http://spr.stp.gov.py/ajaxSelects?accion=getProductosPresupuesto&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipo='+linkTipoPrograma+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma+'&proyecto='+linkProyecto,
		          	type:'get',
		          	crossDomain: 'true',
		          	dataType:'jsonp',
	                jsonp: 'callback',
	                jsonpCallback: 'jsonpCallbackProducto',
		          	async:false,
		          	success: function( data, textStatus, jqXHR) {
		          		if(data.success){
		          			jsonpCallbackProducto(data)
		          		}
		          	}    
		        });

			    function jsonpCallbackProducto(data) {
			    	datosProductos = data;
			    	
			    	
			        var datalistProductos = document.createElement('datalist');
			        datalistProductos.setAttribute('id','listaf7c2'); 
			        var ubicacionDatalistProductos = document.getElementById('formulario');
			        ubicacionDatalistProductos.appendChild(datalistProductos);
			        
				          for(var i = 0; i < datosProductos.producto.length ; i++) 
			          {       

					    	$.ajax({
					         	 url:'http://spr.stp.gov.py/ajaxSelects?accion=getProductos&producto='+datosProductos.producto[i].producto_id,
					          	type:'get',
					          	crossDomain: 'true',
					          	dataType:'jsonp',
				                jsonp: 'callback',
				                jsonpCallback: 'jsonpCallbackProductoDetalle',
					          	async:false,
					          	success: function( data, textStatus, jqXHR) {
					          		if(data.success){
					          			jsonpCallbackProductoDetalle(data)
					          		}
					          	}    
					        });
			          } 
					    	
			        	  function jsonpCallbackProductoDetalle(data) {
						    	datosProductosDetalle = data;
						    	
					    	

							          var option = document.createElement('option');
							          option.setAttribute('value', datosProductosDetalle.productos[0].codigoCatalogo);
							          option.setAttribute('label', datosProductosDetalle.productos[0].nombreCatalogo);
							          datalistProductos.appendChild(option);      
						    }
			        	  
			      	  
			    	
			    }//fin primer callback
		    }
		    
		    this.producto = function(){
			    //var linkNivel = document.getElementById("nivel-formulario").value;
			    //var linkEntidad = document.getElementById("entidad-formulario").value;
		    	var linkNivel = 12;
		      	var linkEntidad = 1;
			    var linkTipoPrograma = document.getElementById("tipoPrograma-formulario").value;
			    var linkPrograma = document.getElementById('programa-formulario').value;
			    var linkSubPrograma = document.getElementById('subPrograma-formulario').value;
			    var linkProyecto = document.getElementById('proyecto-formulario').value; 
			    var linkProducto = document.getElementById('producto-formulario').value; 
			    var datosProductos = [];
			    var valorProducto = [];
			    var datosProductoUnidadMedida = [];
			    var datos = [];
			    var sumaTotal=0;
			    var maxValor = 0;	
			    var totalFinanciero;  
			    
		    	$.ajax({
		         	 url:'http://spr.stp.gov.py/ajaxSelects?accion=getProductos&producto='+linkProducto,
		          	type:'get',
		          	crossDomain: 'true',
		          	dataType:'jsonp',
	                jsonp: 'callback',
	                jsonpCallback: 'jsonpCallbackProducto',
		          	async:false,
		          	success: function( data, textStatus, jqXHR) {
		          		if(data.success){
		          			jsonpCallbackProducto(data)
		          		}
		          	}    
		        });
		    	
		    	function jsonpCallbackProducto(data) {
					datosProductos = data;
		    		
			    	$.ajax({
			         	 url:'http://spr.stp.gov.py/ajaxSelects?accion=getProductoUnidadMedida&unidadMedidaId='+datosProductos.productos[0].codUnidadMedida,
			          	type:'get',
			          	crossDomain: 'true',
			          	dataType:'jsonp',
		                jsonp: 'callback',
		                jsonpCallback: 'jsonpCallbackProductoUnidadMedida',
			          	async:false,
			          	success: function( data, textStatus, jqXHR) {
			          		if(data.success){
			          			jsonpCallbackProductoUnidadMedida(data)
			          		}
			          	}    
			        });
			    	
			    	function jsonpCallbackProductoUnidadMedida(data) {
						datosProductoUnidadMedida = data;
						
		        		var mostrarUnidadMedida = datosProductoUnidadMedida.producto[0].unidadMedidaNombre;
			    		$("#unidadMedida-formulario").val(mostrarUnidadMedida);
			    		
				    	$.ajax({
				         	 url:'http://spr.stp.gov.py/ajaxSelects?accion=getAsignacionPresiVersion&nivel=12&entidad=1&tipo='+linkTipoPrograma+'&programa='+linkPrograma+'&subPrograma='+linkSubPrograma+'&proyecto='+linkProyecto+'&producto='+linkProducto,
				          	type:'get',
				          	crossDomain: 'true',
				          	dataType:'jsonp',
			                jsonp: 'callback',
			                jsonpCallback: 'jsonpCallbackAsignacionPresi',
				          	async:false,
				          	success: function( data, textStatus, jqXHR) {
				          			jsonpCallbackAsignacionPresi(data);
				          	}    
				        });
				    	
				    	function jsonpCallbackAsignacionPresi(data) {
							datos = data;
							totalFinanciero = 0;
			        		for(var z = 0; z < datos.length; z++)
			        		{
			        			totalFinanciero += ( parseFloat(datos[z].planificado1) + parseFloat(datos[z].planificado2) + parseFloat(datos[z].planificado3) + parseFloat(datos[z].planificado4) + parseFloat(datos[z].planificado5) + parseFloat(datos[z].planificado6) + parseFloat(datos[z].planificado7) + parseFloat(datos[z].planificado8) + parseFloat(datos[z].planificado9) + parseFloat(datos[z].planificado10) + parseFloat(datos[z].planificado11) + parseFloat(datos[z].planificado12) );
			        		}
				    		//$("#totalFinanciero-formulario").val(numeroConComa(totalFinanciero));
				    		$("#totalFinanciero-formulario").val(totalFinanciero);
				    		$("#anhoProducto-formulario").val(datos[0].anho);
				    		$("#versionProducto-formulario").val(datos[0].version);


				    	}
			    	}
			    	    	
	        		var mostrarNombreProducto = datosProductos.productos[0].nombreCatalogo;
	        		var nt=document.createElement('small');
	          		var ntText=document.createTextNode(mostrarNombreProducto);
	    	        nt.appendChild(ntText);
	    	        var separador=document.createTextNode(" > ");
	          		var nparrafo=document.getElementById('tituloFormulario');
	              	var strong = document.createElement('strong');
	              	strong.appendChild(separador);
	              	nparrafo.appendChild(nt);
	              	nparrafo.appendChild(strong);
	    	              	
	        		var mostrarClase = datosProductos.productos[0].clase;
		    		$("#clase-formulario").val(mostrarClase);
	              	
					if( datosProductos.productos[0].clase === "N" )
					{
				    	$.ajax({
				         	 url:'http://spr.stp.gov.py/ajaxSelects?accion=getProductoTipoN&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipo='+linkTipoPrograma+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma+'&proyecto='+linkProyecto+'&producto='+linkProducto,
				          	type:'get',
				          	crossDomain: 'true',
				          	dataType:'jsonp',
			                jsonp: 'callback',
			                jsonpCallback: 'jsonpCallbackProductoTipoN',
				          	async:false,
				          	success: function( data, textStatus, jqXHR) {
				          		if(data.success){
				          			jsonpCallbackProductoTipoN(data)
				          		}
				          	}
				        });
				    	
				    	function jsonpCallbackProductoTipoN(data) {
				    		valorProducto = data;
				    		
				    		for(var x = 0; x < valorProducto.productoTipoN.length; x++){
				    			sumaTotal += parseInt(valorProducto.productoTipoN[x].valor);
				    		}
				    		$("#totalFisico-formulario").val(sumaTotal);
				    	}	
					}//finIf
					
						if( datosProductos.productos[0].clase === "C" )
					{
				    	$.ajax({
				         	 url:'http://spr.stp.gov.py/ajaxSelects?accion=getProductoTipoN&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipo='+linkTipoPrograma+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma+'&proyecto='+linkProyecto+'&producto='+linkProducto,
				          	type:'get',
				          	crossDomain: 'true',
				          	dataType:'jsonp',
			                jsonp: 'callback',
			                jsonpCallback: 'jsonpCallbackProductoTipoC',
				          	async:false,
					          	success: function( data, textStatus, jqXHR) {
				          		if(data.success){
				          			jsonpCallbackProductoTipoC(data)
				          		}
				          	}   
				        });
				    	function jsonpCallbackProductoTipoC(data) {
				    		valorProducto = data;
				    		
				    		for(var x = 0; x < valorProducto.productoTipoN.length; x++){
				    			if(valorProducto.productoTipoN[x].valor > maxValor)
				    			{
				    				maxValor = valorProducto.productoTipoN[x].valor;
				    			}
				    		}
				    	}		
					} 
		    	}//finCallbackProducto

		    }
		    
		}//fin combo
		
		  var eje1 = new Combo();
		  document.getElementById('nivel-formulario').addEventListener('focus',eje1.nivelFocus,false);
		  document.getElementById('nivel-formulario').addEventListener('change',eje1.nivel,false);
		  document.getElementById('entidad-formulario').addEventListener('focus',eje1.entidadFocus,false);
		  document.getElementById('entidad-formulario').addEventListener('change',eje1.entidad,false);
		  document.getElementById('tipoPrograma-formulario').addEventListener('focus',eje1.tipoProgramaFocus,false); 
		  document.getElementById('tipoPrograma-formulario').addEventListener('change',eje1.tipoPrograma,false);
		  document.getElementById('programa-formulario').addEventListener('focus',eje1.programasFocus,false); 
		  document.getElementById('programa-formulario').addEventListener('change',eje1.programas,false); 
		  document.getElementById('subPrograma-formulario').addEventListener('focus',eje1.subProgramasFocus,false); 
		  document.getElementById('subPrograma-formulario').addEventListener('change',eje1.subProgramas,false);  
		  document.getElementById('proyecto-formulario').addEventListener('focus',eje1.proyectoFocus,false); 
		  document.getElementById('proyecto-formulario').addEventListener('change',eje1.proyecto,false);
		  document.getElementById('producto-formulario').addEventListener('focus',eje1.productoFocus,false); 
		  document.getElementById('producto-formulario').addEventListener('change',eje1.producto,false); 
		
	});

	$("body").on("click", ".guardarAccion",function(event){
		var codigoRegistro = $(this).attr("parametros");
	    var idParsed = codigoRegistro.split("-"); 
	    var insLineaAccionId = idParsed[0];
	    var lineaAccionId = idParsed[1];
	    var institucionId = idParsed[2];
	    var periodoId = idParsed[3];
		
		var costo = document.getElementById("costoAccion").value;
		var peso = document.getElementById("pesoAccion").value;
		var fechaInicio = document.getElementById("fechaInicioAccion").value;
		var fechaFin = document.getElementById("fechaFinAccion").value;
		var version = document.getElementById("versionAccion").value;
	    var meta1 = document.getElementById("primerTrimestre-formulario").value;
	    var meta2 = document.getElementById("segundoTrimestre-formulario").value;
	    var meta3 = document.getElementById("tercerTrimestre-formulario").value;
	    var meta4 = document.getElementById("cuartoTrimestre-formulario").value;
		var departamentoId = $("#selectorDepartamento option:selected").val();
		var distritoId = $("#distritosDepartamento option:selected").val();
		var catalogoAccion = $("#selectorCatalogoAccion option:selected").val();

 		var datos = new Object();
	    
	    datos.costo = costo;
	    datos.peso = peso;
	    datos.fechaInicio = fechaInicio;
	    datos.fechaFin = fechaFin;
	    datos.version = version;
	    datos.meta1 = meta1;
	    datos.meta2 = meta2;
	    datos.meta3 = meta3;
	    datos.meta4 = meta4;
	    datos.insLineaAccionId = insLineaAccionId;
	    datos.departamentoId = departamentoId;
	    datos.distritoId = distritoId;
	    datos.accionCatalogoId = catalogoAccion;


	  	var info = JSON.stringify(datos);
	    $.ajax({
	        url: "ajaxInserts2?accion=insAccion",
	        type: 'POST',
	        dataType: 'json',
	        data: info,
	        contentType: 'application/json',
	        mimeType: 'application/json',
	        success: function (data) {
	        	actualizarTablaAcciones(insLineaAccionId,lineaAccionId,institucionId,periodoId);
	        	},
	        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
	        error: function(data,status,er) {
	        	actualizarTablaAcciones(insLineaAccionId,lineaAccionId,institucionId,periodoId);
	        	}
		 });
	    
	});	
	
	function actualizarTablaAcciones(insLineaAccionId,lineaAccionId,institucionId,periodoId){
		var insLineaAccionId = insLineaAccionId;
		var lineaAccionId = lineaAccionId;
		var institucionId = institucionId;
		var periodoId = periodoId;
	
		var accion = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAccion&lineaAccionId='+insLineaAccionId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		accion = JSON.parse(accion);
		
		var departamentos = $.ajax({
	    	url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getDepartamento',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		departamentos = JSON.parse(departamentos);
		
		var distritos = $.ajax({
	    	url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getDistrito',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		distritos = JSON.parse(distritos);
		
		var nombreDepartamento;
		var cuerpoAccion = "";
		var nombreDistrito;

		
		for(var a = 0; a < accion.length; a++)
		{
			var catalogoAccion = $.ajax({
				url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAccionCatalogo&catalogoAccionId='+accion[a].accionCatalogoId,
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			catalogoAccion = JSON.parse(catalogoAccion);
			
			cuerpoAccion +="<tr><td class='text-center'>"+catalogoAccion[0].nombre+"</td>";
			
			for(var d = 0; d < 18; d++)
			{
				if(accion[a].departamentoId == departamentos[d].idDepartamento){
					nombreDepartamento = departamentos[d].nombreDepartamento;
					cuerpoAccion +="<td class='text-center'>"+nombreDepartamento+"</td>";
				}
			}
			

			for(var e = 0; e < distritos.length; e++)
			{
				if(accion[a].distritoId == distritos[e].id && accion[a].departamentoId == distritos[e].departamentoId){
					nombreDistrito = distritos[e].descripcion;
					cuerpoAccion +="<td class='text-center'>"+nombreDistrito+"</td>";
				}
			}

			cuerpoAccion +="<td class='text-center'>"+accion[a].fechaInicio+"</td><td class='text-center'>"+accion[a].fechaFin+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[a].meta1).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[a].meta2).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[a].meta3).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[a].meta4).toFixed(2))+"</td><td class='text-center'><button type='button' class='btn btn-default btn-sm' data-toggle='tooltip' data-placement='top' title='Vincular Acción a Productos'><span class='glyphicon glyphicon-usd modalVincularProducto' parametros="+accion[a].id+"-"+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"></span></button><button type='button' class='btn btn-default btn-sm'><span class='glyphicon glyphicon-time'></span></button><button type='button' class='btn btn-default btn-sm' data-toggle='tooltip' data-placement='top' title='Editar Acción'><span class='glyphicon glyphicon-pencil'></span></button><button type='button' class='btn btn-default btn-sm' data-toggle='tooltip' data-placement='top' title='Borrar Acción'><span class='glyphicon glyphicon-trash'></span></button></td></tr>";

		}
		
		$('#tablaAccionesPrecargadas').html("");
		$('#tablaAccionesPrecargadas').append(cuerpoAccion);
		//$("#costoAccion").val('');
		//$("#pesoAccion").val('');
		$("#fechaInicioAccion").val('');
		$("#fechaFinAccion").val('');
		//$("#versionAccion").val('');
		$("#primerTrimestre-formulario").val('');
		$("#segundoTrimestre-formulario").val('');
		$("#tercerTrimestre-formulario").val('');
		$("#cuartoTrimestre-formulario").val('');
		//$("#insLineaAccionId").val('');
		$("#selectorDepartamento").val('');
		$("#distritosDepartamento").val('');
		$("#selectorCatalogoAccion").val('');
		$("#unidadMedidaAccion").val('');
		
	}
	
	$("body").on("click", ".agregarActividad",function(event){
		
		if ( $("#modalVincularProductos").length )
		{
			$("#modalVincularProductos").remove();
		}	
		if ( $("#modalActividad").length )
		{
			$("#modalActividad").remove();
		}	
				
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-");                                                            
		
		//Las siguentes 4 variables se utiliza en esta funcion para redibujar el modal anterior
		var insLineaAccionId = idParsed[0];
		var lineaAccionId = idParsed[1];
		var institucionId = idParsed[2];
		var periodoId = idParsed[3];
		var accionId = idParsed[4];
				
		var unidadMedida = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getUnidadMedida',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		unidadMedida = JSON.parse(unidadMedida);
		
		
		var optionUnidadMedida;
		for(var u = 0; u < unidadMedida.length; u++)
		{
			optionUnidadMedida+='<option value="'+unidadMedida[u].id+'" parametro="'+unidadMedida[u].id+'">'+unidadMedida[u].descripcion+'</option>';
		}
		
		var hitoTipo = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getHitoTipo',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		hitoTipo = JSON.parse(hitoTipo);
		
		var optionTipoHito;
		for(var u = 0; u < hitoTipo.length; u++)
		{
			optionTipoHito+='<option value="'+hitoTipo[u].id+'" parametro="'+hitoTipo[u].id+'">'+hitoTipo[u].nombre+'</option>';
		}
		
		//var optionTipoHito='<option value="0" parametro="0">Entregable</option><option value="1" parametro="1">Intermedio</option><option value="2" parametro="2">Autonomo</option>';
		
		var cuerpoModalActividades = "";

		cuerpoModalActividades +=	'<div class="modal fade" id="modalActividad" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
		'	<div class="modal-dialog modal-lg" style="width:90%">'+
		'		<div class="modal-content" >'+
		'			<div class="modal-header">'+
		'		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
		'		        <h4 class="modal-title">Cronograma</h4>'+ 
		'			</div>'+
		'		    <div class="modal-body" id="accionCuerpo" >'+
		
		
		'		      	<div class="row">'+ 
		'		      		<div class="col-md-12">'+
		'						<div class="box box-warning">'+
		'		                	<div class="box-header with-border">'+
		'		                  		<h3 class="box-title">Agregar Nuevo Cronograma</h3>'+
		'	                  			<div class="box-tools pull-right">'+
		'				                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>'+
		'		                    		</button>'+
		'		                    		<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i>'+
		'		                    		</button>'+
		'		                  		</div>'+
		'               			</div>'+//fin box-heder
		'               			<div class="box-body">'+
		
		'								<form role="form">'+
		'									<div class="table-responsive">'+
		'										<table class="table table-hover">'+
		'											<tbody>'+
		'												<tr><td><div class="form-group"><label for="nombreActividad">Cronograma</label><input type="text" class="form-control" id="nombreActividad" value="" placeholder="Ingrese Nombre del Cronograma"><input type="hidden" class="form-control" id="insLineaAccionId" value="'+insLineaAccionId+'"></div></td><td><div class="form-group"><label for="descripcionActividad">Descripción</label><input type="text" id="descripcionActividad" value="" class="form-control"> </div></td></tr>'+
		'												<tr><td><div class="form-group"><label for="unidadMedidaIdActividad">Unidad de Medida</label><select id="unidadMedidaIdActividad" class="form-control" placeholder="Ingrese Unidad Medida Id">'+optionUnidadMedida+'</div></td><td><div class="form-group"><label for="hitoTipoIdActividad">Tipo de Cronograma</label>'+
		'												<select id="hitoTipoIdActividad" class="form-control" placeholder="Ingrese Tipo de Cronograma">'+optionTipoHito+'</select></div></td></tr>'+
		'												<tr><td><div class="form-group"><label for="proporcionActividad">Proporción</label><input type="text" class="form-control" id="proporcionActividad" value="" placeholder="Ingrese Proporción" /></div></td><td><div class="form-group"><label for="pesoActividad">Peso</label><input type="text" class="form-control" id="pesoActividad" value="" placeholder="IngresePeso" /></div></td></tr>'+
		'											</tbody>'+							           
		'										</table>'+
		'									</div>'+
		'								<input type="hidden" id="versionActividad" class="form-control" placeholder="Ingrese Versión" /><input type="hidden" id="accionIdActividad" class="form-control" placeholder="Ingrese Accion Id" value="'+accionId+'" />'+
		'								</form>'+
		'               			</div>'+//fin box-body
		'							<div class="modal-footer">'+
		'								<button type="button" class="btn btn-success btn-sm guardarActividad" parametros = '+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'>Guardar Actividad</button>'+
		'							</div>'+
		'                		</div>'+	
		'                	</div>'+
		'                </div>'+											
						
		'		      	<div class="row">'+ 
		'		      		<div class="col-md-12">'+
		'						<div class="box box-warning">'+
		'		                	<div class="box-header with-border">'+
		'		                  		<h3 class="box-title">Actividades Precargadas</h3>'+
		'	                  			<div class="box-tools pull-right">'+
		'				                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>'+
		'		                    		</button>'+
		'		                    		<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i>'+
		'		                    		</button>'+
		'		                  		</div>'+
		'               			</div>'+//fin box-heder
		'               			<div class="box-body">'+
		
		'	                			<div class="table-responsive">'+
		'	                				<table class="table table-hover table-bordered">'+
		'	                					<thead>'+
		'	                						<tr class="active"><th class="text-center">Nombre</th><th class="text-center">Descripción</th><th class="text-center">Proporción</th><th class="text-center">Peso</th><th class="text-center">Peso</th><th class="text-center">Versión</th><th class="text-center">Acción Id</th><th class="text-center">Unidad Medida Id</th><th class="text-center">Hito Tipo Id</th></tr>'+
		'	                					</thead>'+
		'	                						<tbody id="tablaAccionesPrecargadas">'+
		'	                						</tbody>'+
		'	                				</table>'+
		'	                			</div>'+		                			

		'               			</div>'+//fin box-body
		'                		</div>'+	
		'                	</div>'+
		'                </div>'+
		

		'		    </div>'+
		'			<div class="modal-footer">'+
      	'			</div>'+														
		'		</div>'+ 
		'	</div>'+
		'</div>'; 

		$("body").append(cuerpoModalActividades);
		$("#modalActividad").modal('show');
	});
	
$("body").on("click", ".guardarActividad",function(event){
		
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-");                                                            
		
		//Las siguentes 4 variables se utiliza en esta funcion para redibujar el modal anterior
		var insLineaAccionId = idParsed[0];
		var lineaAccionId = idParsed[1];
		var institucionId = idParsed[2];
		var periodoId = idParsed[3];
		
		var nombre = document.getElementById("nombreActividad").value;
	    var descripcion = document.getElementById("descripcionActividad").value;
	    var proporcion = document.getElementById("proporcionActividad").value;
	    var peso = document.getElementById("pesoActividad").value;
	    var version = document.getElementById("versionActividad").value;
	    var accion_id = document.getElementById("accionIdActividad").value;
	    var unidad_medida_id = document.getElementById("unidadMedidaIdActividad").value;
	    var hito_tipo_id = document.getElementById("hitoTipoIdActividad").value;

		var objeto = new Object();
		var accion = "";
		
		objeto.nombre = nombre;
		objeto.descripcion = descripcion;
		objeto.proporcion = proporcion;
		objeto.peso = peso;
		objeto.version = version;
		objeto.accion_id = accion_id;
		objeto.unidad_medida_id = unidad_medida_id;
		objeto.hito_tipo_id = hito_tipo_id;
		
	});	

	</script>	
