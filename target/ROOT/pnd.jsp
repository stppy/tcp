<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="org.jasig.cas.client.authentication.AttributePrincipalImpl"%>
<%@ page import="py.gov.stp.mh.test.Client" %>
<%@ page import="py.gov.stp.mh.tools.SqlHelper" %>
<%@ page import="py.gov.stp.mh.clasificadores.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
  <head>
  <!--  ISO-8859-1 -->
  <%@ include file="/frames/head.jsp" %>
<!--   <script src="frames/entidad.js" type="text/javascript"></script> -->
 <script src="dist/canvasjs/canvasjs.min.js" type="text/javascript"></script>
</head>
<body class="skin-blue sidebar-mini">
<% AttributePrincipalImpl user = (AttributePrincipalImpl) request.getUserPrincipal();
if (user != null) { %>
  <!-- piwik -->
  <script type="text/javascript">
  var _paq = _paq || [];
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
</script>
<noscript><p><img src="//infra.stp.gov.py/monitoreoweb/piwik.php?idsite=4" style="border:0;" alt="" /></p></noscript>
<!-- /piwik -->


<style>
textarea { text-transform: uppercase; }
</style>
<script>
var entidad;
var entidades;

</script>
   <script>
    $(document).ready(function(){
    	var usuarios = $.ajax({
			url:'http://spr.stp.gov.py/ajaxSelects?accion=getUsuarios&usuario=<%=user.getName()%>',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		usuarios = JSON.parse(usuarios);
		usuarios = usuarios.usuarios;
		$("#nombreUsuario").append(usuarios[0].correo+" ("+usuarios[0].nivel_id+", "+usuarios[0].entidad_id+")");
		$("#PerfilUsuario").append(usuarios[0].nombre+" ("+usuarios[0].nivel_id+", "+usuarios[0].entidad_id+")");
    	
    	function dibujarGrafico(metas, indicador){
    		var dataPoints=[];
    		var dia;
    		var mes;
    		var anho;
    		
    		for(i = 0;i<metas.length; i++){
     			dataPoints.push({ x: new Date( metas[i].vencimiento), y: metas[i].cantidad});
    		}
    			
    		
    			var chart = new CanvasJS.Chart("chartContainer-"+indicador,
    			{
    				title: {
    					text: "Evolucion del Indicador"
    				},
    	                        animationEnabled: true,
    				axisX:{      
    					valueFormatString: "YYYY" ,
    					interval: 1,
    					intervalType: "year",
    					labelAngle: -50,
    					labelFontColor: "rgb(0,75,141)",
    					//minimum: new Date(2000,01,01)
    				},
    				axisY: {
    					title: "",
    					interlacedColor: "#F0FFFF",
    					tickColor: "azure",
    					titleFontColor: "rgb(0,75,141)"
    					//valueFormatString: "#M,,.",
    					//interval: 100000000
    				},
    				data: [
    				{        
    					indexLabelFontColor: "darkSlateGray",
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
    	
    	  //$("body").on("click", "#tituloListaPnd",function(event){
    		  $("#lista-pnd").html("");
    	      	var estrategias = $.ajax({
    	        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getEstrategias',
    	          	type:'get',
    	          	dataType:'json',
    	          	async:false       
    	        }).responseText;

    	    	estrategias = JSON.parse(estrategias);
    	    	estrategias = estrategias.estrategias;
    	    	var i =0;
    	    	for(i = 0;i<estrategias.length; i++){
    	    		$("#lista-pnd").append(' <!-- pilares -->'+
  		                  '<div class="box box-info">'+
		                    '<div class="box-header with-border">'+
		                      '<h3 class="box-title tituloEstrategiaPnd" id="" estrategia="'+estrategias[i].codigoPilar+'">'+estrategias[i].pilarNombre+'</h3>'+
		                      '<div class="box-tools pull-right">'+
		                      '(Estrategia PND)'+
		                       '     <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>'+
		                      '</div>'+
		                    '</div><!-- /.box-header -->'+
		                    '<div class="box-body lista-objetivos" id="estrategia-contenedor-'+estrategias[i].codigoPilar+'" estrategia="'+estrategias[i].codigoPilar+'" style="display:block;" >'+
		                    '</div>'+
		                   '</div>'); 
    	    	}
    	    	//event.stopPropagation();
    	 // });
    	  $("body").on("click", ".tituloEstrategiaPnd",function(event){
    		  
    		  //var estrategia=$(this).parent().parent().parent().attr("id");
    		  var estrategia=$(this).attr("estrategia");
    		  $("div [class=lista-objetivos][estrategia="+estrategia+"]").html("");
    	      	var objetivos = $.ajax({
    	        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getObjetivosEstrategicos&estrategia='+estrategia,
    	          	type:'get',
    	          	dataType:'json',
    	          	async:false       
    	        }).responseText;
    	      	$("#estrategia-contenedor-"+estrategia).html("");
    	      	objetivos = JSON.parse(objetivos);
    	      	objetivos = objetivos.objetivos;
    	    	var i =0;
    	    	for(i = 0;i<objetivos.length; i++){
    	    		$("#estrategia-contenedor-"+estrategia).append(' <!-- objetivos -->'+
  		                  '<div class="box box-success ">'+
		                    '<div class="box-header with-border">'+
		                      '<h3 class="box-title tituloObjetivoPnd" id="" objetivo="'+objetivos[i].objetivo_id+'">'+objetivos[i].objetivoNombre+'</h3>'+
		                      '<div class="box-tools pull-right">'+
		                      '(Objetivo Estrategico PND)'+
		                       '     <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>'+
		                      '</div>'+
		                    '</div><!-- /.box-header -->'+
		                    '<div class="box-body lista-indicadores" style="display:block;" id="indicador-contenedor-'+objetivos[i].objetivo_id+'">'+
		                    '</div>'+
		                   '</div>'); 
    	    	}
    	    	event.stopPropagation();
    	    	
    	  });
    	  $("body").on("click", ".tituloObjetivoPnd",function(event){
    		  var objetivo=$(this).attr("objetivo");
    		  $("div [class=lista-indicadores][objetivo="+objetivo+"]").html("");
    	      	var indicadores = $.ajax({
    	        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getIndicadoresPnd&objetivo='+objetivo,
    	          	type:'get',
    	          	dataType:'json',
    	          	async:false       
    	        }).responseText;
    	      	$("#indicador-contenedor-"+objetivo).html("");
    	      	indicadores = JSON.parse(indicadores);
    	      	indicadores = indicadores.indicadores;
    	    	var i =0;
    	    	for(i = 0;i<indicadores.length; i++){
    	    		$("#indicador-contenedor-"+objetivo).append(' <!-- objetivos -->'+
  		                  '<div class="box box-warning ">'+
		                    '<div class="box-header with-border">'+
		                      '<h3 class="box-title tituloIndicadorPnd" id="" indicador="'+indicadores[i].id+'">'+indicadores[i].nombre+'</h3>'+
		                      '<div class="box-tools pull-right">'+
		                      '(Indicador PND)'+
		                       '     <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>'+
		                      '</div>'+
		                    '</div><!-- /.box-header -->'+
		                    '<div class="box-body lista-metas" style="display:block;" id="metas-contenedor-'+indicadores[i].id+'">'+
		                    '</div>'+
		                   '</div>'); 
    	    	}
    	    	event.stopPropagation();
    	    	
    	  });
    	  $("body").on("click", ".tituloIndicadorPnd",function(event){
    		  var indicador=$(this).attr("indicador");
    		  $("div [class=lista-metas][indicador="+indicador+"]").html("");
    	      	var metas = $.ajax({
    	        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getMetasPnd&indicador='+indicador,
    	          	type:'get',
    	          	dataType:'json',
    	          	async:false       
    	        }).responseText;
    	      
    	      	metas = JSON.parse(metas);
    	      	metas = metas.metas;
    	    	var i =0;
    	    	$("#metas-contenedor-"+indicador).html("");
    	    	var tabla= '<table class="table table-striped table-bordered  table-hover">'+
				'<tr>'+
				'<th>fecha</th>'+
				'<th>cantidad</th>'+
			'</tr>';
    	    	  
    	    	for(i = 0;i<metas.length; i++){
		        	tabla+='<tr>'+
		            	'<td>'+metas[i].vencimiento+'</td>'+
		               	'<td>'+metas[i].cantidad+'</td>'+
		               '</tr>';
    	    	}
    	    	tabla+='</table>'+
    	    	'</div>';
    	    	$("#metas-contenedor-"+indicador).append('<div id="chartContainer-'+indicador+'" style="height: 300px; width: 100%;">');
    	    	//$("#metas-contenedor-"+indicador).append(tabla);
    	    	dibujarGrafico(metas, indicador);

    	    	event.stopPropagation();
    	    	
    	  });
    	  
    	  
    });
    		  
    </script>
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
          <ol class="breadcrumb">
            <li id="f1c2"><i class="fa fa-dashboard"></i> </li>
            <li id="f2c2" ></li>
            <li id="f3c2" ></li>
            <li id="f4c2" ></li>
            <li id="f5c2"></li>
            <li id="f6c2" class="active"></li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content" id="programacion">
          <!-- Info row de buscador de productos -->
         <div class="row">
			<%@ include file="/frames/pnd-lista.jsp" %>
          </div><!-- /.row -->

          
          
               
          
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
		<%@ include file="/frames/control-sidebar.jsp" %>
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

    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="dist/js/pages/dashboard2.js" type="text/javascript"></script>

    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js" type="text/javascript"></script>

     <%  } else { %>
				<p>Favor Iniciar Sesion</p>
			<%  } %>
  </body>
</html>
