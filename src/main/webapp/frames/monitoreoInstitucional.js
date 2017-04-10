function numeroConComa(x) {
	if (isNaN(x)){
		return 0;
	}else if ( x == "Infinity"){
		return "-"
	}else{
		return x.toString().replace(".", ",").replace(/\B(?=(\d{3})+(?!\d))/g, ".");
	}
}

function validarNumero(x) {
	if (isNaN(x)){
		return 0;
	}else if ( x == "Infinity"){
		return 0;
	}else{
		return x;
	}
}

function color(a,b) {
	if (parseInt(a)>=90 && b != 0){ 
		clase="bg-green-active color-palette";
		return clase;
	}else if(parseInt(a)>=70 && b != 0){
		clase="bg-yellow-active color-palette"; 
		return clase;
	}else{
		clase="bg-red-active color-palette";
		return clase;
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

function mostrarMas(){ 
	$(".dimHeader").show();
	$(".mostrarMas").hide();
}

function mostrarMenos(){ 
	$(".dimHeader").hide();
	$(".mostrarMas").show();
};

function lineaAccionInstitucion(a,b) {             
	if (a.institucionId < b.institucionId)
		return -1;
	if (a.institucionId > b.institucionId)
		return 1;
	return 0;
}

function renderFlow(periodo,etiquetaSeleccionado){		
	var avances = $.ajax({
		url:'/tablero/ajaxSelects2?action=getPivotAvance&anho='+periodo+'&etiquetaId='+etiquetaSeleccionado+'&mes=03',
		type:'get',
		dataType:'json',
		async:false       
	}).responseText;
	avances = JSON.parse(avances);
	
	/* function compararAvancesPorFecha(a,b) {  
	    if (a.avanceFecha > b.avanceFecha) return -1;
	    if (a.avanceFecha < b.avanceFecha) return 1;
	    return 0;
	} */
	//avances=avances.sort(compararAvancesPorFecha);
	
	//obtención de los costos del avance.
	var avanceCosto = $.ajax({
		url:'/tablero/ajaxSelects2?action=getAvanceCosto',//&avanceId '+avances[0].avanceId
		type:'get',
		dataType:'json',
		async:false       
	}).responseText;
	avanceCosto = JSON.parse(avanceCosto);
	
	var totalEvidencias = $.ajax({
		url:'/tablero/ajaxSelects2?action=getTotalEvidenciasPorLineaAccion',
		type:'get',
		dataType:'json',
		async:false       
	}).responseText;
	totalEvidencias = JSON.parse(totalEvidencias);		
	
	var avanceCostoTotal = parseFloat('0'); 
	for (var c=0; c<avanceCosto.length;c++){
		if (avanceCosto[c].avanceId == avances[0].avanceId){
			avanceCostoTotal += parseFloat(avanceCosto[c].monto);	
		}				
	}
	
	var totalEvidenciaLineaAccion = 0;
	for (var c=0; c<totalEvidencias.length;c++){
		if (totalEvidencias[c].linea_accion_id == avances[0].laId && totalEvidencias[c].avance_fecha == avances[0].avanceFecha){
			totalEvidenciaLineaAccion = parseFloat(totalEvidencias[c].total);	
		}				
	}
	
	//despliegue del flow de avances.
	var fechaAnterior=avances[0].avanceFecha;
	var laAnterior=avances[0].lineaAccion;
	var flowContent="";
	flowContent+='<li class="time-label">'+
					'<span class="bg-red">'+
						avances[0].avanceFecha+
       				'</span>'+
	    		 '</li>';
	    flowContent+='<li>'+
	        '    <i class="fa fa-envelope bg-blue"></i>'+
	        '    <div class="timeline-item">'+
	        //'        <span class="time"><i class="fa fa-clock-o"></i> 12:05</span>'+
	        '        <h3 class="timeline-header"><a href="#">'+avances[0].lineaAccion+'</a> </h3>'+
	        '        <div class="timeline-body">'+
	        avances[0].institucion+' ha realizado '+avances[0].accion+' alcanzando '+avances[0].avanceCantidad+' '+avances[0].cronoUnidadMedida+' en el distrito '+avances[0].distrito+' del departamento de '+avances[0].departamento+ ' con una inversión de Gs. '+numeroConComa(avanceCostoTotal);
	
	for (var i=1; i<avances.length;i++){						
		
		var avanceCostoTotal = parseFloat('0'); 
		for (var c=0; c<avanceCosto.length;c++){
			if (avanceCosto[c].avanceId == avances[i].avanceId){
				avanceCostoTotal += parseFloat(avanceCosto[c].monto);	
			}				
		}

		var totalEvidenciaLineaAccion = 0;
		for (var c=0; c<totalEvidencias.length;c++){
			if (totalEvidencias[c].linea_accion_id == avances[i-1].laId  && totalEvidencias[c].avance_fecha == avances[i-1].avanceFecha){
				totalEvidenciaLineaAccion = parseFloat(totalEvidencias[c].total);	
			}				
		}
		
		if (fechaAnterior>avances[i].avanceFecha){
			fechaAnterior=avances[i].avanceFecha;
			flowContent+='        </div>'+
	                '        <div class="timeline-footer">'+
	                '            <a class="btn btn-primary btn-xs modalEvidencias" parametros="'+avances[i-1].laId+'-'+avances[i-1].avanceFecha+'" >'+
	                '				<span class="badge bg-olive" style="font-size:13px;">'+totalEvidenciaLineaAccion+'</span>'+
	                '				<strong>Ver evidencias</strong>'+
	                '			 </a>'+
	                '        </div>'+
	                '   </div>'+
	                '</li>';
	                flowContent+='<li name="'+avances[i].avanceFecha+'" class="time-label">'+
	                   '<span class="bg-red">'+
	                   		avances[i].avanceFecha+
	                   '</span>'+
	               '</li>';
	               flowContent+='<li>'+
	                '    <i class="fa fa-envelope bg-blue"></i>'+
	                '    <div class="timeline-item">'+
	                //'        <span class="time"><i class="fa fa-clock-o"></i> 12:05</span>'+
	                '        <h3 class="timeline-header"><a name="'+i+'" href="#">'+avances[i].lineaAccion+'</a> </h3>'+
	                '        <div class="timeline-body">'+
	                avances[i].institucion+' ha realizado '+avances[i].accion+' alcanzando '+avances[i].avanceCantidad+' '+avances[i].cronoUnidadMedida+' en el distrito '+avances[i].distrito+' del departamento de '+avances[i].departamento+ ' con una inversión de Gs. '+numeroConComa(avanceCostoTotal);
			
		}else{
	    	if (avances[i].lineaAccion!=laAnterior){
	    		laAnterior=avances[i].lineaAccion;
	    		flowContent+='        </div>'+
	                     '        <div class="timeline-footer">'+
	                     '            <a class="btn btn-primary btn-xs modalEvidencias" parametros="'+avances[i-1].laId+'-'+avances[i-1].avanceFecha+'">'+
	                     '			  		<span class="badge bg-olive" style="font-size:13px;">'+totalEvidenciaLineaAccion+'</span>'+
	                     '					<strong>Ver evidencias</strong>'+
	                     '			  </a>'+
	                     '        </div>'+
	                     '   </div>'+
	                     '</li>';
	    		flowContent+='<li>'+
	                    '    <i class="fa fa-envelope bg-blue"></i>'+
	                    '    <div class="timeline-item">'+
	                    //'        <span class="time"><i class="fa fa-clock-o"></i> 12:05</span>'+
	                    '        <h3 class="timeline-header"><a href="#">'+avances[i].lineaAccion+'</a> </h3>'+
	                    '        <div class="timeline-body">'+
	                    avances[i].institucion+' ha realizado '+avances[i].accion+' alcanzando '+avances[i].avanceCantidad+' '+avances[i].cronoUnidadMedida+' en el distrito '+avances[i].distrito+' del departamento de '+avances[i].departamento+ ' con una inversión de Gs. '+numeroConComa(avanceCostoTotal);
	    		
	    	}else{
	    		
	    		flowContent+='<br>'+avances[i].institucion+' ha realizado '+avances[i].accion+' alcanzando '+avances[i].avanceCantidad+' '+avances[i].cronoUnidadMedida+' en el distrito '+avances[i].distrito+' del departamento de '+avances[i].departamento+ ' con una inversión de Gs. '+numeroConComa(avanceCostoTotal);
	    	}    
		}
	}
	flowContent+='        </div>'+
	'        <div class="timeline-footer">'+
	'            <a class="btn btn-primary btn-xs modalEvidencias" parametros="'+avances[avances.length-1].ilaId+'-'+avances[avances.length-1].avanceFecha+'">Ver evidencias</a>'+
	'        </div>'+
	'   </div>'+
	'</li>'
	$("#flow").append(flowContent);

}

function renderModalEvidencias(lineaAccionId, avanceFecha) {
	if ( $("#modalEvidencias").length )
	{
		$("#modalEvidencias").remove();
	}	
	
	var webServicesEvidencia = $.ajax({
		url:'/tablero/ajaxSelects2?action=getEvidenciaAvanceLineaAccion&lineaAccionId='+lineaAccionId+'&avanceFecha='+avanceFecha,
	  	type:'get',
	  	dataType:'json',
	  	async:false
	}).responseText;
	webServicesEvidencia = JSON.parse(webServicesEvidencia);
	
	var cuerpoEvidencia = "";
	
	for(var d = 0; d < webServicesEvidencia.length; d++)
	{			
		var donwloadName=""; 
		var downloadTarget='target="_blank"';
		var botones="";
		
		if (webServicesEvidencia[d].urlDocumento) {
			webServicesEvidencia[d].url='http://spr.stp.gov.py/tablero/DownloadServlet?urlDocumento='+webServicesEvidencia[d].urlDocumento;
			donwloadName='Download="'+webServicesEvidencia[d].nombre+'"';
			downloadTarget="";
		}

		if(webServicesEvidencia[d].borrado == false){
			cuerpoEvidencia += '<tr>'+
					'<td data-toggle="tooltip" data-placement="top" title="'+webServicesEvidencia[d].descripcion+'" >'+
						'<a href="'+webServicesEvidencia[d].url+'" '+downloadTarget+'" '+donwloadName+'>'+webServicesEvidencia[d].nombre+'</a>'+
					'</td>';	
		}	
	}

	var contenidoModalEvidencias =  
	'<div class="modal fade" id="modalEvidencias" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
	'	<div class="modal-dialog modal-lg" style="width:90%">'+
	'		<div class="modal-content" >'+
	'			<div class="modal-header">'+		        
	'		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
	'		        <h4 class="modal-title">Evidencias </h4>'+ /*(+lineaAccion[0].nombre+' - '+webServicesAvance[0].fechaEntrega+')  de '+lineaAccion[0].nombre+' ('+institucion[0].sigla+') año '+insLineaAccion[0].periodoId+'</h4>' */ 
	'			</div>'+
	'		    <div class="modal-body">'+
		
	'		      				<div class="row">'+ 	
	'								<div class="col-md-12" id="tableEvidencia">'+
	'									<div class="box box-default box-solid">'+
	'		                				<div class="box-header with-border">'+
	'		                  					<h3 class="box-title">Lista Evidencia</h3>'+
	'	                  						<div class="box-tools pull-right">'+
//	'				                    			<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
//	'		                    					<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>'+
	'		                  					</div>'+
	'              							</div>'+
	'              						<div class="box-body" id="cuerpoTablaEvidencia">'+	
	'										<div class="table-responsive">'+
	'											<table class="table table-hover table-bordered" id="dataTableEvidencia">'+
	'												<thead>'+
	'													<tr class="active"><th>Nombre Evidencia</th><!--th class="text-center">Administrar</th--></tr>'+
	'												</thead>'+
	'												<tfoot>'+
	'													<tr><th></th><!--th></th--></tr>'+
	'												</tfoot>'+
	'												<tbody  id="listaEvidencia">'+
															cuerpoEvidencia+
	'												</tbody>'+
	'											</table>'+
	'				      					</div>'+
	
	'				      				</div>'+
	'				      			</div>'+
	'			      			</div>'+		
	
	'  			</div>'+
	'		</div>'+
	'	</div>'+
	'</div>';

	$("body").append(contenidoModalEvidencias);
	$('#modalEvidencias').modal('show');
	/* $('#dataTableEvidencia').DataTable({ 
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
	}); */
}
			
function renderLineasEstrategicas(periodo,etiquetaSeleccionado){
	var contenidoEnRow="";
	var contenidoEnRowTemp="";				
	
//	var lineasEstrategicas = $.ajax({
//		url:'/tablero/ajaxSelects2?action=getLineaEstrategica',
//	  	type:'get',
//	  	dataType:'json',
//	  	async:false       
//	}).responseText;
//	lineasEstrategicas = JSON.parse(lineasEstrategicas);
//	lineasEstrategicas=lineasEstrategicas.sort(orden);
		
	var lineasProgramadas = $.ajax({
		url: '/tablero/ajaxSelects2?action=getResumenLineasAccionProgramacion&periodoId='+periodo+'&etiquetaId='+etiquetaSeleccionado,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	lineasProgramadas = JSON.parse(lineasProgramadas);
	lineasProgramadas=lineasProgramadas.sort(lineaAccionInstitucion);
	
	var instituciones = $.ajax({
		url:'/tablero/ajaxSelects2?action=getInstitucion',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;		
	instituciones=JSON.parse(instituciones);
	instituciones=instituciones.sort(orden); 
	
	//for(var l=0; l<lineasEstrategicas.length;l++){
		var lineasDeEstrategia="";
		lineasDeEstrategia=renderAccion(/*lineasEstrategicas[l].id,*/ lineasProgramadas, instituciones, periodo,etiquetaSeleccionado)
		contenidoEnRowTemp='<div class="row">'+
			'<div class="col-md-12">'+
	          '<div class="box" height="1000px">'+
	            '<div class="box-header with-border" height="1000px">'+
	              '<h3 class="box-title" id="tituloTipoPrograma">'+
	              //lineasEstrategicas[l].nombre+
	              '</h3> '+
	              '<div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
	              '</div>'+
	            '</div>'+
	            '<div class="box-body" >'+
	            	'<div class="table-responsive">'+
	          			'<table class="table table-striped table-bordered table-hover tablaLineasPorInstitucion">'+
	          	 			lineasDeEstrategia+
	  					'</tbody></table>'+
	  				'</div>'+
	            '</div>'+
			   '</div>'+
			   '</div>'+
			   '</div>'+
				  '<div class="row">'+
					'<ul id="flow" class="timeline">'+
//						'<li class="time-label"><span class="bg-red">2017-05-31</span></li>'+
//						'<li><i class="fa fa-envelope bg-blue"></i>'+    
//							'<div class="timeline-item">'+
//							'<span class="time"><i class="fa fa-clock-o"></i> 12:05</span>'+
//								'<h3 class="timeline-header"><a href="#">Soluciones habitacionales</a></h3>'+        
//								'<div class="timeline-body">SENAVITAT ha realizado Construcción de viviendas con servicios básicos alcanzando 120 Viviendas en el distrito TAVAI del departamento de CAAZAPA<br>SENAVITAT ha realizado Construcción de viviendas con servicios básicos alcanzando 40 Viviendas en el distrito CARLOS ANTONIO LOPEZ del departamento de ITAPUA</div>'+
//								'<div class="timeline-footer"><a class="btn btn-primary btn-xs">Ver evidencias</a></div>'+   
//							'</div>'+
//						'</li>'+
//						'<li name="2017-04-05" class="time-label"><span class="bg-red">2017-04-05</span></li>'+
//						'<li><i class="fa fa-envelope bg-blue"></i>'+
//						    '<div class="timeline-item">'+
//						    	'<span class="time"><i class="fa fa-clock-o"></i> 12:05</span>'+
//						         '<h3 class="timeline-header"><a name="2" href="#">Planes de ordenamiento territorial</a></h3>'+
//						         '<div class="timeline-body">STP ha realizado Asistencia para elaboración de planes de ordenamiento territorial alcanzando 0 Planes en el distrito A DEFINIR del departamento de CENTRAL</div>'+
//						         '<div class="timeline-footer"><a class="btn btn-primary btn-xs">Ver evidencias</a></div>'+
//						    '</div>'+
//						'</li>'+
//						'<li><i class="fa fa-envelope bg-blue"></i>'+
//							'<div class="timeline-item">'+
//								'<span class="time"><i class="fa fa-clock-o"></i> 12:05</span>'+
//								'<h3 class="timeline-header"><a href="#">Planes de ordenamiento territorial</a></h3>'+
//								'<div class="timeline-body">STP ha realizado Asistencia para elaboración de planes de ordenamiento territorial alcanzando 3 Planes en el distrito CORONEL OVIEDO del departamento de CAAGUAZU<br>STP ha realizado Asistencia para elaboración de planes de ordenamiento territorial alcanzando 0 Planes en el distrito A DEFINIR del departamento de CENTRAL<br>STP ha realizado Asistencia para elaboración de planes de ordenamiento territorial alcanzando 1 Planes en el distrito A DEFINIR del departamento de CENTRAL</div>'+
//								'<div class="timeline-footer"><a class="btn btn-primary btn-xs">Ver evidencias</a></div>'+
//							'</div>'+
//						'</li>'+
					'</ul>'+
				'</div><!-- /.row -->';
		if (lineasDeEstrategia.length>0){
			contenidoEnRow+=contenidoEnRowTemp;
			contenidoEnRowTemp=""; 
			lineasDeEstrategia="";
		}
	//}
	$("#programacion").html(contenidoEnRow);
}

var usuarioLineaAccion = $.ajax({
	url:'/tablero/ajaxSelects2?action=getUsuarioLineaAccion',
  	type:'get',
  	dataType:'json',
  	async:false       
}).responseText;
usuarioLineaAccion = JSON.parse(usuarioLineaAccion);

var usuarioEtiqueta = $.ajax({
	url:'/tablero/ajaxSelects2?action=getUsuarioEtiqueta',
  	type:'get',
  	dataType:'json',
  	async:false       
}).responseText;
usuarioEtiqueta = JSON.parse(usuarioEtiqueta);

var etiqueta = $.ajax({
	url:'/tablero/ajaxSelects2?action=getEtiqueta',
  	type:'get',
  	dataType:'json',
  	async:false       
}).responseText;
etiqueta = JSON.parse(etiqueta);

function renderAccion(/*estrategia, */lineasProgramadas, instituciones, periodo, etiquetaSeleccionado){
			
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
			url:'/tablero/ajaxSelects2?action=getInsLineaAccionHasEtiqueta&insLineaAccionIdConcat='+todasLasLineasAccion,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		insLineaAccionHasEtiqueta = JSON.parse(insLineaAccionHasEtiqueta);
	}
	
	var tablaInstituciones="";
	var tempInstituciones="";
	var cabeceraInstituciones="";
	var tempInstLineas="";
	var flagIns=0;
	var clase="";
	var clase2="";

	
	cabeceraInstituciones = '<thead><tr>'+									
  									'<th class="text-center cabeceraInstitucion" style="vertical-align: middle;">Institución</th>'+
  									'<th class="text-center cabeceraPromedio">I.P.R <button class="fa fa-arrow-right mostrarMas" onclick="mostrarMas()"></button></th>'+
								  	'<th class="text-center dimHeader cabeceraProgramacion" style="vertical-align: middle; display:none;">Programación (%)</th>'+
								  	'<th class="text-center dimHeader cabeceraDestinatario" style="vertical-align: middle; display:none;">Destinatarios (%)</th>'+
								   	'<th class="text-center dimHeader cabeceraInversion" style="display:none;">Inversión (%)</th>'+
								  	'<th class="text-center dimHeader cabeceraAvance" style="display:none;">Avance (%) <button class="fa fa-arrow-left dimHeader" onclick="mostrarMenos()" style="display:none;"></button></th>'+
//								  	'<th class="text-center ">Evidencia</th>'+								  	
							 '</tr></thead>';
								  	
	tablaInstituciones = cabeceraInstituciones + '<tbody>';
	
    var valor1 = 0;
    var valor2 = 0;
    var valor3 = 0;
    var valor4 = 0;
    var promedio = 0;
    var cont = 0;
	for(var m=0; m<instituciones.length;m++){ 
		for(var n=0; n<lineasProgramadas.length;n++){
			for(var l = 0; l < usuarioEtiqueta.length; l++)
			{
				if(usuarioEtiqueta[l].etiqueta_id == etiquetaSeleccionado && usuarioEtiqueta[l].borrado != true)
				{
					for(var t = 0; t < insLineaAccionHasEtiqueta.length; t++)
					{
						if(insLineaAccionHasEtiqueta[t].ins_linea_accion_id == lineasProgramadas[n].insLineaAccionId && insLineaAccionHasEtiqueta[t].etiqueta_id == etiquetaSeleccionado && insLineaAccionHasEtiqueta[t].borrado != true)
						{
//							for(var d=0; d<usuarioLineaAccion.length;d++)
//							{
//								if(usuarioLineaAccion[d].lineaAccionId == lineasProgramadas[n].lineaAccionId)
//								{

									if ( instituciones[m].id==lineasProgramadas[n].institucionId){
										
										cont = cont + 1;
										
										var desempProgAnho=validarNumero(((lineasProgramadas[n].cantidadAnho/lineasProgramadas[n].meta)*100));
										var desempEjeHoy=validarNumero(((lineasProgramadas[n].cantidadAvance/lineasProgramadas[n].cantidadHoy)*100).toFixed(2));
						  									
										valor1 += parseFloat(desempProgAnho);
										valor2 += validarNumero((lineasProgramadas[n].cantDestinatarioReal / lineasProgramadas[n].cantDest));
										valor3 += validarNumero(((lineasProgramadas[n].costoAc/1000000) / (lineasProgramadas[n].inversionEstimada/1000000)));
										valor4 += parseFloat(desempEjeHoy);

										if (n == lineasProgramadas.length -1){
											institucionId = lineasProgramadas[n].institucionId;

											promedio = numeroConComa(((valor1/cont + (valor2/cont)*100 + (valor3/cont)*100 + valor4/cont) / 4 ).toFixed(2));
											valor1 = numeroConComa((valor1 / cont).toFixed(2));
											valor2 = numeroConComa(((valor2 / cont)*100).toFixed(2));
											valor3 = numeroConComa(((valor3 / cont)*100).toFixed(2));
											valor4 = numeroConComa((valor4 / cont).toFixed(2));																						
											
											var colorProgramacion = color(valor1,lineasProgramadas[n].meta);
											var colorAvance = color(valor2,lineasProgramadas[n].meta);
											var colorDestinatarios = color(valor3,lineasProgramadas[n].meta);
											var colorInversion = color(valor4,lineasProgramadas[n].meta);
											var colorPromedio = color(promedio,lineasProgramadas[n].meta);
											if (flagIns == 0){
												tempInstituciones += '<tr><td class="cabeceraInstitucion" ><strong data-toggle="tooltip" data-placement="top" title="'+instituciones[m].nombre+'">'+lineasProgramadas[n].institucionSigla+'</strong></td>';
												flagIns++;						  
											}
											tempInstituciones += '<td class="'+colorPromedio+' cabeceraPromedio">'+promedio+'</td><td class="'+colorProgramacion+' dimHeader" style="display:none;">'+valor1+'</td><td class="'+colorAvance+' dimHeader" style="display:none;">'+valor2+'</td><td class="'+colorDestinatarios+' dimHeader" style="display:none;">'+valor3+'</td><td class="'+colorInversion+' dimHeader" style="display:none;">'+valor4+'</td></tr>';
											valor1=0, valor2=0, valor3=0, valor4=0, promedio=0, cont = 0;

										}else if(lineasProgramadas[n+1].institucionId != instituciones[m].id){
											promedio = numeroConComa(((valor1/cont + (valor2/cont)*100 + (valor3/cont)*100 + valor4/cont) / 4 ).toFixed(2));
											valor1 = numeroConComa((valor1 / cont).toFixed(2));
											valor2 = numeroConComa(((valor2 / cont)*100).toFixed(2));
											valor3 = numeroConComa(((valor3 / cont)*100).toFixed(2));
											valor4 = numeroConComa((valor4 / cont).toFixed(2));																						
											
											var colorProgramacion = color(valor1,lineasProgramadas[n].meta);
											var colorAvance = color(valor2,lineasProgramadas[n].meta);
											var colorDestinatarios = color(valor3,lineasProgramadas[n].meta);
											var colorInversion = color(valor4,lineasProgramadas[n].meta);
											var colorPromedio = color(promedio,lineasProgramadas[n].meta);
											
											if (flagIns == 0){
												tempInstituciones += '<tr><td class="cabeceraInstitucion" ><strong data-toggle="tooltip" data-placement="top" title="'+instituciones[m].nombre+'">'+lineasProgramadas[n].institucionSigla+'</strong></td>';
												flagIns++;						  
											}
											
											tempInstituciones += '<td class="'+colorPromedio+' cabeceraPromedio">'+promedio+'</td><td class="'+colorProgramacion+' dimHeader" style="display:none;">'+valor1+'</td><td class="'+colorAvance+' dimHeader" style="display:none;">'+valor2+'</td><td class="'+colorDestinatarios+' dimHeader" style="display:none;">'+valor3+'</td><td class="'+colorInversion+' dimHeader" style="display:none;">'+valor4+'</td></tr>';
											valor1=0, valor2=0, valor3=0, valor4=0, promedio=0, cont = 0;
										}
										
									}

//								}
//							}
						}
					}
				}
			}
		}

		if (flagIns>0){
			tablaInstituciones+=tempInstituciones;
		}
		tempInstituciones="";
		flagIns=0;
	}
	tablaInstituciones+="</tbody>";
	return tablaInstituciones;
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
	
	if(usuarioEtiqueta.length > 0){
		for(var d = 0; d<usuarioEtiqueta.length; d++){
			for(var e = 0; e<etiqueta.length; e++){
				if(usuarioEtiqueta[d].borrado != true && usuarioEtiqueta[d].etiqueta_id == etiqueta[e].id && d==0){
					optionEtiqueta+='<option value="'+etiqueta[e].id+'" selected>'+etiqueta[e].nombre+'</option>';
				}else if(usuarioEtiqueta[d].borrado != true && usuarioEtiqueta[d].etiqueta_id == etiqueta[e].id){
					optionEtiqueta+='<option value="'+etiqueta[e].id+'">'+etiqueta[e].nombre+'</option>';
				}
			}
		}
	}

	var periodoCuerpo= '<div class="col-sm-4">'+
							'<label for="periodoSeleccion">Periodo</label>'+
							'<select id="periodoSeleccion" class="form-control">'+optionPeriodo+'</select>'+
						'</div>'+
						'<div class="col-sm-6">'+
							'<label for="etiquetaSeleccion">Etiqueta</label>'+
							'<select id="etiquetaSeleccion" class="form-control">'+optionEtiqueta+'</select>'+
						'</div>'+
						'<div class="col-sm-2">'+
							'<div class="checkbox">'+
								//'<label> <input type="checkbox" id="chkMostrarOcultar" checked>Ocultar Registros Borrados</label>'+
							'</div>'+
						'</div>';
						
	
//	var periodoCuerpo = '<div class="col-sm-4">'+
//							'<label for="periodoSeleccion" style="padding-top:6px;">Periodo: </label>'+
//							'<select id="periodoSeleccion" class="form-control" style="width:50% !important; display: inline-block; margin-left: 8px;">'+optionPeriodo+'</select>'+
//						'</div>'+
//						'<div class="col-sm-4">'+
//						'</div>'+
//						'<div class="col-sm-4">'+
//							/* '<div class="checkbox">'+
//								'<label> <input type="checkbox" id="chkMostrarOcultar">Ocultar Registros Borrados</label>'+
//							'</div>'+ */
//						'</div>';
						
	$('#mostrarOcultarPeriodo').html(periodoCuerpo);
	
}	
