

<script>
	

var entidadIdCas = "";
var nivelIdCas = "";
<%if (user != null) { %>

nivelIdCas ="<%=attributes.get("nivel_id") %>";
entidadIdCas ="<%=attributes.get("entidad_id") %>";
 
 <%  } else { %>
 nivelIdCas=12;
 entidadIdCas=1;
<% } %>

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
		
		var contenido = "";

		contenido =			'<div class="modal fade" id="insLineaAccion" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
							'	<div class="modal-dialog modal-lg">'+
							'		<div class="modal-content" >'+
							'			<div class="modal-header">'+
							'		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
							'		        <h4 class="modal-title">Registrar Línea de Acción por Institución</h4>'+
							'			</div>'+
							'		    <div class="modal-body" >'+
									    
							'				<form role="form" id="formularioInsLineaAccion">'+
							'					<div class="form-group">'+
							'						<label for="nombreLineaAccion">Nombre Linea Acción</label>'+
							'						<input type="hidden" id="idInsLineaAccion" value="">'+					
							'						<select name="lineaAccion" id="nombreLineaAccionInsLineaAccion" class="form-control">'+optionLineaAccion+'</select>'+
							'					</div>'+
							'					<div class="form-group">'+
							'						<label for="unidadMedida">U. Medida</label>'+
							'						<input type="text" id="unidadMedidaInsLineaAccion" class="form-control" placeholder="U. Medida" disabled>'+
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
			$("#unidadMedidaInsLineaAccion")
			$("#insLineaAccion").find("#formularioInsLineaAccion").append('<div class="form-group" id="guardarInsLineaAccionBoton"><button type="submit" class="btn btn-success" id="guardarInsLineaAccion" data-dismiss="modal">Guardar</button></div>');
			$('#insLineaAccion').modal('show');

	});
	
	$("body").on("change", "#nombreLineaAccionInsLineaAccion",function(event){
		//var departamentoId = $(this).attr("parametro");
		var catalogoLineaAccionId = $("#nombreLineaAccionInsLineaAccion option:selected").val();
    	
		var catalogoLineaAccion = $.ajax({
	    	url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getLineaAccion&lineaAccionId='+catalogoLineaAccionId,
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		catalogoLineaAccion = JSON.parse(catalogoLineaAccion);
		
		var unidadMedida = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getUnidadMedida',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		unidadMedida = JSON.parse(unidadMedida);
		var nombreUnidadMedida
		
		for(k = 0;k<catalogoLineaAccion.length; k++)
		{

			for(var u = 0; u < unidadMedida.length; u++)
			{
				if(catalogoLineaAccion[k].unidadMedidaId == unidadMedida[u].id)
				{
					nombreUnidadMedida = unidadMedida[u].descripcion
				}
			}
			
		}
		
		$("#unidadMedidaInsLineaAccion").val(nombreUnidadMedida);
		
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
												  '<tr class="active"><td colspan="6">Línea de Acción por Institución</td></tr>'+
												  '<tr class="active"><td style="min-width:110px">Periodo</td><td>Institución</td><td>Línea de Acción</td><td>Meta</td><td class="text-center">U.Medida</td><td style="min-width:250px" class="text-center">Administrar Linea Acción</td></tr>';
												  
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
								tablaInsLineaAccion+='<td>'+insLineaAccion[w].meta+'</td><td class="text-center">'+nombreUnidadMedida+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="Editar Linea de Acción"><span class="glyphicon glyphicon-pencil registrosInsLineaAccion" codigoRegistroInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'-'+insLineaAccion[w].meta+'-'+insLineaAccion[w].version+'></span></button><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="Borrar Acción"><span class="glyphicon glyphicon-trash" parametrosBorradoInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].borrado+' id="iconoBorradoInsLineaAccion"></span></button><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="Agregar Acción"><span class="glyphicon glyphicon-list-alt agregarAccion" parametros="'+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'"></span></button></td></tr>';	
							}
							
						}
						
						tablaInsLineaAccion +='</table></div>';				
						// no en box body uno en anterior otro en actual y otro en posterior
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
							'		        <h4 class="modal-title">Registrar Línea de Acción por Instituciï¿½n</h4>'+
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
	
	$("body").on("click", ".iconoBorradoInsLineaAccion",function(event){
		
				$("#botonRestaurarInsLineaAccion").remove();
				$("#botonBorradoInsLineaAccion").remove();
				
				
				var objeto = new Object();
				var accion = "borradoInsLineaAccion";
				var parametrosBorradoInsLineaAccion = $(this).attr("parametrosBorradoInsLineaAccion");
			    var idParsed = parametrosBorradoInsLineaAccion.split("-");                                                            
				var id = idParsed[0];
				var borrado = idParsed[1];
				var letra = idParsed[2];
				
				
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
				    		var cuerpoInsLineaAccion = "";
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
				    		
				    		
				    		for(var w=0; w<insLineaAccion.length;w++)
				    		{
				    		 	bandLineaAccion = 0;
				    		 	bandInstitucion = 0;
				    		 	bandPeriodo = 0;
				    		 	
				    		 	if(insLineaAccion[w].periodoId == "2016")
				    		 	{		 		
				    				for(p = 0;p<periodo.length; p++)
				    				{
				    					if(insLineaAccion[w].periodoId == periodo[p].id)
				    					{
				    						if(insLineaAccion[w].borrado == true){
				    							cuerpoInsLineaAccion+='<tr><td><del>'+periodo[p].nombre+'</del></td>';
				    						}else{
				    							cuerpoInsLineaAccion+='<tr><td>'+periodo[p].nombre+'</td>';	
				    						}
				    						bandPeriodo = 1;
				    					}
				    				}
				    				
				    				if(bandPeriodo == 0)
				    				{
				    					cuerpoInsLineaAccion+='<td>'+insLineaAccion[w].periodoId+'</td>';
				    				}
				    			
				    				for(m = 0;m<institucion.length; m++){
				    					if(insLineaAccion[w].institucionId == institucion[m].id)
				    					{
				    						if(insLineaAccion[w].borrado == true){
				    							cuerpoInsLineaAccion+='<td><del>'+institucion[m].sigla+'</del></td>';
				    						}else{
				    							cuerpoInsLineaAccion+='<td>'+institucion[m].sigla+'</td>';	
				    						}
				    						bandInstitucion = 1;
				    					}
				    				}
				    				
				    				if(bandInstitucion == 0)
				    				{
				    					cuerpoInsLineaAccion+='<td>'+insLineaAccion[w].institucionId+'</td>';
				    				}
				    				
				    				for(i = 0;i<lineaAccion.length; i++){				
				    					if(insLineaAccion[w].lineaAccionId == lineaAccion[i].id)
				    					{
				    						if(insLineaAccion[w].borrado == true){
				    							cuerpoInsLineaAccion+='<td><del>'+lineaAccion[i].nombre+'</del></td>';
				    						}else{
				    							cuerpoInsLineaAccion+='<td>'+lineaAccion[i].nombre+'</td>';	
				    						}
				    						bandLineaAccion = 1;
				    					}
				    				}
				    							
				    				if(bandLineaAccion == 0)
				    				{
				    					cuerpoInsLineaAccion+='<td>'+insLineaAccion[w].lineaAccionId+'</td>';
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
				    					cuerpoInsLineaAccion+='<td><del>'+insLineaAccion[w].meta+'</del></td><td class="text-center"><del>'+nombreUnidadMedida+'</del></td><td class="text-center"><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="Editar Linea de Acción"><span class="glyphicon glyphicon-pencil registrosInsLineaAccion" codigoRegistroInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'-'+insLineaAccion[w].meta+'-'+insLineaAccion[w].version+'></span></button><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="Borrar Acción"><span class="glyphicon glyphicon-trash" parametrosBorradoInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].borrado+' id="consultaBorrarInsLineaAccion"></span></button><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="Agregar Acción"><span class="glyphicon glyphicon-list-alt agregarAccion" parametros="'+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'"></span></button></td></tr>';
				    				}else{
				    					cuerpoInsLineaAccion+='<td>'+insLineaAccion[w].meta+'</td><td class="text-center">'+nombreUnidadMedida+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="Editar Acción"><span class="glyphicon glyphicon-pencil registrosInsLineaAccion" codigoRegistroInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'-'+insLineaAccion[w].meta+'-'+insLineaAccion[w].version+'></span></button><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="Borrar Acción"><span class="glyphicon glyphicon-trash" parametrosBorradoInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].borrado+' id="consultaBorrarInsLineaAccion"></span></button><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="Agregar Acción"><span class="glyphicon glyphicon-list-alt agregarAccion" parametros="'+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'"></span></button></td></tr>';	
				    				}
				    			}
				    		}

				    		$("#mensajeBorradoInsLineaAccion").html("");
				    		$("#mensajeBorradoInsLineaAccion").append("<p>Cambio exitoso</p>");
				    		$("#cuerpoInsLineaAccion").html("");
				    		$("#cuerpoInsLineaAccion").append(cuerpoInsLineaAccion);
				    		
				       	}else
				       	{
				       		if (data.success == false)
				       		{
				       			$("#cuerpoInsLineaAccion").html('');
					        	$("#cuerpoInsLineaAccion").append('<p class="text-danger">Error no se ha guardado</p>');
				       		}


				       	}
					},
					error: function(data,status,er)
					{
						$("#cuerpoInsLineaAccion").html('');
						$("#cuerpoInsLineaAccion").append('<p class="text-danger">Error de conexion intente de nuevo</p>');
					}
				});
	});	
	
	$("body").on("click", ".eliminarModal",function(event){
	    if ( $("#modalConsultaBorrarInsLineaAccion").length )
		{
			$("#modalConsultaBorrarInsLineaAccion").remove();
		}
	});	
	
	$("body").on("click", ".agregarAccion",function(event){
		var parametros = $(this).attr("parametros");
		var idParsed = parametros.split("-"); 
	    var insLineaAccionId = idParsed[0];
	    var lineaAccionId = idParsed[1];
	    var institucionId = idParsed[2];
	    var periodoId = idParsed[3];
		
	    if ( $("#modalEditarAccion").length )
		{
			$("#modalEditarAccion").remove();
		}
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
		if ( $("#modalBorrarAccion").length )
		{
			$("#modalBorrarAccion").remove();
		}
		if ( $("#modalActividad").length )
		{
			$("#modalActividad").remove();
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
		for(i = 0;i<departamentos.length; i++){
			optionDepartamentos+='<option value="'+departamentos[i].idDepartamento+'" parametro="'+departamentos[i].idDepartamento+'">'+departamentos[i].nombreDepartamento+'</option>';
		}
		
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
			if (accion[a].borrado == false){
				cuerpoAccion +="<tr><td class='text-center'>"+catalogoAccion[0].nombre+"</td>";
				}else{
					cuerpoAccion +="<tr><td class='text-center'><del>"+catalogoAccion[0].nombre+"</del></td>";
				}
			
			for(var d = 0; d < 18; d++)
			{
				if(accion[a].departamentoId == departamentos[d].idDepartamento){
					nombreDepartamento = departamentos[d].nombreDepartamento;
					if (accion[a].borrado == false){
					cuerpoAccion +="<td class='text-center'>"+nombreDepartamento+"</td>";
					}else{
						cuerpoAccion +="<td class='text-center'><del>"+nombreDepartamento+"</del></td>";
					}
				}
			}
			

			for(var e = 0; e < distritos.length; e++)
			{
				if(accion[a].distritoId == distritos[e].id && accion[a].departamentoId == distritos[e].departamentoId){
					nombreDistrito = distritos[e].descripcion;
					
					if (accion[a].borrado == false){
					cuerpoAccion +="<td class='text-center'>"+nombreDistrito+"</td>";
					}else{
						cuerpoAccion +="<td class='text-center'><del>"+nombreDistrito+"<del></td>";
					}
				}
			}
			

			
			
			var nombreUnidadMedidaAccion = "";
				if(accion[a].accionCatalogoId == catalogoAccion[0].id){
					nombreUnidadMedidaAccion = "";
					for(i = 0; i < unidadMedida.length; i++){
						
						if (catalogoAccion[0].idUnidadMedida == unidadMedida[i].id ){
							nombreUnidadMedidaAccion =  unidadMedida[i].descripcion;
						}
					}
				}
					
			
			
			if(accion[a].borrado == false){	

			cuerpoAccion +="<td class='text-center'>"+accion[a].fechaInicio+"</td><td class='text-center'>"+accion[a].fechaFin+"</td><td class='text-center'>"+nombreUnidadMedidaAccion+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[a].meta1).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[a].meta2).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[a].meta3).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[a].meta4).toFixed(2))+"</td><td class='text-center'><button type='button' class='btn btn-default btn-sm' data-toggle='tooltip' data-placement='top' title='Vincular Acción a Productos Presupuestarios' disabled='disabled'><span class='modalVincularProducto' parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+">Gs</span></button><button type='button' class='btn btn-default btn-sm'><span class='glyphicon glyphicon-time agregarActividad' parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+"-"+accion[a].accionCatalogoId+"></span></button><button type='button' class='btn btn-default btn-sm editarAccion' parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+"-"+accion[a].accionCatalogoId+" data-toggle='tooltip' data-placement='top' title='Editar Acción'><span class='glyphicon glyphicon-pencil'></span></button><button type='button' class='btn btn-default btn-sm consultaBorrarAccion'  parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+"-"+accion[a].accionCatalogoId+" data-toggle='tooltip' data-placement='top' title='Borrar Acción'><span class='glyphicon glyphicon-trash'></span></button></td></tr>";
			
			}else{
				cuerpoAccion +="<td class='text-center'><del>"+accion[a].fechaInicio+"</del></td><td class='text-center'><del>"+accion[a].fechaFin+"</del></td><td class='text-center'><del>"+nombreUnidadMedidaAccion+"</del></td><td class='text-center'><del>"+numeroConComa(parseFloat(accion[a].meta1).toFixed(2))+"</del></td><td class='text-center'><del>"+numeroConComa(parseFloat(accion[a].meta2).toFixed(2))+"</del></td><td class='text-center'><del>"+numeroConComa(parseFloat(accion[a].meta3).toFixed(2))+"</del></td><td class='text-center'><del>"+numeroConComa(parseFloat(accion[a].meta4).toFixed(2))+"</del></td><td class='text-center'><button type='button' class='btn btn-default btn-sm' data-toggle='tooltip' data-placement='top' title='Vincular Acción a Productos Presupuestarios'><span class='modalVincularProducto' parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+">Gs.</span></button><button type='button' class='btn btn-default btn-sm'><span class='glyphicon glyphicon-time agregarActividad' parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+"-"+accion[a].accionCatalogoId+"></span></button><button type='button' class='btn btn-default btn-sm editarAccion' parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+"-"+accion[a].accionCatalogoId+" data-toggle='tooltip' data-placement='top' title='Editar Acción'><span class='glyphicon glyphicon-pencil'></span></button><button type='button' class='btn btn-default btn-sm consultaBorrarAccion'  parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+"-"+accion[a].accionCatalogoId+" data-toggle='tooltip' data-placement='top' title='Borrar Acción'><span class='glyphicon glyphicon-trash'></span></button></td></tr>";
				
			}
		}
		
		
				
		var cuerpoModalAccion = "";

		cuerpoModalAccion =	'<div class="modal fade" id="modalAccion" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
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
							'													<input type="hidden" class="form-control" id="costoAccion" value="99">'+
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
							'	                						<tr class="active"><th rowspan="2" class="text-center">Acción</th><th rowspan="2" class="text-center">Depto</th><th rowspan="2" class="text-center">Distrito</th><th rowspan="2" class="text-center">FechaInicio</th><th rowspan="2" class="text-center">FechaFin</th><th rowspan="2" class="text-center">Unidad Medida</th><th colspan="4" class="text-center">Metas</th><th rowspan="2" class="text-center" style="min-width:160px">Administrar Acción</th></tr>'+
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
	
	
	//editarAccion
	$("body").on("click", ".editarAccion",function(event){
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-"); 
	    var insLineaAccionId = idParsed[0];
	    var lineaAccionId = idParsed[1];
	    var institucionId = idParsed[2];
	    var periodoId = idParsed[3];    
	    var id = idParsed[4];
	    var accionCatalogoId = idParsed[5];

		
		
		if ( $("#modalEditarAccion").length )
		{
			$("#modalEditarAccion").remove();
		}
		if ( $("#modalAccion").length )
		{
			$("#modalAccion").remove();
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
		
		var accion = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAccion&accionId='+id,
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
		
		var optionDepartamentos = "";
		for(i = 0;i<departamentos.length; i++){
			optionDepartamentos+='<option value="'+departamentos[i].idDepartamento+'" parametro="'+departamentos[i].idDepartamento+'">'+departamentos[i].nombreDepartamento+'</option>';
		}
		
		var distritos = $.ajax({
	    	url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getDistrito&departamento='+accion[0].departamentoId,
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		distritos = JSON.parse(distritos);
		optionDistritos="";
		for(k = 0;k<distritos.length; k++){
			
			optionDistritos+='<option value="'+distritos[k].id+'">'+distritos[k].descripcion+'</option>';
		}
		
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
		
		
	
		
		var cuerpoAccion = "";
		for(var z = 0; z < accion.length; z++)
		{
				if(accion[z].borrado == true){
					cuerpoAccion +="<tr><td class='text-center'><del>"+nombreDepartamento+"</del></td><td class='text-center'><del>"+nombreDistrito+"</del></td><td class='text-center'><del>"+accion[z].fechaInicio+"</del></td><td class='text-center'><del>"+accion[z].fechaFin+"</del></td><td class='text-center'><del>"+numeroConComa(parseFloat(accion[z].costo).toFixed(2))+"</del></td><td class='text-center'><del>"+numeroConComa(parseFloat(accion[z].meta1).toFixed(2))+"</del></td><td class='text-center'><del>"+numeroConComa(parseFloat(accion[z].meta2).toFixed(2))+"</del></td><td class='text-center'><del>"+numeroConComa(parseFloat(accion[z].meta3).toFixed(2))+"</del></td><td class='text-center'><del>"+numeroConComa(parseFloat(accion[z].meta4).toFixed(2))+"</del></td><td class='text-center'><del>"+accion[z].peso+"</del></td><td class='text-center'><del>"+accion[z].version+"</del></td><td class='text-center'><del>"+accion[z].borrado+"</del></td><td class='text-center'><span class='modalVincularProducto' parametros="+accion[z].id+">Gs.</span></td><td class='text-center'><span class='glyphicon glyphicon-pencil editarAccion' parametros="+accion[z].id+"></span></td></tr>";
				}else{
					cuerpoAccion +="<tr><td class='text-center'>"+nombreDepartamento+"</td><td class='text-center'>"+nombreDistrito+"</td><td class='text-center'>"+accion[z].fechaInicio+"</td><td class='text-center'>"+accion[z].fechaFin+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[z].costo).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[z].meta1).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[z].meta2).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[z].meta3).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[z].meta4).toFixed(2))+"</td><td class='text-center'>"+accion[z].peso+"</td><td class='text-center'>"+accion[z].version+"</td><td class='text-center'>"+accion[z].borrado+"</td><td class='text-center'><span class='modalVincularProducto' parametros="+accion[z].id+">Gs.</span></td><td class='text-center'><span class='glyphicon glyphicon-pencil editarAccion' parametros="+accion[z].id+"></span></td></tr>";
				}
		}
				
		var cuerpoModalEditarAccion = "";

		cuerpoModalEditarAccion =	'<div class="modal fade" id="modalEditarAccion" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
							'	<div class="modal-dialog modal-lg" style="width:90%">'+
							'		<div class="modal-content" >'+
							'			<div class="modal-header">'+
							'		        <button type="button" class="close agregarAccion" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+' data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
							'			</div>'+
							'		    <div class="modal-body" id="accionCuerpo" >'+
							
							
							'		      	<div class="row">'+ 
							'		      		<div class="col-md-12">'+
							'						<div class="box box-warning">'+
							'		                	<div class="box-header with-border">'+
							'		                  		<h3 class="box-title">Editar Acción</h3>'+
							'	                  			<div class="box-tools pull-right">'+
							'				                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>'+
							'		                    		</button>'+
							'		                    		<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i>'+
							'		                    		</button>'+
							'		                  		</div>'+
							'               			</div>'+//fin box-heder
							'               			<div class="box-body cuerpoEdicionAccion" >'+
							
							'								<form role="form">'+
							'									<div class="table-responsive">'+
							'										<table class="table table-hover">'+
							'											<tbody>'+																																																																																					
							'												<tr><td><div class="form-group"><label for="nombreAccion">Acción</label><select id="selectorCatalogoAccion" name="catalogoAccion"class="form-control">'+optionCatalogoAccion+'</select><input type="hidden" class="form-control" id="insLineaAccionId" value="'+insLineaAccionId+'"></div></td><td><div class="form-group"><label for="umedida">U. medida</label><input type="text" id="unidadMedidaAccion" class="form-control" disabled></div></td></tr>'+
							'												<tr><td><div class="form-group"><label for="departamento">Departamento</label><select id="selectorDepartamento" name="departamento" class="form-control">'+optionDepartamentos+'</select></div></td><td><div class="form-group"><label for="distrito">Distrito</label><select class="form-control" id="distritosDepartamento">'+optionDistritos+'</select></div></td></tr>'+
							'												<tr><td><div class="form-group"><label for="fechaInicio">Fecha Inicio</label><input type="date"  id="fechaInicio" value='+accion[0].fechaInicio+' class="form-control"></div></td><td><div class="form-group"><label for="fichaFin">Fecha Fin</label><input type="date"  id="fechaFin" value='+accion[0].fechaFin+' class="form-control"></div></td></tr>'+

							'											</tbody>'+							           
							'										</table>'+
							'									</div>'+
							'									<div class="row">'+
							'			      					    <div class="form-group col-md-3">'+
							'						  						<label for="totalFinanciero-formulario">Primer Trimestre</label>'+
							'				      						<div class="input-group input-group-sm">'+						      			
							'								    				<input type="text" name="primerTrimestre" id="primerTrimestre-formulario" value='+accion[0].meta1+' class="form-control">'+
							'													<input type="hidden" class="form-control" id="versionAccion" value="3">'+//Aqui estan los input hidden que en este formulario son 3
							'													<input type="hidden" class="form-control" id="costoAccion" value="99">'+
							'													<input type="hidden" class="form-control" id="pesoAccion" value="1">'+
							
							
							
							'				      						</div>'+
							'			  					    	</div>'+
										  					    		
							'				     					<div class="form-group col-md-3">'+
							'							  					<label for="totalFinanciero-formulario">Segundo Trimestre</label>'+
							'					      					<div class="input-group input-group-sm">'+
							'			  					    			<input type="text" name="segundoTrimestre" id="segundoTrimestre-formulario" value='+accion[0].meta2+' class="form-control">'+
							'					      					</div>'+
							'								    		</div>'+
															    		
							'				     					<div class="form-group col-md-3">'+
							'							  					<label for="totalFinanciero-formulario">Tercer Trimestre</label>'+
							'					      					<div class="input-group input-group-sm">'+
							'			  					    			<input type="text" name="tercerTrimestre" id="tercerTrimestre-formulario" value='+accion[0].meta3+' class="form-control">'+
							'					      					</div>'+
							'								    		</div>'+
														    		
							'			      					    <div class="form-group col-md-3">'+
							'						  					<label for="totalFinanciero-formulario">Cuarto Trimestre</label>'+
							'				      						<div class="input-group input-group-sm">'+
							'								    				<input type="text" name="cuartoTrimestre" id="cuartoTrimestre-formulario" value='+accion[0].meta4+' class="form-control">'+
							'				      						</div>'+
							'							    		</div>'+
							'			  						</div>'+							
							'								</form>'+
											
							'               			</div>'+//fin box-body
							'							<div class="modal-footer">'+
							'								<button type="button" class="btn btn-success btn-sm actualizarAccion" id="botonActualizarAccion" parametros='+id+'-'+accionCatalogoId+'-'+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+' >Actualizar Acción</button>'+
							'								<button type="button" class="btn btn-success btn-sm agregarAccion" data-dismiss="modal" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+' >Cerrar</button>'+

							'							</div>'+
							'                		</div>'+	
							'                	</div>'+
							'                </div>'+											
											

							

							'		    </div>'+
							'			<div class="modal-footer">'+
					      	'			</div>'+														
							'		</div>'+ 
							'	</div>'+
							'</div>';
							
		$("#programacion").append(cuerpoModalEditarAccion);
		$('#selectorDepartamento > option[value="'+accion[0].departamentoId+'"]').attr('selected', 'selected');
		$('#distritosDepartamento > option[value="'+accion[0].distritoId+'"]').attr('selected', 'selected');
		$('#selectorCatalogoAccion > option[value="'+accion[0].accionCatalogoId+'"]').attr('selected', 'selected');
		$("#selectorCatalogoAccion").change();
		

		
		$('#modalEditarAccion').modal('show');
		
	});
