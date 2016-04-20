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
<!--   <script src="frames/entidad.js" type="text/javascript"></script> -->



<meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <title> Plan de Acción</title>
        <link rel="stylesheet" type="text/css" href="tablero_files/pivot.css">
        <script type="text/javascript" src="tablero_files/d3.js"></script>
        <script type="text/javascript" src="tablero_files/jsapi"></script>
        <script type="text/javascript" src="tablero_files/jquery-1.js"></script>
        <script type="text/javascript" src="tablero_files/jquery-ui-1.js"></script>
        <script type="text/javascript" src="tablero_files/pivot.js"></script>
        <script type="text/javascript" src="tablero_files/gchart_renderers.js"></script>
        <script type="text/javascript" src="tablero_files/d3_renderers.js"></script>
        <script type="text/javascript" src="tablero_files/jquery.js"></script>
        <style>
            * {font-family: Verdana;}
            .node {
              border: solid 1px white;
              font: 10px sans-serif;
              line-height: 12px;
              overflow: hidden;
              position: absolute;
              text-indent: 2px;
            }
        </style>
    <link type="text/css" rel="stylesheet" href="tablero_files/orgchart.css">
    <link type="text/css" rel="stylesheet" href="tablero_files/annotatedtimeline.css">
    <link type="text/css" rel="stylesheet" href="tablero_files/imagesparkline.css">
    <link type="text/css" rel="stylesheet" href="tablero_files/tooltip.css">
    <!--  <script src="jquery-1.11.2.min" type="text/javascript"></script> -->
