<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="org.jasig.cas.client.authentication.AttributePrincipalImpl"%>
<%@ page import="org.jasig.cas.client.authentication.AttributePrincipal"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %> 
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/frames/head.jsp" %>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Bootstrap 3.3.2 JS -->
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<!-- Bootstrap 3.3.2 CSS -->
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	
</head>
<body class="skin-blue sidebar-mini sidebar-collapse">

<% AttributePrincipal user = (AttributePrincipal) request.getUserPrincipal();%>
<% Map attributes = user.getAttributes(); 
if (user != null) { %>

	<div class="wrapper">

		<header class="main-header">
			<%@ include file="/frames/mainheader.jsp"%>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
	      <aside class="main-sidebar">
	  			 <%@ include file="/frames/main-sidebar.jsp" %>
	      </aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			 <section class="content-header">
	          <h1>
	            <small>
	            <!--  Titulo, donde antes estaba dashboard -->
	            </small>
	          </h1>
	        </section>
			<!-- Main content -->
			<section class="content" id="programacion">
				<!-- Contenedor de constancias para el PA1 -->
					<div class="box box-primary">
						<div class="box-header with-border"><!-- Cabecera del box con titulo y botones para expandir -->
							<h3 class="box-title">Descargar Constancia PA 1</h3>
							<div class="box-tools pull-right"> 
								<button type="button" class="btn" data-toggle="collapse" data-target="#demo1">
									<span class="glyphicon glyphicon-collapse-down"></span>
								</button>	
							</div>
						</div><!-- /.fin-box-header -->
						<div class="box-body collapse" id="demo1">
							  <div class="list-group" >
								<!-- <a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA1_20160404.pdf" download="Constancia" class="list-group-item glyphicon glyphicon-download-alt"> Descargar</a> -->
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA1_20160401.pdf" download="Constancia" class="list-group-item glyphicon glyphicon-download-alt"> 01-ABRIL-2016</a>
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA1_20160404.pdf" download="Constancia" class="list-group-item glyphicon glyphicon-download-alt"> 04-ABRIL-2016</a>
							  </div>
						</div><!-- /.fin-box-body -->
					</div><!-- /.fin_box -->
					
					<!-- Contenedor de constancias para el PA2 -->
					<div class="box box-primary">
						<div class="box-header with-border"><!-- Cabecera del box con titulo y botones para expandir -->
							<h3 class="box-title">Descargar Constancia PA 2</h3>
							<div class="box-tools pull-right"> 
								<button type="button" class="btn" data-toggle="collapse" data-target="#demo2">
									<span class="glyphicon glyphicon-collapse-down"></span>
								</button>	
							</div>
						</div><!-- /.fin-box-header -->
						<div class="box-body collapse" id="demo2">
							  <div class="list-group" >
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA1_20160401.pdf" class="noDescargar list-group-item disabled glyphicon glyphicon-download-alt" onclick="return false;"> Descargar</a>
								<!-- <a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA1_20160401.pdf" download="Constancia" class="list-group-item glyphicon glyphicon-download-alt"> Mes : Febrero - Descargar</a>
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA1_20160401.pdf" download="Constancia" class="list-group-item glyphicon glyphicon-download-alt"> Mes : Marzo - Descargar</a> -->
							  </div>
						</div><!-- /.fin-box-bod -->
					</div><!-- /.fin_box -->
					
					<!-- Contenedor de constancias para el PA3 -->
					<div class="box box-primary">
						<div class="box-header with-border"><!-- Cabecera del box con titulo y botones para expandir -->
							<h3 class="box-title">Descargar Constancia PA 3</h3>
							<div class="box-tools pull-right"> 
								<button type="button" class="btn" data-toggle="collapse" data-target="#demo3">
									<span class="glyphicon glyphicon-collapse-down"></span>
								</button>	
							</div>
						</div><!-- /.fin-box-header -->
						<div class="box-body collapse" id="demo3">
							  <div class="list-group" >
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA1_20160401.pdf" class="noDescargar list-group-item disabled glyphicon glyphicon-download-alt" onclick="return false;"> Descargar</a>
								<!-- <a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA1_20160401.pdf" download="Constancia" class="list-group-item glyphicon glyphicon-download-alt"> Mes : Febrero - Descargar</a>
								<a href="http://spr.stp.gov.py/tablero/descargas/Constancia_PA1_20160401.pdf" download="Constancia" class="list-group-item glyphicon glyphicon-download-alt"> Mes : Marzo - Descargar</a> -->
							  </div>
						</div><!-- /.fin-box-bod -->
					</div><!-- /.fin_box -->
					
				<script>/* Scrip para cambiar de icono el boton de collapse */
				$(document).ready(function(){
					 $("#demo1").on("hide.bs.collapse", function(){
					   $(".btn").html('<span class="glyphicon glyphicon-collapse-down"></span> ');
					 });
					 $("#demo1").on("show.bs.collapse", function(){
					   $(".btn").html('<span class="glyphicon glyphicon-collapse-up"></span> ');
					 });
					$("#demo2").on("hide.bs.collapse", function(){
						$(".btn").html('<span class="glyphicon glyphicon-collapse-down"></span> ');
					});
					$("#demo2").on("show.bs.collapse", function(){
						$(".btn").html('<span class="glyphicon glyphicon-collapse-up"></span> ');
					});
					$("#demo3").on("hide.bs.collapse", function(){
						$(".btn").html('<span class="glyphicon glyphicon-collapse-down"></span> ');
					});
					$("#demo3").on("show.bs.collapse", function(){
						$(".btn").html('<span class="glyphicon glyphicon-collapse-up"></span> ');
					});

				});
				
				</script>
			</section>
		</div><!-- fin content-wrapper -->
	
	
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

   
    </div><!-- fin wrapper -->

    <!-- Librerias para la rutina de cambio de contraseña -->
    <script src="dist/js/jquerymd5.js" type="text/javascript"></script>    	
    <%@ include file="/frames/pass.jsp" %>
    <%@ include file="/frames/insLineaAccion.jsp" %>
    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js" type="text/javascript"></script>
        <%  } else { %>
				est<p>Favor Iniciar Sesion</p>
			<% } %> 

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
		var entidadCasSpr = "";
		entidadCasSpr ="<%=attributes.get("entidad") %>";
		usuarioRolCasSpr="<%=attributes.get("role_id") %>";
		var usuariosSpr = $.ajax({
			url:'http://spr.stp.gov.py/ajaxSelects?action=getUsuarios&usuario=<%=user.getName()%>',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		usuariosSpr = JSON.parse(usuariosSpr);
		usuariosSpr = usuariosSpr.usuarios;
	</script>
</body>
</html>