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
		<script type="text/javascript" src="frames/lineasProgramacionAvance.js"></script>
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
		<link href="bootstrap/css/bootstrapslider.css" rel="stylesheet">
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="plugins/datatables/css/jquery.dataTables.min.css" rel="stylesheet">
	    <link href="plugins/datatables/css/buttons.dataTables.min.css" rel="stylesheet"> 
	</head>
	<body class="skin-blue sidebar-mini">
		<% AttributePrincipal user = (AttributePrincipal) request.getUserPrincipal();%>
		<% Map attributes = user.getAttributes(); 
		 if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){

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
			getPeriodo(periodoActual);
			ObtenerInstitucion();
			
			$("body").on("click", "#generarDatos",function(event){	
			   	var periodoSeleccionado = $("#periodoSeleccion option:selected").val();
			   	var institucionSeleccionado = $("#selectorDeInstitucion option:selected").val();
			   	var etiquetaSeleccionado = $("#etiquetaSeleccion option:selected").val();

			   	renderLineas(periodoSeleccionado, etiquetaSeleccionado, institucionSeleccionado); 
			});
			
			/* $("body").on("click", "#chkMostrarOcultar",function(event){			
				//OcultarRegistrosBorrados();
			});		 */
									
			<%-- $("body").on("change", "#etiquetaSeleccion",function(event){	
				var periodoSeleccionado = $("#periodoSeleccion option:selected").val();
			 	var etiquetaSeleccionado = $("#etiquetaSeleccion option:selected").val();
			 	var institucionSeleccionado = $("#selectorDeInstitucion option:selected").val();

			 	renderLineas(periodoSeleccionado, etiquetaSeleccionado, institucionSeleccionado); 
			   	
			   	var objeto = new Object();			
				objeto.correo = '<%=user.getName()%>';
				objeto.ultimaEtiquetaId = etiquetaSeleccionado;
				
				var info = JSON.stringify(objeto);		  	
			    $.ajax({
			        url: "/ajaxUpdate?accion=actUltEtiqueta",
			        type: 'POST',
			        dataType: 'json',
			        data: info,
			        contentType: 'application/json',
			        mimeType: 'application/json',
			        success: function (data) {
			        	
			        	},

			        error: function(data,status,er) {
			        	
			        	}
				 });
			   	
			   
			}); --%>
						
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
			<aside class="main-sidebar">
				<%@ include file="/frames/main-sidebar.jsp"%>
			</aside>
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
	
			<section class="content">
			
			
			
			<div class="box box-primary">
            <div class="box-header ui-sortable-handle" style="cursor: move;">
              <h3 class="box-title">Seleccione una Institución</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
				<div class="row">
					<div class="col-md-6">
						<select class="form-control" id="selectorDeInstitucion">
							<option value='0' selected>Todos</option>
						</select> 
					</div>									
					<div class="col-md-6">
					</div>										
				</div><!-- fin row de selectores -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer clearfix no-border">
				<button type="button" class="btn btn-box btn-primary" id="generarDatos"><p align="center">Visualizar Datos</p></button>
            </div>
          </div>
			
			<div id="programacion"></div>

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
	    <!-- <script src="plugins/datatables/Plugins/api/sum().js"></script> -->
		<script src="plugins/datatables/dataTables.buttons.min.js" type="text/javascript"></script>
		<script src="plugins/datatables/buttons.flash.min.js" type="text/javascript"></script>
		<script src="plugins/datatables/jszip.min.js" type="text/javascript"></script>
		<script src="plugins/datatables/pdfmake.min.js" type="text/javascript"></script>
		<script src="plugins/datatables/vfs_fonts.js" type="text/javascript"></script>
		<script src="plugins/datatables/buttons.html5.min.js" type="text/javascript"></script>
		<script src="plugins/datatables/buttons.print.min.js" type="text/javascript"></script>
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
	
	    <!-- AdminLTE for demo purposes -->
	    <script src="dist/js/demo.js" type="text/javascript"></script>
       <%  } else { %>
			<p>Favor Iniciar Sesion</p>
		<%  } %>
		<!-- a href="#" data-toggle="tooltip" title="Some tooltip text!">Hover over me</a-->
				
				
		<%  } else { %>
    		<script type="text/javascript">window.location = "http://spr.stp.gov.py/";</script>
		<% } %> 
</body>
</html>