</head>
<body class="skin-blue sidebar-mini">
<% AttributePrincipal user = (AttributePrincipal) request.getUserPrincipal();%>
<% Map attributes = user.getAttributes(); 
if (user != null) { %>

<script>
$( document ).ready(function() {
	var entidadCas = "";
	entidadCas ="<%=attributes.get("entidad") %>";
	usuarioRolCas="<%=attributes.get("role_id") %>";
	var usuarios = $.ajax({
		url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getUsuarios&usuario=<%=user.getName()%>',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	usuarios = JSON.parse(usuarios);
	usuarios = usuarios.usuarios;
	
	$(".skin-blue.sidebar-mini").addClass("sidebar-collapse");
	$("#nombreUsuario").append(usuarios[0].correo+" ("+usuarios[0].nivel_id+", "+usuarios[0].entidad_id+")");
	$("#PerfilUsuario").append(usuarios[0].nombre+" ("+usuarios[0].nivel_id+", "+usuarios[0].entidad_id+", "+entidadCas+")");
		var i=parseInt(0);
		/*var datosNiveles = $.ajax({
	        url:'http://spr.stp.gov.py/ajaxSelects?accion=getNiveles&nivel='+usuarios[0].nivel_id,
	        type:'get',
	        dataType:'json',
	        async:false       
	      }).responseText;
	      datosNiveles = JSON.parse(datosNiveles);
	      datosNiveles.niveles;
	      
	     var datosEntidad = $.ajax({
	          url:'http://spr.stp.gov.py/ajaxSelects?accion=getEntidad&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id,
	          type:'get',
	          dataType:'json',
	          async:false       
	        }).responseText;
	        datosEntidad = JSON.parse(datosEntidad);
	        datosEntidad=datosEntidad.entidades;
	        
	     for (i=0;i<datosEntidad.length;i++){
	    	 if (datosEntidad[i].nivel==usuarios[0].nivel_id && datosEntidad[i].entidad==usuarios[0].entidad_id)
	    		 break;
	     }
*/
	     
	});
	     </script>
 <!-- Piwik -->
<script type="text/javascript">
  var _paq = _paq || [];
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {
    var u="//infra.stp.gov.py/monitoreoweb/";
    _paq.push(['setTrackerUrl', u+'piwik.php']);
    _paq.push(['setSiteId', 20]);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
  })();
</script>
<noscript><p><img src="//infra.stp.gov.py/monitoreoweb/piwik.php?idsite=20" style="border:0;" alt="" /></p></noscript>
<!-- End Piwik Code -->


<style>
textarea { text-transform: uppercase; }
</style>
    <div class="wrapper">

      <header class="main-header">
		  <%@ include file="/frames/mainheader.jsp" %>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <%-- <%if (attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("0")){%> --%>
	      <aside class="main-sidebar">
	  			 <%@ include file="/frames/main-sidebar.jsp"%>
	      </aside>
 <%-- 	   <% } %>  --%>
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
	              <h3 class="box-title" id="tituloTipoPrograma">
	                Lineas de Accion Por institucion
	              </h3> 
	              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	              </div>
	            </div>
	            <div class="box-body" >
	            
	          <table class="table table-striped table-bordered table-hover" id ="tablaLineasPorInstitucion">

	  			</table>
	  			
	            </div>
			   </div>
			   </div>
			<!--</div>-->
        
          
          </div><!-- /.row -->
   
   <script type="text/javascript">
		$( document ).ready(function() {
			function numeroConComa(x) {
				if (isNaN(x) || x == "Infinity"){
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
			
					
			var lineasEstrategicas = $.ajax({
				url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getLineaEstrategica',
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			lineasEstrategicas = JSON.parse(lineasEstrategicas);
			lineasEstrategicas=lineasEstrategicas.sort(orden);
			
/* 			var unidadMedida = $.ajax({
				url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getUnidadMedida',
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			unidadMedida = JSON.parse(unidadMedida);
			*/		
			var instituciones = $.ajax({
				url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getInstitucion',
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;		
			instituciones=JSON.parse(instituciones);
			instituciones=instituciones.sort(orden); 
			
			
			var lineasProgramadas = $.ajax({
				url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getResumenLineasAccionProgramacion',
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			lineasProgramadas = JSON.parse(lineasProgramadas);
			lineasProgramadas=lineasProgramadas.sort(lineaAccionOrden);
			

			function renderAccion(estrategia){
			
			var tablaInstituciones="";
			var tempInstituciones="";
			var tempInstLineas="";
			var flagIns=0;
			var clase="";
			
 				for(var m=0; m<instituciones.length;m++)
				{ 
					//tempInstituciones = '<tr><td colspan="7"><strong>'+instituciones[m].sigla+'</strong></td></tr>';
					  for(var n=0; n<lineasProgramadas.length;n++)
						{
						  if ( instituciones[m].id==lineasProgramadas[n].institucionId &&  lineasProgramadas[n].lineaAccionEstratagiaId==estrategia){
							  if (flagIns == 0){
								  
									tempInstituciones = '<tr><td colspan="12"><strong>'+lineasProgramadas[n].institucionSigla+'</strong></td></tr>'+
														'<tr>'+
														  	'<th rowspan="3" class="text-center" style="vertical-align: middle;">Línea de Acción</th>'+
														  	'<th rowspan="3" class="text-center" style="vertical-align: middle;">Unidad de Medida</th>'+
														  	'<th colspan="5" class="text-center">Plan de Acción 2016</th>'+
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
													    '</tr>';
									flagIns++;						  
							  }
							  clase="";
							  
							  if ((lineasProgramadas[n].cantidadAnho/lineasProgramadas[n].meta)*100>=90 && lineasProgramadas[n].meta != 0){
								  clase="bg-green-active color-palette"; 
							  }else if((lineasProgramadas[n].cantidadAnho/lineasProgramadas[n].meta)*100>=70 && lineasProgramadas[n].meta != 0){
								  clase="bg-yellow-active color-palette"; 
							  }else{
								  clase="bg-red-active color-palette";
							  }
							  
							  tempInstLineas += '<tr>'+
							  '<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">'+lineasProgramadas[n].lineaAccionNombre+'</a></td>'+
							  '<td>'+lineasProgramadas[n].lineaAccionUnidadMedidaNombre+'</td>'+
							  '<td>'+numeroConComa(lineasProgramadas[n].meta)+'</td>'+
							  '<td>'+numeroConComa(lineasProgramadas[n].cantidadAnho)+'</td>'+
							  '<td class="'+clase+'">'+numeroConComa(((lineasProgramadas[n].cantidadAnho/lineasProgramadas[n].meta)*100).toFixed(2))+'</td>'+
							  '<td>'+numeroConComa(lineasProgramadas[n].cantDest)+'</td>'+
							  '<td>'+numeroConComa((lineasProgramadas[n].inversionEstimada/1000000).toFixed(2))+'</td>'+
							  '<td>'+numeroConComa(lineasProgramadas[n].cantidadHoy)+'</td>'+
							  '<td>'+numeroConComa(lineasProgramadas[n].cantidadAvance)+'</td>';
							  
							  if (clase!="bg-red-active color-palette"){
								  clase="";
								  if ((lineasProgramadas[n].cantidadAvance/lineasProgramadas[n].cantidadHoy)*100>=90 && lineasProgramadas[n].cantidadHoy != 0){
									  clase="bg-green-active color-palette"; 
								  }else if((lineasProgramadas[n].cantidadAvance/lineasProgramadas[n].cantidadHoy)*100>=70 && lineasProgramadas[n].cantidadHoy != 0){
									  clase="bg-yellow-active color-palette"; 
								  }else{
									  clase="bg-red-active color-palette";
								  }
							  }
							  
							  
							  tempInstLineas += '<td class="'+clase+'">'+numeroConComa(((lineasProgramadas[n].cantidadAvance/lineasProgramadas[n].cantidadHoy)*100).toFixed(2))+'</td>'+
							  '<td>'+numeroConComa(lineasProgramadas[n].cantDestinatarioReal)+'</td>'+
							  '<td>'+numeroConComa((lineasProgramadas[n].costoAc/1000000).toFixed(2))+'</td>'+
							  '</tr>';
						  }
						}

					  if (flagIns>0){
						  tablaInstituciones+=tempInstituciones+tempInstLineas;
						  
					  }
					  tempInstituciones="";tempInstLineas="";flagIns=0;
				}

			 return tablaInstituciones;
			}
			
			function renderLineasEstrategicas(){
				var contenidoEnRow="";
				var contenidoEnRowTemp="";
				
				for(var l=0; l<lineasEstrategicas.length;l++){
					var lineasDeEstrategia="";
					lineasDeEstrategia=renderAccion(lineasEstrategicas[l].id)
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
				            
				          '<table class="table table-striped table-bordered table-hover tablaLineasPorInstitucion">'+
				          
				          lineasDeEstrategia+
				  			'</table>'+
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
			
			
			renderLineasEstrategicas(); 
			
			
			

		})
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
