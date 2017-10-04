<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%> 

<!DOCTYPE html>
<html>
  <head>
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<script src="plugins/jQuery/jQuery-2.1.3.min.js"></script>
  	<%@ include file="frames/head.jsp" %> 		        	
	
	<link href="bootstrap/css/bootstrapslider.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">      
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrapslider.css" rel="stylesheet">
	<link href="plugins/datatables/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="plugins/datatables/css/buttons.dataTables.min.css" rel="stylesheet"> 		
	<link href="plugins/mapa/leaflet.css" rel="stylesheet" />
	
	<script src="bootstrap/js/bootstrap-slider.js" type="text/javascript" ></script>
	<script src="dist/canvasjs/canvasjs.min.js" type="text/javascript"></script>
	<script src="dist/leaflet-image.js" type="text/javascript"></script>	
	<script src="plugins/mapa/deptos2012.geojson" type="text/javascript"></script>					
	<script src="plugins/mapa/leaflet.js" type="text/javascript"></script>
	<script src="mapa/leaflet.ajax.js" type="text/javascript"></script>
	<script src="mapa/spin.js" type="text/javascript"></script>
	<script src="mapa/leaflet.spin.js" type="text/javascript"></script>
	
    <style type="text/css">
		/* Example 1 custom styles */
		#ex1Slider .slider-selection {
   			background: #BABABA;
  		}

    	/* Example 3 custom styles */
		#RGB {
    		height: 20px;
    		background: rgb(128, 128, 128);
  		}
		#RC .slider-selection {
		    background: #FF8282;
		}
		#RC .slider-handle {
			background: red;
		}
		#GC .slider-selection {
			background: #428041;
		}
		#GC .slider-handle {
			background: green;
		}
		#BC .slider-selection {
			background: #8283FF;
		}
		#BC .slider-handle {
			border-bottom-color: blue;
		}
		#R, #G, #B {
			width: 300px;
		}
		
		
		#slider12a .slider-track-high, #slider12c .slider-track-high {
			background: #008d4c;
		}
		
		#slider12b .slider-track-low, #slider12c .slider-track-low {
			background: #d33724;
		}
		
		#slider12c .slider-selection {
			background: #db8b0b;
		}
		
		#map {
			widh: 50px;
			height: 50px;
		}
		
		td {
			height: 100%;
			overflow-y: auto;
			padding: 5px;
		}
		
		/* estilo asignado a la caja de informaciones del mapa*/
		.info {
			padding: 6px 8px;
			font: 14px/16px Arial, Helvetica, sans-serif;
			background: white;
			background: rgba(255, 255, 255, 0.8);
			box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
			border-radius: 5px;
		}
		
		.info h4 {
			margin: 0 0 5px;
			color: #777;
		}
		
		.legend {
			line-height: 18px;
			color: #555;
		}
		
		.legend i {
			width: 18px;
			height: 18px;
			float: left;
			margin-right: 8px;
			opacity: 0.7;
		}
		
		.legend p {
			margin-top:0;
		 	margin-bottom:0;
		}
		 
		textarea { text-transform: uppercase; }
			.cell-bordered2  {
  					border: 1px solid #dddddd;
  					border-right-width:0px;
  					border-bottom-width:0px;
		}
		tbody {
    		height: 100%;
    		overflow-y: auto;
		}
    </style>        	

