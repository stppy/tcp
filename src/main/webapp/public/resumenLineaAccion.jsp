<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
	<head>
		<!--  ISO-8859-1 -->
		<script src="plugins/jQuery/jQuery-2.1.3.min.js"></script>
		<%@ include file="frames/head.jsp" %>		
		
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<title> Plan de Acción</title>		
		<script type="text/javascript" src="frames/resumenLineaAccion.js"></script>
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
			textarea { text-transform: uppercase; }
		</style>
		<link type="text/css" rel="stylesheet" href="tablero_files/tooltip.css">
	</head>
	<body class="skin-blue sidebar-mini sidebar-collapse">
			
		<script>

		$( document ).ready(function() {
			
			var periodoActual = 2017;
			
			renderLineasEstrategicas(periodoActual); 
			getPeriodo();
			
		});

		$("body").on("change", "#periodoSeleccion",function(event){	
		   	periodoSeleccionado = $("#periodoSeleccion option:selected").val();
		   	renderLineasEstrategicas(periodoSeleccionado); 
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
			<%@ include file="frames/control-sidebar.jsp"  %>
	    </aside><!-- /.control-sidebar -->
	    <!-- Add the sidebar's background. This div must be placed
	         immediately after the control sidebar -->
	    <div class='control-sidebar-bg'></div>
	
	    </div><!-- ./wrapper -->
	
	    <!-- Bootstrap 3.3.2 JS -->
	    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	    <!-- AdminLTE App -->
	    <script src="dist/js/app.min.js" type="text/javascript"></script>	  

</body>
</html>
