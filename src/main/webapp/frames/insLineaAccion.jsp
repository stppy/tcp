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
						alert("Datos Guardados");
						
						var insLineaAccion = $.ajax({
							url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getInsLineaAccion',
						  	type:'get',
						  	dataType:'json',
						  	async:false       
						}).responseText;		
						insLineaAccion=JSON.parse(insLineaAccion);
						
						var lineaAccion = $.ajax({
							url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getLineaAccion',
						  	type:'get',
						  	dataType:'json',
						  	async:false       
						}).responseText;
						lineaAccion = JSON.parse(lineaAccion);
						
						var institucion = $.ajax({
							url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getInstitucion',
						  	type:'get',
						  	dataType:'json',
						  	async:false       
						}).responseText;
						institucion = JSON.parse(institucion);
						
						var periodo = $.ajax({
							url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getPeriodo',
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

							alert("Error");
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
		        		alert("Actualizado");
		        		var insLineaAccion = $.ajax({
		        			url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getInsLineaAccion',
		        		  	type:'get',
		        		  	dataType:'json',
		        		  	async:false       
		        		}).responseText;		
		        		insLineaAccion=JSON.parse(insLineaAccion);
		        		
		        		var lineaAccion = $.ajax({
		        			url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getLineaAccion',
		        		  	type:'get',
		        		  	dataType:'json',
		        		  	async:false       
		        		}).responseText;
		        		lineaAccion = JSON.parse(lineaAccion);
		        		
		        		var institucion = $.ajax({
		        			url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getInstitucion',
		        		  	type:'get',
		        		  	dataType:'json',
		        		  	async:false       
		        		}).responseText;
		        		institucion = JSON.parse(institucion);
		        		
		        		var periodo = $.ajax({
		        			url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getPeriodo',
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
	
	$("body").on("click", ".agregarAccion",function(event){
		var codigoRegistro = $(this).attr("parametrosAccionInsLineaAccion");
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
				var nombreLineaAccion = lineaAccion[i].nombre;
			}
		}
		
		var institucion = $.ajax({
			url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getInstitucion',
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
			url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getPeriodo',
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
			url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getUnidadMedida',
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
	    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getDepartamento',
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
				
		var cuerpoModalAccion = "";

		cuerpoModalAccion =	'<div class="modal fade" id="modalAccion" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
							'	<div class="modal-dialog modal-lg">'+
							'		<div class="modal-content" >'+
							'			<div class="modal-header">'+
							'		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
							'		        <h4 class="modal-title">Registrar Acción de '+nombreLineaAccion+' ('+nombreInstitucion+') - '+nombrePeriodo+'</h4>'+ 
							'			</div>'+
							'		    <div class="modal-body" id="accionCuerpo" >'+
							'				<form role="form">'+
							'					<div class="table-responsive">'+
							'						<table class="table table-hover">'+
							'							<tbody>'+
							'								<tr><td><div class="form-group"><label for="nombreAccion">Acción</label><input type="text" class="form-control" id="nombreAccion" value=""><input type="hidden" class="form-control" id="insLineaAccionId" value="'+insLineaAccionId+'"></div></td><td><div class="form-group"><label for="umedida">U. medida</label><select id="selectorUnidadMedida" class="form-control">'+optionUnidadMedida+'</select></div></td></tr>'+
							'								<tr><td><div class="form-group"><label for="departamento">Departamento</label><select id="selectorDepartamento" name="departamento" class="form-control">'+optionDepartamentos+'</select></div></td><td><div class="form-group"><label for="distrito">Distrito</label><select name="departamento" class="form-control" id="distritosDepartamento"></select></div></td></tr>'+
							'							</tbody>'+							           
							'						</table>'+
							'					</div>'+
							'				</form>'+			  
							'		    </div>'+
							'			<div class="modal-footer">'+
					        '				<button type="button" class="btn btn-default js-btn-step pull-left" data-orientation="cancel" data-dismiss="modal">Cancel</button>'+
					        '				<button type="button" class="btn btn-warning js-btn-step" data-orientation="previous" data-step="0" disabled="disabled">Previous</button>'+
					        '				<button type="button" class="btn btn-success js-btn-step" data-orientation="next" data-step="1">Next</button>'+
					      	'			</div>'+														
							'		</div>'+ 
							'	</div>'+
							'</div>';
							
		$("#programacion").append(cuerpoModalAccion);
		$('#modalAccion').modal('show');
		
	});
	

	
	
	$("body").on("click", ".agregarAccion2",function(event){
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
				var nombreLineaAccion = lineaAccion[i].nombre;
			}
		}
		
		var institucion = $.ajax({
			url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getInstitucion',
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
			url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getPeriodo',
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
			url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getUnidadMedida',
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
	    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getDepartamento',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		departamentos = JSON.parse(departamentos);
		
		
		var distritos = $.ajax({
	    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getDistrito',
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
	    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getAccionCatalogo',
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
			url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getAccion&lineaAccionId='+insLineaAccionId,
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
			cuerpoAccion +="<tr><td class='text-center'>"+nombreDepartamento+"</td><td class='text-center'>"+nombreDistrito+"</td><td class='text-center'>"+accion[z].fechaInicio+"</td><td class='text-center'>"+accion[z].fechaFin+"</td><td class='text-center'>"+accion[z].costo+"</td><td class='text-center'>"+accion[z].meta1+"</td><td class='text-center'>"+accion[z].meta2+"</td><td class='text-center'>"+accion[z].meta3+"</td><td class='text-center'>"+accion[z].meta4+"</td><td class='text-center'>"+accion[z].peso+"</td><td class='text-center'>"+accion[z].version+"</td></tr>";
		}
		

				
		//var cuerpoModalAccion = "";
		$('#modalAgregarAccion').find("#selectorDepartamento").append(optionDepartamentos);
		$('#modalAgregarAccion').find("#selectorUnidadMedida").append(optionUnidadMedida);
		$('#modalAgregarAccion').find("#selectorAccion").append(optionAccionCatalogo);
		$('#modalAgregarAccion').find("#tablaAcciones").html("");
		$('#modalAgregarAccion').find(".modal-header").html("");
		$('#modalAgregarAccion').find("#tablaAcciones").append(cuerpoAccion);
		$('#modalAgregarAccion').modalSteps();
		$('#modalAgregarAccion').modal('show');

	});

	
	$("body").on("change", "#selectorDepartamento",function(event){
		//var departamentoId = $(this).attr("parametro");
		var departamentoId = $("#selectorDepartamento option:selected").val();
    	
		var distritos = $.ajax({
	    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getDistrito&departamento='+departamentoId,
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
	

	</script>	