//fin editarAccion	
	
	
//actualizar Acción
$("body").on("click", ".actualizarAccion",function(event){
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
	
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-"); 
    var id = idParsed[0];
    var accionCatalogoId = idParsed[1];
    var insLineaAccionId = idParsed[2];
    var lineaAccionId = idParsed[3];
    var institucionId = idParsed[4];
    var periodoId = idParsed[5]; 
    

	
	var accionCatalogo = $("#selectorCatalogoAccion option:selected").val();
	var departamento = $("#selectorDepartamento option:selected").val();
	var distrito = $("#distritosDepartamento option:selected").val();
    var fechaInicio = document.getElementById('fechaInicio').value;
    var fechaFin = document.getElementById('fechaFin').value;
    var metaPrimerTrimestre = document.getElementById('primerTrimestre-formulario').value;
    var metaSegundoTrimestre = document.getElementById('segundoTrimestre-formulario').value;
    var metaTercerTrimestre = document.getElementById('tercerTrimestre-formulario').value;
    var metaCuartoTrimestre = document.getElementById('cuartoTrimestre-formulario').value;
    var version = $("#versionAccion").val();
    var peso = $("#pesoAccion").val();
    var costo = $("#costoAccion").val();
    
    //aca vacï¿½o el formulario de ediciï¿½n de Acción
    $("#selectorCatalogoAccion").val('');
    $("#selectorUnidadMedida").val('');
    $("#selectorDepartamento").val('');
    $("#distritosDepartamento").val('');
    $("#fechaInicio").val('');
    $("#fechaFin").val('');
    $("#primerTrimestre-formulario").val('');
    $("#segundoTrimestre-formulario").val('');
    $("#tercerTrimestre-formulario").val('');
    $("#cuartoTrimestre-formulario").val('');
    $("#unidadMedidaAccion").val('');
    $('.cuerpoEdicionAccion').html('');
    $(".cuerpoEdicionAccion").html('<h3 class="text-center">La Acción ha sido modificada</h3>');
    $("#botonActualizarAccion").remove();
    
    
    
    var datos = new Object();
    datos.id = id;
    datos.costo = costo;
    datos.peso = peso;
    datos.fechaInicio = fechaInicio;
    datos.fechaFin = fechaFin;
    datos.version = version;
    datos.meta1 = metaPrimerTrimestre;
    datos.meta2 = metaSegundoTrimestre;
    datos.meta3 = metaTercerTrimestre;
    datos.meta4 = metaCuartoTrimestre;
    datos.insLineaAccionId = insLineaAccionId;
    datos.departamentoId = departamento;
    datos.distritoId = distrito;
    datos.accionCatalogoId = accionCatalogo;
    
    
    
    
    
  	var info = JSON.stringify(datos);
    $.ajax({
        url: "ajaxUpdate2?accion=actAccion",
        type: 'POST',
        dataType: 'json',
        data: info,
        contentType: 'application/json',
        mimeType: 'application/json',
        success: function (data) {
        	//actualizarTablaAcciones(insLineaAccionId);
        	},

        error: function(data,status,er) {
        	//actualizarTablaAcciones(insLineaAccionId);
        	}
	 });
 
    
  
});

