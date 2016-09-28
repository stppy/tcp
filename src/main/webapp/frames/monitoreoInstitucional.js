
function numeroConComa(x) {
	if (isNaN(x)){
		return 0;
	}else if ( x == "Infinity"){
		return 0;
	}else{
		return x.toString().replace(".", ",").replace(/\B(?=(\d{3})+(?!\d))/g, ".");
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
//		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getLineaEstrategica',
//	  	type:'get',
//	  	dataType:'json',
//	  	async:false       
//	}).responseText;
//	lineasEstrategicas = JSON.parse(lineasEstrategicas);
//	lineasEstrategicas=lineasEstrategicas.sort(orden);
		
	var lineasProgramadas = $.ajax({
		url: 'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getResumenLineasAccionProgramacion&periodoId='+periodo,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	lineasProgramadas = JSON.parse(lineasProgramadas);
	lineasProgramadas=lineasProgramadas.sort(lineaAccionOrden);
	
	var instituciones = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getInstitucion',
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
	url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getUsuarioLineaAccion',
  	type:'get',
  	dataType:'json',
  	async:false       
}).responseText;
usuarioLineaAccion = JSON.parse(usuarioLineaAccion);

var usuarioEtiqueta = $.ajax({
	url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getUsuarioEtiqueta',
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
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getInsLineaAccionHasEtiqueta&insLineaAccionIdConcat='+todasLasLineasAccion,
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

	//OBTENCION DE LA FECHA ACTUAL
	/*var f = new Date();
	if( (f.getMonth() +1) < 10 ){
		var mes =( 0 +""+ (f.getMonth() +1));
	}else{
		var mes =f.getMonth();
	}
	
	if( (f.getDate()) < 10 ){
		var dia =( 0 +""+ (f.getDate()));
	}else{
		var dia = f.getDate();
	}
	var fechaActual = (f.getFullYear() + "-" + mes + "-" + dia);
	*/
	
	tempInstituciones = '<thead><tr>'+
								  	'<th class="text-center" style="vertical-align: middle;">%</th>'+
								  	'<th class="text-center" style="vertical-align: middle;">%</th>'+
								   	'<th class="text-center">%</th>'+
								  	'<th class="text-center">%</th>'+
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

									if ( instituciones[m].id==lineasProgramadas[n].institucionId /*&&  lineasProgramadas[n].lineaAccionEstratagiaId==estrategia*/){
										
										cont = cont + 1;
										if (flagIns == 0){
											tempInstituciones += '<tr><td colspan="4"><strong>'+lineasProgramadas[n].institucionSigla+'</strong></td></tr>';
											flagIns++;						  
										}
										clase="";
										var desempProgAnho=numeroConComa(((lineasProgramadas[n].cantidadAnho/lineasProgramadas[n].meta)*100).toFixed(2));
										if (lineasProgramadas[n].cantidadAnho==0 && lineasProgramadas[n].meta ==0) desempProgAnho="0";
										if (desempProgAnho!="-"){
											if (parseInt(desempProgAnho)>=90 && lineasProgramadas[n].meta != 0){ 
												clase="bg-green-active color-palette"; 
											}else if(parseInt(desempProgAnho)>=70 && lineasProgramadas[n].meta != 0){
												clase="bg-yellow-active color-palette"; 
											}else{
												clase="bg-red-active color-palette";
											}
										}
										  
										tempInstLineas += '<tr>';
//										'<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">'+lineasProgramadas[n].lineaAccionNombre+'</a></td>';
										/*'<td>'+lineasProgramadas[n].lineaAccionUnidadMedidaNombre+'</td>'+
										'<td>'+numeroConComa(lineasProgramadas[n].meta)+'</td>'+
										'<td>'+numeroConComa(lineasProgramadas[n].cantidadAnho)+'</td>'+*/
//										'<td class="'+clase+'">'+desempProgAnho+'</td>';
										if(lineasProgramadas[n].cantDest==0){
											/*tempInstLineas += '<td> - </td>';*/
										}else{
											/*tempInstLineas += '<td>'+numeroConComa(lineasProgramadas[n].cantDest)+'</td>';*/
										}
//										tempInstLineas += '<td>'+numeroConComa(lineasProgramadas[n].cantDestinatarioReal / lineasProgramadas[n].cantDest) +'</td>'+
										/*tempInstLineas += '<td>'+numeroConComa((lineasProgramadas[n].inversionEstimada/1000000).toFixed(2))+'</td>'+*/
//										/*tempInstLineas += */'<td>'+numeroConComa( (lineasProgramadas[n].costoAc/1000000) / (lineasProgramadas[n].inversionEstimada/1000000))+'</td>';

										/*'<td>'+numeroConComa(lineasProgramadas[n].cantidadHoy)+'</td>'+
										'<td>'+numeroConComa(lineasProgramadas[n].cantidadAvance)+'</td>';*/
						
										var desempEjeHoy=numeroConComa(((lineasProgramadas[n].cantidadAvance/lineasProgramadas[n].cantidadHoy)*100).toFixed(2));
										if(lineasProgramadas[n].cantidadAvance==0 && lineasProgramadas[n].cantidadHoy==0) desempEjeHoy="0";
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
						  
//										tempInstLineas += '<td class="'+clase+'">'+desempEjeHoy+'</td>';
										if(lineasProgramadas[n].cantDestinatarioReal==0){
											/*tempInstLineas += '<td> - </td>';*/
										}else{
											/*tempInstLineas += '<td>'+numeroConComa(lineasProgramadas[n].cantDestinatarioReal)+'</td>';*/
										}
//										tempInstLineas += /*'<td>'+numeroConComa((lineasProgramadas[n].costoAc/1000000).toFixed(2))+'</td>'+*/
//										'</tr>';
										
										valor1 += parseFloat(desempProgAnho);
										valor2 += parseFloat((lineasProgramadas[n].cantDestinatarioReal / lineasProgramadas[n].cantDest).toFixed(2));
										valor3 += parseFloat(((lineasProgramadas[n].costoAc/1000000) / (lineasProgramadas[n].inversionEstimada/1000000)).toFixed(2));
										valor4 += parseFloat(desempEjeHoy);

										if (n == lineasProgramadas.length -1){
											institucionId = lineasProgramadas[n].institucionId;

											valor1 = parseFloat(valor1 / cont);
											valor2 = parseFloat(valor2 / cont);
											valor3 = parseFloat(valor3 / cont);
											valor4 = parseFloat(valor4 / cont);

											tempInstLineas += '<td>'+valor1+'</td><td>'+valor2+'</td><td>'+valor3+'</td><td>'+valor4+'</td></tr>';
											valor1=0, valor2=0, valor3=0, valor4=0, cont = 0;

										}else if(lineasProgramadas[n+1].institucionId != instituciones[m].id){
											valor1 = parseFloat(valor1 / cont);
											valor2 = parseFloat(valor2 / cont);
											valor3 = parseFloat(valor3 / cont);
											valor4 = parseFloat(valor4 / cont);

											tempInstLineas += '<td>'+valor1+'</td><td>'+valor2+'</td><td>'+valor3+'</td><td>'+valor4+'</td></tr>';
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
			tablaInstituciones+=tempInstituciones+tempInstLineas;
		}
		tempInstituciones="";tempInstLineas="";flagIns=0;
	}
	tablaInstituciones+="</tbody>";
	return tablaInstituciones;
}

function getPeriodo(periodo){

	var periodo = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getPeriodo',
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
	
	/*$("body").on("click", ".guardarRangoFechas",function(event){
	
		var fechaInicio = document.getElementById("fechaInicioAccion").value;
		var fechaFin = document.getElementById("fechaFinAccion").value;
		
		var datos = new Object();
	    
	    datos.fechaInicio = fechaInicio;
	    datos.fechaFin = fechaFin;
	    
	  	/*var info = JSON.stringify(datos);
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
		 });*/
	//});	
	//window.open('http://spr.stp.gov.py/','_blank');
}	
	
