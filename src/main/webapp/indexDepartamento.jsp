<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="org.jasig.cas.client.authentication.AttributePrincipalImpl"%>
<%@ page import="org.jasig.cas.client.authentication.AttributePrincipal"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>


<!DOCTYPE html>
<html>
  <head>
  <!--  ISO-8859-1 -->
 	 <%@ include file="/frames/head.jsp" %>
 	<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

   	<script src="https://cdnjs.cloudflare.com/ajax/libs/floatthead/1.2.10/jquery.floatThead.min.js"></script> -->	  
	<!-- <script src="frames/entidad.js" type="text/javascript"></script> -->
	<script type="text/javascript" src="dist/canvasjs/canvasjs.min.js" ></script>

	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrapslider.css" rel="stylesheet">

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
    </style>
    
    



</head>
<body class="skin-blue sidebar-mini sidebar-collapse">

       <div class="modal fade" id="myModal" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">

		<div class="modal-dialog modal-lg" style="width:90%;">
		    <div class="modal-content" >
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel1"></h4>
		      </div>
		      <div class="modal-body" id="editar-subprograma" >
		     		
		     	<div class="nav-tabs-custom">
                <ul class="nav nav-tabs pull-right">
              <li class="active"><a href="#tab_1-1" data-toggle="tab"  title="Acciones"><i class="glyphicon glyphicon-list"></i></a></li>
                  <li><a href="#tab_2-2" data-toggle="tab" title="Hitos"><i class="glyphicon glyphicon-list-alt"></i></a></li>
                  <li><a href="#tab_3-2" data-toggle="tab" title="Evolución"><i class="glyphicon glyphicon-stats"></i></a></li>
                  <li><a href="#tab_4-2" data-toggle="tab" title="Beneficiarios"><i class="glyphicon glyphicon-user"></i></a></li>
                  <li><a href="#tab_5-2" data-toggle="tab" title="Ubicaciones"><i class="glyphicon glyphicon glyphicon-map-marker"></i></a></li>
              		Detalle de Linea de Accion      
                </ul>
                <div class="tab-content">
                  <div class="tab-pane active" id="tab_1-1"></div><!-- /.tab-pane -->
                  <div class="tab-pane" id="tab_2-2"></div><!-- /.tab-pane -->
                  <div class="tab-pane" id="tab_3-2"></div><!-- /.tab-pane -->
                   <div class="tab-pane" id="tab_4-2"></div><!-- /.tab-pane -->
                   <div class="tab-pane" id="tab_5-2"></div><!-- /.tab-pane -->
                </div><!-- /.tab-content -->
              </div>
		      </div>
			  <div class="modal-footer"> 
				
			  </div>
		    </div> 
		 </div>
		</div>