//consulta para borrar accion
$("body").on("click", ".consultaBorrarAccion",function(event){
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-"); 
    var insLineaAccionId = idParsed[0];
    var lineaAccionId = idParsed[1];
    var institucionId = idParsed[2];
    var periodoId = idParsed[3];
    var id = idParsed[4];
    var accionCatalogoId = idParsed[5];
    
	if ( $("#modalBorrarAccion").length )
	{
		$("#modalBorrarAccion").remove();
	}		

   
	var accion = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAccion&accionId='+id,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	accion = JSON.parse(accion);

	var catalogoAccion = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAccionCatalogo',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	catalogoAccion = JSON.parse(catalogoAccion);
	
	var nombreAccion;
	for(var a = 0; a < catalogoAccion.length; a++)
	{
			if(catalogoAccion[a].id == accion[0].accionCatalogoId){
				nombreAccion = catalogoAccion[a].nombre;
			}	
	}
	
    
	
	
	var contenido = "";

	contenido =			'<div class="modal fade" id="modalBorrarAccion"  data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
						'	<div class="modal-dialog modal-lg">'+
						'		<div class="modal-content" >'+
						'			<div class="modal-header">'+
						'		        <button type="button" class="close agregarAccion"  parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+' aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
						'		        <h4 class="modal-title" >Borrar - Restaurar Acción</h4>'+
						'			</div>'+
						'		    <div class="modal-body">'+
						'			<div id="mensajeBorradoAccion"></div>'+
						'		    </div>'+
						'			<div class="modal-footer" id="agregarBotonBorradoAccion">'+
						'			</div>'+
						'		</div>'+ 
						'	</div>'+
						'</div>';
						
		$("#programacion").append(contenido);
		
		if(accion[0].borrado == true){
			$("#mensajeBorradoAccion").html("");
			$("#mensajeBorradoAccion").append('<h3 class="text-center">Ud. esta seguro que desea RESTABLACER<strong> '+nombreAccion+'</strong></h3>');
			$("#agregarBotonBorradoAccion").html("");
			$("#agregarBotonBorradoAccion").append('<button type="button" class="btn btn-success btn-sm borrarAccion" id="botonRestaurarAccion" parametros='+id+'-r>Restaurar Acción</button>');
			$("#agregarBotonBorradoAccion").append('<button type="button" class="btn btn-success btn-sm agregarAccion"  parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'>Cerrar</button>');
		}else{
			$("#mensajeBorradoAccion").html("");
			$("#mensajeBorradoAccion").append('<h3 class="text-center">Ud. esta seguro que desea BORRAR<strong> '+nombreAccion+'</strong></h3');
			$("#agregarBotonBorradoAccion").html("");
			$("#agregarBotonBorradoAccion").append('<button type="button" class="btn btn-danger btn-sm borrarAccion" id="botonBorradoAccion" parametros='+id+'-b>Borrar Acción</button>');
			$("#agregarBotonBorradoAccion").append('<button type="button" class="btn btn-success btn-sm agregarAccion"  parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'>Cerrar</button>');
		}
		
		$('#modalBorrarAccion').modal('show');
			
});
	
//borrar accion
$("body").on("click", ".borrarAccion",function(event){	
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-"); 
    var id = idParsed[0];
    var estado = idParsed[1];
    
	var accion = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAccion&accionId='+id,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	accion = JSON.parse(accion);
    
    var objeto = new Object();
    objeto.id = id;
    objeto.borrado= accion[0].borrado;

    
  	var info = JSON.stringify(objeto);
    $.ajax({
        url: "ajaxUpdate2?accion=borradoAccion",
        type: 'POST',
        dataType: 'json',
        data: info,
        contentType: 'application/json',
        mimeType: 'application/json',
        success: function (data) {
        	
            if(estado == "b"){
        		$("#botonBorradoAccion").remove();
            	$("#mensajeBorradoAccion").html("");
            	$("#mensajeBorradoAccion").html("<h3 class='text-center'>BORRADO EXITOSAMENTE!!</h3>");
            }else{
        		$("#botonRestaurarAccion").remove();
            	$("#mensajeBorradoAccion").html("");
            	$("#mensajeBorradoAccion").html("<h3 class='text-center'>RESTAURADO EXITOSAMENTE!!</h3>");
        	}

        },

        error: function(data,status,er) {
        	
        	}
	 });

	
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
		for(i = 0;i<departamentos.length; i++){
			optionDepartamentos+='<option value="'+departamentos[i].idDepartamento+'" parametro="'+departamentos[i].idDepartamento+'">'+departamentos[i].nombreDepartamento+'</option>';
		}
		
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
			cuerpoAccion +="<tr><td class='text-center'>"+nombreDepartamento+"</td><td class='text-center'>"+nombreDistrito+"</td><td class='text-center'>"+accion[z].fechaInicio+"</td><td class='text-center'>"+accion[z].fechaFin+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[z].costo).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[z].meta1).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[z].meta2).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[z].meta3).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[z].meta4).toFixed(2))+"</td><td class='text-center'>"+accion[z].peso+"</td><td class='text-center'>"+accion[z].version+"</td><td class='text-center'><span class='modalVincularProducto' parametros="+accion[z].id+">Gs.</span></td></tr>";
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
		var accionId = idParsed[0];
		var nivel=nivelIdCas;
      	var entidad=entidadIdCas;

    	
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
	        	cargarTablaAccionHasProducto(accionId,producto);
	        	//cargarTablaAccionHasProducto(institucionId, lineaAccionId, idDepartamento, idDistrito, accionId); asi esta el original

	        	},
	        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
	        error: function(data,status,er) {
	        	cargarTablaAccionHasProducto(accionId,producto);
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
	
	function cargarTablaAccionHasProducto(accionId,producto){
		
		var accionId= accionId;
		var producto = producto;
		var nombreProducto = "";
		
		var accionHasProducto = $.ajax({
	    	url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getAccionHasProducto&accion_id='+accionId,
	      	type:'get',
	      	dataType:'json',
	      	crossDomain:true,
	      	async:false       
	    }).responseText;		
		accionHasProducto=JSON.parse(accionHasProducto);
				
    	$.ajax({
        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getProductos',
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
    	
    	var productos;
    	var nombreProducto;
    	
    	function jsonpCallbackProducto(data){
    	 
    		productos = data;
    		
    		$("#TablaAccionHasProductos").html("");
    		var fila ="";
    		for(var f = 0; f < accionHasProducto.length; f++)
    		{
    			
    			fila += "<tr><td>"+accionHasProducto[f].nivel+"</td><td>"+accionHasProducto[f].entidad+"</td><td>"+accionHasProducto[f].tipoPrograma+"</td><td>"+accionHasProducto[f].programa+"</td><td>"+accionHasProducto[f].subPrograma+"</td><td>"+accionHasProducto[f].proyecto+"</td><td>"+accionHasProducto[f].producto+"</td>";
    			
    			nombreProducto = "";
    			for(var j = 0; j < productos.productos.length; j++){
    				if(productos.productos[j].codigoCatalogo == accionHasProducto[f].producto){
    					nombreProducto = productos.productos[j].nombreCatalogo;
    				}
    			}
    			
    	    	fila += "<td>"+nombreProducto+"</td><td>"+accionHasProducto[f].cantFisica+"</td><td>"+accionHasProducto[f].uMedida+"</td><td>"+accionHasProducto[f].clase+"</td><td>Gs."+accionHasProducto[f].cantFinanciera+"</td><td>Gs."+accionHasProducto[f].totalAsignacion+"</td><td><center><button type='submit' class='btn btn-success verificarDestinatarios' parametros="+accionHasProducto[f].nivel+"-"+accionHasProducto[f].entidad+"-"+accionHasProducto[f].tipoPrograma+"-"+accionHasProducto[f].programa+"-"+accionHasProducto[f].subPrograma+"-"+accionHasProducto[f].proyecto+"-"+accionHasProducto[f].producto+"><span class='glyphicon glyphicon-user'></span></button></center></td></tr>";
    		}
    		
    		$("#TablaAccionHasProductos").append(fila);
    		
    	}
    	
		
		
	}
	
	$("body").on("click", ".modalVincularProducto",function(event){
		
		if ( $("#modalVincularProductos").length )
		{
			$("#modalVincularProductos").remove();
		}	
				
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-");                                                            
		//Las siguentes 4 variables se utiliza en esta funcion para redibujar el modal anterior
		var insLineaAccionId = idParsed[0];
		var lineaAccionId = idParsed[1];
		var institucionId = idParsed[2];
		var periodoId = idParsed[3];
		var accionId = idParsed[4];
				
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
						            '    		<th colspan="6" class="text-center" data-toggle="tooltip" data-placement="top" title="Nivel,Entidad,Tipo,Programa,SubPrograma,Proyecto">Cod. Pres.</th>'+
						            '   		<th>Cod. Prod</th>'+						            
						            '   		<th>NombreProducto</th>'+
						            '    		<th>Cantidad</th>'+
						            '    		<th>U. Medida</th>'+
						            '    		<th>Tipo</th>'+
						            '    		<th>Asig. Financiera</th>'+
						            '    		<th>Costo de la Acción</th>'+
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
						      		'					<input type="text" name="nivel" id="nivel-formulario" value="'+nivelIdCas+'" class="form-control" disabled>'+
						      		'				</div>'+
						      		'				<div class="form-group col-md-1">'+
						  			'					<input type="text" name="entidad" id="entidad-formulario" value="'+entidadIdCas+'" class="form-control" disabled>'+
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
						      		'			  		<label for="totalFisico-formulario">Cantidad</label>'+
					      			'		    		<input type="text" name="totalFisico" id="totalFisico-formulario" value="" class="form-control" disabled>'+
					      			'		    	</div>'+
						      		'			    <div class="form-group col-md-3">'+
					      			'		  			<label for="unidadMedida-formulario">U. Medida</label>'+
				      				'	    			<input type="text" name="totalFisico" id="unidadMedida-formulario" value="" class="form-control" disabled>'+
				      				'	    		</div>'+
						      		'			    <div class="form-group col-md-3">'+
				      				'	  				<label for="clase-formulario">Tipo</label>'+
			      					'    				<input type="text" name="totalFisico" id="clase-formulario" value="" class="form-control" disabled>'+
			      					'    			</div>'+
						      		'			    <div class="form-group col-md-3">'+
			      					'  					<label for="totalFinanciero-formulario">Asig. Financiera</label>'+
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
		    	var rutaNivel = nivelIdCas;
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
		    	//var linkEntidad = 12;
		    	var linkEntidad = nivelIdCas;
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
		    	//var linkEntidad = 12;
		      	//var rutaEntidad2 = 1;
		      	var linkEntidad = nivelIdCas;
		      	var rutaEntidad2 = entidadIdCas;
		      	

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

		    	//var rutaNivel = 12;
		    	var rutaNivel=nivelIdCas;
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
					    	
					    	//var linkEntidad = 12;
					      	//var rutaEntidad2 = 1;
					      	var linkEntidad = nivelIdCas;
					      	var rutaEntidad2 = entidadIdCas;
					      	

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
		    	//var linkNivel = 12;
		      	//var linkEntidad = 1;
		      	var linkNivel = nivelIdCas;
		      	var linkEntidad = entidadIdCas;
		      	var linkTipoPrograma = parseInt(document.getElementById("tipoPrograma-formulario").value);
		      	

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
		    	//var linkNivel = 12;
		      	//var linkEntidad = 1;
		      	var linkNivel = nivelIdCas;
		      	var linkEntidad = entidadIdCas;
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
		    	//var linkNivel = 12;
		      	//var linkEntidad = 1;
		      	var linkNivel = nivelIdCas;
		      	var linkEntidad = entidadIdCas;
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
		    	//var linkNivel = 12;
		      	//var linkEntidad = 1;
		      	var linkNivel = nivelIdCas;
		      	var linkEntidad = entidadIdCas;
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
		    	//var linkNivel = 12;
		      	//var linkEntidad = 1;
		      	var linkNivel = nivelIdCas;
		      	var linkEntidad = entidadIdCas;
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
		    	//var linkNivel = 12;
		      	//var linkEntidad = 1;
		      	var linkNivel = nivelIdCas;
		      	var linkEntidad = entidadIdCas;
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
		    	//var linkNivel = 12;
		      	//var linkEntidad = 1;
		      	var linkNivel = nivelIdCas;
		      	var linkEntidad = entidadIdCas;
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
			        
     

			    	$.ajax({
			         	 url:'http://spr.stp.gov.py/ajaxSelects?accion=getProductos',
			          	type:'get',
			          	crossDomain: 'true',
			          	dataType:'jsonp',
		                jsonp: 'callback',
		                jsonpCallback: 'jsonpCallbackProductoDetalle',
			          	async:false,
			          	success: function( data, textStatus, jqXHR) {
			          		if(data.success){
			          			jsonpCallbackProductoDetalle(data,datosProductos)
			          		}
			          	}    
			        });
			          
					    	
	        	  function jsonpCallbackProductoDetalle(data,datosProductos) {
				    	datosProductosDetalle = data;
				    	
				    	for(var d = 0; d < datosProductos.producto.length; d++){
				    		
				    		for(var f = 0; f < datosProductosDetalle.productos.length; f++){
				    			if(datosProductosDetalle.productos[f].codigoCatalogo == datosProductos.producto[d].producto_id){
							          var option = document.createElement('option');
							          option.setAttribute('value', datosProductosDetalle.productos[f].codigoCatalogo);
							          option.setAttribute('label', datosProductosDetalle.productos[f].nombreCatalogo);
							          datalistProductos.appendChild(option);  
				    			}
				    		}
				    	}
    
				    }
			        	  
			      	  
			    	
			    }//fin primer callback
		    }
		    
		    this.producto = function(){
			    //var linkNivel = document.getElementById("nivel-formulario").value;
			    //var linkEntidad = document.getElementById("entidad-formulario").value;
		    	//var linkNivel = 12;
		      	//var linkEntidad = 1;
		      	var linkNivel = nivelIdCas;
		      	var linkEntidad = entidadIdCas;
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
				         	 url:'http://spr.stp.gov.py/ajaxSelects?accion=getAsignacionPresiVersion&nivel='+nivelIdCas+'&entidad='+entidadIdCas+'&tipo='+linkTipoPrograma+'&programa='+linkPrograma+'&subPrograma='+linkSubPrograma+'&proyecto='+linkProyecto+'&producto='+linkProducto,
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
		
		var unidadMedida = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getUnidadMedida',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		unidadMedida = JSON.parse(unidadMedida);
		var nombreUnidadMedidaAccion;

		
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
			
			if (accion[a].borrado == false){
				cuerpoAccion +="<tr><td class='text-center'>"+catalogoAccion[0].nombre+"</td>";
				}else{
					cuerpoAccion +="<tr><td class='text-center'><del>"+catalogoAccion[0].nombre+"</del></td>";
				}
			
			for(var d = 0; d < 18; d++)
			{
				if(accion[a].departamentoId == departamentos[d].idDepartamento){
					nombreDepartamento = departamentos[d].nombreDepartamento;
					if (accion[a].borrado == false){
					cuerpoAccion +="<td class='text-center'>"+nombreDepartamento+"</td>";
					}else{
						cuerpoAccion +="<td class='text-center'><del>"+nombreDepartamento+"</del></td>";
					}
				}
			}
			

			for(var e = 0; e < distritos.length; e++)
			{
				if(accion[a].distritoId == distritos[e].id && accion[a].departamentoId == distritos[e].departamentoId){
					nombreDistrito = distritos[e].descripcion;
					
					if (accion[a].borrado == false){
					cuerpoAccion +="<td class='text-center'>"+nombreDistrito+"</td>";
					}else{
						cuerpoAccion +="<td class='text-center'><del>"+nombreDistrito+"<del></td>";
					}
				}
			}
			
			for(var u = 0; u < unidadMedida.length; u++)
			{
				if(catalogoAccion[0].idUnidadMedida == unidadMedida[u].id){
					nombreUnidadMedidaAccion = unidadMedida[u].descripcion;
				}
			}
			


			
			if(accion[a].borrado == false){	
				cuerpoAccion +="<td class='text-center'>"+accion[a].fechaInicio+"</td><td class='text-center'>"+accion[a].fechaFin+"</td><td class='text-center'>"+nombreUnidadMedidaAccion+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[a].meta1).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[a].meta2).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[a].meta3).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[a].meta4).toFixed(2))+"</td><td class='text-center'><button type='button' class='btn btn-default btn-sm' data-toggle='tooltip' data-placement='top' title='Vincular Acción a Productos Presupuestarios' disabled='disabled'><span class='modalVincularProducto' parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+">Gs</span></button><button type='button' class='btn btn-default btn-sm'><span class='glyphicon glyphicon-time agregarActividad' parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+"-"+accion[a].accionCatalogoId+"></span></button><button type='button' class='btn btn-default btn-sm editarAccion' parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+"-"+accion[a].accionCatalogoId+" data-toggle='tooltip' data-placement='top' title='Editar Acción'><span class='glyphicon glyphicon-pencil'></span></button><button type='button' class='btn btn-default btn-sm consultaBorrarAccion'  parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+"-"+accion[a].accionCatalogoId+" data-toggle='tooltip' data-placement='top' title='Borrar Acción'><span class='glyphicon glyphicon-trash'></span></button></td></tr>";
				
			}else{
				cuerpoAccion +="<td class='text-center'><del>"+accion[a].fechaInicio+"</del></td><td class='text-center'><del>"+accion[a].fechaFin+"</del></td><td class='text-center'><del>"+nombreUnidadMedidaAccion+"</del></td><td class='text-center'><del>"+numeroConComa(parseFloat(accion[a].meta1).toFixed(2))+"</del></td><td class='text-center'><del>"+numeroConComa(parseFloat(accion[a].meta2).toFixed(2))+"</del></td><td class='text-center'><del>"+numeroConComa(parseFloat(accion[a].meta3).toFixed(2))+"</del></td><td class='text-center'><del>"+numeroConComa(parseFloat(accion[a].meta4).toFixed(2))+"</del></td><td class='text-center'><button type='button' class='btn btn-default btn-sm' data-toggle='tooltip' data-placement='top' title='Vincular Acción a Productos Presupuestarios'><span class='modalVincularProducto' parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+">Gs.</span></button><button type='button' class='btn btn-default btn-sm'><span class='glyphicon glyphicon-time agregarActividad' parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+"-"+accion[a].accionCatalogoId+"></span></button><button type='button' class='btn btn-default btn-sm editarAccion' parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+"-"+accion[a].accionCatalogoId+" data-toggle='tooltip' data-placement='top' title='Editar Acción'><span class='glyphicon glyphicon-pencil'></span></button><button type='button' class='btn btn-default btn-sm consultaBorrarAccion'  parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+"-"+accion[a].accionCatalogoId+" data-toggle='tooltip' data-placement='top' title='Borrar Acción'><span class='glyphicon glyphicon-trash'></span></button></td></tr>";
				
			}
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
		if ( $("#modalAccion").length )
		{
			$("#modalAccion").remove();
		}	
		if ( $("#modalProgramacion").length )
		{
			$("#modalProgramacion").remove();
		}
		if ( $("#modalAvance").length )
		{
			$("#modalAvance").remove();
		}	
		if ( $("#modalEditarCronograma").length )
		{
			$("#modalEditarCronograma").remove();
		}
		if ( $("#modalBorrarCronograma").length )
		{
			$("#modalBorrarCronograma").remove();
		}
				
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-");    
	    var insLineaAccionId = idParsed[0];
	    var lineaAccionId = idParsed[1];
	    var institucionId = idParsed[2];
	    var periodoId = idParsed[3];    
	    var accionId = idParsed[4];
	    var accionCatalogoId = idParsed[5];
				
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
		
		var actividades = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getCronograma&accionId='+accionId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		actividades = JSON.parse(actividades);
		
		var accion = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAccion&accionId='+accionId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		accion = JSON.parse(accion);
		
		var accionCatalogo = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAccionCatalogo&catalogoAccionId='+accion[0].accionCatalogoId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		accionCatalogo = JSON.parse(accionCatalogo);
		
				
		
		var cuerpoActividad = "";
		
		for(var u = 0; u < actividades.length; u++)
		{
			var nombreUnidadMedida = "";
			var nombreHitoTipo = "";
			for(var x = 0; x < unidadMedida.length; x++)
			{
				if(unidadMedida[x].id == actividades[u].unidad_medida_id)
				{
					nombreUnidadMedida = unidadMedida[x].descripcion;
				}
			}
			
			for(var l = 0; l < hitoTipo.length; l++)
			{
				if(hitoTipo[l].id == actividades[u].hito_tipo_id)
				{
					nombreHitoTipo = hitoTipo[l].nombre;
				}
			}
			
			
			if(actividades[u].borrado == false)
			{
				cuerpoActividad+='<tr><td>'+actividades[u].nombre+'</td><td>'+actividades[u].descripcion+'</td><td>'+nombreUnidadMedida+'</td><td>'+nombreHitoTipo+'</td><td>'+actividades[u].proporcion+'</td><td>'+actividades[u].version+'</td><td><button type="button" class="btn btn-default btn-sm editarCronograma" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accion[0].id+'-'+accion[0].accionCatalogoId+'-'+actividades[u].id+' data-toggle="tooltip" data-placement="top" title="Editar Cronograma"><span class="glyphicon glyphicon-pencil" ></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarCronograma" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accion[0].id+'-'+accion[0].accionCatalogoId+'-'+actividades[u].id+'><span class="glyphicon glyphicon-trash" </span></button><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="Agregar Hito"><span class="glyphicon glyphicon-time agregarProgramacion" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividades[u].id+'></span></button><button type="button" class="btn btn-default btn-sm agregarAvance" data-toggle="tooltip" data-placement="top" title="Declarar Avance" parametros="'+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividades[u].id+'"><span class="fa fa-line-chart"></span></button></td></tr>';
			}else{
				cuerpoActividad+='<tr><td><del>'+actividades[u].nombre+'</del></td><td><del>'+actividades[u].descripcion+'</del></td><td><del>'+nombreUnidadMedida+'</del></td><td><del>'+nombreHitoTipo+'</del></td><td><del>'+actividades[u].proporcion+'</del></td><td><del>'+actividades[u].version+'</del></td><td><button type="button" class="btn btn-default btn-sm editarCronograma" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accion[0].id+'-'+accion[0].accionCatalogoId+'-'+actividades[u].id+' data-toggle="tooltip" data-placement="top" title="Editar Cronograma"><span class="glyphicon glyphicon-pencil" ></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarCronograma" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accion[0].id+'-'+accion[0].accionCatalogoId+'-'+actividades[u].id+'><span class="glyphicon glyphicon-trash" </span></button><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="Agregar Hito"><span class="glyphicon glyphicon-time agregarProgramacion" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividades[u].id+'></span></button><button type="button" class="btn btn-default btn-sm agregarAvance" data-toggle="tooltip" data-placement="top" title="Declarar Avance" parametros="'+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividades[u].id+'"><span class="fa fa-line-chart"></span></button></td></tr>';
			}
		}
		
		
		//var optionTipoHito='<option value="0" parametro="0">Entregable</option><option value="1" parametro="1">Intermedio</option><option value="2" parametro="2">Autonomo</option>';

		
		var cuerpoModalActividades = "";

		cuerpoModalActividades +=	'<div class="modal fade" id="modalActividad" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+' tabindex="-1" aria-labelledby="myLargeModalLabel">'+
		'	<div class="modal-dialog modal-lg" style="width:90%">'+
		'		<div class="modal-content" >'+
		'			<div class="modal-header">'+
		'		        <button type="button" class="close agregarAccion" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'  aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
		'		        <h4 class="modal-title">'+accionCatalogo[0].nombre+'</h4>'+   
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
		'								<input type="hidden" id="versionActividad" class="form-control" placeholder="Ingrese Versión" value="3"/><input type="hidden" id="accionIdActividad" class="form-control" placeholder="Ingrese Accion Id" value="'+accionId+'" />'+
		'								</form>'+
		'               			</div>'+//fin box-body
		'							<div class="modal-footer">'+
		'								<button type="button" class="btn btn-success btn-sm guardarActividad" parametros = '+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'>Guardar Cronograma</button>'+
		'							</div>'+
		'                		</div>'+	
		'                	</div>'+
		'                </div>'+											
						
		'		      	<div class="row">'+ 
		'		      		<div class="col-md-12">'+
		'						<div class="box box-warning">'+
		'		                	<div class="box-header with-border">'+
		'		                  		<h3 class="box-title">Lista de Cronogramas</h3>'+
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
		'	                						<tr class="active"><th class="text-center">Nombre</th><th class="text-center">Descripción</th><th class="text-center">Unidad Medida</th><th class="text-center">Tipo Cronograma</th><th class="text-center">Proporción</th><th class="text-center">Versión</th><th class="text-center">Administrar Cronograma</th></tr>'+
		'	                					</thead>'+
		'	                						<tbody id="tablaActividades">'+
		'	                						</tbody>'+
		'	                				</table>'+
		'	                			</div>'+		                			

		'               			</div>'+//fin box-body
		'                		</div>'+	
		'                	</div>'+
		'                </div>'+
		

		'		    </div>'+
		'			<div class="modal-footer">'+
		'				<button type="button" class="btn btn-success btn-sm agregarAccion" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'>Cerrar</button>'+
		
      	'			</div>'+														
		'		</div>'+ 
		'	</div>'+
		'</div>'; 

		$("body").append(cuerpoModalActividades);
		$('#tablaActividades').html("");
		$('#tablaActividades').append(cuerpoActividad);
		$("#modalActividad").modal('show');
		
	});
	
	
