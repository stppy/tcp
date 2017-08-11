
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


			
function renderLineas(condition){
	var contenidoEnRow="";
	var contenidoEnRowTemp="";				
	$('#tablaLineasProgramacionAvance').dataTable().fnDestroy();

	
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
		          			'<tr><th class="text-center">Línea de Acción Id</th>'+
		          			  	'<th class="text-center">Linea Acción Nombre</th>'+
		          			  	'<th class="text-center">Linea Acción U. Medida Id</th>'+
		          			  	'<th class="text-center">Linea Acción U. Medida</th>'+
		          			  	'<th class="text-center">Acción Id</th>'+
		          			  	'<th class="text-center">Acción Nombre</th>'+
		          			  	'<th class="text-center">Acción Depto Id</th>'+
		          			  	'<th class="text-center">Acción Depto Nombre</th>'+
		          			  	'<th class="text-center">Acción Distrito Id</th>'+
		          			  	'<th class="text-center">Acción Distrito Nombre</th>'+
		          			  	'<th class="text-center">AcciónFechaInicio</th>'+
		          			  	'<th class="text-center">AcciónFechaFin</th>'+
		          			  	'<th class="text-center">InstituciónId</th>'+
		          			  	'<th class="text-center">Institución</th>'+
		          			  	'<th class="text-center">CantidadProgramado</th>'+
		          			  	'<th class="text-center">CantidadEjecutado</th>'+
		          			  	'<th class="text-center">AcciónUnidadMedida</th>'+
		          			  	'<th class="text-center">PeriodoId</th>'+
		          			  	'<th class="text-center">ActividadNombre</th>'+
		          			  	'<th class="text-center">ActividadAcumulable</th>'+
		          			  	'<th class="text-center">HitoTipoId</th>'+
		          			  	'<th class="text-center">HitoTipoNombre</th>'+
		          			  	'<th class="text-center">ActividadUnidadMedidaId</th>'+
		          			  	'<th class="text-center">EtiquetaId</th>'+
		          			  	'<th class="text-center">EtiquetaNombre</th>'+
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
	obtenerLineasProgramacionAvance(condition);
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
		contenidoLineas += "<tr><td>"+lineasProgramacionAvance[x].linea_accion_id+"</td><td>"+lineasProgramacionAvance[x].linea_accion_nombre+"</td><td>"+lineasProgramacionAvance[x].linea_accion_um+"</td><td>"+lineasProgramacionAvance[x].unidad_medida_linea_accion+"</td><td>"+lineasProgramacionAvance[x].accion_id+"</td><td>"+lineasProgramacionAvance[x].accion_catalogo_nombre+"</td><td>"+lineasProgramacionAvance[x].accion_departamento_id+"</td><td>"+lineasProgramacionAvance[x].accion_depto_nombre+"</td><td>"+lineasProgramacionAvance[x].accion_distrito_id+"</td><td>"+lineasProgramacionAvance[x].accion_dist_nombre+"</td><td>"+lineasProgramacionAvance[x].accion_fecha_inicio+"</td><td>"+lineasProgramacionAvance[x].accion_fecha_fin+"</td><td>"+lineasProgramacionAvance[x].institucion_id+"</td><td>"+lineasProgramacionAvance[x].institucion+"</td><td>"+lineasProgramacionAvance[x].cantidad_programado+"</td><td>"+lineasProgramacionAvance[x].cantidad_ejecutado+"</td><td>"+lineasProgramacionAvance[x].accion_unidad_medida+"</td><td>"+lineasProgramacionAvance[x].periodo_id+"</td><td>"+lineasProgramacionAvance[x].actividad_nombre+"</td><td>"+lineasProgramacionAvance[x].actividad_acumulable+"</td><td>"+lineasProgramacionAvance[x].hito_tipo_id+"</td><td>"+lineasProgramacionAvance[x].hito_tipo_nombre+"</td><td>"+lineasProgramacionAvance[x].actividad_unidad_medida_id+"</td><td>"+lineasProgramacionAvance[x].etiqueta_id+"</td><td>"+lineasProgramacionAvance[x].etiqueta_nombre+"</td></tr>";              	
	}
	
	$("#cuerpoTabla").append(contenidoLineas);
	
	$("#tablaLineasProgramacionAvance").DataTable(
			{
				        dom: 'Bfrtip',
				        buttons: [
				                    {
				                        extend: 'copy',
				                        exportOptions: {
				                    columns: [ 0, 1 ]
				                }
				                    },
				                    {
				                        extend: 'csv',
				                        exportOptions: {
				                    columns: [ 0, 1 ]
				                }
				                    },
				                    {
				                        extend: 'excel',
				                        exportOptions: {
				                    columns: [ 0, 1 ]
				                }
				                    },
				                    {
				                        extend: 'pdf',
				                        exportOptions: {
				                    columns: [ 0, 1]
				                }
				                    },
				                    {
				                        extend: 'print',
				                        exportOptions: {
				                    columns: [ 0, 1 ]
				                }
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

function getPeriodo(periodo){

	var periodo = $.ajax({
		url:'/tablero/ajaxSelects2?action=getPeriodo',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	periodo = JSON.parse(periodo);

	var optionPeriodo;
	
	for(p = 0;p<periodo.length; p++){
		if(periodo[p].id >= 2014){
			if(periodo[p].id == 2017){
				optionPeriodo+='<option value="'+periodo[p].id+'" selected>'+periodo[p].nombre+'</option>';
			}else{
				optionPeriodo+='<option value="'+periodo[p].id+'" >'+periodo[p].nombre+'</option>';
			}
		}
	}
	
						
	$('#periodoSeleccion').html(optionPeriodo);
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
	
