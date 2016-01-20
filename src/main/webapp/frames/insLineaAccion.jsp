<script>
	
	$("body").on("click", ".nuevaInsLineaAccion",function(event){		
		event.stopPropagation();
		event.preventDefault();
		var lineaAccion = $.ajax({
			url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getLineaAccion',
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
			url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getInstitucion',
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
			url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getPeriodo',
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
		$("#insLineaAccion").remove();
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
			$("#insLineaAccion").find("#formularioInsLineaAccion").append('<div class="form-group" id="guardarInsLineaAccionBoton"><button type="submit" class="btn btn-success" id="guardarInsLineaAccion">Guardar</button></div>');
			$('#insLineaAccion').modal('show');

	});

	$("body").on("click", "#guardarInsLineaAccion",function(event){		
		event.stopPropagation();
		event.preventDefault();
		$("#actualizarInsLineaAccionBoton").remove();
		$("#insLineaAccion").find("#formularioInsLineaAccion").append('<div class="form-group" id="guardarInsLineaAccionBoton"><button type="submit" class="btn btn-success" id="guardarInsLineaAccion">Guardar</button></div>');
		var accion = "insInsLineaAccion";
		var lineaAccionId = $("#nombreInstitucionInsLineaAccion option:selected").val();
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
		        url: "http://tablero2015.stp.gov.py/tablero/ajaxInserts2?accion="+accion,
		        type: 'POST',
		        dataType: 'json',
		        data: JSON.stringify(datos),
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
		
		var lineaAccion = $.ajax({
			url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getLineaAccion',
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
			url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getInstitucion',
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
			url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getPeriodo',
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
			url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getLineaAccion',
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
			url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getInstitucion',
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
			url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getPeriodo',
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
		
		var insLineaAccion = $.ajax({
			url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getInsLineaAccion',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;		
		insLineaAccion=JSON.parse(insLineaAccion);
		
		renderInsLineaAccion();
		function renderInsLineaAccion(){
			
		$('.box-body').html('');
		var tablaInsLineaAccion="";
		tablaInsLineaAccion = 	'<div class="table-responsive">'+
								'<table class="table table-hover">'+
								  '<tr class="active"><td colspan="7">Tabla InsLineaAccion</td><td><a href="#" data-toggle="modal" data-target="#insLineaAccion"><span class="glyphicon glyphicon-plus nuevaInsLineaAccion"></span></a></td></tr>'+
								  '<tr class="active"><td>Id</td><td>lineaAccionId</td><td>institucionId</td><td>periodoId</td><td>meta</td><td>borrado</td><td>Editar</td><td>Borrar</td></tr>';
		for(var w=0; w<insLineaAccion.length;w++)
		{
			if(insLineaAccion[w].borrado == true)
			{
				tablaInsLineaAccion+='<tr><td><del>'+insLineaAccion[w].id+'</del></td><td><del>'+insLineaAccion[w].lineaAccionId+'</del></td><td><del>'+insLineaAccion[w].institucionId+'</del></td><td><del>'+insLineaAccion[w].periodoId+'</del></td><td><del>'+insLineaAccion[w].meta+'</del></td><td><del>'+insLineaAccion[w].borrado+'</del></td><td><span class="glyphicon glyphicon-pencil registrosInsLineaAccion" codigoRegistroInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'-'+insLineaAccion[w].meta+'-'+insLineaAccion[w].version+'></span></td><td><span class="glyphicon glyphicon-trash" parametrosBorradoInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].borrado+' id="iconoBorradoInsLineaAccion"></span></td></tr>';
			}else{
				tablaInsLineaAccion+='<tr><td>'+insLineaAccion[w].id+'</td><td>'+insLineaAccion[w].lineaAccionId+'</td><td>'+insLineaAccion[w].institucionId+'</td><td>'+insLineaAccion[w].periodoId+'</td><td>'+insLineaAccion[w].meta+'</td><td>'+insLineaAccion[w].borrado+'</td><td><span class="glyphicon glyphicon-pencil registrosInsLineaAccion" codigoRegistroInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'-'+insLineaAccion[w].meta+'-'+insLineaAccion[w].version+'></span></td><td><span class="glyphicon glyphicon-trash" parametrosBorradoInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].borrado+' id="iconoBorradoInsLineaAccion"></span></td></tr>';

				
			}
		}
		tablaInsLineaAccion +='</table></div>';				
		
		$('.box-body').html(tablaInsLineaAccion);
		
		}	
		
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
				       	}else
				       	{
				       		if (data.success == false)
				       		{
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
				window.location.href = "http://tablero2015.stp.gov.py/tablero/contenedorInsLineaAccion.jsp";
			});	
	</script>	
