
function numeroConComa(x) {
	if (isNaN(x)){
		return 0;
	}else if ( x == "Infinity"){
		return "-"
	}else{
		//return x.toString().replace(".", ",").replace(/\B(?=(\d{3})+(?!\d))/g, ".");
		return x.toString().replace(".", ",").replace(/(\d)(?:(?=\d+(?=[^\d.]))(?=(?:[0-9]{3})+\b)|(?=\d+(?=\.))(?=(?:[0-9]{3})+(?=\.)))/g, "$1.");
	}
}


			
function renderLineas(periodoSeleccionado, etiquetaSeleccionado, institucionSeleccionado){
	var contenidoEnRow="";
	var contenidoEnRowTemp="";				
	$('#tablaLineasProgramacionAvance').dataTable().fnDestroy();
	
	var condicion="";
	if(periodoSeleccionado!=null)condicion = "&periodoId="+periodoSeleccionado;
	if(institucionSeleccionado!=null && institucionSeleccionado!=0)condicion += "&institucion_id="+institucionSeleccionado;
	if(etiquetaSeleccionado!=null && etiquetaSeleccionado!=0)condicion += "&etiquetaId="+etiquetaSeleccionado;

	
	contenidoEnRowTemp='<div class="row">'+
		'<div class="col-md-12">'+
          '<div class="box" height="1000px">'+
            '<div class="box-header with-border" height="1000px">'+
              '<h3 class="box-title" id="tituloTipoPrograma">'+
              '</h3> '+
              '<div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
              '</div>'+
            '</div>'+
            '<div class="box-body" >'+
            	'<div class="table-responsive">'+
          			'<table class="table table-striped table-bordered table-hover"  id="tablaLineasProgramacionAvance">'+
          				'<thead>'+
		          			'<tr><th class="text-center">Periodo</th>'+
		          			  	'<th class="text-center">InstitucionId</th>'+
		          			  	'<th class="text-center">InstitucionNombre</th>'+
		          			  	'<th class="text-center">InstitucionSigla</th>'+
		          			  	'<th class="text-center">InsLineaAccionId</th>'+
		          			  	'<th class="text-center">LineaAccionId</th>'+
		          			  	'<th class="text-center">LineaAccionNombre</th>'+
		          			  	'<th class="text-center">LineaAccionUnidadId</th>'+
		          			  	'<th class="text-center">LineaAccionUnidad</th>'+
		          			  	'<th class="text-center">AccionId</th>'+
		          			  	'<th class="text-center">AccionNombre</th>'+
		          			  	'<th class="text-center">AccionUnidadId</th>'+
		          			  	'<th class="text-center">AccionUnidad</th>'+
		          			  	'<th class="text-center">AccionPeso</th>'+
		          			  	'<th class="text-center">AccionDepartamentoId</th>'+
		          			  	'<th class="text-center">AccionDepartamento</th>'+
		          			  	'<th class="text-center">AccionDistritoId</th>'+
		          			  	'<th class="text-center">AccionDistrito</th>'+
		          			  	'<th class="text-center">CronogramaId</th>'+
		          			  	'<th class="text-center">Cronograma</th>'+
		          			  	'<th class="text-center">CronogramaUnidadId</th>'+
		          			  	'<th class="text-center">CronogramaUnidad</th>'+
		          			  	'<th class="text-center">CronogramaPeso</th>'+
		          			  	'<th class="text-center">CronogramaProporcion</th>'+
		          			  	'<th class="text-center">CronogramaTipo</th>'+
		          			  	'<th class="text-center">CronogramaAcumulable</th>'+
		          			  	'<th class="text-center">CronogramaProducto</th>'+
		          			  	'<th class="text-center">FechaEntrega</th>'+
		          			  	'<th class="text-center">Mes</th>'+
		          			  	'<th class="text-center">ProgramacionId</th>'+
		          			  	'<th class="text-center">ProgramacionCantidad</th>'+
		          			  	'<th class="text-center">ProgramacionUsuario</th>'+
		          			  	'<th class="text-center">ProgramacionActualizacion</th>'+
		          			  	'<th class="text-center">AvanceId</th>'+
		          			  	'<th class="text-center">AvanceDepartamento</th>'+
		          			  	'<th class="text-center">AvanceDistrito</th>'+
		          			  	'<th class="text-center">AvanceCantidad</th>'+
		          			  	'<th class="text-center">AvanceJustificacion</th>'+
		          			  	'<th class="text-center">AvanceUsuario</th>'+
		          			  	'<th class="text-center">AvanceActualizacion</th>'+
		          			  	'<th class="text-center">AvanceCostos</th>'+
		          			  	'<th class="text-center">AvanceDestinatarios</th>'+
		          			  	'<th class="text-center">EvidenciaUrlWeb</th>'+
		          			  	'<th class="text-center">EvidenciaUrlDoc</th>'+
		          			  	'<th class="text-center">Etiqueta</th>'+
		          			'</tr>'+
		          		'</thead>'+
		          		'<tbody id="cuerpoTabla">'+
		          		'</tbody>'+	          	 			
  					'</table>'+
  				'</div>'+
            '</div>'+
		   '</div>'+
		   '</div>'+
		   '</div>';

		contenidoEnRow+=contenidoEnRowTemp;
		contenidoEnRowTemp=""; 

	$("#programacion").html(contenidoEnRow);
	obtenerLineasProgramacionAvance(condicion);
}

