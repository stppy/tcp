<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        
	<!--<script src="frames/entidad.js" type="text/javascript"></script> -->
	<script type="text/javascript" src="dist/canvasjs/canvasjs.min.js" ></script>


<script>
var datosGeo=[];
</script>

	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrapslider.css" rel="stylesheet">
	
    
    
    
        <style>


.background {
    fill: #FFFFFF;
    fill-opacity: 0.01;
}

.component {
    fill: #e1e1e1;
}

.component .label {
    font-family: Myriad, "Helvetic Neue", Helvetica, Arial;
    text-anchor: middle;
    fill: #0000FF;
}

.arc {
    stroke-weight:0.1;
    fill: #4e8fff;
}


.arc2 {
    stroke-weight:0.1;
    fill: #3660b0;
}


.label {
    font-family:  Myriad, "Helvetic Neue", Helvetica, Arial;
    text-anchor: middle;
}

.radial-svg {
    display: block;
    margin: 0 auto;
    width:180;
    height:180;
}

        #test .arc2 {
            stroke-weight:0.1;
            fill: #3660b0;
        }

        #outer {
            background:#FFFFFF;
            border-radius: 5px;
            color: #000;
        }

        #div1, #div2, #div3, #div4 {
            width: 20%;
            height: 100px;
            box-sizing: border-box;
            float: left;
            text-align:center;
        }
         #div1 .arc {
            stroke-weight: 0.1;
            fill: #1d871b;
        }
         #div1 .arc2 {
            stroke-weight: 0.1;
            fill: #f0a417;
        }

        #div2 .arc {
            stroke-weight: 0.1;
            fill: #1d871b;
        }

        #div2 .arc2 {
            stroke-weight: 0.1;
            fill: #b00d08;
        }

        #div3 .arc {
            stroke-weight: 0.1;
            fill: #f0a417;
            
        }
        #div4 .arc {
            stroke-weight: 0.1;
            fill: #b00d08;
        }


        .selectedRadial {
            border-radius: 3px;
            background: #f4f4f4;
            color: #000;
            box-shadow: 0 1px 5px rgba(0,0,0,0.4);
            -moz-box-shadow: 0 1px 5px rgba(0,0,0,0.4);
            border: 1px solid rgba(200,200,200,0.85);
        }

        .radial {
            border-radius: 3px;
            background: #FFFFFF;
            color: #000;

        }
        