$("body").on("click", ".editarCronograma", function(event){
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");    
    var insLineaAccionId = idParsed[0];
    var lineaAccionId = idParsed[1];
    var institucionId = idParsed[2];
    var periodoId = idParsed[3];    
    var accionId = idParsed[4];
    var accionCatalogoId = idParsed[5];
    var cronogramaId = idParsed[6];
    
	if ( $("#modalEditarCronograma").length )
	{
		$("#modalEditarCronograma").remove();
	}
	if ( $("#modalActividad").length )
	{
		$("#modalActividad").remove();
	}

	
	var actividades = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getCronograma&cronogramaId='+cronogramaId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	actividades = JSON.parse(actividades);
	
	
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
	for(var h = 0; h < hitoTipo.length; h++)
	{
		optionTipoHito+='<option value="'+hitoTipo[h].id+'" parametro="'+hitoTipo[h].id+'">'+hitoTipo[h].nombre+'</option>';
	}
	
	var cuerpoModalEditarCronograma = "";
	cuerpoModalEditarCronograma =	'<div class="modal fade" id="modalEditarCronograma" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
						'	<div class="modal-dialog modal-lg" style="width:90%">'+
						'		<div class="modal-content" >'+
						'			<div class="modal-header">'+
						'		        <button type="button" class="close agregarActividad"  data-dismiss="modal" aria-label="Close" parametros ='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+accionCatalogoId+'><span aria-hidden="true">&times;</span></button>'+
						'			</div>'+
						'						<div class="box box-danger">'+
						'		                	<div class="box-header with-border">'+//box-header
						'		                  		<h3 class="box-title">Editar Cronograma</h3>'+
						'	                  			<div class="box-tools pull-right">'+
						'				                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>'+
						'		                    		</button>'+
						'		                  		</div>'+
						'               			</div>'+//fin box-header
						'		    <div class="modal-body" >'+

						'								<div class="table-responsive">'+
						'									<table class="table table-hover">'+
						'										<tbody>'+
						'			      							<form class="form-horizontal" role="form">'+
						'												<tr><td><label for="nombreCronograma">Nombre</label><input type="text" id="nombreCronograma" value="'+actividades[0].nombre+'" class="form-control" /></td><td><label for="descripcionCronograma">Descripcion</label><input type="text" id="descripcionCronograma" class="form-control" value="'+actividades[0].descripcion+'"  /></td></tr>'+
						'												<tr><td><div class="form-group"><label for="unidadMedidaIdCronograma">Unidad de Medida</label><select id="selectorUnidadMedidaCronograma" class="form-control">'+optionUnidadMedida+'</div></td><td><div class="form-group"><label for="hitoTipoIdCronograma">Tipo Cronograma</label><select id="selectorHitoTipoIdCronograma" class="form-control">"'+optionTipoHito+'"</div></td></tr>'+
						'												<tr><td><label for="proporcionCronograma">Proporción</label><input type="text" id="proporcionCronograma" value='+actividades[0].proporcion+' class="form-control" /></td><td><label for="versionCronograma">Versión</label><input type="text" id="versionCronograma" class="form-control" value='+actividades[0].version+'  /></td></tr>'+
						'			      							</form>	'+												
						'										</tbody>'+
						'									</table>'+
						'				      			</div>'+
												
						'		    </div>'+//fin modal-body
						'			<div class="modal-footer">'+					
						'				<button type="button" class="btn btn-success btn-sm actualizarCronograma" parametros ='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+accionCatalogoId+'-'+cronogramaId+'>Actualizar Cronograma</button>'+
						'				<button type="button" class="btn btn-success btn-sm agregarActividad" parametros ='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+accionCatalogoId+'>Cerrar</button>'+
						
						'			</div>'+
						'		</div>'+ 
						'	</div>'+
						'</div>';
						
		$("#programacion").append(cuerpoModalEditarCronograma);
		$('#selectorUnidadMedidaCronograma > option[value="'+actividades[0].unidad_medida_id+'"]').attr('selected', 'selected');
		$('#selectorHitoTipoIdCronograma > option[value="'+actividades[0].hito_tipo_id+'"]').attr('selected', 'selected');	

		$('#modalEditarCronograma').modal('show');		
	
	
	
});


//consulta para borrar cronograma
$("body").on("click", ".consultaBorrarCronograma",function(event){
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");    
    var insLineaAccionId = idParsed[0];
    var lineaAccionId = idParsed[1];
    var institucionId = idParsed[2];
    var periodoId = idParsed[3];    
    var accionId = idParsed[4];
    var accionCatalogoId = idParsed[5];
    var cronogramaId = idParsed[6];
    
	if ( $("#modalBorrarCronograma").length )
	{
		$("#modalBorrarCronograma").remove();
	}		
	if ( $("#modalActividad").length )
	{
		$("#modalActividad").remove();
	}		

   
	var actividades = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getCronograma&cronogramaId='+cronogramaId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	actividades = JSON.parse(actividades);
   
	
	
	var contenido = "";

	contenido =			'<div class="modal fade" id="modalBorrarCronograma"  data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
						'	<div class="modal-dialog modal-lg">'+
						'		<div class="modal-content" >'+
						'			<div class="modal-header">'+
						'		        <button type="button" class="close agregarActividad"  parametros ='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+accionCatalogoId+' aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
						'		        <h4 class="modal-title">Borrar - Reestablecer Cronograma</h4>'+
						'			</div>'+
						'		    <div class="modal-body" >'+
						'			<div id="mensajeBorradoCronograma"></div>'+
						'		    </div>'+
						'			<div class="modal-footer" id="pieCronograma">'+
						'			</div>'+
						'		</div>'+ 
						'	</div>'+
						'</div>';
						
		$("#programacion").append(contenido);
		if(actividades[0].borrado == true){
			$("#mensajeBorradoCronograma").html("");
			$("#mensajeBorradoCronograma").append("<h3 class='text-center'>Ud esta seguro que desea RESTAURAR <strong>"+actividades[0].nombre+"</strong></h3>");
			
			$("#pieCronograma").html("");
			$("#pieCronograma").append("<button type='button' class='btn btn-success btn-sm borrarCronograma' id='botonRestaurarCronograma' parametros="+cronogramaId+"-r>Restaurar Cronograma</button>");
			$("#pieCronograma").append("<button type='button' class='btn btn-success btn-sm agregarActividad'  parametros ="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accionId+"-"+accionCatalogoId+">Cerrar</button>");
		}else{
			$("#mensajeBorradoCronograma").html("");
			$("#mensajeBorradoCronograma").append("<h3 class='text-center'>Ud esta seguro que desea BORRAR <strong>"+actividades[0].nombre+"</strong></h3>");
			
			$("#pieCronograma").html("");
			$("#pieCronograma").append("<button type='button' class='btn btn-danger btn-sm borrarCronograma' id='botonBorrarCronograma' parametros="+cronogramaId+"-b>Borrar Cronograma</button>");
			$("#pieCronograma").append("<button type='button' class='btn btn-success btn-sm agregarActividad'  parametros ="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accionId+"-"+accionCatalogoId+">Cerrar</button>");
		}
		$('#modalBorrarCronograma').modal('show');
    
	
					
});

//borrar cronograma
$("body").on("click", ".borrarCronograma",function(event){	
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-"); 
    var cronogramaId = idParsed[0];
    var estatus = idParsed[1];
    
	var actividades = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getCronograma&cronogramaId='+cronogramaId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	actividades = JSON.parse(actividades);
    
    var objeto = new Object();
    objeto.id = cronogramaId;
    objeto.borrado= actividades[0].borrado;

    
  	var info = JSON.stringify(objeto);
    $.ajax({
        url: "ajaxUpdate2?accion=borradoCronograma",
        type: 'POST',
        dataType: 'json',
        data: info,
        contentType: 'application/json',
        mimeType: 'application/json',
        success: function (data) {
        	
            if(estatus == "b"){
            	$("#botonBorrarCronograma").remove();
            	$("#mensajeBorradoCronograma").html("");
            	$("#mensajeBorradoCronograma").html("<h3 class='text-center'>Borrado Exitosamente!!</h3>");
            }else{
            	$("#botonRestaurarCronograma").remove();
            	$("#mensajeBorradoCronograma").html("");
            	$("#mensajeBorradoCronograma").html("<h3 class='text-center'>Restaurado Exitosamente!!</h3>");
            }
        	
        },

        error: function(data,status,er) {
        	
        	}
	 });

	
});







$("body").on("click", ".actualizarCronograma", function(event){
	
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");    
    var insLineaAccionId = idParsed[0];
    var lineaAccionId = idParsed[1];
    var institucionId = idParsed[2];
    var periodoId = idParsed[3];    
    var accionId = idParsed[4];
    var accionCatalogoId = idParsed[5];
    var cronogramaId = idParsed[6];

    
    
    var cronogramaId = cronogramaId;
    var nombreCronograma = $("#nombreCronograma").val();
    var descripcionCronograma = $("#descripcionCronograma").val();
    var unidadMedidaCronograma =  $("#selectorUnidadMedidaCronograma option:selected").val();
    var tipoCronograma = $("#selectorHitoTipoIdCronograma option:selected").val();
    var proporcionCronograma = $("#proporcionCronograma").val();
    var versionCronograma = $("#versionCronograma").val();
    
    //aca vacï¿½o el formulario de ediciï¿½n de cronograma
    $("#nombreCronograma").val('');
    $("#descripcionCronograma").val('');
    $("#selectorUnidadMedidaCronograma").val('');
    $("#selectorHitoTipoIdCronograma").val('');
    $("#proporcionCronograma").val('');
    $("#versionCronograma").val('');
    

    
    var datos = new Object();
    datos.id = cronogramaId;
    datos.nombre = nombreCronograma;
    datos.descripcion = descripcionCronograma;
    datos.unidad_medida_id = unidadMedidaCronograma;
    datos.hito_tipo_id = tipoCronograma;
    datos.proporcion = proporcionCronograma;
    datos.version = versionCronograma;

    
  	var info = JSON.stringify(datos);
    $.ajax({
        url: "ajaxUpdate2?accion=actCronograma",
        type: 'POST',
        dataType: 'json',
        data: info,
        contentType: 'application/json',
        mimeType: 'application/json',
        success: function (data) {
        	},

        error: function(data,status,er) {
        	}
	 });
 
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
		
		objeto.nombre = nombre;
		objeto.descripcion = descripcion;
		objeto.proporcion = proporcion;
		objeto.peso = peso;
		objeto.version = version;
		objeto.accion_id = accion_id;
		objeto.unidad_medida_id = unidad_medida_id;
		objeto.hito_tipo_id = hito_tipo_id;
		
	  	var info = JSON.stringify(objeto);
	    $.ajax({
	        url: "ajaxInserts2?accion=insActividad",
	        type: 'POST',
	        dataType: 'json',
	        data: info,
	        contentType: 'application/json',
	        mimeType: 'application/json',
	        success: function (data) {
	        	actualizarTablaActividades(accion_id,insLineaAccionId,lineaAccionId,institucionId,periodoId);
	        	},
	        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
	        error: function(data,status,er) {
	        	actualizarTablaActividades(accion_id,insLineaAccionId,lineaAccionId,institucionId,periodoId);
	        	}
		 });
		
});	

function actualizarTablaActividades(accion_id,insLineaAccionId,lineaAccionId,institucionId,periodoId){
	var accionId = accion_id;
	var insLineaAccionId = insLineaAccionId;
	var lineaAccionId = lineaAccionId;
	var institucionId = institucionId;
	var periodoId = periodoId;
	
	
	var actividades = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getCronograma&accionId='+accionId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	actividades = JSON.parse(actividades);
	
	var unidadMedida = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getUnidadMedida',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	unidadMedida = JSON.parse(unidadMedida);

	var hitoTipo = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getHitoTipo',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	hitoTipo = JSON.parse(hitoTipo);
	
	var accion = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAccion&accionId='+accionId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	accion = JSON.parse(accion);
	
	var accionCatalogo = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAccionCatalogo&catalogoAccionId='+accion[0].accionCatalogoId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	accionCatalogo = JSON.parse(accionCatalogo);
	
	
	var cuerpoActividad = "";
	
	for(var u = 0; u < actividades.length; u++)
	{
		var nombreUnidadMedida = "";
		var nombreHitoTipo = "";
		for(var x = 0; x < unidadMedida.length; x++)
		{
			if(unidadMedida[x].id == actividades[u].unidad_medida_id)
			{
				nombreUnidadMedida = unidadMedida[x].descripcion;
			}
		}
		
		for(var l = 0; l < hitoTipo.length; l++)
		{
			if(hitoTipo[l].id == actividades[u].hito_tipo_id)
			{
				nombreHitoTipo = hitoTipo[l].nombre;
			}
		}
		
		
		if(actividades[u].borrado == false)
		{
			cuerpoActividad+='<tr><td>'+actividades[u].nombre+'</td><td>'+actividades[u].descripcion+'</td><td>'+nombreUnidadMedida+'</td><td>'+nombreHitoTipo+'</td><td>'+actividades[u].proporcion+'</td><td>'+actividades[u].version+'</td><td><button type="button" class="btn btn-default btn-sm editarCronograma" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accion[0].id+'-'+accion[0].accionCatalogoId+'-'+actividades[u].id+' data-toggle="tooltip" data-placement="top" title="Editar Cronograma"><span class="glyphicon glyphicon-pencil" ></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarCronograma" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accion[0].id+'-'+accion[0].accionCatalogoId+'-'+actividades[u].id+'><span class="glyphicon glyphicon-trash" </span></button><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="Agregar Hito"><span class="glyphicon glyphicon-time agregarProgramacion" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividades[u].id+'></span></button><button type="button" class="btn btn-default btn-sm agregarAvance" data-toggle="tooltip" data-placement="top" title="Declarar Avance" parametros="'+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividades[u].id+'"><span class="fa fa-line-chart"></span></button></td></tr>';
		}else{
			cuerpoActividad+='<tr><td><del>'+actividades[u].nombre+'</del></td><td><del>'+actividades[u].descripcion+'</del></td><td><del>'+nombreUnidadMedida+'</del></td><td><del>'+nombreHitoTipo+'</del></td><td><del>'+actividades[u].proporcion+'</del></td><td><del>'+actividades[u].version+'</del></td><td><button type="button" class="btn btn-default btn-sm editarCronograma" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accion[0].id+'-'+accion[0].accionCatalogoId+'-'+actividades[u].id+' data-toggle="tooltip" data-placement="top" title="Editar Cronograma"><span class="glyphicon glyphicon-pencil" ></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarCronograma" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accion[0].id+'-'+accion[0].accionCatalogoId+'-'+actividades[u].id+'><span class="glyphicon glyphicon-trash" </span></button><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="Agregar Hito"><span class="glyphicon glyphicon-time agregarProgramacion" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividades[u].id+'></span></button><button type="button" class="btn btn-default btn-sm agregarAvance" data-toggle="tooltip" data-placement="top" title="Declarar Avance" parametros="'+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividades[u].id+'"><span class="fa fa-line-chart"></span></button></td></tr>';
		}		
	}
	
	$('#tablaActividades').html("");
	$('#tablaActividades').append(cuerpoActividad);
	
	$("#nombreActividad").val('');
	$("#descripcionActividad").val('');
	$("#unidadMedidaIdActividad").val('');
	$("#hitoTipoIdActividad").val('');
	$("#proporcionActividad").val('');
	$("#pesoActividad").val('');
		
}

