
function numeroConComa(x) {
	if (isNaN(x)){
		return 0;
	}else if ( x == "Infinity"){
		return "-"
	}else{
		return x.toString().replace(".", ",").replace(/(\d)(?:(?=\d+(?=[^\d.]))(?=(?:[0-9]{3})+\b)|(?=\d+(?=\.))(?=(?:[0-9]{3})+(?=\.)))/g, "$1.");
	}
}

function orden(a,b) {             
	if (a.orden < b.orden)
		return -1;
	if (a.orden > b.orden)
		return 1;
	return 0;
}

function lineaAccionOrden(a,b) {             
	if (a.lineaAccionOrden < b.lineaAccionOrden)
		return -1;
	if (a.lineaAccionOrden > b.lineaAccionOrden)
		return 1;
	return 0;
}											
			
function renderLineasEstrategicas(periodo){
	var contenidoEnRow="";
	var contenidoEnRowTemp="";				
	
	var lineasEstrategicas = $.ajax({
		url:'/tablero/public/ajaxSelects4?action=getLineaEstrategica',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	lineasEstrategicas = JSON.parse(lineasEstrategicas);
	lineasEstrategicas=lineasEstrategicas.sort(orden);
		
	var lineasProgramadas = $.ajax({
		url: '/tablero/public/ajaxSelects4?action=getResumenLineasAccionProgramacion&periodoId='+periodo,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	lineasProgramadas = JSON.parse(lineasProgramadas);
	lineasProgramadas=lineasProgramadas.sort(lineaAccionOrden);
	
	var instituciones = $.ajax({
		url:'/tablero/public/ajaxSelects4?action=getInstitucion',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;		
	instituciones=JSON.parse(instituciones);
	instituciones=instituciones.sort(orden); 
	
	for(var l=0; l<lineasEstrategicas.length;l++){
		var lineasDeEstrategia="";
		lineasDeEstrategia=renderAccion(lineasEstrategicas[l].id, lineasProgramadas, instituciones, periodo)
		contenidoEnRowTemp='<div class="row">'+
			'<div class="col-md-12">'+
	          '<div class="box" height="1000px">'+
	            '<div class="box-header with-border" height="1000px">'+
	              '<h3 class="box-title" id="tituloTipoPrograma">'+
	              		lineasEstrategicas[l].nombre+
	              '</h3> '+
	              '<div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
	              '</div>'+
	            '</div>'+
	            '<div class="box-body" >'+
	            	'<div class="table-responsive">'+
	          			'<table class="table table-striped table-bordered table-hover tablaLineasPorInstitucion">'+
	          				'<thead>'+
			          			'<tr><th rowspan="3" class="text-center" style="vertical-align: middle;">Línea de Acción</th>'+
			          			  	'<th rowspan="3" class="text-center" style="vertical-align: middle;">Unidad de Medida</th>'+
			          			  	'<th colspan="5" class="text-center">Plan de Acción '+ periodo + '</th>'+
			          			  	'<th colspan="5" class="text-center">Ejecución a la Fecha</th></tr>'+
			          			'<tr><th colspan="3" class="text-center">Meta</th>'+
			          			  	'<th rowspan="2" class="text-center" style="vertical-align: middle;">Destinatarios</th>'+
			          			  	'<th rowspan="2" class="text-center" style="vertical-align: middle;">Inversión (en millones G.)</th>'+
			          			  	'<th colspan="3" class="text-center">Meta</th>'+
			          			  	'<th rowspan="2" class="text-center" style="vertical-align: middle;">Destinatarios</th>'+
			          			  	'<th rowspan="2" class="text-center" style="vertical-align: middle;">Inversión (en millones G.)</th></tr>'+
			          			'<tr><th class="text-center">Aprobada</th>'+
			          			  	'<th class="text-center">Programada</th>'+
			          			  	'<th class="text-center">%</th>'+
			          			  	'<th class="text-center">Prevista</th>'+
			          			  	'<th class="text-center">Lograda</th>'+
			          			  	'<th class="text-center">%</th>'+
			          		    '</tr>'+
			          		'</thead>'+
	          	 			lineasDeEstrategia+
	  					'</table>'+
	  				'</div>'+
	            '</div>'+
			   '</div>'+
			   '</div>'+
			   '</div>';
		if (lineasDeEstrategia.length>0){
			contenidoEnRow+=contenidoEnRowTemp;
			contenidoEnRowTemp=""; 
			lineasDeEstrategia="";
		}
	}
	$("#programacion").html(contenidoEnRow);
}

function renderAccion(estrategia, lineasProgramadas, instituciones, periodo){
			
	var todasLasLineasAccion="";
	for(var f = 0; f < lineasProgramadas.length; f++)
	{		
		if (todasLasLineasAccion.indexOf(""+lineasProgramadas[f].insLineaAccionId) == -1){ 
			todasLasLineasAccion += lineasProgramadas[f].insLineaAccionId+",";
		}
	}
	todasLasLineasAccion = todasLasLineasAccion.substring(0,todasLasLineasAccion.length - 1);

	if(todasLasLineasAccion != ""){
		var insLineaAccionHasEtiqueta = $.ajax({
			url:'/tablero/public/ajaxSelects4?action=getInsLineaAccionHasEtiqueta&insLineaAccionIdConcat='+todasLasLineasAccion,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		insLineaAccionHasEtiqueta = JSON.parse(insLineaAccionHasEtiqueta);
	}
	
	var tablaInstituciones="";
	var tempInstituciones="<tbody>";
	var tempInstLineas="";
	var flagIns=0;
	var clase="";
    
	for(var m=0; m<instituciones.length;m++){ 
		for(var n=0; n<lineasProgramadas.length;n++){
			if ( instituciones[m].id==lineasProgramadas[n].institucionId &&  lineasProgramadas[n].lineaAccionEstratagiaId==estrategia){
				if (flagIns == 0){
					tempInstituciones += '<tr><td colspan="12"><strong>'+lineasProgramadas[n].institucionSigla+'</strong></td></tr>';
					flagIns++;						  
				}
				clase="";
				
				var desempProgAnho=parseFloat(((lineasProgramadas[n].cantidadAnho/lineasProgramadas[n].meta)*100));

				if (lineasProgramadas[n].cantidadAnho==0 && lineasProgramadas[n].meta ==0) desempProgAnho="-";
				if (desempProgAnho!="-"){
					if (parseInt(desempProgAnho)>=90 && lineasProgramadas[n].meta != 0){
						clase="bg-green-active color-palette"; 
					}else if(parseInt(desempProgAnho)>=70 && lineasProgramadas[n].meta != 0){
						clase="bg-yellow-active color-palette"; 
					}else{
						clase="bg-red-active color-palette";
					}
				}
				  
				tempInstLineas += '<tr>'+
				'<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #3c8dbc;">'+lineasProgramadas[n].lineaAccionNombre+'</span></td>'+
				'<td>'+lineasProgramadas[n].lineaAccionUnidadMedidaNombre+'</td>'+
				'<td>'+numeroConComa((lineasProgramadas[n].meta).toFixed(2))+'</td>'+
				'<td>'+numeroConComa((lineasProgramadas[n].cantidadAnho).toFixed(2))+'</td>'+
				'<td class="'+clase+'">'+numeroConComa(desempProgAnho.toFixed(2))+'</td>';
				if(lineasProgramadas[n].cantDest==0){
					tempInstLineas += '<td> - </td>';
				}else{
					tempInstLineas += '<td>'+numeroConComa(lineasProgramadas[n].cantDest)+'</td>';
				}
				tempInstLineas += '<td>'+numeroConComa((lineasProgramadas[n].inversionEstimada/1000000).toFixed(2))+'</td>'+
				'<td>'+numeroConComa((lineasProgramadas[n].cantidadHoy).toFixed(2))+'</td>'+
				'<td>'+numeroConComa((lineasProgramadas[n].cantidadAvance).toFixed(2))+'</td>';

				var desempEjeHoy=numeroConComa(((lineasProgramadas[n].cantidadAvance/lineasProgramadas[n].cantidadHoy)*100).toFixed(2));
				if(lineasProgramadas[n].cantidadAvance==0 && lineasProgramadas[n].cantidadHoy==0) desempEjeHoy="-";
				if (desempEjeHoy!="-"){
					if (clase!="bg-red-active color-palette" && clase!="" ){
						clase="";
						if (parseInt((lineasProgramadas[n].cantidadAvance/lineasProgramadas[n].cantidadHoy)*100)>=90 && lineasProgramadas[n].cantidadHoy != 0){
							clase="bg-green-active color-palette"; 
						}else if(parseInt((lineasProgramadas[n].cantidadAvance/lineasProgramadas[n].cantidadHoy)*100)>=70 && lineasProgramadas[n].cantidadHoy != 0){
							clase="bg-yellow-active color-palette"; 
						}else{
							clase="bg-red-active color-palette";
						}
					}
				}else{
					clase="";
				}
  
				tempInstLineas += '<td class="'+clase+'">'+desempEjeHoy+'</td>';
				if(lineasProgramadas[n].cantDestinatarioReal==0){
					tempInstLineas += '<td> - </td>';
				}else{
					if(lineasProgramadas[n].cantDestinatarioReal > 0){ tempInstLineas += '<td>'+numeroConComa((lineasProgramadas[n].cantDestinatarioReal).toFixed(2))+'</td>'; }else{ tempInstLineas += '<td>'+numeroConComa(lineasProgramadas[n].cantDestinatarioReal)+'</td>';}
				}
				tempInstLineas += '<td>'+numeroConComa((lineasProgramadas[n].costoAc/1000000).toFixed(2))+'</td>'+
				'</tr>';
			}
		}

		if (flagIns>0){
			tablaInstituciones+=tempInstituciones+tempInstLineas;
		}
		tempInstituciones="";tempInstLineas="";flagIns=0;
	}
	tablaInstituciones+="</tbody>";
	return tablaInstituciones;
}

function getPeriodo(periodo){

	var periodo = $.ajax({
		url:'/tablero/public/ajaxSelects4?action=getPeriodo',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	periodo = JSON.parse(periodo);

	var optionPeriodo;
	
	for(p = 0;p<periodo.length; p++){
		if((periodo[p].id >= 2014) && (periodo[p].id <= 2018)){
			if(periodo[p].id == 2017){
				optionPeriodo+='<option value="'+periodo[p].id+'" selected>'+periodo[p].nombre+'</option>';
			}else{
				optionPeriodo+='<option value="'+periodo[p].id+'" >'+periodo[p].nombre+'</option>';
			}
		}
	}
							
	$('#periodoSeleccion').html(optionPeriodo);
}	
	