</head>
<body class="skin-blue sidebar-mini sidebar-collapse">

    <div class="wrapper">

      <header class="main-header">
		  <%@ include file="frames/mainheader.jsp" %>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
      	  <%@ include file="frames/main-sidebar.jsp" %>
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">     

        <!-- Main content -->
        <section class="content" id="programacion">
	          
	          <div class="row">                          
                <div class="col-md-6">
			    	<div class="box collapsed-box" >
			    		<div class="box-header with-border">
 							<i class="fa fa-map-marker"></i><h3 class="box-title">Desempeño Geográfico</h3>
 							<div class="box-tools pull-right">
			        			<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
			        			<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
			        		</div>
			        	</div>
			        	<div class="box-body" style="overflow: auto; display: block;">                                                           
                  			<div id="map" style="width: 800x; height: 600px"></div>						
					
						<script>						
						var totalDesempenhoDeptoDis=[];
						var pocentajeColor1 = parseInt(70);
						var pocentajeColor2 = parseInt(90);
						
						var distLayer;
						
						var entidadCas = "";
						entidadCas ="";
						
						var i=parseInt(0);
									
						function numeroConComa(x) {
							if (isNaN(x) || x == "Infinity"){
								return 0;
							}else{							
								return x.toString().replace(".", ",").replace(/(\d)(?:(?=\d+(?=[^\d.]))(?=(?:[0-9]{3})+\b)|(?=\d+(?=\.))(?=(?:[0-9]{3})+(?=\.)))/g, "$1.");
							}
						}
											
						var departamento = $.ajax({
					    	url:"/tablero/public/ajaxSelects3?action=getDepartamento",
					      	type:'get',
					      	dataType:'json',
					      	crossDomain:true,
					      	async:false       
					    }).responseText;
						departamento=JSON.parse(departamento);
						
						var distritos = $.ajax({
					    	url:'/tablero/public/ajaxSelects3?action=getDistrito',
					      	type:'get',
					      	dataType:'json',
					      	async:false       
					    }).responseText;
						distritos = JSON.parse(distritos);
						
						var instituciones = $.ajax({
					    	url:'/tablero/public/ajaxSelects4?action=getInstitucion',
					      	type:'get',
					      	dataType:'json',
					      	crossDomain:true,
					      	async:false       
					    }).responseText;
						instituciones=JSON.parse(instituciones);
												
	 					var desPaisDeptojson = $.ajax({
	 						url:'/tablero/public/ajaxSelects4?action=getResumenLineasAccionProgramacionInstDptoDist',
					      	type:'get',
					      	dataType:'json',
					      	crossDomain:true,
					      	async:false       
					    }).responseText;
						var desPaisDepto=JSON.parse(desPaisDeptojson);
																
						var desPaisDistjson = $.ajax({
					    	url:'/tablero/public/ajaxSelects4?action=getResumenLineasAccionProgramacionInstDptoDist3',
					      	type:'get',
					      	dataType:'json',
					      	crossDomain:true,
					      	async:false       
					    }).responseText;
						var desPaisDist=JSON.parse(desPaisDistjson);
										    
					    /*nuevo ajax select en vez de dist4*/
					   var desPaisDistInstjson = $.ajax({
					    	url:'/tablero/public/ajaxSelects4?action=getResumenLineasAccionProgramacionDptoDistInst',
					      	type:'get',
					      	dataType:'json',
					      	crossDomain:true,
					      	async:false       
					    }).responseText;
						var desPaisDistInst=JSON.parse(desPaisDistInstjson);
												
						
						var sumporAClass="";
						var porAejeClass="";
						var porHejeClass="";
						var porHejeClassRow="";
													
						function getColorDesemp2(val){
							if (parseFloat(val).toFixed(0)>=pocentajeColor2){
								return "green";
							}else{
								if (parseFloat(val).toFixed(0)>=pocentajeColor1){
									return  color="yellow";
								}else{
									return  color="red";
								}
							}
						}
						
						function setColorBarras(pocentajeColor1, pocentajeColor2){
							
							$("div.progress-bar").each(function(){
								var varlor = parseInt($(this).find('p').html());
								if (varlor >= pocentajeColor2){
									$(this).attr("class", "progress-bar bg-green-active color-palette");
								}else{
									if (varlor >= pocentajeColor1){
										$(this).attr("class", "progress-bar bg-yellow-active color-palette");
									}else{
										$(this).attr("class", "progress-bar bg-red-active color-palette");
									}
								}
							});
	
						}
						
						function getInstitucionesSeleccionadas(){						
							var institucionSelected="";
							//$("input[type=checkbox]:checked").each(function(){							
							$(".cmbInstitucion:checked").each(function(){
								var idInstitucion=$(this).attr('id').split("-");
							    //checkSeleccionado.push(idInstitucion[1]);
							    if (idInstitucion[1]!='a'){
							    	institucionSelected+=idInstitucion[1]+",";	
							    }
							     
							})
							institucionSelected=institucionSelected.substring(0,institucionSelected.length - 1);
							return institucionSelected;
						}
						
						function checkAll(bx) {
							var cbs = document.getElementsByTagName('input');
							for(var i=0; i < cbs.length; i++) {
							    if(cbs[i].type == 'checkbox') {
							      cbs[i].checked = bx.checked;
							    }
						  	}
							
							if(bx.checked == false) {
					    		$("#cuerpoTableroLineaAccion").html("");
					    	}else{
					    		if(bx.checked == true) {
					    			/* var aux=getInstitucionesSeleccionadas();
					    			renderTableroLineaAccion(aux,null,null) */
					    			
						    	}
					    	} 
						}
						var periodoActual = 2017;
						var depto_id =  null;
						var dist_id = null;
	
						function renderEntidades(e){
							
							var array=[];var tipoInstituciones="";
							$("#tablaInstituciones").html("");
							//$("#cuerpoTableroLineaAccion").html("");
							$("#nombreInstitucionTabla").html("");
						   	periodoSeleccionado = $("#periodoSeleccion option:selected").val();
						   	etiquetaSeleccionado = $("#etiquetaSeleccion option:selected").val();
							
							if (typeof e != 'undefined'){
								if (e.target.feature.properties.hasOwnProperty("distrito")){
									$('#dataTableInstituciones').dataTable().fnDestroy();
									tipoInstituciones="distrito";
									$("#cabeceraInstituciones").html("");
									$("#cabeceraInstituciones").append('<i class="fa fa-building-o"></i> Desempeño Institucional en: '+e.target.feature.properties.dpto_desc+' - '+e.target.feature.properties.dist_desc);
									var color="";
									$("#tablaInstituciones").html("");
							
									//Obtenemos desempeño de las instituciones
	 								var lineaAccionDepartamento = $.ajax({
								    	url:'/tablero/public/ajaxSelects4?action=getResumenLineasAccionProgramacionDesempenoInstitucionalDepto&departamentoId='+e.target.feature.properties.dpto+'&distritoId='+e.target.feature.properties.distrito+'&periodoId='+periodoSeleccionado+'&etiquetaId='+etiquetaSeleccionado,
								      	type:'get',
								      	dataType:'json',
								      	crossDomain:true,
								      	async:false       
								    }).responseText;
									lineaAccionDepartamento=JSON.parse(lineaAccionDepartamento);
									
									var desDepartInst= [];//Obtenemos el desempeño de las instituciones a nivel departamental
	
									//Obtenemos todos los datos de institucion, promedio, institucion sigla y nombre
					 				for(var i=0;i<lineaAccionDepartamento.length;i++){		
	
										var objeto = new Object(); 
										if(lineaAccionDepartamento[i] == 0){
											promedio = 0/0;
										}
										objeto.institucionId = lineaAccionDepartamento[i].id;
										objeto.promedio = lineaAccionDepartamento[i].promedio;
										objeto.institucion = lineaAccionDepartamento[i].nombre;
										objeto.institucionSigla = lineaAccionDepartamento[i].sigla;
										desDepartInst.push(objeto);
									}
									
									ordenInstitucionPais = instituciones;
									ordenInstitucionPais = ordenInstitucionPais.sort(
										function orden(a,b) {             
										  if (a.orden < b.orden)
											    return -1;
											  if (a.orden > b.orden)
											    return 1;
											  return 0;
										});
									
									
									for (var l = 0; l< ordenInstitucionPais.length;l++){
										for (var i = 0; i< desDepartInst.length;i++){
											if(desDepartInst[i].institucionId==ordenInstitucionPais[l].id){
												despTotDeptoInst=desDepartInst[i].promedio;
												color=getColorDesemp2(despTotDeptoInst);
												if (despTotDeptoInst !=0) $("#tablaInstituciones").append('<tr><td class="col-md-3"><input type="checkbox" class="cmbInstitucion" id=cmbInstitucion-'+desDepartInst[i].institucionId+' checked="true"><a tipo="filtroPorEntidad" class="linkInstitucion" institucion_id='+desDepartInst[i].institucionId+' data-toggle="tooltip" data-placement="top" title="'+desDepartInst[i].institucion+'"> '+desDepartInst[i].institucionSigla+'</a></td><td class="col-md-9"><div class="progress progress-xs"> <div class="progress-bar bg-'+color+'-active color-palette" style="width: '+parseFloat(despTotDeptoInst).toFixed(0)+'%"><p class="text-left">'+parseFloat(despTotDeptoInst).toFixed(2)+'%</p></div></div></td></tr>');
											}
										}
									}
									
									$("#dataTableInstituciones").DataTable(
										{
									        dom: 'Bfrtip',
									        buttons: [
									                    {
									                        extend: 'copy',
									                        exportOptions: {
									                    columns: [ 0, 1]
									                }
									                    },
									                    {
									                        extend: 'csv',
									                        exportOptions: {
									                    columns: [ 0, 1]
									                }
									                    },
									                    {
									                        extend: 'excel',
									                        exportOptions: {
									                    columns: [ 0, 1]
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
									                    columns: [ 0, 1]
									                }
									                    }
									                ],
									        "search": {
									            "regex": true
											},
											  "pageLength": 150,
											  ordering: false
										}
									);
									
									var todasInstituciones=getInstitucionesSeleccionadas();
									var a=renderTableroLineaAccion(todasInstituciones,e.target.feature.properties.dpto,e.target.feature.properties.distrito,periodoSeleccionado,etiquetaSeleccionado);
									depto_id = e.target.feature.properties.dpto;
									dist_id = e.target.feature.properties.distrito;
									$("#cuerpoTableroLineaAccion").html("");
									$("#cuerpoTableroLineaAccion").html(a);
								}else{
									$('#dataTableInstituciones').dataTable().fnDestroy();
									tipoInstituciones="departamento"; 
									array=lineaAccionDepartamento;
									$("#cabeceraInstituciones").html("");
									$("#cabeceraInstituciones").append('<i class="fa fa-building-o"></i> Desempeño Institucional en: '+e.target.feature.properties.dpto_desc);
									$("#cuerpoTableroLineaAccion").html("");
									$("#nombreInstitucionTabla").html("");
									$("#tablaInstituciones").html("");
									var color="";var depemDeptoInst;var countDeptoInst;var despTotDeptoInst;var ordenInstitucionPais = [];
									var periodoSeleccionado = $("#periodoSeleccion option:selected").val();
	
	 								var lineaAccionDepartamento = $.ajax({
								    	url:'/tablero/public/ajaxSelects4?action=getResumenLineasAccionProgramacionDesempenoInstitucionalDepto&departamentoId='+e.target.feature.properties.dpto+'&periodoId='+periodoSeleccionado+'&etiquetaId='+etiquetaSeleccionado,
								      	type:'get',
								      	dataType:'json',
								      	crossDomain:true,
								      	async:false       
								    }).responseText;
									lineaAccionDepartamento=JSON.parse(lineaAccionDepartamento);
									
									
									var desDepartInst= [];//Obtenemos el desempeño de las instituciones a nivel departamental
	
									//Obtenemos todos los datos de institucion, promedio, institucion sigla y nombre
					 				for(var i=0;i<lineaAccionDepartamento.length;i++){		
	
										var objeto = new Object(); 
										if(lineaAccionDepartamento[i] == 0){
											promedio = 0/0;
										}
										objeto.institucionId = lineaAccionDepartamento[i].id;
										objeto.promedio = lineaAccionDepartamento[i].promedio;
										objeto.institucion = lineaAccionDepartamento[i].nombre;
										objeto.institucionSigla = lineaAccionDepartamento[i].sigla;
										desDepartInst.push(objeto);
									}
									
									ordenInstitucionPais = instituciones;
									ordenInstitucionPais = ordenInstitucionPais.sort(
										function orden(a,b) {             
										  if (a.orden < b.orden)
											    return -1;
											  if (a.orden > b.orden)
											    return 1;
											  return 0;
											});
									
									for (var l = 0; l< ordenInstitucionPais.length;l++){
										for (var i = 0; i< desDepartInst.length;i++){
											if(desDepartInst[i].institucionId==ordenInstitucionPais[l].id){
												despTotDeptoInst=desDepartInst[i].promedio;
												color=getColorDesemp2(despTotDeptoInst);
												if (despTotDeptoInst !=0) $("#tablaInstituciones").append('<tr><td class="col-md-3"><input type="checkbox" class="cmbInstitucion" id=cmbInstitucion-'+desDepartInst[i].institucionId+' checked="true"><a tipo="filtroPorEntidad" class="linkInstitucion" institucion_id='+desDepartInst[i].institucionId+' data-toggle="tooltip" data-placement="top" title="'+desDepartInst[i].institucion+'"> '+desDepartInst[i].institucionSigla+'</a></td><td class="col-md-9"><div class="progress progress-xs"> <div class="progress-bar bg-'+color+'-active color-palette" style="width: '+parseFloat(despTotDeptoInst).toFixed(0)+'%"><p class="text-left">'+parseFloat(despTotDeptoInst).toFixed(2)+'%</p></div></div></td></tr>');
											}
										}
									}
									$("#dataTableInstituciones").DataTable(
										{
									        dom: 'Bfrtip',
									        buttons: [
									                    {
									                        extend: 'copy',
									                        exportOptions: {
									                    columns: [ 0, 1]
									                }
									                    },
									                    {
									                        extend: 'csv',
									                        exportOptions: {
									                    columns: [ 0, 1]
									                }
									                    },
									                    {
									                        extend: 'excel',
									                        exportOptions: {
									                    columns: [ 0, 1]
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
									                    columns: [ 0, 1]
									                }
									                    }
									                ],
									        "search": {
									            "regex": true
											},
											  "pageLength": 150,
											  ordering: false
										}
									);
									var todasInstituciones=getInstitucionesSeleccionadas();
									var a=renderTableroLineaAccion(todasInstituciones,e.target.feature.properties.dpto,null,periodoSeleccionado,etiquetaSeleccionado);
									dist_id = null;
									depto_id = e.target.feature.properties.dpto;
									//getPeriodo();
									$("#cuerpoTableroLineaAccion").html("");
									$("#cuerpoTableroLineaAccion").html(a);
								}
							}else{ //d
								var color="";var depemInst;var countInst;var despTotInst; var ordenInstitucionPais = [];
					        	//obtenemos todas las instituciones en el back end y su desempeño institucional a nivel país
								var desPaisInstjson = $.ajax({
			 						url:'/tablero/public/ajaxSelects4?action=getResumenLineasAccionProgramacionDesempenoInstitucional&periodoId='+periodoSeleccionado,
							      	type:'get',
							      	dataType:'json',
							      	crossDomain:true,
							      	async:false       
							    }).responseText;
								var desPaisInstAux=JSON.parse(desPaisInstjson);
								
								var desPaisInst= [];
	
				 				for(var i=0;i<desPaisInstAux.length;i++){		
	
									var objeto = new Object(); 
									if(desPaisInstAux[i] == 0){
										promedio = 0/0;
									}
									objeto.institucionId = desPaisInstAux[i].id;
									objeto.promedio = desPaisInstAux[i].promedio;
									objeto.institucion = desPaisInstAux[i].nombre;
									objeto.institucionSigla = desPaisInstAux[i].sigla;
									desPaisInst.push(objeto);
								}
								
								$("#cabeceraInstituciones").html("Desempeño Institucional");
								
								ordenInstitucionPais = instituciones;
								ordenInstitucionPais = ordenInstitucionPais.sort(
									function orden(a,b) {             
									  if (a.orden < b.orden)
										    return -1;
										  if (a.orden > b.orden)
										    return 1;
										  return 0;
										});
								
								for (var l = 0; l< ordenInstitucionPais.length;l++){
									for (var i = 0; i< desPaisInst.length;i++){
										if(desPaisInst[i].institucionId==ordenInstitucionPais[l].id){
											despTotInst=desPaisInst[i].promedio;
											color=getColorDesemp2(despTotInst);
											if (despTotInst !=0) $("#tablaInstituciones").append('<tr><td class="col-md-3"><input type="checkbox" class="cmbInstitucion" id=cmbInstitucion-'+desPaisInst[i].institucionId+' checked="true"><a tipo="filtroPorEntidad" class="linkInstitucion" institucion_id='+desPaisInst[i].institucionId+' data-toggle="tooltip" data-placement="top" title="'+desPaisInst[i].institucion+'"> '+desPaisInst[i].institucionSigla+'</a></td><td class="col-md-9"><div class="progress progress-xs"> <div class="progress-bar bg-'+color+'-active color-palette" style="width: '+parseFloat(despTotInst).toFixed(0)+'%"><p class="text-left">'+parseFloat(despTotInst).toFixed(2)+'%</p></div></div></td></tr>');
										}
									}
								}
								
								$("#dataTableInstituciones").DataTable(
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
													  "pageLength": 200,
													  ordering: false
										}
								);
								
							}
						}//fin funcion "renderEntidades"
						
						function renderLineaAccion(depto_id, institucion_id, dist_id)
						{
							var iteracionDepto=0;
							var porcentajeAnhoAcumuladoDepto=0;
							var porcentajeHoyEjeAcumuladoDepto=0;
							var porcentajeAnhoAcumuladoDeptoTotal=0;
							var porcentajeHoyEjeAcumuladoDeptoTotal=0;
	
							$("#cuerpoTabla").html("");
							var lineasDeAccion= [];
							
							if (dist_id=="" && depto_id != ""){
								var metasDistEntLineajson = $.ajax({
							    	url:'/tablero/public/ajaxSelects3?action=getMetasDistEntLinea&departamento='+depto_id+'&institucion_id='+institucion_id,
							      	type:'get',
							      	dataType:'json',
							      	crossDomain:true,
							      	async:false       
							    }).responseText;
								var metasDistEntLinea=JSON.parse(metasDistEntLineajson);
								var desemp=0.0;
								var color="";
								var porHejeClassRow="";
								var acumuladorPlanificacionAnho=0.0;
								var acumuladorPlanificacion=0.0;
								var acumuladorEjecucion=0.0;
								var acumuladorInversion=0.0;
								var desempenho=0.0;
								var lineasDeAccion=[];
								
								for(var l=0;l<metasDistEntLinea.length;l++){
								
									if (lineasDeAccion.indexOf(metasDistEntLinea[l].lineaAccionId)<0){
										lineasDeAccion.push(metasDistEntLinea[l].lineaAccionId);
										acumuladorPlanificacionAnho=0.0;
										acumuladorPlanificacion=0.0;
										acumuladorEjecucion=0.0;
										acumuladorInversion=0.0;
										
										for(var k=0;k<metasDistEntLinea.length;k++){
											if(metasDistEntLinea[l].lineaAccionId==metasDistEntLinea[k].lineaAccionId){
												acumuladorPlanificacionAnho += parseFloat(metasDistEntLinea[k].sumProgAnho);
												acumuladorPlanificacion += parseFloat(metasDistEntLinea[k].cantidadProgHoy);
												acumuladorEjecucion += parseFloat(metasDistEntLinea[k].cantidadEjecHoy);
												acumuladorInversion += parseFloat(metasDistEntLinea[k].costoProgHoy);													
											}
										}
										desempenho = parseFloat((acumuladorEjecucion/acumuladorPlanificacion)*100);
										color= getColorDesemp2(desempenho)
										$("#cuerpoTabla").append('<tr class="'+porHejeClassRow+'"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#myModal" class="registro" codigoRegistro='+l+'-'+metasDistEntLinea[l].institucionId+'-'+metasDistEntLinea[l].lineaAccionId+'-'+metasDistEntLinea[l].accionDepartamentoId+'> '+metasDistEntLinea[l].institucion+'- '+metasDistEntLinea[l].lineaAccion+'</a></td><td>'+metasDistEntLinea[l].accionUnidadMedida+'</td><td >'+numeroConComa(parseFloat(acumuladorPlanificacionAnho).toFixed(2))+'</td><td class="cell-bordered2">'+numeroConComa(parseFloat(acumuladorPlanificacion).toFixed(2))+'</td><td >'+numeroConComa(parseFloat(acumuladorEjecucion).toFixed(2))+'</td><td >'+numeroConComa(parseFloat(desempenho).toFixed(2))+'</td><td>'+numeroConComa((acumuladorInversion/1000000).toFixed(0)))+'</td></tr>';
									}
									
			
								}
							}else{
								var metasDistEntLineajson = $.ajax({
							    	url:'/tablero/public/ajaxSelects3?action=getMetasDistEntLinea&departamento='+depto_id+'&distrito='+dist_id+'&institucion_id='+institucion_id,
							      	type:'get',
							      	dataType:'json',
							      	crossDomain:true,
							      	async:false       
							    }).responseText;
								var metasDistEntLinea=JSON.parse(metasDistEntLineajson);
								var desemp=0.0;
								var color="";
								var porHejeClassRow="";
								for(var j=0;j<metasDistEntLinea.length;j++){
									
									desemp = parseFloat((metasDistEntLinea[j].cantidadEjecHoy/metasDistEntLinea[j].cantidadProgHoy)*100);
									color= getColorDesemp2(desemp)
									$("#cuerpoTabla").append('<tr class="'+porHejeClassRow+'"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#myModal" class="registro" codigoRegistro='+j+'-'+metasDistEntLinea[j].institucionId+'-'+metasDistEntLinea[j].lineaAccionId+'-'+metasDistEntLinea[j].accionDepartamentoId+'-'+metasDistEntLinea[j].accionDistritoId+'> '+metasDistEntLinea[j].institucion+'- '+metasDistEntLinea[j].lineaAccion+'</a></td><td>'+metasDistEntLinea[j].accionUnidadMedida+'</td><td >'+numeroConComa(metasDistEntLinea[j].sumProgAnho)+'</td><td class="cell-bordered2">'+numeroConComa(metasDistEntLinea[j].cantidadProgHoy)+'</td><td >'+numeroConComa(metasDistEntLinea[j].cantidadEjecHoy)+'</td><td >'+numeroConComa(parseFloat(desemp).toFixed(2))+'</td><td>'+numeroConComa((metasDistEntLinea[j].costoEjecHoy/1000000).toFixed(0))+'</td></tr>');	
								}
		
								
								
							}
						}//fin renderLineaAccion
							////////////////////////////////////////////////////////////////////////////////////////////////////////////
						
							function getColor(d) {
							  
							  return d >= pocentajeColor2  ? '#008d4c' :
							           d >= pocentajeColor1  ? '#db8b0b' :
							                      '#d33724';
							 
							}
							
	
							function getColorDesemp2(val) {
								if (parseFloat(val).toFixed(0) >= pocentajeColor2) {
									return "green";
								} else {
									if (parseFloat(val).toFixed(0) >= pocentajeColor1) {
										return color = "yellow";
									} else {
										return color = "red";
									}
								}
							}
							
							function setColorBarras(pocentajeColor1, pocentajeColor2){
								
								$("div.progress-bar").each(function(){
									var varlor = parseInt($(this).find('p').html());
									if (varlor >= pocentajeColor2){
										$(this).attr("class", "progress-bar bg-green-active color-palette");
									}else{
										if (varlor >= pocentajeColor1){
											$(this).attr("class", "progress-bar bg-yellow-active color-palette");
										}else{
											$(this).attr("class", "progress-bar bg-red-active color-palette");
										}
									}
								});
	
							}
							
							function highlightFeature(e) {
							    var layer = e.target;
	
							    layer.setStyle({
							        weight: 4,
							        color: '#666',
							        dashArray: '',
							        fillOpacity: 0.7
							    });
	
							    if (!L.Browser.ie && !L.Browser.opera) {
							        layer.bringToFront();
							    }
							    info.update(layer.feature.properties);
							}
							function highlightFeature2(e) {
							    var layer = e.target;
								
							    layer.setStyle({
							        weight: 5,
							        fillOpacity: 1,
							        dashArray: '1'
							    });
	
							    if (!L.Browser.ie && !L.Browser.opera) {
							        layer.bringToFront();
							    }
							    info2.update(layer.feature.properties);
							}
	
							function compareGenerico(a,b) {       
								  if (a.clave < b.clave)
								    return -1;
								  if (a.clave > b.clave)
								    return 1;
								  return 0;
							}
							
							function getClave2(array, clave1, clave2) {
								var val;
								for (val of array){
									if (val.clave1==clave1 && val.clave2==clave2)
										return val.valor;
								}
							}
							
							desPaisDepto=desPaisDepto.sort(compareGenerico);
							
							//se define una funcion de estilo para la capa de GEOJSON para cada departamento
							function style(feature) {
								return {
									 fillColor: getColor(desPaisDepto[parseInt(feature.properties.dpto)]),
							        weight: 2,
							        //opacity: 0.6,
							        color: 'white',
							        dashArray: '2',
							        fillOpacity: 0.6
							    };						    
							}
							//se define una funcion de estilo para la capa de GEOJSON para cada distrito 
							function style2(feature) {
								return {
									fillColor: getColor(getClave2(desPaisDist,parseInt(feature.properties.dpto), parseInt(feature.properties.distrito))),
									//fillColor: getColor(getClave2(totalDesempenhoDeptoDis,parseInt(feature.properties.dpto), parseInt(feature.properties.distrito))),
							        weight: 2,
							        //opacity: 0.6,
							        color: 'white',
							        dashArray: '2',
							        fillOpacity: 1
							    };						    
							}
							function highlightFeatureMouseHover(e) {
								var layer = e.target;
								
								if (typeof distLayer == "undefined") {//Highlight mouseHover por departamentos			
								    layer.setStyle({
								        weight: 5,
								        color: '#333',
								        dashArray: '2',
								        fillOpacity: 1
								    });
							
								    if (!L.Browser.ie && !L.Browser.opera) {
								        layer.bringToFront();
								    }
								    
								    info.update(layer.feature.properties);
								}		
							}
							
							function resetHighlightMouseHover(e) {
							    if (typeof distLayer == "undefined"){//reset por departamento
									depto.resetStyle(e.target);
									//depto.eachLayer(function(l){depto.resetStyle(l);});
									info.update()
							    } 
							    
							}
							
							function highlightFeatureMouseHover2(e) {
								var layer = e.target;
								if (typeof distLayer != "undefined") { //Highlight mouseHover por distritos						
							    layer.setStyle({
							        weight: 5,
							        color: '#333',
							        dashArray: '2',
							        fillOpacity: 1
							    });
	
							    if (!L.Browser.ie && !L.Browser.opera) {
							        layer.bringToFront();
							    }
							    
							    info2.update(layer.feature.properties);	
								}
							}
							
							function resetHighlightMouseHover2(e) {
								//if (typeof distLayer != "undefined"){//reset por departamento
									//depto.resetStyle(e.target);
							    	distLayer.eachLayer(function(l2){distLayer.resetStyle(l2);});
								    info2.update();
								//}
							} 
							
							function onEachFeature(feature, layer) {
								layer.on({				
									mouseover: highlightFeatureMouseHover,
							        mouseout: resetHighlightMouseHover,
							        click: renderEntidad
								});
							}
							
							function onEachFeature2(feature, layer) {
								layer.on({				
									mouseover: highlightFeatureMouseHover2,
							        mouseout: resetHighlightMouseHover2,
							        click: renderEntidad
								});
							}
	
							
							var map = L.map('map',{							
								maxZoom: 10,
								minZoom: 6,
								zoomControl: false,
								attributionControl: false
							}).setView([-23.2, -58], 6);
							
							var depto = new L.geoJson(deptoGeojson,{style:style,onEachFeature: onEachFeature});
							depto.addTo(map);
							
							////////////////////////////////////////////
	
							//Despliega un Div con Información sobre el Departamento.
							var info = L.control({position: 'bottomright'});
							info.onAdd = function (map) {
							    this._div = L.DomUtil.create('div', 'info'); // create a div with a class "info"
							    this.update();
							    return this._div;
							};
							//metodo que usamos para actualizar el control basado en el feature
							info.update = function (props) {	
								//si existe el objeto props y l es encontrada se despliega su nombre en el div, de lo contrario el texto.
							    this._div.innerHTML = '<h4>Departamento: </h4>' + (props ?
							       	 '<b>' + props.dpto_desc + '</b><br />' : 'Apunte sobre un Departamento.');
							};
							info.addTo(map);
							
							//Despliega un Div con Información sobre el Distrito
						  	var info2 = L.control({position: 'bottomright'});
							function desplegarInfoDistrito() {	
								
								info2.onAdd = function (map) {
								    this._div = L.DomUtil.create('div', 'info'); // create a div with a class "info"
								    this.update();
								    return this._div;
								};
								//metodo que usamos para actualizar el control basado en el feature
								info2.update = function (props) {	
									//si existe el objeto props y l es encontrada se despliega su nombre en el div, de lo contrario el texto.
								    this._div.innerHTML = '<h4>Distrito: </h4>' + (props ?
								        '<b>' + props.dist_desc + '</b><br />' : 'Apunte sobre un Distrito.'); //dist_desc
								};
								info2.addTo(map);
							
							}
								
							//leyenda del mapa  
							var legend = L.control({position: 'bottomleft'});
							
							//creación de la leyenda
							legend.onAdd = function (map) {
							    this._div = L.DomUtil.create('div', 'info legend');// crea un div con la class "info legend"
							    
							    var grades = [0, pocentajeColor1, pocentajeColor2], labels = [];
							    
							    this._div.innerHTML = '<h4>Rango: </h4>'
						
							    //bucle de creacion de porcentaje y generacion de una etiqueta con un cuadrado de color para cada intervalo
								for (var i = 0; i < grades.length; i++) {
							        this._div.innerHTML +=
							        	'<p><i style="background:' + getColor(grades[i] + 1) + '"></i> ' +
							            grades[i] + (grades[i + 1] ? '&ndash;' + grades[i + 1] + '%' + '</p>' : '%' + '+' + '</p>');
								}
								this.update()
								return this._div;
							};
							
							//actualizador de leyenda
							legend.update = function (){
								var grades = [0, pocentajeColor1, pocentajeColor2], labels = [];
								
								this._div.innerHTML = '<h4>Rango: </h4>'
							
							    //bucle de creacion de porcentaje y generacion de una etiqueta con un cuadrado de color para cada intervalo
							    for (var i = 0; i < grades.length; i++) {
							        this._div.innerHTML +=
							            '<p><i style="background:' + getColor(grades[i] + 1) + '"></i> ' +
							            grades[i] + (grades[i + 1] ? '&ndash;' + grades[i + 1] + '%' + '</p>' : '%' + '+' + '</p>');
							    }
							}
							
							legend.addTo(map);
							
							//Texto de atribución
							L.control.attribution({prefix: false}).addTo(map);
							
							//Posición del Zoom
							L.control.zoom({position: 'topright', zoomInTitle: 'Acercar', zoomOutTitle: 'Alejar'}).addTo(map);
				
							/////////////////////////////////////////////
							
							function renderEntidad(e){
								$("#cuerpoTabla").html("");
								
								depto.eachLayer(function(l){depto.resetStyle(l);});
								if (typeof distLayer !== "undefined"){
									if (e.target.feature.properties.hasOwnProperty("distrito")){
										renderEntidades(e);
										distLayer.eachLayer(function(l2){distLayer.resetStyle(l2);});
										//highlightFeature2(e);
									
									}else{
										map.removeLayer(distLayer);
										highlightFeature(e);
										renderEntidades(e);
										map.fitBounds(e.target.getBounds());
										e.target.feature.properties.dpto
										distLayer = new L.GeoJSON.AJAX("mapa/"+e.target.feature.properties.dpto+".geojson",{style:style2,onEachFeature: onEachFeature2});
										distLayer.addTo(map);
										
									}
								}else{
									highlightFeature(e);
									renderEntidades(e);
									map.fitBounds(e.target.getBounds());
									e.target.feature.properties.dpto
									distLayer = new L.GeoJSON.AJAX("mapa/"+e.target.feature.properties.dpto+".geojson",{style:style2,onEachFeature: onEachFeature2});
									distLayer.addTo(map);
									desplegarInfoDistrito();
									/* var distritos = new L.geoJson(dist0Geojson,{style:style2,onEachFeature: onEachFeature2});
									distritos.addTo(map);*/
								}
	
							}
							/*function onEachFeature(feature, layer) {
							layer.on({*/
									click: renderEntidad
								/*});
							}*/
								//funcion para el slider que cambia los parametros de colores
								$(document).ready(function(){
	
									$("#ex12c").slider({
										id: "slider12c",
										min: 0,
										max: 100,
										range: true,
										value: [ 70, 90 ]
									});
	
	
									$("body").on("change", "#ex12c",function(event){
										var rangoDeColor= $("#ex12c").attr("value");
										var splitDeRango=rangoDeColor.split(",");
										pocentajeColor1 = parseInt(splitDeRango[0]);
										pocentajeColor2 = parseInt(splitDeRango[1]); 
										if (typeof distLayer !== "undefined"){
											distLayer.eachLayer(function(l2){distLayer.resetStyle(l2);});
										}
										setColorBarras(pocentajeColor1, pocentajeColor2);
										legend.update();
										depto.eachLayer(function(l){depto.resetStyle(l);});
	
									});
								});
	
						</script>
                                    
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
            
			<div class="col-md-6">
		    	<div class="box collapsed-box" >
		    		<div class="box-header with-border">
		      			<h4 id="cabeceraInstituciones">Desempeño Institucional</h4>
		        		<div class="box-tools pull-right">
		        			<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
		        			<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
		        		</div>
		        	</div>
		        	<div class="box-body" style="height:600px; overflow: auto; display: block;">
						<div class="table-responsive">
							<table class="table table-condensed table-hover" style="margin-bottom: 0px;" id="dataTableInstituciones">
	            				<thead>
		        					<tr><th class="col-md-3"><input type="checkbox" onclick="checkAll(this)" class="cmbInstitucion" id="cmbInstitucion-a" checked="true" data-toggle="tooltip" data-placement="top" title="Marcar / Desmarcar todas">Institución</th><th class="col-md-9">Desempeño</th></tr>
	            				</thead>		
	            				<tbody id="tablaInstituciones">
	            				</tbody>		            		            
    						</table>
    					</div>	    			
		        	</div>
		        	<div class="box-footer" style="height:auto; overflow: auto; display: none;">
		        	</div>
				</div>
			</div>
                                            
         </div>	          
	          
	      <div class="row">
	        <div class="col-md-12">
	          <div class="box" height="1000px">
	            <div class="box-header with-border" height="1000px">
	              <h2 class="box-title text-center" id="tituloTipoPrograma">
	                Tablero de Control Presidencial - STP 	
	              </h2>	              
	            </div>
	            <div class="box-body table-responsive" style="scroll-x:hidden;scroll-y:auto;" id="cuerpoTableroLineaAccion">
            
	            </div>
			   </div>
			</div>
          </div><!-- /.row -->
                                 
    </section><!-- /.content -->
      </div><!-- /.content-wrapper -->

      <footer class="main-footer">
        <div class="pull-right hidden-xs">
          <span>Todos los derechos reservados.</span>
        </div>
        <strong>2017 - <a href="http://www.stp.gov.py">Secretaría Técnica de Planificación del desarrollo económico y social</a>.</strong> <br/>        	    
      </footer>

      <!-- Control Sidebar -->
      <aside class="control-sidebar control-sidebar-light">
		<%@ include file="/frames/control-sidebar.jsp"  %>
      </aside><!-- /.control-sidebar -->
      <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
      <div class='control-sidebar-bg'></div>

    </div><!-- ./wrapper -->

    <!-- jQuery 2.1.3 -->
    <script src="plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
     <!-- DATA TABES SCRIPT -->    
    <script src="plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>            
	<script src="plugins/datatables/dataTables.buttons.min.js" type="text/javascript"></script>
	<script src="plugins/datatables/buttons.flash.min.js" type="text/javascript"></script>
	<script src="plugins/datatables/jszip.min.js" type="text/javascript"></script>
	<script src="plugins/datatables/pdfmake.min.js" type="text/javascript"></script>
	<script src="plugins/datatables/vfs_fonts.js" type="text/javascript"></script>
	<script src="plugins/datatables/buttons.html5.min.js" type="text/javascript"></script>
	<script src="plugins/datatables/buttons.print.min.js" type="text/javascript"></script>
    <script src="plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
    <!-- AdminLTE App -->
    <script src="dist/js/app.min.js" type="text/javascript"></script>    
    <!-- daterangepicker -->
    <script src="plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
    <!-- datepicker -->
    <script src="plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>    
    <!-- ChartJS 1.0.1 -->
    <script src="plugins/chartjs/Chart.min.js" type="text/javascript"></script>    
    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js" type="text/javascript"></script>
     