$("body").on("click", ".agregarProgramacion",function(event){
	
	if ( $("#modalActividad").length )
	{
		$("#modalActividad").remove();
	}	
	if ( $("#modalAccion").length )
	{
		$("#modalAccion").remove();
	}	
	
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");                                                            
	
	//Las siguentes 4 variables se utiliza en esta funcion para redibujar el modal anterior
	var insLineaAccionId = idParsed[0];
	var lineaAccionId = idParsed[1];
	var institucionId = idParsed[2];
	var periodoId = idParsed[3];
	var accionId = idParsed[4];
	var cronogramaId = idParsed[5];

	
	var cronogramas = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getCronograma&cronogramaId='+cronogramaId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	cronogramas = JSON.parse(cronogramas);
	
	var programacionWebService = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getProgramacion&actividadId='+cronogramaId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	programacionWebService = JSON.parse(programacionWebService);
	
	var hitoTipo = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getHitoTipo',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	hitoTipo = JSON.parse(hitoTipo);
	
	var accion = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAccion&accionId='+accionId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	accion = JSON.parse(accion);
	
	var accionCatalogo = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAccionCatalogo&catalogoAccionId='+accion[0].accionCatalogoId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	accionCatalogo = JSON.parse(accionCatalogo);
	
	var unidadMedida = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getUnidadMedida',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	unidadMedida = JSON.parse(unidadMedida);
	
	var lineaAccion = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getLineaAccion&lineaAccionId='+lineaAccionId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	lineaAccion = JSON.parse(lineaAccion)
	
	var periodo = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getPeriodo&&periodoId='+periodoId,
  		type:'get',
  		dataType:'json',
  		async:false       
	}).responseText;
	periodo = JSON.parse(periodo);
	
	var nombreUnidadMedida="";
	for(var f = 0; f < unidadMedida.length; f++ )
	{
		if(accionCatalogo[0].idUnidadMedida == unidadMedida[f].id)
		{
			nombreUnidadMedida = unidadMedida[f].descripcion;
		}
	}
	
	var nombreHitoTipo ="";
	for(var l = 0; l < hitoTipo.length; l++)
	{
		if(hitoTipo[l].id == cronogramas[0].hito_tipo_id)
		{
			nombreHitoTipo = hitoTipo[l].nombre;
		}
	}
	
	var cuerpoActividades ="";
	for(var n = 0; n < programacionWebService.length; n++)
	{
		cuerpoActividades += "<tr><td>"+programacionWebService[n].cantidad+"</td><td>"+programacionWebService[n].fechaEntrega+"</td><td>"+programacionWebService[n].version+"</td><td>"+cronogramas[0].nombre+"</td>";
	}
	

	
	var modalProgramacion = "";

	modalProgramacion += '<div class="modal fade" id="modalProgramacion" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
							'	<div class="modal-dialog modal-lg" style="width:90%">'+
							'		<div class="modal-content" >'+
							'			<div class="modal-header">'+
							'		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="agregarActividad" parametros="'+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'">&times;</span></button>'+
							'		        <h4 class="modal-title">Programación de '+accionCatalogo[0].nombre+' ('+lineaAccion[0].nombre+' - '+periodo[0].nombre+')</h4>'+ 
							'			</div>'+
							'		    <div class="modal-body">'+
							'		      	<div class="row">'+ 
							'		      		<div class="col-md-12">'+
							'						<div class="box box-warning">'+
							'		                	<div class="box-header with-border">'+
							'		                  		<h3 class="box-title">Programar hitos</h3>'+
							'	                  			<div class="box-tools pull-right">'+
							'				                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>'+
							'		                    		</button>'+
							'		                    		<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i>'+
							'		                    		</button>'+
							'		                  		</div>'+
							'               			</div>'+//fin box-heder
							'               			<div class="box-body">'+
							
							'								<div class="table-responsive">'+
							'									<table class="table table-hover">'+
							'										<tbody>'+
							'			      							<form class="form-horizontal" role="form">'+
							'											<tr><td><label for="accionProgramacion">Accion</label><input type="text" id="accionProgramacion" value="'+accionCatalogo[0].nombre+'" class="form-control" disabled /></td><td><label for="unidadMedidaProgramacion">U. Medida</label><input type="text" id="unidadMedidaProgramacion" class="form-control" value="'+nombreUnidadMedida+'" disabled /></td></tr>'+
							'											<tr><td><label for="cronogramaProgramacion">Cronograma</label><input type="text" id="cronogramaProgramacion" value="'+cronogramas[0].nombre+'" class="form-control" disabled /><input type="hidden" id="cronogramaIdProgramacion" value="'+cronogramas[0].id+'" /></td><td><label for="tipoCronogramaProgramacion">Tipo Cronograma</label><input type="text" id="tipoCronogramaProgramacion" class="form-control" value="'+nombreHitoTipo+'" disabled /></td></tr>'+														
							'											<tr><td><label for="cantidadProgramacion">Cantidad</label><input type="text" id="cantidadProgramacion" value="" class="form-control" placeholder="Ingres Cantidad" /></td><td><label for="fechaEntregaProgramacion">Fecha Entrega</label><input type="date" id="fechaEntregaProgramacion" class="form-control" /></td></tr>'+
							'											<input type="hidden" id="versionProgramacion" value="3" /><input type="hidden" id="actividadIdProgramacion" value="'+cronogramaId+'" />'+		
							'			      							</form>	'+												
							'										</tbody>'+
							'									</table>'+
							'				      			</div>'+
							
							'               			</div>'+//fin box-body
							'							<div class="modal-footer">'+ 
							'					        	<button type="button" class="btn btn-success guardarProgramacion" >Guardar</button>'+ 
							'					          	<button type="button" class="btn btn-success agregarActividad" data-dismiss="modal" parametros="'+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'">Cerrar</button>'+ 
							'							</div>'+
							'                		</div>'+	
							'                	</div>'+
							'                </div>'+											
											
							'		      	<div class="row">'+ 
							'		      		<div class="col-md-12">'+
							'						<div class="box box-warning">'+
							'		                	<div class="box-header with-border">'+
							'		                  		<h3 class="box-title">Hitos Programados</h3>'+
							'	                  			<div class="box-tools pull-right">'+
							'				                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>'+
							'		                    		</button>'+
							'		                    		<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i>'+
							'		                    		</button>'+
							'		                  		</div>'+
							'               			</div>'+//fin box-heder
							'               			<div class="box-body">'+	 
							
							'								<div class="table-responsive">'+
							'									<table class="table table-hover table-bordered">'+
							'										<thead><tr class="active"><th>Cantidad</th><th>FechaEntrega</th><th>Versión</th><th>Cronograma</th></tr>'+
							'										<tbody id="listaActividades">'+
							'										</tbody>'+
							'									</table>'+
							'								</div>';
					
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

	$("body").append(modalProgramacion);
	$("#listaActividades").append(cuerpoActividades);
	$("#modalProgramacion").modal('show');
});	

$("body").on("click", ".guardarProgramacion",function(event){
		
	var cantidad = $("#cantidadProgramacion").val();
	var fechaEntrega = $("#fechaEntregaProgramacion").val();
	var version = $("#versionProgramacion").val();
	var actividadId = $("#actividadIdProgramacion").val();
	var cronogramaId = $("#cronogramaIdProgramacion").val();
	
	//Vaciar el input
	$("#cantidadProgramacion").val('');
	$("#fechaEntregaProgramacion").val('');
	
	var objeto = new Object();
	
	objeto.cantidad = cantidad;
	objeto.fechaEntrega = fechaEntrega;
	objeto.actividad = actividadId;
	objeto.version = version;

	
  	var info = JSON.stringify(objeto);
    $.ajax({
        url: "ajaxInserts2?accion=insProgramacion",
        type: 'POST',
        dataType: 'json',
        data: info,
        contentType: 'application/json',
        mimeType: 'application/json',
        success: function (data) {
        	
        	if(data.success == true)
        	{
        		var programacion = $.ajax({
        			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getProgramacion&actividadId='+actividadId,
        		  	type:'get',
        		  	dataType:'json',
        		  	async:false       
        		}).responseText;
        		programacion = JSON.parse(programacion);
        		
        		var cronogramas = $.ajax({
        			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getCronograma&cronogramaId='+cronogramaId,
        		  	type:'get',
        		  	dataType:'json',
        		  	async:false       
        		}).responseText;
        		cronogramas = JSON.parse(cronogramas);
        		
        		var registroProgramacion="";
        		for(var j = 0; j < programacion.length; j++)
        		{
        			registroProgramacion += "<tr><td>"+programacion[j].cantidad+"</td><td>"+programacion[j].fechaEntrega+"</td><td>"+programacion[j].version+"</td><td>"+cronogramas[0].nombre+"</td>";
        		}
        		
									
        		$("#listaActividades").html("");
        		$("#listaActividades").append(registroProgramacion);

        		
        	}else{
        		alert("ERROR");
        	}
        	},
        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
        error: function(data,status,er) {
        	
        	}
	 });

});	

$("body").on("click", ".agregarAvance",function(event){
	
	if ( $("#modalVincularProductos").length )
	{
		$("#modalVincularProductos").remove();
	}	
	if ( $("#modalActividad").length )
	{
		$("#modalActividad").remove();
	}	
	if ( $("#modalAccion").length )
	{
		$("#modalAccion").remove();
	}	
	if ( $("#modalProgramacion").length )
	{
		$("#modalProgramacion").remove();
	}	
	if ( $("#modalAvance").length )
	{
		$("#modalAvance").remove();
	}	
	if ( $("#modalAdministrador").length )
	{
		$("#modalAdministrador").remove();
	}	
	
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");                                                            
	
	//Las siguentes 4 variables se utiliza en esta funcion para redibujar el modal anterior
	var insLineaAccionId = idParsed[0];
	var lineaAccionId = idParsed[1];
	var institucionId = idParsed[2];
	var periodoId = idParsed[3];
	var accionId = idParsed[4];
	var actividadId = idParsed[5];//es el id de la tabla actidad
	
	var webServicesAvance = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAvance&actividadId='+actividadId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesAvance = JSON.parse(webServicesAvance); 
	
	var cuerpoAvance = "";
	for(var d = 0; d < webServicesAvance.length; d++)
	{
		cuerpoAvance += '<tr><td>'+webServicesAvance[d].justificacion+'</td><td>'+webServicesAvance[d].cantidad+'</td><td>'+webServicesAvance[d].fechaEntrega+'</td><td>'+webServicesAvance[d].cantidadBeneficiarios+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm agregarModalAdministrador" data-toggle="tooltip" data-placement="top" title="Administrar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+webServicesAvance[d].id+'><span class="fa fa-gear"></span></button></td></tr>';
	}
		
	var modalAvance = "";

	modalAvance += '<div class="modal fade" id="modalAvance" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
							'	<div class="modal-dialog modal-lg" style="width:90%">'+
							'		<div class="modal-content" >'+
							'			<div class="modal-header">'+
							'		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="agregarActividad" parametros="'+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'" >&times;</span></button>'+
							'		        <h4 class="modal-title">Avance</h4>'+ 
							'			</div>'+
							'		    <div class="modal-body">'+
							'		      	<div class="row">'+ 
							'		      		<div class="col-md-12">'+
							'						<div class="box box-warning">'+
							'		                	<div class="box-header with-border">'+
							'		                  		<h3 class="box-title">Agregar Avance</h3>'+
							'	                  			<div class="box-tools pull-right">'+
							'				                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>'+
							'		                    		</button>'+
							'		                    		<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i>'+
							'		                    		</button>'+
							'		                  		</div>'+
							'               			</div>'+//fin box-heder
							'               			<div class="box-body">'+
							
							'								<div class="table-responsive">'+
							'									<table class="table table-hover">'+
							'										<tbody>'+
							'			      							<form class="form-horizontal" role="form">'+
							'											<tr><td><label for="justificacionAvance">Justificación</label><input type="text" id="justificacionAvance" value="" class="form-control" placeholder="Ingrese Justificación" /></td><td><label for="cantidadAvance">Cantidad</label><input type="number" id="cantidadAvance" class="form-control" value="" placeholder="Ingrese Cantidad" /></td></tr>'+
							'											<tr><td><label for="fechaEntregaAvance">Fecha Entrega</label><input type="date" id="fechaEntregaAvance" value="" class="form-control"  /></td><td><label for="cantidadBeneficiariosAvance">Cantidad Beneficiarios</label><input type="number" id="cantidadBeneficiariosAvance" class="form-control" value="" placeholder="Ingrese Cantidad Beneficiarios"/></td></tr>'+														
							'											<input type="hidden" id="versionAvance" value="3" />'+		
							'			      							</form>	'+												
							'										</tbody>'+
							'									</table>'+
							'				      			</div>'+							
							
							'               			</div>'+//fin box-body
							'							<div class="modal-footer">'+ 
							'					        	<button type="button" class="btn btn-success guardarAvance" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'>Guardar Avance</button>'+ 
							'							</div>'+
							'                		</div>'+	
							'                	</div>'+
							'                </div>'+											
											
							'		      	<div class="row">'+ 
							'		      		<div class="col-md-12">'+
							'						<div class="box box-warning">'+
							'		                	<div class="box-header with-border">'+
							'		                  		<h3 class="box-title">Lista de Avance</h3>'+
							'	                  			<div class="box-tools pull-right">'+
							'				                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>'+
							'		                    		</button>'+
							'		                    		<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i>'+
							'		                    		</button>'+
							'		                  		</div>'+
							'               			</div>'+//fin box-heder
							'               			<div class="box-body">'+
							
							'								<div class="table-responsive">'+
							'									<table class="table table-hover table-bordered">'+
							'										<thead><tr class="active"><th>Justificación</th><th>cantidad</th><th>Fecha Entrega</th><th>Cantidad Beneficiarios</th><th>Administrar</th></tr>'+
							'										<tbody id="listaAvances">'+
							'										</tbody>'+
							'									</table>'+
							'								</div>'+
							
					
							'               			</div>'+//fin box-body
							'                		</div>'+	
							'                	</div>'+
							'                </div>'+
							

							'		    </div>'+
							'			<div class="modal-footer">'+
							'				<button type="button" class="btn btn-success agregarActividad" data-dismiss="modal" parametros="'+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'">Cerrar</button>'+
					      	'			</div>'+														
							'		</div>'+ 
							'	</div>'+
							'</div>';					  

	$("body").append(modalAvance);
	$("#listaAvances").html("");
	$("#listaAvances").html(cuerpoAvance);
	$("#modalAvance").modal('show');		

});	

$("body").on("click", ".guardarAvance",function(event){
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");                                                            
	
	//Las siguentes 4 variables se utiliza en esta funcion para redibujar el modal anterior
	var insLineaAccionId = idParsed[0];
	var lineaAccionId = idParsed[1];
	var institucionId = idParsed[2];
	var periodoId = idParsed[3];
	var accionId = idParsed[4];
	var actividadId = idParsed[5];//es el id de la tabla actidad
	
	var justificacion = $("#justificacionAvance").val();
	var cantidad = $("#cantidadAvance").val();
	var fechaEntrega = $("#fechaEntregaAvance").val();
	var cantidadBeneficiarios = $("#cantidadBeneficiariosAvance").val();
	var version = $("#versionAvance").val();


	//Vaciar los inputs
	$("#justificacionAvance").val("");
	$("#cantidadAvance").val("");
	$("#fechaEntregaAvance").val("");
	$("#cantidadBeneficiariosAvance").val("");
	
	var objeto = new Object();
	
	objeto.justificacion = justificacion;
	objeto.cantidad = cantidad;
	objeto.fechaEntrega = fechaEntrega;
	objeto.cantidadBeneficiarios = cantidadBeneficiarios;
	objeto.actividadId = actividadId;
	objeto.version = version;

	
  	var info = JSON.stringify(objeto);
    $.ajax({
        url: "ajaxInserts2?accion=insAvance",
        type: 'POST',
        dataType: 'json',
        data: info,
        contentType: 'application/json',
        mimeType: 'application/json',
        success: function (data) {
        	if(data.success == true)
        	{
        		var webServicesAvance = $.ajax({
        			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAvance&actividadId='+actividadId,
        		  	type:'get',
        		  	dataType:'json',
        		  	async:false       
        		}).responseText;
        		webServicesAvance = JSON.parse(webServicesAvance);
        		
        		var cuerpoAvance = "";
        		for(var d = 0; d < webServicesAvance.length; d++)
        		{
        			cuerpoAvance += '<tr><td>'+webServicesAvance[d].justificacion+'</td><td>'+webServicesAvance[d].cantidad+'</td><td>'+webServicesAvance[d].fechaEntrega+'</td><td>'+webServicesAvance[d].cantidadBeneficiarios+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm agregarModalAdministrador" data-toggle="tooltip" data-placement="top" title="Administrar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+webServicesAvance[d].id+'><span class="fa fa-gear"></span></button></td></tr>';
        		}
        		
        		$("#listaAvances").html("");
        		$("#listaAvances").html(cuerpoAvance);
        		
        	}else{
        		alert("ERROR");        		
        	}
        	
        	},
        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
        error: function(data,status,er) {
        	
        	}
	 });
	
});	