<% AttributePrincipal user = (AttributePrincipal) request.getUserPrincipal();%>
<% Map attributes = user.getAttributes(); 
if (user != null) { %>

<script>
	
	$(document).ready(function(){
		var lineaAccionAcumuladoMesDepto;
		
		var vectorMin=0;
		var vectorMax=0;
		var vectorMinEjecucion=0;
		var vectorMaxEjecucion=0;
		
		function dibujarLineaAccionAcumuladoMesDepto(lineaAccionAcumuladoMesDepto, vectorMin, vectorMax, vectorMinEjecucion, vectorMaxEjecucion){
			
			var dataPoints=[];
			var ejecutada=[];
			
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
				cantidadTotalProgramada+=lineaAccionAcumuladoMesDepto[i].cantidad_programada;
		
				if(lineaAccionAcumuladoMesDepto[i].mes >= lineaAccionAcumuladoMesDepto[vectorMin].mes && lineaAccionAcumuladoMesDepto[i].mes <= lineaAccionAcumuladoMesDepto[vectorMax].mes)
				{
	 				dataPoints.push({ x: new Date( lineaAccionAcumuladoMesDepto[i].mes), y: cantidadTotalProgramada});
				}

			}
			
			for(var i = 0;i<lineaAccionAcumuladoMesDepto.length; i++)
			{
				cantidadTotalEjecutada+=lineaAccionAcumuladoMesDepto[i].cantidad_ejecutda;
		
				if(lineaAccionAcumuladoMesDepto[i].mes >= lineaAccionAcumuladoMesDepto[vectorMinEjecucion].mes && lineaAccionAcumuladoMesDepto[i].mes <= lineaAccionAcumuladoMesDepto[vectorMaxEjecucion].mes)
				{
	 				if (lineaAccionAcumuladoMesDepto[i].cantidad_ejecutda!=0)  ejecutada.push({ x: new Date( lineaAccionAcumuladoMesDepto[i].mes), y: cantidadTotalEjecutada});
				}

			}


			var chart = new CanvasJS.Chart("chartContainer",
					{
							zoomEnabled: true,
							exportEnabled: true,
							exportFileName: lineaAccionAcumuladoMesDepto[0].institucion+" - "+lineaAccionAcumuladoMesDepto[0].linea_accion+" ("+lineaAccionAcumuladoMesDepto[0].accion_unidad_medida+")",
							title: {
								text: "Evolución Mensual" +" ("+lineaAccionAcumuladoMesDepto[0].accion_unidad_medida+")" 
							},
	                        	animationEnabled: true,
	                        	width: 800,
						axisX:{      
							valueFormatString: "YYYY-MM" ,
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
						data: [
						{        
							indexLabelFontColor: "darkSlateGray",
							showInLegend: true, 
							name: 'programada',
							type: "line",
							//color: "rgba(0,75,141,0.7)",
							markerSize:8,
							legendText:"Programación",
							dataPoints:dataPoints
						},
						{        
							indexLabelFontColor: "darkSlateGray",
							showInLegend: true, 
							name: 'ejecutadas',
							type: "area",
							//color: "rgba(0,75,141,0.8)",
							markerSize:8,
							legendText:"Ejecución",
							dataPoints:ejecutada
						}
					  ]
					});
					
			chart.render();
		 }

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
			var unidad_medida= idParsed[3];
			var idDepartamento= idParsed[4];
			var tituloModal="";
			var cuerpoModal="";
			var cuerpoModal2="";
			var footerModal="<br><br><br>";
			
			//Registro tiene los hitos de la accion
			var registros = $.ajax({
		    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getFactHitos2015&institucion_id='+institucion_id+'&linea_accion_id='+linea_accion_id+'&departamento='+idDepartamento,
		      	type:'get',
		      	dataType:'json',
		      	crossDomain:true,
		      	async:false       
		    }).responseText;
			var elRegistro=JSON.parse(registros);
			
						

			cuerpoModal='<div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">'+
						'<div class="row">'+
							'<div class="col-sm-6">'+
								'<div class="dataTables_length" id="example1_length"><label>Show <select name="example1_length" aria-controls="example1" class="form-control input-sm"><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> entries</label></div>'+
							'</div>'+
							'<div class="col-sm-6">'+
								'<div id="example1_filter" class="dataTables_filter"><label>Search:<input type="search" class="form-control input-sm" placeholder="" aria-controls="example1"></label></div>'+
							'</div>'+
							'<div class="row">'+
								'<div class="col-sm-12">'+
									'<div class="table-responsive">'+
										'<table class="table table-hover hitos" >'+
											'<tr class="active"><td>Acción</td><td>Departamento</td><td>Distrito</td><td>U. Medida</td><td>Cantidad. Programado</td><td>Costo Total</td><td>Fecha Terminación</td><td>% Programado</td><td>% Ejecutado</td></tr>';

						var totalCantidadProgramada=0;
						tituloModal='<h3><center>'+elRegistro[0].institucion+'&nbsp;&nbsp;-&nbsp;&nbsp;'+elRegistro[0].linea_accion+'</center></h3>';
						for(var m=0; m<elRegistro.length;m++)
						{
								cuerpoModal+='<tr><td>'+elRegistro[m].accion+'</td><td>'+elRegistro[m].accion_departamento+'</td><td>'+elRegistro[m].accion_distrito+'</td><td>'+elRegistro[m].accion_unidad_edida+'</td><td>'+elRegistro[m].hito_cantidad_programado+'</td><td>'+elRegistro[m].accion_costo+'</td><td>'+elRegistro[m].hito_fecha_entrega+'</td><td>'+elRegistro[m].hito_porcentaje_programado+'</td><td>'+elRegistro[m].hito_porcentaje_ejecutado+'</td></tr>';
								totalCantidadProgramada+=elRegistro[m].hito_cantidad_programado;
						}
						totalCantidadProgramada=parseFloat(totalCantidadProgramada).toFixed(2);

						cuerpoModal+='<tr class="active"><td colspan="2">Total Cantidad Programada: </td><td colspan="8">'+totalCantidadProgramada+'</td></tr>'+
									 '</table>'+
									 '</div></div></div></div></div>';
			
			$('#myModal').find(".modal-title").html(tituloModal);
			$('#myModal').find("#tab_1-1").html("");
			$('#myModal').find("#tab_2-2").html("");
			$('#myModal').find("#tab_3-2").html("");

			$("#tab_3-2").append('Programación: <label id="fechaInicio"></label><input id="rango-fecha" type="text" class="span2" value="" data-slider-min="10" data-slider-max="1000" data-slider-step="1" data-slider-value="[250,450]"/><label id="fechaFin"></label>');
			$("#tab_3-2").append('<br><br>Ejecución: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label id="fechaInicioEjecucion"></label><input id="rango-fecha-ejecucion" type="text" class="span2" value="" data-slider-min="10" data-slider-max="1000" data-slider-step="1" data-slider-value="[250,450]"/><label id="fechaFinEjecucion"></label>');

			$('#myModal').find("#tab_2-2").html(cuerpoModal);
			//$('#myModal').find(".modal-footer").html(footerModal);
			
			//Obtenemos los hitos de las acciones
			var registrosAccion = $.ajax({
		    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getFactHitos2015Accion&institucion_id='+institucion_id+'&linea_accion_id='+linea_accion_id+'&departamento='+idDepartamento,
		      	type:'get',
		      	dataType:'json',
		      	crossDomain:true,
		      	async:false       
		    }).responseText;
			registrosAccion=JSON.parse(registrosAccion);			
			
			cuerpoModal2='<div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">'+
						 	'<div class="row">'+
								'<div class="col-sm-6">'+
									'<div class="dataTables_length" id="example1_length"><label>Show <select name="example1_length" aria-controls="example1" class="form-control input-sm"><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> entries</label></div>'+
								'</div>'+
								'<div class="col-sm-6">'+
									'<div id="example1_filter" class="dataTables_filter"><label>Search:<input type="search" class="form-control input-sm" placeholder="" aria-controls="example1"></label></div>'+
								'</div>'+
							'<div class="row">'+
								'<div class="col-sm-12">'+
									'<div class="table-responsive">'+
										'<table class="table table-hover hitos" >'+
											'<tr class="active"><td>Acción</td><td>Departamento</td><td>Distrito</td><td>U. Medida</td><td>Cantidad. Programado</td><td>Costo Total</td><td>Fecha Terminación</td><td>% Programado</td><td>% Ejecutado</td></tr>';

			var totalCantidadProgramada2=0;
			for(var l=0; l<registrosAccion.length;l++)
			{
					cuerpoModal2+='<tr><td>'+registrosAccion[l].accion+'</td><td>'+registrosAccion[l].accion_departamento+'</td><td>'+registrosAccion[l].accion_distrito+'</td><td>'+registrosAccion[l].accion_unidad_edida+'</td><td>'+registrosAccion[l].hito_cantidad_programado+'</td><td>'+registrosAccion[l].accion_costo+'</td><td>'+registrosAccion[l].hito_fecha_entrega+'</td><td>'+registrosAccion[l].hito_porcentaje_programado+'</td><td>'+registrosAccion[l].hito_porcentaje_ejecutado+'</td></tr>';
					totalCantidadProgramada2+=registrosAccion[l].hito_cantidad_programado;
			}
			totalCantidadProgramada2=parseFloat(totalCantidadProgramada2).toFixed(2);

			cuerpoModal2+='<tr class="active"><td colspan="2">Total Cantidad Programada: </td><td colspan="8">'+totalCantidadProgramada2+'</td></tr>'+
						 '</table>'+
						 '</div></div></div></div></div>';			
			
			$('#myModal').find("#tab_1-1").html(cuerpoModal2);
			
			
			
			lineaAccionAcumuladoMesDepto = $.ajax({
		    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getLineaAccionAcumuladoMesDepto&institucion_id='+institucion_id+'&linea_accion_id='+linea_accion_id+'&departamento='+idDepartamento,
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
			
			$('#myModal').find("#tab_4-2").html("");
			$('#myModal').find("#tab_4-2").html("Datos no disponibles");
			$('#myModal').find("#tab_5-2").html("");
			$('#myModal').find("#tab_5-2").html("Datos no disponibles");
			
			function compare(a,b) {             
				  if (a.mes < b.mes)
				    return -1;
				  if (a.mes > b.mes)
				    return 1;
				  return 0;
				}
			
			lineaAccionAcumuladoMesDepto=lineaAccionAcumuladoMesDepto.sort(compare);
			
			dibujarLineaAccionAcumuladoMesDepto(lineaAccionAcumuladoMesDepto, vectorMin, vectorMax, vectorMinEjecucion, vectorMaxEjecucion);
			
			 $(function () {
			       
			        $('.hitos').dataTable({
			          "bPaginate": false,
			          "bLengthChange": false,
			          "bFilter": true,
			          "bSort": true,
			          "bInfo": true,
			          "bAutoWidth": false,
			          "language":{
			        	    "sProcessing":     "Procesando...",
			        	    "sLengthMenu":     "Mostrar _MENU_ registros",
			        	    "sZeroRecords":    "No se encontraron resultados",
			        	    "sEmptyTable":     "Ningún dato disponible en esta tabla",
			        	    "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
			        	    "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
			        	    "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
			        	    "sInfoPostFix":    "",
			        	    "sSearch":         "Buscar:",
			        	    "sUrl":            "",
			        	    "sInfoThousands":  ",",
			        	    "sLoadingRecords": "Cargando...",
			        	    "oPaginate": {
			        	        "sFirst":    "Primero",
			        	        "sLast":     "Último",
			        	        "sNext":     "Siguiente",
			        	        "sPrevious": "Anterior"
			        	    },
			        	    "oAria": {
			        	        "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
			        	        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
			        	    }
			        	}
			        });
			      });			
	});
		
		
		var entidadCas = "";
		entidadCas ="<%=attributes.get("entidad") %>";
		var usuarios = $.ajax({
			url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getUsuarios&usuario=<%=user.getName()%>',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		usuarios = JSON.parse(usuarios);
		usuarios = usuarios.usuarios;
		$("#nombreUsuario").append(usuarios[0].correo+" ("+usuarios[0].nivel_id+", "+usuarios[0].entidad_id+")");
		$("#PerfilUsuario").append(usuarios[0].nombre+" ("+usuarios[0].nivel_id+", "+usuarios[0].entidad_id+", "+entidadCas+")");

		var i=parseInt(0);
		
		function numeroConComa(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
		var entidades = $.ajax({
	    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getEntidades',
	      	type:'get',
	      	dataType:'json',
	      	crossDomain:true,
	      	async:false       
	    }).responseText;
		entidades=JSON.parse(entidades);
		
		
		var lineaAccionDepartamento = $.ajax({
	    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getLineasAccionDepartamento',
	      	type:'get',
	      	dataType:'json',
	      	crossDomain:true,
	      	async:false       
	    }).responseText;
		lineaAccionDepartamento=JSON.parse(lineaAccionDepartamento);
		
		var departamento = $.ajax({
	    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getDepartamento',
	      	type:'get',
	      	dataType:'json',
	      	crossDomain:true,
	      	async:false       
	    }).responseText;
		departamento=JSON.parse(departamento);
		
		var elPaisjson = $.ajax({
	    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getLineasAccion',
	      	type:'get',
	      	dataType:'json',
	      	crossDomain:true,
	      	async:false       
	    }).responseText;
		var elPais=JSON.parse(elPaisjson);
		
		var totalLineaPais=[];
		var y=0;
		for (var z=0; z<elPais.length;z++){
			if (elPais[z].anho=="2015")
			{
				totalLineaPais[y] = new Object();
				totalLineaPais[y].institucion_id=elPais[z].institucion_id;
				totalLineaPais[y].linea_accion_id=elPais[z].linea_accion_id;
				totalLineaPais[y].anho="2015";
				totalLineaPais[y].suma_programada_anho_pais= elPais[z].suma_programada_anho;
				totalLineaPais[y].accion_departamento_id= elPais[z].suma_programada_anho;
				y++;
			}
		}
		y=0;
		
		
		
		
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
								
								//for para recorrer totalLineaPais con if para seleccionar la insittucion, la linea y anho considerando lo cargado en anho2, luego 
								//     anho2.linea_accion_meta = anho2.suma_programada_anho  * 100 / totalLineaPais[y].suma_programada_anho_pais
								for(var l=0; l<totalLineaPais.length;l++)
								{
										if(totalLineaPais[l].institucion_id == anho2.institucion_id && totalLineaPais[l].linea_accion_id == anho2.linea_accion_id && totalLineaPais[l].anho == anho2.anho)
										{
											anho2.linea_accion_meta = parseFloat((anho2.suma_programada_anho / totalLineaPais[l].suma_programada_anho_pais)*anho2.linea_accion_meta).toFixed(2);
										}
								}
						
							//	var porcentajeAnho = (anho2.suma_programada_hoy*100)/anho2.suma_programada_anho;
								var porcentajeAnho = (anho2.suma_programada_anho*100)/anho2.linea_accion_meta;
								porcentajeAnho=parseFloat(porcentajeAnho).toFixed(2);
								var porcentajeAnhoEje = (anho2.cantidad_ejecutada_hoy*100)/anho2.suma_programada_anho;
								porcentajeAnhoEje=parseFloat(porcentajeAnhoEje).toFixed(2);
								var porcentajeHoyEje = (anho2.cantidad_ejecutada_hoy*100)/anho2.suma_programada_hoy;
								porcentajeHoyEje=parseFloat(porcentajeHoyEje).toFixed(2);
								/*if (porcentajeAnho<=70) sumporAClass = "text-danger";
								if (porcentajeAnho>70) sumporAClass = "text-warning";
								if (porcentajeAnho>90) sumporAClass = "text-success";
								
								if (porcentajeAnhoEje<=70) porAejeClass = "text-danger";
								if (porcentajeAnhoEje>70) porAejeClass = "text-warning";
								if (porcentajeAnhoEje>90) porAejeClass = "text-success";
								*/
								porHejeClassRow="";
								/*
								if (porcentajeHoyEje<=70){ porHejeClass = "text-danger";porHejeClassRow="danger";}
								if (porcentajeHoyEje>70){ porHejeClass = "text-warning";porHejeClassRow="warning";}
								if (porcentajeHoyEje>90){ porHejeClass = "text-success";porHejeClassRow="success";}
								
								if (porcentajeAnho<=70){ porHejeClassRow="danger";porHejeClass="";} */
								if (porcentajeAnho<90){ porHejeClassRow="danger";porHejeClass="";}
								if (porcentajeAnho>=90){ porHejeClassRow="success";
									if (porcentajeHoyEje<=70){ porHejeClass = "text-danger";}
									if (porcentajeHoyEje>70){ porHejeClass = "text-warning";}
									if (porcentajeHoyEje>90){ porHejeClass = "text-success";}
								}
								
								//<td>'+numeroConComa(anho1.cantidad_ejecutada_hoy)+'</td> despues de meta
								//$("#cuerpoTabla").append('<tr class="'+porHejeClassRow+'"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#myModal" class="registro" codigoRegistro='+j+'-'+lineaAccionDepartamento[j].institucion_id+'-'+lineaAccionDepartamento[j].linea_accion_id+'-'+lineaAccionDepartamento[j].accion_unidad_medida+'-'+lineaAccionDepartamento[j].accion_departamento_id+'> '+lineaAccionDepartamento[j].institucion+'- '+anho2.linea_accion+'</a></td></td><td>Gs.'+numeroConComa((anho2.costo_programado_anho/1000000).toFixed(0))+'</a></td><td>'+anho2.accion_unidad_medida+'</td><td class="cell-bordered2">'+numeroConComa(anho2.linea_accion_meta)+'</td><td></td><td >'+numeroConComa(anho2.suma_programada_anho)+'</td><td class="'+sumporAClass+'">'+porcentajeAnho+'</td><td class="cell-bordered2">'+numeroConComa(anho2.suma_programada_hoy)+'</td><td >'+numeroConComa(anho2.cantidad_ejecutada_hoy)+'</td><td class="text-center '+porHejeClass+'">'+porcentajeHoyEje+'</td></tr>');
								$("#cuerpoTabla").append('<tr class="'+porHejeClassRow+'"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#myModal" class="registro" codigoRegistro='+j+'-'+anho2.institucion_id+'-'+anho2.linea_accion_id+'-'+anho2.accion_unidad_medida_id+'-'+lineaAccionDepartamento[j].accion_departamento_id+'> '+anho2.institucion+'- '+anho2.linea_accion+'</a></td><td>'+anho2.accion_unidad_medida+'</td><td >'+numeroConComa(anho2.suma_programada_anho)+'</td><td  class="cell-bordered2">'+numeroConComa(anho2.suma_programada_hoy)+'</td><td>'+numeroConComa(anho2.cantidad_ejecutada_hoy)+'</td><td class="text-center">'+porcentajeHoyEje+'</td><td>'+numeroConComa((anho2.costo_ejecutado/1000000).toFixed(0))+'</td></tr>');
															
								
								
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
								if (anho1.institucion_id==lineaAccionDepartamento[k].institucion_id && anho1.linea_accion_id==lineaAccionDepartamento[k].linea_accion_id && lineaAccionDepartamento[k].date_part =="2014"){
									anho1=lineaAccionDepartamento[k];
								}
							}
							if (typeof anho1==="undefined") {var anho1= new Object(); anho1.cantidad_ejecutada_hoy="";};
							if (typeof anho2==="undefined") {var anho2= new Object(); anho2.cantidad_ejecutada_hoy="";anho2.suma_programada_anho="";anho2.suma_programada_hoy="";};
							if (anho2.suma_programada_anho>0){// tenia suma_programada_anho --------------------------------------------------
								
								
								//     anho2.linea_accion_meta = anho2.suma_programada_anho  * 100 / totalLineaPais[y].suma_programada_anho_pais
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
								/*if (porcentajeAnho<=70) sumporAClass = "text-danger";
								if (porcentajeAnho>70) sumporAClass = "text-warning";
								if (porcentajeAnho>90) sumporAClass = "text-success";
								
								if (porcentajeAnhoEje<=70) porAejeClass = "text-danger";
								if (porcentajeAnhoEje>70) porAejeClass = "text-warning";
								if (porcentajeAnhoEje>90) porAejeClass = "text-success";
								*/
								porHejeClassRow="";
								/*
								if (porcentajeHoyEje<=70){ porHejeClass = "text-danger";porHejeClassRow="danger";}
								if (porcentajeHoyEje>70){ porHejeClass = "text-warning";porHejeClassRow="warning";}
								if (porcentajeHoyEje>90){ porHejeClass = "text-success";porHejeClassRow="success";}

								if (porcentajeAnho<=70){ porHejeClassRow="danger";porHejeClass="";} */
								if (porcentajeAnho<90){ porHejeClassRow="danger";porHejeClass="";}
								if (porcentajeAnho>=90){ porHejeClassRow="success";
									if (porcentajeHoyEje<=70){ porHejeClass = "text-danger";}
									if (porcentajeHoyEje>70){ porHejeClass = "text-warning";}
									if (porcentajeHoyEje>90){ porHejeClass = "text-success";}
								}
								
								
								if (  porcentajeHoyEje ==="NaN"){ porcentajeHoyEje="";porHejeClassRow="";}
							}else{
								var porcentajeAnho = "";
								var porcentajeAnhoEje = "";
								var porcentajeHoyEje ="";
								porHejeClassRow="";
							}
							//<td>'+numeroConComa(anho1.cantidad_ejecutada_hoy)+'</td> despues de meta
							//$("#cuerpoTabla").append('<tr class="'+porHejeClassRow+'"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#myModal" class="registro" codigoRegistro='+j+'-'+lineaAccionDepartamento[j].institucion_id+'-'+lineaAccionDepartamento[j].linea_accion_id+'-'+lineaAccionDepartamento[j].accion_unidad_medida+'-'+lineaAccionDepartamento[j].accion_departamento_id+'> '+lineaAccionDepartamento[j].institucion+'- '+anho2.linea_accion+'</a></td><td>Gs.'+numeroConComa((anho2.costo_programado_anho/1000000).toFixed(0))+'</td><td>'+anho2.accion_unidad_medida+'</td><td class="cell-bordered2">'+numeroConComa(anho2.linea_accion_meta)+'</td><td></td><td >'+numeroConComa(anho2.suma_programada_anho)+'</td><td class="'+sumporAClass+'">'+porcentajeAnho+'</td><td class="cell-bordered2">'+numeroConComa(anho2.suma_programada_hoy)+'</td><td>'+numeroConComa(anho2.cantidad_ejecutada_hoy)+'</td><td class=" text-center '+porHejeClass+'">'+porcentajeHoyEje+'</td></tr>');
							$("#cuerpoTabla").append('<tr class="'+porHejeClassRow+'"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#myModal" class="registro" codigoRegistro='+j+'-'+anho2.institucion_id+'-'+anho2.linea_accion_id+'-'+anho2.accion_unidad_medida_id+'-'+anho2.accion_departamento_id+'> '+anho2.institucion+'- '+anho2.linea_accion+'</a></td><td>'+anho2.accion_unidad_medida+'</td><td >'+numeroConComa(anho2.suma_programada_anho)+'</td><td  class="cell-bordered2">'+numeroConComa(anho2.suma_programada_hoy)+'</td><td>'+numeroConComa(anho2.cantidad_ejecutada_hoy)+'</td><td class=" text-center">'+porcentajeHoyEje+'</td><td>'+numeroConComa((anho2.costo_ejecutado/1000000).toFixed(0))+'</td></tr>');
							
							
							//<td class="'+porAejeClass+'">'+porcentajeAnhoEje+'</td> penultima
							anho2="";
							anho1="";
						}
					}
				}
			}
		}		
		
	});
	
	//event.stopPropagation();
	
	     </script>
  <!-- piwik -->
  <script type="text/javascript">
 /* var _paq = _paq || [];
  _paq.push(["setDocumentTitle", document.domain + "/" + document.title]);
  _paq.push(["setCookieDomain", "*.spr.stp.gov.py"]);
  _paq.push(["setDomains", ["*.spr.stp.gov.py"]]);
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {
    var u="//infra.stp.gov.py/monitoreoweb/";
    _paq.push(['setTrackerUrl', u+'piwik.php']);
    _paq.push(['setSiteId', 4]);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
  })();
  <noscript><p><img src="//infra.stp.gov.py/monitoreoweb/piwik.php?idsite=4" style="border:0;" alt="" /></p></noscript>
  */
