
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
			
function renderLineasEstrategicas(periodo){
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
		url: '/tablero/ajaxSelects2?action=getResumenLineasAccionProgramacion&periodoId='+periodo,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	lineasProgramadas = JSON.parse(lineasProgramadas);
	//lineasProgramadas=lineasProgramadas.sort(lineaAccionOrden);
	
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
		lineasDeEstrategia=renderAccion(/*lineasEstrategicas[l].id,*/ lineasProgramadas, instituciones, periodo)
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
				'<div class="col-md-12">'+
		          '<div class="box">'+
		            '<div class="box-header with-border">'+
		              '<h3 class="box-title">Información Adicional</h3>'+
		              '<div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
		              '</div>'+
		            '</div>'+
		            '<div class="box-body" >'+
		            	'<div class="table-responsive">'+
		          			'<table class="table table-striped table-bordered table-hover">'+
		          				'<tbody>'+
		          					'<tr><td>Programación</td><td>...</td></tr>'+
		          					'<tr><td>Destinatarios</td><td>...</td></tr>'+
		          					'<tr><td>Inversión</td><td>....</td></tr>'+
		          					'<tr><td>Avance</td><td>....</td></tr>'+
		          					'<tr><td>Evidencia</td><td>....</td></tr>'+
		          					'<tr><td>I.P.R</td><td>....</td></tr>'+

		          				'</tbody>'+
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

function renderAccion(/*estrategia, */lineasProgramadas, instituciones, periodo){
			
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
	var tempInstLineas="";
	var flagIns=0;
	var clase="";
	var clase2="";

	
	tempInstituciones = '<thead><tr>'+
  									'<th class="text-center" style="vertical-align: middle;">Institución</th>'+
								  	'<th class="text-center" style="vertical-align: middle;">Programación (%)</th>'+
								  	'<th class="text-center" style="vertical-align: middle;">Destinatarios (%)</th>'+
								   	'<th class="text-center">Inversión (%)</th>'+
								  	'<th class="text-center">Avance (%)</th>'+
								  	'<th class="text-center">Evidencia</th>'+
								  	'<th class="text-center">I.P.R</th>'+
							    '</tr></thead><tbody>';
    var valor1 = 0;
    var valor2 = 0;
    var valor3 = 0;
    var valor4 = 0;
    var cont = 0;
	for(var m=0; m<instituciones.length;m++){ 
		for(var n=0; n<lineasProgramadas.length;n++){
			for(var l = 0; l < usuarioEtiqueta.length; l++)
			{
				if(usuarioEtiqueta[l].etiqueta_id == 1)
				{
					for(var t = 0; t < insLineaAccionHasEtiqueta.length; t++)
					{
						if(insLineaAccionHasEtiqueta[t].ins_linea_accion_id == lineasProgramadas[n].insLineaAccionId && insLineaAccionHasEtiqueta[t].etiqueta_id == 1)
						{
							for(var d=0; d<usuarioLineaAccion.length;d++)
							{
								if(usuarioLineaAccion[d].lineaAccionId == lineasProgramadas[n].lineaAccionId)
								{

									if ( instituciones[m].id==lineasProgramadas[n].institucionId){
										
										cont = cont + 1;
										if (flagIns == 0){
											tempInstituciones += '<tr><td><strong>'+lineasProgramadas[n].institucionSigla+'</strong></td>';
											flagIns++;						  
										}
										var desempProgAnho=validarNumero(((lineasProgramadas[n].cantidadAnho/lineasProgramadas[n].meta)*100));
										var desempEjeHoy=validarNumero(((lineasProgramadas[n].cantidadAvance/lineasProgramadas[n].cantidadHoy)*100).toFixed(2));
						  									
										valor1 += parseFloat(desempProgAnho);
										valor2 += validarNumero((lineasProgramadas[n].cantDestinatarioReal / lineasProgramadas[n].cantDest));
										valor3 += validarNumero(((lineasProgramadas[n].costoAc/1000000) / (lineasProgramadas[n].inversionEstimada/1000000)));
										valor4 += parseFloat(desempEjeHoy);

										if (n == lineasProgramadas.length -1){
											institucionId = lineasProgramadas[n].institucionId;

											valor1 = numeroConComa((valor1 / cont).toFixed(2));
											valor2 = numeroConComa(((valor2 / cont)*100).toFixed(2));
											valor3 = numeroConComa(((valor3 / cont)*100).toFixed(2));
											valor4 = numeroConComa((valor4 / cont).toFixed(2));
											
											var colorProgramacion = color(valor1,lineasProgramadas[n].meta);
											var colorAvance = color(valor2,lineasProgramadas[n].meta);
											var colorDestinatarios = color(valor3,lineasProgramadas[n].meta);
											var colorInversion = color(valor4,lineasProgramadas[n].meta);

											tempInstituciones += '<td class='+colorProgramacion+'>'+valor1+'</td><td class='+colorAvance+'>'+valor2+'</td><td class='+colorDestinatarios+'>'+valor3+'</td><td class='+colorInversion+'>'+valor4+'</td><td></td><td></td></tr>';
											valor1=0, valor2=0, valor3=0, valor4=0, cont = 0;

										}else if(lineasProgramadas[n+1].institucionId != instituciones[m].id){
											valor1 = numeroConComa((valor1 / cont).toFixed(2));
											valor2 = numeroConComa(((valor2 / cont)*100).toFixed(2));
											valor3 = numeroConComa(((valor3 / cont)*100).toFixed(2));
											valor4 = numeroConComa((valor4 / cont).toFixed(2));
											
											var colorProgramacion = color(valor1,lineasProgramadas[n].meta);
											var colorAvance = color(valor2,lineasProgramadas[n].meta);
											var colorDestinatarios = color(valor3,lineasProgramadas[n].meta);
											var colorInversion = color(valor4,lineasProgramadas[n].meta);


											tempInstituciones += '<td class='+colorProgramacion+'>'+valor1+'</td><td class='+colorAvance+'>'+valor2+'</td><td class='+colorDestinatarios+'>'+valor3+'</td><td class='+colorInversion+'>'+valor4+'</td><td></td><td></td></tr>';
											valor1=0, valor2=0, valor3=0, valor4=0, cont = 0;
										}
										
									}

								}
							}
						}
					}
				}
			}
		}

		if (flagIns>0){
			tablaInstituciones+=tempInstituciones;
		}
		tempInstituciones="";flagIns=0;
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
	
	for(p = 0;p<periodo.length; p++){
		if(periodo[p].id >= 2014){
			if(periodo[p].id == 2016){
				optionPeriodo+='<option value="'+periodo[p].id+'" selected>'+periodo[p].nombre+'</option>';
			}else{
				optionPeriodo+='<option value="'+periodo[p].id+'" >'+periodo[p].nombre+'</option>';
			}
		}
	}
	
	var periodoCuerpo = '<div class="col-sm-4">'+
							'<label for="periodoSeleccion" style="padding-top:6px;">Periodo: </label>'+
							'<select id="periodoSeleccion" class="form-control" style="width:50% !important; display: inline-block; margin-left: 8px;">'+optionPeriodo+'</select>'+
						'</div>'+
						'<div class="col-sm-4">'+
						'</div>'+
						'<div class="col-sm-4">'+
							/* '<div class="checkbox">'+
								'<label> <input type="checkbox" id="chkMostrarOcultar">Ocultar Registros Borrados</label>'+
							'</div>'+ */
						'</div>';
						
	$('#mostrarOcultarPeriodo').html(periodoCuerpo);
	
}	
	
