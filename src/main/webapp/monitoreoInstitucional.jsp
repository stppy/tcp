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
		<script type="text/javascript" src="frames/monitoreoInstitucional.js"></script>
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
			usuarioRolCas="<%=attributes.get("role_id_tablero") %>";
			var usuarios = $.ajax({
				url:'/tablero/ajaxSelects?action=getUsuarios&usuario=<%=user.getName()%>',
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
						
			var periodoActual = 2017;
			
			
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
								
			$('#mostrarOcultarPeriodo').html(periodoCuerpo);

								
		 	var periodoSeleccionado = $("#periodoSeleccion option:selected").val();
		 	var etiquetaSeleccionado = $("#etiquetaSeleccion option:selected").val();
			
			
			renderLineasEstrategicas(periodoSeleccionado,etiquetaSeleccionado); 
			renderFlow(periodoSeleccionado,etiquetaSeleccionado);
			//getPeriodo();
			
			
			
			
		});
		
		$("body").on("change", "#periodoSeleccion",function(event){	
		 	var periodoSeleccionado = $("#periodoSeleccion option:selected").val();
		 	var etiquetaSeleccionado = $("#etiquetaSeleccion option:selected").val();
		   	renderLineasEstrategicas(periodoSeleccionado,etiquetaSeleccionado);
		   	renderFlow(periodoSeleccionado);
		});
		
		$("body").on("change", "#etiquetaSeleccion",function(event){	
		 	var periodoSeleccionado = $("#periodoSeleccion option:selected").val();
		 	var etiquetaSeleccionado = $("#etiquetaSeleccion option:selected").val();

		   	renderLineasEstrategicas(periodoSeleccionado,etiquetaSeleccionado);
		   	renderFlow(periodoSeleccionado);
		   
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
		    <%-- <%if (attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("0")){%> --%>
			<aside class="main-sidebar collapse">
				<%@ include file="/frames/main-sidebar.jsp"%>
			</aside>
			
			<script type="text/javascript">
				$(document).ready(function(){
					var screenSizes = $.AdminLTE.options.screenSizes;
					 
				    $("#sideBar").click(function(){
				    	//Enable sidebar push menu
						if ($(window).width() > (screenSizes.sm - 1)) {
							$("body").toggleClass('sidebar-collapse');
						} else {
							//Handle sidebar push menu for small screens
							if ($("body").hasClass('sidebar-open')) {
								$("aside").addClass('collapse');
							} else {
								if($("aside").hasClass('collapse')){
									$("aside").removeClass('collapse');
								}
							}
						}
				    });
				});
			</script>
			<%-- 	   <% } %>  --%> 
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
		<!-- Content Header (Page header) -->
			<section class="content-header">
				<!-- h1>
					<small>
						<--  Titulo, donde antes estaba dashboard ->
					</small>
				</h1-->
				<div class="row">        	
					<div class="col-md-12" id="mostrarOcultarPeriodo">
					</div>					
				</div>
			</section>
	
	<!-- Main content -->
			<section class="content" id="programacion">
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
					</div><!--</div>-->
				</div><!-- /.row -->
				<div class="row">
					<ul id="flow" class="timeline">
						<!-- <li class="time-label"><span class="bg-red">2017-05-31</span></li>
						<li><i class="fa fa-envelope bg-blue"></i>    
							<div class="timeline-item"
								><span class="time"><i class="fa fa-clock-o"></i> 12:05</span>
								<h3 class="timeline-header"><a href="#">Soluciones habitacionales</a></h3>        
								<div class="timeline-body">SENAVITAT ha realizado Construcción de viviendas con servicios básicos alcanzando 120 Viviendas en el distrito TAVAI del departamento de CAAZAPA<br>SENAVITAT ha realizado Construcción de viviendas con servicios básicos alcanzando 40 Viviendas en el distrito CARLOS ANTONIO LOPEZ del departamento de ITAPUA</div>
								<div class="timeline-footer"><a class="btn btn-primary btn-xs">Ver evidencias</a></div>   
							</div>
						</li>
						<li name="2017-04-05" class="time-label"><span class="bg-red">2017-04-05</span></li>
						<li><i class="fa fa-envelope bg-blue"></i>
						    <div class="timeline-item">
						    	<span class="time"><i class="fa fa-clock-o"></i> 12:05</span>
						         <h3 class="timeline-header"><a name="2" href="#">Planes de ordenamiento territorial</a></h3>
						         <div class="timeline-body">STP ha realizado Asistencia para elaboración de planes de ordenamiento territorial alcanzando 0 Planes en el distrito A DEFINIR del departamento de CENTRAL</div>
						         <div class="timeline-footer"><a class="btn btn-primary btn-xs">Ver evidencias</a></div>
						    </div>
						</li>
						<li><i class="fa fa-envelope bg-blue"></i>
							<div class="timeline-item">
								<span class="time"><i class="fa fa-clock-o"></i> 12:05</span>
								<h3 class="timeline-header"><a href="#">Planes de ordenamiento territorial</a></h3>
								<div class="timeline-body">STP ha realizado Asistencia para elaboración de planes de ordenamiento territorial alcanzando 3 Planes en el distrito CORONEL OVIEDO del departamento de CAAGUAZU<br>STP ha realizado Asistencia para elaboración de planes de ordenamiento territorial alcanzando 0 Planes en el distrito A DEFINIR del departamento de CENTRAL<br>STP ha realizado Asistencia para elaboración de planes de ordenamiento territorial alcanzando 1 Planes en el distrito A DEFINIR del departamento de CENTRAL</div>
								<div class="timeline-footer"><a class="btn btn-primary btn-xs">Ver evidencias</a></div>
							</div>
						</li> -->
					</ul>
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
		<a href="#" data-toggle="tooltip" title="Some tooltip text!">Hover over me</a>
				
</body>
</html>