</script>

<!-- /piwik -->
		


<style>
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
	
	
	
    <div class="wrapper">

      <header class="main-header">
		  <%@ include file="/frames/mainheader.jsp" %>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
  			 <%@ include file="/frames/main-sidebar.jsp" %>
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
      
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            <small>
            <!--  Titulo, donde antes estaba dashboard -->
            </small>
          </h1>
         
        </section>

        <!-- Main content -->
        <section class="content" id="programacion">
	          <!-- Info row de buscador de productos -->
	          <div class="row">
	         <div class="col-md-12">
	          <div class="box" height="1000px">
	            <div class="box-header with-border" height="1000px">
	              <h2 class="box-title text-center" id="tituloTipoPrograma">
	                Tablero de Control Presidencial - STP 	
	              </h2>
	              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	              </div>
	            </div>
	            <div class="box-body table-responsive" style="scroll-x:hidden;scroll-y:auto;">
	            
	            
	              <table id="lineasPorEntidad" class="table table-striped ">
              <thead>
                <tr style="background-color: white;">
                  <th>

                  	Líneas de Acción por Departamento
                  </th>
                  
                  <th></th>
                  <th></th>
                  <th colspan="4" class="text-center cell-bordered2">A la fecha</th>
                 
                </tr>
                <tr style="background-color: white;">
                  
                  <th></th>
                  <th>Unidad de Medida</th>
                  <th >Planificación 2015</th>
                  <th class="cell-bordered2">Planificación</th>
                  <th >Ejecución</th>
                  <th>Desempeño (%)</th>
                  <th > Inversión Estimada (Millones de G.)</th>
                </tr>
              </thead>
              <tbody id="cuerpoTabla">
               
              </tbody>
            </table>

	            </div>
			   </div>
			</div>
          </div><!-- /.row -->