$("body").on("click", ".agregarModalAdministrador",function(event){
	
	if ( $("#modalAvance").length )
	{
		$("#modalAvance").remove();
	}
	if ( $("#modalBorrarAccion").length )
	{
		$("#modalBorrarAccion").remove();
	}	
	if ( $("#modalEditarCosto").length )
	{
		$("#modalEditarCosto").remove();
	}	
	if ( $("#modalConsultaBorrarAvance").length )
	{
		$("#modalConsultaBorrarAvance").remove();
	}	
	if ( $("#modalBorrarEvidencia").length )
	{
		$("#modalBorrarEvidencia").remove();
	}	
	if ( $("#modalBorrarAvance").length )
	{
		$("#modalBorrarAvance").remove();
	}
	if ( $("#modalEditarEvidencia").length )
	{
		$("#modalEditarEvidencia").remove();
	}	
		
	
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");                                                            
	
	//Las siguentes variables se utiliza en esta funcion para redibujar el modal anterior
	var insLineaAccionId = idParsed[0];
	var lineaAccionId = idParsed[1];
	var institucionId = idParsed[2];
	var periodoId = idParsed[3];
	var accionId = idParsed[4];
	var actividadId = idParsed[5];
	var avanceId = idParsed[6];//es el id de la tabla avance

	
	var webServicesAvance = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAvance&avanceId='+avanceId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesAvance = JSON.parse(webServicesAvance); 
	
	var webServicesEvidencia = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getEvidencia&avanceId='+avanceId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesEvidencia = JSON.parse(webServicesEvidencia);
	
	var cuerpoEvidencia = "";
	for(var d = 0; d < webServicesEvidencia.length; d++)
	{
		if(webServicesEvidencia[d].borrado == true)
		{
			cuerpoEvidencia += '<tr><td><del>'+webServicesEvidencia[d].nombre+'</del></td><td><del>'+webServicesEvidencia[d].descripcion+'</del></td><td><del>'+webServicesEvidencia[d].url+'</del></td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaEditarEvidencia" data-toggle="tooltip" data-placement="top" title="Editar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'-'+webServicesEvidencia[d].id+' ><span class="fa fa-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarEvidencia" data-toggle="tooltip" data-placement="top" title="Borrar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'-'+webServicesEvidencia[d].id+' ><span class="fa fa-trash"></span></button></td></tr>';
		}else{
			cuerpoEvidencia += '<tr><td>'+webServicesEvidencia[d].nombre+'</td><td>'+webServicesEvidencia[d].descripcion+'</td><td>'+webServicesEvidencia[d].url+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaEditarEvidencia" data-toggle="tooltip" data-placement="top" title="Editar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'-'+webServicesEvidencia[d].id+' ><span class="fa fa-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarEvidencia" data-toggle="tooltip" data-placement="top" title="Borrar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'-'+webServicesEvidencia[d].id+' ><span class="fa fa-trash"></span></button></td></tr>';
		}	
	}
	
	var webServicesAvanceCosto = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAvanceCosto&avanceId='+avanceId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesAvanceCosto = JSON.parse(webServicesAvanceCosto);
	
	var cuerpoAvanceCosto = "";
	for(var d = 0; d < webServicesAvanceCosto.length; d++)
	{
		if(webServicesAvanceCosto[d].borrado == true)
		{
			cuerpoAvanceCosto += '<tr><td><del>'+webServicesAvanceCosto[d].monto+'</del></td><td><del>'+webServicesAvanceCosto[d].codigoContratacional+'</del></td><td><del>'+webServicesAvanceCosto[d].objetoGasto+'</del></td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaEditarCosto" data-toggle="tooltip" data-placement="top" title="Editar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'-'+webServicesAvanceCosto[d].id+' ><span class="fa fa-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarCosto" data-toggle="tooltip" data-placement="top" title="Borrar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'-'+webServicesAvanceCosto[d].id+' ><span class="fa fa-trash"></span></button></td></tr>';
		}else{
			cuerpoAvanceCosto += '<tr><td>'+webServicesAvanceCosto[d].monto+'</td><td>'+webServicesAvanceCosto[d].codigoContratacional+'</td><td>'+webServicesAvanceCosto[d].objetoGasto+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaEditarCosto" data-toggle="tooltip" data-placement="top" title="Editar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'-'+webServicesAvanceCosto[d].id+' ><span class="fa fa-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarCosto" data-toggle="tooltip" data-placement="top" title="Borrar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'-'+webServicesAvanceCosto[d].id+' ><span class="fa fa-trash"></span></button></td></tr>';
		}
	}
			
	var contenidoModalAdministrador = "";

	contenidoModalAdministrador +=  '<div class="modal fade" id="modalAdministrador" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
									'	<div class="modal-dialog modal-lg" style="width:90%">'+
									'		<div class="modal-content" >'+
									'			<div class="modal-header">'+
									'		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="agregarAvance" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'>&times;</span></button>'+
									'		        <h4 class="modal-title">Administrador</h4>'+ 
									'			</div>'+
									'		    <div class="modal-body">'+
									
									'		      	<div class="row">'+ 
									'		      		<div class="col-md-6">'+
									'						<div class="box box-warning box-solid">'+
									'		                	<div class="box-header with-border">'+
									'		                  		<h3 class="box-title">Avance</h3>'+
									'	                  			<div class="box-tools pull-right">'+
									'				                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>'+
									'		                    		</button>'+
									'		                    		<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i>'+
									'		                    		</button>'+
									'		                  		</div>'+
									'               			</div>'+//fin box-heder
									'               			<div class="box-body">'+
									
									'								<div class="table-responsive">'+
									'									<table class="table table-hover table-bordered">'+
									'										<thead>'+
									'											<tr class="active"><th>Justificación</th><th>Cantidad</th><th>FechaEntrega</th><th>Cant.Beneficiarios</th><th class="text-center">Administrar</th></tr>'+
									' 										</thead>'+
									'										<tbody>';
																				if(webServicesAvance[0].borrado == true)
																				{
	contenidoModalAdministrador +=	'												<tr><td><del>'+webServicesAvance[0].justificacion+'</del></td><td><del>'+webServicesAvance[0].cantidad+'</del></td><td><del>'+webServicesAvance[0].fechaEntrega+'</del></td><td><del>'+webServicesAvance[0].cantidadBeneficiarios+'</del></td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaEditarAvance" data-toggle="tooltip" data-placement="top" title="Editar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+' ><span class="fa fa-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarAvance" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+' data-toggle="tooltip" data-placement="top" title="Borrar" ><span class="fa fa-trash"></span></button></td></tr>';
																				}else{
	contenidoModalAdministrador +=	'												<tr><td>'+webServicesAvance[0].justificacion+'</td><td>'+webServicesAvance[0].cantidad+'</td><td>'+webServicesAvance[0].fechaEntrega+'</td><td>'+webServicesAvance[0].cantidadBeneficiarios+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaEditarAvance" data-toggle="tooltip" data-placement="top" title="Editar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+' ><span class="fa fa-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarAvance" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+' data-toggle="tooltip" data-placement="top" title="Borrar" ><span class="fa fa-trash"></span></button></td></tr>';
																				}
																				
	contenidoModalAdministrador +=	'										</tbody>'+
									'									</table>'+
									'				      			</div>'+							
									
									'               			</div>'+//fin box-body
									'							<div class="modal-footer">'+ 
									'							</div>'+
									'                		</div>'+	
									'                	</div>'+
									'		      		<div class="col-md-6">'+
									'						<div class="box box-warning box-solid">'+
									'		                	<div class="box-header with-border">'+
									'	                  			<h3 class="box-title">Beneficiarios</h3>'+
									'	                  			<div class="box-tools pull-right">'+
									'				                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>'+
									'		                    		</button>'+
									'		                    		<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i>'+
									'		                    		</button>'+
									'		                  		</div>'+
									'              				</div>'+
									'               			<div class="box-body">'+
					
									'		      					<div class="col-md-12">'+
									'									<div class="box box-default box-solid">'+
									'		                				<div class="box-header with-border">'+
									'		                  					<h3 class="box-title">Agregar Beneficiarios</h3>'+
									'	                  						<div class="box-tools pull-right">'+
									'				                    			<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
									'		                    					<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>'+
									'		                  					</div>'+
									'              							</div>'+
									'              						<div class="box-body">'+
									
									'										<div class="table-responsive">'+
									'											<table class="table table-hover">'+
									'												<tbody>'+
			
									'												</tbody>'+
									'											</table>'+
									'				      					</div>'+
									
									'				      				 </div>'+//fin box body
									'									 <div class="modal-footer">'+ 
									'					        			<button type="button" class="btn btn-success btn-sm">Guardar Beneficiario</button>'+ 
									'									 </div>'+									
									'				      			 	</div>'+
									'				      			</div>'+							


									'		      					<div class="col-md-12">'+
									'									<div class="box box-default box-solid">'+
									'		                				<div class="box-header with-border">'+
									'		                  					<h3 class="box-title">Lista Beneficiarios</h3>'+
									'	                  						<div class="box-tools pull-right">'+
									'				                    			<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
									'		                    					<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>'+
									'		                  					</div>'+
									'              							</div>'+
									'              						<div class="box-body">'+	
									'										<div class="table-responsive">'+
									'											<table class="table table-hover table-bordered">'+
									'												<thead>'+
									'													<tr class="active"><th>Grupo</th><th>Tipo</th><th>Cantidad</th><th class="text-center">Administrar</th></tr>'+
									'												</thead>'+
									'												<tbody>'+
									'												</tbody>'+
									'											</table>'+
									'				      					</div>'+
									
									'				      				</div>'+
									'				      			</div>'+
									'              				</div>'+
					
									'              				</div>'+
									'                		</div>'+	
									'               	</div>'+
									
									
									
									'                </div>'+											
													
								
									'		      	<div class="row">'+ 
									
									'		      		<div class="col-md-6">'+
									'						<div class="box box-warning box-solid">'+
									'		                	<div class="box-header with-border">'+
									'	                  			<h3 class="box-title">Costos</h3>'+
									'	                  			<div class="box-tools pull-right">'+
									'				                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>'+
									'		                    		</button>'+
									'		                    		<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i>'+
									'		                    		</button>'+
									'		                  		</div>'+
									'              				</div>'+
									'               			<div class="box-body">'+
					
									'		      					<div class="col-md-12">'+
									'									<div class="box box-default box-solid">'+
									'		                				<div class="box-header with-border">'+
									'		                  					<h3 class="box-title">Agregar Costos</h3>'+
									'	                  						<div class="box-tools pull-right">'+
									'				                    			<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
									'		                    					<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>'+
									'		                  					</div>'+
									'              							</div>'+
									'              						<div class="box-body">'+
									
									'										<div class="table-responsive">'+
									'											<table class="table table-hover">'+
									'												<tbody>'+
									'			      									<form class="form-horizontal" role="form">'+
									'													<tr><td><label for="codigoContratacionalCosto">Cod. Contratación</label><input type="number" id="codigoContratacionalCosto" class="form-control" placeholder="Ingrese Codigo Contrato" /></td><td><label for="objetoGastoCosto">Objeto Gasto</label><input type="number" id="objetoGastoCosto" class="form-control" placeholder="Ingrese Objeto de Gasto" /></td></tr>'+									
									'													<tr><td colspan="2"><label for="montoCosto">Monto</label><input type="number" id="montoCosto" class="form-control" placeholder="Ingrese Monto" /></td></tr>'+
									'													<input type="hidden" id="avanceIdCosto" value="'+avanceId+'"/>'+		
									'			      									</form>	'+												
									'												</tbody>'+
									'											</table>'+
									'				      					</div>'+
									
									'				      				 </div>'+//fin box body
									'									 <div class="modal-footer">'+ 
									'					        			<button type="button" class="btn btn-success btn-sm guardarCosto" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'>Guardar Costo</button>'+ 
									'									 </div>'+									
									'				      			 	</div>'+
									'				      			</div>'+							


									'		      					<div class="col-md-12">'+
									'									<div class="box box-default box-solid">'+
									'		                				<div class="box-header with-border">'+
									'		                  					<h3 class="box-title">Lista Costos</h3>'+
									'	                  						<div class="box-tools pull-right">'+
									'				                    			<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
									'		                    					<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>'+
									'		                  					</div>'+
									'              							</div>'+
									'              						<div class="box-body">'+	
									'										<div class="table-responsive">'+
									'											<table class="table table-hover table-bordered">'+
									'												<thead>'+
									'													<tr class="active"><th>Monto</th><th>Cod.Contratación</th><th>ObjetoGasto</th><th class="text-center">Administrar</th></tr>'+
									'												</thead>'+
									'												<tbody id="listaCosto">'+
									'												</tbody>'+
									'											</table>'+
									'				      					</div>'+
									
									'				      				</div>'+
									'				      			</div>'+
									'              				</div>'+
					
									'              				</div>'+
									'                		</div>'+	
									'               	</div>'+
						
									
									

									'		      		<div class="col-md-6">'+
									'						<div class="box box-warning box-solid">'+
									'		                	<div class="box-header with-border">'+
									'		                  		<h3 class="box-title">Evidencias</h3>'+
									'	                  			<div class="box-tools pull-right">'+
									'				                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>'+
									'		                    		</button>'+
									'		                    		<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i>'+
									'		                    		</button>'+
									'		                  		</div>'+
									'              				</div>'+
									'              				<div class="box-body">'+
									
									'		      					<div class="col-md-12">'+
									'									<div class="box box-default box-solid">'+
									'		                				<div class="box-header with-border">'+
									'		                  					<h3 class="box-title">Agregar Evidencia</h3>'+
									'	                  						<div class="box-tools pull-right">'+
									'				                    			<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
									'		                    					<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>'+
									'		                  					</div>'+
									'              							</div>'+
									'              						<div class="box-body">'+
									
									'										<div class="table-responsive">'+
									'											<table class="table table-hover">'+
									'												<tbody>'+
									'			      									<form class="form-horizontal" role="form">'+
									'													<tr><td><label for="nombreEvidencia">Nombre</label><input type="text" id="nombreEvidencia" class="form-control" placeholder="Ingrese Nombre" /></td><td><label for="urlEvidencia">Url</label><input type="url" id="urlEvidencia" class="form-control" placeholder="Ingrese Url" /></td></tr>'+
									'													<tr><td colspan="2"><label for="descripcionEvidencia">Descripción</label><input type="text" id="descripcionEvidencia" class="form-control" placeholder="Ingrese Descripción" /></td></tr>'+
									'													<input type="hidden" id="wsIdEvidencia" value="1" /><input type="hidden" id="versionEvidencia" value="3"/><input type="hidden" id="avanceIdEvidencia" value="'+avanceId+'"/>'+		
									'			      									</form>	'+												
									'												</tbody>'+
									'											</table>'+
									'				      					</div>'+
								
									
									'				      				 </div>'+//fin box body
									'									 <div class="modal-footer">'+ 
									'					        			<button type="button" class="btn btn-success btn-sm guardarEvidencia" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'>Guardar Evidencia</button>'+ 
									'									 </div>'+									
									'				      			 	</div>'+
									'				      			</div>'+							


									'		      					<div class="col-md-12">'+
									'									<div class="box box-default box-solid">'+
									'		                				<div class="box-header with-border">'+
									'		                  					<h3 class="box-title">Lista Evidencia</h3>'+
									'	                  						<div class="box-tools pull-right">'+
									'				                    			<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
									'		                    					<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>'+
									'		                  					</div>'+
									'              							</div>'+
									'              						<div class="box-body">'+	
									'										<div class="table-responsive">'+
									'											<table class="table table-hover table-bordered">'+
									'												<thead>'+
									'													<tr class="active"><th>Nombre</th><th>Descripción</th><th>Url</th><th class="text-center">Administrar</th></tr>'+
									'												</thead>'+
									'												<tbody  id="listaEvidencia">'+
									
									'												</tbody>'+
									'											</table>'+
									'				      					</div>'+
									
									'				      				</div>'+
									'				      			</div>'+
									'              				</div>'+
									
									'				    	</div>'+
									'              		</div>'+
																
									'                </div>'+//fin row 

									
		
									'		    </div>'+
									'			<div class="modal-footer">'+
									'				<button type="button" class="btn btn-success agregarAvance" data-dismiss="modal" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'>Cerrar</button>'+ 
							      	'			</div>'+														
									'		</div>'+ 
									'	</div>'+
									'</div>';					  

	$("body").append(contenidoModalAdministrador);
	$("#listaEvidencia").html("");
	$("#listaEvidencia").html(cuerpoEvidencia);
	$("#listaCosto").html("");
	$("#listaCosto").html(cuerpoAvanceCosto);
	$("#modalAdministrador").modal('show');	

});	

