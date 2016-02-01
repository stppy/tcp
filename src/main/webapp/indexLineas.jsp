<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="org.jasig.cas.client.authentication.AttributePrincipalImpl"%>
<%@ page import="org.jasig.cas.client.authentication.AttributePrincipal"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>


<!DOCTYPE html>
<html lang="spanish">
  <head>
  	<!--  ISO-8859-1 -->
  	<%@ include file="/frames/head.jsp" %>
 	
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
		$('[data-toggle="tap"]').tooltip();
			
		var lineaAccionAcumuladoMes;
		
		var vectorMin=0;
		var vectorMax=0;
		var vectorMinEjecucion=0;
		var vectorMaxEjecucion=0;
		
		function dibujarLineaAccionAcumuladoMes(lineaAccionAcumuladoMes, vectorMin, vectorMax, vectorMinEjecucion, vectorMaxEjecucion){
			
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
			
			$("#fechaInicio").html(lineaAccionAcumuladoMes[vectorMin].mes+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
			$("#fechaInicioEjecucion").html(lineaAccionAcumuladoMes[vectorMinEjecucion].mes+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
			$("#fechaFin").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+lineaAccionAcumuladoMes[vectorMax].mes);
			$("#fechaFinEjecucion").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+lineaAccionAcumuladoMes[vectorMaxEjecucion].mes);

			$("#rango-fecha").slider({});
			$("#rango-fecha-ejecucion").slider({});
			for(var i = 0;i<lineaAccionAcumuladoMes.length; i++)
			{
				cantidadTotalProgramada+=lineaAccionAcumuladoMes[i].cantidad_programada;
		
				if(lineaAccionAcumuladoMes[i].mes >= lineaAccionAcumuladoMes[vectorMin].mes && lineaAccionAcumuladoMes[i].mes <= lineaAccionAcumuladoMes[vectorMax].mes)
				{
	 				dataPoints.push({ x: new Date( lineaAccionAcumuladoMes[i].mes), y: cantidadTotalProgramada});
				}

			}
			
			for(var i = 0;i<lineaAccionAcumuladoMes.length; i++)
			{
				cantidadTotalEjecutada+=lineaAccionAcumuladoMes[i].cantidad_ejecutda;
		
				if(lineaAccionAcumuladoMes[i].mes >= lineaAccionAcumuladoMes[vectorMinEjecucion].mes && lineaAccionAcumuladoMes[i].mes <= lineaAccionAcumuladoMes[vectorMaxEjecucion].mes)
				{
	 				if (lineaAccionAcumuladoMes[i].cantidad_ejecutda!=0)  ejecutada.push({ x: new Date( lineaAccionAcumuladoMes[i].mes), y: cantidadTotalEjecutada});
				}

			}

			var chart = new CanvasJS.Chart("chartContainer",
					{
						zoomEnabled: true,
						exportEnabled: true,
						exportFileName: lineaAccionAcumuladoMes[0].institucion+" - "+lineaAccionAcumuladoMes[0].linea_accion+" ("+lineaAccionAcumuladoMes[0].accion_unidad_medida+")",
						title: {
							text: "Evolución Mensual" +" ("+lineaAccionAcumuladoMes[0].accion_unidad_medida+")" 
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
							interlacedColor: "#FAFAFA",
							tickColor: "azure",
							titleFontColor: "rgb(0,75,141)"
						},
						data: [
						{        
							indexLabelFontColor: "darkSlateGray",
							showInLegend: true, 
							name: 'programada',
							type: "line",
							//color: "#238E68",
							markerSize:8,
							legendText:"Programación",
							dataPoints:dataPoints
						},
						{        
							indexLabelFontColor: "darkSlateGray",
							showInLegend: true, 
							name: 'ejecutadas',
							type: "area",
							//color: "#996633",
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
			
			dibujarLineaAccionAcumuladoMes(lineaAccionAcumuladoMes, vectorMin, vectorMax, vectorMinEjecucion, vectorMaxEjecucion);
			
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
			
			dibujarLineaAccionAcumuladoMes(lineaAccionAcumuladoMes, vectorMin, vectorMax, vectorMinEjecucion, vectorMaxEjecucion);
			
		});
		
		$("body").on("click", ".registro",function(event){
			var codigoRegistro = $(this).attr("codigoRegistro");
		    var idParsed = codigoRegistro.split("-");                                                            
			var institucion_id=idParsed[1];
			var linea_accion_id=idParsed[2];
			var unidad_medida= idParsed[3];
			var tituloModal="";
			var cuerpoModal="";
			var tituloModal2="";
			var cuerpoModal2="";
			var footerModal="<br><br><br>";
			
			
				var registros = $.ajax({
			    	url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getFactHitos2015Accion&institucion_id='+institucion_id+'&linea_accion_id='+linea_accion_id,
			      	type:'get',
			      	dataType:'json',
			      	crossDomain:true,
			      	async:false       
			    }).responseText;
				
				var registrosHitos = $.ajax({
			    	url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getFactHitos2015&institucion_id='+institucion_id+'&linea_accion_id='+linea_accion_id,
			      	type:'get',
			      	dataType:'json',
			      	crossDomain:true,
			      	async:false       
			    }).responseText;
				

			var elRegistro=JSON.parse(registros);
			var registroHitos=JSON.parse(registrosHitos);
						
			tituloModal='<h3><center>'+elRegistro[0].institucion+'&nbsp;&nbsp;-&nbsp;&nbsp;'+elRegistro[0].linea_accion+'</center></h3>';
			$('#myModal').find(".modal-title").html(tituloModal);
			$('#myModal').find("#tab_1-1").html("");
			$('#myModal').find("#tab_2-2").html("");
			$('#myModal').find("#tab_3-2").html("");
			$('#myModal').find("#tab_4-2").html("");
			$('#myModal').find("#tab_5-2").html("");
			
			$("#tab_3-2").append('Programación: <label id="fechaInicio"></label><input id="rango-fecha" type="text" class="span2" value="" data-slider-min="10" data-slider-max="1000" data-slider-step="1" data-slider-value="[250,450]"/><label id="fechaFin"></label>');
			$("#tab_3-2").append('<br><br>Ejecución: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label id="fechaInicioEjecucion"></label><input id="rango-fecha-ejecucion" type="text" class="span2" value="" data-slider-min="10" data-slider-max="1000" data-slider-step="1" data-slider-value="[250,450]"/><label id="fechaFinEjecucion"></label>');
			
			
			cuerpoModal='<div class="table-responsive">'+
						'<table class="table table-hover hitos">'+
							'<thead>'+
								'<tr class="active"><th>Acción</th><th>Departamento</th><th>Distrito</th><th>U. Medida</th><th>Cantidad. Programado</th><th>Costo Total</th><th>Fecha Terminación</th><th>% Programado</th><th>% Ejecutado</th></tr>'+
							'</thead>'+
							'<tbody>';

						var totalCantidadProgramada=0;
						
						for(var m=0; m<elRegistro.length;m++)
						{
								cuerpoModal+='<tr><td>'+elRegistro[m].accion+'</td><td>'+elRegistro[m].accion_departamento+'</td><td>'+elRegistro[m].accion_distrito+'</td><td>'+elRegistro[m].accion_unidad_edida+'</td><td>'+elRegistro[m].hito_cantidad_programado+'</td><td>'+elRegistro[m].accion_costo+'</td><td>'+elRegistro[m].hito_fecha_entrega+'</td><td>'+elRegistro[m].hito_porcentaje_programado+'</td><td>'+elRegistro[m].hito_porcentaje_ejecutado+'</td></tr>';
								totalCantidadProgramada+=elRegistro[m].hito_cantidad_programado;
						}
						totalCantidadProgramada=parseFloat(totalCantidadProgramada).toFixed(2);

						cuerpoModal+='</tbody><tfoot><tr class="active"><td colspan="2">Total Cantidad Programada: </td><td colspan="8">'+totalCantidadProgramada+'</td></tr></tfoot>'+
									 '</table>'+
									 '</div>';


			$('#myModal').find("#tab_1-1").html(cuerpoModal);
			//$('#myModal').find(".modal-footer").html(footerModal);
						
			
						cuerpoModal2='<div class="table-responsive">'+
						'<table class="table table-hover hitos">'+
							'<thead>'+
								'<tr class="active"><th>Hitos</th><th>Departamento</th><th>Distrito</th><th>U. Medida</th><th>Cantidad. Programado</th><th>Costo Total</th><th>Fecha Terminación</th><th>% Programado</th><th>% Ejecutado</th></tr>'+
							'</thead>'+
							'<tbody>';

						var totalCantidadProgramada2=0;
						tituloModal2='<h3><center>'+registroHitos[0].institucion+'&nbsp;&nbsp;-&nbsp;&nbsp;'+registroHitos[0].linea_accion+'</center></h3>';
						for(var h=0; h<registroHitos.length;h++)
						{
								cuerpoModal2+='<tr><td>'+registroHitos[h].accion+'</td><td>'+registroHitos[h].accion_departamento+'</td><td>'+registroHitos[h].accion_distrito+'</td><td>'+registroHitos[h].accion_unidad_edida+'</td><td>'+registroHitos[h].hito_cantidad_programado+'</td><td>'+registroHitos[h].accion_costo+'</td><td>'+registroHitos[h].hito_fecha_entrega+'</td><td>'+registroHitos[h].hito_porcentaje_programado+'</td><td>'+registroHitos[h].hito_porcentaje_ejecutado+'</td></tr>';
								totalCantidadProgramada2+=registroHitos[h].hito_cantidad_programado;
						}
						totalCantidadProgramada2=parseFloat(totalCantidadProgramada2).toFixed(2);

						cuerpoModal2+='</tbody><tfoot><tr class="active"><td colspan="2">Total Cantidad Programada: </td><td colspan="8">'+totalCantidadProgramada2+'</td></tr></tfoot>'+
									 '</table>'+
									 '</div>';
			
			$('#myModal').find(".modal-title").html(tituloModal2);
			$('#myModal').find("#tab_2-2").html("");
			$('#myModal').find("#tab_2-2").html(cuerpoModal2);
			

			
			
			
			lineaAccionAcumuladoMes = $.ajax({
		    	url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getLineaAccionAcumuladoMes&institucion_id='+institucion_id+'&linea_accion_id='+linea_accion_id,
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
			
			
			lineaAccionAcumuladoMes = JSON.parse(lineaAccionAcumuladoMes);
			
			 vectorMin=0;
			 vectorMax=lineaAccionAcumuladoMes.length-1;

			 vectorMinEjecucion=0;
			 vectorMaxEjecucion=lineaAccionAcumuladoMes.length-1;

			//grafico de total cantidad programada y total cantidad ejecutada
			
			$('#myModal').find("#tab_3-2").append('<div id="chartContainer" style="height:400px;"></div>');
			
			function compare(a,b) {             
				  if (a.mes < b.mes)
				    return -1;
				  if (a.mes > b.mes)
				    return 1;
				  return 0;
				}
			
			
			
			lineaAccionAcumuladoMes=lineaAccionAcumuladoMes.sort(compare);
			

			dibujarLineaAccionAcumuladoMes(lineaAccionAcumuladoMes, vectorMin, vectorMax, vectorMinEjecucion, vectorMaxEjecucion);
			
			
			$('#myModal').find("#tab_4-2").html("");
			$('#myModal').find("#tab_4-2").html("Datos no disponibles");
			$('#myModal').find("#tab_5-2").html("");
			$('#myModal').find("#tab_5-2").html("Datos no disponibles");
			
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
			url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getUsuarios&usuario=<%=user.getName()%>',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		usuarios = JSON.parse(usuarios);
		usuarios = usuarios.usuarios;
		$("#nombreUsuario").append(usuarios[0].correo+" ("+usuarios[0].nivel_id+", "+usuarios[0].entidad_id+")");
		$("#PerfilUsuario").append(entidadCas+" - "+usuarios[0].nombre);
		$("#PerfilNombre").append(usuarios[0].nombre);
		$("#PerfilEntidad").append(entidadCas);
		
		
		
		
		var i=parseInt(0);
		
		function numeroConComa(x) {
		    return x.toString().replace(".", ",").replace(/\B(?=(\d{3})+(?!\d))/g, ".");
		}
		
		var entidadesjson = $.ajax({
	    	url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getEntidades',
	      	type:'get',
	      	dataType:'json',
	      	crossDomain:true,
	      	async:false       
	    }).responseText;
		var entidades=JSON.parse(entidadesjson);
		
		var eljson = $.ajax({
	    	url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getLineasAccion',
	      	type:'get',
	      	dataType:'json',
	      	crossDomain:true,
	      	async:false       
	    }).responseText;
		var el=JSON.parse(eljson);
		

		var lineasDeAccion= [];
		
		var sumporAClass="";
		var porAejeClass="";
		var porHejeClass="";
		var porHejeClassRow="";
		
		for (var i = 0; i< entidades.length;i++){
			if (entidades[i].institucion_id==1359){
				$("#cuerpoTabla").append('<tr><td colspan="12" ><strong>'+entidades[i].institucion+'</strong></td></tr>');
				for(var j=0;j<el.length;j++){
					if (el[j].institucion_id==entidades[i].institucion_id){
						if(el[j].anho=="2016"){
							$("#cuerpoTabla").append('<tr ><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#myModal" class="registro" codigoRegistro='+j+'-'+el[j].institucion_id+'-'+el[j].linea_accion_id+'-'+el[j].accion_unidad_medida+'> '+el[j].linea_accion+'</a></td><td>'+el[j].accion_unidad_medida+'</td><td></td><td class=" "><a href="#" class="modalAcciones" parametros="'+el[j].institucion_id+'-'+el[j].linea_accion_id+'" "=""><span class="glyphicon glyphicon-pencil"></span></a></td></tr>');
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
                  <th>Líneas de Acción </th>
                  <th>Unidad de Medida</th>
                  <th>Acciones</tr>
              </thead>
              <tbody id="cuerpoTabla">
               
              </tbody>
            </table>
			
	            </div>
			   </div>
			</div>
          </div><!-- /.row -->
          
           <div class="row">
	         <div class="col-md-12">
	          <div class="box" height="1000px">
	            <div class="box-header with-border" height="1000px">
	              <h2 class="box-title text-center" id="tituloTipoPrograma">
	               Documentaciones 	
	              </h2>
	              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	              </div>
	            </div>
	            <div class="box-body table-responsive" style="scroll-x:hidden;scroll-y:auto;">
	            
	            Descargue el instructivo <a href="#" target="_blank"/>aqui</a>.<br>
	            
	            Para más información sobre como cargar Lineas de Acción, Acciones, Planificar Acciones o Declarar avances, acceda a nuestra plataforma de <a href="http://cursos.stp.gov.py/course/view.php?id=21" target="_blank"/>cursos.</a>
	            
	            
			
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
          <script>
          
          $(document).ready(function(){
        	  
        	  
        	  
        	  function cargarTablaAccionHasProducto(accionId){
        			
        			var accionHasProducto = $.ajax({
        		    	url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getAccionHasProducto&accion_id='+accionId,
        		      	type:'get',
        		      	dataType:'json',
        		      	crossDomain:true,
        		      	async:false       
        		    }).responseText;		
        			accionHasProducto=JSON.parse(accionHasProducto);
        			
        			
        			$("#TablaAccionHasProductos").html("");
        			var fila ="";
        			if (accionId>0){
	        			for(var f = 0; f < accionHasProducto.length; f++)
	        			{
	        				
	        				fila += "<tr><td>"+accionHasProducto[f].nivel+"</td><td>"+accionHasProducto[f].entidad+"</td><td>"+accionHasProducto[f].tipoPrograma+"</td><td>"+accionHasProducto[f].programa+"</td><td>"+accionHasProducto[f].subPrograma+"</td><td>"+accionHasProducto[f].proyecto+"</td><td>"+accionHasProducto[f].producto+
	        				"</td><td>"+accionHasProducto[f].cantFisica+"</td><td>"+accionHasProducto[f].uMedida+"</td><td>"+accionHasProducto[f].clase+"</td><td>Gs."+accionHasProducto[f].cantFinanciera+"</td></tr>";
	        			}
	        			
	        			$("#TablaAccionHasProductos").append(fila);
        			}
        			
        		}
        		//Falta pregunta si existe el modal y borrar si existe
        		$("body").on("click", ".modalAcciones",function(event){
        			
        			if ( $("#myModal2").length ) {
        				$("#myModal2").remove();
        			}
        	 		if ( $("#modalAgregarHito").length ) {
        				$("#modalAgregarHito").remove();
        			} 
        			if ( $("#modalDeclararAvance").length ) {
        				$("#modalDeclararAvance").remove();
        			}
        			
        				
        			var parametros = $(this).attr("parametros");
        		    var idParsed = parametros.split("-");                                                            
        			var institucionId=idParsed[0];
        			var lineaAccionId=idParsed[1];
        			/* var idDepartamento= idParsed[2];
        			var idDistrito= idParsed[3];
        			var accionId = idParsed[4];
        			var institucionId=idParsed[5];
        			var lineaAccionId=idParsed[6];
        			var idDepartamento= idParsed[7];
        			var idDistrito= idParsed[8]; */
        			var modalHito = "";
        			var urlFactHitos="";
        			var optionDepartamentos = "";
        			var optionDistritos = "";
        			urlFactHitos+='http://spr.stp.gov.py/tablero/ajaxSelects?action=getFactHitos2015';
        			if (typeof institucionId != "undefined"){ urlFactHitos+='&institucion_id='+institucionId;}else{institucionId=0;}
        			if (typeof lineaAccionId != "undefined"){ urlFactHitos+='&linea_accion_id='+lineaAccionId;}else{lineaAccionId=0;}
        			if (typeof idDepartamento != "undefined"){ urlFactHitos+='&departamento='+idDepartamento;}else{idDepartamento=1;}
        			if (typeof idDistrito != "undefined"){ urlFactHitos+='&distrito='+idDistrito;}else{idDistrito=1;}
        			if (typeof accionId != "undefined"){ urlFactHitos+='&accion_id='+accionId;}else{accionId=0;}

        			
        			var registrosHitos = $.ajax({
        		    	url:urlFactHitos,
        		      	type:'get',
        		      	dataType:'json',
        		      	crossDomain:true,
        		      	async:false       
        		    }).responseText;		
        			var registroHitos=JSON.parse(registrosHitos);
        			
        			var accion = $.ajax({
        		    	url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getFactHitos2015Accion&accion_id='+accionId,
        		      	type:'get',
        		      	dataType:'json',
        		      	crossDomain:true,
        		      	async:false       
        		    }).responseText;		
        			accion=JSON.parse(accion);
        			
        			var departamentos = $.ajax({
        		    	url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getDepartamento',
        		      	type:'get',
        		      	dataType:'json',
        		      	async:false       
        		    }).responseText;
        			departamentos = JSON.parse(departamentos);
        		
        			for(i = 0;i<18; i++){
        				optionDepartamentos+='<option value="'+departamentos[i].idDepartamento+'" parametro="'+departamentos[i].idDepartamento+'" class="departamentoSeleccionado">'+departamentos[i].nombreDepartamento+'</option>';
        			}
        
        			
        			var totalCantidadProgramada=0;
        		
        			
        			modalHito +=	'<div class="modal fade" id="myModal2" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">'+
        							'<div class="modal-dialog modal-lg" style="width:90%;" >'+
        							    '<div class="modal-content" >'+
        							      '<div class="modal-header">'+
        							        '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
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
        													'<tr><td><div class="form-group"><label for="nombreAccion">Acción</label><input type="text" class="form-control" id="nombreAccion" value=""><input type="hidden" class="form-control" id="accionId" value="">'+
        													'</div></td><td><div class="form-group"><label for="umedida">U. medida</label><input type="text" class="form-control" id="umedida" value=""></div></td></tr>'+
															'<tr><td><div class="form-group"><label for="departamento">Departamento</label><select id="selectorDepartamento" name="departamento" class="form-control">'+optionDepartamentos+'</select></div></td>'+
															'<td><div class="form-group"><label for="distrito">Distrito</label><select name="departamento" class="form-control" id="distritosDepartamento"></select></div></td></tr>'+
        													'<tr><td colspan="2"><button type="submit" class="btn btn-success">Guardar Acción</button><button type="submit" class="btn btn-success modalAgregarHito" parametros="'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'-'+accionId+'-'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'">Programar Hito</button> <button type="submit" class="btn btn-success modalDeclararAvance" parametros="'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'-'+accionId+'-'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'" >Declarar Avance</button></td></tr>'+
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
        								      			'<div >'+
        								      			
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
        								                '		<th>Total Fisico</th>'+
        								                '		<th>U. Medida</th>'+
        								                '		<th>Clase</th>'+
        								                '		<th>Total Financiero</th>'+
        								                '	</tr>'+
        								                '<tbody class="table-body-producto" id="TablaAccionHasProductos">'+
        								                '</tbody>'+
        								                '</table>'+

        						                	'</div>'+//fin box-body
        						                	'<div class="box-footer">'+
        						                	
        						                	'<div id="tituloFormulario"></div>'+
        					      					'<form class="form-horizontal" role="form" id="formulario" method="post" action="/ajaxUpdate">'+
        					      						'<input type="hidden" name="accion" value="actEntidad">'+
        					      						'<input type="hidden" name="anho" value="" id="anhoProducto-formulario">'+
        					      						'<input type="hidden" name="version" value="" id="versionProducto-formulario">'+

        					      						'<div class="form-group col-md-1">'+
        					      							'<input type="text" name="nivel" id="nivel-formulario" value="12" class="form-control" disabled>'+
        					      						'</div>'+
        					      						'<div class="form-group col-md-1">'+
        					  								'<input type="text" name="entidad" id="entidad-formulario" value="1" class="form-control" disabled>'+
        					  							'</div>'+
        					      					    '<div class="form-group col-md-2">'+
        					      					    	'<input type="text" name="tipoPrograma" id="tipoPrograma-formulario" placeholder="Tipo Programa" list="listaf3c2" class="form-control">'+
        					      					    '</div>'+
        					      					    '<div class="form-group col-md-2">'+
        					      					    	'<input type="text" name="programa" id="programa-formulario" placeholder="Programa" list="listaf4c2" class="form-control">'+
        					      					    '</div>'+
        					      					    '<div class="form-group col-md-2">'+
        					      					    	'<input type="text" name="subPrograma" id="subPrograma-formulario" placeholder="SubPrograma" list="listaf5c2" class="form-control">'+
        					      					    '</div>'+
        					      					    '<div class="form-group col-md-2">'+
        					      					    	'<input type="text" name="proyecto" id="proyecto-formulario" placeholder="Proyecto" list="listaf6c2" class="form-control">'+
        					      					    '</div>'+
        					  					    	'<div class="form-group col-md-2">'+
        					  					    		'<input type="text" name="producto" id="producto-formulario" placeholder="Producto" list="listaf7c2" class="form-control">'+
        					      					  	'</div>'+ 
        					      					'</form>'+
        					      					
        			      					  	'</div>'+
        			      					  
        						                		'<div class="row">'+
        						      					    '<div class="form-group col-md-2">'+
        						      					  		'<label for="totalFisico-formulario">Total Fisico</label>'+
        					      					    		'<input type="text" name="totalFisico" id="totalFisico-formulario" value="" class="form-control" disabled>'+
        					      					    	'</div>'+
        						      					    '<div class="form-group col-md-2">'+
        					      					  			'<label for="unidadMedida-formulario">U. Medida</label>'+
        				      					    			'<input type="text" name="totalFisico" id="unidadMedida-formulario" value="" class="form-control" disabled>'+
        				      					    		'</div>'+
        						      					    '<div class="form-group col-md-2">'+
        				      					  				'<label for="clase-formulario">Clase</label>'+
        			      					    				'<input type="text" name="totalFisico" id="clase-formulario" value="" class="form-control" disabled>'+
        			      					    			'</div>'+			      					    		
        						      					    '<div class="form-group col-md-6">'+
        			      					  					'<label for="totalFinanciero-formulario">Total Financiero</label>'+
        								      					'<div class="input-group input-group-sm">'+
        								      						'<span class="input-group-addon">Gs</span>'+
        					      					    			'<input type="text" name="totalFinanciero" id="totalFinanciero-formulario" value="" class="form-control" disabled>'+
        								      					'</div>'+
        				      					    		'</div>'+
        				      					    	'</div>'+		// fin row
        				      					    	
        				      					    	'<div class="row">'+//inicio row
		    						      					    '<div class="form-group col-md-3">'+
					      					  					'<label for="totalFinanciero-formulario">Primer Trimestre</label>'+
										      					'<div class="input-group input-group-sm">'+						      			
							      					    			'<input type="text" name="primerTrimestre" id="primerTrimestre-formulario" value="" class="form-control">'+
										      					'</div>'+
						      					    		'</div>'+
						      					    		
        						      					    '<div class="form-group col-md-3">'+
    			      					  					'<label for="totalFinanciero-formulario">Segundo Trimestre</label>'+
    								      					'<div class="input-group input-group-sm">'+
    					      					    			'<input type="text" name="segundoTrimestre" id="segundoTrimestre-formulario" value="" class="form-control">'+
    								      					'</div>'+
    				      					    		'</div>'+
    				      					    		
    						      					    '<div class="form-group col-md-3">'+
			      					  					'<label for="totalFinanciero-formulario">Tercer Trimestre</label>'+
								      					'<div class="input-group input-group-sm">'+
					      					    			'<input type="text" name="tercerTrimestre" id="tercerTrimestre-formulario" value="" class="form-control">'+
								      					'</div>'+
				      					    		'</div>'+
				      					    		
						      					    '<div class="form-group col-md-3">'+
		      					  					'<label for="totalFinanciero-formulario">Cuarto Trimestre</label>'+
							      					'<div class="input-group input-group-sm">'+
				      					    			'<input type="text" name="cuartoTrimestre" id="cuartoTrimestre-formulario" value="" class="form-control">'+
							      					'</div>'+
			      					    		'</div>'+
        				      					    	'</div>'+//fin row
        				      					    	
        				      					    	
        				      					  	'<button type="submit" class="btn btn-success guardarComboProducto"">Guardar</button>'+
        						                	'</div>'+//fin box-footer
        						              	'</div>'+//fin box-danger
        						            '</div>'+//fin col-md-6

        								      	
        							      	
        									    	'<div class="col-md-6">'+
        									    		 '<div class="box">'+
        									      			'<div class="box-header with-border">'+
        									       				'<h2 class="box-title text-center">'+
        									          				'Cronograma de Entregables (Planificación)'+ 	
        									        			'</h2>'+
        									        			'<div class="box-tools pull-right"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
        									        			'</div>'+
        									      			'</div>'+
        									      			'<div class="box-body hitosProgramado">'+//cuerpo del body    			
        									      				'<div class="table-responsive">'+
        															'<table class="table table-hover hitos">'+
        																'<thead>'+
        																	'<tr class="active"><th>Acción</th><th>Departamento</th><th>Distrito</th><th>U. Medida</th><th>Cantidad. Programado</th><th>Costo Total</th><th>Fecha Terminación</th><th>% Programado</th><th>Editar</th></tr>'+
        																'</thead>'+
        																'<tbody>';
        																
        																
        															/*	for(var m = 0; m < registroHitos.length; m++)
        																{
        																	if(registroHitos[m].hito_porcentaje_programado > 0)
        																	{
        																		modalHito += '<tr><td>'+registroHitos[m].accion+'</td><td>'+registroHitos[m].accion_departamento+'</td><td>'+registroHitos[m].accion_distrito+'</td><td>'+registroHitos[m].accion_unidad_edida+'</td><td>'+registroHitos[m].hito_cantidad_programado+'</td><td>'+registroHitos[m].accion_costo+'</td><td>'+registroHitos[m].hito_fecha_entrega+'</td><td>'+registroHitos[m].hito_porcentaje_programado+'</td><td><a href="#" class="modalEditarHito" parametros="'+registroHitos[m].hito_id+'"><span class="glyphicon glyphicon-pencil"></span></a></td></tr>';
        																		totalCantidadProgramada+=registroHitos[m].hito_cantidad_programado;
        																	}
        																}
        																totalCantidadProgramada=parseFloat(totalCantidadProgramada).toFixed(2);
*/
        																modalHito += '</tbody><tfoot><tr class="active"><td colspan="2">Total Cantidad Programada: </td><td colspan="8">'+totalCantidadProgramada+'</td></tr></tfoot>'+
        																			 '</table>'+
        																			 '</div>'+
        									      			'</div>'+//FIN BODY
        										   		'</div>'+
        											'</div>'+
        									    	'<div class="col-md-6">'+
        	 							    		'<div class="box">'+
        								      			'<div class="box-header with-border">'+
        								       				'<h2 class="box-title text-center">'+
        								          				'Declaraciones de Avance (Ejecución)'+ 	
        								        			'</h2>'+
        								        			'<div class="box-tools pull-right"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
        								        			'</div>'+
        								      			'</div>'+
        								      			'<div class="box-body">'+ 
        							      				'<div class="table-responsive">'+
        												'<table class="table table-hover hitos">'+
        													'<thead>'+
        														'<tr class="active"><th>Acción</th><th>Departamento</th><th>Distrito</th><th>U. Medida</th><th>Cantidad. Programado</th><th>Costo Total</th><th>Fecha Terminación</th><th>% Ejecutado</th><th>Editar</th></tr>'+
        													'</thead>'+
        													'<tbody>';
        													
        													/*
        													for(var m = 0; m < registroHitos.length; m++)
        													{
        														if(registroHitos[m].hito_porcentaje_ejecutado > 0)
        														{
        															modalHito += '<tr><td>'+registroHitos[m].accion+'</td><td>'+registroHitos[m].accion_departamento+'</td><td>'+registroHitos[m].accion_distrito+'</td><td>'+registroHitos[m].accion_unidad_edida+'</td><td>'+registroHitos[m].hito_cantidad_programado+'</td><td>'+registroHitos[m].accion_costo+'</td><td>'+registroHitos[m].hito_fecha_entrega+'</td><td>'+registroHitos[m].hito_porcentaje_ejecutado+'</td><td><a href="#" class="modalEditarHito" parametros="'+registroHitos[m].hito_id+'"><span class="glyphicon glyphicon-pencil"></span></a></td></tr>';
        															totalCantidadProgramada+=registroHitos[m].hito_cantidad_programado;
        														}
        													}
        													totalCantidadProgramada=parseFloat(totalCantidadProgramada).toFixed(2);
*/
        													modalHito += '</tbody><tfoot><tr class="active"><td colspan="2">Total Cantidad Programada: </td><td colspan="8">'+totalCantidadProgramada+'</td></tr></tfoot>'+
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
        							'</div>';

        			
        			$("body").append(modalHito);
        			$("#myModal2").modal('show');
        			
        			$("body").on("change", "#selectorDepartamento",function(event){
        				//var departamentoId = $(this).attr("parametro");
        				var departamentoId = $("#selectorDepartamento option:selected").val();
        		    	
        				var distritos = $.ajax({
        			    	url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getDistrito&departamento='+departamentoId,
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
        			
        			cargarTablaAccionHasProducto(accionId);
        			
        			function Combo(){

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
        			    	var rutaNivel = 12;
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
        			    	var linkEntidad = 12;
        			    	var datosEntidades = $.ajax({
        			         	 url:'http://spr.stp.gov.py/ajaxSelects?accion=getEntidades&nivel='+linkEntidad,
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
        			    	var linkEntidad = 12;
        			      	var rutaEntidad2 = 1;
        			      	

        			      	var datosEntidades = $.ajax({
        			        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getEntidades&nivel='+linkEntidad,
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
        						    	
        						    	var linkEntidad = 12;
        						      	var rutaEntidad2 = 1;
        						      	

        						      	var datosEntidades =[];
        						      		$.ajax({
        						        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getEntidades&nivel='+linkEntidad,
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
        			    	var linkNivel = 12;
        			      	var linkEntidad = 1;
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
        			    	var linkNivel = 12;
        			      	var linkEntidad = 1;
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
        			    	var linkNivel = 12;
        			      	var linkEntidad = 1;
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
        				        
        				          for(var i = 0; i < datosProductos.producto.length ; i++) 
        				          {       

        						    	$.ajax({
        						         	 url:'http://spr.stp.gov.py/ajaxSelects?accion=getProductos&producto='+datosProductos.producto[i].producto_id,
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
        						    	
        				        	  function jsonpCallbackProductoDetalle(data) {
        							    	datosProductosDetalle = data;
        						    	
        	   
        								          var option = document.createElement('option');
        								          option.setAttribute('value', datosProductosDetalle.productos[0].codigoCatalogo);
        								          option.setAttribute('label', datosProductosDetalle.productos[0].nombreCatalogo);
        								          datalistProductos.appendChild(option);      
        							    }
        				        	  
        				      	  } 
        				    	
        				    }//fin primer callback
        			    }
        			    
        			    this.producto = function(){
        				    //var linkNivel = document.getElementById("nivel-formulario").value;
        				    //var linkEntidad = document.getElementById("entidad-formulario").value;
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
        					         	 url:'http://spr.stp.gov.py/ajaxSelects?accion=getAsignacionPresiVersion&nivel=12&entidad=1&tipo='+linkTipoPrograma+'&programa='+linkPrograma+'&subPrograma='+linkSubPrograma+'&proyecto='+linkProyecto+'&producto='+linkProducto,
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
        				        			totalFinanciero += ( parseFloat(datos[z].planificado1) + parseFloat(datos[z].planificado2) + parseFloat(datos[z].planificado3) + parseFloat(datos[z].planificado4) + parseFloat(datos[z].planificado5) + parseFloat(datos[z].planificado6) + parseFloat(datos[z].planificado7) + parseFloat(datos[z].planificado8) + parseFloat(datos[z].planificado9) + parseFloat(datos[z].planificado10) + parseFloat(datos[z].planificado11) + parseFloat(datos[z].planificado12) );
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
        					         	 url:'http://spr.stp.gov.py/ajaxSelects?accion=getProductoTipoN&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipo='+linkTipoPrograma+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma+'&proyecto='+linkProyecto+'&producto='+linkProducto,
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

        		$("body").on("click", ".modalEditarHito",function(event){
        			$("#modalEditarHito").remove();
        			
        			
        			var parametros = $(this).attr("parametros");
        		    var idParsed = parametros.split("-");                                                            
        			var hitoId=idParsed[0];
        			
        			var hitoParaEditar = $.ajax({
        		    	url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getFactHitos2015&hito_id='+hitoId,
        		      	type:'get',
        		      	dataType:'json',
        		      	crossDomain:true,
        		      	async:false       
        		    }).responseText;		
        			hitoParaEditar=JSON.parse(hitoParaEditar);		

        			
        	//MODAL PARA EDITAR HITO
        			var modalEditarHito = "";

        			modalEditarHito =	 '<div class="modal fade" role="dialog" id="modalEditarHito" data-backdrop="static" data-keyboard="false">'+ 
        								    '<div class="modal-dialog modal-lg">'+ 
        								    
        								      '<div class="modal-content">'+ 
        								        '<div class="modal-header">'+ 
        								          '<button type="button" class="close" data-dismiss="modal">&times;</button>'+ 
        								          '<h4 class="modal-title">Editar Hito</h4><small>('+hitoParaEditar[0].accion_departamento+'-'+hitoParaEditar[0].accion_distrito+'-'+hitoParaEditar[0].institucion+'-'+hitoParaEditar[0].linea_accion+'-'+hitoParaEditar[0].accion+')</small>'+ 
        								        '</div>'+ 
        								        '<div class="modal-body">'+ 				        
        								        '<form role="form">'+
        									  	  '<div class="form-group">'+
        									  	    '<label for="nombreHito">Nombre Hito</label>'+
        									  	    '<input type="text" class="form-control" id="nombreHito" value="'+hitoParaEditar[0].hito+'">'+
        									  	  '</div>'+
        									  	  '<div class="form-group">'+
        									  	    '<label for="unidadMedida">U. Medida</label>'+
        									  	    '<input type="text" class="form-control" id="uMedida" value="'+hitoParaEditar[0].accion_unidad_edida+'">'+
        									  	  '</div>'+
        									  	  '<div class="form-group">'+
        									  	    '<label for="cantProgramado">Cantidad Programado</label>'+
        									  	    '<input type="text" id="cantProgramado" class="form-control" value="'+hitoParaEditar[0].hito_cantidad_programado+'">'+
        									  	  '</div>'+
        									  	  '<div class="form-group">'+
        									  	    '<label for="costoTotal">Costo Total</label>'+
        									  	    '<input type="text" class="form-control" id="costoTotal" value="'+hitoParaEditar[0].accion_costo+'">'+
        									  	  '</div>'+
        									  	  '<div class="form-group">'+
        									  	    '<label for="fechaTerminacion">Fecha Terminación</label>'+
        									  	    '<input type="text" class="form-control" id="fechaTerminacion" value="'+hitoParaEditar[0].hito_fecha_entrega+'">'+
        									  	  '</div>'+
        									  	  '<div class="form-group">'+
        									  	    '<label for="porcProgramado">% Programado</label>'+
        									  	    '<input type="date" class="form-control" id="porcProgramado" value="'+hitoParaEditar[0].hito_porcentaje_programado+'">'+
        									  	  '</div>'+
        									  	  '<button type="submit" class="btn btn-success">Guardar</button>'+
        									  	'</form>'+
        								        
        								        '</div>'+ 
        								        '<div class="modal-footer">'+ 
        								          '<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>'+ 
        								        '</div>'+ 
        								      '</div>'+ 
        								      
        								    '</div>'+ 
        								  '</div>';
        								
        																
        																
        			
        			$("body").append(modalEditarHito);
        			$("#modalEditarHito").modal('show');
        	//FIN MODAL PARA EDITAR HITO
        			
        		});
        		
        		//Guarda nivel-entidad-tipo-programa-subPrograma-proyecto-producto-anho-version en la tabla accion_has_producto
        		$("body").on("click", ".guardarComboProducto",function(event){
        			event.stopPropagation();
        			event.preventDefault();
        			
        	    	var nivel = 12;
        	      	var entidad = 1;
        		    var tipoPrograma = document.getElementById("tipoPrograma-formulario").value;
        		    var programa = document.getElementById('programa-formulario').value;
        		    var subPrograma = document.getElementById('subPrograma-formulario').value;
        		    var proyecto = document.getElementById('proyecto-formulario').value; 
        		    var producto = document.getElementById('producto-formulario').value; 
        		    var accionId = document.getElementById('accionId').value; 
        		    var anho = document.getElementById('anhoProducto-formulario').value; 
        		    var version = document.getElementById('versionProducto-formulario').value; 
        		    var totalFisico = document.getElementById('totalFisico-formulario').value; 
        		    var unidadMedida = document.getElementById('unidadMedida-formulario').value; 
        		    var clase = document.getElementById('clase-formulario').value; 
        		    var totalFinanciero = document.getElementById('totalFinanciero-formulario').value; 

        		    var datos = new Object();
        		    
        		    datos.nivel = nivel;
        		    datos.entidad = entidad;
        		    datos.tipoPrograma = tipoPrograma;
        		    datos.programa = programa;
        		    datos.subPrograma = subPrograma;
        		    datos.proyecto = proyecto;
        		    datos.producto = producto;
        		    datos.accionId = accionId;
        		    datos.anho = anho;
        		    datos.version = version;
        		    datos.uMedida = unidadMedida;
        		    datos.cantFisica = totalFisico;
        		    datos.clase = clase;
        		    datos.cantFinanciera = totalFinanciero;

        		  	var info = JSON.stringify(datos);
        		    $.ajax({
        		        url: "ajaxInserts?accion=insAccionHasProducto",
        		        type: 'POST',
        		        dataType: 'json',
        		        data: info,
        		        contentType: 'application/json',
        		        mimeType: 'application/json',
        		        success: function (data) {
        		        	alert("Guardado!");
        		        	cargarTablaAccionHasProducto(accionId);
        		        	},
        		        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
        		        error: function(data,status,er) {
        		        	alert("Guardado");
        		        	cargarTablaAccionHasProducto(accionId);
        		        	}
        			 });
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

        			
        			

        			
        			
        		});
        		
        		$("body").on("click", ".modalAgregarHito",function(event){
        			event.stopPropagation();
        			event.preventDefault();
        			if ( $("#modalAgregarHito").length ) {
        				$("#modalAgregarHito").remove();
        			}
        			
        			var parametros = $(this).attr("parametros");
        		    var idParsed = parametros.split("-");                                                            
        			var institucionId=idParsed[0];
        			var lineaAccionId=idParsed[1];
        			var idDepartamento= idParsed[2];
        			var idDistrito= idParsed[3];
        			var accionId = idParsed[4];
        			var institucionId=idParsed[5];
        			var lineaAccionId=idParsed[6];
        			var idDepartamento= idParsed[7];
        			var idDistrito= idParsed[8];
        			
        			var accion = $.ajax({
        		    	url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getFactHitos2015Accion&accion_id='+accionId,
        		      	type:'get',
        		      	dataType:'json',
        		      	crossDomain:true,
        		      	async:false       
        		    }).responseText;		
        			accion=JSON.parse(accion);

        			var modalAgregarHito = "";

        			modalAgregarHito =	 '<div class="modal fade" role="dialog" id="modalAgregarHito" data-backdrop="static" data-keyboard="false">'+ 
        								    '<div class="modal-dialog modal-lg">'+ 
        								    
        								      '<div class="modal-content">'+ 
        								        '<div class="modal-header">'+ 
        								          '<button type="button" class="close modalHitoAvances" parametros="'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'-'+accionId+'-'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'">&times;</button>'+ 
        								          '<h4 class="modal-title">Cronograma de Entregables (Planificación de Actividades)</h4>'+ 
        								        '</div>'+ 
        								        '<div class="modal-body">'+ 
        								        
        									    	'<form role="form">'+
        										  	  '<div class="form-group">'+
        										  	    '<label for="departamento">Departamento</label>'+
        										  	    '<input type="text" class="form-control" id="departamento" value="'+accion[0].accion_departamento+'" disabled>'+
        										  	  '</div>'+
        										  	  '<div class="form-group">'+
        										  	    '<label for="distrito">Distrito</label>'+
        										  	    '<input type="text" class="form-control" id="distrito" value="'+accion[0].accion_distrito+'" disabled>'+
        										  	  '</div>'+										  	  
        										  	  '<div class="form-group">'+
        										  	    '<label for="accionHito">Acción</label>'+
        										  	    '<input type="text" class="form-control" id="accionHito" value="'+accion[0].accion+'" disabled>'+
        										  	  '</div>'+
        									    	'<form role="form">'+
        										  	  '<div class="form-group">'+
        										  	    '<label for="nombreHito">Nombre Hito</label>'+
        										  	    '<input type="text" class="form-control" id="nombreHito" placeholder="Introduzca nombre del hito">'+
        										  	  '</div>'+
        										  	  '<div class="form-group">'+
        										  	    '<label for="tipoHito">Tipo Hito</label>'+
        													'<select class="form-control" id="tipoHito">'+
        												  	  '<option value="Entregable">Entregable</option>'+
        												  	  '<option value="Intermedio">Intermedio</option>'+
        												  	  '<option value="Autonomo">Autonomo</option>'+
        												  	'</select>'+
        										  	  '</div>'+
        										  	  '<div class="form-group">'+
        										  	    '<label for="unidadMedidaHito">Unidad Medida</label>'+
        										  	    '<input type="text" id="unidadMedidaHito" class="form-control" placeholder="Unidad Medida">'+
        										  	  '</div>'+
        										  	  '<div class="form-group">'+
        										  	    '<label for="cantidadPrevistaHito">Cantidad Prevista</label>'+
        										  	    '<input type="text" class="form-control" id="cantidadPrevistaHito" placeholder="Cantidad Prevista">'+
        										  	  '</div>'+
        										  	  '<div class="form-group">'+
        										  	    '<label for="cantidadRealHito">Fecha de Entrega</label>'+
        										  	    '<input type="text" class="form-control" id="cantidadRealHito" placeholder="Fecha de Entrega">'+
        										  	  '</div>'+
        										  	  '<button type="submit" class="btn btn-success guardarHito">Guardar</button>'+
        										  	'</form>'+
        								        
        								        '</div>'+ 
        								        '<div class="modal-footer">'+ 
        								          '<button type="button" class="btn btn-default modalHitoAvances" parametros="'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'-'+accionId+'-'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'">Cerrar</button>'+ 
        								        '</div>'+ 
        								      '</div>'+ 
        								      
        								    '</div>'+ 
        								  '</div>';
        								
        																
        																
        			
        			$("body").append(modalAgregarHito);
        			$("#modalAgregarHito").modal('show');
        			
        		});
        		
        		$("body").on("click", ".guardarHito",function(event){
        			
        			var accionhito = $("#accionHito").val();
        			var nombreHito = $("#nombreHito").val();
        			var tipoHito = $("#tipoHito").val();
        			var unidadMedida = $("#unidadMedidaHito").val();
        			var cantidadPrevista = $("#cantidadPrevistaHito").val();
        			var cantidadReal = $("#cantidadRealHito").val();
        			var accion = "insHitoPrueba";
        			var obj= new Object();
        			
        			//aca como la clase
        			obj.accion = accionhito;
        			obj.nombreHito = nombreHito;
        			obj.tipoHito = tipoHito;		
        			obj.unidadMedida = unidadMedida;
        			obj.cantidadPrevista = cantidadPrevista;
        			obj.cantidadReal = cantidadReal;

        			 $.ajax({
        			        url: "ajaxInserts?accion="+accion,
        			        type: 'POST',
        			        dataType: 'json',
        			        data: JSON.stringify(obj),
        			        contentType: 'application/json',
        			        mimeType: 'application/json',
        			        success: function (data) {},
        			        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
        			        error: function(data,status,er) {}
        			 });

        			 $("#modalAgregarHito").modal('hide');
        		});
        		

        		
        	});


        	$("body").on("click", ".modalDeclararAvance",function(event){
        		event.stopPropagation();
        		event.preventDefault();
        		
        		if ( $("#modalDeclararAvance").length ) {
        			$("#modalDeclararAvance").remove();
        		}
        		
        		var parametros = $(this).attr("parametros");
        	    var idParsed = parametros.split("-");                                                            
        		var institucionId=idParsed[0];
        		var lineaAccionId=idParsed[1];
        		var idDepartamento= idParsed[2];
        		var idDistrito= idParsed[3];
        		var accionId = idParsed[4];
        		var institucionId=idParsed[5];
        		var lineaAccionId=idParsed[6];
        		var idDepartamento= idParsed[7];
        		var idDistrito= idParsed[8];
        		
        		var accion = $.ajax({
        	    	url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getFactHitos2015Accion&accion_id='+accionId,
        	      	type:'get',
        	      	dataType:'json',
        	      	crossDomain:true,
        	      	async:false       
        	    }).responseText;		
        		accion=JSON.parse(accion);

        		var modalDeclararAvance = "";

        		modalDeclararAvance =	 '<div class="modal fade" role="dialog" id="modalDeclararAvance" data-backdrop="static" data-keyboard="false">'+ 
        							    '<div class="modal-dialog modal-lg">'+ 
        							    
        							      '<div class="modal-content">'+ 
        							        '<div class="modal-header">'+ 
        							          '<button type="button" class="close modalHitoAvances" data-dismiss="modal" parametros="'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'-'+accionId+'-'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'">&times;</button>'+ 
        							          '<h4 class="modal-title">Declarar Avances</h4>'+ 
        							        '</div>'+ 
        							        '<div class="modal-body">'+ 
        							        
        						      			'<form role="form">'+
        							      		  '<div class="form-group">'+
        							      		    '<label for="departamento">Departamento</label>'+
        							      		    '<input type="text" class="form-control" id="departamento" value="'+accion[0].accion_departamento+'" disabled>'+
        							      		  '</div>'+
        							      		  '<div class="form-group">'+
        							      		    '<label for="distrito">Distrito</label>'+
        							      		    '<input type="text" class="form-control" id="distrito" value="'+accion[0].accion_distrito+'" disabled>'+
        							      		  '</div>'+
        							      		  '<div class="form-group">'+
        							      		    '<label for="cantidadAvances">Cantidad</label>'+
        							      		    '<input type="number" class="form-control" id="cantidadAvances" placeholder="Introduzca cantidad">'+
        							      		  '</div>'+
        							      		  '<div class="form-group">'+
        							      		    '<label for="url">Url</label>'+
        							      		    '<input type="url" class="form-control" id="url" placeholder="Introduzca URL">'+
        							      		  '</div>'+
        							      		  '<div class="form-group">'+
        							      		    '<label for="fecha">Fecha Avance</label>'+
        							      		    '<input type="date" class="form-control" id="fecha" placeholder="Fecha">'+
        							      		  '</div>'+
        							      		  '<div class="form-group">'+
        							      		    '<label for="coordenadas">Coordenadas Geográficas</label>'+
        							      		    '<table class="table">'+
        							      		    '<tr><td><input type="text" class="form-control" placeholder="Latitud"></td><td><input type="text" class="form-control" placeholder="Longitud"></td></tr>'+
        											'</table>'+
        							      		  '</div>'+
        							      		  '<div class="form-group">'+
        							      		    '<label for="codigoContratacion">Código Contratación</label>'+
        							      		    '<input type="text" class="form-control" id="codigoContratacion" placeholder="Código Contratación">'+
        							      		  '</div>'+
        							      		  '<div class="form-group">'+
        							      		    '<label for="codigoSinarh">Código SINARH</label>'+
        							      		    '<input type="text" class="form-control" id="codigoSinarh" placeholder="Código SINARH">'+
        							      		  '</div>'+
        							      		  '<button type="submit" class="btn btn-success guardarAvance">Guardar</button>'+
        						      			'</form>'+
        							        
        							        '</div>'+ 
        							        '<div class="modal-footer">'+ 
        							          '<button type="button" class="btn btn-default modalHitoAvances" parametros="'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'-'+accionId+'-'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'">Cerrar</button>'+ 
        							        '</div>'+ 
        							      '</div>'+ 
        							      
        							    '</div>'+ 
        							  '</div>';
        							
        															
        															
        		
        		$("body").append(modalDeclararAvance);
        		$("#modalDeclararAvance").modal('show');

        	});

        	$("body").on("click", ".guardarAvance",function(event){
        		var cantidadAvance = $("#cantidadAvances").val();
        		var url = $("#url").val();
        		//var fecha = $("#Fecha").val();
        		var accion = "insAvancePrueba";
        		var obj= new Object();
        		
        		//aca como la clase
        		obj.cantidadAvance = cantidadAvance;
        		obj.url = url;


        		 $.ajax({
        		        url: "ajaxInserts?accion="+accion,
        		        type: 'POST',
        		        dataType: 'json',
        		        data: JSON.stringify(obj),
        		        contentType: 'application/json',
        		        mimeType: 'application/json',
        		        success: function (data) {},
        		        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
        		        error: function(data,status,er) {}
        		 });

        		 $("#modalAgregarHito").modal('hide');

        	});

        	  
        	  
         
     
          
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