<!-- Piwik -->
<script type="text/javascript">

  var _paq = _paq || [];
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {
    var u="//infra.stp.gov.py/monitoreoweb/";
    _paq.push(['setTrackerUrl', u+'piwik.php']);
    _paq.push(['setSiteId', 9]);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
  })();
</script>
<noscript><p><img src="//infra.stp.gov.py/monitoreoweb/piwik.php?idsite=9" style="border:0;" alt="" /></p></noscript>
<!-- End Piwik Code -->
 
<script type="text/javascript" src="bootstrap/js/bootstrap-slider.js"></script>
<script>
$("body").on("click", "#cierreEtiquetaDepartamento",function(event){
	var distrito;
	if($("#cierreEtiquetaDistrito").attr("value")!= ""){
		alert ("existe un distrito");			
	}else{
		alert("puede cerrar");		
	}	
});

$("body").on("click", "#cierreEtiquetaDistrito",function(event){
	var idDepartamento = $(this).attr("parametroDepartamento");
	renderEntidades(idDepartamento);
	
});

function numeroConComa(x) {
	if (isNaN(x)){
		return 0;
	}else
		if ( x == "Infinity"){
			return "-"  
			//return "100"
		}else if (x == null){
			return "-"		
		}else{
			return x.toString().replace(".00","").replace(".", ",").replace(/\B(?=(\d{3})+(?!\d))/g, ".");
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
function lineaAccionOrdenInstitucion(a,b) {             
	  if (a.institucionOrden < b.institucionOrden)
	    return -1;
	  if (a.institucionOrden > b.institucionOrden)
	    return 1;
	  return 0;
	}
		
function renderTableroLineaAccion(institucionIdConcat,deptoId,distId,periodo,etiqueta){
	var contenidoEnRowTemp="";	
	var tablaInstituciones="";
	var tempInstituciones="";
	var tempInstLineas="";
	var flagIns=0;
	var clase="";
	var condicion="";
	
	if(institucionIdConcat!=null)condicion= "&institucionIdConcat="+institucionIdConcat;
	if(deptoId!=null)condicion+= "&departamentoId="+deptoId;
	if(distId!=null)condicion+= "&distritoId="+distId;
	if(periodo!=null)condicion+= "&periodoId="+periodo;
	if(etiqueta!=null)condicion+= "&etiquetaId="+etiqueta;

	if(deptoId!=null && distId!=null){
		var lineasProgramadas = $.ajax({
			url:'/tablero/public/ajaxSelects4?action=getLineaAccionDepartamentalDistrital'+condicion,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		lineasProgramadas = JSON.parse(lineasProgramadas);
		if(lineasProgramadas != null){
			contenidoEnRowTemp = renderNivelDistrital(lineasProgramadas, deptoId, distId);
			return contenidoEnRowTemp;
		}
	
	}else if(deptoId!=null && distId==null){
		var lineasProgramadas = $.ajax({
			url:'/tablero/public/ajaxSelects4?action=getLineaAccionDepartamentalDistrital'+condicion,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		lineasProgramadas = JSON.parse(lineasProgramadas);
		
		tablaInstituciones = renderNivelDepartamento(lineasProgramadas, deptoId, distId);
		  
		 contenidoEnRowTemp='<div class="row">'+
	     '<div class="col-md-12">'+
	      '<div class="box" height="1000px">'+
	        '<div class="box-body" >'+
	        	'<div class="table-responsive">'+
	      			'<table class="table table-striped table-bordered table-hover tablaLineasPorInstitucion">'+
	      				tablaInstituciones+
						'</tbody></table>'+
					'</div>'+
	        '</div>'+
		   '</div>'+
		   '</div>'+
		   '</div>';
		   
		 return contenidoEnRowTemp;
		   
	}else{
		var lineasProgramadas = $.ajax({
			url:'/tablero/public/ajaxSelects4?action=getResumenLineasAccionProgramacion'+condicion,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		lineasProgramadas = JSON.parse(lineasProgramadas);
		lineasProgramadas=lineasProgramadas.sort(lineaAccionOrden);
		
			for(var m=0; m<instituciones.length;m++)
			{ 
			  	for(var n=0; n<lineasProgramadas.length;n++)
				{
					if( (instituciones[m].id==lineasProgramadas[n].institucionId && lineasProgramadas[n].cantidadAnho != 0 && lineasProgramadas[n].cantidadAvance != 0) || ( instituciones[m].id==lineasProgramadas[n].institucionId && lineasProgramadas[n].cantidadAnho != 0 && lineasProgramadas[n].cantidadAvance == 0) || ( instituciones[m].id==lineasProgramadas[n].institucionId && lineasProgramadas[n].cantidadAnho == 0 && lineasProgramadas[n].cantidadAvance != 0) ){	
						if (flagIns == 0){					  
							tempInstituciones += '<tr><td colspan="12"><strong>'+lineasProgramadas[n].institucionSigla+' - '+instituciones[m].nombre.toUpperCase();+'</strong></td></tr>';
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
						  
						if (distId == null) distId = "";
						if (deptoId == null) deptoId = "";
						  
						tempInstLineas += '<tr>'+
						'<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a data-toggle="modal" data-target="#myModal" class="registro" codigoRegistro='+n+'-'+lineasProgramadas[n].institucionId+'-'+lineasProgramadas[n].lineaAccionId+'-'+deptoId+'-'+distId+' href="#">'+lineasProgramadas[n].lineaAccionNombre+'</a></td>'+
						'<td>'+lineasProgramadas[n].lineaAccionUnidadMedidaNombre+'</td>'+
						'<td>'+numeroConComa(lineasProgramadas[n].meta)+'</td>'+
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
						if (desempEjeHoy!="-" && lineasProgramadas[n].meta != 0){
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
							tempInstLineas += '<td>'+numeroConComa(lineasProgramadas[n].cantDestinatarioReal)+'</td>';
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
			//tablaInstituciones+="</tbody>";
			
			 contenidoEnRowTemp='<div class="row">'+
	         '<div class="col-md-12">'+
	          '<div class="box" height="1000px">'+
	            /* '<div class="box-header with-border" height="1000px">'+
	              '<h3 class="box-title" id="tituloTipoPrograma">'+
	              //lineasEstrategicas[l].nombre+
	              '</h3> '+
	              '<div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
	              '</div>'+
	            '</div>'+ */
	            '<div class="box-body" >'+
	            	'<div class="table-responsive">'+
	          			'<table class="table table-striped table-bordered table-hover tablaLineasPorInstitucion">'+
	          			'<thead><tr>'+
	          		  	'<th rowspan="3" class="text-center" style="vertical-align: middle;">Línea de Acción</th>'+
	          		  	'<th rowspan="3" class="text-center" style="vertical-align: middle;">Unidad de Medida</th>'+
	          		  	'<th colspan="5" class="text-center">Plan de Acción 2017</th>'+
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
	          	    '</tr></thead><tbody>'+
	          				tablaInstituciones+
	  					'</tbody></table>'+
	  				'</div>'+
	            '</div>'+
			   '</div>'+
			   '</div>'+
			   '</div>';
			   
	 return contenidoEnRowTemp;
	}//fin del el
}

function renderNivelDepartamento(lineasProgramadas, deptoId, distId){
	var tablaInstituciones="";
	var tempInstituciones="";
	var tempInstLineas="";
	var todasLasLineas = "";
	var flagIns=0;
	var clase="";
	
	var condicion="";
	var linea_accion_id="";
	var cont, contEjecucion, destinatarios, inversion; 
	var acum, acumEjecucionPrevista, acumEjecucionLograda;
	var promedio;
	var institucionId;
	var totalDestinatario;
	var totalProgramado;
	var inversionEstimada;

  	tablaInstituciones = '<thead><tr>'+
		'<th rowspan="3" class="text-center" style="vertical-align: middle;">Línea de Acción</th>'+
		'<th rowspan="3" class="text-center" style="vertical-align: middle;">Unidad de Medida</th>'+
		'<th colspan="5" class="text-center">Plan de Acción 2017</th>'+
		'<th colspan="5" class="text-center">Ejecución a la Fecha</th></tr>'+
	'<tr><th  class="text-center">Meta</th>'+
		'<th rowspan="2" class="text-center" style="vertical-align: middle;">Destinatarios</th>'+
		'<th rowspan="2" class="text-center" style="vertical-align: middle;">Inversión (en millones G.)</th>'+
		'<th colspan="3" class="text-center">Meta</th>'+
		'<th rowspan="2" class="text-center" style="vertical-align: middle;">Destinatarios</th>'+
		'<th rowspan="2" class="text-center" style="vertical-align: middle;">Inversión (en millones G.)</th></tr>'+
	'<tr>'+
		'<th class="text-center">Programada</th>'+
		//'<th class="text-center">%</th>'+
		'<th class="text-center">Prevista</th>'+
		'<th class="text-center">Lograda</th>'+
		'<th class="text-center">%</th>'+
	'</tr></thead><tbody>';
	//lineasProgramadas = lineasProgramadas.sort(orden);-----------------------------

	if(lineasProgramadas.length > 0){
		linea_accion_id=lineasProgramadas[0].lineaAccionId;
		institucionId=lineasProgramadas[0].institucionId;
		cont=0, contEjecucion=0, destinatarios=0; inversion=0; 
		acum=0, acumEjecucionPrevista=0, acumEjecucionLograda=0;
		promedio=0, totalDestinatario=0, totalProgramado=0, inversionEstimada=0;
		
		tempInstituciones += '<tr><td colspan="12"><strong>'+lineasProgramadas[0].institucionSigla+'</strong></td></tr>';
		
		for(var n=0; n<lineasProgramadas.length;n++){
			
			contEjecucion++;
			if (lineasProgramadas[n].cantidadHoy!=null) acumEjecucionPrevista=acumEjecucionPrevista + lineasProgramadas[n].cantidadHoy;
			if (lineasProgramadas[n].cantidadAvance!=null) acumEjecucionLograda=acumEjecucionLograda + lineasProgramadas[n].cantidadAvance;
			if (lineasProgramadas[n].cantDestinatarioReal!=null) destinatarios= destinatarios + lineasProgramadas[n].cantDestinatarioReal;
			if (lineasProgramadas[n].costoAc!=null) inversion= inversion + lineasProgramadas[n].costoAc;
			
			if ((lineasProgramadas[n].cantidadHoy == 0 || lineasProgramadas[n].cantidadHoy==null ) && lineasProgramadas[n].cantidadAvance > 0) {	
				acum = acum + 100;
				cont= cont +1;	
			} else if (lineasProgramadas[n].cantidadHoy > 0 && (lineasProgramadas[n].cantidadAvance == 0 || lineasProgramadas[n].cantidadAvance == null)) {
				acum = acum + 0;
				cont= cont +1;	
			} else if ((lineasProgramadas[n].cantidadHoy == 0 || lineasProgramadas[n].cantidadHoy == null)	&& (lineasProgramadas[n].cantidadAvance == 0 || lineasProgramadas[n].cantidadAvance == null )) {
				acum = acum + 0;	
			} else {
				acum =acum + ((lineasProgramadas[n].cantidadAvance / lineasProgramadas[n].cantidadHoy) * 100);
				cont= cont +1;	
			}
			
			if (lineasProgramadas[n].cantDest!=null) totalDestinatario = totalDestinatario + lineasProgramadas[n].cantDest;
			if (lineasProgramadas[n].cantidadAnho!=null) totalProgramado = totalProgramado + lineasProgramadas[n].cantidadAnho;
			if (lineasProgramadas[n].inversionEstimada!=null) inversionEstimada = inversionEstimada + lineasProgramadas[n].inversionEstimada;
			
			if (n == lineasProgramadas.length -1){
				
				if(( totalProgramado > 0 && acumEjecucionLograda > 0 ) || ( totalProgramado > 0 ) || ( acumEjecucionLograda > 0 )){
				
					institucionId = lineasProgramadas[n].institucionId;
					promedio = ((acumEjecucionLograda * 100) / acumEjecucionPrevista);												
					clase="";			
					if ((lineasProgramadas[n].cantidadAnho/lineasProgramadas[n].meta)*100>=90){
					 clase="bg-green-active color-palette"; 
					}else if((lineasProgramadas[n].cantidadAnho/lineasProgramadas[n].meta)*100>=70){
					 clase="bg-yellow-active color-palette"; 
					}else{
					 clase="bg-red-active color-palette";
					}
					
					if (distId == null) distId = "";
					if (deptoId == null) deptoId = "";
					
					//if(numeroConComa(promedio) != 0){
						tempInstLineas += '<tr>'+
						'<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a data-toggle="modal" data-target="#myModal" class="registro" codigoRegistro='+n+'-'+lineasProgramadas[n].institucionId+'-'+lineasProgramadas[n].lineaAccionId+'-'+deptoId+' href="#">'+lineasProgramadas[n].lineaAccionNombre+'</a></td>'+
						'<td>'+lineasProgramadas[n].lineaAccionUnidadMedidaNombre+'</td>'+
						//'<td>'+numeroConComa(lineasProgramadas[n].meta)+'</td>'+
						'<td>'+numeroConComa((totalProgramado).toFixed(2))+'</td>'+
						//'<td class="'+clase+'">'+numeroConComa(((lineasProgramadas[n].cantidadAnho/lineasProgramadas[n].meta)*100).toFixed(2))+'</td>'+
						'<td>'+numeroConComa(totalDestinatario)+'</td>'+
						'<td>'+numeroConComa((inversionEstimada/1000000).toFixed(2))+'</td>'+
						'<td>'+numeroConComa((acumEjecucionPrevista).toFixed(2))+'</td>'+
						'<td>'+numeroConComa((acumEjecucionLograda).toFixed(2))+'</td>';
						
						var porcDesemp = numeroConComa(promedio);
						
						clase="";
						if(porcDesemp != "-" && totalProgramado != 0){
							if (promedio>=90){
							 clase="bg-green-active color-palette"; 
							}else if(promedio>=70){
							 clase="bg-yellow-active color-palette"; 
							}else{
							 clase="bg-red-active color-palette";
							}
					    }
						
						tempInstLineas += '<td class="'+clase+'">'+numeroConComa((promedio).toFixed(2))+'</td>'+
						'<td>'+numeroConComa(destinatarios.toFixed(2))+'</td>'+
						'<td>'+numeroConComa((inversion/1000000).toFixed(2))+'</td>'+
						'</tr>';
																															
						if (tempInstLineas != "") todasLasLineas +=  tempInstLineas;
				}
				
				if(todasLasLineas != "") tablaInstituciones += tempInstituciones + todasLasLineas; 


			}else if( (lineasProgramadas[n+1].lineaAccionId != linea_accion_id && lineasProgramadas[n+1].institucionId == institucionId) || (lineasProgramadas[n+1].lineaAccionId == linea_accion_id && lineasProgramadas[n+1].institucionId != institucionId) || (lineasProgramadas[n+1].lineaAccionId != linea_accion_id && lineasProgramadas[n+1].institucionId != institucionId))  {
														
				if(( totalProgramado > 0 && acumEjecucionLograda > 0 ) || ( totalProgramado > 0 ) || ( acumEjecucionLograda > 0 )){

					promedio = ((acumEjecucionLograda * 100) / acumEjecucionPrevista);
					
					clase="";			
					if ((lineasProgramadas[n].cantidadAnho/lineasProgramadas[n].meta)*100>=90){
					 clase="bg-green-active color-palette"; 
					}else if((lineasProgramadas[n].cantidadAnho/lineasProgramadas[n].meta)*100>=70){
					 clase="bg-yellow-active color-palette"; 
					}else{
					 clase="bg-red-active color-palette";
					}
					
					if (distId == null) distId = "";
					if (deptoId == null) deptoId = "";

					//if(numeroConComa(promedio) != 0){
						tempInstLineas += '<tr>'+
						'<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a data-toggle="modal" data-target="#myModal" class="registro" codigoRegistro='+n+'-'+lineasProgramadas[n].institucionId+'-'+lineasProgramadas[n].lineaAccionId+'-'+deptoId+'-'+distId+' href="#">'+lineasProgramadas[n].lineaAccionNombre+'</a></td>'+
						'<td>'+lineasProgramadas[n].lineaAccionUnidadMedidaNombre+'</td>'+
						//'<td>'+numeroConComa(lineasProgramadas[n].meta)+'</td>'+
						'<td>'+numeroConComa((totalProgramado).toFixed(2))+'</td>'+
						//'<td class="'+clase+'">'+numeroConComa(((lineasProgramadas[n].cantidadAnho/lineasProgramadas[n].meta)*100).toFixed(2))+'</td>'+
						'<td>'+numeroConComa(totalDestinatario)+'</td>'+
						'<td>'+numeroConComa((inversionEstimada/1000000).toFixed(2))+'</td>'+												
						'<td>'+numeroConComa((acumEjecucionPrevista).toFixed(2))+'</td>'+
						'<td>'+numeroConComa((acumEjecucionLograda).toFixed(2))+'</td>';
						
						var porcDesemp = numeroConComa(promedio);
						
						clase="";			
						if(porcDesemp != "-" && totalProgramado != 0){
							if (promedio>=90){
							 clase="bg-green-active color-palette"; 
							}else if(promedio>=70){
							 clase="bg-yellow-active color-palette"; 
							}else{
							 clase="bg-red-active color-palette";
							}
						}
						
						tempInstLineas += '<td class="'+clase+'">'+numeroConComa((promedio).toFixed(2))+'</td>'+
						'<td>'+numeroConComa(destinatarios.toFixed(2))+'</td>'+
						'<td>'+numeroConComa((inversion/1000000).toFixed(2))+'</td>'+
						'</tr>';
					//}
				}
				
				cont=0, contEjecucion=0; 
				acum=0, acumEjecucionPrevista=0, acumEjecucionLograda=0;
				promedio=0,destinatarios=0; inversion=0;
				totalDestinatario=0;
				totalProgramado=0;
				inversionEstimada=0;
				//institucionId = lineasProgramadas[n+1].institucionId;
				linea_accion_id = lineasProgramadas[n+1].lineaAccionId;
				//tempInstLineas += '<tr><td colspan="12"><strong>'+lineasProgramadas[n+1].institucionSigla+'</strong></td></tr>';
					
				if (tempInstLineas != "")
				{
					todasLasLineas+=  tempInstLineas ;
					tempInstLineas = "";
				}

				
				if(lineasProgramadas[n+1].institucionId != institucionId){
					if (todasLasLineas != "") tablaInstituciones += tempInstituciones + todasLasLineas;										
					tempInstituciones  = '<tr><td colspan="12"><strong>'+lineasProgramadas[n+1].institucionSigla+'</strong></td></tr>';
					tempInstLineas = "";
					todasLasLineas = "";
					institucionId = lineasProgramadas[n+1].institucionId;											
				}										
			}								
		}//*********
	}    

	return tablaInstituciones;

}	

function renderNivelDistrital(lineasProgramadas, deptoId, distId){
	 
	var contenidoEnRowTemp="";	
	var tablaInstituciones="";
	var tempInstituciones="";
	var tempInstLineas="";
	var flagIns=0;
	var clase="";

	for(var m=0; m<instituciones.length;m++)
	{ 
		for(var n=0; n<lineasProgramadas.length;n++)
		{
			
			if ( instituciones[m].id==lineasProgramadas[n].institucionId ){
				  
				  if((lineasProgramadas[n].cantidadAnho > 0 && lineasProgramadas[n].cantidadAvance > 0) || (lineasProgramadas[n].cantidadAnho > 0) || (lineasProgramadas[n].cantidadAvance > 0)){
				
					  if (flagIns == 0){
												  
 						  tempInstituciones += '<tr><td colspan="12"><strong>'+lineasProgramadas[n].institucionSigla+' - '+instituciones[m].nombre.toUpperCase();+'</strong></td></tr>';
						  flagIns++;						  
					  }
					  clase="";
					  var desempProgAnho=numeroConComa(((lineasProgramadas[n].cantidadAnho/lineasProgramadas[n].meta)*100).toFixed(2));
					  if (lineasProgramadas[n].cantidadAnho==0 && lineasProgramadas[n].meta ==0) desempProgAnho="-";				
					  
					  if (deptoId == null) deptoId = "";
					  if (distId == null) distId = "";			  
					  
					  tempInstLineas += '<tr>'+
					  '<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a data-toggle="modal" data-target="#myModal" class="registro" codigoRegistro='+n+'-'+lineasProgramadas[n].institucionId+'-'+lineasProgramadas[n].lineaAccionId+'-'+deptoId+'-'+distId+' href="#">'+lineasProgramadas[n].lineaAccionNombre+'</a></td>'+
					  '<td>'+lineasProgramadas[n].lineaAccionUnidadMedidaNombre+'</td>';
					 // '<td>'+numeroConComa(lineasProgramadas[n].meta)+'</td>'+
					  if(lineasProgramadas[n].cantidadAnho==0 || lineasProgramadas[n].cantidadAnho== null ){
						  tempInstLineas += '<td> - </td>';
					  }else{
						  tempInstLineas += '<td>'+numeroConComa((lineasProgramadas[n].cantidadAnho).toFixed(2))+'</td>';
					  }
					  
					  //'<td class="'+clase+'">'+desempProgAnho+'</td>';
					  if(lineasProgramadas[n].cantDest==0 || lineasProgramadas[n].cantDest== null ){
						  tempInstLineas += '<td> - </td>';
					  }else{
						  tempInstLineas += '<td>'+numeroConComa(lineasProgramadas[n].cantDest)+'</td>';
					  }

					  tempInstLineas += '<td>'+numeroConComa((lineasProgramadas[n].inversionEstimada/1000000).toFixed(2))+'</td>';
					  //'<td>'+numeroConComa((lineasProgramadas[n].cantidadHoy).toFixed(2))+'</td>'+
					  if(lineasProgramadas[n].cantidadHoy==0 || lineasProgramadas[n].cantidadHoy== null ){
						  tempInstLineas += '<td> - </td>';
					  }else{
						  tempInstLineas += '<td>'+numeroConComa((lineasProgramadas[n].cantidadHoy).toFixed(2))+'</td>';
					  }
					  //'<td>'+numeroConComa((lineasProgramadas[n].cantidadAvance).toFixed(2))+'</td>';
					  if(lineasProgramadas[n].cantidadAvance==0 || lineasProgramadas[n].cantidadAvance== null ){
						  tempInstLineas += '<td> - </td>';
					  }else{
						  tempInstLineas += '<td>'+numeroConComa((lineasProgramadas[n].cantidadAvance).toFixed(2))+'</td>';
					  }
		  
					  
					  var desempEjeHoy = numeroConComa(((lineasProgramadas[n].cantidadAvance/lineasProgramadas[n].cantidadHoy)*100).toFixed(2));
					  
					  if(lineasProgramadas[n].cantidadAvance==0 && lineasProgramadas[n].cantidadHoy==0){ 
						  desempEjeHoy = "-";
					  }
					  
					  if (desempEjeHoy!="-" &&  lineasProgramadas[n].cantidadAnho!= 0 && lineasProgramadas[n].cantidadAnho != null){
						  if (clase!="bg-red-active color-palette"){
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
						  tempInstLineas += '<td>'+numeroConComa(lineasProgramadas[n].cantDestinatarioReal)+'</td>';
					  }
					  tempInstLineas += '<td>'+numeroConComa((lineasProgramadas[n].costoAc/1000000).toFixed(2))+'</td>'+
					  '</tr>'; 
				 }									
			}
		}

		if (flagIns>0){
			tablaInstituciones+=tempInstituciones+tempInstLineas;
		}
		tempInstituciones="";tempInstLineas="";flagIns=0;
	}

	contenidoEnRowTemp='<div class="row">'+
     '<div class="col-md-12">'+
      '<div class="box" height="1000px">'+
        '<div class="box-body" >'+
        	'<div class="table-responsive">'+
      			'<table class="table table-striped table-bordered table-hover tablaLineasPorInstitucion">'+
      			'<thead><tr>'+
      		  	'<th rowspan="3" class="text-center" style="vertical-align: middle;">Línea de Acción</th>'+
      		  	'<th rowspan="3" class="text-center" style="vertical-align: middle;">Unidad de Medida</th>'+
      		  	'<th colspan="3" class="text-center">Plan de Acción 2017</th>'+
      		  	'<th colspan="5" class="text-center">Ejecución a la Fecha</th></tr>'+
      		'<tr><th class="text-center">Meta</th>'+
      		  	'<th rowspan="2" class="text-center" style="vertical-align: middle;">Destinatarios</th>'+
      		  	'<th rowspan="2" class="text-center" style="vertical-align: middle;">Inversión (en millones G.)</th>'+
      		  	'<th colspan="3" class="text-center">Meta</th>'+
      		  	'<th rowspan="2" class="text-center" style="vertical-align: middle;">Destinatarios</th>'+
      		  	'<th rowspan="2" class="text-center" style="vertical-align: middle;">Inversión (en millones G.)</th></tr>'+
      		'<tr>'+
      		  	'<th class="text-center">Programada</th>'+
      		  	//'<th class="text-center">%</th>'+
      		  	'<th class="text-center">Prevista</th>'+
      		  	'<th class="text-center">Lograda</th>'+
      		  	'<th class="text-center">%</th>'+
      	    '</tr></thead><tbody>'+
      				tablaInstituciones+
					'</tbody></table>'+
				'</div>'+
        '</div>'+
	   '</div>'+
	   '</div>'+
	   '</div>';
	   
	return contenidoEnRowTemp;

}

$("body").on("change", "#periodoSeleccion",function(event){	
   	periodoSeleccionado = $("#periodoSeleccion option:selected").val();
   	etiquetaSeleccionado = $("#etiquetaSeleccion option:selected").val();
   	var nombreDepto;
   	
	var nombreInstituciones="";	
	var institucion_idConcat=getInstitucionesSeleccionadas();

		if((depto_id !==null) && (dist_id !==null)){
			$('#dataTableInstituciones').dataTable().fnDestroy();
			nombreDepto = obtenerNombre(depto_id,dist_id);
			tipoInstituciones="distrito";
			$("#tablaInstituciones").html("");
			$("#cabeceraInstituciones").html("");
 			$("#cabeceraInstituciones").append('<i class="fa fa-building-o"></i> Desempeño Institucional en: '+nombreDepto);
			$("#tablaInstituciones").html("");

			var color="";
			var lineaAccionDepartamento = $.ajax({
		    	url:'/tablero/public/ajaxSelects4?action=getResumenLineasAccionProgramacionDesempenoInstitucionalDepto&departamentoId='+depto_id+'&distritoId='+dist_id+'&periodoId='+periodoSeleccionado+'&etiquetaId='+etiquetaSeleccionado,
		      	type:'get',
		      	dataType:'json',
		      	crossDomain:true,
		      	async:false       
		    }).responseText;
			lineaAccionDepartamento=JSON.parse(lineaAccionDepartamento);
			
			var desDepartInst= [];//Obtenemos el desempeño de las instituciones a nivel departamental

			//Obtenemos todos los datos de institucion, promedio, institucion sigla y nombre
			for(var i=0;i<lineaAccionDepartamento.length;i++){		

				var objeto = new Object(); 
				if(lineaAccionDepartamento[i] == 0){
					promedio = 0/0;
				}
				objeto.institucionId = lineaAccionDepartamento[i].id;
				objeto.promedio = lineaAccionDepartamento[i].promedio;
				objeto.institucion = lineaAccionDepartamento[i].nombre;
				objeto.institucionSigla = lineaAccionDepartamento[i].sigla;
				desDepartInst.push(objeto);
			}
			
			ordenInstitucionPais = instituciones;
			ordenInstitucionPais = ordenInstitucionPais.sort(
			
			function orden(a,b) {             
			  if (a.orden < b.orden)
				    return -1;
				  if (a.orden > b.orden)
				    return 1;
				  return 0;
			});			
			
			for (var l = 0; l< ordenInstitucionPais.length;l++){
				for (var i = 0; i< desDepartInst.length;i++){
					if(desDepartInst[i].institucionId==ordenInstitucionPais[l].id){
						despTotDeptoInst=desDepartInst[i].promedio;
						color=getColorDesemp2(despTotDeptoInst);
						if (despTotDeptoInst !=0) $("#tablaInstituciones").append('<tr><td class="col-md-3"><input type="checkbox" class="cmbInstitucion" id=cmbInstitucion-'+desDepartInst[i].institucionId+' checked="true"><a tipo="filtroPorEntidad" class="linkInstitucion" institucion_id='+desDepartInst[i].institucionId+' data-toggle="tooltip" data-placement="top" title="'+desDepartInst[i].institucion+'"> '+desDepartInst[i].institucionSigla+'</a></td><td class="col-md-9"><div class="progress progress-xs"> <div class="progress-bar bg-'+color+'-active color-palette" style="width: '+parseFloat(despTotDeptoInst).toFixed(0)+'%"><p class="text-left">'+parseFloat(despTotDeptoInst).toFixed(2)+'%</p></div></div></td></tr>');
					}
				}
			}
			
			$("#dataTableInstituciones").DataTable(
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
					  "pageLength": 150,
					  ordering: false
				}
			);			
			
			var institucion_idConcat=getInstitucionesSeleccionadas();
			var a = renderTableroLineaAccion(institucion_idConcat,depto_id,dist_id,periodoSeleccionado,etiquetaSeleccionado);

			$("#cuerpoTableroLineaAccion").html("");
			$("#cuerpoTableroLineaAccion").html(a);
		}else{
			if(depto_id !==null && dist_id == null){
				
				$('#dataTableInstituciones').dataTable().fnDestroy();
				nombreDepto = obtenerNombre(depto_id,null);
				$("#tablaInstituciones").html("");
				$("#cabeceraInstituciones").html("");				
				$("#cabeceraInstituciones").append('<i class="fa fa-building-o"></i> Desempeño Institucional en: '+nombreDepto);
				$("#cuerpoTableroLineaAccion").html("");
				$("#nombreInstitucionTabla").html("");
				$("#tablaInstituciones").html("");
				var color="";var depemDeptoInst;var countDeptoInst;var despTotDeptoInst;
					var lineaAccionDepartamento = $.ajax({
			    	url:'/tablero/public/ajaxSelects4?action=getResumenLineasAccionProgramacionDesempenoInstitucionalDepto&departamentoId='+depto_id+'&periodoId='+periodoSeleccionado+'&etiquetaId='+etiquetaSeleccionado,
			      	type:'get',
			      	dataType:'json',
			      	crossDomain:true,
			      	async:false       
			    }).responseText;
				lineaAccionDepartamento=JSON.parse(lineaAccionDepartamento);
				
				var desDepartInst= [];//Obtenemos el desempeño de las instituciones a nivel departamental

				//Obtenemos todos los datos de institucion, promedio, institucion sigla y nombre
 				for(var i=0;i<lineaAccionDepartamento.length;i++){		

					var objeto = new Object(); 
					if(lineaAccionDepartamento[i] == 0){
						promedio = 0/0;
					}
					objeto.institucionId = lineaAccionDepartamento[i].id;
					objeto.promedio = lineaAccionDepartamento[i].promedio;
					objeto.institucion = lineaAccionDepartamento[i].nombre;
					objeto.institucionSigla = lineaAccionDepartamento[i].sigla;
					desDepartInst.push(objeto);
				}
				
				ordenInstitucionPais = instituciones;
				ordenInstitucionPais = ordenInstitucionPais.sort(
					function orden(a,b) {             
					  if (a.orden < b.orden)
						    return -1;
						  if (a.orden > b.orden)
						    return 1;
						  return 0;
						});
				
				
				for (var l = 0; l< ordenInstitucionPais.length;l++){
					for (var i = 0; i< desDepartInst.length;i++){
						if(desDepartInst[i].institucionId==ordenInstitucionPais[l].id){
							despTotDeptoInst=desDepartInst[i].promedio;
							color=getColorDesemp2(despTotDeptoInst);
							if (despTotDeptoInst !=0) $("#tablaInstituciones").append('<tr><td class="col-md-3"><input type="checkbox" class="cmbInstitucion" id=cmbInstitucion-'+desDepartInst[i].institucionId+' checked="true"><a tipo="filtroPorEntidad" class="linkInstitucion" institucion_id='+desDepartInst[i].institucionId+' data-toggle="tooltip" data-placement="top" title="'+desDepartInst[i].institucion+'"> '+desDepartInst[i].institucionSigla+'</a></td><td class="col-md-9"><div class="progress progress-xs"> <div class="progress-bar bg-'+color+'-active color-palette" style="width: '+parseFloat(despTotDeptoInst).toFixed(0)+'%"><p class="text-left">'+parseFloat(despTotDeptoInst).toFixed(2)+'%</p></div></div></td></tr>');
						}
					}
				}

				$("#dataTableInstituciones").DataTable(
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
						  "pageLength": 150,
						  ordering: false
					}
				);				
				
				var todasInstituciones=getInstitucionesSeleccionadas();
				var a = renderTableroLineaAccion(todasInstituciones,depto_id,null,periodoSeleccionado,etiquetaSeleccionado);
				$("#cuerpoTableroLineaAccion").html("");
				$("#cuerpoTableroLineaAccion").html(a);
			}else{
				
				$('#dataTableInstituciones').dataTable().fnDestroy();
				var color="";var depemInst;var countInst;var despTotInst;
				var periodoSeleccionado = $("#periodoSeleccion option:selected").val();
				var etiquetaSeleccionado = $("#etiquetaSeleccion option:selected").val();

	        	//obtenemos todas las instituciones en el back end y su desempeño institucional a nivel país
				var desPaisInstjson = $.ajax({
						url:'/tablero/public/ajaxSelects4?action=getResumenLineasAccionProgramacionDesempenoInstitucional&periodoId='+periodoSeleccionado+'&etiquetaId='+etiquetaSeleccionado,
				      	type:'get',
				      	dataType:'json',
				      	crossDomain:true,
				      	async:false       
				    }).responseText;
				var desPaisInstAux=JSON.parse(desPaisInstjson);
				
				var desPaisInst= [];

 				for(var i=0;i<desPaisInstAux.length;i++){		

					var objeto = new Object(); 
					if(desPaisInstAux[i] == 0){
						promedio = 0/0;
					}
					objeto.institucionId = desPaisInstAux[i].id;
					objeto.promedio = desPaisInstAux[i].promedio;
					objeto.institucion = desPaisInstAux[i].nombre;
					objeto.institucionSigla = desPaisInstAux[i].sigla;
					desPaisInst.push(objeto);
				}
 				
				$("#tablaInstituciones").html("");				
				
				ordenInstitucionPais = instituciones;
				ordenInstitucionPais = ordenInstitucionPais.sort(
					function orden(a,b) {             
					  if (a.orden < b.orden)
						    return -1;
						  if (a.orden > b.orden)
						    return 1;
						  return 0;
						});
				
				
				for (var l = 0; l< ordenInstitucionPais.length;l++){
					for (var i = 0; i< desPaisInst.length;i++){
						if(desPaisInst[i].institucionId==ordenInstitucionPais[l].id){
							despTotInst=desPaisInst[i].promedio;
							color=getColorDesemp2(despTotInst);
							if (despTotInst !=0) $("#tablaInstituciones").append('<tr><td class="col-md-3"><input type="checkbox" class="cmbInstitucion" id=cmbInstitucion-'+desPaisInst[i].institucionId+' checked="true"><a tipo="filtroPorEntidad" class="linkInstitucion" institucion_id='+desPaisInst[i].institucionId+' data-toggle="tooltip" data-placement="top" title="'+desPaisInst[i].institucion+'"> '+desPaisInst[i].institucionSigla+'</a></td><td class="col-md-9"><div class="progress progress-xs"> <div class="progress-bar bg-'+color+'-active color-palette" style="width: '+parseFloat(despTotInst).toFixed(0)+'%"><p class="text-left">'+parseFloat(despTotInst).toFixed(2)+'%</p></div></div></td></tr>');
						}	
					}
				}
				
				$("#dataTableInstituciones").DataTable(
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
						  "pageLength": 200,
						  ordering: false
					}
				);				
				
				var todasInstituciones=getInstitucionesSeleccionadas();
				var a = renderTableroLineaAccion(todasInstituciones,null,null,periodoSeleccionado,etiquetaSeleccionado);
				$("#cuerpoTableroLineaAccion").html("");
				$("#cuerpoTableroLineaAccion").html(a);
			
			}			
		}	
	
	event.stopPropagation();
	
 });
 
$("body").on("change", "#etiquetaSeleccion",function(event){	
   	periodoSeleccionado = $("#periodoSeleccion option:selected").val();
   	etiquetaSeleccionado = $("#etiquetaSeleccion option:selected").val();
   	var nombreDepto;
   	
	//var institucion_idConcat=getInstitucionesSeleccionadas();
	var nombreInstituciones="";	
	var institucion_idConcat=getInstitucionesSeleccionadas();

		if((depto_id !==null) && (dist_id !==null)){
			
			$('#dataTableInstituciones').dataTable().fnDestroy();
			nombreDepto = obtenerNombre(depto_id,dist_id);
			tipoInstituciones="distrito";
			$("#tablaInstituciones").html("");
			$("#cabeceraInstituciones").html("");
 			$("#cabeceraInstituciones").append('<i class="fa fa-building-o"></i> Desempeño Institucional en: '+nombreDepto);

			var color="";
			var lineaAccionDepartamento = $.ajax({
		    	url:'/tablero/public/ajaxSelects4?action=getResumenLineasAccionProgramacionDesempenoInstitucionalDepto&departamentoId='+depto_id+'&distritoId='+dist_id+'&periodoId='+periodoSeleccionado+'&etiquetaId='+etiquetaSeleccionado,
		      	type:'get',
		      	dataType:'json',
		      	crossDomain:true,
		      	async:false       
		    }).responseText;
			lineaAccionDepartamento=JSON.parse(lineaAccionDepartamento);
			
			var desDepartInst= [];//Obtenemos el desempeño de las instituciones a nivel departamental

			//Obtenemos todos los datos de institucion, promedio, institucion sigla y nombre
				for(var i=0;i<lineaAccionDepartamento.length;i++){		

				var objeto = new Object(); 
				if(lineaAccionDepartamento[i] == 0){
					promedio = 0/0;
				}
				objeto.institucionId = lineaAccionDepartamento[i].id;
				objeto.promedio = lineaAccionDepartamento[i].promedio;
				objeto.institucion = lineaAccionDepartamento[i].nombre;
				objeto.institucionSigla = lineaAccionDepartamento[i].sigla;
				desDepartInst.push(objeto);
			}
			
			ordenInstitucionPais = instituciones;
			ordenInstitucionPais = ordenInstitucionPais.sort(
				function orden(a,b) {             
				  if (a.orden < b.orden)
					    return -1;
					  if (a.orden > b.orden)
					    return 1;
					  return 0;
					});
			
			
			for (var l = 0; l< ordenInstitucionPais.length;l++){
				for (var i = 0; i< desDepartInst.length;i++){
					if(desDepartInst[i].institucionId==ordenInstitucionPais[l].id){
						despTotDeptoInst=desDepartInst[i].promedio;
						color=getColorDesemp2(despTotDeptoInst);
						if (despTotDeptoInst !=0) $("#tablaInstituciones").append('<tr><td class="col-md-3"><input type="checkbox" class="cmbInstitucion" id=cmbInstitucion-'+desDepartInst[i].institucionId+' checked="true"><a tipo="filtroPorEntidad" class="linkInstitucion" institucion_id='+desDepartInst[i].institucionId+' data-toggle="tooltip" data-placement="top" title="'+desDepartInst[i].institucion+'"> '+desDepartInst[i].institucionSigla+'</a></td><td class="col-md-9"><div class="progress progress-xs"> <div class="progress-bar bg-'+color+'-active color-palette" style="width: '+parseFloat(despTotDeptoInst).toFixed(0)+'%"><p class="text-left">'+parseFloat(despTotDeptoInst).toFixed(2)+'%</p></div></div></td></tr>');
					}
				}
			}
			
			$("#dataTableInstituciones").DataTable(
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
					  "pageLength": 150,
					  ordering: false
				}
			);	
						
			var institucion_idConcat=getInstitucionesSeleccionadas();
			var a = renderTableroLineaAccion(institucion_idConcat,depto_id,dist_id,periodoSeleccionado,etiquetaSeleccionado);
			$("#cuerpoTableroLineaAccion").html("");
			$("#cuerpoTableroLineaAccion").html(a);
		}else{
			if(depto_id !==null && dist_id == null){
				
				$('#dataTableInstituciones').dataTable().fnDestroy();
				nombreDepto = obtenerNombre(depto_id,null);
				$("#tablaInstituciones").html("");
				$("#cabeceraInstituciones").html("");				
				$("#cabeceraInstituciones").append('<i class="fa fa-building-o"></i> Desempeño Institucional en: '+nombreDepto);
				$("#cuerpoTableroLineaAccion").html("");
				$("#nombreInstitucionTabla").html("");
				var color="";var depemDeptoInst;var countDeptoInst;var despTotDeptoInst;
					var lineaAccionDepartamento = $.ajax({
			    	url:'/tablero/public/ajaxSelects4?action=getResumenLineasAccionProgramacionDesempenoInstitucionalDepto&departamentoId='+depto_id+'&periodoId='+periodoSeleccionado+'&etiquetaId='+etiquetaSeleccionado,
			      	type:'get',
			      	dataType:'json',
			      	crossDomain:true,
			      	async:false       
			    }).responseText;
				lineaAccionDepartamento=JSON.parse(lineaAccionDepartamento);				

				var desDepartInst= [];//Obtenemos el desempeño de las instituciones a nivel departamental

				//Obtenemos todos los datos de institucion, promedio, institucion sigla y nombre
 				for(var i=0;i<lineaAccionDepartamento.length;i++){		

					var objeto = new Object(); 
					if(lineaAccionDepartamento[i] == 0){
						promedio = 0/0;
					}
					objeto.institucionId = lineaAccionDepartamento[i].id;
					objeto.promedio = lineaAccionDepartamento[i].promedio;
					objeto.institucion = lineaAccionDepartamento[i].nombre;
					objeto.institucionSigla = lineaAccionDepartamento[i].sigla;
					desDepartInst.push(objeto);
				}
				
				ordenInstitucionPais = instituciones;
				ordenInstitucionPais = ordenInstitucionPais.sort(
					function orden(a,b) {             
					  if (a.orden < b.orden)
						    return -1;
						  if (a.orden > b.orden)
						    return 1;
						  return 0;
						});
				
				
				for (var l = 0; l< ordenInstitucionPais.length;l++){
					for (var i = 0; i< desDepartInst.length;i++){
						if(desDepartInst[i].institucionId==ordenInstitucionPais[l].id){
							despTotDeptoInst=desDepartInst[i].promedio;
							color=getColorDesemp2(despTotDeptoInst);
							if (despTotDeptoInst !=0) $("#tablaInstituciones").append('<tr><td class="col-md-3"><input type="checkbox" class="cmbInstitucion" id=cmbInstitucion-'+desDepartInst[i].institucionId+' checked="true"><a tipo="filtroPorEntidad" class="linkInstitucion" institucion_id='+desDepartInst[i].institucionId+' data-toggle="tooltip" data-placement="top" title="'+desDepartInst[i].institucion+'"> '+desDepartInst[i].institucionSigla+'</a></td><td class="col-md-9"><div class="progress progress-xs"> <div class="progress-bar bg-'+color+'-active color-palette" style="width: '+parseFloat(despTotDeptoInst).toFixed(0)+'%"><p class="text-left">'+parseFloat(despTotDeptoInst).toFixed(2)+'%</p></div></div></td></tr>');
						}
					}
				}
				
				$("#dataTableInstituciones").DataTable(
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
						  "pageLength": 150,
						  ordering: false
					}
				);				
				
				var todasInstituciones=getInstitucionesSeleccionadas();
				var a = renderTableroLineaAccion(todasInstituciones,depto_id,null,periodoSeleccionado,etiquetaSeleccionado);
				$("#cuerpoTableroLineaAccion").html("");
				$("#cuerpoTableroLineaAccion").html(a);
			}else{
				$('#dataTableInstituciones').dataTable().fnDestroy();
				var color="";var depemInst;var countInst;var despTotInst;
				var periodoSeleccionado = $("#periodoSeleccion option:selected").val();
				var etiquetaSeleccionado = $("#etiquetaSeleccion option:selected").val();

	        	//obtenemos todas las instituciones en el back end y su desempeño institucional a nivel país
				var desPaisInstjson = $.ajax({
					url:'/tablero/public/ajaxSelects4?action=getResumenLineasAccionProgramacionDesempenoInstitucional&periodoId='+periodoSeleccionado+'&etiquetaId='+etiquetaSeleccionado,
			      	type:'get',
			      	dataType:'json',
			      	crossDomain:true,
			      	async:false       
			    }).responseText;
				var desPaisInstAux=JSON.parse(desPaisInstjson);
				
				var desPaisInst= [];
								
 				for(var i=0;i<desPaisInstAux.length;i++){		

					var objeto = new Object(); 
					if(desPaisInstAux[i] == 0){
						promedio = 0/0;
					}
					objeto.institucionId = desPaisInstAux[i].id;
					objeto.promedio = desPaisInstAux[i].promedio;
					objeto.institucion = desPaisInstAux[i].nombre;
					objeto.institucionSigla = desPaisInstAux[i].sigla;
					desPaisInst.push(objeto);
				}
 				
				$("#tablaInstituciones").html("");
				$("#cabeceraInstituciones").html("Desempeño Institucional");

				ordenInstitucionPais = instituciones;
				ordenInstitucionPais = ordenInstitucionPais.sort(
					function orden(a,b) {             
					  if (a.orden < b.orden)
						    return -1;
						  if (a.orden > b.orden)
						    return 1;
						  return 0;
						});
				
				
				for (var l = 0; l< ordenInstitucionPais.length;l++){
					for (var i = 0; i< desPaisInst.length;i++){
						if(desPaisInst[i].institucionId==ordenInstitucionPais[l].id){
							despTotInst=desPaisInst[i].promedio;
							color=getColorDesemp2(despTotInst);
							if (despTotInst !=0) $("#tablaInstituciones").append('<tr><td class="col-md-3"><input type="checkbox" class="cmbInstitucion" id=cmbInstitucion-'+desPaisInst[i].institucionId+' checked="true"><a tipo="filtroPorEntidad" class="linkInstitucion" institucion_id='+desPaisInst[i].institucionId+' data-toggle="tooltip" data-placement="top" title="'+desPaisInst[i].institucion+'"> '+desPaisInst[i].institucionSigla+'</a></td><td class="col-md-9"><div class="progress progress-xs"> <div class="progress-bar bg-'+color+'-active color-palette" style="width: '+parseFloat(despTotInst).toFixed(0)+'%"><p class="text-left">'+parseFloat(despTotInst).toFixed(2)+'%</p></div></div></td></tr>');
						}
					}	
				}
				
				$("#dataTableInstituciones").DataTable(
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
						  "pageLength": 200,
						  ordering: false
					}
				);
				
				var todasInstituciones=getInstitucionesSeleccionadas();
				var a = renderTableroLineaAccion(todasInstituciones,null,null,periodoSeleccionado,etiquetaSeleccionado);
				$("#cuerpoTableroLineaAccion").html("");
				$("#cuerpoTableroLineaAccion").html(a);
			
			}			
		}	
	
	event.stopPropagation();
	
 });
 
 function obtenerNombre(idDepto,idDistrito){
	 var nombre;
	 
	 if(idDistrito != null){
		 
		 for(var x = 0; x <departamento.length; x++){
			 if(departamento[x].idDepartamento == idDepto){
				 nombre = departamento[x].nombreDepartamento;
			 }
		 }
		 nombre += " - ";
		 for(var d = 0; d < distritos.length; d++){
			 if(distritos[d].departamentoId == idDepto && distritos[d].id == idDistrito){
				 nombre += distritos[d].descripcion;
			 }
		 }
	 }else{
		 for(var x = 0; x <departamento.length; x++){
			 if(departamento[x].idDepartamento == idDepto){
				 nombre = departamento[x].nombreDepartamento;
			 }
		 }
	 }

	 return nombre;
 }

function getPeriodo(periodo){

	var periodo = $.ajax({
		url:'/tablero/public/ajaxSelects4?action=getPeriodo',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	periodo = JSON.parse(periodo);
	
	var etiqueta = $.ajax({
		url:'/tablero/public/ajaxSelects4?action=getEtiqueta',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	etiqueta = JSON.parse(etiqueta);

	var optionPeriodo;
	var optionEtiqueta;

	for(p = 0;p<periodo.length; p++){
		if((periodo[p].id >= 2014) && (periodo[p].id <= 2018)){
			if(periodo[p].id == 2017){
				optionPeriodo+='<option value="'+periodo[p].id+'" selected>'+periodo[p].nombre+'</option>';
			}else{
				optionPeriodo+='<option value="'+periodo[p].id+'" >'+periodo[p].nombre+'</option>';
			}
		}
	}
	
	optionEtiqueta+='<option value="0" selected>Todos</option>';
	for(var e = 0; e<etiqueta.length; e++){				
		optionEtiqueta+='<option value="'+etiqueta[e].id+'">'+etiqueta[e].nombre+'</option>';
	}
    
	$('#periodoSeleccion').html(optionPeriodo);
	$('#etiquetaSeleccion').append(optionEtiqueta);						
	
}	

$("body").on("click", ".cmbInstitucion",function(event){
		
	var institucion_idConcat=getInstitucionesSeleccionadas();
	var periodoSeleccionado = $("#periodoSeleccion option:selected").val();
	var etiquetaSeleccionado = $("#etiquetaSeleccion option:selected").val();
	var nombreInstituciones="";
	
	if (institucion_idConcat==""){
		$("#cuerpoTableroLineaAccion").html("");
	}else{
		if(institucion_idConcat != "" && (depto_id !==null) && (dist_id !==null)){
			var a = renderTableroLineaAccion(institucion_idConcat,depto_id,dist_id, periodoSeleccionado,etiquetaSeleccionado);
			$("#cuerpoTableroLineaAccion").html("");
			$("#cuerpoTableroLineaAccion").html(a);
		}else{
			if(institucion_idConcat != "" && (depto_id !==null)){
				var a = renderTableroLineaAccion(institucion_idConcat,depto_id, null, periodoSeleccionado,etiquetaSeleccionado);
				$("#cuerpoTableroLineaAccion").html("");
				$("#cuerpoTableroLineaAccion").html(a);
			}else{
				if(institucion_idConcat != ""){
					var a = renderTableroLineaAccion(institucion_idConcat,null,null, periodoSeleccionado,etiquetaSeleccionado);
					$("#cuerpoTableroLineaAccion").html("");
					$("#cuerpoTableroLineaAccion").html(a);
				}	
			}			
		}
	}	
	
	event.stopPropagation();
		
});


$(document).ready(function(){
	$('[data-toggle="tooltip"]').tooltip();   
	
	$("#ex12c").slider({
		id: "slider12c",
		min: 0,
		max: 100,
		range: true,
		value: [ 70, 90 ]
	});

	var periodo = $.ajax({
		url:'/tablero/public/ajaxSelects4?action=getPeriodo',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	periodo = JSON.parse(periodo);
	
	var etiqueta = $.ajax({
		url:'/tablero/public/ajaxSelects4?action=getEtiqueta',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	etiqueta = JSON.parse(etiqueta);

	var optionPeriodo;
	var optionEtiqueta;

	for(p = 0;p<periodo.length; p++){
		if((periodo[p].id >= 2014) && (periodo[p].id <= 2018)){
			if(periodo[p].id == 2017){
				optionPeriodo+='<option value="'+periodo[p].id+'" selected>'+periodo[p].nombre+'</option>';
			}else{
				optionPeriodo+='<option value="'+periodo[p].id+'" >'+periodo[p].nombre+'</option>';
			}
		}
	}
	
	optionEtiqueta+='<option value="0" selected>Todos</option>';

	for(var e = 0; e<etiqueta.length; e++){
		optionEtiqueta+='<option value="'+etiqueta[e].id+'">'+etiqueta[e].nombre+'</option>';
	}
	
	$('#periodoSeleccion').html(optionPeriodo);
	$('#etiquetaSeleccion').append(optionEtiqueta);						

	$("body").on("change", "#ex12c",function(event){
		var rangoDeColor= $("#ex12c").attr("value");
		var splitDeRango=rangoDeColor.split(",");
		pocentajeColor1 = parseInt(splitDeRango[0]);
		pocentajeColor2 = parseInt(splitDeRango[1]); 
		if (typeof distLayer !== "undefined"){
			distLayer.eachLayer(function(l2){distLayer.resetStyle(l2);});
		}
		setColorBarras(pocentajeColor1, pocentajeColor2);
		depto.eachLayer(function(l){depto.resetStyle(l);});

	});
	
	
	var lineaAccionAcumuladoMesDepto;
	
	var vectorMin=0;
	var vectorMax=0;
	var vectorMinEjecucion=0;
	var vectorMaxEjecucion=0;
	
	var porcentaje1 = 70; //la variable porcentaje1 se utiliza para colorear las tablas
	var porcentaje2 = 90 //la variable porcentaje2 se utiliza para colorear las tablas
	
	function dibujarLineaAccionAcumuladoMesDepto(lineaAccionAcumuladoMesDepto, vectorMin, vectorMax, vectorMinEjecucion, vectorMaxEjecucion, mostrarOcultarNoAcumulables){
		
		var programadaTotal=[];
		var programadaNoAcumulable=[];
		var ejecutadaTotal=[];
		var ejecutadaNoAcumulable=[];
		
		var mes;
		var anho;
		var cantidadTotalProgramada=parseFloat(0);
		var cantidadTotalEjecutada=parseFloat(0);		
		
		$("#rango-fecha").attr("data-slider-min",vectorMin);
		$("#rango-fecha").attr("data-slider-max",vectorMax);
		$("#rango-fecha").attr("data-slider-value","["+vectorMin+","+vectorMax+"]");
		
		$("#rango-fecha-ejecucion").attr("data-slider-min",vectorMinEjecucion);
		$("#rango-fecha-ejecucion").attr("data-slider-max",vectorMaxEjecucion);
		$("#rango-fecha-ejecucion").attr("data-slider-value","["+vectorMinEjecucion+","+vectorMaxEjecucion+"]");
		
		$("#fechaInicio").html(lineaAccionAcumuladoMesDepto[vectorMin].mes+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		$("#fechaInicioEjecucion").html(lineaAccionAcumuladoMesDepto[vectorMinEjecucion].mes+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		$("#fechaFin").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+lineaAccionAcumuladoMesDepto[vectorMax].mes);
		$("#fechaFinEjecucion").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+lineaAccionAcumuladoMesDepto[vectorMaxEjecucion].mes);
		
		$("#rango-fecha").slider({});
		$("#rango-fecha-ejecucion").slider({});
			

		for(var i = 0;i<lineaAccionAcumuladoMesDepto.length; i++)
		{				
			cantidadTotalProgramada += lineaAccionAcumuladoMesDepto[i].cantidad_programada;

			if(lineaAccionAcumuladoMesDepto[i].mes >= lineaAccionAcumuladoMesDepto[vectorMin].mes && lineaAccionAcumuladoMesDepto[i].mes <= lineaAccionAcumuladoMesDepto[vectorMax].mes)
			{
				programadaTotal.push({ x: new Date( lineaAccionAcumuladoMesDepto[i].mes), y: lineaAccionAcumuladoMesDepto[i].max_cant_prog_no_acum + cantidadTotalProgramada});
 				
				if (lineaAccionAcumuladoMesDepto[i].max_cant_prog_no_acum != 0) programadaNoAcumulable.push({ x: new Date( lineaAccionAcumuladoMesDepto[i].mes), y: lineaAccionAcumuladoMesDepto[i].max_cant_prog_no_acum});
			}
		}
		
		
		for(var i = 0;i<lineaAccionAcumuladoMesDepto.length; i++)
		{
			cantidadTotalEjecutada += lineaAccionAcumuladoMesDepto[i].cantidad_ejecutda;

			if(lineaAccionAcumuladoMesDepto[i].mes >= lineaAccionAcumuladoMesDepto[vectorMinEjecucion].mes && lineaAccionAcumuladoMesDepto[i].mes <= lineaAccionAcumuladoMesDepto[vectorMaxEjecucion].mes)
			{
 				if (lineaAccionAcumuladoMesDepto[i].cantidad_ejecutda != 0 || lineaAccionAcumuladoMesDepto[i].max_cant_ejec_no_acum != 0)	 				
 					ejecutadaTotal.push({ x: new Date( lineaAccionAcumuladoMesDepto[i].mes), y: lineaAccionAcumuladoMesDepto[i].max_cant_ejec_no_acum + cantidadTotalEjecutada});
 				
 				if (lineaAccionAcumuladoMesDepto[i].max_cant_ejec_no_acum != 0)
 					ejecutadaNoAcumulable.push({ x: new Date( lineaAccionAcumuladoMesDepto[i].mes), y: lineaAccionAcumuladoMesDepto[i].max_cant_ejec_no_acum});	 				 					 				
			}	
		}
		
		
		//Despliega o no las lineas de programacion y ejecucion no acumulables en los datos del chart
		if (!mostrarOcultarNoAcumulables){
			var data = [					     
					{        
						indexLabelFontColor: "darkSlateGray",
						showInLegend: true, 
						name: 'programada',
						type: "line",
						color: "#1856F2", /*"rgba(0,75,141,0.7)"*/
						markerSize:8,
						markerType:"triangle",
						legendText:"Programación",
						dataPoints:programadaTotal
					},
					{        
						indexLabelFontColor: "darkSlateGray",
						showInLegend: true, 
						name: 'ejecutadas',
						type: "area",
						color: "#C24642",
						markerSize:8,
						markerType:"circle",
						legendText:"Ejecución",
						dataPoints:ejecutadaTotal
					}
			  	];
		} else	
			var data = [
					{        
						indexLabelFontColor: "darkSlateGray",
						showInLegend: true, 
						name: 'programada total',
						type: "line",
						color: "#1856F2", /*"rgba(0,75,141,0.7)"*/
						markerSize:8,
						markerType:"triangle",
						legendText:"Programación total",
						dataPoints:programadaTotal
					},
					{        
						indexLabelFontColor: "darkSlateGray",
						showInLegend: true, 
						name: 'programada no acumulables',
						type: "line",
						color: "#369EAD",
						markerSize:8,
						markerType:"triangle",
						legendText:"Programación no acumulables",
						dataPoints:programadaNoAcumulable
					},
					{        
						indexLabelFontColor: "darkSlateGray",
						showInLegend: true, 
						name: 'ejecutadas total',
						type: "area",
						color: "#C24642",
						markerSize:8,
						markerType:"circle",
						legendText:"Ejecución total",
						dataPoints:ejecutadaTotal
					},
					{        
						indexLabelFontColor: "darkSlateGray",
						showInLegend: true, 
						name: 'ejecutada no acumulables',
						type: "line",
						color: "#FF706B",
						markerSize:8,
						markerType:"circle",
						legendText:"Ejecución no acumulables",
						dataPoints:ejecutadaNoAcumulable
					}
				];

		//dibuja el chart
		var chart = new CanvasJS.Chart("chartContainer",
					{
						zoomEnabled: true,
						exportEnabled: true,
						exportFileName: lineaAccionAcumuladoMesDepto[0].institucion+" - "+lineaAccionAcumuladoMesDepto[0].linea_accion+" ("+lineaAccionAcumuladoMesDepto[0].accion_unidad_medida+")",
						toolTip: {
					        shared: true  //disable here. 
					    }, 
						title: {
							text: "Evolución Mensual" +" ("+lineaAccionAcumuladoMesDepto[0].accion_unidad_medida+")" 
						},
		                      	animationEnabled: true,
		                      	width: 800,
						axisX:{      
							valueFormatString: "YYYY-MM",
							interval: 1,
							intervalType: "month",
							labelAngle: -50,
							labelFontColor: "rgb(0,75,141)",
						},
						axisY: {
							title: "",
							interlacedColor: "#F0FFFF",
							tickColor: "azure",
							titleFontColor: "rgb(0,75,141)"
						},
						data: data
					});
				
		chart.render();
	 }
	
	$("body").on("click", "#chkMostrarOcultarNoAcumulables",function(event){			
		var rangoDeFecha= $("#rango-fecha").val();
		var splitDeRango=rangoDeFecha.split(",");
		vectorMin=splitDeRango[0];
		vectorMax=splitDeRango[1];
		
		var rangoDeFechaEjecucion= $("#rango-fecha-ejecucion").val();
		var splitDeRangoEjecucion=rangoDeFechaEjecucion.split(",");
		vectorMinEjecucion=splitDeRangoEjecucion[0];
		vectorMaxEjecucion=splitDeRangoEjecucion[1];
		
		var mostrarNoAcumulables = $("#chkMostrarOcultarNoAcumulables").is(':checked'); 
		
		dibujarLineaAccionAcumuladoMesDepto(lineaAccionAcumuladoMesDepto, vectorMin, vectorMax, vectorMinEjecucion, vectorMaxEjecucion, mostrarNoAcumulables);		
	});

	$("body").on("change", "#rango-fecha",function(event){
		var rangoDeFecha= $("#rango-fecha").val();
		var splitDeRango=rangoDeFecha.split(",");
		vectorMin=splitDeRango[0];
		vectorMax=splitDeRango[1];
		
		var rangoDeFechaEjecucion= $("#rango-fecha-ejecucion").val();
		var splitDeRangoEjecucion=rangoDeFechaEjecucion.split(",");
		vectorMinEjecucion=splitDeRangoEjecucion[0];
		vectorMaxEjecucion=splitDeRangoEjecucion[1];
		
		dibujarLineaAccionAcumuladoMesDepto(lineaAccionAcumuladoMesDepto, vectorMin, vectorMax, vectorMinEjecucion, vectorMaxEjecucion);
		
	});
	
	
	$("body").on("change", "#rango-fecha-ejecucion",function(event){
		var rangoDeFecha= $("#rango-fecha").val();
		var splitDeRango=rangoDeFecha.split(",");
		vectorMin=splitDeRango[0];
		vectorMax=splitDeRango[1];
		
		var rangoDeFechaEjecucion= $("#rango-fecha-ejecucion").val();
		var splitDeRangoEjecucion=rangoDeFechaEjecucion.split(",");
		vectorMinEjecucion=splitDeRangoEjecucion[0];
		vectorMaxEjecucion=splitDeRangoEjecucion[1];
		
		dibujarLineaAccionAcumuladoMesDepto(lineaAccionAcumuladoMesDepto, vectorMin, vectorMax, vectorMinEjecucion, vectorMaxEjecucion);
		
	});
	
	$("body").on("click", ".registro",function(event){
		var codigoRegistro = $(this).attr("codigoRegistro");
	    var idParsed = codigoRegistro.split("-");                                                            
		var institucion_id=idParsed[1];
		var linea_accion_id=idParsed[2];
		//var unidad_medida= idParsed[3];
		var idDepartamento= idParsed[3];
		var idDistrito= idParsed[4];
		var tituloModal="";
		var cuerpoModal="";
		var footerModal="<br><br><br>";
		var urlAccionesAvances="";
		var primerModal="";
		
		var periodoSeleccionado = $("#periodoSeleccion option:selected").val();
		
			urlAccionesAvances+='/tablero/public/ajaxSelects3?action=getAccionesAvances';

			if (typeof institucion_id != "undefined") urlAccionesAvances+='&institucion_id='+institucion_id;
			if (typeof linea_accion_id != "undefined") urlAccionesAvances+='&linea_accion_id='+linea_accion_id;
			if (typeof idDepartamento != "undefined" && idDepartamento != "") urlAccionesAvances+='&departamentoId='+idDepartamento;
			if (typeof idDistrito != "undefined" && idDistrito != "") urlAccionesAvances+='&distritoId='+idDistrito;
			urlAccionesAvances+='&periodoId='+periodoSeleccionado;			
		var registros = $.ajax({
	    	url:urlAccionesAvances,
	      	type:'get',
	      	dataType:'json',
	      	crossDomain:true,
	      	async:false       
	    }).responseText;
		var elRegistro=JSON.parse(registros);
		
		if ( $("#myModal").length ) {
			$("#myModal").remove();
			$("#myModal2").remove();
		}
		
		primerModal =     '<div class="modal fade" id="myModal" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">'+
							'<div class="modal-dialog modal-lg" style="width:90%;">'+
							    '<div class="modal-content" >'+
							      '<div class="modal-header">'+
							        '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
							        '<h4 class="modal-title" id="myModalLabel1"></h4>'+
							      '</div>'+
							      '<div class="modal-body" id="cuerpoModalAcciones" >'+
							     		
							     	'<div class="nav-tabs-custom">'+
						                '<ul class="nav nav-tabs pull-right">'+
						              	  '<li class="active"><a href="#tab_1-1" data-toggle="tab"  title="Acciones"><i class="glyphicon glyphicon-list"></i></a></li>'+
						                  '<li><a href="#tab_3-2" data-toggle="tab" title="Evolución"><i class="glyphicon glyphicon-stats"></i></a></li>'+						                                     						                    
						                '</ul>'+
						                
					                '<div class="tab-content">'+
					                  '<div class="tab-pane active" id="tab_1-1"></div>'+
					                  '<div class="tab-pane" id="tab_2-2">'+
			
					                  '</div>'+
					                  '<div class="tab-pane" id="tab_3-2"></div>'+
					                   '<div class="tab-pane" id="tab_4-2"><p>Datos no disponibles</p></div>'+
					                   '<div class="tab-pane" id="tab_5-2"><p>Datos no disponibles</p></div>'+                            
					                '</div>'+
					              '</div>'+
							      '</div>'+
								  '<div class="modal-footer">'+
									
								  '</div>'+
							    '</div>'+ 
							 '</div>'+
							'</div>';
							
		$("body").append(primerModal);
		
		cuerpoModal ='     			<div class="table-responsive">'+
		'	                				<table class="table table-hover table-bordered" id="dataTablesAccionesAvances">'+
		'	                					<thead>'+
		'	                						<tr class="active"><th>Acción</th>';													
													   cuerpoModal += '<th>Departamento</th>';												
													   cuerpoModal += '<th>Distrito</th>';
														
		cuerpoModal +='							<th>Cantidad Programado</th><th>Cantidad Ejecutado</th><th>U. Medida</th><!--th>Inversión Estimada (Millones de G.)</th--><th>Fecha Inicio</th><th>Fecha Fin</th><!--th>% Programado</th><th>% Ejecutado</th--></tr>'+
		'	                					</thead>'+
		'	                					<tbody id="tablaAccionesAvances">';
												if (elRegistro != null){
													tituloModal='<h3><center>'+elRegistro[0].institucion+'&nbsp;&nbsp;-&nbsp;&nbsp;'+elRegistro[0].linea_accion_nombre+'</center></h3>';
													for(var m=0; m<elRegistro.length;m++)
													{															
														var registroFechaInicio = "";
														var registroFechaFin = "";
														
														if (elRegistro[m].accion_fecha_inicio != null){ 
															registroFechaInicio = elRegistro[m].accion_fecha_inicio.split("-");
															registroFechaInicio = registroFechaInicio[2]+'-'+registroFechaInicio[1]+'-'+registroFechaInicio[0];
														}
														
														if (elRegistro[m].accion_fecha_fin != null){
															registroFechaFin = elRegistro[m].accion_fecha_fin.split("-");
														    registroFechaFin = registroFechaFin[2]+'-'+registroFechaFin[1]+'-'+registroFechaFin[0];
														}
														
														cuerpoModal += '<tr><td><!--a href="#" class="modalHitoAvances" parametros="'+institucion_id+'-'+linea_accion_id+'-'+idDepartamento+'-'+idDistrito+'-'+elRegistro[m].accion_id+'" -->'+elRegistro[m].accion_catalogo_nombre+'</td>';
														cuerpoModal += '<td>'+elRegistro[m].accion_depto_nombre+'</td>';															
														cuerpoModal += '<td>'+elRegistro[m].accion_dist_nombre+'</td>';
														cuerpoModal += '<td>'+elRegistro[m].cantidad_programado+'</td>'+
																	   '<td>'+elRegistro[m].cantidad_ejecutado+'</td>'+
																	   '<td>'+elRegistro[m].accion_unidad_medida+'</td>'+
																	   '<!--td>numeroConComa((elRegistro[m].accion_costo*elRegistro[m].hito_porcentaje_ejecutado/100000000).toFixed(0))</td-->'+
																	   '<td>'+registroFechaInicio+'</td>'+
																	   '<td>'+registroFechaFin+'</td>'+
																	   '<!--td>elRegistro[m].hito_porcentaje_programado</td-->'+
																	   '<!--td>elRegistro[m].hito_porcentaje_ejecutado</td-->';																														
													}
												}
		cuerpoModal += '             		</tbody>'+
		'	               				</table>'+
		'	               			</div>';
								 		
		$('#myModal').find(".modal-title").html("");			
		$('#myModal').find("#tab_1-1").html(""); 
		$('#myModal').find("#tab_2-2").html("");
		$('#myModal').find("#tab_3-2").html("");			
		
		$('#myModal').find(".modal-title").html(tituloModal);
		$('#myModal').find("#tab_1-1").append(cuerpoModal);
		$("#dataTablesAccionesAvances").DataTable();	
			
		$("#tab_3-2").append('Programación: <label id="fechaInicio"></label><input id="rango-fecha" type="text" class="span2" value="" data-slider-min="10" data-slider-max="1000" data-slider-step="1" data-slider-value="[250,450]"/><label id="fechaFin"></label>');
		$("#tab_3-2").append('<br><br>Ejecución: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label id="fechaInicioEjecucion"></label><input id="rango-fecha-ejecucion" type="text" class="span2" value="" data-slider-min="10" data-slider-max="1000" data-slider-step="1" data-slider-value="[250,450]"/><label id="fechaFinEjecucion"></label> &nbsp&nbsp <!--div class="checkbox"--><label> <input type="checkbox" id="chkMostrarOcultarNoAcumulables">Mostrar no acumulables</label><!-- /div-->');

		var urlAcumulado="getLineaAccionAcumuladoMes";// a nivel pais
		var urlFinal="";		
		
		if (idDistrito != "" && typeof idDistrito != "undefined") {// a nivel distrito
			urlAcumulado='getLineaAccionAcumuladoMesDistrito';urlFinal+="&departamento="+idDepartamento+"&distrito="+idDistrito;
		} else	if(idDepartamento != "" && typeof idDepartamento != "undefined") { // a nivel departamento
			urlAcumulado='getLineaAccionAcumuladoMesDepto';urlFinal+="&departamento="+idDepartamento;			
		}
		
		lineaAccionAcumuladoMesDepto = $.ajax({
	    	url:'/tablero/public/ajaxSelects3?action='+urlAcumulado+'&institucion_id='+institucion_id+'&linea_accion_id='+linea_accion_id+urlFinal,
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		
		
		lineaAccionAcumuladoMesDepto = JSON.parse(lineaAccionAcumuladoMesDepto);
		
		 vectorMin=0;
		 vectorMax=lineaAccionAcumuladoMesDepto.length-1;
		 
		 vectorMinEjecucion=0;
		 vectorMaxEjecucion=lineaAccionAcumuladoMesDepto.length-1;
		//grafico de total cantidad programada y total cantidad ejecutada
		
		$('#myModal').find("#tab_3-2").append('<div id="chartContainer" style="height:400px;"></div>');
		
		function compare(a,b) {             
			  if (a.mes < b.mes)
			    return -1;
			  if (a.mes > b.mes)
			    return 1;
			  return 0;
			}		
		
		lineaAccionAcumuladoMesDepto=lineaAccionAcumuladoMesDepto.sort(compare);
		
		dibujarLineaAccionAcumuladoMesDepto(lineaAccionAcumuladoMesDepto, vectorMin, vectorMax, vectorMinEjecucion, vectorMaxEjecucion);
				
	});
	
	
	renderEntidades();
	
	 
	var nombreInstituciones = "";
	for(var x = 0; x < instituciones.length; x++){
		nombreInstituciones += instituciones[x].sigla;
	}
	$("#nombreInstitucionTabla").html(nombreInstituciones);

	var a = "";
	var todasInstituciones="";
	for(var t = 0; t < instituciones.length; t++){
		//a += renderTableroLineaAccion(instituciones[t].id);
		 todasInstituciones += instituciones[t].id+",";
	}
	todasInstituciones=todasInstituciones.substring(0,todasInstituciones.length - 1);
	 
	var todasInstituciones=getInstitucionesSeleccionadas();
	var a=renderTableroLineaAccion(todasInstituciones,null,null,periodoActual,null);
	//getPeriodo();
	$("#cuerpoTableroLineaAccion").html('');
	$("#cuerpoTableroLineaAccion").html(a);
	
	
	function renderTodasLasLineas(){		
		var sumporAClass="";
		var porAejeClass="";
		var porHejeClass="";
		var porHejeClassRow="";
		
		for (var i = 0; i< 18;i++){
			$("#cuerpoTabla").append('<tr><td colspan="12" ><strong>'+departamento[i].nombreDepartamento+'</strong></td></tr>');
			var lineasDeAccion= [];
			for(var j=0;j<lineaAccionDepartamento.length;j++){
				
				if (lineaAccionDepartamento[j].accion_departamento_id==departamento[i].idDepartamento){
					if (lineasDeAccion.indexOf(lineaAccionDepartamento[j].linea_accion_id)<0){
						lineasDeAccion.push(lineaAccionDepartamento[j].linea_accion_id);
						if(lineaAccionDepartamento[j].anho<="2014"){
							var anho1=lineaAccionDepartamento[j];
							
							var anho2;
							for(var k=0;k<lineaAccionDepartamento.length;k++){
								if (anho1.institucion_id==lineaAccionDepartamento[k].institucion_id && anho1.linea_accion_id==lineaAccionDepartamento[k].linea_accion_id && lineaAccionDepartamento[k].anho =="2015" && lineaAccionDepartamento[k].accion_departamento_id ==anho1.accion_departamento_id){
									anho2=lineaAccionDepartamento[k];
								}
							}
							if (typeof anho1==="undefined") {var anho1= new Object(); anho1.cantidad_ejecutada_hoy=""};
							if (typeof anho2==="undefined") {var anho2= new Object(); anho2.cantidad_ejecutada_hoy="";anho2.suma_programada_anho="";anho2.suma_programada_hoy="";};
							if (anho2.suma_programada_anho>0){
																
								for(var l=0; l<totalLineaPais.length;l++)
								{
										if(totalLineaPais[l].institucion_id == anho2.institucion_id && totalLineaPais[l].linea_accion_id == anho2.linea_accion_id && totalLineaPais[l].anho == anho2.anho)
										{
											anho2.linea_accion_meta = parseFloat((anho2.suma_programada_anho / totalLineaPais[l].suma_programada_anho_pais)*anho2.linea_accion_meta).toFixed(2);
										}
								}

								var porcentajeAnho = (anho2.suma_programada_anho*100)/anho2.linea_accion_meta;
								porcentajeAnho=parseFloat(porcentajeAnho).toFixed(2);
								var porcentajeAnhoEje = (anho2.cantidad_ejecutada_hoy*100)/anho2.suma_programada_anho;
								porcentajeAnhoEje=parseFloat(porcentajeAnhoEje).toFixed(2);
								var porcentajeHoyEje = (anho2.cantidad_ejecutada_hoy*100)/anho2.suma_programada_hoy;
								porcentajeHoyEje=parseFloat(porcentajeHoyEje).toFixed(2);

								porHejeClassRow="";

								if (porcentajeAnho<porcentaje2){ porHejeClassRow="danger";porHejeClass="";}
								if (porcentajeAnho>=porcentaje2){ porHejeClassRow="success";
									if (porcentajeHoyEje<=porcentaje1){ porHejeClass = "text-danger";}
									if (porcentajeHoyEje>porcentaje1){ porHejeClass = "text-warning";}
									if (porcentajeHoyEje>porcentaje2){ porHejeClass = "text-success";}
								}
								
								//<td>'+numeroConComa(anho1.cantidad_ejecutada_hoy)+'</td> despues de meta
								$("#cuerpoTabla").append('<tr class="'+porHejeClassRow+'"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#myModal" class="registro" codigoRegistro='+j+'-'+lineaAccionDepartamento[j].institucion_id+'-'+lineaAccionDepartamento[j].linea_accion_id+'-'+lineaAccionDepartamento[j].accion_departamento_id+'> '+lineaAccionDepartamento[j].institucion+'- '+anho2.linea_accion+'</a></td></td><td>Gs.'+numeroConComa((anho2.costo_programado_anho/1000000).toFixed(0))+'</a></td><td>'+anho2.accion_unidad_medida+'</td><td class="cell-bordered2">'+numeroConComa(anho2.linea_accion_meta)+'</td><td></td><td >'+numeroConComa(anho2.suma_programada_anho)+'</td><td class="'+sumporAClass+'">'+porcentajeAnho+'</td><td class="cell-bordered2">'+numeroConComa(anho2.suma_programada_hoy)+'</td><td >'+numeroConComa(anho2.cantidad_ejecutada_hoy)+'</td><td class="text-center '+porHejeClass+'">'+porcentajeHoyEje+'</td></tr>');
																															
								//<td class="'+porAejeClass+'">'+porcentajeAnhoEje+'</td> penultimo
								if ( porcentajeHoyEje ==="NaN"){ porcentajeHoyEje="";porHejeClassRow="";}
							}else{
								var porcentajeAnho = "";
								var porcentajeAnhoEje = "";
								var porcentajeHoyEje ="";
								porHejeClassRow="";
							}
							
							anho2="";
							anho1="";
						}
						if(lineaAccionDepartamento[j].anho>="2015"){
							var anho2=lineaAccionDepartamento[j];
 							var anho1="";
							for(var k=0;k<lineaAccionDepartamento.length;k++){
								if (anho2.institucion_id==lineaAccionDepartamento[k].institucion_id && anho2.linea_accion_id==lineaAccionDepartamento[k].linea_accion_id && lineaAccionDepartamento[k].date_part =="2014"){
									anho1=lineaAccionDepartamento[k];
								}
							}
							if (typeof anho1==="undefined") {var anho1= new Object(); anho1.cantidad_ejecutada_hoy="";};
							if (typeof anho2==="undefined") {var anho2= new Object(); anho2.cantidad_ejecutada_hoy="";anho2.suma_programada_anho="";anho2.suma_programada_hoy="";};
							if (anho2.suma_programada_anho>0){// tenia suma_programada_anho --------------------------------------------------
																
								// anho2.linea_accion_meta = anho2.suma_programada_anho  * 100 / totalLineaPais[y].suma_programada_anho_pais
								for(var l=0; l<totalLineaPais.length;l++)
								{
									if(totalLineaPais[l].institucion_id == anho2.institucion_id && totalLineaPais[l].linea_accion_id == anho2.linea_accion_id && totalLineaPais[l].anho == anho2.anho)
									{
										anho2.linea_accion_meta = parseFloat((anho2.suma_programada_anho / totalLineaPais[l].suma_programada_anho_pais)*anho2.linea_accion_meta).toFixed(2);
									}
								}
																
								//var porcentajeAnho = (anho2.suma_programada_hoy*100)/anho2.suma_programada_anho;
								var porcentajeAnho = (anho2.suma_programada_anho*100)/anho2.linea_accion_meta;
								porcentajeAnho=parseFloat(porcentajeAnho).toFixed(2);
								var porcentajeAnhoEje = (anho2.cantidad_ejecutada_hoy*100)/anho2.suma_programada_anho;
								porcentajeAnhoEje=parseFloat(porcentajeAnhoEje).toFixed(2);
								var porcentajeHoyEje = (anho2.cantidad_ejecutada_hoy*100)/anho2.suma_programada_hoy;
								porcentajeHoyEje=parseFloat(porcentajeHoyEje).toFixed(2);

								porHejeClassRow="";
			
								if (porcentajeAnho<porcentaje2){ porHejeClassRow="danger";porHejeClass="";}
								if (porcentajeAnho>=porcentaje2){ porHejeClassRow="success";
									if (porcentajeHoyEje<=porcentaje1){ porHejeClass = "text-danger";}
									if (porcentajeHoyEje>porcentaje1){ porHejeClass = "text-warning";}
									if (porcentajeHoyEje>porcentaje2){ porHejeClass = "text-success";}
								}								
								
								if (  porcentajeHoyEje ==="NaN"){ porcentajeHoyEje="";porHejeClassRow="";}
							}else{
								var porcentajeAnho = "";
								var porcentajeAnhoEje = "";
								var porcentajeHoyEje ="";
								porHejeClassRow="";
							}
							//<td>'+numeroConComa(anho1.cantidad_ejecutada_hoy)+'</td> despues de meta
							$("#cuerpoTabla").append('<tr class="'+porHejeClassRow+'"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#myModal" class="registro" codigoRegistro='+j+'-'+lineaAccionDepartamento[j].institucion_id+'-'+lineaAccionDepartamento[j].linea_accion_id+'-'+lineaAccionDepartamento[j].accion_departamento_id+'> '+lineaAccionDepartamento[j].institucion+'- '+anho2.linea_accion+'</a></td><td>Gs.'+numeroConComa((anho2.costo_programado_anho/1000000).toFixed(0))+'</td><td>'+anho2.accion_unidad_medida+'</td><td class="cell-bordered2">'+numeroConComa(anho2.linea_accion_meta)+'</td><td></td><td >'+numeroConComa(anho2.suma_programada_anho)+'</td><td class="'+sumporAClass+'">'+porcentajeAnho+'</td><td class="cell-bordered2">'+numeroConComa(anho2.suma_programada_hoy)+'</td><td>'+numeroConComa(anho2.cantidad_ejecutada_hoy)+'</td><td class=" text-center '+porHejeClass+'">'+porcentajeHoyEje+'</td></tr>');
							
							//<td class="'+porAejeClass+'">'+porcentajeAnhoEje+'</td> penultima
							anho2="";
							anho1="";
						}
					}
				}
			}
		}			
		
	}
	
	//renderTodasLasLineas();
	function cargarTablaAccionHasProducto(institucionId, lineaAccionId, idDepartamento, idDistrito, accionId){
		
		var accionId= accionId;
		var institucionId= institucionId;
		var lineaAccionId= lineaAccionId;
		var idDepartamento= idDepartamento;
		var idDistrito= idDistrito;
		
		var accionHasProducto = $.ajax({
	    	url:'/tablero/public/ajaxSelects3?action=getAccionHasProducto&accion_id='+accionId,
	      	type:'get',
	      	dataType:'json',
	      	crossDomain:true,
	      	async:false       
	    }).responseText;		
		accionHasProducto=JSON.parse(accionHasProducto);
				
		$("#TablaAccionHasProductos").html("");
	    var departamentoId = document.getElementById('selectorDepartamento').value;
		var fila ="";
		for(var f = 0; f < accionHasProducto.length; f++)
		{			
			fila += "<tr><td>"+accionHasProducto[f].nivel+"</td><td>"+accionHasProducto[f].entidad+"</td><td>"+accionHasProducto[f].tipoPrograma+"</td><td>"+accionHasProducto[f].programa+"</td><td>"+accionHasProducto[f].subPrograma+"</td><td>"+accionHasProducto[f].proyecto+"</td><td>"+accionHasProducto[f].sprProductoId+"</td><td>"+accionHasProducto[f].cantidadFisica+"</td><td>"+accionHasProducto[f].unidadMedida+"</td><td>"+accionHasProducto[f].clase+"</td><td>Gs."+accionHasProducto[f].cantidadFinanciera+"</td><td>Gs."+accionHasProducto[f].totalAsignacion+"</td><td><center><button type='submit' class='btn btn-success verificarDestinatarios' parametros="+accionHasProducto[f].nivel+"-"+accionHasProducto[f].entidad+"-"+accionHasProducto[f].tipoPrograma+"-"+accionHasProducto[f].programa+"-"+accionHasProducto[f].subPrograma+"-"+accionHasProducto[f].proyecto+"-"+accionHasProducto[f].sprProductoId+"-"+institucionId+"-"+lineaAccionId+"-"+idDepartamento+"-"+idDistrito+"-"+accionId+"><span class='glyphicon glyphicon-user'></span></button></center></td></tr>";
		}
		
		$("#TablaAccionHasProductos").append(fila);
		
	}
	
	//Falta pregunta si existe el modal y borrar si existe
	$("body").on("click", ".modalHitoAvances",function(event){
		
		if ( $("#myModal2").length ) {
			$("#myModal2").remove();
		}
 		if ( $("#modalAgregarHito").length ) {
			$("#modalAgregarHito").remove();
		} 
		if ( $("#modalDeclararAvance").length ) {
			$("#modalDeclararAvance").remove();
		}
		if ( $("#modalDestinatarios").length ) {
			$("#modalDestinatarios").remove();
		}
					
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-");                                                            
		var institucionId=idParsed[0];
		var lineaAccionId=idParsed[1];
		var idDepartamento= idParsed[2];
		var idDistrito= idParsed[3];
		var accionId = idParsed[4];
		var modalHito = "";
		var urlHitosAvances="";
		var optionDepartamentos = "";
		var optionDistritos = "";
		
		urlHitosAvances+='/tablero/public/ajaxSelects3?action=getHitosAvances';
	
		if (typeof institucionId != "undefined"){ urlHitosAvances+='&institucion_id='+institucionId;}
		//if (typeof lineaAccionId != "undefined"){ urlHitosAvances+='&linea_accion_id='+lineaAccionId;}
		if (typeof idDepartamento != "undefined" && idDepartamento != "" ){ urlHitosAvances+='&departamento='+idDepartamento;}
		if (typeof idDistrito != "undefined" && idDistrito != ""){ urlHitosAvances+='&distrito='+idDistrito;}
		if (typeof accionId != "undefined" ){ urlHitosAvances+='&accion_id='+accionId;}
		
		var registrosHitos = $.ajax({
	    	url:urlHitosAvances,
	      	type:'get',
	      	dataType:'json',
	      	crossDomain:true,
	      	async:false       
	    }).responseText;		
		var registroHitos=JSON.parse(registrosHitos);
		
		var accion = $.ajax({
	    	url:'/tablero/public/ajaxSelects3?action=getAccionesCatalogoUnidadMedida&accionId='+accionId,
	      	type:'get',
	      	dataType:'json',
	      	crossDomain:true,
	      	async:false       
	    }).responseText;		
		accion=JSON.parse(accion);
		
		var departamentos = $.ajax({
	    	url:'/tablero/public/ajaxSelects3?action=getDepartamento',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		departamentos = JSON.parse(departamentos);
	
		for(i = 0;i<18; i++){
			optionDepartamentos+='<option value="'+departamentos[i].idDepartamento+'" parametro="'+departamentos[i].idDepartamento+'">'+departamentos[i].nombreDepartamento+'</option>';
		}
		optionDepartamentos+='<option value="88" parametro="88">AUX.TRASP.</option>';
		optionDepartamentos+='<option value="99" parametro="99">ALC.NACIONAL</option>';
	
		var totalCantidadProgramada=0;
	
		modalHito += '<div class="modal fade" id="myModal2" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">'+
						'<div class="modal-dialog modal-lg" style="width:90%;" >'+
						    '<div class="modal-content" >'+
						      '<div class="modal-header">'+
						        '<button type="button" class="close registro" data-dismiss="modal"  codigoregistro="'+institucionId+'-'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'" data-toggle="modal" data-target="#myModal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
						        '<h4 class="modal-title" id="myModalLabel1"></h4>'+
						      '</div>'+
						      '<div class="modal-body" style="heigth:1200px;">'+ 
						      
					      			'<div class="row">'+
									'<div class="col-md-12">'+
							         '<div class="box" height="1000px">'+
							           '<div class="box-header with-border" height="1000px">'+
							             '<h2 class="box-title text-center" id="tituloTipoPrograma">'+
							               'Acción'+
							             '</h2>'+
							             '<div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
							             '</div>'+
							           '</div>'+
							           '<div class="box-body" style="display: block;">'+//INICIO DEL BODY
							           '<form role="form">'+
							           '<div class="table-responsive">'+
										'<table class="table table-hover hitos">'+
											'<tbody>'+
												'<tr><td><div class="form-group"><label for="nombreAccion">Acción</label><input type="text" class="form-control" id="nombreAccion" value="'+accion[0].accion+'"><input type="hidden" class="form-control" id="accionId" value="'+accion[0].accion_id+'"></div></td><td><div class="form-group"><label for="umedida">U. medida</label><input type="text" class="form-control" id="umedida" value="'+accion[0].accion_unidad_medida+'"></div></td></tr>'+
												'<tr><td><div class="form-group"><label for="departamento">Departamento</label><select id="selectorDepartamento" name="departamento" class="form-control">'+optionDepartamentos+'</select></div></td><td><div class="form-group"><label for="distrito">Distrito</label><select name="departamento" class="form-control" id="distritosDepartamento"></select></div></td></tr>'+												
											'</tbody>'+							           
										'</table>'+
										'</div>'+
										'</form>'+
							           '</div>'+//FIN DEL BODY
									   '</div>'+
									'</div>'+
							     '</div>'+	
							     							   					      
							     '<div class="row">'+ 
							      	'<div class="col-md-12">'+
									'<div class="box box-danger">'+
					                	'<div class="box-header with-border">'+
					                  		'<h3 class="box-title">Vinculación de Productos de la acción</h3>'+
				                  			'<div class="box-tools pull-right">'+
							                    '<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>'+
					                    		'</button>'+
					                    		'<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i>'+
					                    		'</button>'+
					                  		'</div>'+
					                	'</div>'+//fin box-heder
					                	'<div class="box-body no-padding">'+
							      			
							      			'<div class="table-responsive">'+
							                '<table class="table table-striped table-bordered  table-hover">'+
							               ' 	<tr>'+
							                '		<th>Nivel</th>'+
							                '		<th>Entidad</th>'+
							                '		<th>Tipo</th>'+
							                '		<th>Programa</th>'+
							                '		<th>Subprograma</th>'+
							                '		<th>Proyecto</th>'+
							                '		<th>Producto</th>'+
							                '		<th>Cantidad</th>'+
							                '		<th>U. Medida</th>'+
							                '		<th>Tipo</th>'+
							                '		<th>Asig. Financiera</th>'+
							                '		<th>Costo de la Acción</th>'+
							                '		<th>Destinatarios</th>'+
							                '	</tr>'+
							                '<tbody class="table-body-producto" id="TablaAccionHasProductos">'+
							                '</tbody>'+
							                '</table>'+
							                '</div>'+

					                	'</div>'+//fin box-body
					                	'<div class="box-footer">'+					                						
		      					  
					                		'<div class="row">'+
					      					    '<div class="form-group col-md-3">'+
					      					  		'<label for="totalFisico-formulario">Cantidad</label>'+
				      					    		'<input type="text" name="totalFisico" id="totalFisico-formulario" value="" class="form-control" disabled>'+
				      					    	'</div>'+
					      					    '<div class="form-group col-md-3">'+
				      					  			'<label for="unidadMedida-formulario">U. Medida</label>'+
			      					    			'<input type="text" name="totalFisico" id="unidadMedida-formulario" value="" class="form-control" disabled>'+
			      					    		'</div>'+
					      					    '<div class="form-group col-md-3">'+
			      					  				'<label for="clase-formulario">Tipo</label>'+
		      					    				'<input type="text" name="totalFisico" id="clase-formulario" value="" class="form-control" disabled>'+
		      					    			'</div>'+			      					    		
					      					    '<div class="form-group col-md-3">'+
		      					  					'<label for="totalFinanciero-formulario">Asig. Financiera</label>'+
							      					'<div class="input-group input-group-sm">'+
							      						'<span class="input-group-addon">Gs</span>'+
				      					    			'<input type="text" name="totalFinanciero" id="totalFinanciero-formulario" value="" class="form-control" disabled>'+
							      					'</div>'+
			      					    		'</div>'+   					    				
			      					    	'</div>'+// fin row	
			      					    	
					                	'</div>'+//fin box-footer
					                	
					                	
								    	'<div class="col-md-6">'+
							    		 '<div class="box">'+
							      			'<div class="box-header with-border">'+
							       				'<h2 class="box-title text-center">'+
							          				'Hitos'+ 	
							        			'</h2>'+
							        			'<div class="box-tools pull-right"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
							        			'</div>'+
							      			'</div>'+
							      			'<div class="box-body hitosProgramado">'+//cuerpo del body    			
							      				'<div class="table-responsive">'+							      				
													'<table class="table table-hover table-bordered" id="dataTablesHitos">'+
														'<thead>'+
															'<tr class="active"><th>Acción</th><th>Departamento</th><th>Distrito</th><th>U. Medida</th><th>Cantidad. Programado</th><th>Costo Total</th><th>Fecha Terminación</th><th>% Programado</th><th>Editar</th></tr>'+
														'</thead>'+
														'<tbody>';
																												
														for(var m = 0; m < registroHitos.length; m++)
														{
															if(registroHitos[m].hito_porcentaje_programado > 0)
															{
																modalHito += '<tr><td>'+registroHitos[m].accion_catalogo_nombre+'</td><td>'+registroHitos[m].accion_departamento+'</td><td>'+registroHitos[m].accion_distrito+'</td><td>'+registroHitos[m].accion_unidad_medida+'</td><td>'+registroHitos[m].hito_cantidad_programado+'</td><td>'+registroHitos[m].accion_costo+'</td><td>'+registroHitos[m].hito_fecha_entrega+'</td><td>'+registroHitos[m].hito_porcentaje_programado+'</td><td>'+																			 	 
																			 '</td></tr>';
																totalCantidadProgramada+=registroHitos[m].hito_cantidad_programado;
															}
														}
														totalCantidadProgramada=parseFloat(totalCantidadProgramada).toFixed(2);

														modalHito += '</tbody><tfoot><tr class="active"><td colspan="2">Total Cantidad Programada: </td><td colspan="7">'+totalCantidadProgramada+'</td></tr></tfoot>'+
																	 '</table>'+
																	 '</div>'+
							      			'</div>'+//FIN BODY
								   		'</div>'+
									'</div>'+
									
							    	'<div class="col-md-6">'+
						    		'<div class="box">'+
						      			'<div class="box-header with-border">'+
						       				'<h2 class="box-title text-center">'+
						          				'Avances'+ 	
						        			'</h2>'+
						        			'<div class="box-tools pull-right"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
						        			'</div>'+
						      			'</div>'+
						      			'<div class="box-body">'+ 
					      				'<div class="table-responsive">'+
										'<table class="table table-hover table-bordered" id="dataTablesAvances">'+
											'<thead>'+
												'<tr class="active"><th>Acción</th><th>Departamento</th><th>Distrito</th><th>U. Medida</th><th>Cantidad. Programado</th><th>Costo Total</th><th>Fecha Terminación</th><th>% Ejecutado</th><th>Editar</th></tr>'+
											'</thead>'+
											'<tbody>';											
											
											for(var m = 0; m < registroHitos.length; m++)
											{
												if(registroHitos[m].hito_porcentaje_ejecutado > 0)
												{
													modalHito += '<tr><td>'+registroHitos[m].accion_catalogo_nombre+'</td><td>'+registroHitos[m].accion_departamento+'</td><td>'+registroHitos[m].accion_distrito+'</td><td>'+registroHitos[m].accion_unidad_medida+'</td><td>'+registroHitos[m].hito_cantidad_programado+'</td><td>'+registroHitos[m].accion_costo+'</td><td>'+registroHitos[m].hito_fecha_entrega+'</td><td>'+registroHitos[m].hito_porcentaje_ejecutado+'</td><td>'+													
													'</td></tr>';
													totalCantidadProgramada+=registroHitos[m].hito_cantidad_programado;
												}
											}
											totalCantidadProgramada=parseFloat(totalCantidadProgramada).toFixed(2);

											modalHito += '</tbody><tfoot><tr class="active"><td colspan="2">Total Cantidad Programada: </td><td colspan="7">'+totalCantidadProgramada+'</td></tr></tfoot>'+
														 '</table>'+
														 '</div>'+						      			
						      			'</div>'+
							   		'</div>'+
								'</div>'+	

						    '</div>'+//fin row
						    
					      '</div>'+// fin body
						  '<div class="modal-footer">'+
						 	'<button type="button" class="btn btn-success registro" data-dismiss="modal" codigoregistro="'+institucionId+'-'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'" data-toggle="modal" data-target="#myModal">Cerrar</button>'+
						  '</div>'+
					    '</div>'+
					 '</div>'+
					'</div>'+					
					               	
           	'</div>'+//fin modal-content
         '</div>'+//fin modal-dialog
         '</div>';//fon myModal2
         
		$("body").append(modalHito);         		
		
		
		if (idDepartamento != ""){
        	$('#selectorDepartamento > option[value="'+idDepartamento+'"]').attr('selected', 'selected');
		}
				
		if (idDepartamento != ""){			
			var distritos = $.ajax({
		    	url:'/tablero/public/ajaxSelects3?action=getDistrito&departamento='+idDepartamento,
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
			
			$('#distritosDepartamento > option[value="'+idDistrito+'"]').attr('selected', 'selected');
		}
		$("#myModal2").modal('show');		
		
		$("#dataTablesHitos").DataTable();
		$("#dataTablesAvances").DataTable();
		
		$("body").on("change", "#selectorDepartamento",function(event){
			var departamentoId = $("#selectorDepartamento option:selected").val();
	    	
			var distritos = $.ajax({
		    	url:'/tablero/public/ajaxSelects3?action=getDistrito&departamento='+departamentoId,
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
		
		cargarTablaAccionHasProducto(institucionId, lineaAccionId, idDepartamento, idDistrito, accionId);
		
		
		function Combo(){

		    this.nivelFocus = function(){
			
		   	  var listaDatalist=document.getElementsByTagName('datalist');
		      var datosNiveles = $.ajax({
		          url:'/public/ajaxSelects?accion=getNiveles',
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
		    	var rutaNivel = 12;
		    	var datosNiveles = $.ajax({
		        	url:'/public/ajaxSelects?accion=getNiveles',
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
		    	var linkEntidad = 12;
		    	var datosEntidades = $.ajax({
		         	 url:'/public/ajaxSelects?accion=getEntidades&nivel='+linkEntidad,
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
		    	var linkEntidad = 12;
		      	var rutaEntidad2 = 1;
		      	

		      	var datosEntidades = $.ajax({
		        	url:'/public/ajaxSelects?accion=getEntidades&nivel='+linkEntidad,
		          	type:'get',
		          	dataType:'json',
		          	async:false       
		        }).responseText;

		        datosEntidades = JSON.parse(datosEntidades);
		 
		    	for(var x = 0; x < datosEntidades.entidades.length; x++)
		      	{
		        	if(datosEntidades.entidades[x].entidad == parseInt(rutaEntidad2)) 
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

		    	var rutaNivel = 12;
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
			        	url:'/public/ajaxSelects?accion=getNiveles',
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
					    	
					    	var linkEntidad = 12;
					      	var rutaEntidad2 = 1;
					      	

					      	var datosEntidades =[];
					      		$.ajax({
					        	url:'/public/ajaxSelects?accion=getEntidades&nivel='+linkEntidad,
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
						        	url:'/public/ajaxSelects?accion=getTiposPrograma',
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
		        	url:'/public/ajaxSelects?accion=getTiposPrograma',
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
		    	var linkNivel = 12;
		      	var linkEntidad = 1;
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
		        	url:'/public/ajaxSelects?accion=getProgramas&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPrograma,
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
		    	var linkNivel = 12;
		      	var linkEntidad = 1;
		      	var linkTipoPrograma = document.getElementById("tipoPrograma-formulario").value;
		      	var numeroProgramaIngresado = document.getElementById("programa-formulario").value;

		    	var datosProgramas =  [];
		    	
		    	$.ajax({
		        	url:'/public/ajaxSelects?accion=getProgramas&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPrograma,
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
		    	var linkNivel = 12;
		      	var linkEntidad = 1;    	
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
		        	url:'/public/ajaxSelects?accion=getSubprogramas&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPrograma+'&programa='+linkPrograma,
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
		    	var linkNivel = 12;
		      	var linkEntidad = 1;
			    var linkTipoPrograma = document.getElementById("tipoPrograma-formulario").value;
			    var linkPrograma = document.getElementById("programa-formulario").value;
			    var numeroSubProgramaIngresado = document.getElementById("subPrograma-formulario").value;

		    	var datosSubProgramas = [];
		    	
		    	$.ajax({
		        	url:'/public/ajaxSelects?accion=getSubprogramas&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPrograma+'&programa='+linkPrograma,
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
		    	var linkNivel = 12;
		      	var linkEntidad = 1;
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
		         	 url:'/public/ajaxSelects?accion=getProyectos&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPrograma+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma,
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
		    	var linkNivel = 12;
		      	var linkEntidad = 1;
			    var linkTipoPrograma = document.getElementById("tipoPrograma-formulario").value;
			    var linkPrograma = document.getElementById('programa-formulario').value;
			    var linkSubPrograma = document.getElementById('subPrograma-formulario').value;
			    var numeroProyectoIngresado = document.getElementById("proyecto-formulario").value;

		    	var datosProyectos = [];
		    	$.ajax({
		          url:'/public/ajaxSelects?accion=getProyectos&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPrograma+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma,
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
		    	var linkNivel = 12;
		      	var linkEntidad = 1;
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
		         	 url:'/public/ajaxSelects?accion=getProductosPresupuesto&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipo='+linkTipoPrograma+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma+'&proyecto='+linkProyecto,
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
			        
 			        for(var i = 0; i < datosProductos.producto.length ; i++) 
			        {       

				    	$.ajax({
				         	 url:'/public/ajaxSelects?accion=getProductos&producto='+datosProductos.producto[i].producto_id,
				          	type:'get',
				          	crossDomain: 'true',
				          	dataType:'jsonp',
			                jsonp: 'callback',
			                jsonpCallback: 'jsonpCallbackProductoDetalle',
				          	async:false,
				          	success: function( data, textStatus, jqXHR) {
				          		if(data.success){
				          			jsonpCallbackProductoDetalle(data)
				          		}
				          	}    
				        });
			        } 
					    	
		        	function jsonpCallbackProductoDetalle(data) {
					    	datosProductosDetalle = data;						    						    	
  
						          var option = document.createElement('option');
						          option.setAttribute('value', datosProductosDetalle.productos[0].codigoCatalogo);
						          option.setAttribute('label', datosProductosDetalle.productos[0].nombreCatalogo);
						          datalistProductos.appendChild(option);      
					}			        	  			      	  
			    	
			    }//fin primer callback
		    }
		    
		    this.producto = function(){
		    	var linkNivel = 12;
		      	var linkEntidad = 1;
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
		         	url:'/public/ajaxSelects?accion=getProductos&producto='+linkProducto,
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
			         	 url:'/public/ajaxSelects?accion=getProductoUnidadMedida&unidadMedidaId='+datosProductos.productos[0].codUnidadMedida,
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
						var periodoSeleccionado = $("#periodoSeleccion option:selected").val(); 
						
		        		var mostrarUnidadMedida = datosProductoUnidadMedida.producto[0].unidadMedidaNombre;
			    		$("#unidadMedida-formulario").val(mostrarUnidadMedida);
			    		
				    	$.ajax({
				         	url:'/public/ajaxSelects?accion=getAsignacionPresiVersion&nivel=12&entidad=1&tipo='+linkTipoPrograma+'&programa='+linkPrograma+'&subPrograma='+linkSubPrograma+'&proyecto='+linkProyecto+'&producto='+linkProducto+'&anho='+periodoSeleccionado+'&versionReporte=50',
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
			        			if (linkTipoPrograma == datos[z].tipo && linkPrograma == datos[z].programa && linkSubPrograma == datos[z].subPrograma && linkProyecto == datos[z].proyecto && linkProducto == datos[z].producto ){
			        				totalFinanciero += ( parseFloat(datos[z].planificado1) + parseFloat(datos[z].planificado2) + parseFloat(datos[z].planificado3) + parseFloat(datos[z].planificado4) + parseFloat(datos[z].planificado5) + parseFloat(datos[z].planificado6) + parseFloat(datos[z].planificado7) + parseFloat(datos[z].planificado8) + parseFloat(datos[z].planificado9) + parseFloat(datos[z].planificado10) + parseFloat(datos[z].planificado11) + parseFloat(datos[z].planificado12) );
			        			}
			        		}
				    		
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
				         	 url:'/public/ajaxSelects?accion=getProductoTipoN&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipo='+linkTipoPrograma+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma+'&proyecto='+linkProyecto+'&producto='+linkProducto,
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
				         	 url:'/public/ajaxSelects?accion=getProductoTipoN&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipo='+linkTipoPrograma+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma+'&proyecto='+linkProyecto+'&producto='+linkProducto,
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
	
});


	//Modal para desplegar Destinatarios
	$("body").on("click", ".verificarDestinatarios",function(event){
		event.stopPropagation();
		event.preventDefault();
		
		if ( $("#modalDestinatarios").length ) {
			$("#modalDestinatarios").remove();
		}
		
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-"); 
	    var nivel=idParsed[0];
	    var entidad=idParsed[1];
	    var tipoPrograma=idParsed[2];
	    var programa=idParsed[3];
	    var subPrograma=idParsed[4];
	    var proyecto=idParsed[5];
	    var producto=idParsed[6]
		var institucionId=idParsed[7];
		var lineaAccionId=idParsed[8];
		var idDepartamento= idParsed[9];
		var idDistrito= idParsed[10];
		var accionId = idParsed[11];	
	
	    var linkDepartamentoId = document.getElementById('selectorDepartamento').value;
	    var nombreDepartamento = $("#selectorDepartamento option:selected").text();
	    
		var modalVerificarDestinatarios = "";
		var cuerpoTablaDestinatario="";
		var tabla='#tabla-destinatarios-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subPrograma+'-'+proyecto+'-'+producto;
		
	     $(tabla).html("");	      
	     var datosProductoPresupuestoDestinatario =[];
      	 $.ajax({
        	url:'/public/ajaxSelects?accion=getProductoPresupuestoDestinatario&nivel='+nivel+'&entidad='+entidad+'&tipoPresupuesto='+tipoPrograma+'&programa='+programa+'&subprograma='+subPrograma+'&proyecto='+proyecto+'&producto='+producto+'&deptoPais='+linkDepartamentoId,
          	type:'get',
          	crossDomain: 'true',
          	dataType:'jsonp',
            jsonp: 'callback',
            jsonpCallback: 'jsonpCallbackProductoPresupuestoDestinatarios',
          	async:false,
          	success: function( data, textStatus, jqXHR) {
          		if(data.success){
          			jsonpCallbackProductoPresupuestoDestinatarios(data);
          		}
          	}
        });      		      		

      	function jsonpCallbackProductoPresupuestoDestinatarios(data) {
      		datosProductoPresupuestoDestinatario= data;
      		      		
	      	var datosDepartamentos =[];
      		$.ajax({
	        	url:'/public/ajaxSelects?accion=getDepartamentos',
	          	type:'get',
	          	crossDomain: 'true',
	          	dataType:'jsonp',
	            jsonp: 'callback',
	            jsonpCallback: 'jsonpCallbackDepartamento',
	          	async:false,
	          	success: function( data, textStatus, jqXHR) {
	          		if(data.success){
	          			jsonpCallbackDepartamento(data);
	          		}
	          	}
        	});
	
	      	function jsonpCallbackDepartamento(data) {
	      		datosDepartamentos= data;      		      		
	      		
	      		var modalVerificarDestinatarios="";
	      		modalVerificarDestinatarios+='<div class="modal fade" id="modalDestinatarios" data-backdrop="static" data-keyboard="false">'+
		 		  '<div class="modal-dialog modal-lg" >'+
		 		    '<div class="modal-content">'+
		 		      '<div class="modal-header">'+
			          '<button type="button" class="btn btn-default modalHitoAvances" data-dismiss="modal" parametros="'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'-'+accionId+'" aria-label="Close"><span aria-hidden="true">&times;</button>'+ 
		 		      '</div>'+
		 		      '<div class="modal-body">'; 
		 		    modalVerificarDestinatarios+=
		 		        '<div class="box" height="1000px" style="overflow-y: initial !important;overflow-x: initial !important">'+
		 		         '<div class="box-header with-border" height="1000px">'+
		 		          '<h3 class="box-title" id="tituloTipoPrograma">'+
		 		           '<strong>Destinatarios</strong>'+
		 		            '</h3>'+
		 		              '</div>'+ 		           
		 		            
		 		            '<div class="box-body scroll-x pre-scrollable">'+
		 		              '<ul  class="col-md-12">'+
		 		              '<form id="form-guardar-destinatario-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subPrograma+'-'+proyecto+'-'+producto+'">'+
		                       '<table class="table table-striped table-bordered  table-hover">'+
		 	                     ' 	<tr>'+
		                       '<th>Destinatario</th>';
		 		    				 for (var iDep=0;iDep<20;iDep++){
		 		    					modalVerificarDestinatarios+= '<th>'+datosDepartamentos.departamentos[iDep].abrevDepartamento+'</th>';
		 		    				 }
		 		    						 		    				
		 		    				modalVerificarDestinatarios+='	</tr>'+
		 	                      '<tbody class="table-body-producto-destinatario" id="tabla-destinatarios-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subPrograma+'-'+proyecto+'-'+producto+'">'+
		 	                      '</tbody>'+
		 	                      '</table>'+
		 	                      '<br>'+
		 		                    '<div class="box-footer">'+
							          '<button type="button" class="btn btn-default modalHitoAvances" parametros="'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'-'+accionId+'">Cerrar</button>'+ 
		 		                    '</div>'+
		 						'</form>'+
		 					'</ul>'+
		 				'</div>'+
		 			'</div>'+
		 		'</div>';
	 		
			$("body").append(modalVerificarDestinatarios);			    				
			    				
			var cuerpoTablaDestinatario="";
			var destinatarioGrupo= new Array(); //tiene los meses
			var destinatarioDepto = new Array(); //tiene los departamentos

   			for (var iDest=0;iDest<datosProductoPresupuestoDestinatario.producto.length;iDest++){
   				cuerpoTablaDestinatario+="<tr><td>"+datosProductoPresupuestoDestinatario.producto[iDest].nombreCatalogo+"</td>";
   			  	detalleMes=new Array();
   					if (datosProductoPresupuestoDestinatario.producto.length>0){  
   				    	for (var iDepto=0;iDepto<18;iDepto++){
   				    		if(datosProductoPresupuestoDestinatario.producto[iDest].departamento == iDepto){
    				    		cuerpoTablaDestinatario+='<td><input type="text" class= "destinatario-dest-dept" size="5px" name="destinatarios-'+producto+'-'+iDest+'-'+iDepto+'" id="dest-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subPrograma+'-'+proyecto+'-'+producto+'-'+iDest+'-'+iDepto+'" value="'+datosProductoPresupuestoDestinatario.producto[iDest].cantidad+'"></td>';
   				    		}else{
	    				    	cuerpoTablaDestinatario+='<td><input type="text" class= "destinatario-dest-dept" size="5px" name="destinatarios-'+producto+'-'+iDest+'-'+iDepto+'" id="dest-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subPrograma+'-'+proyecto+'-'+producto+'-'+iDest+'-'+iDepto+'" value=""></td>';		 
   				    		}
   				    	}
   				    	if (datosProductoPresupuestoDestinatario.producto[iDest].departamento == 88){
    				      	cuerpoTablaDestinatario+='<td><input type="text" class= "destinatario-dest-dept" size="5px" name="destinatarios-'+producto+'-'+iDest+'-'+iDepto+'" id="dest-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subPrograma+'-'+proyecto+'-'+producto+'-'+iDest+'-'+iDepto+'" value="'+datosProductoPresupuestoDestinatario.producto[iDest].cantidad+'"></td><td><input type="text" class= "destinatario-dest-dept" size="5px" name="destinatarios-'+producto+'-'+iDest+'-'+iDepto+'" id="dest-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subPrograma+'-'+proyecto+'-'+producto+'-'+iDest+'-'+iDepto+'" value=""></td>';			    				    		  		
   				    	}
   				    	if (datosProductoPresupuestoDestinatario.producto[iDest].departamento == 99){
    				      	cuerpoTablaDestinatario+='<td><input type="text" class= "destinatario-dest-dept" size="5px" name="destinatarios-'+producto+'-'+iDest+'-'+iDepto+'" id="dest-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subPrograma+'-'+proyecto+'-'+producto+'-'+iDest+'-'+iDepto+'" value=""></td><td><input type="text" class= "destinatario-dest-dept" size="5px" name="destinatarios-'+producto+'-'+iDest+'-'+iDepto+'" id="dest-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subPrograma+'-'+proyecto+'-'+producto+'-'+iDest+'-'+iDepto+'" value="'+datosProductoPresupuestoDestinatario.producto[iDest].cantidad+'"></td>';			    				    		  		   				    	
  				    	}
   				    	if (datosProductoPresupuestoDestinatario.producto[iDest].departamento != 88 && datosProductoPresupuestoDestinatario.producto[iDest].departamento != 99){
    				      	cuerpoTablaDestinatario+='<td><input type="text" class= "destinatario-dest-dept" size="5px" name="destinatarios-'+producto+'-'+iDest+'-'+iDepto+'" id="dest-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subPrograma+'-'+proyecto+'-'+producto+'-'+iDest+'-'+iDepto+'" value=""></td><td><input type="text" class= "destinatario-dest-dept" size="5px" name="destinatarios-'+producto+'-'+iDest+'-'+iDepto+'" id="dest-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subPrograma+'-'+proyecto+'-'+producto+'-'+iDest+'-'+iDepto+'" value=""></td>';			    				    		  			  
  				    	}   				    		
   				    }else{
   				    	for (var iDepto=0;iDepto<20;iDepto++){
   				    		cuerpoTablaDestinatario+='<td><input type="text" class= "destinatario-dest-dept" size="5px" name="destinatarios-'+producto+'-'+iDest+'-'+iDepto+'" id="dest-'+nivel+'-'+entidad+'-'+tipoPrograma+'-'+programa+'-'+subPrograma+'-'+proyecto+'-'+producto+'-'+iDest+'-'+iDepto+'" value=""></td>';	  
   				    	}
   				    }
   			  		cuerpoTablaDestinatario+='<input type="hidden" name="catalogo_destinatario[]" value="'+datosProductoPresupuestoDestinatario.producto[iDest].id+'">'
   			  		cuerpoTablaDestinatario+='</tr>';   			  		  
			}
   			$(tabla).append(cuerpoTablaDestinatario);				
   						    						    				
   			$('#modalDestinatarios').modal('show');
	      		
	    	}//fin callback departamentos
		}// fin callback productoPresupuestoDestinatario	     
	}); 
	</script>    
  </body>
</html>