$("body").on("click", ".consultaEditarAvance",function(event){

	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");                                                            

	//Las siguentes variables se utiliza en esta funcion para redibujar el modal anterior
    var insLineaAccionId = idParsed[0];
	var lineaAccionId = idParsed[1];
    var institucionId = idParsed[2];
  	var periodoId = idParsed[3];
 	var accionId = idParsed[4];
  	var actividadId = idParsed[5];
  	var avanceId = idParsed[6];

  	if ( $("#modalAdministrador").length )
   	{
		$("#modalAdministrador").remove();
   	}	
  	
   	var webServicesAvance = $.ajax({

   		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAvance&avanceId='+avanceId,

   	  	type:'get',

   	  	dataType:'json',

   	  	async:false       

   	}).responseText;

   	webServicesAvance = JSON.parse(webServicesAvance); 

   	var contenido = "";

   	contenido +=		'<div class="modal fade" id="modalEditarCosto"  data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+

   						'	<div class="modal-dialog modal-lg">'+

   						'		<div class="modal-content" >'+

   						'			<div class="modal-header">'+

   						'		        <button type="button" class="close agregarModalAdministrador" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+' aria-label="Close"><span aria-hidden="true">&times;</span></button>'+

   						'		        <h4 class="modal-title" >Editar Avance</h4>'+

   						'			</div>'+

   						'		    <div class="modal-body" id="cuerpoModalEditarAvance">'+
   										

						'				<div class="table-responsive">'+

						'					<table class="table table-hover">'+

						'						<tbody>'+

						'			      			<form class="form-horizontal" role="form">'+

						'							<tr><td><label for="justificacionAvance">Justificación</label><input type="text" id="justificacionAvance" value="'+webServicesAvance[0].justificacion+'" class="form-control" /></td><td><label for="cantidadAvance">Cantidad</label><input type="number" id="cantidadAvance" class="form-control" value='+webServicesAvance[0].cantidad+' /></td></tr>'+

						'							<tr><td><label for="fechaEntregaAvance">Fecha Entrega</label><input type="date" id="fechaEntregaAvance" value='+webServicesAvance[0].fechaEntrega+' class="form-control"  /></td><td><label for="cantidadBeneficiariosAvance">Cantidad Beneficiarios</label><input type="number" id="cantidadBeneficiariosAvance" class="form-control" value='+webServicesAvance[0].cantidadBeneficiarios+' /></td></tr>'+														

						'							<input type="hidden" id="versionAvance" value="3" /><input type="hidden" id="actividadIdAvance" value='+avanceId+' />'+		

						'			      			</form>	'+												

						'						</tbody>'+

						'					</table>'+
						'				 </div>'+	

   						

   						'		    </div>'+

   						'			<div class="modal-footer">'+

   						' 				<button type="button" class="btn btn-success btn-sm editarAvance" id="botonGuardarAvance" parametros='+avanceId+'>Guardar Cambios</button>'+
   						'				<button type="button" class="btn btn-success agregarModalAdministrador" data-dismiss="modal" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'>Cerrar</button>'+	

   						'			</div>'+

   						'		</div>'+ 

   						'	</div>'+

   						'</div>';

   						

   	$("body").append(contenido);

   	$('#modalEditarCosto').modal('show');

 });
 
$("body").on("click", ".editarAvance",function(event){	
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-"); 
    var avanceId = idParsed[0];
    
	var justificacion = $("#justificacionAvance").val();
	var cantidad = $("#cantidadAvance").val();
	var fechaEntrega = $("#fechaEntregaAvance").val();
	var cantidadBeneficiarios = $("#cantidadBeneficiariosAvance").val();


	//Vaciar los inputs
	$("#justificacionAvance").val("");
	$("#cantidadAvance").val("");
	$("#fechaEntregaAvance").val("");
	$("#cantidadBeneficiariosAvance").val("");
    
   	var webServicesAvance = $.ajax({
   		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAvance&avanceId='+avanceId,
   	  	type:'get',
   	  	dataType:'json',
   	  	async:false       
   	}).responseText;
   	webServicesAvance = JSON.parse(webServicesAvance); 
    
	var objeto = new Object();
	
	objeto.justificacion = justificacion;
	objeto.cantidad = cantidad;
	objeto.fechaEntrega = fechaEntrega;
	objeto.cantidadBeneficiarios = cantidadBeneficiarios;
	objeto.actividadId = webServicesAvance[0].actividadId;
	objeto.version = webServicesAvance[0].version;//No obtenemos este valor del formulario sino del webservices entonces si por ahi agregamos la funcionalidad de que el usuario cambien la version debemos de obtener este dato del formulario y ya no del webservice
	objeto.id = avanceId;

	
  	var info = JSON.stringify(objeto);
    $.ajax({
        url: "ajaxUpdate2?accion=actAvance",
        type: 'POST',
        dataType: 'json',
        data: info,
        contentType: 'application/json',
        mimeType: 'application/json',
        success: function (data) {
        	if(data.success == true)
        	{
				$("#cuerpoModalEditarAvance").html("");
				$("#cuerpoModalEditarAvance").append("<h3 class='text-center'>Ud ha actualizado exitosamente los cambios!!</h3>");
				$("#botonGuardarAvance").remove("");

        	}else{
        		alert("ERROR");
        	}
        	
        	},
        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
        error: function(data,status,er) {
        	
        	}
	 });
	
});