.bullet { font: 10px sans-serif; }
.bullet .marker { stroke: #000; stroke-width: 2px; }
.bullet .tick line { stroke: #666; stroke-width: .5px; }
.bullet .range.s0 { fill: #eee; }
.bullet .range.s1 { fill: #ddd; }
.bullet .range.s2 { fill: #ccc; }
.bullet .measure.s0 { fill: lightsteelblue; }
.bullet .measure.s1 { fill: steelblue; }
.bullet .title { font-size: 14px; font-weight: bold; width:20%; }
.bullet .subtitle { fill: #999; width:20%;}
.ellips { overflow:hidden; text-overflow-multiline:ellipsis; }

    </style>
    
    
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link rel="stylesheet" href="plugins/mapa/leaflet.css" />
<script src='dist/leaflet-image.js'></script>

<meta HTTP-EQUIV="X-UA-COMPATIBLE" CONTENT="IE=EmulateIE9" >
    <script type="text/javascript" src="scripts/d3.min.js"></script>
    <script type="text/javascript" src="scripts/radialProgress.js"></script>

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
                  <li class="active"><a href="#tab_1-1" data-toggle="tab"><i class="glyphicon glyphicon-list-alt"></i></a></li>
                  <!--<li><a href="#tab_2-2" data-toggle="tab"><i class="glyphicon glyphicon-map-marker"></i></a></li>-->
                  <li><a href="#tab_3-2" data-toggle="tab"><i class="glyphicon glyphicon-stats"></i></a></li>
                    
                </ul>
                <div class="tab-content">
                  <div class="tab-pane active" id="tab_1-1"></div><!-- /.tab-pane -->
                  <div class="tab-pane" id="tab_2-2">
               		<!--  <iframe width='100%' height='520' frameborder='0' src='http://geo.stp.gov.py/user/stp/viz/8f7c6480-2f1c-11e5-aaea-b6fa9714a3b6/embed_map' allowfullscreen webkitallowfullscreen mozallowfullscreen oallowfullscreen msallowfullscreen>
		     		</iframe>  -->
                  </div><!-- /.tab-pane -->
                  <div class="tab-pane" id="tab_3-2">
                  	
                  </div><!-- /.tab-pane -->
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
			var footerModal="<br><br><br>";
			
			var registros = $.ajax({
		    	url:'/tablero/ajaxSelects?action=getFactHitos2015&institucion_id='+institucion_id+'&linea_accion_id='+linea_accion_id+'&departamento='+idDepartamento,
		      	type:'get',
		      	dataType:'json',
		      	crossDomain:true,
		      	async:false       
		    }).responseText;
			var elRegistro=JSON.parse(registros);
			
			

			cuerpoModal='<div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">'+
						'<div class="row">'+
							'<div class="row">'+
								'<div class="col-sm-12">'+
									'<div class="table-responsive">'+
										'<table id="example1" class="table table-hover" >'+
										    '<thead>'+
											'<tr class="active"><th>Acción</th><th>Departamento</th><th>Distrito</th><th>U. Medida</th><th>Cantidad. Programado</th><th>Inversión Estimada (Millones de G.)</th><th>Fecha Terminación</th><th>% Programado</th><th>% Ejecutado</th></tr>'+
											'</thead><tbody>';
						var totalCantidadProgramada=0;
						tituloModal='<h3><center>'+elRegistro[0].institucion+'&nbsp;&nbsp;-&nbsp;&nbsp;'+elRegistro[0].linea_accion+'</center></h3>';
						for(var m=0; m<elRegistro.length;m++)
						{
								var registroFecha= elRegistro[m].hito_fecha_entrega.split(" ");
								if (registroFecha[0]=="Jan" || registroFecha[0]=="ene") registroFecha[0]=1;
								if (registroFecha[0]=="Feb" || registroFecha[0]=="feb") registroFecha[0]=2;
								if (registroFecha[0]=="Mar" || registroFecha[0]=="mar") registroFecha[0]=3;
								if (registroFecha[0]=="Apr" || registroFecha[0]=="abr") registroFecha[0]=4;
								if (registroFecha[0]=="May" || registroFecha[0]=="may") registroFecha[0]=5;
								if (registroFecha[0]=="Jun" || registroFecha[0]=="jun") registroFecha[0]=6;
								if (registroFecha[0]=="Jul" || registroFecha[0]=="jul") registroFecha[0]=7;
								if (registroFecha[0]=="Aug" || registroFecha[0]=="ago") registroFecha[0]=8;
								if (registroFecha[0]=="Sep" || registroFecha[0]=="sep") registroFecha[0]=9;
								if (registroFecha[0]=="Oct" || registroFecha[0]=="oct") registroFecha[0]=10;
								if (registroFecha[0]=="Nov" || registroFecha[0]=="nov") registroFecha[0]=11;
								if (registroFecha[0]=="Dec" || registroFecha[0]=="dic") registroFecha[0]=12;
								registroFecha[1].split(",");
								
								cuerpoModal+='<tr><td>'+elRegistro[m].accion+'</td><td>'+elRegistro[m].accion_departamento+'</td><td>'+elRegistro[m].accion_distrito+'</td><td>'+elRegistro[m].accion_unidad_edida+'</td><td>'+elRegistro[m].hito_cantidad_programado+'</td><td>'+numeroConComa((elRegistro[m].accion_costo*elRegistro[m].hito_porcentaje_ejecutado/100000000).toFixed(0))+'</td><td>'+registroFecha[2]+'-'+registroFecha[0]+'-'+registroFecha[1][0]+'</td><td>'+elRegistro[m].hito_porcentaje_programado+'</td><td>'+elRegistro[m].hito_porcentaje_ejecutado+'</td></tr>';
								totalCantidadProgramada+=elRegistro[m].hito_cantidad_programado;
						}
						totalCantidadProgramada=parseFloat(totalCantidadProgramada).toFixed(2);

						cuerpoModal+='</tbody><tfoot><tr class="active"><td colspan="2">Total Cantidad Programada: </td><td colspan="8">'+totalCantidadProgramada+'</td></tr></tfoot>'+
									 '</table>'+
									 '</div></div></div></div></div>';
			
			$('#myModal').find(".modal-title").html(tituloModal);
			$('#myModal').find("#tab_1-1").html("");
			$('#myModal').find("#tab_2-2").html("");
			$('#myModal').find("#tab_3-2").html("");

			$("#tab_3-2").append('Programación: <label id="fechaInicio"></label><input id="rango-fecha" type="text" class="span2" value="" data-slider-min="10" data-slider-max="1000" data-slider-step="1" data-slider-value="[250,450]"/><label id="fechaFin"></label>');
			$("#tab_3-2").append('<br><br>Ejecución: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label id="fechaInicioEjecucion"></label><input id="rango-fecha-ejecucion" type="text" class="span2" value="" data-slider-min="10" data-slider-max="1000" data-slider-step="1" data-slider-value="[250,450]"/><label id="fechaFinEjecucion"></label>');

			$('#myModal').find("#tab_1-1").html(cuerpoModal);
			//$('#myModal').find(".modal-footer").html(footerModal);
			
			lineaAccionAcumuladoMesDepto = $.ajax({
		    	url:'/tablero/ajaxSelects?action=getLineaAccionAcumuladoMesDepto&institucion_id='+institucion_id+'&linea_accion_id='+linea_accion_id+'&departamento='+idDepartamento,
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
			
			 $(function () {
			       
			        $('#example1').dataTable({
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
		
		
		
		
		
		renderEntidades();

	
	});
	

	
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
      <aside class="main-sidebar" style="width:60px">
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
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-green"><i class="fa fa-dashboard"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">Desempeño General</span>
                  <small>Ejecución/Programación</small>
                  <span class="info-box-number">90<small>%</small></span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-yellow"><i class="fa fa-cogs"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">Planificado</span>
                  <small>Programación/Meta</small>
                  <span class="info-box-number">79%</span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->

            <!-- fix for small devices only -->
            <div class="clearfix visible-sm-block"></div>

            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-red"><i class="fa fa-map-marker"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">Evidencias<br></span>
                  <small>en acciones</small>
                  <span class="info-box-number">0%</span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-red"><i class="fa fa-users"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">Beneficiarios</span>
                  <small>en acciones</small>
                  <span class="info-box-number">0%</span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->
          </div>
	          
	          
		   <div class="row">
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="box box-default">
                <div class="box-header with-border">
                   <h3 class="box-title" id="tabla-derecho">Asistencia Tecnica Agropecuaria</h3>
                </div><!-- /.box-header -->
                <div class="box-body no-padding">
	                <!--  <iframe frameborder='0' id="frontimg" src="d3.html" width="200" height="200" border="0" scrolling="no" allowTransparency="true"></iframe>-->
	                <div id='outer' style="width: 90%; height:100%; margin: 3% 0 3% 0;">
	    				<div id="main" style="width:90%; height:100%; margin:  0px 30% 0px 30% ">
	    					<div id="div1"></div>
   						</div>
					</div>
    	  		</div>
			 </div>
		  </div>
      
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="box box-default">
                <div class="box-header with-border">
                  <h3 class="box-title" id="tabla-derecho">Cadenas de Valor-Sector Privado</h3>
                </div><!-- /.box-header -->
                <div class="box-body no-padding">
	                <!--  <iframe frameborder='0' id="frontimg" src="d3.html" width="200" height="200" border="0" scrolling="no" allowTransparency="true"></iframe>-->
	                <div id='outer' style="width: 90%; height:100%; margin: 3% 0 3% 0;">
	    				<div id="main" style="width:90%; height:100%; margin:  0px 30% 0px 30% ">
	    					<div id="div2"></div>
   						</div>
					</div>
    	  		</div>
			 </div>
		  </div>
        
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="box box-default">
                <div class="box-header with-border">
                  <h3 class="box-title" id="tabla-derecho">Inversión en insumos y tecnología</h3>
                </div><!-- /.box-header -->
                <div class="box-body no-padding">
	                <!--  <iframe frameborder='0' id="frontimg" src="d3.html" width="200" height="200" border="0" scrolling="no" allowTransparency="true"></iframe>-->
	                <div id='outer' style="width: 90%; height:100%; margin: 3% 0 3% 0;">
	    				<div id="main" style="width:90%; height:100%; margin:  0px 30% 0px 30% ">
	    					<div id="div3"></div>
   						</div>
					</div>
    	  		</div>
			 </div>
		  </div>
        
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="box box-default">
                <div class="box-header with-border">
                   <h3 class="box-title" id="tabla-derecho">Mejoramiento de Suelo</h3>
                </div><!-- /.box-header -->
                <div class="box-body no-padding">
	                <!--  <iframe frameborder='0' id="frontimg" src="d3.html" width="200" height="200" border="0" scrolling="no" allowTransparency="true"></iframe>-->
	                <div id='outer' style="width: 90%; height:100%; margin: 3% 0 3% 0;">
	    				<div id="main" style="width:90%; height:100%; margin:  0px 30% 0px 30% ">
	    					<div id="div4"></div>
   						</div>
					</div>
    	  		</div>
			 </div>
		  </div>
        </div>

        
        
	          <div class="row">
            <div class="col-md-6">
              <div class="box box-default">
                <div class="box-header with-border">
                  <i class="fa fa-map-marker"></i>
                  <h3 class="box-title">Desempeño Geográfico</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  	<div id="map" style="width: 800x; height: 600px"></div>

					<script src="plugins/mapa/deptos2012.geojson" type="text/javascript"></script>
					<script src="plugins/mapa/leaflet.js"></script>
					
					<script>
					var entidadCas = "";
					entidadCas ="<%=attributes.get("entidad") %>";
					var usuarios = $.ajax({
						url:'/tablero/ajaxSelects?action=getUsuarios&usuario=<%=user.getName()%>',
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
						return x.toString().replace(".", ",").replace(/\B(?=(\d{3})+(?!\d))/g, ".");
					}
					
					var entidades = $.ajax({
				    	url:'/tablero/ajaxSelects?action=getEntidades',
				      	type:'get',
				      	dataType:'json',
				      	crossDomain:true,
				      	async:false       
				    }).responseText;
					entidades=JSON.parse(entidades);
					
					
					var lineaAccionDepartamento = $.ajax({
				    	url:'/tablero/ajaxSelects?action=getLineasAccionDepartamento',
				      	type:'get',
				      	dataType:'json',
				      	crossDomain:true,
				      	async:false       
				    }).responseText;
					lineaAccionDepartamento=JSON.parse(lineaAccionDepartamento);
					
					var departamento = $.ajax({
				    	url:'/tablero/ajaxSelects?action=getDepartamento',
				      	type:'get',
				      	dataType:'json',
				      	crossDomain:true,
				      	async:false       
				    }).responseText;
					departamento=JSON.parse(departamento);
					
					var elPaisjson = $.ajax({
				    	url:'/tablero/ajaxSelects?action=getLineasAccion',
				      	type:'get',
				      	dataType:'json',
				      	crossDomain:true,
				      	async:false       
				    }).responseText;
					var elPais=JSON.parse(elPaisjson);
					
					var desPaisDeptojson = $.ajax({
				    	url:'/tablero/ajaxSelects?action=getDesempPaisPorDepto',
				      	type:'get',
				      	dataType:'json',
				      	crossDomain:true,
				      	async:false       
				    }).responseText;
					var desPaisDepto=JSON.parse(desPaisDeptojson);
				

					
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
					
					function renderEntidades(e){
						var array=[];
						$("#tablaInstituciones").html("");
						if (typeof e != 'undefined'){
							array=lineaAccionDepartamento;
							$("#tabla-derecho").html("");
							$("#tabla-derecho").append('Instituciones en '+e.target.feature.properties.dpto_desc);
						}else{
							array=elPais;
							
						}
						
						//entidades=new array();
						//entidades[0].institucion_id=parseInt("1359");
						//for (var i = 0; i< entidades.length;i++){
							var institucionSeleccionada=1359;
							var iteracion=0;
							var porcentajeAnhoAcumulado=0;
							var porcentajeHoyEjeAcumulado=0;
							var lineasDeAccion= [];
							var iteracionDepto=0;
							var porcentajeAnhoAcumuladoDepto=0;
							var porcentajeHoyEjeAcumuladoDepto=0;
							var porcentajeAnhoAcumuladoDeptoTotal=0;
							var porcentajeHoyEjeAcumuladoDeptoTotal=0;

							
							for(var j=0;j<array.length;j++){
								//if (array[j].institucion_id==entidades[i].institucion_id){
								if (array[j].institucion_id==institucionSeleccionada){
								
									if (lineasDeAccion.indexOf(array[j].linea_accion_id)<0){
										if (typeof e != 'undefined'){
											if (array[j].accion_departamento_id==e.target.feature.properties.dpto && array[j].anho=="2015"){

												lineasDeAccion.push(array[j].linea_accion_id);
											}
										}else{
											lineasDeAccion.push(array[j].linea_accion_id);
										}
										if(array[j].anho<="2014"){
											var anho1=array[j];
											var anho2;
											for(var k=0;k<array.length;k++){
												if (anho1.institucion_id==array[k].institucion_id && anho1.linea_accion_id==array[k].linea_accion_id && array[k].anho =="2015"){
													anho2=array[k];
												}
											}
											if (typeof anho1h==="undefined") {var anho1= new Object(); anho1.hito_cantidad_ejecutado_hoy="";};
											if (typeof anho2==="undefined") {var anho2= new Object(); anho2.hito_cantidad_ejecutado_hoy="";anho2.suma_programada_anho="";anho2.suma_programada_hoy="";};
											if (anho2.suma_programada_anho>0 ){
													iteracion++;
													var porcentajeAnho = (anho2.suma_programada_anho*100)/anho2.linea_accion_meta;
													porcentajeAnho=parseFloat(porcentajeAnho).toFixed(2);

													var porcentajeHoyEje = (anho2.hito_cantidad_ejecutado_hoy*100)/anho2.suma_programada_hoy;
													porcentajeHoyEje=parseFloat(porcentajeHoyEje).toFixed(2);
													porcentajeHoyEjeAcumulado += parseFloat(porcentajeHoyEje);
													porcentajeAnhoAcumulado+=parseFloat(porcentajeAnho);
											}else{
												var porcentajeAnho = 0;
												var porcentajeAnhoEje = 0;
												var porcentajeHoyEje =0;
												porHejeClassRow="";
											}
											
											anho2="";
											anho1="";
										}
										if(array[j].anho>="2015"){
											var anho2=array[j];
											var anho1;
											for(var k=0;k<array.length;k++){
												if (anho2.institucion_id==array[k].institucion_id && anho2.linea_accion_id==array[k].linea_accion_id && array[k].anho =="2014"){
													anho1=array[k];
												}
											}
											if (typeof anho1==="undefined") {var anho1= new Object(); anho1.hito_cantidad_ejecutado_hoy="";};
											if (typeof anho2==="undefined") {var anho2= new Object(); anho2.hito_cantidad_ejecutado_hoy="";anho2.suma_programada_anho="";anho2.suma_programada_hoy="";};

											if (anho2.suma_programada_anho>0)
											{
													iteracion++;
													var porcentajeAnho = (anho2.suma_programada_anho*100)/anho2.linea_accion_meta;
													porcentajeAnho=parseFloat(porcentajeAnho).toFixed(2);

													var porcentajeHoyEje = (anho2.hito_cantidad_ejecutado_hoy*100)/anho2.suma_programada_hoy;
													porcentajeHoyEje=parseFloat(porcentajeHoyEje).toFixed(2);
													porcentajeHoyEjeAcumulado += parseFloat(porcentajeHoyEje);
													porcentajeAnhoAcumulado+=parseFloat(porcentajeAnho);
											}
										}
										
										if (typeof e != 'undefined')
										{
											if(array[j].anho>="2015"){
												var anho2=array[j];
												var anho3;
												
												for(var k=0;k<array.length;k++)
												{
													if (anho2.institucion_id==array[k].institucion_id && anho2.linea_accion_id==array[k].linea_accion_id && array[k].anho =="2015" && anho2.accion_departamento_id==array[k].accion_departamento_id)
													{
														anho3=array[k];
													}
												}
												
												if (array[j].accion_departamento_id==e.target.feature.properties.dpto && anho3.suma_programada_anho>0)
												{
													iteracionDepto++;
													var porcentajeAnho = parseFloat((anho3.suma_programada_anho*100)/anho3.linea_accion_meta);
													porcentajeAnho=parseFloat(porcentajeAnho).toFixed(2);
													porcentajeAnhoAcumuladoDepto+=parseFloat(porcentajeAnho);
													
			
													var porcentajeHoyEje = parseFloat((anho3.cantidad_ejecutada_hoy*100)/anho3.suma_programada_hoy);
													porcentajeHoyEje=parseFloat(porcentajeHoyEje).toFixed(2);
													porcentajeHoyEjeAcumuladoDepto+=parseFloat(porcentajeHoyEje);
												}
											}
										}
										
											anho2="";
											anho1="";
											anho3="";
										}
									}
								}
							
							var porcentajeAnhoAcumuladoTotal = porcentajeAnhoAcumulado / iteracion;
							var porcentajeHoyEjeAcumuladoTotal = porcentajeHoyEjeAcumulado / iteracion;
							porcentajeAnhoAcumuladoDeptoTotal = porcentajeAnhoAcumuladoDepto / iteracionDepto;
							porcentajeHoyEjeAcumuladoDeptoTotal = porcentajeHoyEjeAcumuladoDepto / iteracionDepto;
							
							var color="";
							if (!isNaN(porcentajeAnhoAcumuladoDeptoTotal) && !isNaN(porcentajeHoyEjeAcumuladoDeptoTotal)){
								porcentajeAnhoAcumuladoTotal=porcentajeAnhoAcumuladoDeptoTotal;
								porcentajeHoyEjeAcumuladoTotal=porcentajeHoyEjeAcumuladoDeptoTotal;
							}
							if (!isNaN(porcentajeAnhoAcumuladoTotal) && !isNaN(porcentajeHoyEjeAcumuladoTotal)){
								if (porcentajeAnhoAcumuladoTotal >= 100) { porcentajeAnhoAcumuladoTotal = 100; }
								if (porcentajeHoyEjeAcumuladoTotal>=100) { porcentajeHoyEjeAcumuladoTotal = 100; }
							
								//if (porcentajeAnhoAcumuladoTotal >= 90){
									if (porcentajeHoyEjeAcumuladoTotal>=90){
										color="green";
									}else{
										if (porcentajeHoyEjeAcumuladoTotal>=70){
											color="yellow";
										}else{
											color="red";
										}
									}
								//}else {
								//	color="red";
								//}
								var idDepartamentoLink="";
								if (typeof e != 'undefined'){idDepartamentoLink=e.target.feature.properties.dpto;}
								
								$("#tablaInstituciones").append('<tr><td class="col-md-3"><a tipo="filtroPorEntidad" institucion_id='+entidades[i].institucion_id+' depto_id='+idDepartamentoLink+' >'+entidades[i].institucion+'</a></td><td class="col-md-9"><div class="progress progress-xs"> <div class="progress-bar bg-'+color+'-active color-palette" style="width: '+porcentajeHoyEjeAcumuladoTotal.toFixed(0)+'%"><p class="text-left">'+porcentajeHoyEjeAcumuladoTotal.toFixed(2)+'%</p></div></div></td></tr>');
								porcentajeAnhoAcumuladoTotal=0;
								porcentajeAnhoAcumuladoDeptoTotal=0;
								
								porcentajeHoyEjeAcumuladoTotal=0;
								porcentajeHoyEjeAcumuladoDeptoTotal=0;							

								color="";
							}
							
						//}
					}
					
					function renderLineaAccion(depto_id, institucion_id)
					{
						var iteracionDepto=0;
						var porcentajeAnhoAcumuladoDepto=0;
						var porcentajeHoyEjeAcumuladoDepto=0;
						datosGeo=[];
						var porcentajeAnhoAcumuladoDeptoTotal=0;
						var porcentajeHoyEjeAcumuladoDeptoTotal=0;

						$("#cuerpoTabla").html("");
						var lineasDeAccion= [];
						for (var i = 0; i< 18;i++){
						  if(departamento[i].idDepartamento==depto_id){
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
												if (anho1.institucion_id==lineaAccionDepartamento[k].institucion_id && institucion_id== anho1.institucion_id && anho1.linea_accion_id==lineaAccionDepartamento[k].linea_accion_id && lineaAccionDepartamento[k].anho =="2015" && lineaAccionDepartamento[k].accion_departamento_id ==anho1.accion_departamento_id){
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
														if(totalLineaPais[l].institucion_id == anho2.institucion_id && institucion_id== anho2.institucion_id && totalLineaPais[l].linea_accion_id == anho2.linea_accion_id && totalLineaPais[l].anho == anho2.anho)
														{
															anho2.linea_accion_meta = parseFloat((anho2.suma_programada_anho / totalLineaPais[l].suma_programada_anho_pais)*anho2.linea_accion_meta).toFixed(2);
														}
												}
												iteracionDepto++;
											//	var porcentajeAnho = (anho2.suma_programada_hoy*100)/anho2.suma_programada_anho;
												var porcentajeAnho = parseFloat((anho2.suma_programada_anho*100)/anho2.linea_accion_meta).toFixed(2);
												porcentajeAnho=parseFloat(porcentajeAnho).toFixed(2);
												porcentajeAnhoAcumuladoDepto+=parseFloat(porcentajeAnho);
												var porcentajeAnhoEje = parseFloat((anho2.cantidad_ejecutada_hoy*100)/anho2.suma_programada_anho).toFixed(2);
												porcentajeAnhoEje=parseFloat(porcentajeAnhoEje).toFixed(2);
												var porcentajeHoyEje = parseFloat((anho2.cantidad_ejecutada_hoy*100)/anho2.suma_programada_hoy).toFixed(2);
												porcentajeHoyEje=parseFloat(porcentajeHoyEje).toFixed(2);
												porcentajeHoyEjeAcumuladoDepto+=parseFloat(porcentajeHoyEje);
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

												//if (porcentajeAnho<90){ porHejeClassRow="danger";porHejeClass="";}
												/*if (porcentajeAnho>=90){ porHejeClassRow="success";
													if (porcentajeHoyEje<=70){ porHejeClass = "text-danger";}
													if (porcentajeHoyEje>70){ porHejeClass = "text-warning";}
													if (porcentajeHoyEje>90){ porHejeClass = "text-success";}
												}*/
												
												//<td>'+numeroConComa(anho1.cantidad_ejecutada_hoy)+'</td> despues de meta
											 if(lineaAccionDepartamento[j].institucion_id==institucion_id && porcentajeHoyEje>0 ) $("#cuerpoTabla").append('<tr class="'+porHejeClassRow+'"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#myModal" class="registro" codigoRegistro='+j+'-'+lineaAccionDepartamento[j].institucion_id+'-'+lineaAccionDepartamento[j].linea_accion_id+'-'+lineaAccionDepartamento[j].accion_unidad_medida+'-'+lineaAccionDepartamento[j].accion_departamento_id+'> '+lineaAccionDepartamento[j].institucion+'- '+anho2.linea_accion+'</a></td><td>'+anho2.accion_unidad_medida+'</td><td >'+numeroConComa(anho2.suma_programada_anho)+'</td><td class="cell-bordered2">'+numeroConComa(anho2.suma_programada_hoy)+'</td><td >'+numeroConComa(anho2.cantidad_ejecutada_hoy)+'</td><td >'+porcentajeHoyEje+'</td><td>'+numeroConComa((anho2.costo_ejecutado/1000000).toFixed(0))+'</td></tr>');

																			
												
												
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
												if (anho2.institucion_id==lineaAccionDepartamento[k].institucion_id && institucion_id== anho2.institucion_id && anho2.linea_accion_id==lineaAccionDepartamento[k].linea_accion_id && lineaAccionDepartamento[k].date_part =="2014"){
													anho1=lineaAccionDepartamento[k];
												}
											}
											if (typeof anho1==="undefined") {var anho1= new Object(); anho1.cantidad_ejecutada_hoy="";};
											if (typeof anho2==="undefined") {var anho2= new Object(); anho2.cantidad_ejecutada_hoy="";anho2.suma_programada_anho="";anho2.suma_programada_hoy="";};
											if (anho2.suma_programada_anho>0){// tenia suma_programada_anho --------------------------------------------------
												
												
												//     anho2.linea_accion_meta = anho2.suma_programada_anho  * 100 / totalLineaPais[y].suma_programada_anho_pais
												for(var l=0; l<totalLineaPais.length;l++)
												{
														if(totalLineaPais[l].institucion_id == anho2.institucion_id && institucion_id== anho2.institucion_id && totalLineaPais[l].linea_accion_id == anho2.linea_accion_id && totalLineaPais[l].anho == anho2.anho)
														{
															anho2.linea_accion_meta = parseFloat((anho2.suma_programada_anho / totalLineaPais[l].suma_programada_anho_pais)*anho2.linea_accion_meta).toFixed(2);
														}
												}
												
												iteracionDepto++;
												//var porcentajeAnho = (anho2.suma_programada_hoy*100)/anho2.suma_programada_anho;
												var porcentajeAnho = parseFloat((anho2.suma_programada_anho*100)/anho2.linea_accion_meta).toFixed(2);
												porcentajeAnho=parseFloat(porcentajeAnho).toFixed(2);
												porcentajeAnhoAcumuladoDepto+=parseFloat(porcentajeAnho);
												var porcentajeAnhoEje = parseFloat((anho2.cantidad_ejecutada_hoy*100)/anho2.suma_programada_anho).toFixed(2);
												porcentajeAnhoEje=parseFloat(porcentajeAnhoEje).toFixed(2);
												var porcentajeHoyEje = parseFloat((anho2.cantidad_ejecutada_hoy*100)/anho2.suma_programada_hoy).toFixed(2);
												porcentajeHoyEje=parseFloat(porcentajeHoyEje).toFixed(2);
												porcentajeHoyEjeAcumuladoDepto+=parseFloat(porcentajeHoyEje);
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

												
												/* if (porcentajeAnho<90){ porHejeClassRow="danger";porHejeClass="";}

												if (porcentajeAnho>=90){ porHejeClassRow="success";
													if (porcentajeHoyEje<=70){ porHejeClass = "text-danger";}
													if (porcentajeHoyEje>70){ porHejeClass = "text-warning";}
													if (porcentajeHoyEje>90){ porHejeClass = "text-success";}
												}

												*/

												
												
												if (  porcentajeHoyEje ==="NaN"){ porcentajeHoyEje="";porHejeClassRow="";}
											}else{
												var porcentajeAnho = "";
												var porcentajeAnhoEje = "";
												var porcentajeHoyEje ="";
												porHejeClassRow="";
											}
											//<td>'+numeroConComa(anho1.cantidad_ejecutada_hoy)+'</td> despues de meta

											if(lineaAccionDepartamento[j].institucion_id==institucion_id && porcentajeHoyEje>0  )  $("#cuerpoTabla").append('<tr class="'+porHejeClassRow+'"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#myModal" class="registro" codigoRegistro='+j+'-'+lineaAccionDepartamento[j].institucion_id+'-'+lineaAccionDepartamento[j].linea_accion_id+'-'+lineaAccionDepartamento[j].accion_unidad_medida+'-'+lineaAccionDepartamento[j].accion_departamento_id+'> '+lineaAccionDepartamento[j].institucion+'- '+anho2.linea_accion+'</a></td><td>'+anho2.accion_unidad_medida+'</td><td >'+numeroConComa(anho2.suma_programada_anho)+'</td><td class="cell-bordered2">'+numeroConComa(anho2.suma_programada_hoy)+'</td><td>'+numeroConComa(anho2.cantidad_ejecutada_hoy)+'</td><td >'+porcentajeHoyEje+'</td><td>'+numeroConComa((anho2.costo_ejecutado/1000000).toFixed(0))+'</td></tr>');
											
											//<td class="'+porAejeClass+'">'+porcentajeAnhoEje+'</td> penultima
											anho2="";
											anho1="";
										}
									}
								}
								
							}
							porcentajeAnhoAcumuladoDeptoTotal = porcentajeAnhoAcumuladoDepto / iteracionDepto;
							porcentajeHoyEjeAcumuladoDeptoTotal = porcentajeHoyEjeAcumuladoDepto / iteracionDepto;
							

									datosGeo[departamento[i].idDepartamento]=new Object();
									datosGeo[departamento[i].idDepartamento].program= porcentajeAnhoAcumuladoDeptoTotal;
									datosGeo[departamento[i].idDepartamento].desemp = porcentajeHoyEjeAcumuladoDeptoTotal;

				      }		
					 }
					}
				
					
					// borradoJsDeGeo2
					
					
					
						function getColor(d) {
						    return d >= 90  ? '#008d4c' :
						           d >= 70  ? '#db8b0b' :
						                      '#d33724';
						}
						
						function compareGenerico(a,b) {             
							  if (a.clave < b.clave)
							    return -1;
							  if (a.clave > b.clave)
							    return 1;
							  return 0;
							}
						
						desPaisDepto=desPaisDepto.sort(compareGenerico);
						// fillColor: getColor(), feature.properties.dpto
						function style(feature) {
							return {
								 fillColor: getColor(parseFloat(desPaisDepto[parseInt(feature.properties.dpto)].valor).toFixed(0)),
						        weight: 2,
						        opacity: 0.6,
						        color: 'white',
						        dashArray: '3',
						        fillOpacity: 0.6
						    };						    
						}
						
						function highlightFeature(e) {
						    var layer = e.target;

						    layer.setStyle({
						        weight: 5,
						        fillOpacity: 0.7
						    });

						    if (!L.Browser.ie && !L.Browser.opera) {
						        layer.bringToFront();
						    }
						}

						
						var map = L.map('map').setView([-24.5, -57], 6);
						var depto = new L.geoJson(deptoGeojson,{style:style,onEachFeature: onEachFeature});
						depto.addTo(map);

						function renderEntidad(e){
							depto.eachLayer(function(l){depto.resetStyle(l);});
							highlightFeature(e);
							renderEntidades(e);
							map.fitBounds(e.target.getBounds());
							
						}
						function onEachFeature(feature, layer) {
						layer.on({
								click: renderEntidad
							});
						}					
	
						//var depto = new L.geoJson(depto,{style:miestilo})
						
	
					
					$("body").on("click", "#tablaInstituciones",function(event){
						
						
						var institucion_id=event.target.attributes.institucion_id.value;
						var depto_id=event.target.attributes.depto_id.value;
						if (depto_id==""){
							alert("Favor seleccionar previamente Departamento en el mapa");
							event.stopPropagation();
						}
						renderLineaAccion(depto_id, institucion_id);
						event.stopPropagation();
						
						
					});
						
						
						$("document").ready(function(){
							
							
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
														$("#cuerpoTabla").append('<tr class="'+porHejeClassRow+'"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#myModal" class="registro" codigoRegistro='+j+'-'+lineaAccionDepartamento[j].institucion_id+'-'+lineaAccionDepartamento[j].linea_accion_id+'-'+lineaAccionDepartamento[j].accion_unidad_medida+'-'+lineaAccionDepartamento[j].accion_departamento_id+'> '+lineaAccionDepartamento[j].institucion+'- '+anho2.linea_accion+'</a></td></td><td>Gs.'+numeroConComa((anho2.costo_programado_anho/1000000).toFixed(0))+'</a></td><td>'+anho2.accion_unidad_medida+'</td><td class="cell-bordered2">'+numeroConComa(anho2.linea_accion_meta)+'</td><td></td><td >'+numeroConComa(anho2.suma_programada_anho)+'</td><td class="'+sumporAClass+'">'+porcentajeAnho+'</td><td class="cell-bordered2">'+numeroConComa(anho2.suma_programada_hoy)+'</td><td >'+numeroConComa(anho2.cantidad_ejecutada_hoy)+'</td><td class="text-center '+porHejeClass+'">'+porcentajeHoyEje+'</td></tr>');
																					
														
														
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
													$("#cuerpoTabla").append('<tr class="'+porHejeClassRow+'"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#myModal" class="registro" codigoRegistro='+j+'-'+lineaAccionDepartamento[j].institucion_id+'-'+lineaAccionDepartamento[j].linea_accion_id+'-'+lineaAccionDepartamento[j].accion_unidad_medida+'-'+lineaAccionDepartamento[j].accion_departamento_id+'> '+lineaAccionDepartamento[j].institucion+'- '+anho2.linea_accion+'</a></td><td>Gs.'+numeroConComa((anho2.costo_programado_anho/1000000).toFixed(0))+'</td><td>'+anho2.accion_unidad_medida+'</td><td class="cell-bordered2">'+numeroConComa(anho2.linea_accion_meta)+'</td><td></td><td >'+numeroConComa(anho2.suma_programada_anho)+'</td><td class="'+sumporAClass+'">'+porcentajeAnho+'</td><td class="cell-bordered2">'+numeroConComa(anho2.suma_programada_hoy)+'</td><td>'+numeroConComa(anho2.cantidad_ejecutada_hoy)+'</td><td class=" text-center '+porHejeClass+'">'+porcentajeHoyEje+'</td></tr>');
													
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
							
						});
							</script>	

                  
                  
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->

            <div class="col-md-6">
              <div class="box box-default">
                <div class="box-header with-border">
                  <i class="fa  fa-money"></i>
                  <h3 class="box-title">Ejecución Presupuestaria</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                <bulletChartInstitucion><bulletChartInstitucion/>
                <script src="scripts/bullets.js"></script>
<script>

var margin = {top: 5, right: 40, bottom: 20, left: 250},
    width = 100 - margin.left - margin.right,
    height = 50 - margin.top - margin.bottom;
    



var chart = d3.bullet();

d3.json("/tablero/ajaxSelects?action=getLineasAccion&institucion_id=1359", function(error, data) {
  if (error) throw error;

  var svg = d3.select("bulletChartInstitucion").selectAll("svg")
      .data(data)
    .enter().append("svg")
      .attr("class", "bullet")
      .attr("width", "100%")
      .attr("height", height + margin.top + margin.bottom)
    .append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")")
      .call(chart);

  var title = svg.append("g")
      .style("text-anchor", "end")
      .attr("transform", "translate(-6," + height / 2 + ")");

  title.append("text")
      .attr("class", "title ellips")
      .text(function(d) { 
    	  if (d.linea_accion.length>36){
    		  return d.linea_accion.substr(0,35)+"...";  
    	  }else{return d.linea_accion;}
    	   
    	  });
      

  title.append("text")
      .attr("class", "subtitle ellips")
      .attr("dy", "1em")
      .text(function(d) { 
    	  if (d.accion_unidad_medida.length>36){
    		  return d.accion_unidad_medida.substr(0,35)+"...";  
    	  }else{return d.accion_unidad_medida;}
    	   
    	  });

 
});


</script>
                
                 </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
		  </div> <!-- /.row -->
	          
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

                  	Líneas de Acción por Institución
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
                  <th> Inversión Estimada (Millones de G.)</th>
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

    <!-- jQuery 2.1.3 -->
    <script src="plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
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
<!-- End Piwik Code 

<script type="text/javascript" src="bootstrap/js/jquery.min.js"></script>--> 
<script type="text/javascript" src="bootstrap/js/bootstrap-slider.js"></script>
<script language="JavaScript">


    var div1=d3.select(document.getElementById('div1'));
    var div2=d3.select(document.getElementById('div2'));
    var div3=d3.select(document.getElementById('div3'));
    var div4=d3.select(document.getElementById('div4'));


    start();

   

    function onClick3() {
        deselect();
        div1.attr("class","selectedRadial");
        div2.attr("class","selectedRadial");
        div3.attr("class","selectedRadial");
        div4.attr("class","selectedRadial");
    }

    function labelFunction(val,min,max) {

    }

    function deselect() {

        div1.attr("class","radial");
        div2.attr("class","radial");
        div3.attr("class","radial");
        div4.attr("class","radial");
    }

    function start() {

     
    	var rp1 = radialProgress(document.getElementById('div1'))
        
        .diameter(100)
        .minValue(0)
        .maxValue(100)
        .value(134)
        .render();
    	var rp2 = radialProgress(document.getElementById('div2'))
        
        .diameter(100)
        .minValue(0)
        .maxValue(100)
        .value(97)
        .render();
    	var rp3 = radialProgress(document.getElementById('div3'))
        
        .diameter(100)
        .minValue(0)
        .maxValue(100)
        .value(87)
        .render();
    	var rp4 = radialProgress(document.getElementById('div4'))
        
        .diameter(100)
        .minValue(0)
        .maxValue(100)
        .value(63)
        .render();
    }





</script>
    
  </body>
</html>