<script>
var $tabla=$("#lineasPorEntidad");
/* $tabla.floatThead({
	scrollContainer: function($tabla){
		return $tabla.closest('wrapper');
	}
})*/
</script>
          
          
               
          
    </section><!-- /.content -->
      </div><!-- /.content-wrapper -->

      <footer class="main-footer">
        <div class="pull-right hidden-xs">
          <b>Version</b> 2.0
        </div>
        <strong>Copyright &copy; 2015 <a href="http://www.stp.gov.py">STP</a>.</strong> All rights reserved.
      </footer>

      <!-- Control Sidebar -->
      <aside class="control-sidebar control-sidebar-light">
		<!-- include file="/frames/control-sidebar.jsp"  -->
      </aside><!-- /.control-sidebar -->
      <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
      <div class='control-sidebar-bg'></div>

    </div><!-- ./wrapper -->

    <!-- jQuery 2.1.3 
    <script src="plugins/jQuery/jQuery-2.1.3.min.js"></script> -->
    <!-- Bootstrap 3.3.2 JS -->
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- DATA TABES SCRIPT -->
    <script src="plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
    <script src="plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='plugins/fastclick/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="dist/js/app.min.js" type="text/javascript"></script>
    <!-- Sparkline -->
    <script src="plugins/sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
    <!-- jvectormap -->
    <script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
    <script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
    <!-- daterangepicker -->
    <script src="plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
    <!-- datepicker -->
    <script src="plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <!-- SlimScroll 1.3.0 -->
    <script src="plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- ChartJS 1.0.1 -->
    <script src="plugins/chartjs/Chart.min.js" type="text/javascript"></script>
     <!-- AdminLTE App -->
    <script src="dist/js/app.min.js" type="text/javascript"></script>   
    
    
    <!-- AdminLTE dashboard demo (This is only for demo purposes) 
    <script src="dist/js/pages/dashboard2.js" type="text/javascript"></script>-->

    <!-- Librerias para la rutina de cambio de contraseña -->
    <script src="dist/js/jquerymd5.js" type="text/javascript"></script>    	
    <%@ include file="/frames/pass.jsp" %>
  
    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js" type="text/javascript"></script>
        <%  } else { %>
				est<p>Favor Iniciar Sesion</p>
			<%  } %>

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
 
    
  </body>
</html>