$("body").on("click", ".consultaBorrarAvance",function(event){
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");                                                            
	
	//Las siguentes variables se utiliza en esta funcion para redibujar el modal anterior
	var insLineaAccionId = idParsed[0];
	var lineaAccionId = idParsed[1];
	var institucionId = idParsed[2];
	var periodoId = idParsed[3];
	var accionId = idParsed[4];
	var actividadId = idParsed[5];
	var avanceId = idParsed[6];

	if ( $("#modalAdministrador").length )
	{
		$("#modalAdministrador").remove();
	}		
	
   	var webServicesAvance = $.ajax({
   		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAvance&avanceId='+avanceId,
   	  	type:'get',
   	  	dataType:'json',
   	  	async:false       
   	}).responseText;
   	webServicesAvance = JSON.parse(webServicesAvance); 
	
	var contenido = "";

	contenido =			'<div class="modal fade" id="modalBorrarAvance"  data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
						'	<div class="modal-dialog modal-lg">'+
						'		<div class="modal-content" >'+
						'			<div class="modal-header">'+
						'		        <button type="button" class="close agregarModalAdministrador"  parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+' aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
						'		        <h4 class="modal-title" >Borrar - Restaurar Avance</h4>'+
						'			</div>'+
						'		    <div class="modal-body">'+
						'				<div id="mensajeBorradoAvance"></div>'+
						'		    </div>'+
						'			<div class="modal-footer" id="agregarBotonBorradoAvance">'+
						'			</div>'+
						'		</div>'+ 
						'	</div>'+
						'</div>';
						
		$("#programacion").append(contenido);
		
		if(webServicesAvance[0].borrado == true){
			$("#mensajeBorradoAvance").html("");
			$("#mensajeBorradoAvance").append('<h3 class="text-center">Ud. esta seguro que desea RESTABLACER este registro</h3>');
			$("#agregarBotonBorradoAvance").html("");
			$("#agregarBotonBorradoAvance").append('<button type="button" class="btn btn-success btn-sm borrarAvance" id="botonRestaurarAvance" parametros='+avanceId+'-r>Restaurar Avance</button>');
			$("#agregarBotonBorradoAvance").append('<button type="button" class="btn btn-success btn-sm agregarModalAdministrador"  parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'>Cerrar</button>');
		}else{
			$("#mensajeBorradoAvance").html("");
			$("#mensajeBorradoAvance").append('<h3 class="text-center">Ud. esta seguro que desea BORRAR este registro</h3');
			$("#agregarBotonBorradoAvance").html("");
			$("#agregarBotonBorradoAvance").append('<button type="button" class="btn btn-danger btn-sm borrarAvance" id="botonBorradoAvance" parametros='+avanceId+'-b>Borrar Avance</button>');
			$("#agregarBotonBorradoAvance").append('<button type="button" class="btn btn-success btn-sm agregarModalAdministrador"  parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'>Cerrar</button>');
		}
		
		$('#modalBorrarAvance').modal('show');
			
});

$("body").on("click", ".borrarAvance",function(event){	
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-"); 
    var avanceId = idParsed[0];
    var estado = idParsed[1];
    
   	var webServicesAvance = $.ajax({
   		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAvance&avanceId='+avanceId,
   	  	type:'get',
   	  	dataType:'json',
   	  	async:false       
   	}).responseText;
   	webServicesAvance = JSON.parse(webServicesAvance); 
    
    var objeto = new Object();
    objeto.id = avanceId;
    objeto.borrado= webServicesAvance[0].borrado;

    
  	var info = JSON.stringify(objeto);
    $.ajax({
        url: "ajaxUpdate2?accion=actBorradoAvance",
        type: 'POST',
        dataType: 'json',
        data: info,
        contentType: 'application/json',
        mimeType: 'application/json',
        success: function (data) {
        	
            if(estado == "b"){
        		$("#botonBorradoAvance").remove();
            	$("#mensajeBorradoAvance").html("");
            	$("#mensajeBorradoAvance").html("<h3 class='text-center'>BORRADO EXITOSAMENTE!!</h3>");
            }else{
        		$("#botonRestaurarAvance").remove();
            	$("#mensajeBorradoAvance").html("");
            	$("#mensajeBorradoAvance").html("<h3 class='text-center'>RESTAURADO EXITOSAMENTE!!</h3>");
        	}

        },

        error: function(data,status,er) {
        	
        	}
	 });
	
});

$("body").on("click", ".guardarCosto",function(event){
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");                                                            
	
	//Las siguentes variables se utiliza en esta funcion para redibujar el modal anterior
	var insLineaAccionId = idParsed[0];
	var lineaAccionId = idParsed[1];
	var institucionId = idParsed[2];
	var periodoId = idParsed[3];
	var accionId = idParsed[4];
	var actividadId = idParsed[5];
	
	var monto = $("#montoCosto").val();
	var codigoContratacional = $("#codigoContratacionalCosto").val();
	var objetoGasto = $("#objetoGastoCosto").val();
	var avanceId = $("#avanceIdCosto").val();

	//Vaciar los inputs
	$("#codigoContratacionalCosto").val("");
	$("#objetoGastoCosto").val("");
	$("#montoCosto").val("");

	var objeto = new Object();
	
	objeto.monto = monto;
	objeto.codigoContratacional = codigoContratacional;
	objeto.objetoGasto = objetoGasto;
	objeto.avanceId = avanceId;

  	var info = JSON.stringify(objeto);
    $.ajax({
        url: "ajaxInserts2?accion=insAvanceCosto",
        type: 'POST',
        dataType: 'json',
        data: info,
        contentType: 'application/json',
        mimeType: 'application/json',
        success: function (data) {
        	if(data.success == true)
        	{
        		
        		var webServicesAvanceCosto = $.ajax({
        			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAvanceCosto&avanceId='+avanceId,
        		  	type:'get',
        		  	dataType:'json',
        		  	async:false       
        		}).responseText;
        		webServicesAvanceCosto = JSON.parse(webServicesAvanceCosto);
        		
        		var cuerpoAvanceCosto = "";
        		for(var d = 0; d < webServicesAvanceCosto.length; d++)
        		{
        			if(webServicesAvanceCosto[d].borrado == true)
        			{
        				cuerpoAvanceCosto += '<tr><td><del>'+webServicesAvanceCosto[d].monto+'</del></td><td><del>'+webServicesAvanceCosto[d].codigoContratacional+'</del></td><td><del>'+webServicesAvanceCosto[d].objetoGasto+'</del></td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaEditarCosto" data-toggle="tooltip" data-placement="top" title="Editar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'-'+webServicesAvanceCosto[d].id+' ><span class="fa fa-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarCosto" data-toggle="tooltip" data-placement="top" title="Borrar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'-'+webServicesAvanceCosto[d].id+' ><span class="fa fa-trash"></span></button></td></tr>';
        			}else{
        				cuerpoAvanceCosto += '<tr><td>'+webServicesAvanceCosto[d].monto+'</td><td>'+webServicesAvanceCosto[d].codigoContratacional+'</td><td>'+webServicesAvanceCosto[d].objetoGasto+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaEditarCosto" data-toggle="tooltip" data-placement="top" title="Editar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'-'+webServicesAvanceCosto[d].id+' ><span class="fa fa-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarCosto" data-toggle="tooltip" data-placement="top" title="Borrar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'-'+webServicesAvanceCosto[d].id+' ><span class="fa fa-trash"></span></button></td></tr>';
        			}
        		}
        		
        		$("#listaCosto").html("");
        		$("#listaCosto").html(cuerpoAvanceCosto);
        		
        	}else{
  		
        	}
        	
        	},
        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
        error: function(data,status,er) {
        	
        	}
	 });
	
});	

$("body").on("click", ".consultaBorrarCosto",function(event){
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");                                                            
	
	//Las siguentes variables se utiliza en esta funcion para redibujar el modal anterior
	var insLineaAccionId = idParsed[0];
	var lineaAccionId = idParsed[1];
	var institucionId = idParsed[2];
	var periodoId = idParsed[3];
	var accionId = idParsed[4];
	var actividadId = idParsed[5];
	var avanceId = idParsed[6];
	var costoId = idParsed[7];

	if ( $("#modalAdministrador").length )
	{
		$("#modalAdministrador").remove();
	}		
	
	var webServicesAvanceCosto = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAvanceCosto&costoId='+costoId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesAvanceCosto = JSON.parse(webServicesAvanceCosto);
	
	var contenido = "";

	contenido =			'<div class="modal fade" id="modalBorrarAccion"  data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
						'	<div class="modal-dialog modal-lg">'+
						'		<div class="modal-content" >'+
						'			<div class="modal-header">'+
						'		        <button type="button" class="close agregarModalAdministrador"  parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+' aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
						'		        <h4 class="modal-title" >Borrar - Restaurar Costos</h4>'+
						'			</div>'+
						'		    <div class="modal-body">'+
						'			<div id="mensajeBorradoAvanceCosto"></div>'+
						'		    </div>'+
						'			<div class="modal-footer" id="agregarBotonBorradoCosto">'+
						'			</div>'+
						'		</div>'+ 
						'	</div>'+
						'</div>';
						
		$("#programacion").append(contenido);
		
		if(webServicesAvanceCosto[0].borrado == true){
			$("#mensajeBorradoAvanceCosto").html("");
			$("#mensajeBorradoAvanceCosto").append('<h3 class="text-center">Ud. esta seguro que desea RESTABLACER este registro</h3>');
			$("#agregarBotonBorradoCosto").html("");
			$("#agregarBotonBorradoCosto").append('<button type="button" class="btn btn-success btn-sm borrarAvanceCosto" id="botonRestaurarAvanceCosto" parametros='+costoId+'-r>Restaurar Costo</button>');
			$("#agregarBotonBorradoCosto").append('<button type="button" class="btn btn-success btn-sm agregarModalAdministrador"  parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'>Cerrar</button>');
		}else{
			$("#mensajeBorradoAvanceCosto").html("");
			$("#mensajeBorradoAvanceCosto").append('<h3 class="text-center">Ud. esta seguro que desea BORRAR este registro</h3');
			$("#agregarBotonBorradoCosto").html("");
			$("#agregarBotonBorradoCosto").append('<button type="button" class="btn btn-danger btn-sm borrarAvanceCosto" id="botonBorradoAvanceCosto" parametros='+costoId+'-b>Borrar Costo</button>');
			$("#agregarBotonBorradoCosto").append('<button type="button" class="btn btn-success btn-sm agregarModalAdministrador"  parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'>Cerrar</button>');
		}
		
		$('#modalBorrarAccion').modal('show');
			
});

$("body").on("click", ".borrarAvanceCosto",function(event){	
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-"); 
    var costoId = idParsed[0];
    var estado = idParsed[1];
    
	var webServicesAvanceCosto = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAvanceCosto&costoId='+costoId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesAvanceCosto = JSON.parse(webServicesAvanceCosto);
    
    var objeto = new Object();
    objeto.id = costoId;
    objeto.borrado= webServicesAvanceCosto[0].borrado;

    
  	var info = JSON.stringify(objeto);
    $.ajax({
        url: "ajaxUpdate2?accion=actBorradoAvanceCosto",
        type: 'POST',
        dataType: 'json',
        data: info,
        contentType: 'application/json',
        mimeType: 'application/json',
        success: function (data) {
        	
            if(estado == "b"){
        		$("#botonBorradoAvanceCosto").remove();
            	$("#mensajeBorradoAvanceCosto").html("");
            	$("#mensajeBorradoAvanceCosto").html("<h3 class='text-center'>BORRADO EXITOSAMENTE!!</h3>");
            }else{
        		$("#botonRestaurarAvanceCosto").remove();
            	$("#mensajeBorradoAvanceCosto").html("");
            	$("#mensajeBorradoAvanceCosto").html("<h3 class='text-center'>RESTAURADO EXITOSAMENTE!!</h3>");
        	}

        },

        error: function(data,status,er) {
        	
        	}
	 });
	
});

$("body").on("click", ".consultaEditarCosto",function(event){
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");                                                            
	
	//Las siguentes variables se utiliza en esta funcion para redibujar el modal anterior
	var insLineaAccionId = idParsed[0];
	var lineaAccionId = idParsed[1];
	var institucionId = idParsed[2];
	var periodoId = idParsed[3];
	var accionId = idParsed[4];
	var actividadId = idParsed[5];
	var avanceId = idParsed[6];
	var costoId = idParsed[7];

	if ( $("#modalAdministrador").length )
	{
		$("#modalAdministrador").remove();
	}	
	
	var webServicesAvanceCosto = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAvanceCosto&costoId='+costoId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesAvanceCosto = JSON.parse(webServicesAvanceCosto);
	
	var contenido = "";

	contenido +=		'<div class="modal fade" id="modalEditarCosto"  data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
						'	<div class="modal-dialog modal-lg">'+
						'		<div class="modal-content" >'+
						'			<div class="modal-header">'+
						'		        <button type="button" class="close agregarModalAdministrador"  parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+' aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
						'		        <h4 class="modal-title" >Editar Costo Avance</h4>'+
						'			</div>'+
						'		    <div class="modal-body" id="cuerpoModalEditarAvanceCosto">'+
										
						'					<div class="table-responsive">'+
						'						<table class="table table-hover">'+
						'							<tbody>'+
						'								<form class="form-horizontal" role="form">'+
						'									<tr><td><label for="codigoContratacionalCosto">Cod. Contrato</label><input type="number" id="codigoContratacionalCosto" class="form-control" value='+webServicesAvanceCosto[0].codigoContratacional+' /></td><td><label for="objetoGastoCosto">Objeto Gasto</label><input type="number" id="objetoGastoCosto" class="form-control" value='+webServicesAvanceCosto[0].objetoGasto+' /></td></tr>'+									
						'									<tr><td colspan="2"><label for="montoCosto">Monto</label><input type="number" id="montoCosto" class="form-control" value='+webServicesAvanceCosto[0].monto+'  /></td></tr>'+
						'									<input type="hidden" id="avanceIdCosto" value="'+webServicesAvanceCosto[0].avanceId+'"/>'+		
						'								</form>	'+												
						'  							</tbody>'+
						'						</table>'+
						'					</div>'+
						

						'		    </div>'+
						'			<div class="modal-footer">'+
						' 				<button type="button" class="btn btn-success btn-sm guardarAvanceCosto" id="botonGuardarAvanceCosto" parametros='+costoId+'>Guardar Cambios</button>'+
						'			</div>'+
						'		</div>'+ 
						'	</div>'+
						'</div>';
						
	$("body").append(contenido);
	$('#modalEditarCosto').modal('show');

});

/*$("body").on("click", ".guardarAvanceCosto",function(event){
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");                                                            
	
	//Las siguentes variables se utiliza en esta funcion para redibujar el modal anterior
	var costoId = idParsed[0];
	
	var webServicesAvanceCosto = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAvanceCosto&costoId='+costoId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesAvanceCosto = JSON.parse(webServicesAvanceCosto);
	
	var monto = $("#montoCosto").val();
	var codigoContratacional = $("#codigoContratacionalCosto").val();
	var objetoGasto = $("#objetoGastoCosto").val();
	var avanceId = $("#avanceIdCosto").val();


	
    var objeto = new Object();
    objeto.id = costoId;
    objeto.monto = monto; 
    objeto.codigoContratacional = codigoContratacional;
    objeto.objetoGasto = objetoGasto;
    objeto.avanceId = avanceId;
  
  	var info = JSON.stringify(objeto);
    $.ajax({
        url: "ajaxUpdate2?accion=actAvanceCosto",
        type: 'POST',
        dataType: 'json',
        data: info,
        contentType: 'application/json',
        mimeType: 'application/json',
        success: function (data) {
        	
    	  	$("#cuerpoModalEditarAvanceCosto").html("");
    	  	$("#cuerpoModalEditarAvanceCosto").html("<h3 class='text-center'>Ud. ha modificado exitosamente!!</h3>");
			$("#botonGuardarAvanceCosto").remove();

        },

        error: function(data,status,er) {
        	
        	}
	 });
  
});*/

$("body").on("click", ".guardarEvidencia",function(event){
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");                                                            
	
	//Las siguentes variables se utiliza en esta funcion para redibujar el modal anterior
	var insLineaAccionId = idParsed[0];
	var lineaAccionId = idParsed[1];
	var institucionId = idParsed[2];
	var periodoId = idParsed[3];
	var accionId = idParsed[4];
	var actividadId = idParsed[5];
	var avanceId = idParsed[6];

	var nombre = $("#nombreEvidencia").val();
	var url = $("#urlEvidencia").val();
	var descripcion = $("#descripcionEvidencia").val();
	var wsId = $("#wsIdEvidencia").val();
	var version = $("#versionEvidencia").val();
	//var avanceId = $("#avanceIdEvidencia").val(); No utilizo esta variable xq ya viene en el parse pero lo ideal seria obtener del formulario

	//Vaciar los inputs
	$("#nombreEvidencia").val("");
	$("#urlEvidencia").val("");
	$("#descripcionEvidencia").val("");

	
	var objeto = new Object();
	
	objeto.nombre = nombre;
	objeto.url = url;
	objeto.descripcion = descripcion;
	objeto.wsId = wsId;
	objeto.version = version;
	objeto.avanceId = avanceId;

	
  	var info = JSON.stringify(objeto);
    $.ajax({
        url: "ajaxInserts2?accion=insEvidencia",
        type: 'POST',
        dataType: 'json',
        data: info,
        contentType: 'application/json',
        mimeType: 'application/json',
        success: function (data) {
        	if(data.success == true)
        	{
        		
        		var webServicesEvidencia = $.ajax({
        			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getEvidencia&avanceId='+avanceId,
        		  	type:'get',
        		  	dataType:'json',
        		  	async:false       
        		}).responseText;
        		webServicesEvidencia = JSON.parse(webServicesEvidencia);
        		
        		var cuerpoEvidencia = "";
        		for(var d = 0; d < webServicesEvidencia.length; d++)
        		{
        			if(webServicesEvidencia[d].borrado == true)
        			{
        				cuerpoEvidencia += '<tr><td><del>'+webServicesEvidencia[d].nombre+'</del></td><td><del>'+webServicesEvidencia[d].descripcion+'</del></td><td><del>'+webServicesEvidencia[d].url+'</del></td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaEditarEvidencia" data-toggle="tooltip" data-placement="top" title="Editar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'-'+webServicesEvidencia[d].id+' ><span class="fa fa-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarEvidencia" data-toggle="tooltip" data-placement="top" title="Borrar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'-'+webServicesEvidencia[d].id+' ><span class="fa fa-trash"></span></button></td></tr>';
        			}else{
        				cuerpoEvidencia += '<tr><td>'+webServicesEvidencia[d].nombre+'</td><td>'+webServicesEvidencia[d].descripcion+'</td><td>'+webServicesEvidencia[d].url+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaEditarEvidencia" data-toggle="tooltip" data-placement="top" title="Editar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'-'+webServicesEvidencia[d].id+' ><span class="fa fa-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarEvidencia" data-toggle="tooltip" data-placement="top" title="Borrar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'-'+webServicesEvidencia[d].id+' ><span class="fa fa-trash"></span></button></td></tr>';
        			}	
        		}
        		
        		$("#listaEvidencia").html("");
        		$("#listaEvidencia").html(cuerpoEvidencia);
        		
        	}else{
  		
        	}
        	
        	},
        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
        error: function(data,status,er) {
        	
        	}
	 });
	
});

$("body").on("click", ".consultaBorrarEvidencia",function(event){
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");                                                            
	
	//Las siguentes variables se utiliza en esta funcion para redibujar el modal anterior
	var insLineaAccionId = idParsed[0];
	var lineaAccionId = idParsed[1];
	var institucionId = idParsed[2];
	var periodoId = idParsed[3];
	var accionId = idParsed[4];
	var actividadId = idParsed[5];
	var avanceId = idParsed[6];
	var idEvidencia = idParsed[7];


	if ( $("#modalAdministrador").length )
	{
		$("#modalAdministrador").remove();
	}		
	
	var webServicesEvidencia = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getEvidencia&idEvidencia='+idEvidencia,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesEvidencia = JSON.parse(webServicesEvidencia);
	
	var contenidoEvidencia = "";

	contenidoEvidencia +='<div class="modal fade" id="modalBorrarEvidencia"  data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
						'	<div class="modal-dialog modal-lg">'+
						'		<div class="modal-content" >'+
						'			<div class="modal-header">'+
						'		        <button type="button" class="close agregarModalAdministrador"  parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+' aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
						'		        <h4 class="modal-title" >Borrar - Restaurar Evidencia</h4>'+
						'			</div>'+
						'		    <div class="modal-body">'+
						'			<div id="mensajeBorradoEvidencia"></div>'+
						'		    </div>'+
						'			<div class="modal-footer" id="agregarBotonBorradoEvidencia">'+
						'			</div>'+
						'		</div>'+ 
						'	</div>'+
						'</div>';
						
		$("#programacion").append(contenidoEvidencia);
		
		if(webServicesEvidencia[0].borrado == true){
			$("#mensajeBorradoEvidencia").html("");
			$("#mensajeBorradoEvidencia").append('<h3 class="text-center">Ud. esta seguro que desea RESTABLACER este registro</h3>');
			$("#agregarBotonBorradoEvidencia").html("");
			$("#agregarBotonBorradoEvidencia").append('<button type="button" class="btn btn-success btn-sm borrarEvidencia" id="botonRestaurarEvidencia" parametros='+webServicesEvidencia[0].id+'-r>Restaurar Evidencia</button>');
			$("#agregarBotonBorradoEvidencia").append('<button type="button" class="btn btn-success btn-sm agregarModalAdministrador"  parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'>Cerrar</button>');
		}else{
			$("#mensajeBorradoEvidencia").html("");
			$("#mensajeBorradoEvidencia").append('<h3 class="text-center">Ud. esta seguro que desea BORRAR este registro</h3');
			$("#agregarBotonBorradoEvidencia").html("");
			$("#agregarBotonBorradoEvidencia").append('<button type="button" class="btn btn-danger btn-sm borrarEvidencia" id="botonBorradoEvidencia" parametros='+webServicesEvidencia[0].id+'-b>Borrar Evidencia</button>');
			$("#agregarBotonBorradoEvidencia").append('<button type="button" class="btn btn-success btn-sm agregarModalAdministrador"  parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'>Cerrar</button>');
		}
		
		$('#modalBorrarEvidencia').modal('show');
			
});

$("body").on("click", ".borrarEvidencia",function(event){	
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-"); 
    var evidenciaId = idParsed[0];
    var estado = idParsed[1];
    
	var webServicesEvidencia = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getEvidencia&idEvidencia='+evidenciaId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesEvidencia = JSON.parse(webServicesEvidencia);
    
    var objeto = new Object();
    objeto.id = evidenciaId;
    objeto.borrado= webServicesEvidencia[0].borrado;

    
  	var info = JSON.stringify(objeto);
    $.ajax({
        url: "ajaxUpdate2?accion=actBorradoEvidencia",
        type: 'POST',
        dataType: 'json',
        data: info,
        contentType: 'application/json',
        mimeType: 'application/json',
        success: function (data) {
        	
            if(estado == "b"){
        		$("#botonBorradoEvidencia").remove();
            	$("#mensajeBorradoEvidencia").html("");
            	$("#mensajeBorradoEvidencia").html("<h3 class='text-center'>BORRADO EXITOSAMENTE!!</h3>");
            }else{
        		$("#botonRestaurarEvidencia").remove();
            	$("#mensajeBorradoEvidencia").html("");
            	$("#mensajeBorradoEvidencia").html("<h3 class='text-center'>RESTAURADO EXITOSAMENTE!!</h3>");
        	}

        },

        error: function(data,status,er) {
        	
        	}
	 });
	
});

$("body").on("click", ".consultaEditarEvidencia",function(event){
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");                                                            
	
	//Las siguentes variables se utiliza en esta funcion para redibujar el modal anterior
	var insLineaAccionId = idParsed[0];
	var lineaAccionId = idParsed[1];
	var institucionId = idParsed[2];
	var periodoId = idParsed[3];
	var accionId = idParsed[4];
	var actividadId = idParsed[5];
	var avanceId = idParsed[6];
	var evidenciaId = idParsed[7];

	if ( $("#modalAdministrador").length )
	{
		$("#modalAdministrador").remove();
	}	
	
	var webServicesEvidencia = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getEvidencia&idEvidencia='+evidenciaId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesEvidencia = JSON.parse(webServicesEvidencia);
	
	var contenido = "";

	contenido +=		'<div class="modal fade" id="modalEditarEvidencia" data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
						'	<div class="modal-dialog modal-lg">'+
						'		<div class="modal-content" >'+
						'			<div class="modal-header">'+
						'		        <button type="button" class="close agregarModalAdministrador"  parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+' aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
						'		        <h4 class="modal-title" >Editar Evidencia</h4>'+
						'			</div>'+
						'		    <div class="modal-body" id="cuerpoModalEditarEvidencia">'+
										
						'				<div class="table-responsive">'+
						'					<table class="table table-hover">'+
						'						<tbody>'+
						'			      			<form class="form-horizontal" role="form">'+
						'							<tr><td><label for="nombreEvidencia">Nombre</label><input type="text" id="nombreEvidencia" class="form-control" value="'+webServicesEvidencia[0].nombre+'" /></td><td><label for="urlEvidencia">Url</label><input type="url" id="urlEvidencia" class="form-control" value="'+webServicesEvidencia[0].url+'" /></td></tr>'+
						'							<tr><td colspan="2"><label for="descripcionEvidencia">Descripción</label><input type="text" id="descripcionEvidencia" class="form-control" value="'+webServicesEvidencia[0].descripcion+'" /></td></tr>'+
						'							<input type="hidden" id="wsIdEvidencia" value='+webServicesEvidencia[0].wsId+' /><input type="hidden" id="versionEvidencia" value='+webServicesEvidencia[0].version+' /><input type="hidden" id="avanceIdEvidencia" value='+webServicesEvidencia[0].avanceId+' />'+		
						'			      			</form>	'+												
						'						</tbody>'+
						'					</table>'+
						'				</div>'+
						
						'		    </div>'+
						'			<div class="modal-footer">'+
						' 				<button type="button" class="btn btn-success btn-sm editarEvidencia" id="botonGuardarEvidencia" parametros='+evidenciaId+'>Guardar Cambios</button>'+
						' 				<button type="button" class="btn btn-success btn-sm agregarModalAdministrador" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+' >Cerrar</button>'+						
						'			</div>'+
						'		</div>'+ 
						'	</div>'+
						'</div>';
						
	$("body").append(contenido);
	$('#modalEditarEvidencia').modal('show');

});

$("body").on("click", ".editarEvidencia",function(event){
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");                                                            
	
	//Las siguentes variables se utiliza en esta funcion para redibujar el modal anterior
	var evidenciaId = idParsed[0];

	var nombre = $("#nombreEvidencia").val();
	var url = $("#urlEvidencia").val();
	var descripcion = $("#descripcionEvidencia").val();
	var wsId = $("#wsIdEvidencia").val();
	var version = $("#versionEvidencia").val();
	var avanceId = $("#avanceIdEvidencia").val();

	//Vaciar los inputs
	$("#nombreEvidencia").val("");
	$("#urlEvidencia").val("");
	$("#descripcionEvidencia").val("");

	
	var objeto = new Object();
	
	objeto.id = evidenciaId;
	objeto.nombre = nombre;
	objeto.url = url;
	objeto.descripcion = descripcion;
	objeto.wsId = wsId;
	objeto.version = version;
	objeto.avanceId = avanceId;

	
  	var info = JSON.stringify(objeto);
    $.ajax({
        url: "ajaxUpdate2?accion=actEvidencia",
        type: 'POST',
        dataType: 'json',
        data: info,
        contentType: 'application/json',
        mimeType: 'application/json',
        success: function (data) {
        	if(data.success == true)
        	{
        		$("#botonGuardarEvidencia").remove();
            	$("#cuerpoModalEditarEvidencia").html("");
            	$("#cuerpoModalEditarEvidencia").html("<h3 class='text-center'>Ud ha actualizado exitosamente!!</h3>");        		
        	}else{
  		
        	}
        	
        	},
        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
        error: function(data,status,er) {
        	
        	}
	 });
	
});

</script>	
