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
        
<!--   <script src="frames/entidad.js" type="text/javascript"></script> -->
<script src="dist/canvasjs/canvasjs.min.js" type="text/javascript"></script>

</head>
<body class="skin-blue sidebar-mini sidebar-collapse">

       <div class="modal fade" id="myModal" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" style="width:90%;">
		    <div class="modal-content" >
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel1"></h4>
		      </div>
		      <div class="modal-body" id="editar-subprograma">
		     		
		     	<div class="nav-tabs-custom">
                <ul class="nav nav-tabs pull-right">
                  <li class="active"><a href="#tab_1-1" data-toggle="tab"><i class="glyphicon glyphicon-list-alt"></i></a></li>
                  <!--<li><a href="#tab_2-2" data-toggle="tab"><i class="glyphicon glyphicon-map-marker"></i></a></li>-->
                  <li><a href="#tab_3-2" data-toggle="tab"><i class="glyphicon glyphicon-stats"></i></a></li>
                    
                </ul>
                <div class="tab-content">
                  <div class="tab-pane active" id="tab_1-1">

                  </div><!-- /.tab-pane -->
                  <div class="tab-pane" id="tab_2-2">
               		<iframe width='100%' height='520' frameborder='0' src='http://geo.stp.gov.py/user/stp/viz/8f7c6480-2f1c-11e5-aaea-b6fa9714a3b6/embed_map' allowfullscreen webkitallowfullscreen mozallowfullscreen oallowfullscreen msallowfullscreen>
		     		</iframe>
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
		
		$("body").on("click", ".registro",function(event){
			var codigoRegistro = $(this).attr("codigoRegistro");
		    var idParsed = codigoRegistro.split("-");                                                            
			var institucion_id=idParsed[1];
			var linea_accion_id=idParsed[2];
			var unidad_medida= idParsed[3];
			var tituloModal="";
			var cuerpoModal="";
			var footerModal="";
			
			var registros = $.ajax({
		    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getFactHitos2015&institucion_id='+institucion_id+'&linea_accion_id='+linea_accion_id,
		      	type:'get',
		      	dataType:'json',
		      	crossDomain:true,
		      	async:false       
		    }).responseText;
			var elRegistro=JSON.parse(registros);
			
						
			cuerpoModal='<div class="table-responsive">'+
						'<table class="table table-hover">'+
							'<tr class="active"><td>Acción</td><td>Departamento</td><td>Distrito</td><td>U. Medida</td><td>Cantidad. Programado</td><td>Costo Total</td><td>Fecha Terminación</td><td>Estado</td><td>% Programado</td><td>% Ejecutado</td></tr>';
						var totalCantidadProgramada=0;
						tituloModal='<h3><center>'+elRegistro[0].institucion+'&nbsp;&nbsp;-&nbsp;&nbsp;'+elRegistro[0].linea_accion+'</center></h3>';
						for(var m=0; m<elRegistro.length;m++)
						{
								cuerpoModal+='<tr><td>'+elRegistro[m].accion+'</td><td>'+elRegistro[m].accion_departamento+'</td><td>'+elRegistro[m].accion_distrito+'</td><td>'+elRegistro[m].accion_unidad_edida+'</td><td>'+elRegistro[m].hito_cantidad_programado+'</td><td>'+elRegistro[m].accion_costo+'</td><td>'+elRegistro[m].hito_fecha_entrega+'</td><td>'+elRegistro[m].accion_status_fin+'</td><td>'+elRegistro[m].hito_porcentaje_programado+'</td><td>'+elRegistro[m].hito_porcentaje_ejecutado+'</td></tr>';
								totalCantidadProgramada+=elRegistro[m].hito_cantidad_programado;
								
						}
						totalCantidadProgramada=parseFloat(totalCantidadProgramada).toFixed(2);
						/*footerModal='<table class="table table-hover">'+
									'<tr class="active"><td>Total Cantidad Programada:</td><td>'+totalCantidadProgramada+'</td></tr>'+
									'</table>';*/
						cuerpoModal+='<tr class="active"><td colspan="2">Total Cantidad Programada: </td><td colspan="8">'+totalCantidadProgramada+'</td></tr>'+
									 '</table>'+
									 '</div>';
			
			$('#myModal').find(".modal-title").html(tituloModal);
			$('#myModal').find("#tab_1-1").html("");
			$('#myModal').find("#tab_2-2").html("");
			$('#myModal').find("#tab_3-2").html("");
			$('#myModal').find("#tab_1-1").html(cuerpoModal);
			//$('#myModal').find(".modal-footer").html(footerModal);
			
			var lineaAccionAcumuladoMes = $.ajax({
		    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getLineaAccionAcumuladoMes&institucion_id='+institucion_id+'&linea_accion_id='+linea_accion_id,
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
			lineaAccionAcumuladoMes = JSON.parse(lineaAccionAcumuladoMes);
			
			
			//grafico de total cantidad programada y total cantidad ejecutada
			$('#myModal').find("#tab_3-2").append('<div id="chartContainer" style="height:400px; margin:10px 100px 10px 100px;"></div>');
			dibujarLineaAccionAcumuladoMes(lineaAccionAcumuladoMes);
			
			function dibujarLineaAccionAcumuladoMes(lineaAccionAcumuladoMes){
				var dataPoints=[];
// 				var dia;
				var mes;
				var anho;
				
				function compare(a,b) {             
					  if (a.mes < b.mes)
					    return -1;
					  if (a.mes > b.mes)
					    return 1;
					  return 0;
					}

				lineaAccionAcumuladoMes=lineaAccionAcumuladoMes.sort(compare);
				
				for(var i = 0;i<lineaAccionAcumuladoMes.length; i++){
		 			dataPoints.push({ x: new Date( lineaAccionAcumuladoMes[i].mes), y: lineaAccionAcumuladoMes[i].cantidad_programada});

				}
					       
					
					var chart = new CanvasJS.Chart("chartContainer",
					{
						title: {
							text: "Programación del año" 
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
							name: 'views',
							type: "area",
							color: "rgba(0,75,141,0.7)",
							markerSize:8,
							dataPoints:dataPoints
						},
						{        
							indexLabelFontColor: "red",
							name: 'views',
							type: "area",
							color: "rgba(0,75,141,0.7)",
							markerSize:8,
							dataPoints:dataPoints
						}
					  ]
					});
					
			chart.render();
			}

    	
    	
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
		
		var entidadesjson = $.ajax({
	    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getEntidades',
	      	type:'get',
	      	dataType:'json',
	      	crossDomain:true,
	      	async:false       
	    }).responseText;
		var entidades=JSON.parse(entidadesjson);
		
		var eljson = $.ajax({
	    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getLineasAccion',
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
			$("#cuerpoTabla").append('<tr><td colspan="12" ><strong>'+entidades[i].institucion+'</strong></td></tr>');
			for(var j=0;j<el.length;j++){
				if (el[j].institucion_id==entidades[i].institucion_id){
					if (lineasDeAccion.indexOf(el[j].linea_accion_id)<0){
						lineasDeAccion.push(el[j].linea_accion_id);
						if(el[j].anho<="2014"){
							var anho1=el[j];
							var anho2;
							for(var k=0;k<el.length;k++){
								if (anho1.institucion_id==el[k].institucion_id && anho1.linea_accion_id==el[k].linea_accion_id && el[k].anho =="2015"){
									anho2=el[k];
								}
							}
							if (typeof anho1.cantidad_ejecutada_hoy==="undefined") {var anho1= new Object(); anho1.cantidad_ejecutada_hoy=""};
							if (typeof anho2.cantidad_ejecutada_hoy==="undefined") {var anho2= new Object(); anho2.cantidad_ejecutada_hoy="";anho2.suma_programada_anho="";anho2.suma_programada_hoy="";};
							if (anho2.suma_programada_anho>0){
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
								$("#cuerpoTabla").append('<tr class="'+porHejeClassRow+'"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#myModal" class="registro" codigoRegistro='+j+'-'+el[j].institucion_id+'-'+el[j].linea_accion_id+'-'+el[j].accion_unidad_medida+'> '+anho2.linea_accion+'</a></td><td>Gs.'+numeroConComa((anho2.costo_programado_anho/1000000).toFixed(0))+'</a></td><td>'+anho2.accion_unidad_medida+'</td><td>'+numeroConComa(anho2.linea_accion_meta)+'</td><td></td><td class="cell-bordered2">'+numeroConComa(anho2.suma_programada_anho)+'</td><td class="'+sumporAClass+'">'+porcentajeAnho+'</td><td>'+numeroConComa(anho2.suma_programada_hoy)+'</td><td class="cell-bordered2">'+numeroConComa(anho2.cantidad_ejecutada_hoy)+'</td><td class="text-center '+porHejeClass+'">'+porcentajeHoyEje+'</td></tr>');
															
								
								
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
						if(el[j].anho>="2015"){
							var anho2=el[j];
							var anho1;
							for(var k=0;k<el.length;k++){
								if (anho1.institucion_id==el[k].institucion_id && anho1.linea_accion_id==el[k].linea_accion_id && el[k].date_part =="2014"){
									anho1=el[k];
								}
							}
							if (typeof anho1.cantidad_ejecutada_hoy==="undefined") {var anho1= new Object(); anho1.cantidad_ejecutada_hoy="";};
							if (typeof anho2.cantidad_ejecutada_hoy==="undefined") {var anho2= new Object(); anho2.cantidad_ejecutada_hoy="";anho2.suma_programada_anho="";anho2.suma_programada_hoy="";};
							if (anho2.suma_programada_anho>0){
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
							$("#cuerpoTabla").append('<tr class="'+porHejeClassRow+'"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#myModal" class="registro" codigoRegistro='+j+'-'+el[j].institucion_id+'-'+el[j].linea_accion_id+'-'+el[j].accion_unidad_medida+'>'+anho2.linea_accion+'</a></td><td>Gs.'+numeroConComa((anho2.costo_programado_anho/1000000).toFixed(0))+'</td><td>'+anho2.accion_unidad_medida+'</td><td>'+numeroConComa(anho2.linea_accion_meta)+'</td><td></td><td class="cell-bordered2">'+numeroConComa(anho2.suma_programada_anho)+'</td><td class="'+sumporAClass+'">'+porcentajeAnho+'</td><td>'+numeroConComa(anho2.suma_programada_hoy)+'</td><td class="cell-bordered2">'+numeroConComa(anho2.cantidad_ejecutada_hoy)+'</td><td class=" text-center '+porHejeClass+'">'+porcentajeHoyEje+'</td></tr>');
							
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
                  	Lineas De Acción por Entidad
                  </th>
                  <th></th><th></th><th class="cell-bordered2" rowspan="2">Meta 2015</th><th rowspan="2"></th><th rowspan="2">Programación 2015</th><th rowspan="2">%  Programado</th>
                  <th colspan="3" class="text-center cell-bordered2">A la fecha</th>
                </tr>
                <tr style="background-color: white;">
                  <th></th>
                  <th>Costo (MM)</th>
                  <th>Unidad Medida</th>
                                
         
                               
                  <th class="cell-bordered2">Programación</th>
                  <th >Ejecución</th>
                 <!-- <th>% </th> --> 
                  <th>Desempeño</th>
                  
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

    <!-- AdminLTE for demo purposes -->

    <script src="dist/js/demo.js" type="text/javascript"></script>
        <%  } else { %>
				<p>Favor Iniciar Sesion</p>
			<%  } %>

    
  </body>
</html>