function obtenerLineasProgramacionAvance(condition){
	
	var contenidoLineas="";
	
	var lineasProgramacionAvance = $.ajax({
		url: '/tablero/ajaxSelects?action=getAccionesAvancesMensual'+condition,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	lineasProgramacionAvance = JSON.parse(lineasProgramacionAvance);
	
	for(var x = 0; x < lineasProgramacionAvance.length; x++){
		contenidoLineas += "<tr><td>"+lineasProgramacionAvance[x].periodo+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].institucion_id+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].institucion_nombre+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].institucion_sigla+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].instancia_linea_accion_id+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].catalogo_linea_accion_id+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].linea_accion_nombre+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].linea_accion_unidad_id+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].linea_accion_unidad_nombre+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].catalogo_accion_id+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].accion_nombre+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].accion_unidad_id+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].accion_unidad_nombre+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].accion_peso+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].accion_departamento_id+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].accion_departamento_nombre+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].accion_distrito_id+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].accion_distrito_nombre+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].cronograma_id+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].cronograma_nombre+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].cronograma_unidad_id+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].cronograma_unidad_nombre+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].cronograma_peso+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].cronograma_proporcion+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].cronograma_tipo_nombre+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].cronograma_acumulable+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].cronograma_producto_nombre+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].fecha_entrega+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].mes_entrega+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].programacion_id+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].programacion_cantidad+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].programacion_usuario+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].programacion_actualizacion+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].avance_id+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].avance_departamento_nombre+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].avance_distrito+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].avance_cantidad+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].avance_justificacion+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].avance_usuario+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].avance_actualizacion+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].avance_inversion+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].avance_destinatarios+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].evidencia_web+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].evidencia_doc+"</td>" +
						       "<td>"+lineasProgramacionAvance[x].etiqueta+"</td></tr>";              	
	}
	
	$("#cuerpoTabla").append(contenidoLineas);
	
	$("#tablaLineasProgramacionAvance").DataTable(
			{
				        dom: 'Bfrtip',
				        buttons: [
				                    {
				                        extend: 'copy'
				                    },
				                    {
				                        extend: 'csv'
				                    },
				                    {
				                        extend: 'excel'
				                    },
				                    {
				                        extend: 'pdf'
				                    },
				                    {
				                        extend: 'print'
				                    }
				                ],
				        "search": {
				            "regex": true
						},
//						  "pageLength": 150,
//						  ordering: false
			}
	);	
}

function getPeriodo(periodoActual){

	var periodo = $.ajax({
		url:'/tablero/ajaxSelects2?action=getPeriodo',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	periodo = JSON.parse(periodo);
	
	var etiqueta = $.ajax({
		url:'/tablero/ajaxSelects2?action=getEtiqueta',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	etiqueta = JSON.parse(etiqueta);
	
	var usuarioEtiqueta = $.ajax({
		url:'/tablero/ajaxSelects2?action=getUsuarioEtiqueta',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	usuarioEtiqueta = JSON.parse(usuarioEtiqueta);

	var optionPeriodo;
	var optionVersion;
	var optionEtiqueta;

	
	for(p = 0;p<periodo.length; p++){
		if(periodo[p].id >= 2014){
			if(periodo[p].id == 2017){
				optionPeriodo+='<option value="'+periodo[p].id+'" selected>'+periodo[p].nombre+'</option>';
			}else{
				optionPeriodo+='<option value="'+periodo[p].id+'" >'+periodo[p].nombre+'</option>';
			}
		}
	}
		
	optionEtiqueta+='<option value="0" selected>Todos</option>';

	if(usuarioEtiqueta.length > 0){
		for(var d = 0; d<usuarioEtiqueta.length; d++){
			for(var e = 0; e<etiqueta.length; e++){
				 if(usuarioEtiqueta[d].borrado != true && usuarioEtiqueta[d].etiqueta_id == etiqueta[e].id){
					optionEtiqueta+='<option value="'+etiqueta[e].id+'">'+etiqueta[e].nombre+'</option>';
				}
			}
		}
	}	
						
	$('#periodoSeleccion').html(optionPeriodo);
	$('#etiquetaSeleccion').append(optionEtiqueta);						

}

function ObtenerInstitucion(){

	var institucion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getInstitucion',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	institucion = JSON.parse(institucion);

	var optionInstitucion;
	
	for(p = 0;p<institucion.length; p++){
		optionInstitucion+='<option value="'+institucion[p].id+'" >'+institucion[p].sigla+'</option>';
	}
	
						
	$('#selectorDeInstitucion').append(optionInstitucion);
}	
	
