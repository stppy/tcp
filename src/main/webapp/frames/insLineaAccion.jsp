


<script>

function renderEvidencia(avanceId, parametros){
	var webServicesEvidencia = $.ajax({
		url:'/tablero/ajaxSelects2?action=getEvidencia&avanceId='+avanceId,
	  	type:'get',
	  	dataType:'json',
	  	async:false
	}).responseText;
	webServicesEvidencia = JSON.parse(webServicesEvidencia);
	
	var cuerpoEvidencia = "";
	
	for(var d = 0; d < webServicesEvidencia.length; d++)
	{
		if(onoff==true && webServicesEvidencia[d].borrado == true){
			// pasa a la siguiente fila en el for ++
		}else{
			var donwloadName=""; 
			var downloadTarget='target="_blank"';
			var botones="";
			
			if (webServicesEvidencia[d].urlDocumento) {
				webServicesEvidencia[d].url='http://spr.stp.gov.py/tablero/DownloadServlet?urlDocumento='+webServicesEvidencia[d].urlDocumento;
				donwloadName='Download="'+webServicesEvidencia[d].nombre+'"';
				downloadTarget="";
			}
			
			<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
				botones='<button type="button" class="btn btn-default btn-sm consultaEditarEvidencia" data-toggle="tooltip" data-placement="top" title="Editar" parametros='+parametros+'-'+webServicesEvidencia[d].id+' ><span class="fa fa-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarEvidencia" data-toggle="tooltip" data-placement="top" title="Borrar" parametros='+parametros+'-'+webServicesEvidencia[d].id+' ><span class="fa fa-trash"></span></button>';
			<%}%>
			
			<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") ){%>
				if(webServicesEvidencia[d].borrado == true)
				{
					cuerpoEvidencia +='<tr><td data-toggle="tooltip" data-placement="top" title="'+webServicesEvidencia[d].descripcion+'" ><del><a href="'+webServicesEvidencia[d].url+'" target="_blank">'+webServicesEvidencia[d].nombre+'</a></del></td>'+
										'<td class="text-center"><button type="button" class="btn btn-default btn-sm consultaBorrarEvidencia" data-toggle="tooltip" data-placement="top" title="Borrar" parametros='+parametros+'-'+webServicesEvidencia[d].id+' ><span class="fa fa-recycle"></span></button></td></tr>';	        				
				}
			<%}%>
			if(webServicesEvidencia[d].borrado == false){
				cuerpoEvidencia += '<tr>'+
						'<td data-toggle="tooltip" data-placement="top" title="'+webServicesEvidencia[d].descripcion+'" >'+
							'<a href="'+webServicesEvidencia[d].url+'" '+downloadTarget+'" '+donwloadName+'>'+webServicesEvidencia[d].nombre+'</a>'+
						'</td>'+
				    	'<td class="text-center">'+botones+'</td></tr>';	
			}	
		}
	}
	
	return cuerpoEvidencia;
}


<%
	if (attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("0")|| attributes.get("role_id_tablero").toString().equals("2")){%>
//		alert("admin");
	<%}else{%>
//		alert("no admin");
	<%}%>;	
	
	$("body").on("click", ".nuevaInsLineaAccion",function(event){		
		if ( $("#insLineaAccion").length )
		{
			$("#insLineaAccion").remove();
		}
		if ( $("#modalAccion").length )
		{
			$("#modalAccion").remove();
		}
		event.stopPropagation();
		event.preventDefault();
		var todasLasEtiquetas = "";
		

		/* var institucion = $.ajax({
			url:'/tablero/ajaxSelects2?action=getInstitucion',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		institucion = JSON.parse(institucion);
		var optionInstitucion;

		for(m = 0;m<institucion.length; m++){
			optionInstitucion+='<option value="'+institucion[m].id+'" >'+institucion[m].nombre+'</option>';
		} */

		var periodo = $.ajax({
			url:'/tablero/ajaxSelects2?action=getPeriodo',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		periodo = JSON.parse(periodo);
		var optionPeriodo;		
		
		var anho=$("#periodoSeleccion option:selected").val();
		var version=$("#versionSeleccion option:selected").val();

		for(p = 0;p<periodo.length; p++)
		{
			if(periodo[p].id == anho)
			{
				optionPeriodo+='<option value="'+periodo[p].id+'" selected>'+periodo[p].nombre+'</option>';
			}else{
				optionPeriodo+='<option value="'+periodo[p].id+'" >'+periodo[p].nombre+'</option>';
			}
		}
		
		var versionInsLineaAccion = $.ajax({
			url:'/tablero/ajaxSelects2?action=getVersionInsLineaAccion&anho='+anho,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		versionInsLineaAccion = JSON.parse(versionInsLineaAccion);
	   	
		var optionVersion = "";
		if (versionInsLineaAccion.length > 0) {
			for(v = 0;v<versionInsLineaAccion.length; v++)
			{								
				optionVersion+='<option value="'+versionInsLineaAccion[v].nro+'" >'+versionInsLineaAccion[v].nro+'</option>';		
			}
		}
		/* var lineaAccion = $.ajax({
			url:'/tablero/ajaxSelects2?action=getLineaAccion&borrado=false',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		lineaAccion = JSON.parse(lineaAccion);
		var optionLineaAccion;

		for(i = 0;i<lineaAccion.length; i++){
			optionLineaAccion+='<option value="'+lineaAccion[i].id+'" >'+lineaAccion[i].nombre+'</option>';
		}		 */
		
		var unidadMedida = $.ajax({
			url:'/tablero/ajaxSelects2?action=getUnidadMedida',
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
		
		/* var etiquetas = $.ajax({
			url:'/tablero/ajaxSelects2?action=getEtiqueta',
			type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		etiquetas = JSON.parse(etiquetas);
		
 		for(var l = 0; l < etiquetas.length; l++){
 			todasLasEtiquetas += ' <input type="checkbox" class="cmbEtiqueta" id=cmbEtiqueta-'+etiquetas[l].id+'> '+ etiquetas[l].nombre + '</input></br>';
		} */
		
		var contenido = "";

		contenido =			'<div class="modal fade" id="insLineaAccion" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
							'	<div class="modal-dialog modal-lg">'+
							'		<div class="modal-content" >'+
							'			<div class="modal-header">'+
							'		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
							'		        <h4 class="modal-title">Registrar Línea de Acción por Institución</h4>'+
							'			</div>'+
							'		    <div class="modal-body" id="cuerpoModalInsLineaAccion" >'+
									    
							'				<form role="form" id="formularioInsLineaAccion">'+
							'					<div class="form-group">'+
							'						<label for="nombreInstitucionInsLineaAccion">Nombre Institución</label>'+
							'						<input type="text" name="institucion" id="nombreInstitucionInsLineaAccion" list="listaf1c1" class="form-control"></input>'+
							'					</div>'+
							'					<div class="form-group">'+
							'						<label for="periodo">Periodo</label>'+
							'						<select id="periodoInsLineaAccion" class="form-control">'+optionPeriodo+'</select>'+
							'					</div>'+	
							'					<div class="form-group">'+
							'						<label for="version">Versión</label>'+
							'						<input type="text" id="versionInsLineaAccion" list="listaf1c2" class="form-control"></input>'+							
							'					</div>'+
							'					<div class="form-group">'+
							'						<label for="nombreLineaAccionInsLineaAccion">Lineas de Acción disponibles (cantidad:<span id="cantLAdisp"></span>)</label>'+
							'						<input type="hidden" id="idInsLineaAccion" value="">'+					
							'						<input type="text" name="lineaAccion" id="nombreLineaAccionInsLineaAccion" list="listaf1c3" class="form-control"></input>'+
							'					</div>'+			
							'					<div class="form-group">'+
							'						<label for="unidadMedida">U. Medida</label>'+
							'						<input type="text" id="unidadMedidaInsLineaAccion" class="form-control" placeholder="U. Medida" disabled>'+
							'					</div>'+
							'					<div class="form-group">'+
							'						<label for="meta">Meta</label>'+
							'						<input type="number" id="metaInsLineaAccion" class="form-control" name="meta" placeholder="Ingrese Meta" required >'+
							'					</div>'+								
							'					<div class="form-group">'+
/* 							'						<label for="version">Etiquetas </label></br>'+
													todasLasEtiquetas
							'					</div>'+		 */	
							'				</form>'+			  
							
							'		    </div>'+
							'		</div>'+ 
							'	</div>'+
							'</div>';
							
			$("#programacion").append(contenido);			
			$("#unidadMedidaInsLineaAccion");
			$("#insLineaAccion").find("#formularioInsLineaAccion").append('<div class="form-group" id="guardarInsLineaAccionBoton"><button type="submit" class="btn btn-success" id="guardarInsLineaAccion" >Guardar</button></div>');
			$('#insLineaAccion').modal('show');
			
			function Combo(){
				  this.versionILAFocus = function(){
					
				  var anho = $("#periodoInsLineaAccion option:selected").val(); 				 	
					
				  //var listaDatalist=document.getElementsByTagName('datalist');
					
				    var datosVersionILA = $.ajax({
						url:'/tablero/ajaxSelects2?action=getVersionInsLineaAccion&anho='+anho,
					  	type:'get',
					  	dataType:'json',
					  	async:false       
					}).responseText;				  
					datosVersionILA = JSON.parse(datosVersionILA);
					
					if ( $("#listaf1c2").length ) {
						$("#listaf1c2").remove();
						$('#versionInsLineaAccion').val('');
					}
						
			        //if(listaDatalist.length === 0 )
			        //{
				        var datalistVersionILA = document.createElement('datalist');
				        datalistVersionILA.setAttribute('id','listaf1c2');
				        datalistVersionILA.setAttribute('size','5'); 
				        var ubicacionDatalistVersionILA = document.getElementById('formularioInsLineaAccion');
				        ubicacionDatalistVersionILA.appendChild(datalistVersionILA);
				
				        for(var i = 0; i < datosVersionILA.length ; i++) 
				        {    
				        	var option = document.createElement('option');
				          	option.setAttribute('value',datosVersionILA[i].nro);
				          	option.setAttribute('label',datosVersionILA[i].nro);
				          	datalistVersionILA.appendChild(option);      
				      	} 
			        //}			        			        
				  } 
				  
				// Autocompletado del Nombre de la Institución.
		        this.institucionFocus = function(){
		        	
					var datosInstitucion = $.ajax({
						url:'/tablero/ajaxSelects2?action=getInstitucion',
					  	type:'get',
					  	dataType:'json',
					  	async:false       
					}).responseText;			        
			        datosInstitucion = JSON.parse(datosInstitucion);
					
			        if ( $("#listaf1c1").length ) {
						$("#listaf1c1").remove();
						$('#nombreInstitucionInsLineaAccion').val('');
						$("#listaf1c2").remove();
						$('#periodoInsLineaAccion').val('');
					}
			        
			        var datalistInstitucion = document.createElement('datalist');
			        datalistInstitucion.setAttribute('id','listaf1c1');
			        datalistInstitucion.setAttribute('size','5'); 
			        var ubicacionDatalistInstitucion = document.getElementById('formularioInsLineaAccion');
			        ubicacionDatalistInstitucion.appendChild(datalistInstitucion);
			
			        for(var i = 0; i < datosInstitucion.length ; i++) 
			        {    
			        	var option = document.createElement('option');
			          	option.setAttribute('value',datosInstitucion[i].id);
			          	option.setAttribute('label',datosInstitucion[i].nombre);
			          	datalistInstitucion.appendChild(option);      
			      	}
				}			        
				
		     	// Autocompletado del Nombre de la Institución.
		        this.nombreLAFocus = function(){
		        	
		        	var institucionSeleccionada = $("#nombreInstitucionInsLineaAccion").val();
					var periodoSeleccionado = $("#periodoInsLineaAccion option:selected").val();
					var versionSeleccionado = $("#versionInsLineaAccion").val();
		     		
					var datosLA = $.ajax({
						url:'/tablero/ajaxSelects2?action=getLineasAccionRestantes&institucionId='+institucionSeleccionada+'&periodoId='+periodoSeleccionado+'&versionId='+versionSeleccionado,
					  	type:'get',
					  	dataType:'json',
					  	async:false       
					}).responseText;		        
			        datosLA = JSON.parse(datosLA);
					
			        if ( $("#listaf1c3").length ) {
						$("#listaf1c3").remove();
						$('#nombreLineaAccionInsLineaAccion').val('');
						$('#cantLAdisp').html('cantidad:');
					}
			        
			        var datalistNombreLA = document.createElement('datalist');
			        datalistNombreLA.setAttribute('id','listaf1c3');
			        datalistNombreLA.setAttribute('size','5'); 
			        var ubicacionDatalistNombreLA = document.getElementById('formularioInsLineaAccion');
			        ubicacionDatalistNombreLA.appendChild(datalistNombreLA);
			
			        for(var i = 0; i < datosLA.length ; i++) 
			        {    
			        	var option = document.createElement('option');
			          	option.setAttribute('value',datosLA[i].id);
			          	option.setAttribute('label',datosLA[i].nombre);
			          	datalistNombreLA.appendChild(option);      
			      	}
			        
			        var lineaAccion = $.ajax({
						url:'/tablero/ajaxSelects2?action=getLineaAccion&borrado=false',
					  	type:'get',
					  	dataType:'json',
					  	async:false       
					}).responseText;
					lineaAccion = JSON.parse(lineaAccion);
					var optionLineaAccion;

					$('#cantLAdisp').html(' '+lineasAccionRestantes.length+ ' de '+ lineaAccion.length );
				}
			    
			}
			
			var eje1 = new Combo();
			document.getElementById('versionInsLineaAccion').addEventListener('focus',eje1.versionILAFocus,false);
			//document.getElementById('versionInsLineaAccion').addEventListener('change',eje1.versionILA,false);
			document.getElementById('nombreInstitucionInsLineaAccion').addEventListener('focus',eje1.institucionFocus,false);
			document.getElementById('nombreLineaAccionInsLineaAccion').addEventListener('focus',eje1.nombreLAFocus,false);
			
	});
	
	$("body").on("change", "#versionInsLineaAccion",function(event){	
	   	
		var institucionSeleccionada = $("#nombreInstitucionInsLineaAccion").val();
		var periodoSeleccionado = $("#periodoInsLineaAccion option:selected").val();
		var versionSeleccionado = $("#versionInsLineaAccion").val();		
		
	   	var lineasAccionRestantes = $.ajax({
			url:'/tablero/ajaxSelects2?action=getLineasAccionRestantes&institucionId='+institucionSeleccionada+'&periodoId='+periodoSeleccionado+'&versionId='+versionSeleccionado,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
	   	lineasAccionRestantes = JSON.parse(lineasAccionRestantes);
	   	
		var optionLineasAccionRestantes = "";
		if (lineasAccionRestantes.length > 0) {
			for(v = 0;v<lineasAccionRestantes.length; v++)
			{				
				optionLineasAccionRestantes+='<option value="'+lineasAccionRestantes[v].id+'" >'+lineasAccionRestantes[v].nombre+'</option>';		
			}
		}
		$('#nombreLineaAccionInsLineaAccion').html(optionLineasAccionRestantes);
		
		var lineaAccion = $.ajax({
			url:'/tablero/ajaxSelects2?action=getLineaAccion&borrado=false',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		lineaAccion = JSON.parse(lineaAccion);
		var optionLineaAccion;

		$('#cantLAdisp').html(' '+lineasAccionRestantes.length+ ' de '+ lineaAccion.length );
	   
	});
	
	function validarFormulario(formId, fechaAccion, fechaAccionEdit) {	    
		var validacion=true;	
		 
		if (document.getElementById(formId).checkValidity() == false) {
			validacion=false;
		}
		
		/* $("#formularioDestinatarios :input").each(function(){
			//if (document.getElementById($(this).attr('id')).checkValidity() == false) {
			if (document.getElementById('#cantidadDestinatarioAccion').checkValidity() == false) {
				validacion=false;
			} 
		}); */
				
		if(fechaAccion==true){
			var fechaInicio = $("#fechaInicioAccion").val();
			var fechaFin = $("#fechaFinAccion").val();				
		}else{
			if(fechaAccionEdit==true){
				var fechaInicio = $("#fechaInicio").val();
				var fechaFin = $("#fechaFin").val();
			}
		}
			
		if(fechaInicio != "" && fechaFin != ""){
			if(fechaFin < fechaInicio){
				$("#fechaFinAccion").val("");
				$("#fechaFin").val("");
				alert("Fecha Fin no puede ser menor a Fecha Inicio");			
				validacion=false;				
			}
		}
	
		return validacion;
	}
		
	$("body").on("change", "#nombreLineaAccionInsLineaAccion",function(event){
		//var departamentoId = $(this).attr("parametro");
		var catalogoLineaAccionId = $("#nombreLineaAccionInsLineaAccion option:selected").val();
    	
		var catalogoLineaAccion = $.ajax({
	    	url:'/tablero/ajaxSelects2?action=getLineaAccion&lineaAccionId='+catalogoLineaAccionId,
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		catalogoLineaAccion = JSON.parse(catalogoLineaAccion);
		
		var unidadMedida = $.ajax({
			url:'/tablero/ajaxSelects2?action=getUnidadMedida',
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
	
	$("body").on("click", "#guardarInsLineaAccion",function(event){
		if (validarFormulario("formularioInsLineaAccion",false,false)==true){
				
		event.stopPropagation();
		event.preventDefault(); 
		$("#actualizarInsLineaAccionBoton").remove();
		$("#guardarInsLineaAccionBoton").remove();
		$("#insLineaAccion").find("#formularioInsLineaAccion").append('<div class="form-group" id="guardarInsLineaAccionBoton"><button type="submit" class="btn btn-success" id="guardarInsLineaAccion">Guardar</button></div>');
		var accion = "insInsLineaAccion";
		var lineaAccionId = $("#nombreLineaAccionInsLineaAccion option:selected").val();
		var institucionId = $("#nombreInstitucionInsLineaAccion option:selected").val();
		var periodoId = $("#periodoInsLineaAccion option:selected").val();
	    var meta = document.getElementById('metaInsLineaAccion').value; 
	    var version = document.getElementById('versionInsLineaAccion').value; 
	    var etiquetaSeleccionada = [];
		etiquetaSeleccionada = getEtiquetaSeleccionadas();
		var insLineaAccionId;

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
		        	insLineaAccionId = data.id;
		        	if (data.success == true)
		        	{
		        		
		        		$('#cuerpoInsLineaAccion').html("");
		        		$('#cuerpoInsLineaAccionPosterior').html("");
		        		$('#cuerpoInsLineaAccionAnterior').html(""); 

		        		var insLineaAccion = $.ajax({
		        			url:'/tablero/ajaxSelects2?action=getInsLineaAccion',
		        		  	type:'get',
		        		  	dataType:'json',
		        		  	async:false       
		        		}).responseText;		
		        		insLineaAccion=JSON.parse(insLineaAccion);
		        		
		        		var lineaAccion = $.ajax({
		        			url:'/tablero/ajaxSelects2?action=getLineaAccion',
		        		  	type:'get',
		        		  	dataType:'json',
		        		  	async:false       
		        		}).responseText;
		        		lineaAccion = JSON.parse(lineaAccion);
		        		
		        		var institucion = $.ajax({
		        			url:'/tablero/ajaxSelects2?action=getInstitucion',
		        		  	type:'get',
		        		  	dataType:'json',
		        		  	async:false       
		        		}).responseText;
		        		institucion = JSON.parse(institucion);
		        		
		        		var periodo = $.ajax({
		        			url:'/tablero/ajaxSelects2?action=getPeriodo',
		        		  	type:'get',
		        		  	dataType:'json',
		        		  	async:false       
		        		}).responseText;
		        		periodo = JSON.parse(periodo);
		        		
		        		var unidadMedida = $.ajax({
		        			url:'/tablero/ajaxSelects2?action=getUnidadMedida',
		        		  	type:'get',
		        		  	dataType:'json',
		        		  	async:false       
		        		}).responseText;
		        		unidadMedida = JSON.parse(unidadMedida);

		        		$('#cuerpoModalInsLineaAccion').html('');
		        		$("#cuerpoModalInsLineaAccion").append('<h3 class="text-center">La Línea de Acción se ha insertado con Exito</h3>');
		        				        		
		        		var objeto = new Object();
		        	    for(var t = 0; t < etiquetaSeleccionada.length; t++){
		        			
		        	    	objeto.insLineaAccionId = insLineaAccionId;
		        	    	objeto.etiquetaId = etiquetaSeleccionada[t];
		        	    	objeto.version = version;

		        	    	
		        		  	var info2 = JSON.stringify(objeto);
		        		    $.ajax({
		        		        url: "http://spr.stp.gov.py/tablero/ajaxInserts2?accion=insLineaAccionHasEtiqueta",
		        		        type: 'POST',
		        		        dataType: 'json',
		        		        data: info2,
		        		        contentType: 'application/json',
		        		        mimeType: 'application/json',
		        		        success: function (data) {
		        		        	if(data.success == true)
		        		        	{

		        		        	}else{

		        		        	}
		        		        },
		        		        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
		        		        error: function(data,status,er) {
		        		        	
		        		        	}
		        			 });
		        	    }
		        	    
		        	    //Inserta en la tabla usuario_linea_accion-----------------------------------------------------------------------------------------------------------------------------------------------------
		        	    
		        		var usuarioLineaAccion = new Object();
	        			
		        		usuarioLineaAccion.lineaAccionId =lineaAccionId ;

	        	    	
	        		  	var info2 = JSON.stringify(usuarioLineaAccion);
	        		    $.ajax({
	        		        url: "http://spr.stp.gov.py/tablero/ajaxInserts2?accion=insUsuarioLineaAccion",
	        		        type: 'POST',
	        		        dataType: 'json',
	        		        data: info2,
	        		        contentType: 'application/json',
	        		        mimeType: 'application/json',
	        		        success: function (data) {
	        		        	if(data.success == true)
	        		        	{
									alert("USUARIO LINEA ACCION EXITOSO");
	        		        	}else{

	        		        	}
	        		        },
	        		        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
	        		        error: function(data,status,er) {
	        		        	
	        		        	}
	        			 });
	        		    renderInsLineaAccion(periodoSeleccionado,versionSeleccionado,etiquetaSeleccionado);	        				        													
						
		        	}else{
		
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
	
	
		
	
	$("body").on("click", ".registrosInsLineaAccion",function(event){
		var codigoRegistro = $(this).attr("codigoRegistroInsLineaAccion");
	    var idParsed = codigoRegistro.split("-"); 
	    var id = idParsed[0];
		var lineaAccionId = idParsed[1];
		var institucionId = idParsed[2];
		var periodoId = idParsed[3];
		var meta = idParsed[4];
		var version = idParsed[5];
		var etiquetasUsuario ="";
		
		if ( $("#insLineaAccion").length )
		{
			$("#insLineaAccion").remove();
		}
		if ( $("#modalAccion").length )
		{
			$("#modalAccion").remove();
		}	
		if ( $("#modalEtiquetaUsuario").length )
		{
			$("#modalEtiquetaUsuario").remove();
		}
		if ( $("#modalInstanciaLineaAccionEtiqueta").length )
		{
			$("#modalInstanciaLineaAccionEtiqueta").remove();
		}
		
		
		var lineaAccion = $.ajax({
			url:'/tablero/ajaxSelects2?action=getLineaAccion',
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
			url:'/tablero/ajaxSelects2?action=getInstitucion',
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
			url:'/tablero/ajaxSelects2?action=getPeriodo',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		periodo = JSON.parse(periodo);
		var optionPeriodo;

		for(p = 0;p<periodo.length; p++)
		{
			if(periodo[p].id == 2017)
			{
				optionPeriodo+='<option value="'+periodo[p].id+'" selected>'+periodo[p].nombre+'</option>';
			}else{
				optionPeriodo+='<option value="'+periodo[p].id+'" >'+periodo[p].nombre+'</option>';
			}
		}
		
		var etiquetas = $.ajax({
			url:'/tablero/ajaxSelects2?action=getEtiqueta',
			type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		etiquetas = JSON.parse(etiquetas);
		
		var instanciaEtiqueta = $.ajax({
			url:'/tablero/ajaxSelects2?action=getInsLineaAccionHasEtiqueta&insLineaAccionId='+id,
			type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		instanciaEtiqueta = JSON.parse(instanciaEtiqueta);
		
		var etiquetasSeleccionada = [];
		if(instanciaEtiqueta != null){
			for(var i = 0; i < etiquetas.length; i++){
				for(var l = 0; l < instanciaEtiqueta.length; l++){
					if(instanciaEtiqueta[l].etiqueta_id == etiquetas[i].id && instanciaEtiqueta[l].borrado != true){
						etiquetasUsuario += '<input type="checkbox" class="cmbEditarEtiquetaInstancia" id=e-'+id+'-'+instanciaEtiqueta[l].etiqueta_id+'-'+version+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+meta+' checked="true"><a> '+etiquetas[i].nombre+'</a></br> ';
						etiquetasSeleccionada.push(etiquetas[i].id);
					}else if(instanciaEtiqueta[l].etiqueta_id == etiquetas[i].id && instanciaEtiqueta[l].borrado != false){
						etiquetasUsuario += '<input type="checkbox" class="cmbEditarEtiquetaInstancia" id=e-'+id+'-'+instanciaEtiqueta[l].etiqueta_id+'-'+version+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+meta+'><a> '+etiquetas[i].nombre+'</a></br> ';
						etiquetasSeleccionada.push(etiquetas[i].id);
					}
				}
			}
		}//fin if
			
		for(var h = 0; h < etiquetas.length; h++){
			if (etiquetasSeleccionada.indexOf(etiquetas[h].id)<0){
				etiquetasUsuario += '<input type="checkbox" class="cmbEditarEtiquetaInstancia" id=n-'+id+'-'+etiquetas[h].id+'-'+version+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+meta+'><a> '+etiquetas[h].nombre+'</a></br> ';
				etiquetasSeleccionada.push(etiquetas[h].id);
			}
		}
		
		var contenido = "";

		contenido =			'<div class="modal fade" id="insLineaAccion" data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
							'	<div class="modal-dialog modal-lg">'+
							'		<div class="modal-content" >'+
							'			<div class="modal-header">'+
							'		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
							'		        <h4 class="modal-title">Registrar Línea de Acción por Institución</h4>'+
							'			</div>'+
							'		    <div class="modal-body" id="cuerpoActualizarInsLineaAccion" >'+
									    
							'				<form role="form" id="formularioInsLineaAccion">'+
							'					<div class="form-group">'+
							'						<label for="nombreLineaAccion">Lineas de Acción disponibles (cantidad:<span id="cantLAdisp"></span>)</label>'+
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
							'						<input type="number" id="metaInsLineaAccion" class="form-control" name="meta" placeholder="Ingrese Meta" required>'+
							'					</div>'+
							'					<div class="form-group">'+
							'						<label for="version">Versión</label>'+
							'						<input type="number" id="versionInsLineaAccion" class="form-control" name="version" placeholder="Ingrese Versión" required>'+
							'					</div>'+
							'					<div class="form-group">'+
							'					<label for="etiquetaUsuario">Etiqueta Instancia Linea Acción</label></br>'+
													etiquetasUsuario
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
			url:'/tablero/ajaxSelects2?action=getLineaAccion',
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
			url:'/tablero/ajaxSelects2?action=getInstitucion',
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
			url:'/tablero/ajaxSelects2?action=getPeriodo',
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
	
	$("body").on("click", ".cmbEditarEtiquetaInstancia",function(event){
		var idEtiqueta=$(this).attr('id').split("-");
		var id = idEtiqueta[1];
		var etiqueta = idEtiqueta[2];
		var version = idEtiqueta[3];
		var lineaAccionId = idEtiqueta[4];
		var institucionId = idEtiqueta[5];
		var periodoId = idEtiqueta[6];
		var meta = idEtiqueta[7];

		var nombreEtiqueta = "";
		
		if ( $("#modalEditarUsuario").length )
		{
			$("#modalEditarUsuario").remove();
		}	
		if ( $("#insLineaAccion").length )
		{
			$("#insLineaAccion").remove();
		}	
		
		var etiquetas = $.ajax({
			url:'/tablero/ajaxSelects2?action=getEtiqueta',
			type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		etiquetas = JSON.parse(etiquetas);
				
		if(idEtiqueta[0] == "n" ){
			
			for(var l = 0; l < etiquetas.length; l++){
				if(etiquetas[l].id == etiqueta){
					nombreEtiqueta = etiquetas[l].nombre;
				}
			}
			
			var objeto = new Object();
				
			objeto.insLineaAccionId = id;
			objeto.etiquetaId = etiqueta;
			objeto.version = version;
	    	
			var cuerpoModalEtiquetaUsuario = "";

		    cuerpoModalEtiquetaUsuario =	'<div class="modal fade" id="modalEtiquetaUsuario" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
			'	<div class="modal-dialog modal-lg" style="width:90%">'+
			'		<div class="modal-content" >'+
			'			<div class="modal-header">'+
			'		        <button type="button" class="close registrosInsLineaAccion" data-dismiss="modal" codigoRegistroInsLineaAccion="'+id+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+meta+'-'+version+'"><span aria-hidden="true">&times;</span></button>'+
			'		        <h4 class="modal-title">Editar Usuario</h4>'+   
			'			</div>'+
			'		    <div class="modal-body" id="cuerpoModal">'+

			'		      	<div class="row">'+ 
			'		      		<div class="col-md-12">'+
			'						<div class="box box-warning">'+
			'		                	<div class="box-header with-border">'+
			'		                  		<h3 class="box-title"></h3>'+
			'               			</div>'+//fin box-heder
			'               			<div class="box-body" id="cuerpoModalUsuario">'+
			
			'								<div id="mensajeBorradoUsuario"><center><h1>Ud agrego la etiqueta '+nombreEtiqueta+' a este usuario exitosamente!! </h1></center></div>'+
			
			'							</div>'+
			'						</div>'+
			'					</div>'+
			'				</div>'+

			
			'			</div>'+
			'			<div class="modal-footer"  id="agregarBotonUsuario">'+
			'				<button type="button" class="btn btn-success btn-sm registrosInsLineaAccion" codigoRegistroInsLineaAccion="'+id+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+meta+'-'+version+'">Volver</button>'+
			'			</div>'+
			'		</div>'+ 
			'	</div>'+
			'</div>';  

			$("body").append(cuerpoModalEtiquetaUsuario);
			$("#modalEtiquetaUsuario").modal('show');
			
		  	var info = JSON.stringify(objeto);
		    $.ajax({
		        url: "http://spr.stp.gov.py/tablero/ajaxInserts2?accion=insLineaAccionHasEtiqueta",
		        type: 'POST',
		        dataType: 'json',
		        data: info,
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        success: function (data) {
		        	if(data.success == true)
		        	{
		            	//$("#cuerpoModalUsuario").html("<h3 class='text-center'>ETIQUETA GUARDADO EXITOSAMENTE!!</h3>");
		        		//renderUsuarios();	
		        		renderInsLineaAccion(periodoSeleccionado,versionSeleccionado,etiquetaSeleccionado);
		        	}else{

		            	//$("#cuerpoModalUsuario").html("<h3 class='text-center'>ERROR!! al intentar guardar este usuario y etiqueta, probablemente ya existe un usuario con esta Etiqueta.</h3>");
		        	}
		        },
		        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
		        error: function(data,status,er) {
		        	
		        	}
			 });

		}else{

			for(var l = 0; l < etiquetas.length; l++){
				if(etiquetas[l].id == etiqueta){
					nombreEtiqueta = etiquetas[l].nombre;
				}
			}
			
			var insLineaAccion = $.ajax({
				url:'/tablero/ajaxSelects2?action=getInsLineaAccionHasEtiqueta&insLineaAccionId='+id+'&etiquetaId='+etiqueta,
			  	type:'get',
			  	dataType:'json',
			  	async:false
			}).responseText;
			insLineaAccion = JSON.parse(insLineaAccion);
						
		    var objeto = new Object();
		    objeto.insLineaAccionId = id;
		    objeto.etiquetaId = etiqueta;
		    objeto.borrado= insLineaAccion[0].borrado;
		    
			var cuerpoModalInstanciaEtiqueta = "";

			cuerpoModalInstanciaEtiqueta =	'<div class="modal fade" id="modalInstanciaLineaAccionEtiqueta" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
			'	<div class="modal-dialog modal-lg" style="width:90%">'+
			'		<div class="modal-content" >'+
			'			<div class="modal-header">'+
			'		        <button type="button" class="close registrosInsLineaAccion" data-dismiss="modal" codigoRegistroInsLineaAccion="'+id+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+meta+'-'+version+'"><span aria-hidden="true">&times;</span></button>'+
			'		        <h4 class="modal-title">Editar Usuario</h4>'+   
			'			</div>'+
			'		    <div class="modal-body" id="cuerpoModal">'+

			'		      	<div class="row">'+ 
			'		      		<div class="col-md-12">'+
			'						<div class="box box-warning">'+
			'		                	<div class="box-header with-border">'+
			'		                  		<h3 class="box-title"></h3>'+
			'               			</div>'+//fin box-heder
			'               			<div class="box-body" id="cuerpoModalUsuario">'+
			
			'								<div id="mensajeBorradoUsuario"><center><h1>Ud a modificado el estado de la etiqueta '+nombreEtiqueta+' exitosamente!!</h1></center></div>'+
			
			'							</div>'+
			'						</div>'+
			'					</div>'+
			'				</div>'+

			
			'			</div>'+
			'			<div class="modal-footer"  id="agregarBotonUsuario">'+
			'				<button type="button" class="btn btn-success btn-sm registrosInsLineaAccion" codigoRegistroInsLineaAccion="'+id+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+meta+'-'+version+'">Volver</button>'+
			'			</div>'+
			'		</div>'+ 
			'	</div>'+
			'</div>';  

			$("body").append(cuerpoModalInstanciaEtiqueta);
			$("#modalInstanciaLineaAccionEtiqueta").modal('show');


		  	var info = JSON.stringify(objeto);
		    $.ajax({
		        url: "http://spr.stp.gov.py/tablero/ajaxUpdate2?accion=borradoInstanciaEtiqueta",
		        type: 'POST',
		        dataType: 'json',
		        data: info,
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        success: function (data) {
		        	
		        	if(data.success == true){
		        		
		        	    //Inserta en la tabla usuario_linea_accion-----------------------------------------------------------------------------------------------------------------------------------------------------
		        	   	renderInsLineaAccion(periodoSeleccionado,versionSeleccionado,etiquetaSeleccionado);

		        		var usuarioLineaAccion = new Object();
	        			
		        		usuarioLineaAccion.lineaAccionId =lineaAccionId ;

	        	    	
	        		  	var info2 = JSON.stringify(usuarioLineaAccion);
	        		    $.ajax({
	        		        url: "http://spr.stp.gov.py/tablero/ajaxInserts2?accion=insUsuarioLineaAccion",
	        		        type: 'POST',
	        		        dataType: 'json',
	        		        data: info2,
	        		        contentType: 'application/json',
	        		        mimeType: 'application/json',
	        		        success: function (data) {
	        		        	if(data.success == true)
	        		        	{
									alert("USUARIO LINEA ACCION EXITOSO");
	        		        	}else{

	        		        	}
	        		        },
	        		        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
	        		        error: function(data,status,er) {
	        		        	
	        		        	}
	        			 });
		        	}

		        },

		        error: function(data,status,er) {
		        	
		        	}
			 });

		}

	});
	
	$("body").on("click", "#actualizarInsLineaAccion",function(event){		
		if (validarFormulario("formularioInsLineaAccion",false,false)==true){
			event.stopPropagation();
			event.preventDefault(); 

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
		        		
		        		$('#cuerpoInsLineaAccion').html("");
		        		$('#cuerpoInsLineaAccionPosterior').html("");
		        		$('#cuerpoInsLineaAccionAnterior').html(""); 

		        		var insLineaAccion = $.ajax({
		        			url:'/tablero/ajaxSelects2?action=getInsLineaAccion',
		        		  	type:'get',
		        		  	dataType:'json',
		        		  	async:false       
		        		}).responseText;		
		        		insLineaAccion=JSON.parse(insLineaAccion);
		        		
		        		var lineaAccion = $.ajax({
		        			url:'/tablero/ajaxSelects2?action=getLineaAccion',
		        		  	type:'get',
		        		  	dataType:'json',
		        		  	async:false       
		        		}).responseText;
		        		lineaAccion = JSON.parse(lineaAccion);
		        		
		        		var institucion = $.ajax({
		        			url:'/tablero/ajaxSelects2?action=getInstitucion',
		        		  	type:'get',
		        		  	dataType:'json',
		        		  	async:false       
		        		}).responseText;
		        		institucion = JSON.parse(institucion);
		        		
		        		var periodo = $.ajax({
		        			url:'/tablero/ajaxSelects2?action=getPeriodo',
		        		  	type:'get',
		        		  	dataType:'json',
		        		  	async:false       
		        		}).responseText;
		        		periodo = JSON.parse(periodo);
		        		
		        		var unidadMedida = $.ajax({
		        			url:'/tablero/ajaxSelects2?action=getUnidadMedida',
		        		  	type:'get',
		        		  	dataType:'json',
		        		  	async:false       
		        		}).responseText;
		        		unidadMedida = JSON.parse(unidadMedida);

		        		$('#cuerpoActualizarInsLineaAccion').html('');
		        		$("#cuerpoActualizarInsLineaAccion").append('<h3 class="text-center">La Línea de Acción se ha modificado con Exito</h3>');
		        		
		        		
		        		renderInsLineaAccion(periodoSeleccionado,versionSeleccionado,etiquetaSeleccionado);
		        		
		        		
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
		
	
		}
	});	
	
	$("body").on("click", ".iconoBorradoInsLineaAccion",function(event){
		
		$("#botonRestaurarInsLineaAccion").remove();
		$("#botonBorradoInsLineaAccion").remove();
		$("#mensajeBorradoInsLineaAccion").html("");
		$("#mensajeBorradoInsLineaAccion").append('<h3><center>Aguarde un momento mientras se procesa su pedido. Esto puede tardar varios minutos</center></h3>');
		
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
				    		var insLineaAccion = $.ajax({
				    			url:'/tablero/ajaxSelects2?action=getInsLineaAccion',
				    		  	type:'get',
				    		  	dataType:'json',
				    		  	async:false       
				    		}).responseText;		
				    		insLineaAccion=JSON.parse(insLineaAccion);
				    		
				    		var lineaAccion = $.ajax({
				    			url:'/tablero/ajaxSelects2?action=getLineaAccion',
				    		  	type:'get',
				    		  	dataType:'json',
				    		  	async:false       
				    		}).responseText;
				    		lineaAccion = JSON.parse(lineaAccion);
				    		
				    		var institucion = $.ajax({
				    			url:'/tablero/ajaxSelects2?action=getInstitucion',
				    		  	type:'get',
				    		  	dataType:'json',
				    		  	async:false       
				    		}).responseText;
				    		institucion = JSON.parse(institucion);
				    		
				    		var periodo = $.ajax({
				    			url:'/tablero/ajaxSelects2?action=getPeriodo',
				    		  	type:'get',
				    		  	dataType:'json',
				    		  	async:false       
				    		}).responseText;
				    		periodo = JSON.parse(periodo);
				    		
				    		var unidadMedida = $.ajax({
				    			url:'/tablero/ajaxSelects2?action=getUnidadMedida',
				    		  	type:'get',
				    		  	dataType:'json',
				    		  	async:false       
				    		}).responseText;
				    		unidadMedida = JSON.parse(unidadMedida);

				    		
				    		renderInsLineaAccion(periodoSeleccionado,versionSeleccionado,etiquetaSeleccionado);
				    						    		
				    		$("#mensajeBorradoInsLineaAccion").html("");
				    		$("#mensajeBorradoInsLineaAccion").append('<h3><center>Cambio exitoso!!</center></h3>');

				    		
				    		
				       	}
					},
					error: function(data,status,er)
					{

					}
				});
	});	
	
	$("body").on("click", ".eliminarModal",function(event){
	    if ( $("#modalConsultaBorrarInsLineaAccion").length )
		{
			$("#modalConsultaBorrarInsLineaAccion").remove();
		}
	});	
		
	function renderAcciones(insLineaAccionId,lineaAccionId,institucionId,periodoId){
		
		if ( $("#dataTablesAcciones").length )
		{
			/* var tableAccion="";
			tableAccion=
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
				'               			<div class="box-body" id="cuerpoTablaAccion">'+
				
    			
		
				'               			</div>'+//fin box-body
				'                		</div>'+	
				'                	</div>';
			$("#tableAccion").html("");
			$("#tableAccion").html(tableAccion); */
			
			//$('#dataTablesAcciones').DataTable().fnDestroy();
			$('#dataTablesAcciones').DataTable().destroy();
				
		}
		
		 var f = new Date();
		    if( (f.getMonth() +1) < 10 ){
		    	var mes =( 0 +""+ (f.getMonth() +1));
		    }else{
		    	var mes =f.getMonth()+1;
		    }
		    
		    if( (f.getDate()) < 10 ){
		    	var dia =( 0 +""+ (f.getDate()));
		    }else{
		    	var dia = f.getDate();
		    }
		    var fechaActual = (f.getFullYear() + "-" + mes + "-" + dia);
			
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
			if ( $("#modalDestinatario").length )
			{
				$("#modalDestinatario").remove();
			}
			var lineaAccion = $.ajax({
				url:'/tablero/ajaxSelects2?action=getLineaAccion',
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
				url:'/tablero/ajaxSelects2?action=getAccionCatalogo',
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
				url:'/tablero/ajaxSelects2?action=getInstitucion',
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
				url:'/tablero/ajaxSelects2?action=getPeriodo',
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
				url:'/tablero/ajaxSelects2?action=getUnidadMedida',
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
		    	url:'/tablero/ajaxSelects?action=getDepartamento',
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
		    	url:'/tablero/ajaxSelects?action=getDistrito',
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
			distritos = JSON.parse(distritos);
			
			var accion = $.ajax({
				url:'/tablero/ajaxSelects2?action=getAccion&lineaAccionId='+insLineaAccionId,
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			accion = JSON.parse(accion);
			
			var cuerpoAccion = "";
			renderAccion();		
			
			function renderAccion(){
				
				var nombreDepartamento;
				var nombreDistrito;
				var nombreAccionCatalogo;
				

				for(var a = 0; a < accion.length; a++)
				{	
					if(onoff==true && accion[a].borrado == true){
						// pasa a la siguiente fila en el for ++				
					}else{
						var suMetas = 0 ;
						suMetas = accion[a].meta1 + accion[a].meta2 + accion[a].meta3 + accion[a].meta4; 
						
						for(var f = 0; f < catalogoAccion.length; f++)
						{
							if(accion[a].accionCatalogoId == catalogoAccion[f].id){
								nombreAccionCatalogo = catalogoAccion[f].nombre;
								}
						}			
						
						for(var d = 0; d < departamentos.length; d++)
						{
							if(accion[a].departamentoId == departamentos[d].idDepartamento){
								nombreDepartamento = departamentos[d].nombreDepartamento;
								//cuerpoAccion +="<td class='text-center'>"+nombreDepartamento+"</td>";
								}
						}
						

						for(var e = 0; e < distritos.length; e++)
						{
							if(accion[a].distritoId == distritos[e].id && accion[a].departamentoId == distritos[e].departamentoId){
								nombreDistrito = distritos[e].descripcion;

							}
						}

						var nombreUnidadMedidaAccion = "";
						for(var j = 0; j < catalogoAccion.length; j++){
							if(accion[a].accionCatalogoId == catalogoAccion[j].id){
								nombreUnidadMedidaAccion = "";
								for(i = 0; i < unidadMedida.length; i++){
									
									if (catalogoAccion[j].idUnidadMedida == unidadMedida[i].id ){
										nombreUnidadMedidaAccion =  unidadMedida[i].descripcion;
									}
								}
							}	
						}
								
						if(accion[a].borrado == true){
							<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") ){%>
								cuerpoAccion +="<tr><td class='text-center'><del>"+nombreAccionCatalogo+"</del></td><td class='text-center'><del>"+nombreDepartamento+"</del></td><td class='text-center'><del>"+nombreDistrito+"</del></td><td class='text-center' style='display:none;'><del>"+accion[a].fechaInicio+"</del></td><td class='text-center' style='display:none;'><del>"+accion[a].fechaFin+"</del></td><td class='text-center'><del>"+nombreUnidadMedidaAccion+"</del></td><td class='text-center' style='display:none;'><del>"+numeroConComa(parseFloat(accion[a].meta1).toFixed(2))+"</del></td><td class='text-center' style='display:none;'><del>"+numeroConComa(parseFloat(accion[a].meta2).toFixed(2))+"</del></td><td class='text-center' style='display:none;'><del>"+numeroConComa(parseFloat(accion[a].meta3).toFixed(2))+"</del></td><td class='text-center' style='display:none;'><del>"+numeroConComa(parseFloat(accion[a].meta4).toFixed(2))+"</del></td><td class='text-center' style='display:none;'><del>"+numeroConComa(parseFloat(suMetas).toFixed(2))+"</del></td><td class='text-center'><button type='button' class='btn btn-default btn-sm consultaBorrarAccion'  parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+"-"+accion[a].accionCatalogoId+" data-toggle='tooltip' data-placement='top' title='Restaurar Acción'><span class='fa fa-recycle'></span></button></td></tr>";
							<%}%>
						}else{
							<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
								cuerpoAccion +="<tr><td class='text-center'>"+nombreAccionCatalogo+"</td><td class='text-center'>"+nombreDepartamento+"</td><td class='text-center'>"+nombreDistrito+"</td><td class='text-center' style='display:none;'>"+accion[a].fechaInicio+"</td><td class='text-center' style='display:none;'>"+accion[a].fechaFin+"</td><td class='text-center'>"+nombreUnidadMedidaAccion+"</td><td class='text-center' style='display:none;'>"+numeroConComa(parseFloat(accion[a].meta1).toFixed(2))+"</td><td class='text-center' style='display:none;'>"+numeroConComa(parseFloat(accion[a].meta2).toFixed(2))+"</td><td class='text-center' style='display:none;'>"+numeroConComa(parseFloat(accion[a].meta3).toFixed(2))+"</td><td class='text-center' style='display:none;'>"+numeroConComa(parseFloat(accion[a].meta4).toFixed(2))+"</td><td class='text-center' style='display:none;'>"+numeroConComa(parseFloat(suMetas).toFixed(2))+"</td><td class='text-center'><button type='button' class='btn btn-default btn-sm modalVincularProducto' data-toggle='tooltip' data-placement='top' title='Vincular Acción a Productos Presupuestarios' parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+"><span>Gs</span></button><button type='button' class='btn btn-default btn-sm agregarActividad' title='Agregar Cronograma' parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+"-"+accion[a].accionCatalogoId+" ><span class='glyphicon glyphicon-time'></span></button><button type='button' class='btn btn-default btn-sm editarAccion' parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+"-"+accion[a].accionCatalogoId+" data-toggle='tooltip' data-placement='top' title='Editar Acción'><span class='glyphicon glyphicon-pencil'></span></button><button type='button' class='btn btn-default btn-sm consultaBorrarAccion'  parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+"-"+accion[a].accionCatalogoId+" data-toggle='tooltip' data-placement='top' title='Borrar Acción'><span class='glyphicon glyphicon-trash'></span></button><button type='button' class='btn btn-default btn-sm modalDestinatario'  parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+"-"+accion[a].accionCatalogoId+" data-toggle='tooltip' data-placement='top' title='Agregar Destinatario'><span class='glyphicon glyphicon-user'></span></button></td></tr>";
							<%} if (attributes.get("role_id_tablero").toString().equals("3")){%>
								cuerpoAccion +="<tr><td class='text-center'>"+nombreAccionCatalogo+"</td><td class='text-center'>"+nombreDepartamento+"</td><td class='text-center'>"+nombreDistrito+"</td><td class='text-center' style='display:none;'>"+accion[a].fechaInicio+"</td><td class='text-center' style='display:none;'>"+accion[a].fechaFin+"</td><td class='text-center'>"+nombreUnidadMedidaAccion+"</td><td class='text-center' style='display:none;'>"+numeroConComa(parseFloat(accion[a].meta1).toFixed(2))+"</td><td class='text-center' style='display:none;'>"+numeroConComa(parseFloat(accion[a].meta2).toFixed(2))+"</td><td class='text-center' style='display:none;'>"+numeroConComa(parseFloat(accion[a].meta3).toFixed(2))+"</td><td class='text-center' style='display:none;'>"+numeroConComa(parseFloat(accion[a].meta4).toFixed(2))+"</td><td class='text-center' style='display:none;'>"+numeroConComa(parseFloat(suMetas).toFixed(2))+"</td><td class='text-center'><button type='button' class='btn btn-default btn-sm modalVincularProducto' data-toggle='tooltip' data-placement='top' title='Vincular Acción a Productos Presupuestarios' parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+"><span>Gs</span></button><button type='button' class='btn btn-default btn-sm agregarActividad' title='Agregar Cronograma' parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+"-"+accion[a].accionCatalogoId+" ><span class='glyphicon glyphicon-time'></span></button><button type='button' class='btn btn-default btn-sm modalDestinatario'  parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+"-"+accion[a].accionCatalogoId+" data-toggle='tooltip' data-placement='top' title='Agregar Destinatario'><span class='glyphicon glyphicon-user'></span></button></td></tr>";
							<%}%>
						}
					}
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
								'		    <div class="modal-body" id="accionCuerpo" >';
								
								
			<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>		
			
			
			cuerpoModalAccion +='		      	<div class="row">'+
								'				 <form role="form" id="formularioAccion">'+
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
								'									<div class="table-responsive">'+
								'										<table class="table table-hover">'+
								'											<tbody>'+
								'												<tr><td><div class="form-group"><label for="nombreAccion">Acción</label><select id="selectorCatalogoAccion" class="form-control">'+optionCatalogoAccion+'</select><input type="hidden" class="form-control" id="insLineaAccionId" value="'+insLineaAccionId+'"></div></td><td><div class="form-group"><label for="umedida">U. medida</label><input type="text" id="unidadMedidaAccion" value="" class="form-control" disabled> </div></td></tr>'+
								'												<tr><td><div class="form-group"><label for="departamento">Departamento</label><select id="selectorDepartamento" name="departamento" class="form-control">'+optionDepartamentos+'</select></div></td><td><div class="form-group"><label for="distrito">Distrito</label><select name="departamento" class="form-control" id="distritosDepartamento"></select></div></td></tr>'+
								/* '												<tr><td><div class="form-group"><label for="fechaInicioAccion">Fecha Inicio</label><input type="date" id="fechaInicioAccion" class="form-control" value="'+fechaActual+'" required /></div></td><td><div class="form-group"><label for="fechaFinAccion">Fecha Fin</label><input type="date" id="fechaFinAccion" class="form-control" required /></div></td></tr>'+ */							
								'											</tbody>'+							           
								'										</table>'+
								'									</div>'+
								'									<div class="row">'+
								'			      					    <div class="form-group col-md-3">'+
								/* '						  						<label for="totalFinanciero-formulario">Primer Trimestre</label>'+ */
								'				      						<div class="input-group input-group-sm">'+						      			
								'								    				<input type="hidden" name="primerTrimestre" id="primerTrimestre-formulario" value="0" class="form-control" required>'+
								'													<input type="hidden" class="form-control" id="versionAccion" value="3">'+//Aqui estan los input hidden que en este formulario son 3
								'													<input type="hidden" class="form-control" id="costoAccion" value="99">'+
								'													<input type="hidden" class="form-control" id="pesoAccion" value="1">'+
								'				      						</div>'+
								'			  					    	</div>'+
								'				     					<div class="form-group col-md-3">'+
								/* '							  					<label for="totalFinanciero-formulario">Segundo Trimestre</label>'+ */
								'					      					<div class="input-group input-group-sm">'+
								'			  					    			<input type="hidden" name="segundoTrimestre" id="segundoTrimestre-formulario" value="0" class="form-control" required>'+
								'					      					</div>'+
								'								    		</div>'+
								'				     					<div class="form-group col-md-3">'+
								/* '							  					<label for="totalFinanciero-formulario">Tercer Trimestre</label>'+ */
								'					      					<div class="input-group input-group-sm">'+
								'			  					    			<input type="hidden" name="tercerTrimestre" id="tercerTrimestre-formulario" value="0" class="form-control" required>'+
								'					      					</div>'+
								'								    		</div>'+
								'			      					    <div class="form-group col-md-3">'+
								/* '						  					<label for="totalFinanciero-formulario">Cuarto Trimestre</label>'+ */
								'				      						<div class="input-group input-group-sm">'+
								'								    				<input type="hidden" name="cuartoTrimestre" id="cuartoTrimestre-formulario" value="0" class="form-control" required>'+
								'				      						</div>'+
								'							    		</div>'+
								'			  						</div>'+				
								'               			</div>'+//fin box-body
								'							<div class="modal-footer">'+
								'								<button type="submit" class="btn btn-success btn-sm guardarAccion" parametros = '+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'>Guardar Acción</button>'+
								'							</div>'+
								'                		</div>'+	
								'                	</div>'+				
								'				  </form>'+
								'                </div>';										
								
			<%}%>	
			
			cuerpoModalAccion +='		      	<div class="row" id="tableAccion">'+ 
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
								'               			<div class="box-body" id="cuerpoTablaAccion">'+
								
	                			
						
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
			$('#cuerpoTablaAccion').html("");

			var tablaAccion ='     			<div class="table-responsive">'+
			'	                				<table class="table table-hover table-bordered" id="dataTablesAcciones">'+
			'	                					<thead>'+
			'	                						<tr class="active"><th rowspan="2" class="text-center">Acción</th><th rowspan="2" class="text-center">Depto</th><th rowspan="2" class="text-center">Distrito</th><th rowspan="2" class="text-center" style="display:none;">Fecha Inicio</th><th rowspan="2" class="text-center" style="display:none;">Fecha Fin</th><th rowspan="2" class="text-center">Unidad Medida</th><th colspan="4" class="text-center" style="display:none;">Metas</th><th rowspan="2" class="text-center" style="display:none;">Total Metas</th><th rowspan="2" class="text-center" style="min-width:130px">Administrar Acción</th></tr>'+
			'	                						<tr class="active" style="display:none;"><th class="text-center" style="display:none;">1er Trimestre</th><th class="text-center" style="display:none;">2do Trimestre</th><th class="text-center" style="display:none;">3er Trimestre</th><th class="text-center" style="display:none;">4to Trimestre</th></tr>'+
			'	                					</thead>'+
			'										<tfoot>'+
			'								 			<tr>'+
			'								 				<th></th><th></th><th></th><th style="display:none;"></th><th style="display:none;"></th><th></th><th style="display:none;"></th><th style="display:none;"></th><th style="display:none;"></th><th style="display:none;"></th><th style="display:none;"></th><th></th>'+
			'								 			</tr>'+
			'								    	</tfoot>'+
			'	                						<tbody id="tablaAccionesPrecargadas">'+
			'	                						</tbody>'+
			'	                				</table>'+
			'	                			</div>';
			$('#cuerpoTablaAccion').append(tablaAccion);
			
			$('#tablaAccionesPrecargadas').append(cuerpoAccion);
			$('#modalAccion').modal('show');
			$("#selectorCatalogoAccion").change();
			$("#selectorDepartamento").change();			
			$('#dataTablesAcciones').dataTable({
		         /*"footerCallback": function ( row, data, start, end, display ) {
		            var api = this.api(), data;
		 		            
		         // saca los puntos y <del> de la cadena para pasarlo a entero
		            var intVal = function(i){
		            	if(typeof i==='string'){	
		            		i=i.replace(/[\."<\/*del>""Gs\."]/g, '');
		            		i=i.replace(/[","]/g, '.');
		            		i=i*1;		            		
		            	}else{
		            		if(typeof i==='number'){
		            			i=i;		            			
		            	}else{
		            		i=0;
		            	}
		            }
		            	return i;
		            };
		          
		         // total general para todas las paginas de la columna
		            total4 = api
		                .column( 4 )
		                .data()
		                .reduce( function (a, b) {		                    
		                	return intVal(a) + intVal(b);
		                }, 0 );
		 
		         // total por pagina segun número de columna
		            pageTotal4 = api
		                .column( 4, { page: 'current'} )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                }, 0 );
		         /* // total general para todas las paginas de la columna
		            total7 = api
		                .column( 7 )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                }, 0 );
		 
		         // total por pagina segun número de columna
		            pageTotal7 = api
		                .column( 7, { page: 'current'} )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                }, 0 );
		         
		         // total general para todas las paginas de la columna
		            total8 = api
		                .column( 8 )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                }, 0 );
		 
		         // total por pagina segun número de columna
		            pageTotal8 = api
		                .column( 8, { page: 'current'} )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                }, 0 );
		         
		         // total general para todas las paginas de la columna
		            total9 = api
		                .column( 9 )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                }, 0 );
		 
		         // total por pagina segun número de columna
		            pageTotal9 = api
		                .column( 9, { page: 'current'} )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                }, 0 );
		         
		         // total general para todas las paginas de la columna
		            total10 = api
		                .column( 10 )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                }, 0 );
		 
		         // total por pagina segun número de columna
		            pageTotal10 = api
		                .column( 10, { page: 'current'} )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                }, 0 );
		  
		          // se muestran los valores de los totales en el footer del table
		            $( api.column( 6 ).footer() ).html(
		            		'Total Pág. '+ numeroConComa(pageTotal6) +' (Total Gral. '+ numeroConComa(total6) +')'
		            );
		         // se muestran los valores de los totales en el footer del table
		            $( api.column( 7 ).footer() ).html(
		            		'Total Pág. '+ numeroConComa(pageTotal7) +' (Total Gral. '+ numeroConComa(total7) +')'
		            );
		         // se muestran los valores de los totales en el footer del table
		            $( api.column( 8 ).footer() ).html(
		            		'Total Pág. '+ numeroConComa(pageTotal8) +' (Total Gral. '+ numeroConComa(total8) +')'
		            );
		         // se muestran los valores de los totales en el footer del table
		            $( api.column( 9 ).footer() ).html(
		            		'Total Pág. '+ numeroConComa(pageTotal9) +' (Total Gral. '+ numeroConComa(total9) +')'
		            ); 
		         // se muestran los valores de los totales en el footer del table
		            $( api.column( 4 ).footer() ).html(
		            		'Total Pág. '+ numeroConComa(pageTotal4) +' (Total Gral. '+ numeroConComa(total4) +')'
		            );
		        }, */
		        dom: 'Bfrtip',
		        buttons: [
		                    {
		                        extend: 'copy',
		                        exportOptions: {
		                    columns: [ 0, 1, 2, 5 ]
		                }
		                    },
		                    {
		                        extend: 'csv',
		                        exportOptions: {
		                    columns: [ 0, 1, 2, 5 ]
		                }
		                    },
		                    {
		                        extend: 'excel',
		                        exportOptions: {
		                    columns: [ 0, 1, 2, 5 ]
		                }
		                    },
		                    {
		                        extend: 'pdf',
		                        orientation: 'landscape',
		                        exportOptions: {
		                    columns: [ 0, 1, 2, 5 ]
		                }
		                    },
		                    {
		                        extend: 'print',
		                        exportOptions: {
		                    columns: [ 0, 1, 2, 5 ]
		                }
		                    }
		                ]
		});		
	 	
	}
			
	$("body").on("click", ".agregarAccion",function(event){
		var parametros = $(this).attr("parametros");
		var idParsed = parametros.split("-"); 
	    var insLineaAccionId = idParsed[0];
	    var lineaAccionId = idParsed[1];
	    var institucionId = idParsed[2];
	    var periodoId = idParsed[3];
	    
	    renderAcciones(insLineaAccionId,lineaAccionId,institucionId,periodoId);
	   
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
			url:'/tablero/ajaxSelects2?action=getAccionCatalogo',
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
			url:'/tablero/ajaxSelects2?action=getUnidadMedida',
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
			url:'/tablero/ajaxSelects2?action=getAccion&accionId='+id,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		accion = JSON.parse(accion);
		
		

		var departamentos = $.ajax({
	    	url:'/tablero/ajaxSelects?action=getDepartamento',
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
	    	url:'/tablero/ajaxSelects?action=getDistrito&departamento='+accion[0].departamentoId,
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
					<% if (attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("2")){%>
					cuerpoAccion +="<tr><td class='text-center'><del>"+nombreDepartamento+"</del></td><td class='text-center'><del>"+nombreDistrito+"</del></td><td class='text-center'><del>"+accion[z].fechaInicio+"</del></td><td class='text-center'><del>"+accion[z].fechaFin+"</del></td><td class='text-center'><del>"+numeroConComa(parseFloat(accion[z].costo).toFixed(2))+"</del></td><td class='text-center'><del>"+numeroConComa(parseFloat(accion[z].meta1).toFixed(2))+"</del></td><td class='text-center'><del>"+numeroConComa(parseFloat(accion[z].meta2).toFixed(2))+"</del></td><td class='text-center'><del>"+numeroConComa(parseFloat(accion[z].meta3).toFixed(2))+"</del></td><td class='text-center'><del>"+numeroConComa(parseFloat(accion[z].meta4).toFixed(2))+"</del></td><td class='text-center'><del>"+accion[z].peso+"</del></td><td class='text-center'><del>"+accion[z].version+"</del></td><td class='text-center'><del>"+accion[z].borrado+"</del></td><td class='text-center'><span class='modalVincularProducto' parametros="+accion[z].id+">Gs.</span></td><td class='text-center'><span class='glyphicon glyphicon-pencil editarAccion' parametros="+accion[z].id+"></span></td></tr>";
					<% }%>
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
							'				 <form role="form" id="formularioAccion">'+
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
							'									<div class="table-responsive">'+
							'										<table class="table table-hover">'+
							'											<tbody>'+																																																																																					
							'												<tr><td><div class="form-group"><label for="nombreAccion">Acción</label><select id="selectorCatalogoAccion" name="catalogoAccion"class="form-control">'+optionCatalogoAccion+'</select><input type="hidden" class="form-control" id="insLineaAccionId" value="'+insLineaAccionId+'"></div></td><td><div class="form-group"><label for="umedida">U. medida</label><input type="text" id="unidadMedidaAccion" class="form-control" disabled></div></td></tr>'+
							'												<tr><td><div class="form-group"><label for="departamento">Departamento</label><select id="selectorDepartamento" name="departamento" class="form-control">'+optionDepartamentos+'</select></div></td><td><div class="form-group"><label for="distrito">Distrito</label><select class="form-control" id="distritosDepartamento">'+optionDistritos+'</select></div></td></tr>'+
							/* '												<tr><td><div class="form-group"><label for="fechaInicio">Fecha Inicio</label><input type="date"  id="fechaInicio" value='+accion[0].fechaInicio+' class="form-control" required></div></td><td><div class="form-group"><label for="fichaFin">Fecha Fin</label><input type="date"  id="fechaFin" value='+accion[0].fechaFin+' class="form-control" required></div></td></tr>'+ */

							'											</tbody>'+							           
							'										</table>'+
							'									</div>'+
							'									<div class="row">'+
							'			      					    <div class="form-group col-md-3">'+
							/* '						  						<label for="totalFinanciero-formulario">Primer Trimestre</label>'+ */
							'				      						<div class="input-group input-group-sm">'+						      			
							'								    				<input type="hidden" name="primerTrimestre" id="primerTrimestre-formulario" value='+accion[0].meta1+' class="form-control" required>'+
							'													<input type="hidden" class="form-control" id="versionAccion" value="3">'+//Aqui estan los input hidden que en este formulario son 3
							'													<input type="hidden" class="form-control" id="costoAccion" value="99">'+
							'													<input type="hidden" class="form-control" id="pesoAccion" value="1">'+
							
							
							
							'				      						</div>'+
							'			  					    	</div>'+
										  					    		
							'				     					<div class="form-group col-md-3">'+
							/* '							  					<label for="totalFinanciero-formulario">Segundo Trimestre</label>'+ */
							'					      					<div class="input-group input-group-sm">'+
							'			  					    			<input type="hidden" name="segundoTrimestre" id="segundoTrimestre-formulario" value='+accion[0].meta2+' class="form-control" required>'+
							'					      					</div>'+
							'								    		</div>'+
															    		
							'				     					<div class="form-group col-md-3">'+
							/* '							  					<label for="totalFinanciero-formulario">Tercer Trimestre</label>'+ */
							'					      					<div class="input-group input-group-sm">'+
							'			  					    			<input type="hidden" name="tercerTrimestre" id="tercerTrimestre-formulario" value='+accion[0].meta3+' class="form-control" required>'+
							'					      					</div>'+
							'								    		</div>'+
														    		
							'			      					    <div class="form-group col-md-3">'+
							/* '						  					<label for="totalFinanciero-formulario">Cuarto Trimestre</label>'+ */
							'				      						<div class="input-group input-group-sm">'+
							'								    				<input type="hidden" name="cuartoTrimestre" id="cuartoTrimestre-formulario" value='+accion[0].meta4+' class="form-control" required>'+
							'				      						</div>'+
							'							    		</div>'+
							'			  						</div>'+				
							'               			</div>'+//fin box-body
							'							<div class="modal-footer">'+
							'								<button type="submit" class="btn btn-success btn-sm actualizarAccion" id="botonActualizarAccion" parametros='+id+'-'+accionCatalogoId+'-'+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+' >Actualizar Acción</button>'+
							'								<button type="button" class="btn btn-success btn-sm agregarAccion" data-dismiss="modal" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+' >Cerrar</button>'+

							'							</div>'+
							'                		</div>'+	
							'                	</div>'+
							'                 </form>'+
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
	if(validarFormulario("formularioAccion",false,true)==true){
		event.stopPropagation();
		event.preventDefault(); 
	
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
    //var fechaInicio = document.getElementById('fechaInicio').value;
    //var fechaFin = document.getElementById('fechaFin').value;
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
    //$('.cuerpoEdicionAccion').html('');
    //$(".cuerpoEdicionAccion").html('<h3 class="text-center">La Acción ha sido modificada</h3>');
    $("#botonActualizarAccion").remove();
    
    
    
    var datos = new Object();
    datos.id = id;
    datos.costo = costo;
    datos.peso = peso;
    //datos.fechaInicio = null;
    //datos.fechaFin = null;
    datos.version = version;
    datos.meta1 = 0;
    datos.meta2 = 0;
    datos.meta3 = 0;
    datos.meta4 = 0;
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
        	$('.cuerpoEdicionAccion').html('');
            $(".cuerpoEdicionAccion").html('<h3 class="text-center">La Acción ha sido modificada</h3>');
        	},

        error: function(data,status,er) {
        	//actualizarTablaAcciones(insLineaAccionId);
        	$('.cuerpoEdicionAccion').html('');
            $(".cuerpoEdicionAccion").html('<h3 class="text-center">Error al actualizar registro. La Acción no ha sido modificada</h3>');
        	}
	 });
 
    
	} 
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
		url:'/tablero/ajaxSelects2?action=getAccion&accionId='+id,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	accion = JSON.parse(accion);

	var catalogoAccion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getAccionCatalogo',
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
		url:'/tablero/ajaxSelects2?action=getAccion&accionId='+id,
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
			url:'/tablero/ajaxSelects2?action=getLineaAccion',
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
			url:'/tablero/ajaxSelects2?action=getInstitucion',
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
			url:'/tablero/ajaxSelects2?action=getPeriodo',
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
			url:'/tablero/ajaxSelects2?action=getUnidadMedida',
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
	    	url:'/tablero/ajaxSelects?action=getDepartamento',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		departamentos = JSON.parse(departamentos);
		
		
		var distritos = $.ajax({
	    	url:'/tablero/ajaxSelects?action=getDistrito',
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
	    	url:'/tablero/ajaxSelects2?action=getAccionCatalogo',
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
			url:'/tablero/ajaxSelects2?action=getAccion&lineaAccionId='+insLineaAccionId,
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
			cuerpoAccion +="<tr><td class='text-center'>"+nombreDepartamento+"</td><td class='text-center'>"+nombreDistrito+"</td><td class='text-center'>"+accion[z].fechaInicio+"</td><td class='text-center'>"+accion[z].fechaFin+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[z].costo).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[z].meta1).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[z].meta2).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[z].meta3).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[z].meta4).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(suMetas).toFixed(2))+"</td><td class='text-center'>"+accion[z].peso+"</td><td class='text-center'>"+accion[z].version+"</td><td class='text-center'><span class='modalVincularProducto' parametros="+accion[z].id+">Gs.</span></td></tr>";
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
	    	url:'/tablero/ajaxSelects?action=getDistrito&departamento='+departamentoId,
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
	    	url:'/tablero/ajaxSelects2?action=getAccionCatalogo&catalogoAccionId='+catalogoAccionId,
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		catalogoAccion = JSON.parse(catalogoAccion);
		
		var unidadMedida = $.ajax({
			url:'/tablero/ajaxSelects2?action=getUnidadMedida',
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
	
	function modalError(mensaje) {
		if ( $("#modalMensajeError").length )
		{
			$("#modalMensajeError").remove();
		}
		var ModalError = '    <div id="modalMensajeError" class="modal fade">'+
	    '        <div class="modal-dialog">'+
	 '            <div class="modal-content">'+
	 '                 <div class="modal-body alert-danger">'+
	 '                        <div class="alert-danger">'+
	 '                        <h3 class="text-center">'+mensaje+'</h3>'+ 
	 '                    </div>'+
	 '                </div>'+ 
	 '            </div> '+
	 '        </div>'+
	 '    </div>';
	$("body").append(ModalError);
	$('#modalMensajeError').on('show.bs.modal', function (){
	    var myModal = $(this);
	    clearTimeout(myModal.data('hideInterval'));
	    myModal.data('hideInterval', setTimeout(function(){
	        myModal.modal('hide');
	    }, 1800));
	}).modal('show')
	//$('#modalMensajeError').modal('show');
	}
	
	$("body").on("click", ".guardarComboProducto",function(event){
		var parametros = $(this).attr("parametros");
    	var idParsed = parametros.split("-");
	    var insLineaAccionId = idParsed[0];
	    var lineaAccionId = idParsed[1];
	    var institucionId = idParsed[2];
	    var periodoId = idParsed[3];
		var accionId = idParsed[4];		
		
    	var nivel = document.getElementById("nivel-formulario").value;
      	var entidad = document.getElementById("entidad-formulario").value;;
	    var tipoPrograma = document.getElementById("tipoPrograma-formulario").value;
	    var programa = document.getElementById('programa-formulario').value;
	    var subPrograma = document.getElementById('subPrograma-formulario').value;
	    var proyecto = document.getElementById('proyecto-formulario').value; 
	    var producto = document.getElementById('producto-formulario').value; 
	    var anho = document.getElementById('periodoSeleccion').value; 
	    var version = document.getElementById('versionSeleccion').value; 
	    var totalFisico = document.getElementById('totalFisico-formulario').value; 
	    var unidadMedida = document.getElementById('unidadMedida-formulario').value; 
	    var clase = document.getElementById('clase-formulario').value; 
	    var totalFinanciero = document.getElementById('totalFinanciero-formulario').value; 
	    var totalAsignacion = document.getElementById('total-formulario').value;
		
		var PresupuestoAsignado = $.ajax({
			url:'/tablero/ajaxSelects2?action=getPresupuestoAsignado&nivel='+nivel+'&entidad='+entidad+'&tipoPresupuesto='+tipoPrograma+'&programa='+programa+'&subprograma='+subPrograma+'&proyecto='+proyecto+'&producto='+producto+'&anio='+anho+'&version='+version,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		PresupuestoAsignado = JSON.parse(PresupuestoAsignado);	
				
		var totaFinanciero=parseInt($("#totalFinanciero-formulario").val());
		var totaFinancieroInputado=parseInt($("#total-formulario").val());		
		var productoIngresado=parseInt($("#producto-formulario").val());			
		var sumatoriaAsignacion=0;
		
		/*$('#TablaAccionHasProductos  > tr').each(function() {
			var asignacion=$(this).find("td").eq(12).html();
			var prod=parseInt($(this).find("td").eq(6).text());
			if(asignacion.search("del")<0){
				asignacion=asignacion.replace(/[\."<\/*del>""Gs\."]/g, '');
				if(prod==productoIngresado){
					sumatoriaAsignacion+=parseInt(asignacion);	
				}
			}		
		});*/			
		
		if(PresupuestoAsignado[0].asignacionusada==null){
			sumatoriaAsignacion=0;
		}else{
			sumatoriaAsignacion=PresupuestoAsignado[0].asignacionusada;
		}
		
		if(validarFormulario("formulario",false,false)==true){
			if((totaFinancieroInputado+sumatoriaAsignacion)<=totaFinanciero){
				event.stopPropagation();
				event.preventDefault();
				
				
			    
			    
			    if(totalFisico == ""){
			    	totalFisico = 0;	    	
			    }
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
		
			    var datos = new Object();
			    
			    datos.nivel = nivel;
			    datos.entidad = entidad;
			    datos.tipoPrograma = tipoPrograma;
			    datos.programa = programa;
			    datos.subPrograma = subPrograma;
			    datos.proyecto = proyecto;
			    datos.sprProductoId = producto;
			    datos.accionId = accionId;
			    datos.anho = anho;
			    datos.version = version;
			    datos.unidadMedida = unidadMedida;
			    datos.cantidadFisica = totalFisico;
			    datos.clase = clase;
			    datos.cantidadFinanciera = totalFinanciero;
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
			        	
			        	if(data.success = true){
				        	cargarTablaAccionHasProducto(accionId,insLineaAccionId,lineaAccionId,institucionId,periodoId);
			        	}else{
			        		cargarTablaAccionHasProducto(accionId,insLineaAccionId,lineaAccionId,institucionId,periodoId);
			        	}
		
			        	},
			        error: function(data,status,er) {
			        	cargarTablaAccionHasProducto(accionId,insLineaAccionId,lineaAccionId,institucionId,periodoId);
			        	}
				 });
				}else{
					modalError("El monto ingresado supera la Asignación Financiera, vuelva a intentarlo");
					$("#total-formulario").val("");
				}
			}else{
				modalError("Valor ingresado incorrecto. Solo se permiten valores numéricos enteros");
				$("#total-formulario").val("");
				$("#producto-formulario").val("");
				$("#proyecto-formulario").val("");
				$("#subPrograma-formulario").val("");
				$("#programa-formulario").val("");
				$("#tipoPrograma-formulario").val("");
			}
		event.stopPropagation();
		event.preventDefault();
	});
	
	function cargarTablaAccionHasProducto(accionId,insLineaAccionId,lineaAccionId,institucionId,periodoId){
		var insLineaAccionId = insLineaAccionId;
		var lineaAccionId = lineaAccionId;
		var institucionId = institucionId;
		var periodoId = periodoId;		
		var accionId= accionId;
		
		//var producto = producto
		var nombreProducto = "";
		
		var accionHasProducto = $.ajax({
	    	url:'/tablero/ajaxSelects2?action=getAccionHasProducto&accionId='+accionId,
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
          		if(data.success == true){
          			jsonpCallbackProducto(data);
          		}else {
          			cargarTablaAccionHasProducto(accionId,insLineaAccionId,lineaAccionId,institucionId,periodoId);
          		}
          	},
          	error: function( data, textStatus, jqXHR) {
          		if(data.success == true){
          			jsonpCallbackProducto(data)
          		}else {
          			cargarTablaAccionHasProducto(accionId,insLineaAccionId,lineaAccionId,institucionId,periodoId);
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
    			nombreProducto = "";
        			for(var j = 0; j < productos.productos.length; j++){
        				if(productos.productos[j].codigoCatalogo == accionHasProducto[f].sprProductoId){
        					nombreProducto = productos.productos[j].nombreCatalogo;
        				}
        			}
        			
        			if(onoff==true && accionHasProducto[f].borrado == true){
        				// pasa a la siguiente fila en el for ++	
        			}else{	
        			
        			if(accionHasProducto[f].borrado == false){
        				<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
    		    	    	fila += "<tr><td>"+accionHasProducto[f].nivel+"</td><td>"+accionHasProducto[f].entidad+"</td><td>"+accionHasProducto[f].tipoPrograma+"</td><td>"+accionHasProducto[f].programa+"</td><td>"+accionHasProducto[f].subPrograma+"</td><td>"+accionHasProducto[f].proyecto+"</td><td>"+accionHasProducto[f].sprProductoId+"</td><td>"+nombreProducto+"</td><td>"+accionHasProducto[f].cantidadFisica+"</td><td>"+accionHasProducto[f].unidadMedida+"</td><td>"+accionHasProducto[f].clase+"</td><td>Gs."+numeroConComa(accionHasProducto[f].cantidadFinanciera)+"</td><td>Gs."+numeroConComa(accionHasProducto[f].totalAsignacion)+"</td><td><center><button type='submit' class='btn btn-default sm' parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accionId+"-"+accionHasProducto[f].id+" disabled='disabled'><span class='glyphicon glyphicon-pencil'></span></button><button type='submit' class='btn btn-default sm consultaBorrarVinculacionProducto' parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accionId+"-"+accionHasProducto[f].id+"><span class='glyphicon glyphicon-trash'></span></button></center></td></tr>";
        				<%} if (attributes.get("role_id_tablero").toString().equals("3")){%>
    	    	    		fila += "<tr><td>"+accionHasProducto[f].nivel+"</td><td>"+accionHasProducto[f].entidad+"</td><td>"+accionHasProducto[f].tipoPrograma+"</td><td>"+accionHasProducto[f].programa+"</td><td>"+accionHasProducto[f].subPrograma+"</td><td>"+accionHasProducto[f].proyecto+"</td><td>"+accionHasProducto[f].sprProductoId+"</td><td>"+nombreProducto+"</td><td>"+accionHasProducto[f].cantidadFisica+"</td><td>"+accionHasProducto[f].unidadMedida+"</td><td>"+accionHasProducto[f].clase+"</td><td>Gs."+numeroConComa(accionHasProducto[f].cantidadFinanciera)+"</td><td>Gs."+numeroConComa(accionHasProducto[f].totalAsignacion)+"</td><td></td></tr>";
    	    			<%}%>		
        			}else{
        				<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") ){%>
    	    	    		fila += "<tr><td><del>"+accionHasProducto[f].nivel+"</del></td><td><del>"+accionHasProducto[f].entidad+"</del></td><td><del>"+accionHasProducto[f].tipoPrograma+"</del></td><td><del>"+accionHasProducto[f].programa+"</del></td><td><del>"+accionHasProducto[f].subPrograma+"</del></td><td><del>"+accionHasProducto[f].proyecto+"</del></td><td><del>"+accionHasProducto[f].sprProductoId+"</del></td><td><del>"+nombreProducto+"</del></td><td><del>"+accionHasProducto[f].cantidadFisica+"</del></td><td><del>"+accionHasProducto[f].unidadMedida+"</del></td><td><del>"+accionHasProducto[f].clase+"</del></td><td><del>Gs."+numeroConComa(accionHasProducto[f].cantidadFinanciera)+"</del></td><td><del>Gs."+numeroConComa(accionHasProducto[f].totalAsignacion)+"</del></td><td><center><button type='submit' class='btn btn-default sm' parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accionId+"-"+accionHasProducto[f].id+" disabled='disabled'><span class='glyphicon glyphicon-pencil'></span></button><button type='submit' class='btn btn-default sm consultaBorrarVinculacionProducto' parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accionId+"-"+accionHasProducto[f].id+"><span class='glyphicon glyphicon-trash'></span></button></center></td></tr>";
        				<%}%>
        			}	
    			}	
    		}
    		
    		$("#TablaAccionHasProductos").append(fila);    		
    	}
    	
		
		
	}
	
	$("body").on("click", ".modalVincularProducto",function(event){
		
		if ( $("#modalVincularProductos").length )
		{
			$("#modalVincularProductos").remove();
		}
		if ( $("#modalAccion").length )
		{
			$("#modalAccion").remove();
		}
		if ( $("#modalBorrarVinculacionProducto").length )
		{
			$("#modalBorrarVinculacionProducto").remove();
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
			url:'/tablero/ajaxSelects2?action=getAccion&accionId='+accionId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		accion = JSON.parse(accion);
		
		var catalogoAccion = $.ajax({
	    	url:'/tablero/ajaxSelects2?action=getAccionCatalogo&catalogoAccionId='+accion[0].accionCatalogoId,
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		catalogoAccion = JSON.parse(catalogoAccion);
		
		var insLineaAccion = $.ajax({
			url:'/tablero/ajaxSelects2?action=getInsLineaAccion&insLineaAccionId='+insLineaAccionId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;		
		insLineaAccion=JSON.parse(insLineaAccion);
		
		var institucion = $.ajax({
			url:'/tablero/ajaxSelects2?action=getInstitucion&institucionId='+insLineaAccion[0].institucionId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		institucion = JSON.parse(institucion);
		
		var lineaAccion = $.ajax({
			url:'/tablero/ajaxSelects2?action=getLineaAccion&lineaAccionId='+lineaAccionId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		lineaAccion = JSON.parse(lineaAccion);


		
		var modalProductos = "";

		modalProductos ='<div class="modal fade" role="dialog" id="modalVincularProductos" data-backdrop="static" data-keyboard="false">'+ 
					    '	<div class="modal-dialog modal-lg" style="width:90%">'+
					    '		<div class="modal-content">'+ 
						'			<div class="modal-header">'+ 
						'				<button type="button" class="close agregarAccion" data-dismiss="modal" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'>&times;</button>'+ 
						'				<h4 class="modal-title">Vincular Producto con '+catalogoAccion[0].nombre+' de '+lineaAccion[0].nombre+' ('+institucion[0].sigla+') año '+insLineaAccion[0].periodoId+'</h4>'+ 
						'			</div>'+ 
						'			<div class="modal-body">'+
						'		      	<div class="row">'+ 
						'		      		<div class="col-md-12">'+
						'						<div class="box box-warning">'+
						'		                	<div class="box-header with-border">'+
						'								<h3 class="box-title">Acciones Vinculadas a Productos</h3>'+
						'							</div>'+
						'               			<div class="box-body" id="tablaListaVinculacionProducto">'+
						'								<div class="table-responsive">'+
				        '									<table class="table table-striped table-bordered  table-hover" id="dataTablesVinculacionProducto">'+
				        '										<thead>'+
				        '    										<tr>'+
				        '    											<th colspan="6" class="text-center" data-toggle="tooltip" data-placement="top" title="Nivel,Entidad,Tipo,Programa,SubPrograma,Proyecto">Cod. Pres.</th>'+
				        '   											<th>Cod. Prod</th>'+						            
				        '   											<th>NombreProducto</th>'+
				        '    											<th>Cantidad</th>'+
				        '    											<th>U. Medida</th>'+
				        '    											<th>Tipo</th>'+
				        '    											<th>Asig. Financiera</th>'+
				        '    											<th>Costo de la Acción</th>'+
				        '    											<th>Administrar</th>'+
				        '    										</tr>'+
				        '										</thead>'+
				        '										<tfoot><tr><th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th></tr></tfoot>'+
				        '    									<tbody class="table-body-producto" id="TablaAccionHasProductos">'+
				        '										</tbody>'+
				        '   								</table>'+
				        '								</div>'+
						'							</div>'+
						'						</div>'+
						'					</div>'+
						'				</div>'+
						' 				<br>'+
						'				<br>'+
						<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>		
						'				<div class="row">'+ 
						'		      		<div class="col-md-12">'+
						'						<div class="box box-warning">'+
						'		                	<div class="box-header with-border">'+
						'		                  		<h3 class="box-title">Vincular Acciones a Productos</h3>'+
						'							</div>'+
						'               			<div class="box-body">'+
						'								<div id="tituloFormulario"></div>'+
		      			'									<form class="form-horizontal" role="form" id="formulario" method="post" action="/ajaxUpdate">'+
		      			'										<input type="hidden" name="accion" value="actEntidad">'+
		      			'										<input type="hidden" name="anho" value="" id="anhoProducto-formulario">'+
		      			'										<input type="hidden" name="version" value="" id="versionProducto-formulario">'+
						'										<div class="row">'+
			      		'											<div class="form-group col-md-1">'+
			      		'												<input type="text" name="nivel" id="nivel-formulario" value="" class="form-control" disabled>'+
			      		'											</div>'+
			      		'											<div class="form-group col-md-1">'+
			  			'												<input type="text" name="entidad" id="entidad-formulario" value="" class="form-control" disabled>'+
			  			'											</div>'+
			      		'				    						<div class="form-group col-md-1">'+
			      		'			    								<input type="text" name="tipoPrograma" id="tipoPrograma-formulario" placeholder="Tipo Programa" list="listaf3c2" class="form-control"  required>'+
			      		'			    							</div>'+
			      		'			    							<div class="form-group col-md-1">'+
			      		'			    								<input type="text" name="programa" id="programa-formulario" placeholder="Programa" list="listaf4c2" class="form-control" required>'+
			      		'			    							</div>'+
			      		'			    							<div class="form-group col-md-1">'+
			      		'			    								<input type="text" name="subPrograma" id="subPrograma-formulario" placeholder="SubPrograma" list="listaf5c2" class="form-control" required>'+
			      		'			    							</div>'+
			      		'				    						<div class="form-group col-md-2">'+
			      		'				    							<input type="text" name="proyecto" id="proyecto-formulario" placeholder="Proyecto" list="listaf6c2" class="form-control" required>'+
			      		'				   							</div>'+
			  			'		    								<div class="form-group col-md-2">'+
			  			'		    									<input type="text" name="producto" id="producto-formulario" placeholder="Producto" list="listaf7c2" class="form-control" required>'+
			      		'										  	</div>'+
			  			'		    								<div class="form-group col-md-3">'+
				      	'												<div class="input-group input-group-md">'+
				      	'													<span class="input-group-addon">Gs</span>'+
	      				'	    											<input type="number" name="total" id="total-formulario" value="" class="form-control" required>'+
	      				'	               								    <div class="input-group-btn">'+
		      			'		                								<button type="button" class="btn btn-success guardarComboProducto" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'><span class="glyphicon glyphicon-plus"></span></button>'+
		      			'		                							</div>'+	      					    				
	      				'		    									</div>'+
			  			'			    							</div>'+
			  			'			    						</div>'+
		      			'									</form>	'+
		      				
		      			'									<div class="row">'+
			      		'				    					<div class="form-group col-md-3">'+
			      		'				  							<label for="totalFisico-formulario">Cantidad</label>'+
		      			'		    								<input type="text" name="totalFisico" id="totalFisico-formulario" value="" class="form-control" disabled>'+
		      			'		    							</div>'+
			      		'			   		 					<div class="form-group col-md-3">'+
		      			'		  									<label for="unidadMedida-formulario">U. Medida</label>'+
	      				'	    									<input type="text" name="totalFisico" id="unidadMedida-formulario" value="" class="form-control" disabled>'+
	      				'	    								</div>'+
			      		'				    					<div class="form-group col-md-3">'+
	      				'		  									<label for="clase-formulario">Tipo</label>'+
      					'    										<input type="text" name="totalFisico" id="clase-formulario" value="" class="form-control" disabled>'+
      					'    									</div>'+
			      		'			    						<div class="form-group col-md-3">'+
      					'  											<label for="totalFinanciero-formulario">Asig. Financiera</label>'+
					    '  											<div class="input-group input-group-sm">'+
					    '  												<span class="input-group-addon">Gs</span>'+
		      			'		    									<input type="text" name="totalFinanciero" id="totalFinanciero-formulario" value="" class="form-control" disabled>'+
					    ' 											</div>'+
	      				'	    								</div>'+ 					    				
	      				'		    						</div>'+
	      				'							</div>'+//fin box body
						'						</div>'+//fin box
						'					</div>'+//fin col md
						'				</div>'+//fin row		
	      				<% }%>
	      				'		</div>'+ //fin modal body
				        '			<div class="modal-footer">'+ 
				        '				<button type="button" class="btn btn-default agregarAccion" data-dismiss="modal" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'>Cerrar</button>'+ 
				        '			</div>'+ //fin modal footer
				      	'		</div>'+ //fin modal content
				    	'	</div>'+ //fin modal dialog
				  		'</div>';//fin modal fade

		$("body").append(modalProductos);
		$('#TablaAccionHasProductos').append(cargarTablaAccionHasProducto(accionId,insLineaAccionId,lineaAccionId,institucionId,periodoId));	        
		$("#modalVincularProductos").modal('show');		
	/* 	$("#dataTablesVinculacionProducto").dataTable({
	        /* "footerCallback": function ( row, data, start, end, display ) {
	            var api = this.api(), data;
	 
	         // saca los puntos y <del> de la cadena para pasarlo a entero
	            var intVal = function(i){
		            	if(typeof i==='string'){	
		            		i=i.replace(/[\."<\/*del>""Gs\."]/g, '');
		            		i=i.replace(/[","]/g, '.');
		            		i=i*1;		            		
		            	}else{
		            		if(typeof i==='number'){
		            			i=i;		            			
		            	}else{
		            		i=0;
		            	}
		            }
		            	return i;
		            };
	 
	         // total general para todas las paginas de la columna
	            total8 = api
	                .column( 8 )
	                .data()
	                .reduce( function (a, b) {
	                    return intVal(a) + intVal(b);
	                }, 0 );
	 
	         // total por pagina segun número de columna
	            pageTotal8 = api
	                .column( 8, { page: 'current'} )
	                .data()
	                .reduce( function (a, b) {
	                    return intVal(a) + intVal(b);
	                }, 0 );
	         
	         // total general para todas las paginas de la columna
	            total11 = api
	                .column( 11 )
	                .data()
	                .reduce( function (a, b) {
	                    return intVal(a) + intVal(b);
	                }, 0 );
	 
	         // total por pagina segun número de columna
	            pageTotal11 = api
	                .column( 11, { page: 'current'} )
	                .data()
	                .reduce( function (a, b) {
	                    return intVal(a) + intVal(b);
	                }, 0 );
	         
	         // total general para todas las paginas de la columna
	            total12 = api
	                .column( 12 )
	                .data()
	                .reduce( function (a, b) {
	                    return intVal(a) + intVal(b);
	                }, 0 );
	 
	         // total por pagina segun número de columna
	            pageTotal12 = api
	                .column( 12, { page: 'current'} )
	                .data()
	                .reduce( function (a, b) {
	                    return intVal(a) + intVal(b);
	                }, 0 );
	         
	         // se muestran los valores de los totales en el footer del table
	            $( api.column( 8 ).footer() ).html(
	            		'Total Pág. '+ numeroConComa(pageTotal8) +' (Total Gral. '+ numeroConComa(total8) +')'
	            );
	         /* // se muestran los valores de los totales en el footer del table
	            $( api.column( 11 ).footer() ).html(
	            		'Total Pág. '+ numeroConComa(pageTotal11) +' (Total Gral. '+ numeroConComa(total11) +')'
	            );
	         // se muestran los valores de los totales en el footer del table
	            $( api.column( 12 ).footer() ).html(
	            		'Total Pág. '+ numeroConComa(pageTotal12) +' (Total Gral. '+ numeroConComa(total12) +')'
	            );	          
	        }, 
	        dom: 'Bfrtip',
	        buttons: [
	            'copy', 'csv', 'excel', 'pdf', 'print'
	        ]
	});  */
		
		
		function Combo(){
		
			anho=$("#periodoSeleccion option:selected").val();
			version=$("#versionSeleccion option:selected").val();
			
			var usuarios = $.ajax({
				url:'/tablero/ajaxSelects?action=getUsuarios&usuario=<%=user.getName()%>',
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			usuarios = JSON.parse(usuarios);
			usuarios = usuarios.usuarios;

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
		    	var rutaNivel = usuarios[0].nivel_id;
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
		    	var linkNivel = usuarios[0].nivel_id;
		    	var datosEntidades = $.ajax({
		         	 url:'http://spr.stp.gov.py/ajaxSelects?accion=getEntidades&nivel='+linkNivel,
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
		    	var linkNivel = usuarios[0].nivel_id;
		      	var rutaEntidad2 = usuarios[0].entidad_id;
		      	

		      	var datosEntidades = $.ajax({
		        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getEntidades&nivel='+linkNivel,
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
		        		document.getElementById('entidad-formulario').setAttribute("entidadDescripcion",mostrarEntidad );
		          		var nt=document.createTextNode(mostrarEntidad);
		          		var nparrafo=document.getElementById('tituloFormulario');
		          		//nparrafo.innerHTML="";
		          		nparrafo.appendChild(nt);
		        	} 
		      	} 
		    }  

		    this.tipoProgramaFocus = function(){
		    	
		    	var rutaNivel = usuarios[0].nivel_id;
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
					    	
					    	var linkNivel = usuarios[0].nivel_id;
					      	var rutaEntidad2 = usuarios[0].entidad_id;
					    	$("#nivel-formulario").val(rutaNivel);
					    	$("#entidad-formulario").val(rutaEntidad2);
				      	

					      	var datosEntidades =[];
					      		$.ajax({
					        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getEntidades&nivel='+linkNivel,
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
						        		document.getElementById('entidad-formulario').setAttribute("entidadDescripcion",rutaEntidad2 );
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
		    	var linkNivel = usuarios[0].nivel_id;
		      	var linkEntidad = usuarios[0].entidad_id;
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
		    	var linkNivel = usuarios[0].nivel_id;
		      	var linkEntidad = usuarios[0].entidad_id;
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
		    	var linkNivel = usuarios[0].nivel_id;
		      	var linkEntidad = usuarios[0].entidad_id;    	
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
		    	var linkNivel = usuarios[0].nivel_id;
		      	var linkEntidad = usuarios[0].entidad_id;
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
		    	var linkNivel = usuarios[0].nivel_id;
		      	var linkEntidad = usuarios[0].entidad_id;
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
		    	var linkNivel = usuarios[0].nivel_id;
		      	var linkEntidad = usuarios[0].entidad_id;
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
		    	var linkNivel = usuarios[0].nivel_id;
		      	var linkEntidad = usuarios[0].entidad_id;
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
		    	var linkNivel = usuarios[0].nivel_id;
		      	var linkEntidad = usuarios[0].entidad_id;
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
				         	url:'http://spr.stp.gov.py/ajaxSelects?accion=getAsignacionPresiVersion&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipo='+linkTipoPrograma+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma+'&proyecto='+linkProyecto+'&producto='+linkProducto+'&anho='+anho+'&versionReporte='+version,
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
			        			if (linkTipoPrograma == datos[z].tipo && linkPrograma == datos[z].programa && linkSubPrograma == datos[z].subPrograma && linkProyecto == datos[z].proyecto && linkProducto == datos[z].producto )
			        			{	
			        				totalFinanciero += ( parseFloat(datos[z].planificado1) + parseFloat(datos[z].planificado2) + parseFloat(datos[z].planificado3) + parseFloat(datos[z].planificado4) + parseFloat(datos[z].planificado5) + parseFloat(datos[z].planificado6) + parseFloat(datos[z].planificado7) + parseFloat(datos[z].planificado8) + parseFloat(datos[z].planificado9) + parseFloat(datos[z].planificado10) + parseFloat(datos[z].planificado11) + parseFloat(datos[z].planificado12) );
			        			}	
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
				         	 url:'http://spr.stp.gov.py/ajaxSelects?accion=getProductoTipoN&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipo='+linkTipoPrograma+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma+'&proyecto='+linkProyecto+'&producto='+linkProducto+'&anho='+anho,
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
	$("body").on("click", ".consultaBorrarVinculacionProducto",function(event){
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-");                                                            
		
		//Las siguentes variables se utiliza en esta funcion para redibujar el modal anterior
		var insLineaAccionId = idParsed[0];
		var lineaAccionId = idParsed[1];
		var institucionId = idParsed[2];
		var periodoId = idParsed[3];
		var accionId = idParsed[4];
		var accionHasProductoId = idParsed[5];


		if ( $("#modalVincularProductos").length )
		{
			$("#modalVincularProductos").remove();
		}		
		
		var WebServiceVinculacionProducto = $.ajax({
			url:'/tablero/ajaxSelects2?action=getAccionHasProducto&accionHasProductoId='+accionHasProductoId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		WebServiceVinculacionProducto = JSON.parse(WebServiceVinculacionProducto);
		
		var contenido = "";

		contenido =			'<div class="modal fade" id="modalBorrarVinculacionProducto"  data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
							'	<div class="modal-dialog modal-lg">'+
							'		<div class="modal-content" >'+
							'			<div class="modal-header">'+
							'		        <button type="button" class="close modalVincularProducto"  parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+' ><span aria-hidden="true">&times;</span></button>'+
							'		        <h4 class="modal-title" >Borrar - Restaurar Vinculación Producto</h4>'+
							'			</div>'+
							'		    <div class="modal-body">'+
							'				<div id="mensajeBorradoVinculacionProducto"></div>'+
							'		    </div>'+
							'			<div class="modal-footer" id="agregarBotonBorradoVinculacionProducto">'+
							'			</div>'+
							'		</div>'+ 
							'	</div>'+
							'</div>';
							
			$("#programacion").append(contenido);
			
			if(WebServiceVinculacionProducto[0].borrado == true){
				$("#mensajeBorradoVinculacionProducto").html("");
				$("#mensajeBorradoVinculacionProducto").append('<h3 class="text-center">Ud. esta seguro que desea RESTABLACER este registro</h3>');
				$("#agregarBotonBorradoVinculacionProducto").html("");
				$("#agregarBotonBorradoVinculacionProducto").append('<button type="button" class="btn btn-success btn-sm borrarVinculacionProducto" id="botonRestaurarVinculacionProducto" parametros='+accionHasProductoId+'-r>Restaurar V. Producto</button>');
				$("#agregarBotonBorradoVinculacionProducto").append('<button type="button" class="btn btn-success btn-sm modalVincularProducto" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'>Cerrar</button>');
			}else{
				$("#mensajeBorradoVinculacionProducto").html("");
				$("#mensajeBorradoVinculacionProducto").append('<h3 class="text-center">Ud. esta seguro que desea BORRAR este registro</h3');
				$("#agregarBotonBorradoVinculacionProducto").html("");
				$("#agregarBotonBorradoVinculacionProducto").append('<button type="button" class="btn btn-danger btn-sm borrarVinculacionProducto" id="botonBorradoVinculacionProducto" parametros='+accionHasProductoId+'-b>Borrar V. Producto</button>');
				$("#agregarBotonBorradoVinculacionProducto").append('<button type="button" class="btn btn-success btn-sm modalVincularProducto" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'>Cerrar</button>')
			}
			
			$('#modalBorrarVinculacionProducto').modal('show');
				
	});
	
	$("body").on("click", ".borrarVinculacionProducto",function(event){	
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-"); 
	    var accionHasProductoId = idParsed[0];
	    var estado = idParsed[1];
	    
		var WebServiceVinculacionProducto = $.ajax({
			url:'/tablero/ajaxSelects2?action=getAccionHasProducto&accionHasProductoId='+accionHasProductoId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		WebServiceVinculacionProducto = JSON.parse(WebServiceVinculacionProducto);
	    
	    var objeto = new Object();
	    objeto.id = accionHasProductoId;
	    objeto.borrado= WebServiceVinculacionProducto[0].borrado;

	    
	  	var info = JSON.stringify(objeto);
	    $.ajax({
	        url: "ajaxUpdate2?accion=borradoAccionHasProducto",
	        type: 'POST',
	        dataType: 'json',
	        data: info,
	        contentType: 'application/json',
	        mimeType: 'application/json',
	        success: function (data) {
	        	
	            if(estado == "b"){
	        		$("#botonBorradoVinculacionProducto").remove();
	            	$("#mensajeBorradoVinculacionProducto").html("");
	            	$("#mensajeBorradoVinculacionProducto").html("<h3 class='text-center'>BORRADO EXITOSAMENTE!!</h3>");
	            }else{
	        		$("#botonRestaurarVinculacionProducto").remove();
	            	$("#mensajeBorradoVinculacionProducto").html("");
	            	$("#mensajeBorradoVinculacionProducto").html("<h3 class='text-center'>RESTAURADO EXITOSAMENTE!!</h3>");
	        	}

	        },

	        error: function(data,status,er) {
	        	
	        	}
		 });

		
	});

	$("body").on("click", ".guardarAccion",function(event){
		if(validarFormulario("formularioAccion",true,false)==true){			
			event.stopPropagation();
			event.preventDefault(); 

			
		var codigoRegistro = $(this).attr("parametros");
	    var idParsed = codigoRegistro.split("-"); 
	    var insLineaAccionId = idParsed[0];
	    var lineaAccionId = idParsed[1];
	    var institucionId = idParsed[2];
	    var periodoId = idParsed[3];
		
		var costo = document.getElementById("costoAccion").value;
		var peso = document.getElementById("pesoAccion").value;
		//var fechaInicio = document.getElementById("fechaInicioAccion").value;
		//var fechaFin = document.getElementById("fechaFinAccion").value;
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
	    datos.fechaInicio = null;
	    datos.fechaFin = null;
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
	        	renderAcciones(insLineaAccionId,lineaAccionId,institucionId,periodoId);
	        	//actualizarTablaAcciones(insLineaAccionId,lineaAccionId,institucionId,periodoId);
	        	},
	        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
	        error: function(data,status,er) {
	        	//actualizarTablaAcciones(insLineaAccionId,lineaAccionId,institucionId,periodoId);
	        	}
		 });

		}   
	});	
	
	function actualizarTablaAcciones(insLineaAccionId,lineaAccionId,institucionId,periodoId){
		var insLineaAccionId = insLineaAccionId;
		var lineaAccionId = lineaAccionId;
		var institucionId = institucionId;
		var periodoId = periodoId;
	
		var accion = $.ajax({
			url:'/tablero/ajaxSelects2?action=getAccion&lineaAccionId='+insLineaAccionId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		accion = JSON.parse(accion);
		
		var departamentos = $.ajax({
	    	url:'/tablero/ajaxSelects?action=getDepartamento',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		departamentos = JSON.parse(departamentos);
		
		var distritos = $.ajax({
	    	url:'/tablero/ajaxSelects?action=getDistrito',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		distritos = JSON.parse(distritos);
		
		var unidadMedida = $.ajax({
			url:'/tablero/ajaxSelects2?action=getUnidadMedida',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		unidadMedida = JSON.parse(unidadMedida);
		var nombreUnidadMedidaAccion;

		
		var nombreDepartamento;
		var cuerpoAccion = "";
		var nombreDistrito;
		var nombreAccionCatalogo="";
		
		for(var a = 0; a < accion.length; a++)
		{
			var suMetas = 0 ;
			suMetas = accion[a].meta1 + accion[a].meta2 + accion[a].meta3 + accion[a].meta4; 
			
			var catalogoAccion = $.ajax({
				url:'/tablero/ajaxSelects2?action=getAccionCatalogo&catalogoAccionId='+accion[a].accionCatalogoId,
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			catalogoAccion = JSON.parse(catalogoAccion);
			
			nombreAccionCatalogo = catalogoAccion[0].nombre;
			
			for(var d = 0; d < departamentos.length; d++)
			{
				if(accion[a].departamentoId == departamentos[d].idDepartamento){
					nombreDepartamento = departamentos[d].nombreDepartamento;
					

				}
			}
			

			for(var e = 0; e < distritos.length; e++)
			{
				if(accion[a].distritoId == distritos[e].id && accion[a].departamentoId == distritos[e].departamentoId){
					nombreDistrito = distritos[e].descripcion;
					

				}
			}
			
			for(var u = 0; u < unidadMedida.length; u++)
			{
				if(catalogoAccion[0].idUnidadMedida == unidadMedida[u].id){
					nombreUnidadMedidaAccion = unidadMedida[u].descripcion;
				}
			}
			
			if(onoff==true && accion[a].borrado == true){
					//
			}else{
				if(accion[a].borrado == false){	
					<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
						cuerpoAccion +="<tr><td class='text-center'>"+accion[a].id+"</td><td class='text-center'>"+nombreAccionCatalogo+"</td><td class='text-center'>"+nombreDepartamento+"</td><td class='text-center'>"+nombreDistrito+"</td><td class='text-center'>"+accion[a].fechaInicio+"</td><td class='text-center'>"+accion[a].fechaFin+"</td><td class='text-center'>"+nombreUnidadMedidaAccion+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[a].meta1).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[a].meta2).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[a].meta3).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[a].meta4).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(suMetas).toFixed(2))+"</td><td class='text-center'><button type='button' class='btn btn-default btn-sm modalVincularProducto' data-toggle='tooltip' data-placement='top' title='Vincular Acción a Productos Presupuestarios' parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+"><span>Gs</span></button><button type='button' class='btn btn-default btn-sm agregarActividad' title='Agregar Cronograma' parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+"-"+accion[a].accionCatalogoId+" ><span class='glyphicon glyphicon-time'></span></button><button type='button' class='btn btn-default btn-sm editarAccion' parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+"-"+accion[a].accionCatalogoId+" data-toggle='tooltip' data-placement='top' title='Editar Acción'><span class='glyphicon glyphicon-pencil'></span></button><button type='button' class='btn btn-default btn-sm consultaBorrarAccion'  parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+"-"+accion[a].accionCatalogoId+" data-toggle='tooltip' data-placement='top' title='Borrar Acción'><span class='glyphicon glyphicon-trash'></span></button><button type='button' class='btn btn-default btn-sm modalDestinatario'  parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+"-"+accion[a].accionCatalogoId+" data-toggle='tooltip' data-placement='top' title='Agregar Destinatario'><span class='glyphicon glyphicon-user'></span></button></td></tr>";
					<%} if (attributes.get("role_id_tablero").toString().equals("3")){%>
						cuerpoAccion +="<tr><td class='text-center'>"+accion[a].id+"</td><td class='text-center'>"+nombreAccionCatalogo+"</td><td class='text-center'>"+nombreDepartamento+"</td><td class='text-center'>"+nombreDistrito+"</td><td class='text-center'>"+accion[a].fechaInicio+"</td><td class='text-center'>"+accion[a].fechaFin+"</td><td class='text-center'>"+nombreUnidadMedidaAccion+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[a].meta1).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[a].meta2).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[a].meta3).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(accion[a].meta4).toFixed(2))+"</td><td class='text-center'>"+numeroConComa(parseFloat(suMetas).toFixed(2))+"</td><td class='text-center'><button type='button' class='btn btn-default btn-sm modalVincularProducto' data-toggle='tooltip' data-placement='top' title='Vincular Acción a Productos Presupuestarios' parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+"><span>Gs</span></button><button type='button' class='btn btn-default btn-sm agregarActividad' tile='Agregar Cronograma' parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+"-"+accion[a].accionCatalogoId+" ><span class='glyphicon glyphicon-time'></span></button><button type='button' class='btn btn-default btn-sm modalDestinatario'  parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+"-"+accion[a].accionCatalogoId+" data-toggle='tooltip' data-placement='top' title='Agregar Destinatario'><span class='glyphicon glyphicon-user'></span></button></td></tr>";
					<%}%>				
				}else{
					<% if (attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("0")){%>
						cuerpoAccion +="<tr><td class='text-center'><del>"+accion[a].id+"</del></td><td class='text-center'><del>"+nombreAccionCatalogo+"</del></td><td class='text-center'><del>"+nombreDepartamento+"</del></td><td class='text-center'><del>"+nombreDistrito+"</del></td><td class='text-center'><del>"+accion[a].fechaInicio+"</del></td><td class='text-center'><del>"+accion[a].fechaFin+"</del></td><td class='text-center'><del>"+nombreUnidadMedidaAccion+"</del></td><td class='text-center'><del>"+numeroConComa(parseFloat(accion[a].meta1).toFixed(2))+"</del></td><td class='text-center'><del>"+numeroConComa(parseFloat(accion[a].meta2).toFixed(2))+"</del></td><td class='text-center'><del>"+numeroConComa(parseFloat(accion[a].meta3).toFixed(2))+"</del></td><td class='text-center'><del>"+numeroConComa(parseFloat(accion[a].meta4).toFixed(2))+"</del></td><td class='text-center'><del>"+numeroConComa(parseFloat(suMetas).toFixed(2))+"</del></td><td class='text-center'><button type='button' class='btn btn-default btn-sm consultaBorrarAccion'  parametros="+insLineaAccionId+"-"+lineaAccionId+"-"+institucionId+"-"+periodoId+"-"+accion[a].id+"-"+accion[a].accionCatalogoId+" data-toggle='tooltip' data-placement='top' title='Restaurar Acción'><span class='fa fa-recycle'></span></button></td></tr>";
					<% }%>				
				}	
			}
			
			
		}
		$('#cuerpoTablaAccion').html("");

		var tablaAccion ='     			<div class="table-responsive">'+
		'	                				<table class="table table-hover table-bordered" id="dataTablesAcciones">'+
		'	                					<thead>'+
		'	                						<tr class="active"><th rowspan="2" class="text-center">Id</th><th rowspan="2" class="text-center">Acción</th><th rowspan="2" class="text-center">Depto</th><th rowspan="2" class="text-center">Distrito</th><th rowspan="2" class="text-center">Fecha Inicio</th><th rowspan="2" class="text-center">Fecha Fin</th><th rowspan="2" class="text-center">Unidad Medida</th><th colspan="4" class="text-center">Metas</th><th rowspan="2" class="text-center">Total Metas</th><th rowspan="2" class="text-center" style="min-width:130px">Administrar Acción</th></tr>'+
		'	                						<tr class="active"><th class="text-center">1er Trimestre</th><th class="text-center">2do Trimestre</th><th class="text-center">3er Trimestre</th><th class="text-center">4to Trimestre</th></tr>'+
		'	                					</thead>'+
		'										<tfoot>'+
		'								 			<tr>'+
		'								 				<th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th>'+
		'								 			</tr>'+
		'								    	</tfoot>'+
		'	                						<tbody id="tablaAccionesPrecargadas">'+
		'	                						</tbody>'+
		'	                				</table>'+
		'	                			</div>';		
		$('#cuerpoTablaAccion').append(tablaAccion);
				
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
		$('#dataTablesAcciones').dataTable({
	        /* "footerCallback": function ( row, data, start, end, display ) {
	            var api = this.api(), data;
	 
	         // saca los puntos y <del> de la cadena para pasarlo a entero
			var intVal = function(i){
        	if(typeof i==='string'){	
        		i=i.replace(/[\."<\/*del>""Gs\."]/g, '');
        		i=i.replace(/[","]/g, '.');
        		i=i*1;		            		
        	}else{
        		if(typeof i==='number'){
        			i=i;		            			
        	}else{
        		i=0;
        	}
        	}
        	return i;
        	};
	 
	         // total general para todas las paginas de la columna
	            total6 = api
	                .column( 6 )
	                .data()
	                .reduce( function (a, b) {
	                    return intVal(a) + intVal(b);
	                }, 0 );
	 
	         // total por pagina segun número de columna
	            pageTotal6 = api
	                .column( 6, { page: 'current'} )
	                .data()
	                .reduce( function (a, b) {
	                    return intVal(a) + intVal(b);
	                }, 0 );
	         // total general para todas las paginas de la columna
	            total7 = api
	                .column( 7 )
	                .data()
	                .reduce( function (a, b) {
	                    return intVal(a) + intVal(b);
	                }, 0 );
	 
	         // total por pagina segun número de columna
	            pageTotal7 = api
	                .column( 7, { page: 'current'} )
	                .data()
	                .reduce( function (a, b) {
	                    return intVal(a) + intVal(b);
	                }, 0 );
	         
	         // total general para todas las paginas de la columna
	            total8 = api
	                .column( 8 )
	                .data()
	                .reduce( function (a, b) {
	                    return intVal(a) + intVal(b);
	                }, 0 );
	 
	         // total por pagina segun número de columna
	            pageTotal8 = api
	                .column( 8, { page: 'current'} )
	                .data()
	                .reduce( function (a, b) {
	                    return intVal(a) + intVal(b);
	                }, 0 );
	         
	         // total general para todas las paginas de la columna
	            total9 = api
	                .column( 9 )
	                .data()
	                .reduce( function (a, b) {
	                    return intVal(a) + intVal(b);
	                }, 0 );
	 
	         // total por pagina segun número de columna
	            pageTotal9 = api
	                .column( 9, { page: 'current'} )
	                .data()
	                .reduce( function (a, b) {
	                    return intVal(a) + intVal(b);
	                }, 0 );
	         
	         // total general para todas las paginas de la columna
	            total10 = api
	                .column( 10 )
	                .data()
	                .reduce( function (a, b) {
	                    return intVal(a) + intVal(b);
	                }, 0 );
	 
	         // total por pagina segun número de columna
	            pageTotal10 = api
	                .column( 10, { page: 'current'} )
	                .data()
	                .reduce( function (a, b) {
	                    return intVal(a) + intVal(b);
	                }, 0 );
	 
	         // se muestran los valores de los totales en el footer del table
	            $( api.column( 6 ).footer() ).html(
	            		'Total Pág. '+ numeroConComa(pageTotal6) +' (Total Gral. '+ numeroConComa(total6) +')'
	            );
	         // se muestran los valores de los totales en el footer del table
	            $( api.column( 7 ).footer() ).html(
	            		'Total Pág. '+ numeroConComa(pageTotal7) +' (Total Gral. '+ numeroConComa(total7) +')'
	            );
	         // se muestran los valores de los totales en el footer del table
	            $( api.column( 8 ).footer() ).html(
	            		'Total Pág. '+ numeroConComa(pageTotal8) +' (Total Gral. '+ numeroConComa(total8) +')'
	            );
	         // se muestran los valores de los totales en el footer del table
	            $( api.column( 9 ).footer() ).html(
	            		'Total Pág. '+ numeroConComa(pageTotal9) +' (Total Gral. '+ numeroConComa(total9) +')'
	            );
	         // se muestran los valores de los totales en el footer del table
	            $( api.column( 10 ).footer() ).html(
	            		'Total Pág. '+ numeroConComa(pageTotal10) +' (Total Gral. '+ numeroConComa(total10) +')'
	            );
	        },
 */	        dom: 'Bfrtip',
	        buttons: [
	            'copy', 'csv', 'excel', 'pdf', 'print'
	        ]
	});

		
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
				
		var insLineaAccion = $.ajax({
			url:'/tablero/ajaxSelects2?action=getInsLineaAccion&insLineaAccionId='+insLineaAccionId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;		
		insLineaAccion=JSON.parse(insLineaAccion);
		
		var institucion = $.ajax({
			url:'/tablero/ajaxSelects2?action=getInstitucion&institucionId='+insLineaAccion[0].institucionId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		institucion = JSON.parse(institucion);
		
		var lineaAccion = $.ajax({
			url:'/tablero/ajaxSelects2?action=getLineaAccion&lineaAccionId='+lineaAccionId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		lineaAccion = JSON.parse(lineaAccion);
		
		var unidadMedida = $.ajax({
			url:'/tablero/ajaxSelects2?action=getUnidadMedida',
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
			url:'/tablero/ajaxSelects2?action=getHitoTipo',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		hitoTipo = JSON.parse(hitoTipo);
		
		var optionTipoHito;
		var optionAcumulable;
		for(var u = 0; u < hitoTipo.length; u++)
		{
			optionTipoHito+='<option value="'+hitoTipo[u].id+'" parametro="'+hitoTipo[u].id+'">'+hitoTipo[u].nombre+'</option>';
		}
		
		optionAcumulable+='<option selected value="TRUE" parametro="TRUE">Si</option>';
		optionAcumulable+='<option value="FALSE" parametro="FALSE">No</option>';
		
		var productos = $.ajax({
			url:'/tablero/ajaxSelects2?action=getProductos',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		productos = JSON.parse(productos);
		
		var productoNombre = '';
		var productosAccion = $.ajax({
			url:'/tablero/ajaxSelects2?action=getAccionHasProducto&accionId='+accionId+'&nivel='+institucion[0].nivelId+'&entidad='+institucion[0].entidadId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		productosAccion = JSON.parse(productosAccion);		
		
		var optionProductosAccion;
		optionProductosAccion = '<option value="">Ningún producto seleccionado</option>';
		for(var u = 0; u < productosAccion.length; u++)
		{
			productoNombre = '';
			for(var i = 0; i < productos.length; i++)
			{
				if (productosAccion[u].sprProductoId == productos[i].id){
					productoNombre = productos[i].nombre;
				}
			}
			
			optionProductosAccion+='<option value="'+
										productosAccion[u].nivel+'-'+
										productosAccion[u].entidad+'-'+
										productosAccion[u].tipoPrograma+'-'+
										productosAccion[u].programa+'-'+
										productosAccion[u].subPrograma+'-'+
										productosAccion[u].proyecto+'-'+
										productosAccion[u].sprProductoId+'">'+
											productosAccion[u].sprProductoId + ' - ' + productoNombre +
								   '</option>';
		}
		
		var actividades = $.ajax({
			url:'/tablero/ajaxSelects2?action=getCronograma&accionId='+accionId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		actividades = JSON.parse(actividades);
		
		var accion = $.ajax({
			url:'/tablero/ajaxSelects2?action=getAccion&accionId='+accionId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		accion = JSON.parse(accion);
		
		var accionCatalogo = $.ajax({
			url:'/tablero/ajaxSelects2?action=getAccionCatalogo&catalogoAccionId='+accion[0].accionCatalogoId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		accionCatalogo = JSON.parse(accionCatalogo);
		
		var departamentos = $.ajax({
	    	url:'/tablero/ajaxSelects?action=getDepartamento',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		departamentos = JSON.parse(departamentos);
		
		var distritos = $.ajax({
	    	url:'/tablero/ajaxSelects?action=getDistrito',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		distritos = JSON.parse(distritos);
		
		var nombreDepartamento = "";
		var nombreDistrito = "";
		
		for(var d = 0; d < departamentos.length; d++)
		{
			if(accion[0].departamentoId == departamentos[d].idDepartamento){
				nombreDepartamento = departamentos[d].nombreDepartamento;
			}
		}
		

		for(var e = 0; e < distritos.length; e++)
		{
			if(accion[0].distritoId == distritos[e].id && accion[0].departamentoId == distritos[e].departamentoId){
				nombreDistrito = distritos[e].descripcion;
			}
		}						
		
		
		var cuerpoActividad = "";
		
		for(var u = 0; u < actividades.length; u++)
		{	
			if(onoff==true && actividades[u].borrado == true){
				// pasa a la siguiente fila en el for ++
			}else{
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
					<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
						cuerpoActividad+='<tr><td>'+actividades[u].nombre+'</td><td>'+actividades[u].descripcion+'</td><td>'+nombreUnidadMedida+'</td><td>'+nombreHitoTipo+'</td><td>'+actividades[u].proporcion+'</td><td>'+actividades[u].peso+'</td><td>'+acumulable(actividades[u].acumulable)+'</td><td>'+prodConcatVal(actividades[u].prodConcat)+'</td><td><button type="button" class="btn btn-default btn-sm editarCronograma" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accion[0].id+'-'+accion[0].accionCatalogoId+'-'+actividades[u].id+' data-toggle="tooltip" data-placement="top" title="Editar Cronograma"><span class="glyphicon glyphicon-pencil" ></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarCronograma" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accion[0].id+'-'+accion[0].accionCatalogoId+'-'+actividades[u].id+'><span class="glyphicon glyphicon-trash" </span></button><button type="button" class="btn btn-default btn-sm agregarProgramacion" data-toggle="tooltip" data-placement="top" title="Agregar Hito" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividades[u].id+'><span class="glyphicon glyphicon-time" ></span></button><button type="button" class="btn btn-default btn-sm agregarAvance" data-toggle="tooltip" data-placement="top" title="Declarar Avance" parametros="'+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividades[u].id+'"><span class="fa fa-line-chart"></span></button></td></tr>';
					<%} if (attributes.get("role_id_tablero").toString().equals("3")){%>
						cuerpoActividad+='<tr><td>'+actividades[u].nombre+'</td><td>'+actividades[u].descripcion+'</td><td>'+nombreUnidadMedida+'</td><td>'+nombreHitoTipo+'</td><td>'+actividades[u].proporcion+'</td><td>'+actividades[u].peso+'</td><td>'+acumulable(actividades[u].acumulable)+'</td><td>'+prodConcatVal(actividades[u].prodConcat)+'</td><td><button type="button" class="btn btn-default btn-sm agregarProgramacion" data-toggle="tooltip" data-placement="top" title="Agregar Hito" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividades[u].id+'><span class="glyphicon glyphicon-time" ></span></button><button type="button" class="btn btn-default btn-sm agregarAvance" data-toggle="tooltip" data-placement="top" title="Declarar Avance" parametros="'+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividades[u].id+'"><span class="fa fa-line-chart"></span></button></td></tr>';
					<%}%>
				}else{
					<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") ){%>
						cuerpoActividad+='<tr><td><del>'+actividades[u].nombre+'</del></td><td><del>'+actividades[u].descripcion+'</del></td><td><del>'+nombreUnidadMedida+'</del></td><td><del>'+nombreHitoTipo+'</del></td><td><del>'+actividades[u].proporcion+'</del></td><td><del>'+actividades[u].peso+'</del></td><td><del>'+acumulable(actividades[u].acumulable)+'</del></td><td><del>'+prodConcatVal(actividades[u].prodConcat)+'</del></td><td><button type="button" class="btn btn-default btn-sm editarCronograma" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accion[0].id+'-'+accion[0].accionCatalogoId+'-'+actividades[u].id+' data-toggle="tooltip" data-placement="top" title="Editar Cronograma"><span class="glyphicon glyphicon-pencil" ></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarCronograma" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accion[0].id+'-'+accion[0].accionCatalogoId+'-'+actividades[u].id+'><span class="fa fa-recycle" </span></button><button type="button" class="btn btn-default btn-sm agregarProgramacion" data-toggle="tooltip" data-placement="top" title="Agregar Hito" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividades[u].id+'><span class="glyphicon glyphicon-time" ></span></button><button type="button" class="btn btn-default btn-sm agregarAvance" data-toggle="tooltip" data-placement="top" title="Declarar Avance" parametros="'+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividades[u].id+'"><span class="fa fa-line-chart"></span></button></td></tr>';
					<%}%>		
				}	
			}	
		}
		
		
		//var optionTipoHito='<option value="0" parametro="0">Entregable</option><option value="1" parametro="1">Intermedio</option><option value="2" parametro="2">Autonomo</option>';

		
		var cuerpoModalActividades = "";

		cuerpoModalActividades +=	'<div class="modal fade" id="modalActividad" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+' tabindex="-1" aria-labelledby="myLargeModalLabel">'+
		'	<div class="modal-dialog modal-lg" style="width:90%">'+
		'		<div class="modal-content" >'+
		'			<div class="modal-header">'+
		'		        <button type="button" class="close agregarAccion" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'  aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
		'		        <h4 class="modal-title">'+accionCatalogo[0].nombre+' de '+lineaAccion[0].nombre+' ('+institucion[0].sigla+') año '+insLineaAccion[0].periodoId+'</h4>'+   
		'			</div>'+
		'		    <div class="modal-body" id="accionCuerpo" >'+
		
		<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>		
		'		      	<div class="row">'+
		'								<form role="form" id="formularioCronograma">'+
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
		
		
		'									<div class="table-responsive">'+
		'										<table class="table table-hover">'+
		'											<tbody id="formularioAgregarActividad">'+
		'												<tr><td><div class="form-group"><label for="departamentoActividad">Departamento</label><input type="text" class="form-control" id="departamentoActividad" value="'+nombreDepartamento+'" disabled /></div></td><td><div class="form-group"><label for="distritoActividad">Distrito</label><input type="text" id="distritoActividad" value="'+nombreDistrito+'" class="form-control" disabled> </div></td></tr>'+
		'												<tr><td><div class="form-group"><label for="nombreActividad">Cronograma</label><input type="text" class="form-control" id="nombreActividad" value="" placeholder="Ingrese Nombre del Cronograma" required><input type="hidden" class="form-control" id="insLineaAccionId" value="'+insLineaAccionId+'"></div></td><td><div class="form-group"><label for="descripcionActividad">Descripción</label><input type="text" id="descripcionActividad" value="" class="form-control"> </div></td></tr>'+
		'												<tr><td><div class="form-group"><label for="unidadMedidaIdActividad">Unidad de Medida</label><select id="unidadMedidaIdActividad" class="form-control" placeholder="Ingrese Unidad Medida Id">'+optionUnidadMedida+'</div></td><td><div class="form-group"><label for="hitoTipoIdActividad">Tipo de Cronograma</label>'+
		'												<select id="hitoTipoIdActividad" class="form-control" placeholder="Ingrese Tipo de Cronograma">'+optionTipoHito+'</select></div></td></tr>'+
		'												<tr><td><div class="form-group"><label for="proporcionActividad">Proporción</label><input type="number" class="form-control" id="proporcionActividad" value="1" step="0.01" required /></div></div></td><td><div class="form-group"><label for="pesoActividad">Peso</label><input type="number" class="form-control" id="pesoActividad" value="1" step="0.01" required/></div></td></tr>'+
		'												<tr><td><div class="form-group"><label for="acumulableActividad">Acumulable</label><select id="acumulableActividad" class="form-control" placeholder="Ingrese Tipo Acumulable">'+optionAcumulable+'</select></div></td>'+
		'													<td><div class="form-group"><label for="productosActividad">Producto relacionado</label><select id="productosActividad" class="form-control" placeholder="Ingrese el Producto al cual se vincula la actividad">'+optionProductosAccion+'</select></div></td></tr>'+
		'											</tbody>'+							           
		'										</table>'+
		'									</div>'+
		'								<input type="hidden" id="versionActividad" class="form-control" placeholder="Ingrese Versión" value="3"/><input type="hidden" id="accionIdActividad" class="form-control" placeholder="Ingrese Accion Id" value="'+accionId+'" />'+
		
		'               			</div>'+//fin box-body
		'							<div class="modal-footer">'+
		'								<button type="submit" class="btn btn-success btn-sm guardarActividad" parametros = '+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'>Guardar Cronograma</button>'+
		'							</div>'+
		'                		</div>'+	
		'                	</div>'+
		'					</form>'+
		'                </div>'+											
		
		<% } %>		

		
		'		      	<div class="row">'+ 
		'		      		<div class="col-md-12">'+
		'						<div class="box box-warning">'+
		'		                	<div class="box-header with-border">'+
		'								<h3 class="box-title">Lista de Cronogramas</h3>'+
		'	                  			<div class="box-tools pull-right">'+
		'				                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>'+
		'		                    		</button>'+
		'		                    		<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i>'+
		'		                    		</button>'+
		'		                  		</div>'+
		'               			</div>'+//fin box-heder
		'               			<div class="box-body" id="cuerpoListaCronogramas">'+
		
	                			

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
		$('#cuerpoListaCronogramas').html("");
		
		var tablaCronograma ='			<div class="table-responsive">'+
		'	                				<table class="table table-hover table-bordered" id="dataTablesActividades">'+
		'	                					<thead>'+
		'	                						<tr class="active"><th class="text-center">Nombre</th><th class="text-center">Descripción</th><th class="text-center">Unidad Medida</th><th class="text-center">Tipo Cronograma</th><th class="text-center">Proporción</th><th class="text-center">Peso</th><th class="text-center" data-toggle="tooltip" data-placement="top" title="Acumulable">Acu</th><th class="text-center" data-toggle="tooltip" data-placement="top" title="Producto Concat">Producto Concat</th><th class="text-center">Administrar Cronograma</th></tr>'+
		'	                					</thead>'+
		'	                						<tbody id="tablaActividades">'+
		'	                						</tbody>'+
		'	                				</table>'+
		'	                			</div>';
		
		$('#cuerpoListaCronogramas').append(tablaCronograma);
		$('#tablaActividades').append(cuerpoActividad);
		$("#modalActividad").modal('show');
		$("#dataTablesActividades").DataTable({
			dom: 'Bfrtip',
	        buttons: [
	                    {
	                        extend: 'copy',
	                        exportOptions: {
	                    columns: [ 0, 1, 2, 3, 4, 5, 6 ]
	                }
	                    },
	                    {
	                        extend: 'csv',
	                        exportOptions: {
	                    columns: [ 0, 1, 2, 3, 4, 5, 6 ]
	                }
	                    },
	                    {
	                        extend: 'excel',
	                        exportOptions: {
	                    columns: [ 0, 1, 2, 3, 4, 5, 6 ]
	                }
	                    },
	                    {
	                        extend: 'pdf',
	                        exportOptions: {
	                    columns: [ 0, 1, 2, 3, 4, 5, 6 ]
	                }
	                    },
	                    {
	                        extend: 'print',
	                        exportOptions: {
	                    columns: [ 0, 1, 2, 3, 4, 5, 6 ]
	                }
	                    }
	                ]});
		
		/* function Combo(){

		    this.productoConcatFocus = function(){
			if ( $("#listaProductos").length ) {
				$("#listaProductos").remove();
				$('#productosActividad').val('');				
			}
			
			var url="";
								
		   	var listaDatalist=document.getElementsByTagName('datalist');
		      
		   	var datosProductos = $.ajax({
				url:'/tablero/ajaxSelects2?action=getProductosPresupuestoPND',
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			datosProductos = JSON.parse(datosProductos);	 */		
			   
			/* var optionProductos;
			for(var u = 0; u < productos.length; u++)
			{
				optionProductos += '<option value="'+productos[u].producto_concat+'" >' + productos[u].producto_nombre + ' - ' + productos[u].producto_concat + '</option>';
			} */		   	 
		        
				
		        /* if(listaDatalist.length === 0 )
		        {
			        var datalistProductos = document.createElement('datalist');
			        datalistProductos.setAttribute('id','listaProductos');
			        datalistProductos.setAttribute('size','7'); 
			        var ubicacionDatalistProductos = document.getElementById('formularioCronograma');
			        ubicacionDatalistProductos.appendChild(datalistProductos);
			
			        for(var i = 0; i < datosProductos.length ; i++) 
			        {    
			        	var option = document.createElement('option');
			          	option.setAttribute('value',datosProductos[i].producto_concat);
			          	option.setAttribute('label',datosProductos[i].producto_nombre);
			          	datalistProductos.appendChild(option);      
			      	} 
		        }
			
		    } 		    
		    
		}//fin combo 
		
		  var eje1 = new Combo();
		  document.getElementById('productosActividad').addEventListener('focus',eje1.productoConcatFocus,false);*/ 			
				
	});
	
	function acumulable(dato){
		
		var acu="";
		if(dato == true){
			return acu = "Si";
		}else{
			return acu = "No";
		}
	}
	
	function prodConcatVal(dato){		
		var pcc="";
		if(dato != undefined){
			return pcc = dato;
		}else{
			return pcc = "";
		}
	}
	
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

	//Obtención de los datos de la actividad a ser editada para rellenar los campos en el formulario.
	var actividades = $.ajax({
		url:'/tablero/ajaxSelects2?action=getCronograma&cronogramaId='+cronogramaId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	actividades = JSON.parse(actividades);
	
	//Sección de carga de productos en el combobox. 
	var productos = $.ajax({
		url:'/tablero/ajaxSelects2?action=getProductos',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	productos = JSON.parse(productos);
	
	var institucion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getInstitucion&institucionId='+institucionId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	institucion = JSON.parse(institucion);
	
	var productoNombre = '';
	var productosAccion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getAccionHasProducto&accionId='+accionId+'&nivel='+institucion[0].nivelId+'&entidad='+institucion[0].entidadId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	productosAccion = JSON.parse(productosAccion);		
	
	var optionProductosAccion;
	optionProductosAccion = '<option value="">Ningún producto seleccionado</option>';
	for(var u = 0; u < productosAccion.length; u++)
	{
		productoNombre = '';
		for(var i = 0; i < productos.length; i++)
		{
			if (productosAccion[u].sprProductoId == productos[i].id){
				productoNombre = productos[i].nombre;
			}
		}
		
		var valor = productosAccion[u].nivel+'-'+
					productosAccion[u].entidad+'-'+
					productosAccion[u].tipoPrograma+'-'+
					productosAccion[u].programa+'-'+
					productosAccion[u].subPrograma+'-'+
					productosAccion[u].proyecto+'-'+
					productosAccion[u].sprProductoId; 
		
		optionProductosAccion+='<option value="'+valor+'"';
									
		if (valor == actividades[0].prodConcat) 
			optionProductosAccion+= ' selected >';								
		else 
			optionProductosAccion+= ' >';
		
		optionProductosAccion += productosAccion[u].sprProductoId + ' - ' + productoNombre + '</option>';
	}	
	
	//Continuación con la carga de datos en los formularios de la actividad a editar.
	var unidadMedida = $.ajax({
		url:'/tablero/ajaxSelects2?action=getUnidadMedida',
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
		url:'/tablero/ajaxSelects2?action=getHitoTipo',
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
	
	var optionAcumulable;
	optionAcumulable+='<option value="true" parametro="TRUE">Si</option>';
	optionAcumulable+='<option value="false" parametro="FALSE">No</option>';
	
	var cuerpoModalEditarCronograma = "";
	cuerpoModalEditarCronograma =	'<div class="modal fade" id="modalEditarCronograma" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
						'	<div class="modal-dialog modal-lg" style="width:90%">'+
						'			      							<form id="formularioCronograma">'+
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
						'		    <div class="modal-body" id="cuerpoModalEditarCronograma">'+

						'								<div class="table-responsive">'+
						'									<table class="table table-hover">'+
						'										<tbody>'+
						'			      							<form class="form-horizontal" role="form">'+
						'												<tr><td><label for="nombreCronograma">Nombre</label><input type="text" id="nombreCronograma" value="'+actividades[0].nombre+'" class="form-control" required /></td><td><label for="descripcionCronograma">Descripcion</label><input type="text" id="descripcionCronograma" class="form-control" value="'+actividades[0].descripcion+'"  /></td></tr>'+
						'												<tr><td><div class="form-group"><label for="unidadMedidaIdCronograma">Unidad de Medida</label><select id="selectorUnidadMedidaCronograma" class="form-control">'+optionUnidadMedida+'</select></div></td><td><div class="form-group"><label for="hitoTipoIdCronograma">Tipo Cronograma</label><select id="selectorHitoTipoIdCronograma" class="form-control">"'+optionTipoHito+'"</select></div></td></tr>'+
						'												<tr><td><label for="proporcionCronograma">Proporción</label><input type="number" id="proporcionCronograma" value='+actividades[0].proporcion+' step="0.01" class="form-control" required /></td><td><label for="pesoCronograma">Peso</label><input type="number" id="pesoCronograma" class="form-control" value='+actividades[0].peso+' step="0.01" required /></td></tr>'+
						'												<tr><td><div class="form-group"><label for="acumulableCronograma">Acumulable</label><select id="acumulableCronograma" class="form-control" placeholder="Ingrese Tipo Acumulable">'+optionAcumulable+'</select></div></td>'+
						'													<td><div class="form-group"><label for="productosActividad">Producto relacionado</label><select id="productosActividad" class="form-control" placeholder="Ingrese el Producto al cual se vincula la actividad">'+optionProductosAccion+'</select></div></td></tr>'+						
						
						'			      							</form>	'+												
						'										</tbody>'+
						'									</table>'+
						'				      			</div>'+
												
						'		    </div>'+//fin modal-body
						'			<div class="modal-footer">'+					
						'				<button type="submit" class="btn btn-success btn-sm actualizarCronograma" id="botonGuardarCronograma" parametros ='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+accionCatalogoId+'-'+cronogramaId+'>Actualizar Cronograma</button>'+
						'				<button type="button" class="btn btn-success btn-sm agregarActividad" parametros ='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+accionCatalogoId+'>Cerrar</button>'+
						
						'			</div>'+
						'		</div>'+
						'		</form'+ 
						'	</div>'+
						'</div>';
												
		$("#programacion").append(cuerpoModalEditarCronograma);
		$('#selectorUnidadMedidaCronograma > option[value="'+actividades[0].unidad_medida_id+'"]').attr('selected', 'selected');
		$('#selectorHitoTipoIdCronograma > option[value="'+actividades[0].hito_tipo_id+'"]').attr('selected', 'selected');
		$('#acumulableCronograma > option[value="'+actividades[0].acumulable+'"]').attr('selected', 'selected');	

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
		url:'/tablero/ajaxSelects2?action=getCronograma&cronogramaId='+cronogramaId,
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
		url:'/tablero/ajaxSelects2?action=getCronograma&cronogramaId='+cronogramaId,
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
	if (validarFormulario("formularioCronograma",false,false)==true){
		event.stopPropagation();
		event.preventDefault(); 

		 
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
    var pesoCronograma = $("#pesoCronograma").val();
    var acumulable = $("#acumulableCronograma").val();
    var productoConcat = document.getElementById("productosActividad").value;

    
    //aca vacio el formulario de edición de cronograma
    $("#nombreCronograma").val('');
    $("#descripcionCronograma").val('');
    $("#selectorUnidadMedidaCronograma").val('');
    $("#selectorHitoTipoIdCronograma").val('');
    $("#proporcionCronograma").val('');
    $("#pesoCronograma").val('');
    

    
    var datos = new Object();
    datos.id = cronogramaId;
    datos.nombre = nombreCronograma;
    datos.descripcion = descripcionCronograma;
    datos.unidad_medida_id = unidadMedidaCronograma;
    datos.hito_tipo_id = tipoCronograma;
    datos.proporcion = proporcionCronograma;
    datos.peso = pesoCronograma;
    datos.acumulable = acumulable;
    datos.prodConcat = productoConcat; 

    
  	var info = JSON.stringify(datos);
    $.ajax({
        url: "ajaxUpdate2?accion=actCronograma",
        type: 'POST',
        dataType: 'json',
        data: info,
        contentType: 'application/json',
        mimeType: 'application/json',
        success: function (data) {
        	if(data.success == true)
        	{
        		$("#botonGuardarCronograma").remove();
            	$("#cuerpoModalEditarCronograma").html("");
            	$("#cuerpoModalEditarCronograma").html("<h3 class='text-center'>Ud ha actualizado exitosamente!!</h3>");  
        	}
        	
        	},

        error: function(data,status,er) {
        	}
	 });
	}
});
	
	
$("body").on("click", ".guardarActividad",function(event){
		if (validarFormulario("formularioCronograma",false,false)==true){	
			event.stopPropagation();
			event.preventDefault(); 
		
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
	    var acumulable = document.getElementById("acumulableActividad").value;
	    var productoConcat = document.getElementById("productosActividad").value;


		var objeto = new Object();
		
		objeto.nombre = nombre;
		objeto.descripcion = descripcion;
		objeto.proporcion = proporcion;
		objeto.peso = peso;
		objeto.version = version;
		objeto.accion_id = accion_id;
		objeto.unidad_medida_id = unidad_medida_id;
		objeto.hito_tipo_id = hito_tipo_id;
		objeto.acumulable = acumulable;
		objeto.prodConcat = productoConcat; 

		
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
		}	
});	

function actualizarTablaActividades(accion_id,insLineaAccionId,lineaAccionId,institucionId,periodoId){
	var accionId = accion_id;
	var insLineaAccionId = insLineaAccionId;
	var lineaAccionId = lineaAccionId;
	var institucionId = institucionId;
	var periodoId = periodoId;
	
	
	var actividades = $.ajax({
		url:'/tablero/ajaxSelects2?action=getCronograma&accionId='+accionId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	actividades = JSON.parse(actividades);
	
	var unidadMedida = $.ajax({
		url:'/tablero/ajaxSelects2?action=getUnidadMedida',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	unidadMedida = JSON.parse(unidadMedida);

	var hitoTipo = $.ajax({
		url:'/tablero/ajaxSelects2?action=getHitoTipo',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	hitoTipo = JSON.parse(hitoTipo);
	
	var accion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getAccion&accionId='+accionId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	accion = JSON.parse(accion);
	
	var accionCatalogo = $.ajax({
		url:'/tablero/ajaxSelects2?action=getAccionCatalogo&catalogoAccionId='+accion[0].accionCatalogoId,
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
		
		if(onoff==true && actividades[u].borrado == true){
			//	
		}else{
			if(actividades[u].borrado == false)
			{
				<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
					cuerpoActividad+='<tr><td>'+actividades[u].nombre+'</td><td>'+actividades[u].descripcion+'</td><td>'+nombreUnidadMedida+'</td><td>'+nombreHitoTipo+'</td><td>'+actividades[u].proporcion+'</td><td>'+actividades[u].peso+'</td><td>'+acumulable(actividades[u].acumulable)+'</td><td>'+prodConcatVal(actividades[u].prodConcat)+'</td><td><button type="button" class="btn btn-default btn-sm editarCronograma" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accion[0].id+'-'+accion[0].accionCatalogoId+'-'+actividades[u].id+' data-toggle="tooltip" data-placement="top" title="Editar Cronograma"><span class="glyphicon glyphicon-pencil" ></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarCronograma" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accion[0].id+'-'+accion[0].accionCatalogoId+'-'+actividades[u].id+'><span class="glyphicon glyphicon-trash" </span></button><button type="button" class="btn btn-default btn-sm agregarProgramacion" data-toggle="tooltip" data-placement="top" title="Agregar Hito" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividades[u].id+'><span class="glyphicon glyphicon-time" ></span></button><button type="button" class="btn btn-default btn-sm agregarAvance" data-toggle="tooltip" data-placement="top" title="Declarar Avance" parametros="'+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividades[u].id+'"><span class="fa fa-line-chart"></span></button></td></tr>';
				<%} if (attributes.get("role_id_tablero").toString().equals("3")){%>
					cuerpoActividad+='<tr><td>'+actividades[u].nombre+'</td><td>'+actividades[u].descripcion+'</td><td>'+nombreUnidadMedida+'</td><td>'+nombreHitoTipo+'</td><td>'+actividades[u].proporcion+'</td><td>'+actividades[u].peso+'</td><td>'+acumulable(actividades[u].acumulable)+'</td><td>'+prodConcatVal(actividades[u].prodConcat)+'</td><td><button type="button" class="btn btn-default btn-sm agregarProgramacion" data-toggle="tooltip" data-placement="top" title="Agregar Hito" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividades[u].id+'><span class="glyphicon glyphicon-time" ></span></button><button type="button" class="btn btn-default btn-sm agregarAvance" data-toggle="tooltip" data-placement="top" title="Declarar Avance" parametros="'+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividades[u].id+'"><span class="fa fa-line-chart"></span></button></td></tr>';
				<%}%>			
			}else{
				<% if (attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("0")){%>
					cuerpoActividad+='<tr><td><del>'+actividades[u].nombre+'</del></td><td><del>'+actividades[u].descripcion+'</del></td><td><del>'+nombreUnidadMedida+'</del></td><td><del>'+nombreHitoTipo+'</del></td><td><del>'+actividades[u].proporcion+'</del></td><td><del>'+actividades[u].peso+'</del></td><td><del>'+acumulable(actividades[u].acumulable)+'</del></td><td><del>'+prodConcatVal(actividades[u].prodConcat)+'</del></td><td><button type="button" class="btn btn-default btn-sm editarCronograma" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accion[0].id+'-'+accion[0].accionCatalogoId+'-'+actividades[u].id+' data-toggle="tooltip" data-placement="top" title="Editar Cronograma"><span class="glyphicon glyphicon-pencil" ></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarCronograma" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accion[0].id+'-'+accion[0].accionCatalogoId+'-'+actividades[u].id+'><span class="glyphicon glyphicon-trash" </span></button><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="Agregar Hito"><span class="glyphicon glyphicon-time agregarProgramacion" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividades[u].id+'></span></button><button type="button" class="btn btn-default btn-sm agregarAvance" data-toggle="tooltip" data-placement="top" title="Declarar Avance" parametros="'+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividades[u].id+'"><span class="fa fa-line-chart"></span></button></td></tr>';
				<% }%>
			}	
		}	
	}
	$('#cuerpoListaCronogramas').html("");
	
	var tablaCronograma ='			<div class="table-responsive">'+
	'	                				<table class="table table-hover table-bordered" id="dataTablesActividades">'+
	'	                					<thead>'+
	'	                						<tr class="active"><th class="text-center">Nombre</th><th class="text-center">Descripción</th><th class="text-center">Unidad Medida</th><th class="text-center">Tipo Cronograma</th><th class="text-center">Proporción</th><th class="text-center">Peso</th><th class="text-center" data-toggle="tooltip" data-placement="top" title="Acumulable">Acu</th><th class="text-center" data-toggle="tooltip" data-placement="top" title="Producto">Producto Concat</th><th class="text-center">Administrar Cronograma</th></tr>'+
	'	                					</thead>'+
	'	                						<tbody id="tablaActividades">'+
	'	                						</tbody>'+
	'	                				</table>'+
	'	                			</div>';
	
	$('#cuerpoListaCronogramas').append(tablaCronograma);
	
	$('#tablaActividades').append(cuerpoActividad);	
	$("#nombreActividad").val('');
	$("#descripcionActividad").val('');
	$("#unidadMedidaIdActividad").val('');
	$("#hitoTipoIdActividad").val('');
	//$("#proporcionActividad").val('');
	//$("#pesoActividad").val('');
	$("#productosActividad").val('');
	$("#dataTablesActividades").DataTable({
		dom: 'Bfrtip',
        buttons: [
                  {
                      extend: 'copy',
                      exportOptions: {
                  columns: [ 0, 1, 2, 3, 4, 5, 6 ]
              }
                  },
                  {
                      extend: 'csv',
                      exportOptions: {
                  columns: [ 0, 1, 2, 3, 4, 5, 6 ]
              }
                  },
                  {
                      extend: 'excel',
                      exportOptions: {
                  columns: [ 0, 1, 2, 3, 4, 5, 6 ]
              }
                  },
                  {
                      extend: 'pdf',
                      exportOptions: {
                  columns: [ 0, 1, 2, 3, 4, 5, 6 ]
              }
                  },
                  {
                      extend: 'print',
                      exportOptions: {
                  columns: [ 0, 1, 2, 3, 4, 5, 6 ]
              }
                  }
              ]
	});
		
}

function renderProgramacion(insLineaAccionId,lineaAccionId,institucionId,periodoId,accionId,cronogramaId){
	
	
	if ( $("#modalProgramacion").length )
	{
		$("#modalProgramacion").remove();
	}
	if ( $("#modalActividad").length )
	{
		$("#modalActividad").remove();
	}	
	if ( $("#modalAccion").length )
	{
		$("#modalAccion").remove();
	}	
	if ( $("#modalEditarHito").length )
	{
		$("#modalEditarHito").remove();
	}
	if ( $("#modalBorrarHito").length )
	{
		$("#modalBorrarHito").remove();
	}	
	
	var cronogramas = $.ajax({
		url:'/tablero/ajaxSelects2?action=getCronograma&cronogramaId='+cronogramaId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	cronogramas = JSON.parse(cronogramas);
	
	var programacionWebService = $.ajax({
		url:'/tablero/ajaxSelects2?action=getProgramacion&actividadId='+cronogramaId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	programacionWebService = JSON.parse(programacionWebService);
	
	var hitoTipo = $.ajax({
		url:'/tablero/ajaxSelects2?action=getHitoTipo',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	hitoTipo = JSON.parse(hitoTipo);
	
	var accion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getAccion&accionId='+accionId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	accion = JSON.parse(accion);
	
	var accionCatalogo = $.ajax({
		url:'/tablero/ajaxSelects2?action=getAccionCatalogo&catalogoAccionId='+accion[0].accionCatalogoId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	accionCatalogo = JSON.parse(accionCatalogo);
	
	var unidadMedida = $.ajax({
		url:'/tablero/ajaxSelects2?action=getUnidadMedida',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	unidadMedida = JSON.parse(unidadMedida);
	
	var lineaAccion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getLineaAccion&lineaAccionId='+lineaAccionId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	lineaAccion = JSON.parse(lineaAccion)
	
	var periodo = $.ajax({
		url:'/tablero/ajaxSelects2?action=getPeriodo&periodoId='+periodoId,
  		type:'get',
  		dataType:'json',
  		async:false       
	}).responseText;
	periodo = JSON.parse(periodo);
	
	var departamentos = $.ajax({
    	url:'/tablero/ajaxSelects?action=getDepartamento',
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
	departamentos = JSON.parse(departamentos);
	
	var distritos = $.ajax({
    	url:'/tablero/ajaxSelects?action=getDistrito',
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
	distritos = JSON.parse(distritos);
	
	var nombreDepartamento = "";
	var nombreDistrito = "";
	
	for(var d = 0; d < departamentos.length; d++)
	{
		if(accion[0].departamentoId == departamentos[d].idDepartamento){
			nombreDepartamento = departamentos[d].nombreDepartamento;
		}
	}
	

	for(var e = 0; e < distritos.length; e++)
	{
		if(accion[0].distritoId == distritos[e].id && accion[0].departamentoId == distritos[e].departamentoId){
			nombreDistrito = distritos[e].descripcion;
		}
	}
	
	var nombreUnidadMedida="";
	for(var f = 0; f < unidadMedida.length; f++ )
	{
		if(accionCatalogo[0].idUnidadMedida == unidadMedida[f].id)
		{
			nombreUnidadMedida = unidadMedida[f].descripcion;
		}
	}
	var nombreUnidadMedidaHitoProgramado="";
	for(var g = 0; g < unidadMedida.length; g++ )
	{
		if(cronogramas[0].unidad_medida_id == unidadMedida[g].id)
		{
			nombreUnidadMedidaHitoProgramado = unidadMedida[g].descripcion;
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
		if(onoff==true && programacionWebService[n].borrado == true){
			// pasa a la siguiente fila en el for ++
		}else{
			if(programacionWebService[n].borrado == false)
			{
				<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
					cuerpoActividades += "<tr><td>"+numeroConComa(programacionWebService[n].cantidad)+"</td><td>"+programacionWebService[n].fechaEntrega+"</td><td>"+programacionWebService[n].version+"</td><td>"+cronogramas[0].nombre+"</td><td>"+nombreUnidadMedidaHitoProgramado+"</td><td class='text-center'><button type='button' class='btn btn-default btn-sm consultaEditarHito'  data-toggle='tooltip' data-placement='top' title='Editar Hito' parametros="+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+cronogramaId+'-'+programacionWebService[n].id+" ><span class='fa fa-pencil' ></span></button><button type='button' class='btn btn-default btn-sm consultaBorrarHito' title='Borrar Hito' parametros="+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+cronogramaId+'-'+programacionWebService[n].id+" ><span class='fa fa-trash' </span></button></td></tr>";
				<%} if (attributes.get("role_id_tablero").toString().equals("3")){%>
					cuerpoActividades += "<tr><td>"+numeroConComa(programacionWebService[n].cantidad)+"</td><td>"+programacionWebService[n].fechaEntrega+"</td><td>"+programacionWebService[n].version+"</td><td>"+cronogramas[0].nombre+"</td><td>"+nombreUnidadMedidaHitoProgramado+"</td><td class='text-center'></td></tr>";
				<%}%>
			}else{
				<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") ){%>
					cuerpoActividades += "<tr><td><del>"+numeroConComa(programacionWebService[n].cantidad)+"</del></td><td><del>"+programacionWebService[n].fechaEntrega+"</del></td><td><del>"+programacionWebService[n].version+"</del></td><td><del>"+cronogramas[0].nombre+"</del></td><td><del>"+nombreUnidadMedidaHitoProgramado+"</del></td><td class='text-center'><button type='button' class='btn btn-default btn-sm consultaBorrarHito' title='Restaurar Hito' parametros="+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+cronogramaId+'-'+programacionWebService[n].id+" ><span class='fa fa-recycle' </span></button></td></tr>";
				<%}%>	
			}	
		}
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
							
							<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>		
							'		      	<div class="row">'+ 
							'  		      	 <form role="form" id="formularioHito">'+
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
							'											<tr><td><div class="form-group"><label for="departamentoActividad">Departamento</label><input type="text" class="form-control" id="departamentoActividad" value="'+nombreDepartamento+'" disabled /></div></td><td><div class="form-group"><label for="distritoActividad">Distrito</label><input type="text" id="distritoActividad" value="'+nombreDistrito+'" class="form-control" disabled> </div></td></tr>'+
							'											<tr><td><label for="accionProgramacion">Accion</label><input type="text" id="accionProgramacion" value="'+accionCatalogo[0].nombre+'" class="form-control" disabled /></td><td><label for="unidadMedidaProgramacion">U. Medida</label><input type="text" id="unidadMedidaProgramacion" class="form-control" value="'+nombreUnidadMedida+'" disabled /></td></tr>'+
							'											<tr><td><label for="cronogramaProgramacion">Cronograma</label><input type="text" id="cronogramaProgramacion" value="'+cronogramas[0].nombre+'" class="form-control" disabled /><input type="hidden" id="cronogramaIdProgramacion" value="'+cronogramas[0].id+'" /></td><td><label for="tipoCronogramaProgramacion">Tipo Cronograma</label><input type="text" id="tipoCronogramaProgramacion" class="form-control" value="'+nombreHitoTipo+'" disabled /></td></tr>'+														
							'											<tr><td><label for="cantidadProgramacion">Cantidad</label><input type="number" id="cantidadProgramacion" value="" step="any" class="form-control" placeholder="Ingres Cantidad" required /></td><td><label for="fechaEntregaProgramacion">Fecha Entrega</label><input  id="fechaEntregaProgramacion" class="form-control" required/></td></tr>'+
							'											<input type="hidden" id="versionProgramacion" value="3" /><input type="hidden" id="actividadIdProgramacion" value="'+cronogramaId+'" />'+		
							'			      							</form>	'+												
							'										</tbody>'+
							'									</table>'+
							'				      			</div>'+
							
							'               			</div>'+//fin box-body
							'							<div class="modal-footer">'+ 
							'					        	<button type="submit" class="btn btn-success guardarProgramacion" parametros="'+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+cronogramaId+'" >Guardar</button>'+ 
							'					          	<button type="button" class="btn btn-success agregarActividad" data-dismiss="modal" parametros="'+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'">Cerrar</button>'+ 
							'							</div>'+
							'                		</div>'+	
							'                	</div>'+
							'                	</form>'+
							'                </div>'+											
											
							<% }%>		

							'		      	<div class="row" id="tableCronograma">'+ 
							'		      		<div class="col-md-12" >'+
							'						<div class="box box-warning">'+
							'		                	<div class="box-header with-border">'+
							'								<h3 class="box-title">Hitos Programados</h3>'+
							'	                  			<div class="box-tools pull-right">'+
							'				                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>'+
							'		                    		</button>'+
							'		                    		<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i>'+
							'		                    		</button>'+
							'		                  		</div>'+
							'               			</div>'+//fin box-heder
							'               			<div class="box-body" id="tablaListaProgramacionHito1">'+
														//cuerpo del dataTable de ProgramacionHito1
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
	$("#tablaListaProgramacionHito1").html("");
	
	var tablaProgramacionHito1 ='	<div class="table-responsive">'+
	'									<table class="table table-hover table-bordered" id="dataTablesProgramacionHito1">'+
	'										<thead><tr class="active"><th>Cantidad</th><th>FechaEntrega</th><th>Versión</th><th>Cronograma</th><th>Unidad Medida</th><th class="text-center">Administrar</th></tr></thead>'+
	'										<tfoot><tr><th></th><th></th><th></th><th></th><th></th><th></th></tr></tfoot>'+
	'										<tbody id="listaActividades">'+
	'										</tbody>'+
	'									</table>'+
	'								</div>';
	
	$("#tablaListaProgramacionHito1").append(tablaProgramacionHito1);
	$("#listaActividades").append(cuerpoActividades);
	$("#modalProgramacion").modal('show');
	if ( $("#dataTablesProgramacionHito1").length ){
		$('#dataTablesProgramacionHito1').DataTable().destroy();	
	}
	$('#fechaEntregaProgramacion').datepicker({ 
		language: "es",
		format: 'yyyy-mm-dd',
		todayBtn: "linked",
	    todayHighlight: true});
	//$("#dataTablesProgramacionHito1").DataTable();
	$('#dataTablesProgramacionHito1').dataTable({
		"order": [[ 1, "asc" ]],
        "footerCallback": function ( row, data, start, end, display ) {
            var api = this.api(), data;
 
         // saca los puntos y <del> de la cadena para pasarlo a entero
            var intVal = function(i){
            	if(typeof i==='string'){	
            		i=i.replace(/[\."<\/*del>""Gs\."]/g, '');
            		i=i.replace(/[","]/g, '.');
            		i=i*1;		            		
            	}else{
            		if(typeof i==='number'){
            			i=i;		            			
            	}else{
            		i=0;
            	}
            }
            	return i;
            };
 
         // total general para todas las paginas de la columna
            total0 = api
                .column( 0 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
         // total por pagina segun número de columna
            pageTotal0 = api
                .column( 0, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
         
         // se muestran los valores de los totales en el footer del table
            $( api.column( 0 ).footer() ).html(
            		'Total Pág. '+ numeroConComa(pageTotal0) +' (Total Gral. '+ numeroConComa(total0) +')'
            );	         
        },
        dom: 'Bfrtip',
        buttons: [
                  {
                      extend: 'copy',
                      exportOptions: {
                  columns: [ 0, 1, 2, 3, 4 ]
              }
                  },
                  {
                      extend: 'csv',
                      exportOptions: {
                  columns: [ 0, 1, 2, 3, 4 ]
              }
                  },
                  {
                      extend: 'excel',
                      exportOptions: {
                  columns: [ 0, 1, 2, 3, 4 ]
              }
                  },
                  {
                      extend: 'pdf',
                      exportOptions: {
                  columns: [ 0, 1, 2, 3, 4 ]
              }
                  },
                  {
                      extend: 'print',
                      exportOptions: {
                  columns: [ 0, 1, 2, 3, 4 ]
              }
                  }
              ]
});
	
}

$("body").on("click", ".agregarProgramacion",function(event){ 
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");                                                            
	
	//Las siguentes 4 variables se utiliza en esta funcion para redibujar el modal anterior
	var insLineaAccionId = idParsed[0];
	var lineaAccionId = idParsed[1];
	var institucionId = idParsed[2];
	var periodoId = idParsed[3];
	var accionId = idParsed[4];
	var cronogramaId = idParsed[5];

	renderProgramacion(insLineaAccionId,lineaAccionId,institucionId,periodoId,accionId,cronogramaId);
		
	
});	

$("body").on("click", ".guardarProgramacion",function(event){
	if(validarFormulario("formularioHito",false,false)==true){
		event.stopPropagation();
		event.preventDefault(); 

		
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");                                                            
	
	//Las siguentes 4 variables se utiliza en esta funcion para redibujar el modal anterior
	var insLineaAccionId = idParsed[0];
	var lineaAccionId = idParsed[1];
	var institucionId = idParsed[2];
	var periodoId = idParsed[3];
	var accionId = idParsed[4];
	var cronogramaId = idParsed[5];
	
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
        		
        		$("#tableCronograma").html("");
        		
        		var tableProgamacion= "";
        		tableProgamacion= 
				'		      		<div class="col-md-12" >'+
				'						<div class="box box-warning">'+
				'		                	<div class="box-header with-border">'+
				'								<h3 class="box-title">Hitos Programados</h3>'+
				'	                  			<div class="box-tools pull-right">'+
				'				                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>'+
				'		                    		</button>'+
				'		                    		<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i>'+
				'		                    		</button>'+
				'		                  		</div>'+
				'               			</div>'+//fin box-heder
				'               			<div class="box-body" id="tablaListaProgramacionHito1">'+
											//cuerpo del dataTable de ProgramacionHito1
				'               			</div>'+//fin box-body
				'                		</div>'+	
				'                	</div>'+
				'                </div>'+
				

				'		    </div>'+
				'			<div class="modal-footer">'+
		      	'			</div>'+														
				'		</div>'+ 
				'	</div>';
						
				$("#tableCronograma").append(tableProgamacion);	
        		
        		renderProgramacion(insLineaAccionId,lineaAccionId,institucionId,periodoId,accionId,cronogramaId);

        	}else{
        		alert("ERROR");
        	}
        },
        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
        error: function(data,status,er) {
        	
        	}
	 });
	}
});

var distAvance = "";

var distritos = $.ajax({
	url:'/tablero/ajaxSelects?action=getDistrito',
  	type:'get',
  	dataType:'json',
  	async:false       
}).responseText;
distritos = JSON.parse(distritos);

function renderAvance(insLineaAccionId, lineaAccionId, institucionId, periodoId, accionId, actividadId){
	
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
			
    var f = new Date();
    if( (f.getMonth() +1) < 10 ){
    	var mes =( 0 +""+ (f.getMonth() +1));
    }else{
    	var mes =f.getMonth()+1;
    }
    
    if( (f.getDate()) < 10 ){
    	var dia =( 0 +""+ (f.getDate()));
    }else{
    	var dia = f.getDate();
    }
    var fechaActual = (f.getFullYear() + "-" + mes + "-" + dia);
    
	var insLineaAccion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getInsLineaAccion&insLineaAccionId='+insLineaAccionId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;		
	insLineaAccion=JSON.parse(insLineaAccion);
	
	var institucion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getInstitucion&institucionId='+insLineaAccion[0].institucionId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	institucion = JSON.parse(institucion);
    
	var programacionWebService = $.ajax({
		url:'/tablero/ajaxSelects2?action=getProgramacion&actividadId='+actividadId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	programacionWebService = JSON.parse(programacionWebService);
		
	var accion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getAccion&accionId='+accionId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	accion = JSON.parse(accion);
	
	var accionCatalogo = $.ajax({
		url:'/tablero/ajaxSelects2?action=getAccionCatalogo&catalogoAccionId='+accion[0].accionCatalogoId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	accionCatalogo = JSON.parse(accionCatalogo);
	
	var lineaAccion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getLineaAccion&lineaAccionId='+lineaAccionId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	lineaAccion = JSON.parse(lineaAccion)
	
	var webServicesAvance = $.ajax({
		url:'/tablero/ajaxSelects2?action=getAvance&actividadId='+actividadId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesAvance = JSON.parse(webServicesAvance);
	
	var actividades = $.ajax({
		url:'/tablero/ajaxSelects2?action=getCronograma&cronogramaId='+actividadId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	actividades = JSON.parse(actividades);
	
	var unidadMedida = $.ajax({
		url:'/tablero/ajaxSelects2?action=getUnidadMedida',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	unidadMedida = JSON.parse(unidadMedida);
	
	var departamentos = $.ajax({
    	url:'/tablero/ajaxSelects?action=getDepartamento',
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
	departamentos = JSON.parse(departamentos);
	
	var nombreDepartamento = "";
	var nombreDistrito = "";
	var optionDistritoAvance;
	var optionDepartamentoAvance;
	
	
	for(var d = 0; d < departamentos.length; d++)
	{
		if(accion[0].departamentoId == departamentos[d].idDepartamento){
			nombreDepartamento = departamentos[d].nombreDepartamento;
			optionDepartamentoAvance+='<option value="'+departamentos[d].idDepartamento+'" selected >'+departamentos[d].nombreDepartamento+'</option>';
		}
		else {			
			nombreDepartamento = departamentos[d].nombreDepartamento;
			optionDepartamentoAvance+='<option value="'+departamentos[d].idDepartamento+'" >'+departamentos[d].nombreDepartamento+'</option>';
		}
	}
	

	for(var e = 0; e < distritos.length; e++)
	{
		if(accion[0].distritoId == distritos[e].id && accion[0].departamentoId == distritos[e].departamentoId){
			nombreDistrito = distritos[e].descripcion;
		}
		if(accion[0].departamentoId == distritos[e].departamentoId && nombreDistrito == distritos[e].descripcion){
			optionDistritoAvance+='<option value="'+distritos[e].id+'" selected>'+distritos[e].descripcion+'</option>';	
		}
		if(accion[0].departamentoId == distritos[e].departamentoId && nombreDistrito != distritos[e].descripcion){	
			
			optionDistritoAvance+='<option value="'+distritos[e].id+'" >'+distritos[e].descripcion+'</option>';
		}
	}
	
	var nombreUnidadMedidaHitoProgramado="";
	for(var g = 0; g < unidadMedida.length; g++ )
	{
		if(actividades[0].unidad_medida_id == unidadMedida[g].id)
		{
			nombreUnidadMedidaHitoProgramado = unidadMedida[g].descripcion;
		}
	}	
		
	var cuerpoActividades ="";
	for(var n = 0; n < programacionWebService.length; n++)
	{
		if(onoff==true && programacionWebService[n].borrado == true){
			// pasa a la siguiente fila en el for ++
		}else{
			if(programacionWebService[n].borrado == false)
			{
				<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
					cuerpoActividades += "<tr><td>"+numeroConComa(programacionWebService[n].cantidad)+"</td><td>"+programacionWebService[n].fechaEntrega+"</td><td>"+nombreUnidadMedidaHitoProgramado+"</td></tr>";
				<%} if (attributes.get("role_id_tablero").toString().equals("3")){%>
					cuerpoActividades += "<tr><td>"+numeroConComa(programacionWebService[n].cantidad)+"</td><td>"+programacionWebService[n].fechaEntrega+"</td><td>"+nombreUnidadMedidaHitoProgramado+"</td><td class='text-center'></td></tr>";
				<%}%>
			}else{
				<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") ){%>
					cuerpoActividades += "<tr><td><del>"+numeroConComa(programacionWebService[n].cantidad)+"</del></td><td><del>"+programacionWebService[n].fechaEntrega+"</del></td><td><del>"+nombreUnidadMedidaHitoProgramado+"</del></td></tr>";
				<%}%>	
			}	
		}
	}
	
 
	
	var nombreUnidadMedida = "";
	for(var u = 0; u < unidadMedida.length; u++)
	{
		if(unidadMedida[u].id == actividades[0].unidad_medida_id)
		{
			nombreUnidadMedida = unidadMedida[u].descripcion;
		}
	}
	
	var deptoAvance = "";	
	var cuerpoAvance = " ";
	for(var d = 0; d < webServicesAvance.length; d++)
	{
		deptoAvance = "";
		distAvance = "";
		for(var a = 0; a < departamentos.length; a++)
		{
			if(webServicesAvance[d].departamentoId == departamentos[a].idDepartamento){
				deptoAvance = departamentos[a].nombreDepartamento;				
			}
		}
		
		for(var e = 0; e < distritos.length; e++)
		{
			if(webServicesAvance[d].departamentoId == distritos[e].departamentoId && webServicesAvance[d].distritoAvance == distritos[e].id){			
				distAvance = distritos[e].descripcion;
			}
		}
		
		if(onoff==true && webServicesAvance[d].borrado == true){
			// pasa a la siguiente fila en el for ++	
		}else{
			if(webServicesAvance[d].borrado == true)
			{
				<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") ){%>
					cuerpoAvance += '<tr><td><del>'+deptoAvance+'</del></td><td><del>'+distAvance+'</del></td><td><del>'+webServicesAvance[d].justificacion+'</del></td><td><del>'+numeroConComa(webServicesAvance[d].cantidad)+'</del></td><td><del>'+webServicesAvance[d].fechaEntrega+'</del></td><td class="text-center"><button type="button" class="btn btn-default btn-sm agregarModalAdministrador" data-toggle="tooltip" data-placement="top" title="Detallar Avance" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+webServicesAvance[d].id+'><span class="fa fa-gear"></span></button></td></tr>';
				<%}%>
			}else{
				<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
					cuerpoAvance += '<tr><td>'+deptoAvance+'</td><td>'+distAvance+'</td><td>'+webServicesAvance[d].justificacion+'</td><td>'+numeroConComa(webServicesAvance[d].cantidad)+'</td><td>'+webServicesAvance[d].fechaEntrega+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm agregarModalAdministrador" data-toggle="tooltip" data-placement="top" title="Detallar Avance" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+webServicesAvance[d].id+'><span class="fa fa-gear"></span></button></td></tr>';
				<%} if (attributes.get("role_id_tablero").toString().equals("3")){%>
					cuerpoAvance += '<tr><td>'+deptoAvance+'</td><td>'+distAvance+'</td><td>'+webServicesAvance[d].justificacion+'</td><td>'+numeroConComa(webServicesAvance[d].cantidad)+'</td><td>'+webServicesAvance[d].fechaEntrega+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm agregarModalAdministrador" data-toggle="tooltip" data-placement="top" title="Detallar Avance" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+webServicesAvance[d].id+'><span class="fa fa-gear"></span></button></td></tr>';
				<%}%>
			}
		}	
	}
		
	var modalAvance = "";

	modalAvance += '<div class="modal fade" id="modalAvance" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
							'	<div class="modal-dialog modal-lg" style="width:90%">'+
							'		<div class="modal-content" >'+
							'			<div class="modal-header">'+
							'		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="agregarActividad" parametros="'+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'" >&times;</span></button>'+
							'		        <h4 class="modal-title">Avance ('+actividades[0].nombre+' - '+nombreUnidadMedida+')  de '+lineaAccion[0].nombre+' ('+institucion[0].sigla+') año '+insLineaAccion[0].periodoId+'</h4>'+ 
							'			</div>'+
							'		    <div class="modal-body">'+
							
							<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
							'		      	<div class="row">'+ 
							'		      	<form role="form" id="formularioAvance">'+
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
							'											<tr><td><div class="form-group"><label for="departamentoActividad">Departamento</label><input type="hidden" class="form-control" id="departamentoActividad" value="'+nombreDepartamento+'" disabled /><select class="form-control" id="departamentoAvance" >'+optionDepartamentoAvance+'</select></div></td>'+
							'												<td><div class="form-group"><label for="distritoActividad">Distrito</label><input type="hidden" id="distritoActividad" value="'+nombreDistrito+'" class="form-control" disabled><select class="form-control" id="distritoAvance">'+optionDistritoAvance+'</select></div></td></tr>'+
							'											<tr><td><label for="justificacionAvance">Justificación</label><input type="text" id="justificacionAvance" value="" class="form-control" placeholder="Ingrese Justificación" required/></td>'+
							'												<td><label for="cantidadAvance">Cantidad</label><input type="number" id="cantidadAvance" step="any" class="form-control" value="" placeholder="Ingrese Cantidad" required/></td>'+
							'											</tr>'+
							'											<tr><td><label for="fechaEntregaAvance">Fecha Entrega</label><input  id="fechaEntregaAvance" value="'+fechaActual+'" class="form-control" required/></td></tr>'+														
							'											<input type="hidden" id="versionAvance" value="3" />'+		
							'			      							</form>	'+												
							'										</tbody>'+
							'									</table>'+
							'				      			</div>'+							
							
							'               			</div>'+//fin box-body
							'							<div class="modal-footer">'+ 
							'					        	<button type="submit" class="btn btn-success guardarAvance" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'>Guardar Avance</button>'+ 
							'							</div>'+
							'                		</div>'+	
							'                	</div>'+
							'                 </form>'+
							'                </div>'+											
											
							<% }%>
							
							'		      	<div class="row">'+ 
							
							'		      		<div class="col-md-6">'+
							'						<div class="box box-warning">'+
							'		                	<div class="box-header with-border">'+
							'		                  		<h3 class="box-title">Hitos Programados</h3>'+
							'	                  			<div class="box-tools pull-right">'+
							'		                  		</div>'+
							'               			</div>'+//fin box-heder
							'               			<div class="box-body" id="tablaListaProgramacionHito2">'+	 
															//cuerpo de dataTable de programacion hito 2
							'               			</div>'+//fin box-body
							'                		</div>'+	
							'                	</div>'+
							
							'		      		<div class="col-md-6" id="tableAvance">'+
							'						<div class="box box-warning">'+
							'		                	<div class="box-header with-border">'+
							'		                  		<h3 class="box-title">Lista de Avance</h3>'+
							'	                  			<div class="box-tools pull-right">'+
							'		                  		</div>'+
							'               			</div>'+//fin box-heder
							'               			<div class="box-body" id="tablaListaAvanceBox">'+
															//cuerpo de dataTable de lista de Avances
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
	$("#tablaListaAvanceBox").html("");
	
	var tablaListaAvance ='<div class="table-responsive">'+
		'							<table class="table table-hover table-bordered" id="dataTablesListaAvance">'+
		'								<thead><tr class="active"><th>Departamento</th><th>Distrito</th><th>Justificación</th><th>cantidad</th><th>Fecha Entrega</th><th>Administrar</th></tr></thead>'+
		'								<tfoot><tr><th></th><th></th><th></th><th></th><th></th><th></th></tr></tfoot>'+
		'								<tbody id="listaAvances">'+
		'								</tbody>'+
		'							</table>'+
		'						</div>';
	
	$("#tablaListaAvanceBox").append(tablaListaAvance);
	$("#listaAvances").append(cuerpoAvance);
	$("#tablaListaProgramacionHito2").html("");
	
	var tablaProgramacionHito2 ='<div class="table-responsive">'+
	'								<table class="table table-hover table-bordered" id="dataTablesProgramacionHito2">'+
	'									<thead><tr class="active"><th>Cantidad</th><th>FechaEntrega</th><th>Unidad Medida</th></tr></thead>'+
	'									<tfoot><tr><th></th><th></th><th></th></tr></tfoot>'+
	'									<tbody id="listaActividades">'+
	'									</tbody>'+
	'								</table>'+
	'							</div>';
	
	$("#tablaListaProgramacionHito2").append(tablaProgramacionHito2);
	$("#listaActividades").append(cuerpoActividades);
	$("#modalAvance").modal('show');
	$('#fechaEntregaAvance').datepicker({  
		language: "es",
		format: 'yyyy-mm-dd',
		endDate: "0d",
		todayBtn: "linked",
	    todayHighlight: true});
	//$("#dataTablesListaAvance").DataTable();
	$("#dataTablesListaAvance").dataTable({
        "footerCallback": function ( row, data, start, end, display ) {
            var api = this.api(), data;
 
         // saca los puntos y <del> de la cadena para pasarlo a entero
            var intVal = function(i){
            	if(typeof i==='string'){	
            		i=i.replace(/[\."<\/*del>""Gs\."]/g, '');
            		i=i.replace(/[","]/g, '.');
            		i=i*1;		            		
            	}else{
            		if(typeof i==='number'){
            			i=i;		            			
            	}else{
            		i=0;
            	}
            }
            	return i;
            };
 
         // total general para todas las paginas de la columna
            total2 = api
                .column( 3 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
         // total por pagina segun número de columna
            pageTotal2 = api
                .column( 3, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
         
         // se muestran los valores de los totales en el footer del table
            $( api.column( 3 ).footer() ).html(
            		'Total Pág. '+ numeroConComa(pageTotal2) +' (Total Gral. '+ numeroConComa(total2) +')'
            );	         
        },
        dom: 'Bfrtip',
        buttons: [
                  {
                      extend: 'copy',
                      exportOptions: {
                  columns: [ 0, 1, 2 ]
              }
                  },
                  {
                      extend: 'csv',
                      exportOptions: {
                  columns: [ 0, 1, 2 ]
              }
                  },
                  {
                      extend: 'excel',
                      exportOptions: {
                  columns: [ 0, 1, 2 ]
              }
                  },
                  {
                      extend: 'pdf',
                      exportOptions: {
                  columns: [ 0, 1, 2 ]
              }
                  },
                  {
                      extend: 'print',
                      exportOptions: {
                  columns: [ 0, 1, 2 ]
              }
                  }
              ]
	});
	//$("#dataTablesProgramacionHito2").DataTable();
	$('#dataTablesProgramacionHito2').dataTable({
        "footerCallback": function ( row, data, start, end, display ) {
            var api = this.api(), data;
 
         // saca los puntos y <del> de la cadena para pasarlo a entero
            var intVal = function(i){
            	if(typeof i==='string'){	
            		i=i.replace(/[\."<\/*del>""Gs\."]/g, '');
            		i=i.replace(/[","]/g, '.');
            		i=i*1;		            		
            	}else{
            		if(typeof i==='number'){
            			i=i;		            			
            	}else{
            		i=0;
            	}
            }
            	return i;
            };
 
         // total general para todas las paginas de la columna
            total0 = api
                .column( 0 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
         // total por pagina segun número de columna
            pageTotal0 = api
                .column( 0, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
         
         // se muestran los valores de los totales en el footer del table
            $( api.column( 0 ).footer() ).html(
            		'Total Pág. '+ numeroConComa(pageTotal0) +' (Total Gral. '+ numeroConComa(total0) +')'
            );	         
        },
        dom: 'Bfrtip',
        buttons: [
                  {
                      extend: 'copy',
                      exportOptions: {
                  columns: [ 0, 1, 2 ]
              }
                  },
                  {
                      extend: 'csv',
                      exportOptions: {
                  columns: [ 0, 1, 2 ]
              }
                  },
                  {
                      extend: 'excel',
                      exportOptions: {
                  columns: [ 0, 1, 2 ]
              }
                  },
                  {
                      extend: 'pdf',
                      exportOptions: {
                  columns: [ 0, 1, 2 ]
              }
                  },
                  {
                      extend: 'print',
                      exportOptions: {
                  columns: [ 0, 1, 2 ]
              }
                  }
              ]
});
}
$("body").on("click", ".agregarAvance",function(event){
	
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");                                                            
	
	//Las siguentes 4 variables se utiliza en esta funcion para redibujar el modal anterior
	var insLineaAccionId = idParsed[0];
	var lineaAccionId = idParsed[1];
	var institucionId = idParsed[2];
	var periodoId = idParsed[3];
	var accionId = idParsed[4];
	var actividadId = idParsed[5];//es el id de la tabla actidad	
		
	renderAvance(insLineaAccionId, lineaAccionId, institucionId, periodoId, accionId, actividadId);
});

$("body").on("click", ".guardarAvance",function(event){
	if(validarFormulario("formularioAvance",false,false)==true){
		event.stopPropagation();
		event.preventDefault(); 

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
		var distritoAvance = $("#distritoAvance option:selected").val();
		var departamentoId = $("#departamentoAvance option:selected").val();
		var version = $("#versionAvance").val();
	
	
		//Vaciar los inputs
		$("#justificacionAvance").val("");
		$("#cantidadAvance").val("");
		//$("#fechaEntregaAvance").val("");
		//$("#cantidadBeneficiariosAvance").val("");
		
		var objeto = new Object();
		
		objeto.justificacion = justificacion;
		objeto.cantidad = cantidad;
		objeto.fechaEntrega = fechaEntrega;
		objeto.distritoAvance = distritoAvance;
		objeto.departamentoId = departamentoId;
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
	        		$("#tableAvance").html("");
	        			        		
	        		var tableAvance="";
	        		tableAvance=
					'						<div class="box box-warning">'+
					'		                	<div class="box-header with-border">'+
					'		                  		<h3 class="box-title">Lista de Avance</h3>'+
					'	                  			<div class="box-tools pull-right">'+
					'		                  		</div>'+
					'               			</div>'+//fin box-heder
					'               			<div class="box-body" id="tablaListaAvanceBox">'+
													//cuerpo de dataTable de lista de Avances
					'               			</div>'+//fin box-body
					'                		</div>'+	
					'                	</div>';
					
					$("#tableAvance").html(tableAvance);
					
					renderAvance(insLineaAccionId, lineaAccionId, institucionId, periodoId, accionId, actividadId);
	        		
	        	}else{
	        		alert("ERROR");        		
	        	}
	        	
	        	},
	        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
	        error: function(data,status,er) {
	        	
	        	}
		 });
	}
});	

function renderAdministrarAvance(insLineaAccionId,lineaAccionId,institucionId,periodoId,accionId,actividadId,avanceId){
	
	
	if ($("#modalAdministrador").length){
		$("#modalAdministrador").remove();
	}
		
	if ( $("#tableCosto").length )
	{
		var tableCosto="";
		tableCosto=
		'									<div class="box box-default box-solid">'+
		'		                				<div class="box-header with-border">'+
		'		                  					<h3 class="box-title">Lista Costos</h3>'+
		'	                  						<div class="box-tools pull-right">'+
		'				                    			<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
		'		                    					<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>'+
		'		                  					</div>'+
		'              							</div>'+
		'              						<div class="box-body" id="cuerpoTablaCosto">'+	
		'										<div class="table-responsive">'+
		'											<table class="table table-hover table-bordered" id="dataTableAvanceCosto">'+
		'												<thead>'+
		'													<tr class="active"><th>Producto</th><th>ObjetoGasto</th><th>Monto</th><th class="text-center">Administrar</th></tr>'+
		'												</thead>'+
		'												<tfoot>'+
		'													<tr><th></th><th></th><th></th><th></th></tr>'+
		'												</tfoot>'+
		'												<tbody id="listaCosto">'+
		'												</tbody>'+
		'											</table>'+
		'				      					</div>'+
		
		'				      				</div>'+
		'				      			</div>'+
		'              				</div>'+
	
		'              				</div>'+
		'                		</div>';	
		$("#tableCosto").html("");
		$("#tableCosto").html(tableCosto);
	}
	
	if ( $("#tableAvance").length )
	{
		
		var webServicesAvance = $.ajax({
			url:'/tablero/ajaxSelects2?action=getAvance&avanceId='+avanceId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		webServicesAvance = JSON.parse(webServicesAvance); 
		
	/* 	var deptoAvance = "";		
		for(var a = 0; a < departamentos.length; a++)
		{
			if(webServicesAvance[d].departamentoId == departamentos[a].idDepartamento){
				deptoAvance = departamentos[a].nombreDepartamento;				
			}
		} */
		
		for(var e = 0; e < distritos.length; e++)
		{
			if(webServicesAvance[0].departamentoId == distritos[e].departamentoId && webServicesAvance[0].distritoAvance == distritos[e].id){			
				distAvance = distritos[e].descripcion;
			}
		}		
		
		var tableAvance="";
		tableAvance=
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
			'									<table class="table table-hover table-bordered" id="dataTableAvance">'+
			'										<thead>'+
			'											<tr class="active"><th>Justificación</th><th>Cantidad</th><th>FechaEntrega</th><th class="text-center">Administrar</th></tr>'+
			' 										</thead>'+
			'										<tfoot>'+
			'											<tr><th></th><th></th><th></th><th></th></tr>'+
			' 										</tfoot>'+
			'										<tbody>';
			if(webServicesAvance[0].borrado == true)
			{
				<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") ){%>
				tableAvance +=	'<tr><td><del>'+distAvance+'</del></td><td><del>'+webServicesAvance[0].justificacion+'</del></td><td><del>'+numeroConComa(webServicesAvance[0].cantidad)+'</del></td><td><del>'+webServicesAvance[0].fechaEntrega+'</del></td></td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaBorrarAvance" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+' data-toggle="tooltip" data-placement="top" title="Restaurar" ><span class="fa fa-recycle"></span></button></td></tr>';
				<%}%>
			}else{
				<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
				tableAvance +=	'<tr><td>'+distAvance+'</td><td>'+webServicesAvance[0].justificacion+'</td><td>'+numeroConComa(webServicesAvance[0].cantidad)+'</td><td>'+webServicesAvance[0].fechaEntrega+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaEditarAvance" data-toggle="tooltip" data-placement="top" title="Editar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+' ><span class="fa fa-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarAvance" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+' data-toggle="tooltip" data-placement="top" title="Borrar" ><span class="fa fa-trash"></span></button></td></tr>';
				<%} if (attributes.get("role_id_tablero").toString().equals("3")){%>
				tableAvance +=	'<tr><td>'+distAvance+'</td><td>'+webServicesAvance[0].justificacion+'</td><td>'+numeroConComa(webServicesAvance[0].cantidad)+'</td><td>'+webServicesAvance[0].fechaEntrega+'</td><td class="text-center"></td></tr>';
				<%}%>
			}
			
			tableAvance +=	'						</tbody>'+
			'									</table>'+
			'				      			</div>'+							
			
			'               			</div>'+//fin box-body
			'							<div class="modal-footer">'+ 
			'							</div>'+
			'                		</div>';	
			
			
		$("#tableAvance").html("");
		$("#tableAvance").html(tableAvance);
	}		
		
	if ( $("#tableBeneficiario").length )
	{
		
		$("#tableBeneficiario").html("");
		
		var tableBeneficiario="";
		tableBeneficiario=
		'									<div class="box box-default box-solid">'+
		'		                				<div class="box-header with-border">'+
		'		                  					<h3 class="box-title">Lista Destinatarios</h3>'+
		'	                  						<div class="box-tools pull-right">'+
		'				                    			<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
		'		                    					<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>'+
		'		                  					</div>'+
		'              							</div>'+
		'              						<div class="box-body" id="cuerpoTablaBeneficiario">'+	
		'										<div class="table-responsive">'+
		'											<table class="table table-hover table-bordered" id="dataTableBeneficiario">'+
		'												<thead>'+
		'													<tr class="active"><th>Tipo</th><th>Grupo</th><th>Descripción</th><th>Cantidad</th><th class="text-center">Administrar</th></tr>'+
		'												</thead>'+
		'												<tfoot>'+
		'													<tr><th></th><th></th><th></th><th></th><th></th></tr>'+
		'												</tfoot>'+
		'												<tbody id="listaBeneficiario">'+
		'												</tbody>'+
		'											</table>'+
		'				      					</div>'+
		
		'				      				</div>'+
		'				      			</div>';
		$("#tableBeneficiario").html("");
		$("#tableBeneficiario").html(tableBeneficiario); 
	}
	
	if ( $("#tableEvidencia").length )
	{
			
		var tableEvidencia="";
		tableEvidencia=
			'									<div class="box box-default box-solid">'+
			'		                				<div class="box-header with-border">'+
			'		                  					<h3 class="box-title">Lista Evidencia</h3>'+
			'	                  						<div class="box-tools pull-right">'+
			'				                    			<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
			'		                    					<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>'+
			'		                  					</div>'+
			'              							</div>'+
			'              						<div class="box-body" id="cuerpoTablaEvidencia">'+	
			'										<div class="table-responsive">'+
			'											<table class="table table-hover table-bordered" id="dataTableEvidencia">'+
			'												<thead>'+
			'													<tr class="active"><th>Nombre</th><th class="text-center">Administrar</th></tr>'+
			'												</thead>'+
			'												<tfoot>'+
			'													<tr><th></th><th></th></tr>'+
			'												</tfoot>'+
			'												<tbody  id="listaEvidencia">'+
			
			'												</tbody>'+
			'											</table>'+
			'				      					</div>'+
			
			'				      				</div>';
		$("#tableEvidencia").html("");
		$("#tableEvidencia").html(tableEvidencia);
	
	}	
		
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
	if ( $("#modalBorrarBeneficiario").length )
	{
		$("#modalBorrarBeneficiario").remove();
	}
	if ( $("#modalEditarBeneficiario").length )
	{
		$("#modalEditarBeneficiario").remove();
	}	
	
	var insLineaAccion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getInsLineaAccion&insLineaAccionId='+insLineaAccionId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;		
	insLineaAccion=JSON.parse(insLineaAccion);
	
	var institucion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getInstitucion&institucionId='+insLineaAccion[0].institucionId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	institucion = JSON.parse(institucion);
	
	var lineaAccion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getLineaAccion&lineaAccionId='+lineaAccionId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	lineaAccion = JSON.parse(lineaAccion);
	
	var accion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getAccion&accionId='+accionId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	accion = JSON.parse(accion);
	
	var accionCatalogo = $.ajax({
		url:'/tablero/ajaxSelects2?action=getAccionCatalogo&catalogoAccionId='+accion[0].accionCatalogoId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	accionCatalogo = JSON.parse(accionCatalogo);
	
	var actividades = $.ajax({
		url:'/tablero/ajaxSelects2?action=getCronograma&cronogramaId='+actividadId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	actividades = JSON.parse(actividades);
	
	var unidadMedida = $.ajax({
		url:'/tablero/ajaxSelects2?action=getUnidadMedida',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	unidadMedida = JSON.parse(unidadMedida);
	
	var nombreUnidadMedida = "";
	for(var u = 0; u < unidadMedida.length; u++)
	{
		if(unidadMedida[u].id == actividades[0].unidad_medida_id)
		{
			nombreUnidadMedida = unidadMedida[u].descripcion;
		}
	}
	
	var departamentos = $.ajax({
    	url:'/tablero/ajaxSelects?action=getDepartamento',
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
	departamentos = JSON.parse(departamentos);

	var webServicesAvance = $.ajax({
		url:'/tablero/ajaxSelects2?action=getAvance&avanceId='+avanceId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesAvance = JSON.parse(webServicesAvance); 
	
	var deptoAvance = "";		
	for(var a = 0; a < departamentos.length; a++)
	{
		if(webServicesAvance[0].departamentoId == departamentos[a].idDepartamento){
			deptoAvance = departamentos[a].nombreDepartamento;				
		}
	}
	
	for(var e = 0; e < distritos.length; e++)
	{
		if(webServicesAvance[0].departamentoId == distritos[e].departamentoId && webServicesAvance[0].distritoAvance == distritos[e].id){			
			distAvance = distritos[e].descripcion;
		}
	}
	
	/*var optionArchivoExistente="";
	optionArchivoExistente += '<option value="" >Seleccione una Opción</option>';


	for(var p = 0; p < webServicesEvidencia.length; p++){
		optionArchivoExistente += '<option value="'+webServicesEvidencia[p].urlDocumento+'" >'+webServicesEvidencia[p].urlDocumento+'</option>';
	}
	*/
	
	var parametrosEvidencia=insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId;
	var cuerpoEvidencia = renderEvidencia(avanceId,parametrosEvidencia);
	
	var webServicesAvanceCosto = $.ajax({
		url:'/tablero/ajaxSelects2?action=getAvanceCosto&avanceId='+avanceId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesAvanceCosto = JSON.parse(webServicesAvanceCosto);
	
	var webServicesObjetoGasto = $.ajax({
		url:'/tablero/ajaxSelects2?action=getObjetoGasto',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesObjetoGasto = JSON.parse(webServicesObjetoGasto);
	
	var cuerpoAvanceCosto = "";
	for(var d = 0; d < webServicesAvanceCosto.length; d++)
	{
		for(var g = 0; g < webServicesObjetoGasto.length; g++)
		{
			if(webServicesObjetoGasto[g].id == webServicesAvanceCosto[d].objetoGasto){
				if(onoff==true && webServicesAvanceCosto[d].borrado == true){
					// pasa a la siguiente fila en el for ++
				}else{
					if(webServicesAvanceCosto[d].borrado == true)
					{
						<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") ){%>
							cuerpoAvanceCosto += '<tr><td><del>'+webServicesAvanceCosto[d].productoConcat+'</del></td><td><del>'+webServicesAvanceCosto[d].objetoGasto+'</del></td><td><del>'+webServicesObjetoGasto[g].descripcion+'</del></td><td><del>'+numeroConComa(webServicesAvanceCosto[d].monto)+'</del></td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaBorrarCosto" data-toggle="tooltip" data-placement="top" title="Borrar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'-'+webServicesAvanceCosto[d].id+' ><span class="fa fa-recycle"></span></button></td></tr>';
						<%}%>	
					}else{
						<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
							cuerpoAvanceCosto += '<tr><td>'+webServicesAvanceCosto[d].productoConcat+'</td><td>'+webServicesAvanceCosto[d].objetoGasto+'</td><td>'+webServicesObjetoGasto[g].descripcion+'</td><td>'+numeroConComa(webServicesAvanceCosto[d].monto)+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaEditarCosto" data-toggle="tooltip" data-placement="top" title="Editar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'-'+webServicesAvanceCosto[d].id+' ><span class="fa fa-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarCosto" data-toggle="tooltip" data-placement="top" title="Borrar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'-'+webServicesAvanceCosto[d].id+' ><span class="fa fa-trash"></span></button></td></tr>';
						<%} if (attributes.get("role_id_tablero").toString().equals("3")){%>
							cuerpoAvanceCosto += '<tr><td>'+webServicesAvanceCosto[d].productoConcat+'</td><td>'+webServicesAvanceCosto[d].objetoGasto+'</td><td>'+webServicesObjetoGasto[g].descripcion+'</td><td>'+numeroConComa(webServicesAvanceCosto[d].monto)+'</td><td class="text-center"></td></tr>';
						<%}%>
					}	
				}	
			}
		}
	}
		
	var webServicesBeneficiarioTipo = $.ajax({
		url:'/tablero/ajaxSelects2?action=getBeneficiarioTipo',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesBeneficiarioTipo = JSON.parse(webServicesBeneficiarioTipo);
	
	var optionBeneficiarioTipo;
	
	for(var z = 0; z < webServicesBeneficiarioTipo.length; z++){
		optionBeneficiarioTipo+='<option value="'+webServicesBeneficiarioTipo[z].id+'" >'+webServicesBeneficiarioTipo[z].nombre+'</option>';
	}
	
	var webServicesBeneficiario = $.ajax({
		url:'/tablero/ajaxSelects2?action=getBeneficiario&avanceId='+avanceId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesBeneficiario = JSON.parse(webServicesBeneficiario);
	
	var cuerpoBeneficiario = "";
	for(var a = 0; a < webServicesBeneficiario.length; a++)
	{
		var webServicesBeneficiarioTipo = $.ajax({
			url:'/tablero/ajaxSelects2?action=getBeneficiarioTipo&beneficiarioTipoId='+webServicesBeneficiario[a].tipoId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		webServicesBeneficiarioTipo = JSON.parse(webServicesBeneficiarioTipo);
		
		var webServicesBeneficiarioGrupo = $.ajax({
			url:'/tablero/ajaxSelects2?action=getBeneficiarioGrupo&beneficiarioGrupoId='+webServicesBeneficiario[a].grupoId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		webServicesBeneficiarioGrupo = JSON.parse(webServicesBeneficiarioGrupo);
		
		if(onoff==true && webServicesBeneficiario[a].borrado == true){
			// pasa a la siguiente fila en el for ++
		}else{
			if(webServicesBeneficiario[a].borrado == true)
			{
				<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") ){%>
					cuerpoBeneficiario += '<tr><td><del>'+webServicesBeneficiarioTipo[0].nombre+'</del></td><td><del>'+webServicesBeneficiarioGrupo[0].nombre+'</del></td><td><del>'+webServicesBeneficiario[a].descripcion+'</del></td><td><del>'+numeroConComa(webServicesBeneficiario[a].cantidad)+'</del></td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaBorrarBeneficiario" data-toggle="tooltip" data-placement="top" title="Restaurar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'-'+webServicesBeneficiario[a].id+' ><span class="fa fa-recycle"></span></button></td></tr>';
				<%}%>	
			}else{
				<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
					cuerpoBeneficiario += '<tr><td>'+webServicesBeneficiarioTipo[0].nombre+'</td><td>'+webServicesBeneficiarioGrupo[0].nombre+'</td><td>'+webServicesBeneficiario[a].descripcion+'</td><td>'+numeroConComa(webServicesBeneficiario[a].cantidad)+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaEditarBeneficiario" data-toggle="tooltip" data-placement="top" title="Editar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'-'+webServicesBeneficiario[a].id+' ><span class="fa fa-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarBeneficiario" data-toggle="tooltip" data-placement="top" title="Borrar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'-'+webServicesBeneficiario[a].id+' ><span class="fa fa-trash"></span></button></td></tr>';
				<%} if (attributes.get("role_id_tablero").toString().equals("3")){%>
					cuerpoBeneficiario += '<tr><td>'+webServicesBeneficiarioTipo[0].nombre+'</td><td>'+webServicesBeneficiarioGrupo[0].nombre+'</td><td>'+webServicesBeneficiario[a].descripcion+'</td><td>'+numeroConComa(webServicesBeneficiario[a].cantidad)+'</td><td class="text-center"></td></tr>';
				<%}%>
			}	
		}
	}
	
	var webServicesProductoObjetoGasto = $.ajax({
		url:'/tablero/ajaxSelects2?action=getProductoObjetoGasto&accionId='+accionId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesProductoObjetoGasto = JSON.parse(webServicesProductoObjetoGasto);
	
	var optionProductoObjetoGasto;
	
	for(var z = 0; z < webServicesProductoObjetoGasto.length; z++){
		optionProductoObjetoGasto+='<option value="'+webServicesProductoObjetoGasto[z].id+'" >'+webServicesProductoObjetoGasto[z].productoConcat+'</option>';
	}
	
	var contenidoModalAdministrador = "";

	contenidoModalAdministrador +=  '<div class="modal fade" id="modalAdministrador" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
									'	<div class="modal-dialog modal-lg" style="width:90%">'+
									'		<div class="modal-content" >'+
									'			<div class="modal-header">'+
									'		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="agregarAvance" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'>&times;</span></button>'+
									'		        <h4 class="modal-title">Avance ('+actividades[0].nombre+' - '+nombreUnidadMedida+' / '+webServicesAvance[0].fechaEntrega+')  de '+lineaAccion[0].nombre+' ('+institucion[0].sigla+') año '+insLineaAccion[0].periodoId+'</h4>'+ 
									'			</div>'+
									'		    <div class="modal-body">'+
									
									'		      	<div class="row">'+ 
									'		      		<div class="col-md-6" id="tableAvance">'+
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
									'									<table class="table table-hover table-bordered" id="dataTableAvance">'+
									'										<thead>'+
									'											<tr class="active"><th>Departamento</th><th>Distrito</th><th>Justificación</th><th>Cantidad</th><th>FechaEntrega</th><th class="text-center">Administrar</th></tr>'+
									' 										</thead>'+
									'										<tfoot>'+
									'											<tr><th></th><th></th><th></th><th></th><th></th><th></th></tr>'+
									' 										</tfoot>'+
									'										<tbody>';
																				if(webServicesAvance[0].borrado == true)
																				{
																					<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") ){%>
	contenidoModalAdministrador +=	'													<tr><td><del>'+deptoAvance+'</del></td><td><del>'+distAvance+'</del></td><td><del>'+webServicesAvance[0].justificacion+'</del></td><td><del>'+numeroConComa(webServicesAvance[0].cantidad)+'</del></td><td><del>'+webServicesAvance[0].fechaEntrega+'</del></td></td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaBorrarAvance" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+' data-toggle="tooltip" data-placement="top" title="Restaurar" ><span class="fa fa-recycle"></span></button></td></tr>';
																					<%}%>
																				}else{
																					<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
	contenidoModalAdministrador +=	'													<tr><td>'+deptoAvance+'</td><td>'+distAvance+'</td><td>'+webServicesAvance[0].justificacion+'</td><td>'+numeroConComa(webServicesAvance[0].cantidad)+'</td><td>'+webServicesAvance[0].fechaEntrega+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaEditarAvance" data-toggle="tooltip" data-placement="top" title="Editar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+' ><span class="fa fa-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarAvance" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+' data-toggle="tooltip" data-placement="top" title="Borrar" ><span class="fa fa-trash"></span></button></td></tr>';
																					<%} if (attributes.get("role_id_tablero").toString().equals("3")){%>
	contenidoModalAdministrador +=	'													<tr><td>'+deptoAvance+'</td><td>'+distAvance+'</td><td>'+webServicesAvance[0].justificacion+'</td><td>'+numeroConComa(webServicesAvance[0].cantidad)+'</td><td>'+webServicesAvance[0].fechaEntrega+'</td><td class="text-center"></td></tr>';
																					<%}%>
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
									'	                  			<h3 class="box-title">Destinatarios</h3>'+
									'	                  			<div class="box-tools pull-right">'+
									'				                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>'+
									'		                    		</button>'+
									'		                    		<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i>'+
									'		                    		</button>'+
									'		                  		</div>'+
									'              				</div>'+
									'               			<div class="box-body">'+
					
									<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>	

									'		      					<div class="col-md-12">'+
									'		      					<form role="form" id="formularioBeneficiarios">'+
									'									<div class="box box-default box-solid">'+
									'		                				<div class="box-header with-border">'+
									'		                  					<h3 class="box-title">Agregar Destinatarios</h3>'+
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
									'													<tr><td><label for="tipoBeneficiario">Tipo</label><select id="beneficiarioTipo" class="form-control" required>'+optionBeneficiarioTipo+'</select></td><td><label for="grupoBeneficiario">Grupo</label><select id="grupoBeneficiario" class="form-control" required></select></td></tr>'+
									'													<tr><td><label for="cantidadBeneficiario">Cantidad</label><input type="number" id="cantidadBeneficiario" class="form-control" placeholder="Ingrese una Cantidad" required /></td><td><label for="descripcionBeneficiario">Descripción</label><input type="text" id="descripcionBeneficiario" class="form-control" placeholder="Ingrese Objeto una Descripción" /></td></tr>'+
									'													<input type="hidden" id="avanceIdBeneficiario" value="'+avanceId+'"/>'+		
									'			      									</form>	'+				
									'												</tbody>'+
									'											</table>'+
									'				      					</div>'+
									
									'				      				 </div>'+//fin box body
									'									 <div class="modal-footer">'+ 
									'					        			<button type="submit" class="btn btn-success btn-sm guardarBeneficiario" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+' >Guardar Destinatario</button>'+ 
									'									 </div>'+									
									'				      			 	</div>'+
									'				      			 	</form'+
									'				      			</div>'+							

									<% }%>	

									
									'		      					<div class="col-md-12" id="tableBeneficiario">'+
									'									<div class="box box-default box-solid">'+
									'		                				<div class="box-header with-border">'+
									'		                  					<h3 class="box-title">Lista Destinatarios</h3>'+
									'	                  						<div class="box-tools pull-right">'+
									'				                    			<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
									'		                    					<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>'+
									'		                  					</div>'+
									'              							</div>'+
									'              						<div class="box-body" id="cuerpoTablaBeneficiario">'+	
									'										<div class="table-responsive">'+
									'											<table class="table table-hover table-bordered" id="dataTableBeneficiario">'+
									'												<thead>'+
									'													<tr class="active"><th>Tipo</th><th>Grupo</th><th>Descripción</th><th>Cantidad</th><th class="text-center">Administrar</th></tr>'+
									'												</thead>'+
									'												<tfoot>'+
									'													<tr><th></th><th></th><th></th><th></th><th></th></tr>'+
									'												</tfoot>'+
									'												<tbody id="listaBeneficiario">'+
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
					
									<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>	

									'		      					<div class="col-md-12">'+
									'			      									<form class="form-horizontal" role="form" id="formularioCosto">'+
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
									'													<tr><td><label for="productoObjetoGasto">Producto</label><select id="productoObjetoGasto" class="form-control">'+optionProductoObjetoGasto+'</select></td>'+
									'														<td><label for="objetoGastoCosto">Objeto Gasto</label><select id="objetoGastoCosto" class="form-control" required></select></td>'+
									'													</tr>'+	
									'													<tr><td colspan="2"><label for="codigoContratacionalCosto">Cod. Contratación</label><input type="text" id="codigoContratacionalCosto" class="form-control" placeholder="Ingrese Codigo Contratación" /></td></tr>'+									
									'													<tr><td colspan="2"><label for="montoCosto">Monto</label><input type="number" id="montoCosto" class="form-control" placeholder="Ingrese Monto" required /></td></tr>'+
									'													<input type="hidden" id="avanceIdCosto" value="'+avanceId+'"/>'+	
									'			      									</form>	'+												
									'												</tbody>'+
									'											</table>'+
									'				      					</div>'+
									
									'				      				 </div>'+//fin box body
									'									 <div class="modal-footer">'+ 
									'					        			<button type="submit" class="btn btn-success btn-sm guardarCosto" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'>Guardar Costo</button>'+ 
									'									 </div>'+									
									'				      			 	</div>'+
									'				      			 	</form>'+
									'				      			</div>'+							

									<% }%>	


									'		      					<div class="col-md-12" id="tableCosto">'+
									'									<div class="box box-default box-solid">'+
									'		                				<div class="box-header with-border">'+
									'		                  					<h3 class="box-title">Lista Costos</h3>'+
									'	                  						<div class="box-tools pull-right">'+
									'				                    			<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
									'		                    					<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>'+
									'		                  					</div>'+
									'              							</div>'+
									'              						<div class="box-body" id="cuerpoTablaCosto">'+	
									'										<div class="table-responsive">'+
									'											<table class="table table-hover table-bordered" id="dataTableAvanceCosto">'+
									'												<thead>'+
									'													<tr class="active"><th>Producto</th><th>ObjetoGasto</th><th>Descripción</th><th>Monto</th><th class="text-center">Administrar</th></tr>'+
									'												</thead>'+
									'												<tfoot>'+
									'													<tr><th></th><th></th><th></th><th></th><th></th></tr>'+
									'												</tfoot>'+
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
									
									<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>	

									'		      					<div class="col-md-12">'+
									'								 <form id="formEvidencia" class="form-horizontal" role="form">'+
									'									<div class="box box-default box-solid">'+
									'		                				<div class="box-header with-border">'+
									'		                  					<h3 class="box-title">Agregar Evidencia</h3>'+
									'	                  						<div class="box-tools pull-right">'+
									'				                    			<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
									'		                    					<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>'+
									'		                  					</div>'+
									'              							</div>'+
									'              						<div class="box-body">'+
									
									'									<div class="table-responsive">'+
									'										<table class="table table-hover">'+
									'											<tbody>'+									
									'													<tr><td><label for="nombreEvidencia">Nombre</label><input type="text" id="nombreEvidencia" class="form-control" placeholder="Ingrese Nombre" required /></td><td><label for="urlEvidencia">Url</label><input type="url" id="urlEvidencia" class="form-control" pattern="https?://.+" placeholder="Ingrese Url" /></td></tr>'+
									'													<tr><td colspan="2"><label for="descripcionEvidencia">Descripción</label><input type="text" id="descripcionEvidencia" class="form-control" placeholder="Ingrese Descripción" /></td></tr>'+																		
        							'														<div  class="bar" style="width: 0%;"></div></div></td></tr>'+
        							'													<tr><td colspan="2"><label>Ingresar localización de la evidencia:</label></td></tr>'+
        							/* '													<tr><td><label for="latLongEvidencia">Latitud , Longitud: </label>'+
        							'															<input id="geoloc" class="form-control" type="text" value="" size="20" /></td></tr>'+ */	
        							'													<tr><td><label for="latEvidencia">Latitud: </label>'+
        							'															<input id="geolat" class="form-control" type="numeric" value="" size="20" /></td>'+
        							'														<td><label for="longEvidencia">Longitud: </label>'+
        							'															<input id="geolng" class="form-control" type="numeric" value="" size="20" /></td></tr>'+
        							'													<tr><td><label for="documentoEvidencia">Adjuntar Documento</label><input type="file" id="documentoEvidencia" name="documentoEvidencia" /><div id="progress" class="progress">'+
        							'													<input type="hidden" id="wsIdEvidencia" value="1" /><input type="hidden" id="versionEvidencia" value="3"/><input type="hidden" id="avanceIdEvidencia" value="'+avanceId+'"/>'+
									'													<input type="hidden" id="urlDocEvidencia" value="" />'+																						
									'											</tbody>'+
									'										</table>'+
									'			      					</div>'+
									
									'				      				 </div>'+//fin box body
									'									 <div class="modal-footer">'+ 
									'					        			<button type="submit" class="btn btn-success btn-sm guardarEvidencia" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'>Guardar Evidencia</button>'+ 
									/*'									 	<input type="submit" id="submitEvidencia" class="btn btn-success btn-sm" form="formEvidencia" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+' value="Guardar Evidencia">'+*/ 
									'									 </div>'+									
									'				      			 	</div>'+
									'									 </form>	'+
									'				      			</div>'+							
									<% }%>	


									'		      					<div class="col-md-12" id="tableEvidencia">'+
									'									<div class="box box-default box-solid">'+
									'		                				<div class="box-header with-border">'+
									'		                  					<h3 class="box-title">Lista Evidencia</h3>'+
									'	                  						<div class="box-tools pull-right">'+
									'				                    			<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
									'		                    					<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>'+
									'		                  					</div>'+
									'              							</div>'+
									'              						<div class="box-body" id="cuerpoTablaEvidencia">'+	
									'										<div class="table-responsive">'+
									'											<table class="table table-hover table-bordered" id="dataTableEvidencia">'+
									'												<thead>'+
									'													<tr class="active"><th>Nombre</th><th class="text-center">Administrar</th></tr>'+
									'												</thead>'+
									'												<tfoot>'+
									'													<tr><th></th><th></th></tr>'+
									'												</tfoot>'+
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
	$("#listaBeneficiario").html("");
	$("#listaBeneficiario").html(cuerpoBeneficiario);
	$("#modalAdministrador").modal('show');	
	$("#beneficiarioTipo").change();
	$("#productoObjetoGasto").change();
	//$("#dataTableEvidencia").DataTable();
	$('#dataTableEvidencia').dataTable({ 
        dom: 'Bfrtip',
        buttons: [
                  {
                      extend: 'copy',
                      exportOptions: {
                  columns: [ 0 ]
              }
                  },
                  {
                      extend: 'csv',
                      exportOptions: {
                  columns: [ 0 ]
              }
                  },
                  {
                      extend: 'excel',
                      exportOptions: {
                  columns: [ 0 ]
              }
                  },
                  {
                      extend: 'pdf',
                      exportOptions: {
                  columns: [ 0 ]
              }
                  },
                  {
                      extend: 'print',
                      exportOptions: {
                  columns: [ 0 ]
              }
                  }
              ]
	});
	//$("#dataTableAvanceCosto").DataTable();
	$('#dataTableAvanceCosto').dataTable({
        "footerCallback": function ( row, data, start, end, display ) {
            var api = this.api(), data;
 
         // saca los puntos y <del> de la cadena para pasarlo a entero
            var intVal = function(i){
            	if(typeof i==='string'){	
            		i=i.replace(/[\."<\/*del>""Gs\."]/g, '');
            		i=i.replace(/[","]/g, '.');
            		i=i*1;		            		
            	}else{
            		if(typeof i==='number'){
            			i=i;		            			
            	}else{
            		i=0;
            	}
            }
            	return i;
            };
 
         // total general para todas las paginas de la columna
            total2 = api
                .column( 3 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
         // total por pagina segun número de columna
            pageTotal2 = api
                .column( 3, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
         
         // se muestran los valores de los totales en el footer del table
            $( api.column( 3 ).footer() ).html(
            		'Total Pág. '+ numeroConComa(pageTotal2) +' (Total Gral. '+ numeroConComa(total2) +')'
            );	         
        },
        dom: 'Bfrtip',
        buttons: [
                  {
                      extend: 'copy',
                      exportOptions: {
                  columns: [ 0, 1, 2 ]
              }
                  },
                  {
                      extend: 'csv',
                      exportOptions: {
                  columns: [ 0, 1, 2 ]
              }
                  },
                  {
                      extend: 'excel',
                      exportOptions: {
                  columns: [ 0, 1, 2 ]
              }
                  },
                  {
                      extend: 'pdf',
                      exportOptions: {
                  columns: [ 0, 1, 2 ]
              }
                  },
                  {
                      extend: 'print',
                      exportOptions: {
                  columns: [ 0, 1, 2 ]
              }
                  }
              ]
	}); 
	//$("#dataTableBeneficiario").DataTable();
	$('#dataTableBeneficiario').dataTable({
        "footerCallback": function ( row, data, start, end, display ) {
            var api = this.api(), data;
 
         // saca los puntos y <del> de la cadena para pasarlo a entero
            var intVal = function(i){
            	if(typeof i==='string'){	
            		i=i.replace(/[\."<\/*del>""Gs\."]/g, '');
            		i=i.replace(/[","]/g, '.');
            		i=i*1;		            		
            	}else{
            		if(typeof i==='number'){
            			i=i;		            			
            	}else{
            		i=0;
            	}
            }
            	return i;
            };
 
         // total general para todas las paginas de la columna
            total3 = api
                .column( 3 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
         // total por pagina segun número de columna
            pageTotal3 = api
                .column( 3, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
         
         // se muestran los valores de los totales en el footer del table
            $( api.column( 3 ).footer() ).html(
            		'Total Pág. '+ numeroConComa(pageTotal3) +' (Total Gral. '+ numeroConComa(total3) +')'
            );	         
        },
        dom: 'Bfrtip',
        buttons: [
                  {
                      extend: 'copy',
                      exportOptions: {
                  columns: [ 0, 1, 2, 3 ]
              }
                  },
                  {
                      extend: 'csv',
                      exportOptions: {
                  columns: [ 0, 1, 2, 3 ]
              }
                  },
                  {
                      extend: 'excel',
                      exportOptions: {
                  columns: [ 0, 1, 2, 3 ]
              }
                  },
                  {
                      extend: 'pdf',
                      exportOptions: {
                  columns: [ 0, 1, 2, 3 ]
              }
                  },
                  {
                      extend: 'print',
                      exportOptions: {
                  columns: [ 0, 1, 2, 3 ]
              }
                  }
              ]
	}); 
	
	//$("#dataTableAvance").DataTable();
	$('#dataTableAvance').dataTable({
        "footerCallback": function ( row, data, start, end, display ) {
            var api = this.api(), data;
 
         // saca los puntos y <del> de la cadena para pasarlo a entero
            var intVal = function(i){
            	if(typeof i==='string'){	
            		i=i.replace(/[\."<\/*del>""Gs\."]/g, '');
            		i=i.replace(/[","]/g, '.');
            		i=i*1;		            		
            	}else{
            		if(typeof i==='number'){
            			i=i;		            			
            	}else{
            		i=0;
            	}
            }
            	return i;
            };
 
         // total general para todas las paginas de la columna
            total1 = api
                .column( 3 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
         // total por pagina segun número de columna
            pageTotal1 = api
                .column( 3, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
         
         // se muestran los valores de los totales en el footer del table
            $( api.column( 3 ).footer() ).html(
            		'Total Pág. '+ numeroConComa(pageTotal1) +' (Total Gral. '+ numeroConComa(total1) +')'
            );	         
        },
        dom: 'Bfrtip',
        buttons: [
                  {
                      extend: 'copy',
                      exportOptions: {
                  columns: [ 0, 1, 2 ]
              }
                  },
                  {
                      extend: 'csv',
                      exportOptions: {
                  columns: [ 0, 1, 2 ]
              }
                  },
                  {
                      extend: 'excel',
                      exportOptions: {
                  columns: [ 0, 1, 2 ]
              }
                  },
                  {
                      extend: 'pdf',
                      exportOptions: {
                  columns: [ 0, 1, 2 ]
              }
                  },
                  {
                      extend: 'print',
                      exportOptions: {
                  columns: [ 0, 1, 2 ]
              }
                  }
              ]
}); 

	
}


$("body").on("click", ".agregarModalAdministrador",function(event){
	
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
	
	renderAdministrarAvance(insLineaAccionId,lineaAccionId,institucionId,periodoId,accionId,actividadId,avanceId);
});	

/* $(document).ready(function(){
	$('#geoloc').leafletLocationPicker({
		locationSep: ' - '
		}).on('changeLocation', function(e) {
			if (e.latlng.lat != null) $('#geolat').val( e.latlng.lat );
			if (e.latlng.lng != null) $('#geolng').val( e.latlng.lng );	
	});
}); */

$("body").on("change", "#productoObjetoGasto",function(event){
	//var departamentoId = $(this).attr("parametro");
	var productoObjetoGastoId = $("#productoObjetoGasto option:selected").val();
	var anho=$("#periodoSeleccion option:selected").val();
	var version=$("#versionSeleccion option:selected").val();
	var optionObjetoGastoCosto="";
	var objetoGasto=[];
	if (productoObjetoGastoId != undefined){
		var webServicesDatosProducto = $.ajax({
			url:'/tablero/ajaxSelects2?action=getProductoObjetoGasto&productoObjetoGastoId='+productoObjetoGastoId,
		  	type:'get',
		  	dataType:'json',
		  	async:false,
		  	error: function(data,status,er)
	        {
	        alert(data + ' - ' + status  + ' - ' + er );
	        }
		}).responseText;
		webServicesDatosProducto = JSON.parse(webServicesDatosProducto);
				
    	$.ajax({
	    	url:'http://spr.stp.gov.py/ajaxSelects?accion=getAsignacionPresiVersion&anho='+anho+'&nivel='+webServicesDatosProducto[0].nivelId+'&entidad='+webServicesDatosProducto[0].entidadId+'&versionReporte='+version,
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
			for(var z = 0; z < datos.length; z++)
			{
				if (webServicesDatosProducto[0].nivelId == datos[z].nivel && webServicesDatosProducto[0].entidadId == datos[z].entidad 
						&& webServicesDatosProducto[0].programaId == datos[z].programa && webServicesDatosProducto[0].subprogramaId == datos[z].subPrograma 
						&& webServicesDatosProducto[0].proyectoId == datos[z].proyecto && webServicesDatosProducto[0].productoId == datos[z].producto){					
					objetoGasto.push(datos[z].objetoGasto);
    			}			
			//$("#totalFinanciero-formulario").val(numeroConComa(totalFinanciero));			
    		}	
			
			var uniqueOG = [];
		    $.each(objetoGasto, function(i, el){
		        if($.inArray(el, uniqueOG) === -1) uniqueOG.push(el);
		    });
		    
		    for(var x = 0; x < uniqueOG.length; x++){
		    	optionObjetoGastoCosto+='<option value="'+uniqueOG[x]+'" >'+uniqueOG[x]+'</option>';
		    }
		    
    		$("#objetoGastoCosto").html("");
    		$("#objetoGastoCosto").append(optionObjetoGastoCosto);
		
		/* var webServicesObjetoGastoCosto = $.ajax({
			url:'/tablero/ajaxSelects?action=getObjetoGastoCosto&nivel='+webServicesDatosProducto[0].nivelId+'&entidad='+webServicesDatosProducto[0].entidadId+'&tiprograma='+webServicesDatosProducto[0].tiprogramaId+'&programa='+webServicesDatosProducto[0].programaId+'&subprograma='+webServicesDatosProducto[0].subprogramaId+'&proyecto='+webServicesDatosProducto[0].proyectoId+'&producto='+webServicesDatosProducto[0].productoId+'&anho=2017',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		webServicesObjetoGastoCosto = JSON.parse(webServicesObjetoGastoCosto);
		
		var optionObjetoGastoCosto="";
		
		for(var o = 0; o < webServicesObjetoGastoCosto.producto.length; o++){
			optionObjetoGastoCosto+='<option value="'+webServicesObjetoGastoCosto.producto[o].codigoObjetoGasto+'" >'+webServicesObjetoGastoCosto.producto[o].codigoObjetoGasto+'</option>';
		} */
		
		//$("#objetoGastoCosto").html("");
		//$("#objetoGastoCosto").append(optionObjetoGastoCosto);
		}
	}
	
	//$("#objetoGastoCosto").html("");
	//$("#objetoGastoCosto").append(optionObjetoGastoCosto);
	
});


$("body").on("change", "#beneficiarioTipo",function(event){
	//var departamentoId = $(this).attr("parametro");
		
	var beneficiarioTipoId = $("#beneficiarioTipo option:selected").val();
	
	if(beneficiarioTipoId !== undefined){
		var webServicesBeneficiarioGrupo = $.ajax({
			url:'/tablero/ajaxSelects2?action=getBeneficiarioGrupo&beneficiarioTipoId='+beneficiarioTipoId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		webServicesBeneficiarioGrupo = JSON.parse(webServicesBeneficiarioGrupo);
		
		var optionBeneficiarioGrupo="";
		
		for(var o = 0; o < webServicesBeneficiarioGrupo.length; o++){
			optionBeneficiarioGrupo+='<option value="'+webServicesBeneficiarioGrupo[o].id+'" >'+webServicesBeneficiarioGrupo[o].nombre+'</option>';
		}
		
		$("#grupoBeneficiario").html("");
		$("#grupoBeneficiario").append(optionBeneficiarioGrupo);
	}
});

$("body").on("change", "#departamentoAvance",function(event){
	//var departamentoId = $(this).attr("parametro");
		
	var departamentoAvanceId = $("#departamentoAvance option:selected").val();
	
	if(departamentoAvanceId !== undefined){
		var webServiceDistritos = $.ajax({
			url:'/tablero/ajaxSelects?action=getDistrito&departamento='+departamentoAvanceId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		webServiceDistritos = JSON.parse(webServiceDistritos);
		
		var optionDistritos="";
		
		for(var o = 0; o < webServiceDistritos.length; o++){
			optionDistritos+='<option value="'+webServiceDistritos[o].id+'" >'+webServiceDistritos[o].descripcion+'</option>';
		}
		
		$("#distritoAvance").html("");
		$("#distritoAvance").append(optionDistritos);
	}
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

    var f = new Date();
    if( (f.getMonth() +1) < 10 ){
    	var mes =( 0 +""+ (f.getMonth() +1));
    }else{
    	var mes =f.getMonth()+1;
    }
    
    if( (f.getDate()) < 10 ){
    	var dia =( 0 +""+ (f.getDate()));
    }else{
    	var dia = f.getDate();
    }
    var fechaActual = (f.getFullYear() + "-" + mes + "-" + dia);
    
  	if ( $("#modalAdministrador").length )
   	{
		$("#modalAdministrador").remove();
   	}
  	
  	var webServicesAvance = $.ajax({
   		url:'/tablero/ajaxSelects2?action=getAvance&avanceId='+avanceId,
   	  	type:'get',
   	  	dataType:'json',
   	  	async:false       
   	}).responseText;
   	webServicesAvance = JSON.parse(webServicesAvance); 
  	
  	var departamentos = $.ajax({
    	url:'/tablero/ajaxSelects?action=getDepartamento',
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
	departamentos = JSON.parse(departamentos);
	
	var optionDepartamentos = "";
  	for(var d = 0; d < departamentos.length; d++)
	{
		if(webServicesAvance[0].departamentoId == departamentos[d].idDepartamento){
			nombreDepartamento = departamentos[d].nombreDepartamento;
			optionDepartamentos+='<option value="'+departamentos[d].idDepartamento+'" selected >'+departamentos[d].nombreDepartamento+'</option>';
		}else {
			optionDepartamentos+='<option value="'+departamentos[d].idDepartamento+'" >'+departamentos[d].nombreDepartamento+'</option>';	
		}
	}  	
  	
  	var distritos = $.ajax({
    	url:'/tablero/ajaxSelects?action=getDistrito&departamento='+webServicesAvance[0].departamentoId,
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
	distritos = JSON.parse(distritos);
	
	var optionDistritos="";
	for(k = 0;k<distritos.length; k++){
		if(webServicesAvance[0].distritoAvance == distritos[k].id){
			optionDistritos+='<option value="'+distritos[k].id+'" selected >'+distritos[k].descripcion+'</option>';
		} else {
			optionDistritos+='<option value="'+distritos[k].id+'">'+distritos[k].descripcion+'</option>';
		}
	}   	

   	var contenido = "";

   	contenido +=		'<div class="modal fade" id="modalEditarCosto"  data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
   						'	<form role="form" id="formularioAvance">'+
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

						'			      			<form class="form-horizontal">'+

						'							<tr><td><label for="departamentoAvance">Departamento</label><select class="form-control" id="departamentoAvance" >'+optionDepartamentos+'</select></div></td>'+

						'								<td><label for="distritoAvance">Distrito</label><select class="form-control" id="distritoAvance">'+optionDistritos+'</select></div></td></tr>'+
						
						'							<tr><td><label for="justificacionAvance">Justificación</label><input type="text" id="justificacionAvance" value="'+webServicesAvance[0].justificacion+'" class="form-control" required /></td><td><label for="cantidadAvance">Cantidad</label><input type="number" id="cantidadAvance" step="any" class="form-control" value='+webServicesAvance[0].cantidad+' required/></td></tr>'+

						'							<tr><td><label for="fechaEntregaAvance">Fecha Entrega</label><input  id="fechaEntregaAvance" value='+webServicesAvance[0].fechaEntrega+' class="form-control" required /></td></tr>'+														

						'							<input type="hidden" id="versionAvance" value="3" /><input type="hidden" id="actividadIdAvance" value='+avanceId+' />'+		

						'			      			</form>	'+												

						'						</tbody>'+

						'					</table>'+
						'				 </div>'+	

   						

   						'		    </div>'+

   						'			<div class="modal-footer">'+

   						' 				<button type="submit" class="btn btn-success btn-sm editarAvance" id="botonGuardarAvance" parametros='+avanceId+'>Guardar Cambios</button>'+
   						'				<button type="button" class="btn btn-success agregarModalAdministrador" data-dismiss="modal" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'>Cerrar</button>'+	

   						'			</div>'+

   						'		</div>'+ 

   						'	</div>'+
   						'	</form>'+
   						'</div>';

   						

   	$("body").append(contenido);

   	$('#modalEditarCosto').modal('show');
   	$('#fechaEntregaAvance').datepicker({  
		language: "es",
		format: 'yyyy-mm-dd',
		endDate: "0d",
		todayBtn: "linked",
	    todayHighlight: true});
 });
 
$("body").on("click", ".editarAvance",function(event){	
	if(validarFormulario("formularioAvance",false,false)==true){
		event.stopPropagation();
		event.preventDefault(); 

		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-"); 
	    var avanceId = idParsed[0];
	    
		var justificacion = $("#justificacionAvance").val();
		var cantidad = $("#cantidadAvance").val();
		var fechaEntrega = $("#fechaEntregaAvance").val();
		//var cantidadBeneficiarios = $("#cantidadBeneficiariosAvance").val();
		var distritoAvance = $("#distritoAvance option:selected").val();
		var departamentoId = $("#departamentoAvance option:selected").val();					
		
	
		//Vaciar los inputs
		$("#justificacionAvance").val("");
		$("#cantidadAvance").val("");
		$("#fechaEntregaAvance").val("");
		$("#distritoAvance").val("");
		$("#departamentoAvance").val("");
		//$("#cantidadBeneficiariosAvance").val("");
	    
	   	var webServicesAvance = $.ajax({
	   		url:'/tablero/ajaxSelects2?action=getAvance&avanceId='+avanceId,
	   	  	type:'get',
	   	  	dataType:'json',
	   	  	async:false       
	   	}).responseText;
	   	webServicesAvance = JSON.parse(webServicesAvance); 
	    
		var objeto = new Object();
		
		objeto.justificacion = justificacion;
		objeto.cantidad = cantidad;
		objeto.fechaEntrega = fechaEntrega;
		//objeto.cantidadBeneficiarios = cantidadBeneficiarios;
		objeto.actividadId = webServicesAvance[0].actividadId;
		objeto.distritoAvance = distritoAvance;
		objeto.departamentoId = departamentoId;
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
	}
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
   		url:'/tablero/ajaxSelects2?action=getAvance&avanceId='+avanceId,
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
   		url:'/tablero/ajaxSelects2?action=getAvance&avanceId='+avanceId,
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
	if(validarFormulario("formularioCosto",false,false)==true){
		event.stopPropagation();
		event.preventDefault(); 
	
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
	
	var monto = $("#montoCosto").val();
	var codigoContratacion = $("#codigoContratacionalCosto").val();
	var objetoGasto = $("#objetoGastoCosto").val();
	var avanceId = $("#avanceIdCosto").val();
	var productoConcat = $("#productoObjetoGasto option:selected").text();

	//Vaciar los inputs
	$("#codigoContratacionalCosto").val("");
	$("#objetoGastoCosto").val("");
	$("#montoCosto").val("");
	$("#productoObjetoGasto").val("");
	
	var objeto = new Object();
	
	objeto.monto = monto;
	objeto.codigoContratacion = codigoContratacion;
	objeto.objetoGasto = objetoGasto;
	objeto.avanceId = avanceId;
	objeto.productoConcat = productoConcat;

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
        		
				renderAdministrarAvance(insLineaAccionId,lineaAccionId,institucionId,periodoId,accionId,actividadId,avanceId);
				
        		<%-- var webServicesAvanceCosto = $.ajax({
        			url:'/tablero/ajaxSelects2?action=getAvanceCosto&avanceId='+avanceId,
        		  	type:'get',
        		  	dataType:'json',
        		  	async:false       
        		}).responseText;
        		webServicesAvanceCosto = JSON.parse(webServicesAvanceCosto);
        		
        		var cuerpoAvanceCosto = "";
        		for(var d = 0; d < webServicesAvanceCosto.length; d++)
        		{
        			if(onoff==true && webServicesAvanceCosto[d].borrado == true){
        				//	
        			}else{
            			if(webServicesAvanceCosto[d].borrado == true)
            			{
            				<% if (attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("0")){%>
            					cuerpoAvanceCosto += '<tr><td><del>'+webServicesAvanceCosto[d].productoConcat+'</del></td><td><del>'+webServicesAvanceCosto[d].objetoGasto+'</del></td><td><del>'+numeroConComa(webServicesAvanceCosto[d].monto)+'</del></td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaBorrarCosto" data-toggle="tooltip" data-placement="top" title="Restaurar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'-'+webServicesAvanceCosto[d].id+' ><span class="fa fa-recycle"></span></button></td></tr>';
            				<% }%>
            			}else{
            				<% if (attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("2")){%>
            					cuerpoAvanceCosto += '<tr><td>'+webServicesAvanceCosto[d].productoConcat+'</td><td>'+webServicesAvanceCosto[d].objetoGasto+'</td><td>'+numeroConComa(webServicesAvanceCosto[d].monto)+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaEditarCosto" data-toggle="tooltip" data-placement="top" title="Editar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'-'+webServicesAvanceCosto[d].id+' ><span class="fa fa-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarCosto" data-toggle="tooltip" data-placement="top" title="Borrar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'-'+webServicesAvanceCosto[d].id+' ><span class="fa fa-trash"></span></button></td></tr>';
                			<% }else{%>
        						cuerpoAvanceCosto += '<tr><td>'+webServicesAvanceCosto[d].productoConcat+'</td><td>'+webServicesAvanceCosto[d].objetoGasto+'</td><td>'+numeroConComa(webServicesAvanceCosto[d].monto)+'</td><td class="text-center"></td></tr>';
            				<%}%>

            			}        				
        			}	
        		}
        		
        		var contenidoTabla;
        		 
        		contenidoTabla = '<div class="table-responsive">'+
				'				 	<table class="table table-hover table-bordered" id="dataTableAvanceCosto">'+
				'						<thead>'+
				'							<tr class="active"><th>Producto</th><th>ObjetoGasto</th><th>Monto</th><th class="text-center">Administrar</th></tr>'+
				'						</thead>'+
				'						<tbody id="listaCosto">'+
				'						</tbody>'+
				'					</table>'+
				'				 </div>';
        		
        		$("#cuerpoTablaCosto").html("");
        		$("#cuerpoTablaCosto").html(contenidoTabla);
        		$("#listaCosto").html("");
        		$("#listaCosto").html(cuerpoAvanceCosto);
        		$("#dataTableAvanceCosto").DataTable(); --%>
        		
        	}else{
  		
        	}
        	
        	},
        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
        error: function(data,status,er) {
        	
        	}
	 });
	}
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
		url:'/tablero/ajaxSelects2?action=getAvanceCosto&costoId='+costoId,
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
		url:'/tablero/ajaxSelects2?action=getAvanceCosto&costoId='+costoId,
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
		url:'/tablero/ajaxSelects2?action=getAvanceCosto&costoId='+costoId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesAvanceCosto = JSON.parse(webServicesAvanceCosto);
	
	var contenido = "";

	contenido +=		'<div class="modal fade" id="modalEditarCosto"  data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
						'	<form role="form" id="formularioCosto">'+
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
						'									<tr><td><label for="ProductoObjetoGasto">Producto Objeto Gasto</label><input type="text" id="ProductoObjetoGasto" class="form-control" value='+webServicesAvanceCosto[0].productoConcat+' disabled="disabled" /></td><td><label for="objetoGastoCosto">Objeto Gasto</label><input type="number" id="objetoGastoCosto" class="form-control" value='+webServicesAvanceCosto[0].objetoGasto+' disabled="disabled" /></td></tr>'+
						'									<tr><td><label for="codigoContratacionalCosto">Cod. Contrato</label><input type="text" id="codigoContratacionalCosto" class="form-control" value='+webServicesAvanceCosto[0].codigoContratacion+' /></td><td colspan="2"><label for="montoCosto">Monto</label><input type="number" id="montoCosto" class="form-control" value='+webServicesAvanceCosto[0].monto+' required/></td></tr>'+									
						'									<input type="hidden" id="avanceIdCosto" value="'+webServicesAvanceCosto[0].avanceId+'"/>'+		
						'								</form>	'+												
						'  							</tbody>'+
						'						</table>'+
						'					</div>'+
						

						'		    </div>'+
						'			<div class="modal-footer">'+
						' 				<button type="submit" class="btn btn-success btn-sm editarAvanceCosto" id="botonGuardarAvanceCosto" parametros='+costoId+'>Guardar Cambios</button>'+
						'			</div>'+
						'		</div>'+ 
						'	</div>'+
						'	</form>'+
						'</div>';
						
	$("body").append(contenido);
	$('#modalEditarCosto').modal('show');

});


$("body").on("click", ".editarAvanceCosto",function(event){
	if(validarFormulario("formularioCosto",false,false)==true){
		event.stopPropagation();
		event.preventDefault(); 
		
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");                                                            
	
	//Las siguentes variables se utiliza en esta funcion para redibujar el modal anterior
	var costoId = idParsed[0];
	
	var webServicesAvanceCosto = $.ajax({
		url:'/tablero/ajaxSelects2?action=getAvanceCosto&costoId='+costoId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesAvanceCosto = JSON.parse(webServicesAvanceCosto);
	
	var monto = $("#montoCosto").val();
	var codigoContratacion = $("#codigoContratacionalCosto").val();
	var objetoGasto = $("#objetoGastoCosto").val();
	var avanceId = $("#avanceIdCosto").val();
	var productoConcat = $("#productoObjetoGasto option:selected").text();
	
    var objeto = new Object();
    objeto.id = costoId;
    objeto.monto = monto; 
    objeto.codigoContratacion = codigoContratacion;
    objeto.objetoGasto = objetoGasto;
    objeto.avanceId = avanceId;
    objeto.productoConcat = productoConcat;
    
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
	} 
});


 $("body").on("click", ".guardarEvidencia",function(event){
	/* event.preventDefault(); //evita que realice el submit */
	/* event.preventDefault();
	
	/* if (!$('#formEvidencia')[1].checkValidity()){
		alert("Favor introduzca una dirección url valida. Ej: http://www.google.com");
		return false;
	} */
	if(validarFormulario("formEvidencia",false,false)==true){
		event.stopPropagation();
		event.preventDefault(); 

		
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
	
	var docEvidenciaFile = document.getElementById("documentoEvidencia").files[0];
    
	if (docEvidenciaFile != null){
	    var formdata = new FormData();
	    formdata.append('documentoEvidencia', docEvidenciaFile);
	    
	     $.ajax({
		         type: "POST",
		         url: "/tablero/UploadServlet", /* contextPath + servletPath, */
		         data: formdata, /* + $('#custIdList').val(), */
		         async: false,
		         processData: false,  // tell jQuery not to process the data
		         contentType: false,   // tell jQuery not to set contentType
		         success: function(data){
		               $("#urlDocEvidencia").val(data);
		           }
		     });
	}

	var nombre = $("#nombreEvidencia").val();
	var url = $("#urlEvidencia").val();
	var urlDocumento; 
		if (docEvidenciaFile != undefined) urlDocumento = $("#urlDocEvidencia").val();
	var descripcion = $("#descripcionEvidencia").val();
	var latitud = $("#geolat").val();
	var longitud = $("#geolng").val();
	var wsId = $("#wsIdEvidencia").val();
	var version = $("#versionEvidencia").val();
  
	//var avanceId = $("#avanceIdEvidencia").val(); No utilizo esta variable xq ya viene en el parse pero lo ideal seria obtener del formulario

	//Vaciar los inputs
	$("#nombreEvidencia").val("");
	$("#urlEvidencia").val("");
	$("#urlDocEvidencia").val("");	
	$("#descripcionEvidencia").val("");
	$("#geolat").val("");
	$("#geolng").val("");
	$("#documentoEvidencia").val("");

	
	var objeto = new Object();
	
	objeto.nombre = nombre;
	objeto.url = url;
	objeto.urlDocumento = urlDocumento;	
	objeto.descripcion = descripcion;
	if (latitud != "") objeto.latitud = latitud; else objeto.latitud = 0.0;// 0.0 por defecto porque es Double
	if (longitud != "") objeto.longitud = longitud; else objeto.longitud = 0.0;// 0.0 por defecto porque es Double
	objeto.wsId = wsId;
	objeto.version = version;
	objeto.avanceId = avanceId;
	//objeto.documentoEvidencia = documentoEvidencia;
	
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
        		renderAdministrarAvance(insLineaAccionId,lineaAccionId,institucionId,periodoId,accionId,actividadId,avanceId);
        		/* var parametrosEvidencia=insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId;
        		var cuerpoEvidencia=renderEvidencia(avanceId, parametrosEvidencia);
        		
        		var contenidoTabla;
        		
        		contenidoTabla = '<div class="table-responsive">'+
        		'				 	<table class="table table-hover table-bordered" id="cuerpoEvidencia">'+
        		'						<thead>'+
        		'							<tr class="active"><th>Nombre</th><th class="text-center">Administrar</th></tr>'+
        		'						</thead>'+
        		'						<tbody  id="listaEvidencia">'+
        		
        		'						</tbody>'+
        		'					</table>'+
        		'				 </div>';
        		
        		$("#cuerpoTablaEvidencia").html("");
        		$("#cuerpoTablaEvidencia").html(contenidoTabla);
        		$("#listaEvidencia").html("");
        		$("#listaEvidencia").html(cuerpoEvidencia);
        		$("#dataTableEvidencia").DataTable(); */
        		
        	}else{
  		
        	}
        	
        	},
        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
        error: function(data,status,er) {
        	
        	}
	 });
 }
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
		url:'/tablero/ajaxSelects2?action=getEvidencia&idEvidencia='+idEvidencia,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesEvidencia = JSON.parse(webServicesEvidencia);
	
	var contenidoEvidencia = "";

	contenidoEvidencia +=			'<div class="modal fade" id="modalBorrarEvidencia"  data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
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
		url:'/tablero/ajaxSelects2?action=getEvidencia&idEvidencia='+evidenciaId,
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
		url:'/tablero/ajaxSelects2?action=getEvidencia&idEvidencia='+evidenciaId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesEvidencia = JSON.parse(webServicesEvidencia);
	
	var contenido = "";

	contenido +=		'<div class="modal fade" id="modalEditarEvidencia" data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
						' <form class="form-horizontal" role="form" id="formEvidencia">'+
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
						'								<tr><td><label for="nombreEvidencia">Nombre</label><input type="text" id="nombreEvidencia" class="form-control" value="'+webServicesEvidencia[0].nombre+'" required/></td><td><label for="urlEvidencia">Url</label><input type="url" id="urlEvidencia" class="form-control" value="'+webServicesEvidencia[0].url+'" /></td></tr>'+
						'								<tr><td colspan="2"><label for="descripcionEvidencia">Descripción</label><input type="text" id="descripcionEvidencia" class="form-control" value="'+webServicesEvidencia[0].descripcion+'" /></td></tr>'+
						'								<tr><td colspan="2"><label>Localización de la evidencia:</label></td></tr>'+
						/* '								<tr><td><label for="latLongEvidencia">Latitud , Longitud: </label>'+
						'										<input id="geoloc" class="form-control" type="text" value="" size="20" /></td></tr>'+ */	
						'								<tr><td><label for="latEvidencia">Latitud: </label>'+
						'										<input id="geolat" class="form-control" type="numeric" value="'+webServicesEvidencia[0].latitud+'" size="20" /></td>'+
						'									<td><label for="longEvidencia">Longitud: </label>'+
						'										<input id="geolng" class="form-control" type="numeric" value="'+webServicesEvidencia[0].longitud+'" size="20" /></td></tr>'+ 
						'								<input type="hidden" id="wsIdEvidencia" value="'+webServicesEvidencia[0].wsId+'" /><input type="hidden" id="versionEvidencia" value="'+webServicesEvidencia[0].version+'" /><input type="hidden" id="avanceIdEvidencia" value="'+webServicesEvidencia[0].avanceId+'" />'+
						'								<input type="hidden" id="urlDocEvidencia" value="" />'+														
						'			      			</form>	'+												
						'							<form method="post" enctype="multipart/form-data">'+ 
						'								<tr><td colspan="2"><label for="documentoEvidencia">Adjuntar Documento</label><input type="file" id="documentoEvidencia" name="documentoEvidencia" size="50" /></td></tr>'+
 						'							</form>	'+
						'						</tbody>'+
						'					</table>'+
						'				</div>'+
						
						'		    </div>'+
						'			<div class="modal-footer">'+
						' 				<button type="submit" class="btn btn-success btn-sm editarEvidencia" id="botonGuardarEvidencia" parametros='+evidenciaId+'>Guardar Cambios</button>'+
						' 				<button type="button" class="btn btn-success btn-sm agregarModalAdministrador" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+' >Cerrar</button>'+						
						'			</div>'+
						'		</div>'+ 
						'	</div>'+
						' </form>'+
						'</div>';
						
	$("body").append(contenido);
	$('#modalEditarEvidencia').modal('show');

});

$("body").on("click", ".editarEvidencia",function(event){
	if(validarFormulario("formEvidencia",false,false)==true){
		event.stopPropagation();
		event.preventDefault(); 

		
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");                                                            
	
	//Las siguentes variables se utiliza en esta funcion para redibujar el modal anterior
	var evidenciaId = idParsed[0];
	
	var docEvidenciaFile = document.getElementById("documentoEvidencia").files[0];
    
	if (docEvidenciaFile != null){
	    var formdata = new FormData();
	    formdata.append('documentoEvidencia', docEvidenciaFile);
	    
	     $.ajax({
		         type: "POST",
		         url: "/tablero/UploadServlet", /* contextPath + servletPath, */
		         data: formdata, /* + $('#custIdList').val(), */
		         async: false,
		         processData: false,  // tell jQuery not to process the data
		         contentType: false,   // tell jQuery not to set contentType
		         success: function(data){
		               $("#urlDocEvidencia").val(data);
		           }
		     }); 
	}
	     
	var nombre = $("#nombreEvidencia").val();
	var url = $("#urlEvidencia").val();
	var urlDocumento; 
		if (docEvidenciaFile != undefined) urlDocumento = $("#urlDocEvidencia").val();
	var descripcion = $("#descripcionEvidencia").val();
	var wsId = $("#wsIdEvidencia").val();
	var version = $("#versionEvidencia").val();
	var avanceId = $("#avanceIdEvidencia").val();
	var latitud = $("#geolat").val();
	var longitud = $("#geolng").val();

	//Vaciar los inputs
	$("#nombreEvidencia").val("");
	$("#urlEvidencia").val("");
	$("#urlDocEvidencia").val("");
	$("#descripcionEvidencia").val("");
	$("#documentoEvidencia").val("");
	$("#geolat").val("");
	$("#geolng").val("");

	
	var objeto = new Object();
	
	objeto.id = evidenciaId;
	objeto.nombre = nombre;
	objeto.url = url;
	if (urlDocumento != null && urlDocumento != "") objeto.urlDocumento = urlDocumento;
	objeto.descripcion = descripcion;
	objeto.wsId = wsId;
	objeto.version = version;
	objeto.avanceId = avanceId;
	if (latitud != "") objeto.latitud = latitud; else objeto.latitud = 0.0;// 0.0 por defecto porque es Double
	if (longitud != "") objeto.longitud = longitud; else objeto.longitud = 0.0;// 0.0 por defecto porque es Double

	
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
	}	
});

$("body").on("click", ".guardarBeneficiario",function(event){
	if (validarFormulario("formularioBeneficiarios",false,false)==true){
		event.stopPropagation();
		event.preventDefault(); 
		
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");                                                            
	
	//Las siguentes variables se utiliza en esta funcion para redibujar el modal anterior
	var insLineaAccionId = idParsed[0];
	var lineaAccionId = idParsed[1];
	var institucionId = idParsed[2];
	var periodoId = idParsed[3];
	var accionId = idParsed[4];
	var actividadId = idParsed[5];
	
	//var nombre = $("#nombreBeneficiario").val();
	var descripcion = $("#descripcionBeneficiario").val();
	var tipo = $("#beneficiarioTipo").val();
	var grupo = $("#grupoBeneficiario").val();
	var cantidad = $("#cantidadBeneficiario").val();
	//var version = $("#versionBeneficiario").val();
	var avanceId = $("#avanceIdBeneficiario").val();


	//Vaciar los inputs
	//$("#nombreBeneficiario").val("");
	$("#descripcionBeneficiario").val("");
	$("#beneficiarioTipo").val("");
	$("#grupoBeneficiario").val("");
	$("#cantidadBeneficiario").val("");
	//$("#versionBeneficiario").val("");

	var objeto = new Object();
	
	//objeto.nombre = nombre;
	objeto.descripcion = descripcion;
	objeto.tipoId = tipo;
	//objeto.version = version;
	objeto.cantidad = cantidad;
	objeto.avanceId = avanceId;
	objeto.grupoId = grupo;


  	var info = JSON.stringify(objeto);
    $.ajax({
        url: "ajaxInserts2?accion=insBeneficiario",
        type: 'POST',
        dataType: 'json',
        data: info,
        contentType: 'application/json',
        mimeType: 'application/json',
        success: function (data) {
        	if(data.success == true)
        	{
        		renderAdministrarAvance(insLineaAccionId,lineaAccionId,institucionId,periodoId,accionId,actividadId,avanceId);
        		<%-- var webServicesBeneficiario = $.ajax({
        			url:'/tablero/ajaxSelects2?action=getBeneficiario&avanceId='+avanceId,
        		  	type:'get',
        		  	dataType:'json',
        		  	async:false       
        		}).responseText;
        		webServicesBeneficiario = JSON.parse(webServicesBeneficiario);
        		
        		var cuerpoBeneficiario = "";
        		for(var d = 0; d < webServicesBeneficiario.length; d++)
        		{
            		var webServicesBeneficiarioTipo = $.ajax({
            			url:'/tablero/ajaxSelects2?action=getBeneficiarioTipo&beneficiarioTipoId='+webServicesBeneficiario[d].tipoId,
            		  	type:'get',
            		  	dataType:'json',
            		  	async:false       
            		}).responseText;
            		webServicesBeneficiarioTipo = JSON.parse(webServicesBeneficiarioTipo);
            		
            		var webServicesBeneficiarioGrupo = $.ajax({
            			url:'/tablero/ajaxSelects2?action=getBeneficiarioGrupo&beneficiarioGrupoId='+webServicesBeneficiario[d].grupoId,
            		  	type:'get',
            		  	dataType:'json',
            		  	async:false       
            		}).responseText;
            		webServicesBeneficiarioGrupo = JSON.parse(webServicesBeneficiarioGrupo);      			
        			
            		if(onoff==true && webServicesBeneficiario[d].borrado == true){
            			//
            		}else{
            			
            			if(webServicesBeneficiario[d].borrado == true)
            			{
            				<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") ){%>
            					cuerpoBeneficiario += '<tr><td><del>'+webServicesBeneficiarioTipo[0].nombre+'</del></td><td><del>'+webServicesBeneficiarioGrupo[0].nombre+'</del></td><td><del>'+webServicesBeneficiario[d].descripcion+'</del></td><td><del>'+numeroConComa(webServicesBeneficiario[d].cantidad)+'</del></td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaBorrarBeneficiario" data-toggle="tooltip" data-placement="top" title="Restaurar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'-'+webServicesBeneficiario[d].id+' ><span class="fa fa-recycle"></span></button></td></tr>';
            				<%}%>	
            			}else{
            				<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
            					cuerpoBeneficiario += '<tr><td>'+webServicesBeneficiarioTipo[0].nombre+'</td><td>'+webServicesBeneficiarioGrupo[0].nombre+'</td><td>'+webServicesBeneficiario[d].descripcion+'</td><td>'+numeroConComa(webServicesBeneficiario[d].cantidad)+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaEditarBeneficiario" data-toggle="tooltip" data-placement="top" title="Editar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'-'+webServicesBeneficiario[d].id+' ><span class="fa fa-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarBeneficiario" data-toggle="tooltip" data-placement="top" title="Borrar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'-'+webServicesBeneficiario[d].id+' ><span class="fa fa-trash"></span></button></td></tr>';
            				<%} if (attributes.get("role_id_tablero").toString().equals("3")){%>
            					cuerpoBeneficiario += '<tr><td>'+webServicesBeneficiarioTipo[0].nombre+'</td><td>'+webServicesBeneficiarioGrupo[0].nombre+'</td><td>'+webServicesBeneficiario[d].descripcion+'</td><td>'+numeroConComa(webServicesBeneficiario[d].cantidad)+'</td><td class="text-center"></td></tr>';
            				<%}%>
            			}		
            		}	            		        			        			
        		}
        		
        		var contenidoTabla;
        		
        		contenidoTabla = '<div class="table-responsive">'+
				'				 	<table class="table table-hover table-bordered" id="dataTableBeneficiario">'+
				'						<thead>'+
				'							<tr class="active"><th>Tipo</th><th>Grupo</th><th>Descripción</th><th>Cantidad</th><th class="text-center">Administrar</th></tr>'+
				'						</thead>'+
				'						<tfoot>'+
				'							<tr><th></th><th></th><th></th><th></th><th></th></tr>'+
				'						</tfoot>'+
				'						<tbody id="listaBeneficiario">'+
				'						</tbody>'+
				'					</table>'+
				'				 </div>';
				
				
        		$("#cuerpoTablaBeneficiario").html("");
        		$("#cuerpoTablaBeneficiario").html(contenidoTabla);   
        		$("#listaBeneficiario").html("");
        		$("#listaBeneficiario").html(cuerpoBeneficiario);  
        		//$("#dataTableBeneficiario").DataTable();
        		$('#dataTableBeneficiario').dataTable({
        	        "footerCallback": function ( row, data, start, end, display ) {
        	            var api = this.api(), data;
        	 
        	         // saca los puntos y <del> de la cadena para pasarlo a entero
        	            var intVal = function(i){
		            	if(typeof i==='string'){	
		            		i=i.replace(/[\."<\/*del>""Gs\."]/g, '');
		            		i=i.replace(/[","]/g, '.');
		            		i=i*1;		            		
		            	}else{
		            		if(typeof i==='number'){
		            			i=i;		            			
		            	}else{
		            		i=0;
		            	}
		            }
		            	return i;
		            };
        	 
        	         // total general para todas las paginas de la columna
        	            total3 = api
        	                .column( 3 )
        	                .data()
        	                .reduce( function (a, b) {
        	                    return intVal(a) + intVal(b);
        	                }, 0 );
        	 
        	         // total por pagina segun número de columna
        	            pageTotal3 = api
        	                .column( 3, { page: 'current'} )
        	                .data()
        	                .reduce( function (a, b) {
        	                    return intVal(a) + intVal(b);
        	                }, 0 );
        	         
        	         // se muestran los valores de los totales en el footer del table
        	            $( api.column( 3 ).footer() ).html(
        	            		'Total Pág. '+ numeroConComa(pageTotal3) +' (Total Gral. '+ numeroConComa(total3) +')'
        	            );	         
        	        },
        	        dom: 'Bfrtip',
        	        buttons: [
        	            'copy', 'csv', 'excel', 'pdf', 'print'
        	        ]
        		}); --%> 
        	}else{
  		
        	}
        	
        	},
        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
        error: function(data,status,er) {
        	
        	}
	 });
	}
});	

$("body").on("click", ".consultaBorrarBeneficiario",function(event){
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
	var beneficiarioId = idParsed[7];


	if ( $("#modalAdministrador").length )
	{
		$("#modalAdministrador").remove();
	}		
	
	var webServicesBeneficiario = $.ajax({
		url:'/tablero/ajaxSelects2?action=getBeneficiario&beneficiarioId='+beneficiarioId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesBeneficiario = JSON.parse(webServicesBeneficiario);
	
	var contenidoEvidencia = "";

	contenidoEvidencia +=			'<div class="modal fade" id="modalBorrarBeneficiario"  data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
						'	<div class="modal-dialog modal-lg">'+
						'		<div class="modal-content" >'+
						'			<div class="modal-header">'+
						'		        <button type="button" class="close agregarModalAdministrador"  parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+' aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
						'		        <h4 class="modal-title" >Borrar - Restaurar Destinatario</h4>'+
						'			</div>'+
						'		    <div class="modal-body">'+
						'			<div id="mensajeBorradoBeneficiario"></div>'+
						'		    </div>'+
						'			<div class="modal-footer" id="agregarBotonBorradoBeneficiario">'+
						'			</div>'+
						'		</div>'+ 
						'	</div>'+
						'</div>';
						
		$("#programacion").append(contenidoEvidencia);
		
		if(webServicesBeneficiario[0].borrado == true){
			$("#mensajeBorradoBeneficiario").html("");
			$("#mensajeBorradoBeneficiario").append('<h3 class="text-center">Ud. esta seguro que desea RESTABLACER este registro</h3>');
			$("#agregarBotonBorradoBeneficiario").html("");
			$("#agregarBotonBorradoBeneficiario").append('<button type="button" class="btn btn-success btn-sm borrarBeneficiario" id="botonRestaurarBeneficiario" parametros='+webServicesBeneficiario[0].id+'-r>Restaurar Destinatario</button>');
			$("#agregarBotonBorradoBeneficiario").append('<button type="button" class="btn btn-success btn-sm agregarModalAdministrador"  parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'>Cerrar</button>');
		}else{
			$("#mensajeBorradoBeneficiario").html("");
			$("#mensajeBorradoBeneficiario").append('<h3 class="text-center">Ud. esta seguro que desea BORRAR este registro</h3');
			$("#agregarBotonBorradoBeneficiario").html("");
			$("#agregarBotonBorradoBeneficiario").append('<button type="button" class="btn btn-danger btn-sm borrarBeneficiario" id="botonBorradoBeneficiario" parametros='+webServicesBeneficiario[0].id+'-b>Borrar Destinatario</button>');
			$("#agregarBotonBorradoBeneficiario").append('<button type="button" class="btn btn-success btn-sm agregarModalAdministrador"  parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+'>Cerrar</button>');
		}
		
		$('#modalBorrarBeneficiario').modal('show');
			
});

$("body").on("click", ".borrarBeneficiario",function(event){	
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-"); 
    var beneficiarioId = idParsed[0];
    var estado = idParsed[1];
    
	var webServicesBeneficiario = $.ajax({
		url:'/tablero/ajaxSelects2?action=getBeneficiario&beneficiarioId='+beneficiarioId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesBeneficiario = JSON.parse(webServicesBeneficiario);
    
    var objeto = new Object();
    objeto.id = beneficiarioId;
    objeto.borrado= webServicesBeneficiario[0].borrado;

    
  	var info = JSON.stringify(objeto);
    $.ajax({
        url: "ajaxUpdate2?accion=actBorradoBeneficiario",
        type: 'POST',
        dataType: 'json',
        data: info,
        contentType: 'application/json',
        mimeType: 'application/json',
        success: function (data) {
        	
        	if(data.success == true){
            	if(estado == "b"){
	        		$("#botonBorradoBeneficiario").remove();
	            	$("#mensajeBorradoBeneficiario").html("");
	            	$("#mensajeBorradoBeneficiario").html("<h3 class='text-center'>BORRADO EXITOSAMENTE!!</h3>");
	            }else{
	        		$("#botonRestaurarBeneficiario").remove();
	            	$("#mensajeBorradoBeneficiario").html("");
	            	$("#mensajeBorradoBeneficiario").html("<h3 class='text-center'>RESTAURADO EXITOSAMENTE!!</h3>");
	        	}
        	}

        },

        error: function(data,status,er) {
        	
        	}
	 });
	
});     

$("body").on("click", ".consultaEditarBeneficiario",function(event){
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
	var beneficiarioId = idParsed[7];

	if ( $("#modalAdministrador").length )
	{
		$("#modalAdministrador").remove();
	}	
	
	var webServicesBeneficiarioTipo = $.ajax({
		url:'/tablero/ajaxSelects2?action=getBeneficiarioTipo',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesBeneficiarioTipo = JSON.parse(webServicesBeneficiarioTipo);
	
	var optionBeneficiarioTipo;
	
	for(var z = 0; z < webServicesBeneficiarioTipo.length; z++){
		optionBeneficiarioTipo+='<option value="'+webServicesBeneficiarioTipo[z].id+'" >'+webServicesBeneficiarioTipo[z].nombre+'</option>';
	}
	
	var webServicesBeneficiario = $.ajax({
		url:'/tablero/ajaxSelects2?action=getBeneficiario&beneficiarioId='+beneficiarioId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesBeneficiario = JSON.parse(webServicesBeneficiario);
	
	var webServicesBeneficiarioGrupo = $.ajax({
		url:'/tablero/ajaxSelects2?action=getBeneficiarioGrupo&beneficiarioTipoId='+webServicesBeneficiario[0].tipoId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesBeneficiarioGrupo = JSON.parse(webServicesBeneficiarioGrupo);
	
	var optionBeneficiarioGrupo="";
	
	for(var o = 0; o < webServicesBeneficiarioGrupo.length; o++){
		optionBeneficiarioGrupo+='<option value="'+webServicesBeneficiarioGrupo[o].id+'" >'+webServicesBeneficiarioGrupo[o].nombre+'</option>';
	}
	
	var contenido = "";

	contenido +=		'<div class="modal fade" id="modalEditarBeneficiario" data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
						'	<form role="form" id="formularioBeneficiarios">'+
						'	<div class="modal-dialog modal-lg">'+
						'		<div class="modal-content" >'+
						'			<div class="modal-header">'+
						'		        <button type="button" class="close agregarModalAdministrador"  parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+' aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
						'		        <h4 class="modal-title" >Editar Destinatario</h4>'+
						'			</div>'+
						'		    <div class="modal-body" id="cuerpoModalEditarBeneficiario">'+
										
						'				<div class="table-responsive">'+
						'					<table class="table table-hover">'+
						'						<tbody>'+
						'			      			<form class="form-horizontal" role="form">'+
						'							<tr><td><label for="tipoBeneficiario">Tipo</label><select id="beneficiarioTipo" class="form-control" required>'+optionBeneficiarioTipo+'</select></td><td><label for="grupoBeneficiario">Grupo</label><select id="grupoBeneficiario" class="form-control" required>'+optionBeneficiarioGrupo+'</select></td></tr>'+
						'							<tr><td><label for="cantidadBeneficiario">Cantidad</label><input type="number" id="cantidadBeneficiario" class="form-control" value='+webServicesBeneficiario[0].cantidad+' required /></td><td><label for="descripcionBeneficiario">Descripción</label><input type="text" id="descripcionBeneficiario" class="form-control" value="'+webServicesBeneficiario[0].descripcion+'" /></td></tr>'+																		
						'							<input type="hidden" id="avanceIdBeneficiario" value="'+avanceId+'"/>'+		
						'			      			</form>	'+				
						'						</tbody>'+
						'					</table>'+
						'				</div>'+
						
						'		    </div>'+
						'			<div class="modal-footer">'+
						' 				<button type="submit" class="btn btn-success btn-sm editarBeneficiario" id="botonGuardarBeneficiario" parametros='+beneficiarioId+'>Guardar Cambios</button>'+
						' 				<button type="button" class="btn btn-success btn-sm agregarModalAdministrador" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+actividadId+'-'+avanceId+' >Cerrar</button>'+						
						'			</div>'+
						'		</div>'+ 
						'	</div>'+
						'	</form>'+
						'</div>';
						
	$("body").append(contenido);
	$('#beneficiarioTipo > option[value="'+webServicesBeneficiario[0].tipoId+'"]').attr('selected', 'selected');
	$('#grupoBeneficiario > option[value="'+webServicesBeneficiario[0].grupoId+'"]').attr('selected', 'selected');

	$('#modalEditarBeneficiario').modal('show');

});

$("body").on("click", ".editarBeneficiario",function(event){
	if(validarFormulario("formularioBeneficiarios",false,false)==true){
		event.stopPropagation();
		event.preventDefault(); 

	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");                                                            
	
	//Las siguentes variables se utiliza en esta funcion para redibujar el modal anterior
	var beneficiarioId = idParsed[0];

	var tipo = $("#beneficiarioTipo").val();
	var grupo = $("#grupoBeneficiario").val();
	var cantidad = $("#cantidadBeneficiario").val();
	var descripcion = $("#descripcionBeneficiario").val();

	
	var objeto = new Object();
	
	objeto.id = beneficiarioId;
	objeto.tipoId = tipo;
	objeto.grupoId = grupo;
	objeto.cantidad = cantidad;
	objeto.descripcion = descripcion;
	
  	var info = JSON.stringify(objeto);
    $.ajax({
        url: "ajaxUpdate2?accion=actBeneficiario",
        type: 'POST',
        dataType: 'json',
        data: info,
        contentType: 'application/json',
        mimeType: 'application/json',
        success: function (data) {
        	if(data.success == true)
        	{
        		$("#botonGuardarBeneficiario").remove();
            	$("#cuerpoModalEditarBeneficiario").html("");
            	$("#cuerpoModalEditarBeneficiario").html("<h3 class='text-center'>Ud ha actualizado exitosamente!!</h3>");        		
        	}else{
  		
        	}
        	
        	},
        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
        error: function(data,status,er) {
        	
        	}
	 });
	}	
});

$("body").on("click", ".consultaBorrarInsLineaAccion",function(event){
	var parametrosBorradoInsLineaAccion = $(this).attr("parametrosBorradoInsLineaAccion");
    var idParsed = parametrosBorradoInsLineaAccion.split("-");                                                            
	var id = idParsed[0];
	var borrado = idParsed[1];
	
	if ( $("#modalConsultaBorrarInsLineaAccion").length )
	{
		$("#modalConsultaBorrarInsLineaAccion").remove();
	}	
	
	var insLineaAccion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getInsLineaAccion&insLineaAccionId='+id,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;		
	insLineaAccion=JSON.parse(insLineaAccion);
	
	
	var lineaAccion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getLineaAccion',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	lineaAccion = JSON.parse(lineaAccion);
	
	var nombreInsLineaAccion="";
	for(i= 0;i<lineaAccion.length; i++){
		if(lineaAccion[i].id == insLineaAccion[0].lineaAccionId){
			nombreInsLineaAccion = lineaAccion[i].nombre
		}
		
	}
	
	var contenido = "";

	contenido =			'<div class="modal fade" id="modalConsultaBorrarInsLineaAccion"  tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
						'	<div class="modal-dialog modal-lg">'+
						'		<div class="modal-content" >'+
						'			<div class="modal-header">'+
						'		         <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>'+
						'		        <h4 class="modal-title" >Borrar - Restaurar Línea de Acción</h4>'+
						'			</div>'+
						'		    <div class="modal-body">'+
						'			<div id="mensajeBorradoInsLineaAccion"></div>'+
						'		    </div>'+
						'			<div class="modal-footer" id="agregarBotonBorradoInsLineaAccion">'+
						'			</div>'+
						'		</div>'+ 
						'	</div>'+
						'</div>';
						
		$("body").append(contenido);			
	
		if(insLineaAccion[0].borrado == true){
			$("#mensajeBorradoInsLineaAccion").html("");
			$("#mensajeBorradoInsLineaAccion").append('<h3 class="text-center">Ud. esta seguro que desea RESTABLACER<strong> '+nombreInsLineaAccion+'</strong></h3>');
			$("#agregarBotonBorradoInsLineaAccion").html("");
			$("#agregarBotonBorradoInsLineaAccion").append('<button type="button" class="btn btn-success btn-sm iconoBorradoInsLineaAccion" id="botonRestaurarInsLineaAccion" parametrosBorradoInsLineaAccion='+insLineaAccion[0].id+'-'+insLineaAccion[0].borrado+'-r>Restaurar Línea de Acción</button>');
			//$("#agregarBotonBorradoInsLineaAccion").append('<button type="button" class="btn btn-success eliminarModal" data-dismiss="modal">Cerrar</button>');
		}else{
			$("#mensajeBorradoInsLineaAccion").html("");
			$("#mensajeBorradoInsLineaAccion").append('<h3 class="text-center">Ud. esta seguro que desea BORRAR<strong> '+nombreInsLineaAccion+'</strong></h3');
			$("#agregarBotonBorradoInsLineaAccion").html("");
			$("#agregarBotonBorradoInsLineaAccion").append('<button type="button" class="btn btn-danger btn-sm iconoBorradoInsLineaAccion" id="botonBorradoInsLineaAccion" parametrosBorradoInsLineaAccion='+insLineaAccion[0].id+'-'+insLineaAccion[0].borrado+'-b>Borrar Línea de Acción</button>');
			//$("#agregarBotonBorradoInsLineaAccion").append('<button type="button" class="btn btn-success btn-sm eliminarModal" data-dismiss="modal">Cerrar</button>');
		}
		
		$('#modalConsultaBorrarInsLineaAccion').modal('show');
	
	
	
});

/* $("body").on("change", "#fechaInicioAccion",function(event){
	var fechaInicio = $("#fechaInicioAccion").val();
	var fechaFin = $("#fechaFinAccion").val();
	
	if(fechaFin != ""){		
		if(fechaInicio > fechaFin){
			 $("#fechaInicioAccion").val("");
			alert("Fecha Inicio no puede ser mayor a Fecha Fin");
		}
	}

});*/
$("body").on("change", "#proporcionActividad",function(event){
	var proporcion = parseFloat($("#proporcionActividad").val());
	
		if(proporcion < 0.0 || proporcion > 1.0){
			$("#proporcionActividad").val("");
			$('#proporcionActividad').prop('title', 'La Proporción debe estar comprendido entre 0 y 1');
			alert("La Proporción debe estar comprendido entre 0 y 1");
		}

});

$("body").on("change", "#pesoActividad",function(event){
	var peso = parseFloat($("#pesoActividad").val());
		
		if(peso < 0.0 || peso > 1.0){
			$("#pesoActividad").val("");
			$('#pesoActividad').prop('title', 'El Peso debe estar comprendido entre 0 y 1');
			alert("El valor del Peso debe estar comprendido entre 0 y 1");
		}

});
 
$("body").on("click", ".consultaEditarHito",function(event){
	
	if ( $("#modalProgramacion").length )
	{
		$("#modalProgramacion").remove();
	}	
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");                                                            
	
	//Las siguentes variables se utiliza en esta funcion para redibujar el modal anterior
	var insLineaAccionId = idParsed[0];
	var lineaAccionId = idParsed[1];
	var institucionId = idParsed[2];
	var periodoId = idParsed[3];
	var accionId = idParsed[4];
	var cronogramaId = idParsed[5];
	var programacionId = idParsed[6];
 

	var programacionWebService = $.ajax({
		url:'/tablero/ajaxSelects2?action=getProgramacion&programacionId='+programacionId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	programacionWebService = JSON.parse(programacionWebService);
	
	var contenido = "";

	contenido +=		'<div class="modal fade" id="modalEditarHito" data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
						'	<form role="form" id="formularioHito">'+
						'	<div class="modal-dialog modal-lg">'+
						'		<div class="modal-content" >'+
						'			<div class="modal-header">'+
						'		        <button type="button" class="close agregarProgramacion" data-dismiss="modal" aria-label="Close" parametros="'+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+cronogramaId+'"><span aria-hidden="true">&times;</span></button>'+
						'		        <h4 class="modal-title" >Editar Hito</h4>'+
						'			</div>'+
						'		    <div class="modal-body" id="cuerpoModalEditarHito">'+
										
						'				<div class="table-responsive">'+
						'					<table class="table table-hover">'+
						'						<tbody>'+
						'			      			<form class="form-horizontal" role="form">'+
						'							<tr><td><label for="cantidadHito">Cantidad</label><input type="number" id="cantidadHito" step="any" class="form-control" value='+programacionWebService[0].cantidad+' required/></td><td><label for="fechaHito">Fecha Entrega</label><input  id="fechaHito" class="form-control" value='+programacionWebService[0].fechaEntrega+' required/></td></tr>'+																		
						'							<input type="hidden" id="programacionIdHito" value="'+programacionWebService[0].id+'"/>'+		
						'			      			</form>	'+				
						'						</tbody>'+
						'					</table>'+
						'				</div>'+
						
						'		    </div>'+
						'			<div class="modal-footer">'+
						' 				<button type="button" class="btn btn-success btn-sm editarHito" id="botonGuardarHito" parametros='+programacionWebService[0].id+'>Guardar Cambios</button>'+ 
						' 				<button type="button" class="btn btn-success btn-sm agregarProgramacion" parametros="'+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+cronogramaId+'" >Cerrar</button>'+						
						'			</div>'+
						'		</div>'+ 
						'	</div>'+
						'	</form>'+
						'</div>';
						
	$("body").append(contenido);
	$('#modalEditarHito').modal('show');
	$('#fechaHito').datepicker({  
		language: "es",
		format: 'yyyy-mm-dd',
		todayBtn: "linked",
	    todayHighlight: true});

});
$("body").on("click", ".editarHito",function(event){
	if (validarFormulario("formularioHito",false,false)==true){
		event.stopPropagation();
		event.preventDefault(); 

		
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");                                                            
	
	//Las siguentes variables se utiliza en esta funcion para redibujar el modal anterior
	var programacionId = idParsed[0];

	var cantidad = $("#cantidadHito").val();
	var fechaEntrega = $("#fechaHito").val();

	var objeto = new Object();
	
	objeto.id = programacionId;
	objeto.cantidad = cantidad;
	objeto.fechaEntrega = fechaEntrega;

	
  	var info = JSON.stringify(objeto);
    $.ajax({
        url: "ajaxUpdate2?accion=actProgramacion",
        type: 'POST',
        dataType: 'json',
        data: info,
        contentType: 'application/json',
        mimeType: 'application/json',
        success: function (data) {
        	if(data.success == true)
        	{
        		$("#botonGuardarHito").remove();
            	$("#cuerpoModalEditarHito").html("");
            	$("#cuerpoModalEditarHito").html("<h3 class='text-center'>Ud ha actualizado exitosamente!!</h3>");        		
        	}else{
        		$("#botonGuardarHito").remove();
            	$("#cuerpoModalEditarHito").html("");
            	$("#cuerpoModalEditarHito").html("<h3 class='text-center'>Error!!</h3>");
        	}
        	
        	},
        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
        error: function(data,status,er) {
        	
        	}
	 });
	}
});

$("body").on("click", ".consultaBorrarHito",function(event){
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");                                                            
	
	//Las siguentes variables se utiliza en esta funcion para redibujar el modal anterior
	var insLineaAccionId = idParsed[0];
	var lineaAccionId = idParsed[1];
	var institucionId = idParsed[2];
	var periodoId = idParsed[3];
	var accionId = idParsed[4];
	var cronogramaId = idParsed[5];
	var programacionId = idParsed[6];

	if ( $("#modalProgramacion").length )
	{
		$("#modalProgramacion").remove();
	}		
	
	var programacionWebService = $.ajax({
		url:'/tablero/ajaxSelects2?action=getProgramacion&programacionId='+programacionId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	programacionWebService = JSON.parse(programacionWebService);
	
	var contenido = "";

	contenido =			'<div class="modal fade" id="modalBorrarHito"  data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
						'	<div class="modal-dialog modal-lg">'+
						'		<div class="modal-content" >'+
						'			<div class="modal-header">'+
						'		        <button type="button" class="close agregarProgramacion" data-dismiss="modal" aria-label="Close" parametros="'+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+cronogramaId+'"><span aria-hidden="true">&times;</span></button>'+
						'		        <h4 class="modal-title" >Borrar - Restaurar Hito</h4>'+
						'			</div>'+
						'		    <div class="modal-body">'+
						'				<div id="mensajeBorradoHito"></div>'+
						'		    </div>'+
						'			<div class="modal-footer" id="agregarBotonBorradoHito">'+
						'			</div>'+
						'		</div>'+ 
						'	</div>'+
						'</div>';
						
		$("#programacion").append(contenido);
		
		if(programacionWebService[0].borrado == true){
			$("#mensajeBorradoHito").html("");
			$("#mensajeBorradoHito").append('<h3 class="text-center">Ud. esta seguro que desea RESTABLACER este registro</h3>');
			$("#agregarBotonBorradoHito").html("");
			$("#agregarBotonBorradoHito").append('<button type="button" class="btn btn-success btn-sm borrarHito" id="botonRestaurarHito" parametros='+programacionId+'-r>Restaurar Hito</button>');
			$("#agregarBotonBorradoHito").append('<button type="button" class="btn btn-success btn-sm agregarProgramacion" parametros="'+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+cronogramaId+'">Cerrar</button>');
		}else{
			$("#mensajeBorradoHito").html("");
			$("#mensajeBorradoHito").append('<h3 class="text-center">Ud. esta seguro que desea BORRAR este registro</h3');
			$("#agregarBotonBorradoHito").html("");
			$("#agregarBotonBorradoHito").append('<button type="button" class="btn btn-danger btn-sm borrarHito" id="botonBorradoHito" parametros='+programacionId+'-b>Borrar Hito</button>');
			$("#agregarBotonBorradoHito").append('<button type="button" class="btn btn-success btn-sm agregarProgramacion" parametros="'+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+cronogramaId+'">Cerrar</button>');
		}
		
		$('#modalBorrarHito').modal('show');
			
});
$("body").on("click", ".borrarHito",function(event){	
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-"); 
    var programacionId = idParsed[0];
    var estado = idParsed[1];
    
	var programacionWebService = $.ajax({
		url:'/tablero/ajaxSelects2?action=getProgramacion&programacionId='+programacionId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	programacionWebService = JSON.parse(programacionWebService);
    
    var objeto = new Object();
    objeto.id = programacionId;
    objeto.borrado= programacionWebService[0].borrado;

    
  	var info = JSON.stringify(objeto);
    $.ajax({
        url: "ajaxUpdate2?accion=actBorradoProgramacion",
        type: 'POST',
        dataType: 'json',
        data: info,
        contentType: 'application/json',
        mimeType: 'application/json',
        success: function (data) {
        	
        	if(data.success == true){
            	if(estado == "b"){
	        		$("#botonBorradoHito").remove();
	            	$("#mensajeBorradoHito").html("");
	            	$("#mensajeBorradoHito").html("<h3 class='text-center'>BORRADO EXITOSAMENTE!!</h3>");
	            }else{
	        		$("#botonRestaurarHito").remove();
	            	$("#mensajeBorradoHito").html("");
	            	$("#mensajeBorradoHito").html("<h3 class='text-center'>RESTAURADO EXITOSAMENTE!!</h3>");
	        	}
        	}

        },

        error: function(data,status,er) {
        	
        	}
	 });
	
});

function renderAccionDestinatario(insLineaAccionId,lineaAccionId,institucionId,periodoId,accionId,accionCatalogoId){
	
	if ( $("#dataTableDestinatarioAccion").length ){
		$('#dataTableDestinatarioAccion').DataTable().destroy();	
	} 
	
	
	/* if ( $("#tableListaDestinatario").length ){
		$("#descripcionDestinatarioAccion").val('');
		$("#cantidadDestinatarioAccion").val('');
		
		$("#tableListaDestinatario").html("");
		var tableListaDestinatario="";
		
		tableListaDestinatario=
			
			'									<div class="box box-default box-solid">'+
			'		                				<div class="box-header with-border">'+
			'										<h3 class="box-title">Lista Destinatarios</h3>'+
			'	                  						<div class="box-tools pull-right">'+
			'				                    			<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
			'		                    					<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>'+
			'		                  					</div>'+
			'              							</div>'+
			'              						<div class="box-body">'+	
			'										<div class="table-responsive">'+
			'											<table class="table table-hover table-bordered" id="dataTableDestinatarioAccion">'+
			'												<thead>'+
			'													<tr class="active"><th>Tipo</th><th>Grupo</th><th>Descripción</th><th>Cantidad</th><th class="text-center">Administrar</th></tr>'+
			'												</thead>'+
			'												<tfoot>'+
			'													<tr><th></th><th></th><th></th><th></th><th></th></tr>'+
			'												</tfoot>'+
			'												<tbody id="listaDestinatarioAccion">'+
			'												</tbody>'+
			'											</table>'+
			'				      					</div>'+
			
			'				      				</div>';
				
		
		$("#tableListaDestinatario").html(tableListaDestinatario);
	} */

	cuerpoDestinatarioAccion = "";
	
	
	if ( $("#modalDestinatario").length )
	{
		$("#modalDestinatario").remove();
	}
		
	if ( $("#modalDuplicarAccion").length )
	{
		$("#modalDuplicarAccion").remove();
	}
	if ( $("#modalAccion").length )
	{
		$("#modalAccion").remove();
	}
	if ( $("#modalEditarDestinatario").length )
	{
		$("#modalEditarDestinatario").remove();
	}
	if ( $("#modalBorrarDestinatarioAccion").length )
	{
		$("#modalBorrarDestinatarioAccion").remove();
	}		
	var insLineaAccion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getInsLineaAccion&insLineaAccionId='+insLineaAccionId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;		
	insLineaAccion=JSON.parse(insLineaAccion);
	
	var institucion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getInstitucion&institucionId='+insLineaAccion[0].institucionId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	institucion = JSON.parse(institucion);
	
	var lineaAccion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getLineaAccion&lineaAccionId='+lineaAccionId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	lineaAccion = JSON.parse(lineaAccion);
	
	var accion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getAccion&accionId='+accionId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	accion = JSON.parse(accion);
	
	var accionCatalogo = $.ajax({
		url:'/tablero/ajaxSelects2?action=getAccionCatalogo&catalogoAccionId='+accion[0].accionCatalogoId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	accionCatalogo = JSON.parse(accionCatalogo);
	
	var webServicesBeneficiarioTipo = $.ajax({
		url:'/tablero/ajaxSelects2?action=getBeneficiarioTipo',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesBeneficiarioTipo = JSON.parse(webServicesBeneficiarioTipo);
	
	var optionBeneficiarioTipo;
	
	for(var z = 0; z < webServicesBeneficiarioTipo.length; z++){
		optionBeneficiarioTipo+='<option value="'+webServicesBeneficiarioTipo[z].id+'" >'+webServicesBeneficiarioTipo[z].nombre+'</option>';
	}
	
	var webServicesBeneficiarioAccion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getAccionDestinatario&accionId='+accionId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesBeneficiarioAccion = JSON.parse(webServicesBeneficiarioAccion);
	
	var cuerpoBeneficiario = "";
	for(var a = 0; a < webServicesBeneficiarioAccion.length; a++)
	{
		
		if(onoff==true && webServicesBeneficiarioAccion[a].borrado == true){
			// pasa a la siguiente fila en el for ++
		}else{
			var webServicesBeneficiarioTipo = $.ajax({
				url:'/tablero/ajaxSelects2?action=getBeneficiarioTipo&beneficiarioTipoId='+webServicesBeneficiarioAccion[a].beneficiarioTipoId,
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			webServicesBeneficiarioTipo = JSON.parse(webServicesBeneficiarioTipo);
			
			var webServicesBeneficiarioGrupo = $.ajax({
				url:'/tablero/ajaxSelects2?action=getBeneficiarioGrupo&beneficiarioGrupoId='+webServicesBeneficiarioAccion[a].beneficiarioGrupoId,
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			webServicesBeneficiarioGrupo = JSON.parse(webServicesBeneficiarioGrupo);
			
			if(webServicesBeneficiarioAccion[a].borrado == true)
			{
				<% if (attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("0")){%>
					cuerpoDestinatarioAccion += '<tr><td><del>'+webServicesBeneficiarioTipo[0].nombre+'</del></td><td><del>'+webServicesBeneficiarioGrupo[0].nombre+'</del></td><td><del>'+webServicesBeneficiarioAccion[a].descripcion+'</del></td><td><del>'+numeroConComa(webServicesBeneficiarioAccion[a].cantidad)+'</del></td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaBorrarDestinatarioAccion" data-toggle="tooltip" data-placement="top" title="Restaurar Destinatario" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+accionCatalogoId+'-'+webServicesBeneficiarioAccion[a].id+' ><span class="fa fa-recycle"></span></button></td></tr>';
				<% }%>
			}else{
				<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
						cuerpoDestinatarioAccion += '<tr><td>'+webServicesBeneficiarioTipo[0].nombre+'</td><td>'+webServicesBeneficiarioGrupo[0].nombre+'</td><td>'+webServicesBeneficiarioAccion[a].descripcion+'</td><td>'+numeroConComa(webServicesBeneficiarioAccion[a].cantidad)+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaEditarDestinatario" data-toggle="tooltip" data-placement="top" title="Editar Destinatario" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+accionCatalogoId+'-'+webServicesBeneficiarioAccion[a].id+' ><span class="fa fa-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarDestinatarioAccion" data-toggle="tooltip" data-placement="top" title="Borrar Destinatario" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+accionCatalogoId+'-'+webServicesBeneficiarioAccion[a].id+' ><span class="fa fa-trash"></span></button></td></tr>';
				<%} if (attributes.get("role_id_tablero").toString().equals("3")){%>
						cuerpoDestinatarioAccion += '<tr><td>'+webServicesBeneficiarioTipo[0].nombre+'</td><td>'+webServicesBeneficiarioGrupo[0].nombre+'</td><td>'+webServicesBeneficiarioAccion[a].descripcion+'</td><td>'+numeroConComa(webServicesBeneficiarioAccion[a].cantidad)+'</td><td class="text-center"></td></tr>';
				<%}%>
			}		
		}
	}
			
	var cuerpoModalDestinatario = "";

	cuerpoModalDestinatario =	'<div class="modal fade" id="modalDestinatario" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
						'	<div class="modal-dialog modal-lg" style="width:90%">'+
						'		<div class="modal-content" >'+
						'			<div class="modal-header">'+
						'		        <button type="button" class="close agregarAccion" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+' data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
						'		        <h4 class="modal-title">'+accionCatalogo[0].nombre+' de '+lineaAccion[0].nombre+' ('+institucion[0].sigla+') año '+insLineaAccion[0].periodoId+'</h4>'+   
						'			</div>'+
						'		    <div class="modal-body">'+
						
						'		      		<div class="row">'+		
						
						<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>		

						'		      		<div class="col-md-12">'+
						'						<div class="box box-warning box-solid">'+
						'		                	<div class="box-header with-border">'+
						'	                  			<h3 class="box-title">Destinatarios</h3>'+
						'	                  			<div class="box-tools pull-right">'+
						'				                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>'+
						'		                    		</button>'+
						'		                    		<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i>'+
						'		                    		</button>'+
						'		                  		</div>'+
						'              				</div>'+
						'               			<div class="box-body">'+
		
						'		      					<div class="col-md-12">'+
						'		      					<form role="form" id="formularioDestinatarios">'+
						'									<div class="box box-default box-solid">'+
						'		                				<div class="box-header with-border">'+
						'		                  					<h3 class="box-title">Agregar Destinatarios</h3>'+
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
						'													<tr><td><label for="tipoDestinatarioAccion">Tipo</label><select id="tipoDestinatarioAccion" class="form-control">'+optionBeneficiarioTipo+'</select></td><td><label for="grupoDestinatarioAccion">Grupo</label><select id="grupoDestinatarioAccion" class="form-control"></select></td></tr>'+
						'													<tr><td><label for="cantidadDestinatarioAccion">Cantidad</label><input type="number" id="cantidadDestinatarioAccion" class="form-control" placeholder="Ingrese una Cantidad" required/></td><td><label for="descripcionDestinatarioAccion">Descripción</label><input type="text" id="descripcionDestinatarioAccion" class="form-control" placeholder="Ingrese Objeto una Descripción"/></td></tr>'+
						'			      									</form>	'+				
						'												</tbody>'+
						'											</table>'+
						'				      					</div>'+
						
						'				      				 </div>'+//fin box body
						'									 <div class="modal-footer">'+ 
						'					        			<button type="submit" class="btn btn-success btn-sm guardarAccionBeneficiario" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+accionCatalogoId+'>Guardar Destinatario</button>'+ 
						'									 </div>'+									
						'				      			 	</div>'+
						'				      			 	</form'+
						'				      			</div>'+							

						<% }%>		


						'		      					<div class="col-md-12" id="tableListaDestinatario">'+
						'									<div class="box box-default box-solid">'+
						'		                				<div class="box-header with-border">'+
						'										<h3 class="box-title">Lista Destinatarios</h3>'+
						'	                  						<div class="box-tools pull-right">'+
						'				                    			<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
						'		                    					<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>'+
						'		                  					</div>'+
						'              							</div>'+
						'              						<div class="box-body">'+	
						'										<div class="table-responsive">'+
						'											<table class="table table-hover table-bordered" id="dataTableDestinatarioAccion">'+
						'												<thead>'+
						'													<tr class="active"><th>Tipo</th><th>Grupo</th><th>Descripción</th><th>Cantidad</th><th class="text-center">Administrar</th></tr>'+
						'												</thead>'+
						'												<tfoot>'+
						'													<tr><th></th><th></th><th></th><th></th><th></th></tr>'+
						'												</tfoot>'+
						'												<tbody id="listaDestinatarioAccion">'+
						'												</tbody>'+
						'											</table>'+
						'				      					</div>'+
						
						'				      				</div>'+
						'				      			</div>'+
						'              				</div>'+
		
						'              				</div>'+
						'                		</div>'+	
						'               	</div>'+
						'                </div>'+//fin row																	
						
						'		    </div>'+
						'			<div class="modal-footer">'+
				      	'			</div>'+														
						'		</div>'+ 
						'	</div>'+
						'</div>';
						
						/* if ( $("#dataTableDestinatarioAccion").length ){
							$('#dataTableDestinatarioAccion').DataTable().destroy();	
						} */					
						
	$("#programacion").append(cuerpoModalDestinatario);
	$("#listaDestinatarioAccion").html("");
	$("#listaDestinatarioAccion").html(cuerpoDestinatarioAccion);
	$('#tipoDestinatarioAccion > option[value="1"]').attr('selected', 'selected');
	$("#cantidadDestinatarioAccion").val('');
	$("#descripcionDestinatarioAccion").val('');
	$('#modalDestinatario').modal('show');
	$('#tipoDestinatarioAccion').change();
	//$("#dataTableDestinatarioAccion").DataTable();	
	$('#dataTableDestinatarioAccion').dataTable({
        "footerCallback": function ( row, data, start, end, display ) {
            var api = this.api(), data;
 
         // saca los puntos y <del> de la cadena para pasarlo a entero
            var intVal = function(i){
            	if(typeof i==='string'){	
            		i=i.replace(/[\."<\/*del>""Gs\."]/g, '');
            		i=i.replace(/[","]/g, '.');
            		i=i*1;		            		
            	}else{
            		if(typeof i==='number'){
            			i=i;		            			
            	}else{
            		i=0;
            	}
            }
            	return i;
            };
 
         // total general para todas las paginas de la columna
            total3 = api
                .column( 3 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
         // total por pagina segun número de columna
            pageTotal3 = api
                .column( 3, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
         
         // se muestran los valores de los totales en el footer del table
            $( api.column( 3 ).footer() ).html(
            		'Total Pág. '+ numeroConComa(pageTotal3) +' (Total Gral. '+ numeroConComa(total3) +')'
            );	         
        },
        dom: 'Bfrtip',
        buttons: [
                  {
                      extend: 'copy',
                      exportOptions: {
                  columns: [ 0, 1, 2, 3 ]
              }
                  },
                  {
                      extend: 'csv',
                      exportOptions: {
                  columns: [ 0, 1, 2, 3 ]
              }
                  },
                  {
                      extend: 'excel',
                      exportOptions: {
                  columns: [ 0, 1, 2, 3 ]
              }
                  },
                  {
                      extend: 'pdf',                      
                      exportOptions: {
                  columns: [ 0, 1, 2, 3 ]
              }
                  },
                  {
                      extend: 'print',
                      exportOptions: {
                  columns: [ 0, 1, 2, 3 ]
              }
                  }
              ]
}); 
	
	}

$("body").on("click", ".modalDestinatario",function(event){
	//event.stopPropagation();
	//event.preventDefault();
		
	parametros = $(this).attr("parametros");
    idParsed = parametros.split("-"); 
    insLineaAccionId = idParsed[0];
    lineaAccionId = idParsed[1];
    institucionId = idParsed[2];
    periodoId = idParsed[3];
    accionId = idParsed[4];
    accionCatalogoId = idParsed[5];    
    
	renderAccionDestinatario(insLineaAccionId,lineaAccionId,institucionId,periodoId,accionId,accionCatalogoId);
});

$("body").on("click", ".guardarAccionBeneficiario",function(event){
	if(validarFormulario("formularioDestinatarios",false,false)==true){
		event.stopPropagation();
		event.preventDefault(); 

		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-"); 
	    var insLineaAccionId = idParsed[0];
	    var lineaAccionId = idParsed[1];
	    var institucionId = idParsed[2];
	    var periodoId = idParsed[3];  
	    var accionId = idParsed[4];
	    var accionCatalogoId = idParsed[5];  
	    
	    var descripcion = $("#descripcionDestinatarioAccion").val();
		var tipo = $("#tipoDestinatarioAccion").val();
		var grupo = $("#grupoDestinatarioAccion").val();
		var cantidad = $("#cantidadDestinatarioAccion").val();
		var cuerpoDestinatarioAccion ="";
					
		var datos = new Object();
	    
	    datos.descripcion = descripcion;
	    datos.beneficiarioTipoId = tipo;
	    datos.beneficiarioGrupoId = grupo;
	    datos.cantidad = cantidad;
	    datos.accionId = accionId;
	
	 	var info = JSON.stringify(datos);
	    $.ajax({
	        url: "ajaxInserts2?accion=insAccionDestinatario",
	        type: 'POST',
	        dataType: 'json',
	        data: info,
	        contentType: 'application/json',
	        mimeType: 'application/json',
	        success: function (data) {
	        	if(data.success == true){	
	        		//$("#programacion").html("");
	        		
	        		renderAccionDestinatario(insLineaAccionId,lineaAccionId,institucionId,periodoId,accionId,accionCatalogoId);
	        	    
	        		<%-- $("#descripcionDestinatarioAccion").val('');
	        		$("#tipoDestinatarioAccion").val('');
	        		$("#grupoDestinatarioAccion").val('');
	        		$("#cantidadDestinatarioAccion").val('');
	        		
	        		var webServicesBeneficiarioTipo = $.ajax({
	        			url:'/tablero/ajaxSelects2?action=getBeneficiarioTipo',
	        		  	type:'get',
	        		  	dataType:'json',
	        		  	async:false       
	        		}).responseText;
	        		webServicesBeneficiarioTipo = JSON.parse(webServicesBeneficiarioTipo);
	        		
	        		var optionBeneficiarioTipo;
	        		
	        		for(var z = 0; z < webServicesBeneficiarioTipo.length; z++){
	        			optionBeneficiarioTipo+='<option value="'+webServicesBeneficiarioTipo[z].id+'" >'+webServicesBeneficiarioTipo[z].nombre+'</option>';
	        		}
	        		
	        		var webServicesBeneficiarioAccion = $.ajax({
	        			url:'/tablero/ajaxSelects2?action=getAccionDestinatario&accionId='+accionId,
	        		  	type:'get',
	        		  	dataType:'json',
	        		  	async:false       
	        		}).responseText;
	        		webServicesBeneficiarioAccion = JSON.parse(webServicesBeneficiarioAccion);
	        		
	        		var cuerpoBeneficiario = "";
	        		for(var a = 0; a < webServicesBeneficiarioAccion.length; a++)
	        		{
	        			var webServicesBeneficiarioTipo = $.ajax({
	        				url:'/tablero/ajaxSelects2?action=getBeneficiarioTipo&beneficiarioTipoId='+webServicesBeneficiarioAccion[a].beneficiarioTipoId,
	        			  	type:'get',
	        			  	dataType:'json',
	        			  	async:false       
	        			}).responseText;
	        			webServicesBeneficiarioTipo = JSON.parse(webServicesBeneficiarioTipo);
	        			
	        			var webServicesBeneficiarioGrupo = $.ajax({
	        				url:'/tablero/ajaxSelects2?action=getBeneficiarioGrupo&beneficiarioGrupoId='+webServicesBeneficiarioAccion[a].beneficiarioGrupoId,
	        			  	type:'get',
	        			  	dataType:'json',
	        			  	async:false       
	        			}).responseText;
	        			webServicesBeneficiarioGrupo = JSON.parse(webServicesBeneficiarioGrupo);
	        			      			
	        			if(webServicesBeneficiarioAccion[a].borrado == true)
	        			{
	        				<% if (attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("0")){%>
	        					cuerpoDestinatarioAccion += '<tr><td><del>'+webServicesBeneficiarioTipo[0].nombre+'</del></td><td><del>'+webServicesBeneficiarioGrupo[0].nombre+'</del></td><td><del>'+webServicesBeneficiarioAccion[a].descripcion+'</del></td><td><del>'+numeroConComa(webServicesBeneficiarioAccion[a].cantidad)+'</del></td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaBorrarDestinatarioAccion" data-toggle="tooltip" data-placement="top" title="Restaurar Destinatario" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+accionCatalogoId+'-'+webServicesBeneficiarioAccion[a].id+' ><span class="fa fa-recycle"></span></button></td></tr>';
	        				<% }%>
	        			}else{
	        				<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
	        						cuerpoDestinatarioAccion += '<tr><td>'+webServicesBeneficiarioTipo[0].nombre+'</td><td>'+webServicesBeneficiarioGrupo[0].nombre+'</td><td>'+webServicesBeneficiarioAccion[a].descripcion+'</td><td>'+numeroConComa(webServicesBeneficiarioAccion[a].cantidad)+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaEditarDestinatario" data-toggle="tooltip" data-placement="top" title="Editar Destinatario" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+accionCatalogoId+'-'+webServicesBeneficiarioAccion[a].id+' ><span class="fa fa-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarDestinatarioAccion" data-toggle="tooltip" data-placement="top" title="Borrar Destinatario" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+accionCatalogoId+'-'+webServicesBeneficiarioAccion[a].id+' ><span class="fa fa-trash"></span></button></td></tr>';
	        				<%} if (attributes.get("role_id_tablero").toString().equals("3")){%>
	        						cuerpoDestinatarioAccion += '<tr><td>'+webServicesBeneficiarioTipo[0].nombre+'</td><td>'+webServicesBeneficiarioGrupo[0].nombre+'</td><td>'+webServicesBeneficiarioAccion[a].descripcion+'</td><td>'+numeroConComa(webServicesBeneficiarioAccion[a].cantidad)+'</td><td class="text-center"></td></tr>';
	        				<%}%>
	        			}        			
	        			
	        		}
	        		
	        		/* $("#listaDestinatarioAccion").html("");
	        		//$("#listaDestinatarioAccion").html(cuerpoDestinatarioAccion); */
	        		
	        		//$("#programacion").append(cuerpoModalDestinatario);
	        		$("#listaDestinatarioAccion").html("");
	        		$("#listaDestinatarioAccion").html(cuerpoDestinatarioAccion);
	        		//$('#tipoDestinatarioAccion > option[value="1"]').attr('selected', 'selected');
	        		//$('#modalDestinatario').modal('show');
	        		//$('#tipoDestinatarioAccion').change();
	        		
	        		$('#dataTableDestinatarioAccion').dataTable({
	        	        "footerCallback": function ( row, data, start, end, display ) {
	        	            var api = this.api(), data;
	        	 
	        	         // saca los puntos y <del> de la cadena para pasarlo a entero
	        	            var intVal = function(i){
		            	if(typeof i==='string'){	
		            		i=i.replace(/[\."<\/*del>""Gs\."]/g, '');
		            		i=i.replace(/[","]/g, '.');
		            		i=i*1;		            		
		            	}else{
		            		if(typeof i==='number'){
		            			i=i;		            			
		            	}else{
		            		i=0;
		            	}
		            }
		            	return i;
		            };
	        	 
	        	         // total general para todas las paginas de la columna
	        	            total3 = api
	        	                .column( 3 )
	        	                .data()
	        	                .reduce( function (a, b) {
	        	                    return intVal(a) + intVal(b);
	        	                }, 0 );
	        	 
	        	         // total por pagina segun número de columna
	        	            pageTotal3 = api
	        	                .column( 3, { page: 'current'} )
	        	                .data()
	        	                .reduce( function (a, b) {
	        	                    return intVal(a) + intVal(b);
	        	                }, 0 );
	        	         
	        	         // se muestran los valores de los totales en el footer del table
	        	            $( api.column( 3 ).footer() ).html(
	        	            		'Total Pág. '+ numeroConComa(pageTotal3) +' (Total Gral. '+ numeroConComa(total3) +')'
	        	            );	         
	        	        },
	        	        dom: 'Bfrtip',
	        	        buttons: [
	        	            'copy', 'csv', 'excel', 'pdf', 'print'
	        	        ]
	        	});  --%>
	        		 
	        		
	        	}else{
	        		alert("ERROR");        		
	        	}
	        	},
	        	error: function(data,status,er) {
	        		alert("Destinatario Insertado");
	        	}
			});
		}
	});

$("body").on("click", ".consultaEditarDestinatario",function(event){
	//event.stopPropagation();
	//event.preventDefault();
	
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");                                                            
	
	//Las siguentes variables se utiliza en esta funcion para redibujar el modal anterior
	var insLineaAccionId = idParsed[0];
	var lineaAccionId = idParsed[1];
	var institucionId = idParsed[2];
	var periodoId = idParsed[3];
	var accionId = idParsed[4];
	var accionCatalogoId = idParsed[5];
	var destinatarioId = idParsed[6];


	if ( $("#modalDestinatario").length )
	{
		$("#modalDestinatario").remove();
	}	
	
	var webServicesBeneficiarioTipo = $.ajax({
		url:'/tablero/ajaxSelects2?action=getBeneficiarioTipo',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesBeneficiarioTipo = JSON.parse(webServicesBeneficiarioTipo);
	
	var optionBeneficiarioTipo;
	
	for(var z = 0; z < webServicesBeneficiarioTipo.length; z++){
		optionBeneficiarioTipo+='<option value="'+webServicesBeneficiarioTipo[z].id+'" >'+webServicesBeneficiarioTipo[z].nombre+'</option>';
	}
	
	var webServicesDestinatarioAccion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getAccionDestinatario&destinatarioId='+destinatarioId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesDestinatarioAccion = JSON.parse(webServicesDestinatarioAccion);
	
	var webServicesBeneficiarioGrupo = $.ajax({
		url:'/tablero/ajaxSelects2?action=getBeneficiarioGrupo&beneficiarioTipoId='+webServicesDestinatarioAccion[0].beneficiarioTipoId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesBeneficiarioGrupo = JSON.parse(webServicesBeneficiarioGrupo);
	
	var optionBeneficiarioGrupo="";
	
	for(var o = 0; o < webServicesBeneficiarioGrupo.length; o++){
		optionBeneficiarioGrupo+='<option value="'+webServicesBeneficiarioGrupo[o].id+'" >'+webServicesBeneficiarioGrupo[o].nombre+'</option>';
	}
	
	var contenido = "";

	contenido +=		'<div class="modal fade" id="modalEditarDestinatario" data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
						'	<form role="form" id="formularioDestinatarios">'+
						'	<div class="modal-dialog modal-lg">'+
						'		<div class="modal-content" >'+
						'			<div class="modal-header">'+
						'		        <button type="button" class="close modalDestinatario"  parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+accionCatalogoId+' aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
						'		        <h4 class="modal-title" >Editar Destinatario</h4>'+
						'			</div>'+
						'		    <div class="modal-body" id="cuerpoModalEditarDestinatarios">'+
										
						'				<div class="table-responsive">'+
						'					<table class="table table-hover">'+
						'						<tbody>'+
						'			      			<form class="form-horizontal" role="form">'+
						'							<tr><td><label for="tipoDestinatarioAccion">Tipo</label><select id="tipoDestinatarioAccion" class="form-control">'+optionBeneficiarioTipo+'</select></td><td><label for="grupoDestinatarioAccion">Grupo</label><select id="grupoDestinatarioAccion" class="form-control">'+optionBeneficiarioGrupo+'</select></td></tr>'+
						'							<tr><td><label for="cantidadDestinatarioAccion">Cantidad</label><input type="number" id="cantidadDestinatarioAccion" class="form-control" value='+webServicesDestinatarioAccion[0].cantidad+' required/></td><td><label for="descripcionDestinatarioAccion">Descripción</label><input type="text" id="descripcionDestinatarioAccion" class="form-control" value="'+webServicesDestinatarioAccion[0].descripcion+'" /></td></tr>'+																		
						'			      			</form>	'+				
						'						</tbody>'+
						'					</table>'+
						'				</div>'+
						
						'		    </div>'+
						'			<div class="modal-footer">'+
						' 				<button type="submit" class="btn btn-success btn-sm editarDestinatarioAccion" id="botonGuardarDestinatarioAccion" parametros='+destinatarioId+'> Guardar Cambios</button>'+
						' 				<button type="button" class="btn btn-success btn-sm modalDestinatario" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+accionCatalogoId+' >Cerrar</button>'+						
						'			</div>'+
						'		</div>'+ 
						'	</div>'+
						'	</form>'+
						'</div>';
						
	$("body").append(contenido);
	$('#tipoDestinatarioAccion > option[value="'+webServicesDestinatarioAccion[0].beneficiarioTipoId+'"]').attr('selected', 'selected');
	$('#grupoDestinatarioAccion > option[value="'+webServicesDestinatarioAccion[0].beneficiarioGrupoId+'"]').attr('selected', 'selected');

	$('#modalEditarDestinatario').modal('show');
	$('#tipoDestinatarioAccion').change();

});


$("body").on("change", "#tipoDestinatarioAccion",function(event){
	//var departamentoId = $(this).attr("parametro");
	var destinatarioTipoId = $("#tipoDestinatarioAccion option:selected").val();
	
	var webServicesDestinatarioGrupo = $.ajax({
		url:'/tablero/ajaxSelects2?action=getBeneficiarioGrupo&beneficiarioTipoId='+destinatarioTipoId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServicesDestinatarioGrupo = JSON.parse(webServicesDestinatarioGrupo);
	
	var optionDestinatarioGrupo="";
	
	for(var o = 0; o < webServicesDestinatarioGrupo.length; o++){
		optionDestinatarioGrupo+='<option value="'+webServicesDestinatarioGrupo[o].id+'" >'+webServicesDestinatarioGrupo[o].nombre+'</option>';
	}
	
	$("#grupoDestinatarioAccion").html("");
	$("#grupoDestinatarioAccion").append(optionDestinatarioGrupo);
	
});

$("body").on("click", ".editarDestinatarioAccion",function(event){
	if(validarFormulario("formularioDestinatarios",false,false)==true){
		event.stopPropagation();
		event.preventDefault(); 

		
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-");               
	   
		//Las siguentes variables se utiliza en esta funcion para redibujar el modal anterior
		var destinatarioId = idParsed[0];// es el id de la tabla accion_destinatario
	
		var tipo = $("#tipoDestinatarioAccion").val();
		var grupo = $("#grupoDestinatarioAccion").val();
		var cantidad = $("#cantidadDestinatarioAccion").val();
		var descripcion = $("#descripcionDestinatarioAccion").val();
	
		
		var objeto = new Object();
		
		objeto.id = destinatarioId;
		objeto.beneficiarioTipoId = tipo;
		objeto.beneficiarioGrupoId = grupo;
		objeto.cantidad = cantidad;
		objeto.descripcion = descripcion;
		
	  	var info = JSON.stringify(objeto);
	    $.ajax({
	        url: "ajaxUpdate2?accion=actAccionDestinatario",
	        type: 'POST',
	        dataType: 'json',
	        data: info,
	        contentType: 'application/json',
	        mimeType: 'application/json',
	        success: function (data) {
	        	if(data.success == true)
	        	{
	        		$("#botonGuardarDestinatarioAccion").remove();
	            	$("#cuerpoModalEditarDestinatarios").html("");
	            	$("#cuerpoModalEditarDestinatarios").html("<h3 class='text-center'>Ud ha actualizado exitosamente!!</h3>"); 
	            	//renderAccionDestinatario(insLineaAccionId,lineaAccionId,institucionId,periodoId,accionId,accionCatalogoId);
	            	
	        	}
	        	
	        	},
	        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
	        error: function(data,status,er) {
	        	
	        	}
		 });
	}	
});

$("body").on("click", ".consultaBorrarDestinatarioAccion",function(event){
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");                                                            
	
	//Las siguentes variables se utiliza en esta funcion para redibujar el modal anterior
	var insLineaAccionId = idParsed[0];
	var lineaAccionId = idParsed[1];
	var institucionId = idParsed[2];
	var periodoId = idParsed[3];
	var accionId = idParsed[4];
	var accionCatalogoId = idParsed[5];
	var destinatarioId = idParsed[6];

	if ( $("#modalDestinatario").length )
	{
		$("#modalDestinatario").remove();
	}		
	
	var WebServiceDestinatarioAccion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getAccionDestinatario&destinatarioId='+destinatarioId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	WebServiceDestinatarioAccion = JSON.parse(WebServiceDestinatarioAccion);
	
	var contenido = "";

	contenido =			'<div class="modal fade" id="modalBorrarDestinatarioAccion"  data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
						'	<div class="modal-dialog modal-lg">'+
						'		<div class="modal-content" >'+
						'			<div class="modal-header">'+
						'		        <button type="button" class="close modalDestinatario"  parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+accionCatalogoId+' ><span aria-hidden="true">&times;</span></button>'+
						'		        <h4 class="modal-title" >Borrar - Restaurar Destinatario</h4>'+
						'			</div>'+
						'		    <div class="modal-body">'+
						'				<div id="mensajeBorradoDestinatarioAccion"></div>'+
						'		    </div>'+
						'			<div class="modal-footer" id="agregarBotonBorradoDestinatarioAccion">'+
						'			</div>'+
						'		</div>'+ 
						'	</div>'+
						'</div>';
						
		$("#programacion").append(contenido);
		
		if(WebServiceDestinatarioAccion[0].borrado == true){
			$("#mensajeBorradoDestinatarioAccion").html("");
			$("#mensajeBorradoDestinatarioAccion").append('<h3 class="text-center">Ud. esta seguro que desea RESTABLACER este registro</h3>');
			$("#agregarBotonBorradoDestinatarioAccion").html("");
			$("#agregarBotonBorradoDestinatarioAccion").append('<button type="button" class="btn btn-success btn-sm borrarDestinatarioAccion" id="botonRestaurarDestinatarioAccion" parametros='+destinatarioId+'-r>Restaurar Destinatario</button>');
			$("#agregarBotonBorradoDestinatarioAccion").append('<button type="button" class="btn btn-success btn-sm modalDestinatario" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+accionCatalogoId+'>Cerrar</button>');
		}else{
			$("#mensajeBorradoDestinatarioAccion").html("");
			$("#mensajeBorradoDestinatarioAccion").append('<h3 class="text-center">Ud. esta seguro que desea BORRAR este registro</h3');
			$("#agregarBotonBorradoDestinatarioAccion").html("");
			$("#agregarBotonBorradoDestinatarioAccion").append('<button type="button" class="btn btn-danger btn-sm borrarDestinatarioAccion" id="botonBorradoDestinatarioAccion" parametros='+destinatarioId+'-b>Borrar Destinatario</button>');
			$("#agregarBotonBorradoDestinatarioAccion").append('<button type="button" class="btn btn-success btn-sm modalDestinatario" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+accionId+'-'+accionCatalogoId+'>Cerrar</button>');
		}
		
		$('#modalBorrarDestinatarioAccion').modal('show');
			
});
$("body").on("click", ".borrarDestinatarioAccion",function(event){	
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-"); 
    var destinatarioId = idParsed[0];
    var estado = idParsed[1];
    
	var WebServiceDestinatarioAccion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getAccionDestinatario&destinatarioId='+destinatarioId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	WebServiceDestinatarioAccion = JSON.parse(WebServiceDestinatarioAccion);
    
    var objeto = new Object();
    objeto.id = destinatarioId;
    objeto.borrado= WebServiceDestinatarioAccion[0].borrado;

    
  	var info = JSON.stringify(objeto);
    $.ajax({
        url: "ajaxUpdate2?accion=borradoAccionDestinatario",
        type: 'POST',
        dataType: 'json',
        data: info,
        contentType: 'application/json',
        mimeType: 'application/json',
        success: function (data) {
        	
        	if(data.success == true){
            	if(estado == "b"){
	        		$("#botonBorradoDestinatarioAccion").remove();
	            	$("#mensajeBorradoDestinatarioAccion").html("");
	            	$("#mensajeBorradoDestinatarioAccion").html("<h3 class='text-center'>BORRADO EXITOSAMENTE!!</h3>");
	            }else{
	        		$("#botonRestaurarDestinatarioAccion").remove();
	            	$("#mensajeBorradoDestinatarioAccion").html("");
	            	$("#mensajeBorradoDestinatarioAccion").html("<h3 class='text-center'>RESTAURADO EXITOSAMENTE!!</h3>");
	        	}
        	}

        },

        error: function(data,status,er) {
        	
        	}
	 });
	
});

$("body").on("click", ".avanceCualitativo",function(event){
	var parametros = $(this).attr("parametros");
	var idParsed = parametros.split("-"); 
    var insLineaAccionId = idParsed[0];
    var lineaAccionId = idParsed[1];
    var institucionId = idParsed[2];
    var periodoId = idParsed[3];
    var optionTrimestre;
	
    if ( $("#modalAvanceCualitativo").length )
	{
		$("#modalAvanceCualitativo").remove();
	}
    if ( $("#modalEditarAvanceCualitativo").length )
	{
		$("#modalEditarAvanceCualitativo").remove();
	}
	if ( $("#modalBorrarAvanceCualitativo").length )
	{
		$("#modalBorrarAvanceCualitativo").remove();
	}	
	
	var lineaAccion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getLineaAccion',
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
		url:'/tablero/ajaxSelects2?action=getAccionCatalogo',
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
		url:'/tablero/ajaxSelects2?action=getInstitucion',
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
		url:'/tablero/ajaxSelects2?action=getPeriodo',
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
		url:'/tablero/ajaxSelects2?action=getUnidadMedida',
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
    	url:'/tablero/ajaxSelects?action=getDepartamento',
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
    	url:'/tablero/ajaxSelects?action=getDistrito',
      	type:'get',
      	dataType:'json',
      	async:false       
    }).responseText;
	distritos = JSON.parse(distritos);
	
	var accion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getAccion&lineaAccionId='+insLineaAccionId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	accion = JSON.parse(accion);
	
	var trimestre = $.ajax({
		url:'/tablero/ajaxSelects2?action=getTrimestre',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	trimestre = JSON.parse(trimestre);
	
	var nombreDepartamento;
	var nombreDistrito;
	var nombreAccionCatalogo;
	var cuerpoAccion = "";

	var optionAcciones = "";
	var lineasDeAccion= [];

	for(var a = 0; a < accion.length; a++)
	{		
		if(accion[a].borrado != true){
			if (lineasDeAccion.indexOf(accion[a].accionCatalogoId)<0){
				lineasDeAccion.push(accion[a].accionCatalogoId);
			}
		}
	}
	
	for(var z = 0; z < lineasDeAccion.length; z++)
	{
				
		for(var g = 0; g < catalogoAccion.length; g++)
		{
			if(lineasDeAccion[z] == catalogoAccion[g].id){
				optionAcciones+='<option value="'+catalogoAccion[g].id+'" >'+catalogoAccion[g].nombre+'</option>';
				}
		}		
		
	}
	
	for(var t = 0; t < trimestre.length; t++)
	{
		optionTrimestre+='<option value="'+trimestre[t].id+'" >'+trimestre[t].descripcion+' '+trimestre[t].anho+'</option>';
	}	
	
			
	var cuerpoModalAvanceCualitativo = "";

	cuerpoModalAvanceCualitativo =	'<div class="modal fade" id="modalAvanceCualitativo" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
						'	<div class="modal-dialog modal-lg" style="width:90%">'+
						'		<div class="modal-content" >'+
						'			<div class="modal-header">'+
						'		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
						'		        <h4 class="modal-title">Registrar Avance Cualitativo de '+nombreLineaAccion+' ('+nombreInstitucion+') - '+nombrePeriodo+'</h4>'+
						'				<input type="hidden" id="nombreInstitucion" value="'+nombreInstitucion+'"/>'+
						'			</div>'+
						'		    <div class="modal-body" id="accionCuerpo" >';
						
 	<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>		
	
	cuerpoModalAvanceCualitativo +='		      	<div class="row">'+
						'								<form role="form" id="formularioAvanceCualitativo">'+
						'		      		<div class="col-md-12">'+
						'						<div class="box box-warning">'+
						'		                	<div class="box-header with-border">'+
						'		                  		<h3 class="box-title">Avance Trimestral Cualitativo del Plan de Acción</h3>'+
						'               			</div>'+//fin box-heder
						'               			<div class="box-body">'+
						'									<div class="table-responsive">'+
						'										<table class="table table-hover">'+
						'											<tbody>'+
						'												<tr><td><div class="form-group"><label for="nombreAvanceCualitativo">Acciones</label><select id="nombreAvanceCualitativo" class="form-control">'+optionAcciones+'</select></div></td></tr>'+
						'												<tr><td><div class="form-group"><label for="trimestreAvanceCualitativo">Trimestre</label><select id="trimestreAvanceCualitativo" class="form-control">'+optionTrimestre+'</select></div></td></tr>'+
						'												<tr><td><div class="form-group"><label for="gestionesRealizadasAvanceCualitativo">Gestiones Realizadas</label><textarea class="form-control" rows="" placeholder="" id="gestionesRealizadasAvanceCualitativo" required></textarea></div></td></tr>'+
						' 												<tr><td><div class="form-group"><label for="logrosAlcanzadosAvanceCualitativo">Principales Logros Alcanzados</label><textarea class="form-control" rows="" placeholder="" id="logrosAlcanzadosAvanceCualitativo" required></textarea></div></td></tr>'+	
						'												<tr><td><div class="form-group"><label for="leccionesAprendidasAvanceCualitativo">Dificultades y Lecciones aprendidas</label><textarea class="form-control" rows="" placeholder="" id="leccionesAprendidasAvanceCualitativo" required></textarea></div></td></tr>'+
						' 												<tr><td><div class="form-group"><label for="objetivosAvanceCualitativo">Objetivos del Siguiente Trimestre</label><textarea class="form-control" rows="" placeholder="" id="objetivosAvanceCualitativo" required></textarea></div></td></tr>'+
						'											</tbody>'+							           
						'										</table>'+
						'									</div>'+							
						'								</form>'+
										
						'               			</div>'+//fin box-body
						'							<div class="modal-footer">'+
						'								<button type="submit" class="btn btn-success btn-sm guardarAvanceCualitatitvo" parametros = '+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'>Guardar Avance Cualitativo</button>'+
						'							</div>'+
						'                		</div>'+	
						'                	</div>'+
						'                	</form>'+
						'                </div>';											
	<%}%>	
 	
 //}
	cuerpoModalAvanceCualitativo +='	<div class="row">'+ 
						'		      		<div class="col-md-12">'+
						'						<div class="box box-warning">'+
						'		                	<div class="box-header with-border">'+
						'		                  		<h3 class="box-title">Avance Cualitativos Precargadas</h3>'+						
						'               			</div>'+//fin box-heder
						'               			<div class="box-body" id="cuerpoTablaAvanceCualitativo">'+

				
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
					
	$("#programacion").append(cuerpoModalAvanceCualitativo);
	$('#cuerpoTablaAvanceCualitativo').html("");

	var tablaAccion ='     			<div class="table-responsive">'+
	'	                				<table class="table table-hover table-bordered" id="dataTablesAvanceCualitativo">'+
	'	                					<thead>'+
	'	                						<tr class="active"><th class="text-center">Accion</th><th class="text-center">Trimestre</th><th class="text-center">Año</th><th class="text-center">Gestiones Realizadas</th><th class="text-center">Principales Logros Alcanzados</th><th class="text-center">Dificultades Lecciones Aprendidas</th><th class="text-center">Objetivos del Trimestre</th><th class="text-center">Administrar</th></tr>'+
	'	                					</thead>'+
	'	                					<tfoot>'+
	'	                						<tr><th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th></tr>'+
	'	                					</tfoot>'+
	'	                						<tbody id="tablaAvanceCualitativo">'+
	'	                						</tbody>'+
	'	                				</table>'+
	'	                			</div>';
	$('#cuerpoTablaAvanceCualitativo').append(tablaAccion);
	listaAvanceCualitativo(insLineaAccionId,lineaAccionId,institucionId,periodoId);	
	//$('#tablaAccionesPrecargadas').append(cuerpoAccion);
	$('#modalAvanceCualitativo').modal('show');	
	//$('#dataTablesAvanceCualitativo').DataTable();
	
});

$("body").on("click", ".guardarAvanceCualitatitvo",function(event){
	if (validarFormulario("formularioAvanceCualitativo",false,false)==true){
		event.stopPropagation();
		event.preventDefault(); 	
	
	var codigoRegistro = $(this).attr("parametros");
    var idParsed = codigoRegistro.split("-"); 
    var insLineaAccionId = idParsed[0];
    var lineaAccionId = idParsed[1];
    var institucionId = idParsed[2];
    var periodoId = idParsed[3];
	
	var nombre = $("#nombreAvanceCualitativo option:selected").val();
	var trimestre = $("#trimestreAvanceCualitativo option:selected").val();
	var gestionesRealizadas = document.getElementById("gestionesRealizadasAvanceCualitativo").value;
	var logrosAlcanzados = document.getElementById("logrosAlcanzadosAvanceCualitativo").value;
	var leccionesAprendidas = document.getElementById("leccionesAprendidasAvanceCualitativo").value;
	var objetivos = document.getElementById("objetivosAvanceCualitativo").value;
	
	$("#gestionesRealizadasAvanceCualitativo").val("");
	$("#logrosAlcanzadosAvanceCualitativo").val("");
	$("#leccionesAprendidasAvanceCualitativo").val("");
	$("#objetivosAvanceCualitativo").val("");

	var datos = new Object();
    
    datos.accionCatalogoId = nombre;
    datos.trimestreId = trimestre; 
    datos.insLineaAccionId = insLineaAccionId;
    datos.gestionesRealizadas = gestionesRealizadas;
    datos.principalesLogrosAlcanzados = logrosAlcanzados;
    datos.dificultadesLeccionesAprendidas = leccionesAprendidas;
    datos.objetivosTrimestre = objetivos;


  	var info = JSON.stringify(datos);
    $.ajax({
        url: "ajaxInserts2?accion=insAvanceCualitativo",
        type: 'POST',
        dataType: 'json',
        data: info,
        contentType: 'application/json',
        mimeType: 'application/json',
        success: function (data) {
        	if(data.success == true){
        		listaAvanceCualitativo(insLineaAccionId,lineaAccionId,institucionId,periodoId);
        	}else{
        		alert("ERROR");
        	}
        },
        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
        error: function(data,status,er) {
        	}
	 });

    }    
});	

function listaAvanceCualitativo(insLineaAccionId,lineaAccionId,institucionId,periodoId){
	
	var tablaAvanceCualitativo;
	var avanceCualitativo = $.ajax({
		url:'/tablero/ajaxSelects2?action=getAvanceCualitativo&insLineaAccionId='+insLineaAccionId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	avanceCualitativo = JSON.parse(avanceCualitativo);
	
	for(a = 0;a < avanceCualitativo.length; a++){
		
		var accionCatalogo = $.ajax({
			url:'/tablero/ajaxSelects2?action=getAccionCatalogo&catalogoAccionId='+avanceCualitativo[a].accionCatalogoId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		accionCatalogo = JSON.parse(accionCatalogo);
		
		var trimestre = $.ajax({
			url:'/tablero/ajaxSelects2?action=getTrimestre&trimestreId='+avanceCualitativo[a].trimestreId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		trimestre = JSON.parse(trimestre);
		
		if(onoff==true && avanceCualitativo[a].borrado == true){
			// pasa a la siguiente fila en el for ++
		}else{
			if(avanceCualitativo[a].borrado == true){
				<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1")){%>
					tablaAvanceCualitativo+='<tr id="avance'+a+'">'+
											'	<td id="avanceNombreAccion"><del>'+accionCatalogo[0].nombre+'</del></td>'+
											'	<td id="avanceDescTrimestre"><del>'+trimestre[0].descripcion+'</del></td>'+
											'	<td id="avanceAnhoTrimestre"><del>'+trimestre[0].anho+'</del></td>'+
											'	<td id="avanceGestionesRealizadas"><del>'+avanceCualitativo[a].gestionesRealizadas+'</del></td>'+
											'	<td id="avancePrincipalesLogrosAlcanzados"><del>'+avanceCualitativo[a].principalesLogrosAlcanzados+'</del></td>'+
											'	<td id="avanceDificultadesLeccionesAprendidas"><del>'+avanceCualitativo[a].dificultadesLeccionesAprendidas+'</del></td>'+
											'	<td id="avanceObjetivosTrimestre"><del>'+avanceCualitativo[a].objetivosTrimestre+'</del></td>'+
											'	<td class="text-center">'+
											'		<button type="button" class="btn btn-default btn-sm imprimirAvanceCualitativo" data-toggle="tooltip" data-placement="top" title="Descargar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+avanceCualitativo[a].id+'>'+
											'			<span class="glyphicon glyphicon-download-alt"></span>'+
											'		</button>'+
											'		<button type="button" class="btn btn-default btn-sm consultaEditarAvanceCualitativo" data-toggle="tooltip" data-placement="top" title="Editar Avance Cualitativo" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+avanceCualitativo[a].id+'>'+
											'			<span class="glyphicon glyphicon-pencil" ></span>'+
											'		</button>'+
											'		<button type="button" class="btn btn-default btn-sm consultaBorrarAvanceCualitativo" data-toggle="tooltip" data-placement="top" title="Borrar Avance Cualitativo" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+avanceCualitativo[a].id+'>'+
											'			<span class="glyphicon glyphicon-trash"></span>'+
											'		</button>'+
											'	</td>'+
											'</tr>';
					
				<%}%>
			}else{
				<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
				tablaAvanceCualitativo+='<tr id="avance'+a+'">'+
										'	<td id="avanceNombreAccion">'+accionCatalogo[0].nombre+'</td>'+
										'	<td id="avanceDescTrimestre">'+trimestre[0].descripcion+'</td>'+
										'	<td id="avanceAnhoTrimestre">'+trimestre[0].anho+'</td>'+
										'	<td id="avanceGestionesRealizadas">'+avanceCualitativo[a].gestionesRealizadas+'</td>'+
										'	<td id="avancePrincipalesLogrosAlcanzados">'+avanceCualitativo[a].principalesLogrosAlcanzados+'</td>'+
										'	<td id="avanceDificultadesLeccionesAprendidas">'+avanceCualitativo[a].dificultadesLeccionesAprendidas+'</td>'+
										'	<td id="avanceObjetivosTrimestre">'+avanceCualitativo[a].objetivosTrimestre+'</td>'+
										'	<td class="text-center">'+
										'		<button type="button" class="btn btn-default btn-sm imprimirAvanceCualitativo" data-toggle="tooltip" data-placement="top" title="Descargar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+avanceCualitativo[a].id+'>'+
										'			<span class="glyphicon glyphicon-download-alt"></span>'+
										'		</button>'+
										'		<button type="button" class="btn btn-default btn-sm consultaEditarAvanceCualitativo" data-toggle="tooltip" data-placement="top" title="Editar Avance Cualitativo" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+avanceCualitativo[a].id+'>'+
										'			<span class="glyphicon glyphicon-pencil" ></span>'+
										'		</button>'+
										'		<button type="button" class="btn btn-default btn-sm consultaBorrarAvanceCualitativo" data-toggle="tooltip" data-placement="top" title="Borrar Avance Cualitativo" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+avanceCualitativo[a].id+'>'+
										'			<span class="glyphicon glyphicon-trash"></span>'+
										'		</button>'+
										'	</td>'+
										'</tr>';	
				<%} if (attributes.get("role_id_tablero").toString().equals("3")){%>
				tablaAvanceCualitativo+='<tr id="avance'+a+'">'+
										'	<td id="avanceNombreAccion">'+accionCatalogo[0].nombre+'</td>'+
										'	<td id="avanceDescTrimestre">'+trimestre[0].descripcion+'</td>'+
										'	<td id="avanceAnhoTrimestre">'+trimestre[0].anho+'</td>'+
										'	<td id="avanceGestionesRealizadas">'+avanceCualitativo[a].gestionesRealizadas+'</td>'+
										'	<td id="avancePrincipalesLogrosAlcanzados">'+avanceCualitativo[a].principalesLogrosAlcanzados+'</td>'+
										'	<td id="avanceDificultadesLeccionesAprendidas">'+avanceCualitativo[a].dificultadesLeccionesAprendidas+'</td>'+
										'	<td id="avanceObjetivosTrimestre">'+avanceCualitativo[a].objetivosTrimestre+'</td>'+
										'	<td class="text-center"><button type="button" class="btn btn-default btn-sm imprimirAvanceCualitativo" data-toggle="tooltip" data-placement="top" title="Descargar" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'-'+avanceCualitativo[a].id+'>'+
										'			<span class="glyphicon glyphicon-download-alt"></span>'+
										'		</button>'+
										'	</td>'+
										'</tr>';	
				<%}%>
			}	
		}	
	}
	$('#cuerpoTablaAvanceCualitativo').html("");

	var tablaAccion ='     			<div class="table-responsive">'+
	'	                				<table class="table table-hover table-bordered" id="dataTablesAvanceCualitativo">'+
	'	                					<thead>'+
	'	                						<tr class="active"><th class="text-center">Accion</th><th class="text-center">Trimestre</th><th class="text-center">Año</th><th class="text-center">Gestiones Realizadas</th><th class="text-center">Principales Logros Alcanzados</th><th class="text-center">Dificultades Lecciones Aprendidas</th><th class="text-center">Objetivos del Trimestre</th><th class="text-center">Administrar</th></tr>'+
	'	                					</thead>'+
	'	                						<tbody id="tablaAvanceCualitativo">'+
	'	                						</tbody>'+
	'	                				</table>'+
	'	                			</div>';
	$('#cuerpoTablaAvanceCualitativo').append(tablaAccion);
	$('#tablaAvanceCualitativo').html("");
	$('#tablaAvanceCualitativo').append(tablaAvanceCualitativo);	
	//$('#dataTablesAvanceCualitativo').DataTable();
	$('#dataTablesAvanceCualitativo').DataTable( {
        dom: 'Bfrtip',
        buttons: [
                  {
                      extend: 'copy',
                      exportOptions: {
                  columns: [ 0, 1, 2, 3, 4, 5, 6 ]
              }
                  },
                  {
                      extend: 'csv',
                      exportOptions: {
                  columns: [ 0, 1, 2, 3, 4, 5, 6 ]
              }
                  },
                  {
                      extend: 'excel',
                      exportOptions: {
                  columns: [ 0, 1, 2, 3, 4, 5, 6 ]
              }
                  },
                  {
                      extend: 'pdf',
                      exportOptions: {
                  columns: [ 0, 1, 2, 3, 4, 5, 6 ]
              }
                  },
                  {
                      extend: 'print',
                      exportOptions: {
                  columns: [ 0, 1, 2, 3, 4, 5, 6 ]
              }
                  }
              ]
    } );
	
}

$("body").on("click", ".consultaEditarAvanceCualitativo",function(event){
	
	var parametros = $(this).attr("parametros");
	var idParsed = parametros.split("-"); 
    var insLineaAccionId = idParsed[0];
    var lineaAccionId = idParsed[1];
    var institucionId = idParsed[2];
    var periodoId = idParsed[3];
    var avanceCualitativoId = idParsed[4];// es el id de la tabla avance_cualitativo 
	
	if ( $("#modalAvanceCualitativo").length )
	{
		$("#modalAvanceCualitativo").remove();
	}	
	
	if ( $("#modalEditarAvanceCualitativo").length )
	{
		$("#modalEditarAvanceCualitativo").remove();
	}	
	if ( $("#modalBorrarAvanceCualitativo").length )
	{
		$("#modalBorrarAvanceCualitativo").remove();
	}	
	
	var accion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getAccion&lineaAccionId='+insLineaAccionId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	accion = JSON.parse(accion);
	
	var catalogoAccion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getAccionCatalogo',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	catalogoAccion = JSON.parse(catalogoAccion);
	
	var trimestre = $.ajax({
		url:'/tablero/ajaxSelects2?action=getTrimestre',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	trimestre = JSON.parse(trimestre);
	
	var avanceCualitativo = $.ajax({
		url:'/tablero/ajaxSelects2?action=getAvanceCualitativo&idAvanceCualitativo='+avanceCualitativoId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	avanceCualitativo = JSON.parse(avanceCualitativo);
	
	var optionAcciones = "";
	var optionTrimestre = "";
	var lineasDeAccion= [];

	for(var a = 0; a < accion.length; a++)
	{		
		if(accion[a].borrado != true){
			if (lineasDeAccion.indexOf(accion[a].accionCatalogoId)<0){
				lineasDeAccion.push(accion[a].accionCatalogoId);
			}
		}
	}
	
	for(var z = 0; z < lineasDeAccion.length; z++)
	{
				
		for(var g = 0; g < catalogoAccion.length; g++)
		{
			if(lineasDeAccion[z] == catalogoAccion[g].id){
				if(lineasDeAccion[z] == avanceCualitativo[0].accionCatalogoId){
					optionAcciones+='<option value="'+catalogoAccion[g].id+'" selected>'+catalogoAccion[g].nombre+'</option>';
				}else{
					optionAcciones+='<option value="'+catalogoAccion[g].id+'" >'+catalogoAccion[g].nombre+'</option>';
				}
			}
		}		
		
	}
	
	for(var t = 0; t < trimestre.length; t++)
	{
		if(trimestre[t].id == avanceCualitativo[0].trimestreId){
			optionTrimestre+='<option value="'+trimestre[t].id+'" selected>'+trimestre[t].descripcion+' '+trimestre[t].anho+'</option>';
		}else{
			optionTrimestre+='<option value="'+trimestre[t].id+'" >'+trimestre[t].descripcion+' '+trimestre[t].anho+'</option>';
		}
	}	
	
						
	var contenido = "";

	contenido +=		'<div class="modal fade" id="modalEditarAvanceCualitativo" data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
						' <form role="form" id="formularioAvanceCualitativo">'+
						'	<div class="modal-dialog modal-lg">'+
						'		<div class="modal-content" >'+
						'			<div class="modal-header">'+
						'		        <button type="button" class="close avanceCualitativo"  parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+' aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
						'		        <h4 class="modal-title" >Editar Avance Cualitativo</h4>'+
						'			</div>'+
						'		    <div class="modal-body" id="cuerpoModalAvanceCualitativo">'+
						'					<div class="table-responsive">'+
						'						<table class="table table-hover">'+
						'							<tbody>'+
						'								<tr><td><div class="form-group"><label for="nombreAvanceCualitativo">Acciones</label><select id="nombreAvanceCualitativo" class="form-control">'+optionAcciones+'</select></div></td></tr>'+
						'								<tr><td><div class="form-group"><label for="trimestreAvanceCualitativo">Trimestre</label><select id="trimestreAvanceCualitativo" class="form-control">'+optionTrimestre+'</select></div></td></tr>'+
						'								<tr><td><div class="form-group"><label for="gestionesRealizadasAvanceCualitativo">Gestiones Realizadas</label><textarea class="form-control" rows="" id="gestionesRealizadasAvanceCualitativo" required>'+avanceCualitativo[0].gestionesRealizadas+'</textarea></div></td></tr>'+
						' 								<tr><td><div class="form-group"><label for="logrosAlcanzadosAvanceCualitativo">Principales Logros Alcanzados</label><textarea class="form-control" rows="" id="logrosAlcanzadosAvanceCualitativo" required>'+avanceCualitativo[0].principalesLogrosAlcanzados+'</textarea></div></td></tr>'+	
						'								<tr><td><div class="form-group"><label for="leccionesAprendidasAvanceCualitativo">Dificultades y Lecciones aprendidas</label><textarea class="form-control" rows="" id="leccionesAprendidasAvanceCualitativo" required>'+avanceCualitativo[0].dificultadesLeccionesAprendidas+'</textarea></div></td></tr>'+
						' 								<tr><td><div class="form-group"><label for="objetivosAvanceCualitativo">Objetivos del Siguiente Trimestre</label><textarea class="form-control" rows="" id="objetivosAvanceCualitativo" required>'+avanceCualitativo[0].objetivosTrimestre+'</textarea></div></td></tr>'+
						'							</tbody>'+							           
						'						</table>'+
						'					</div>'+
						'		    </div>'+
						'			<div class="modal-footer">'+
						' 				<button type="submit" class="btn btn-success btn-sm editarAvanceCualitativo" id="botonGuardarAvanceCualitativo" parametros='+avanceCualitativo[0].id+'>Guardar Cambios</button>'+
						' 				<button type="button" class="btn btn-success btn-sm avanceCualitativo" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+' >Cerrar</button>'+						
						'			</div>'+
						'		</div>'+ 
						'	</div>'+
						' </form>'+	
						'</div>';								
						
	$("#programacion").append(contenido);
	$('#modalEditarAvanceCualitativo').modal('show');
	
});

$("body").on("click", ".editarAvanceCualitativo",function(event){
	if(validarFormulario("formularioAvanceCualitativo",false,false)==true){
		event.stopPropagation();
		event.preventDefault(); 
	
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");                                                            
	var avanceCualitativoId = idParsed[0];
	//Las siguentes variables se utiliza en esta funcion para redibujar el modal anterior

	var accionCatalogo = $("#nombreAvanceCualitativo option:selected").val();
	var trimestre = $("#trimestreAvanceCualitativo option:selected").val();
	var gestionesRealizadas = $("#gestionesRealizadasAvanceCualitativo").val();
	var logrosAlcanzados = $("#logrosAlcanzadosAvanceCualitativo").val();
	var dificultades = $("#leccionesAprendidasAvanceCualitativo").val();
	var objetivos = $("#objetivosAvanceCualitativo").val();

	
	var objeto = new Object();
	
	objeto.id = avanceCualitativoId;
	objeto.accionCatalogoId = accionCatalogo;
	objeto.trimestreId = trimestre;
	objeto.gestionesRealizadas = gestionesRealizadas;
	objeto.principalesLogrosAlcanzados = logrosAlcanzados;
	objeto.dificultadesLeccionesAprendidas = dificultades;
	objeto.objetivosTrimestre = objetivos;

	
   	var info = JSON.stringify(objeto);
    $.ajax({
        url: "ajaxUpdate2?accion=actAvanceCualitativo",
        type: 'POST',
        dataType: 'json',
        data: info,
        contentType: 'application/json',
        mimeType: 'application/json',
        success: function (data) {
        	if(data.success == true)
        	{
        		$("#botonGuardarAvanceCualitativo").remove();
            	$("#cuerpoModalAvanceCualitativo").html("");
            	$("#cuerpoModalAvanceCualitativo").html("<h3 class='text-center'>Ud ha actualizado exitosamente!!</h3>");        		
        	}else{
        		$("#botonGuardarAvanceCualitativo").remove();
            	$("#cuerpoModalAvanceCualitativo").html("");
            	$("#cuerpoModalAvanceCualitativo").html("<h3 class='text-center'>ERROR!!</h3>");  
        	}
        	
        	},
        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
        error: function(data,status,er) {
        	
        	}
	 }); 
	}
});

$("body").on("click", ".consultaBorrarAvanceCualitativo",function(event){
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");                                                            
	
	//Las siguentes variables se utiliza en esta funcion para redibujar el modal anterior
	var insLineaAccionId = idParsed[0];
	var lineaAccionId = idParsed[1];
	var institucionId = idParsed[2];
	var periodoId = idParsed[3];
	var avanceCualitativoId = idParsed[4];

	if ( $("#modalAvanceCualitativo").length )
	{
		$("#modalAvanceCualitativo").remove();
	}	
	
	if ( $("#modalEditarAvanceCualitativo").length )
	{
		$("#modalEditarAvanceCualitativo").remove();
	}	
	if ( $("#modalBorrarAvanceCualitativo").length )
	{
		$("#modalBorrarAvanceCualitativo").remove();
	}	
	
	var webServiceAvanceCualitativo = $.ajax({
		url:'/tablero/ajaxSelects2?action=getAvanceCualitativo&idAvanceCualitativo='+avanceCualitativoId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServiceAvanceCualitativo = JSON.parse(webServiceAvanceCualitativo);
	
	var contenido = "";

	contenido =			'<div class="modal fade" id="modalBorrarAvanceCualitativo"  data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
						'	<div class="modal-dialog modal-lg">'+
						'		<div class="modal-content" >'+
						'			<div class="modal-header">'+
						'		        <button type="button" class="close avanceCualitativo"  parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+' ><span aria-hidden="true">&times;</span></button>'+
						'		        <h4 class="modal-title" >Borrar - Restaurar Avance Cualitativo</h4>'+
						'			</div>'+
						'		    <div class="modal-body">'+
						'				<div id="mensajeBorradoAvanceCualitativo"></div>'+
						'		    </div>'+
						'			<div class="modal-footer" id="agregarBotonBorradoAvanceCualitativo">'+
						'			</div>'+
						'		</div>'+ 
						'	</div>'+
						'</div>';
						
		$("#programacion").append(contenido);
		
		if(webServiceAvanceCualitativo[0].borrado == true){
			$("#mensajeBorradoAvanceCualitativo").html("");
			$("#mensajeBorradoAvanceCualitativo").append('<h3 class="text-center">Ud. esta seguro que desea RESTABLACER este registro</h3>');
			$("#agregarBotonBorradoAvanceCualitativo").html("");
			$("#agregarBotonBorradoAvanceCualitativo").append('<button type="button" class="btn btn-success btn-sm borrarAvanceCualitativo" id="botonRestaurarAvanceCualitativo" parametros='+avanceCualitativoId+'-r>Restaurar Avance Cualitativo</button>');
			$("#agregarBotonBorradoAvanceCualitativo").append('<button type="button" class="btn btn-success btn-sm avanceCualitativo" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'>Cerrar</button>');
		}else{
			$("#mensajeBorradoAvanceCualitativo").html("");
			$("#mensajeBorradoAvanceCualitativo").append('<h3 class="text-center">Ud. esta seguro que desea BORRAR este registro</h3');
			$("#agregarBotonBorradoAvanceCualitativo").html("");
			$("#agregarBotonBorradoAvanceCualitativo").append('<button type="button" class="btn btn-danger btn-sm borrarAvanceCualitativo" id="botonBorradoAvanceCualitativo" parametros='+avanceCualitativoId+'-b>Borrar Avance Cualitativo</button>');
			$("#agregarBotonBorradoAvanceCualitativo").append('<button type="button" class="btn btn-success btn-sm avanceCualitativo" parametros='+insLineaAccionId+'-'+lineaAccionId+'-'+institucionId+'-'+periodoId+'>Cerrar</button>');
		}
		
		$('#modalBorrarAvanceCualitativo').modal('show');
			
});

$("body").on("click", ".borrarAvanceCualitativo",function(event){	
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-"); 
    var avanceCualitativoId = idParsed[0];
    var estado = idParsed[1];
    
	var webServiceAvanceCualitativo = $.ajax({
		url:'/tablero/ajaxSelects2?action=getAvanceCualitativo&idAvanceCualitativo='+avanceCualitativoId,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	webServiceAvanceCualitativo = JSON.parse(webServiceAvanceCualitativo);
    
    var objeto = new Object();
    objeto.id = avanceCualitativoId;
    objeto.borrado= webServiceAvanceCualitativo[0].borrado;

    
  	var info = JSON.stringify(objeto);
    $.ajax({
        url: "ajaxUpdate2?accion=borradoAvanceCualitativo",
        type: 'POST',
        dataType: 'json',
        data: info,
        contentType: 'application/json',
        mimeType: 'application/json',
        success: function (data) {
        	
        	if(data.success == true){
            	if(estado == "b"){
	        		$("#botonBorradoAvanceCualitativo").remove();
	            	$("#mensajeBorradoAvanceCualitativo").html("");
	            	$("#mensajeBorradoAvanceCualitativo").html("<h3 class='text-center'>BORRADO EXITOSAMENTE!!</h3>");
	            }else{
	        		$("#botonRestaurarAvanceCualitativo").remove();
	            	$("#mensajeBorradoAvanceCualitativo").html("");
	            	$("#mensajeBorradoAvanceCualitativo").html("<h3 class='text-center'>RESTAURADO EXITOSAMENTE!!</h3>");
	        	}
        	}

        },

        error: function(data,status,er) {
        	
        	}
	 });
	
});

//Imprime todos los avances de una institución
$("body").on("click", ".imprimirAvanceCualitativoInstitucion",function(event){
    
    /* var institucion = $.ajax({
		url:'ajaxSelects2?action=getInstitucion&unidadResponsable='+usr_unr_id,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	institucion = JSON.parse(institucion);  */   
	
	var nombre_archivo = 'Avance_cualitativo_institucional.pdf';
	
	var xhr = new XMLHttpRequest();
	
	var url = 'CrearPdfServlet';
	var params = "nombreArchivo="+nombre_archivo+"&nivelId="+usr_nivel_id+"&entidadId="+usr_entidad_id+"&unidadResponsableId="+usr_unr_id;
	
	xhr.open("POST", url, true);
	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded','charset=UTF-8');	
	
	xhr.responseType = 'arraybuffer';
	xhr.onload = function () {
	    if (this.status === 200) {
	        var filename = "";
	        var disposition = xhr.getResponseHeader('Content-Disposition');
	        if (disposition && disposition.indexOf('attachment') !== -1) {
	            var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
	            var matches = filenameRegex.exec(disposition);
	            if (matches != null && matches[1]) filename = matches[1].replace(/['"]/g, '');
	        }
	        var type = xhr.getResponseHeader('Content-Type');

	        var blob = new Blob([this.response], { type: type });
	        if (typeof window.navigator.msSaveBlob !== 'undefined') {
	            // IE workaround for "HTML7007: One or more blob URLs were revoked by closing the blob for which they were created. These URLs will no longer resolve as the data backing the URL has been freed."
	            window.navigator.msSaveBlob(blob, filename);
	        } else {
	            var URL = window.URL || window.webkitURL;
	            var downloadUrl = URL.createObjectURL(blob);

	            if (filename) {
	                // use HTML5 a[download] attribute to specify filename
	                var a = document.createElement("a");
	                // safari doesn't support this yet
	                if (typeof a.download === 'undefined') {
	                    window.location = downloadUrl;
	                } else {
	                    a.href = downloadUrl;
	                    a.download = filename;
	                    document.body.appendChild(a);
	                    a.click();
	                }
	            } else {
	                window.location = downloadUrl;
	            }

	            setTimeout(function () { URL.revokeObjectURL(downloadUrl); }, 100); // cleanup
	        }
	    }
	};
	
	xhr.send(params);
            
});


$("body").on("click", ".imprimirAvanceCualitativo",function(event){
	
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");
    var periodo = idParsed[3];
    var avanceCualitativoId = idParsed[4];    		
		
	var nombre_archivo = 'Avance_cualitativo.pdf';
	//var nombre_institucion = $("#nombreInstitucion").val();	  
	
	var xhr = new XMLHttpRequest();
	
	var url = 'CrearPdfServlet';
	var params = "idAvanceCualitativo="+avanceCualitativoId+"&nombreArchivo="+nombre_archivo+"&nivelId="+usr_nivel_id+"&entidadId="+usr_entidad_id+"&unidadResponsableId="+usr_unr_id;
	
	xhr.open("POST", url, true);
	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded','charset=UTF-8');	
	
	xhr.responseType = 'arraybuffer';
	xhr.onload = function () {
	    if (this.status === 200) {
	        var filename = "";
	        var disposition = xhr.getResponseHeader('Content-Disposition');
	        if (disposition && disposition.indexOf('attachment') !== -1) {
	            var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
	            var matches = filenameRegex.exec(disposition);
	            if (matches != null && matches[1]) filename = matches[1].replace(/['"]/g, '');
	        }
	        var type = xhr.getResponseHeader('Content-Type');

	        var blob = new Blob([this.response], { type: type });
	        if (typeof window.navigator.msSaveBlob !== 'undefined') {
	            // IE workaround for "HTML7007: One or more blob URLs were revoked by closing the blob for which they were created. These URLs will no longer resolve as the data backing the URL has been freed."
	            window.navigator.msSaveBlob(blob, filename);
	        } else {
	            var URL = window.URL || window.webkitURL;
	            var downloadUrl = URL.createObjectURL(blob);

	            if (filename) {
	                // use HTML5 a[download] attribute to specify filename
	                var a = document.createElement("a");
	                // safari doesn't support this yet
	                if (typeof a.download === 'undefined') {
	                    window.location = downloadUrl;
	                } else {
	                    a.href = downloadUrl;
	                    a.download = filename;
	                    document.body.appendChild(a);
	                    a.click();
	                }
	            } else {
	                window.location = downloadUrl;
	            }

	            setTimeout(function () { URL.revokeObjectURL(downloadUrl); }, 100); // cleanup
	        }
	    }
	};
	
	xhr.send(params);						 	   
    
    $("#paraImpresiones").hide();
});

</script>

<div id="paraImpresiones" class="container" style="display: none">
	<div id="contenedorImpresion" class="content">
		<h3 class="text-center">
			<u>SPR-PA-03: Informe Cualitativo de Avance Trimestral</u>
		</h3>
		<p>
			<strong>Institución</strong> <span id="impresionInstitucion"></span>
		</p>
		<p>
			<strong>Acción </strong><span id="impresionAccionesTrimestre"></span>
		</p>
		<p>
			<strong>Periodo </strong><span id="impresionTrimestreAño"></span>
		</p>
		<strong>Gestiones Realizadas </strong>
		<p id="impresionGestionesRealizadas"></p>
		<strong>Principales Logros Alcanzados </strong>
		<p id="impresionLogrosAlcanzados"></p>
		<strong>Dificultades y Lecciones aprendidas </strong>
		<p id="impresionLeccionesAprendidas"></p>
		<strong>Objetivos del Siguiente Trimestre </strong>
		<p id="impresionSiguienteTrimestre"></p>
	</div>
</div>
<script>
	$("paraImpresiones").hide();
	</script>
