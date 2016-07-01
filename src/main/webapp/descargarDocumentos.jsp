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

	<script type="text/javascript" src="dist/canvasjs/canvasjs.min.js" ></script>
	<script src="http://mrrio.github.io/jsPDF/dist/jspdf.min.js"></script>

	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrapslider.css" rel="stylesheet">	
	<script src="plugins/jquery-bootstrap-modal-steps.js"></script>	
	
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

<% AttributePrincipal user = (AttributePrincipal) request.getUserPrincipal();%>
<% Map attributes = user.getAttributes(); 
if (user != null) { %>

<script>
<%if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
 	$(document).ready(function(){

		var entidadCas = "";
		entidadCas ="<%=attributes.get("entidad") %>";
		usuarioRolCas="<%=attributes.get("role_id_tablero") %>";
		var usuarios = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getUsuarios&usuario=<%=user.getName()%>',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		usuarios = JSON.parse(usuarios);
		usuarios = usuarios.usuarios;
		
		$("#nombreUsuario").append(usuarios[0].correo+" ("+usuarios[0].nivel_id+", "+usuarios[0].entidad_id+")");
		$("#PerfilUsuario").append(usuarios[0].nombre+" ("+usuarios[0].nivel_id+", "+usuarios[0].entidad_id+", "+entidadCas+")");
		
		function renderTipoDocumento(){
			
			$("#contenedorDocumentos").html("");
			
									
			var  cajaTipoDocumento="";
			
			for(var l = 1; l <= 3; l++){
				
				var webServicesTipoDocumento = $.ajax({
					url:'http://spr.stp.gov.py/ajaxSelects?accion=getTipoDocumento&tipo='+l,
				  	type:'get',
				  	dataType:'json',
				  	async:false       
				}).responseText;
				webServicesTipoDocumento = JSON.parse(webServicesTipoDocumento);
				
				cajaTipoDocumento="";
				cajaTipoDocumento +=	'<div class="row">'+
								        '	<div class="col-md-12">'+
								        '		<div class="box collapsed-box">'+
								        '			<div class="box-header with-border">'+
								        '				<h4 class="box-title" >'+webServicesTipoDocumento[0].nombre+'</h4>'+
								        '				<div class="box-tools pull-right"><button class="btn btn-box-tool cargarProyectos" data-widget="collapse"><i class="fa fa-plus"></i></button></div>'+
								        '			</div>'+
								        '			<div class="box-body">';
								        
										var webServiceDocumento = $.ajax({
									    	url:'http://spr.stp.gov.py/ajaxSelects?accion=getDocumento&tipo='+webServicesTipoDocumento[0].id,
									      	type:'get',
									      	dataType:'json',
									      	async:false       
									    }).responseText;
										webServiceDocumento = JSON.parse(webServiceDocumento); 
										
				if(webServiceDocumento.length >= 0){
					
					cajaTipoDocumento +=	'				<div class="table-responsive">'+
											'	            	<table class="table table-hover table-bordered" id="dataTablesUsuarios">'+
											'	                	<thead>'+
											'	                		<tr class="active"><th>Descargar</th></tr>'+
											'	                	</thead>'+
											'	                	<tbody">';
												
<%-- 												for(var p = 0; p < webServiceDocumento.length; p++)
												{													
													if(webServiceDocumento[p].borrado == true)
													{
														<%if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") ){%>
															cajaTipoDocumento += '<tr><td><del>'+webServiceDocumento[p].nombre+'</del></td><td><del>'+webServiceDocumento[p].fecha+'</del></td><td><del>'+webServiceDocumento[p].descripcion+'</del></td>';
															if(webServiceDocumento[p].url){
																cajaTipoDocumento += '<td class="text-center"><a href="http://spr.stp.gov.py/tablero/DownloadServlet?urlDocumento='+webServiceDocumento[p].url+'" Download="Documento_'+webServiceDocumento[p].nombre+'" ><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="Descargar Documento"><span class="fa fa-download"></span></button></a></td></tr>';
															}else{
																cajaTipoDocumento += '<td class="text-center"><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="No Existe Documento" disabled="disabled"><span class="fa fa-download"></span></button></td></tr>';
															}
														<%}%>
													}else{
														<%if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
																cajaTipoDocumento += '<tr><td>'+webServiceDocumento[p].nombre+'</td><td>'+webServiceDocumento[p].fecha+'</td><td>'+webServiceDocumento[p].descripcion+'</td>';
																if (webServiceDocumento[p].url) {
																	cajaTipoDocumento += '<td class="text-center"><a href="http://spr.stp.gov.py/tablero/DownloadServlet?urlDocumento='+webServiceDocumento[p].url+'" Download="Documento_'+webServiceDocumento[p].nombre+'" ><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="Descargar Documento"><span class="fa fa-download"></span></button></a></td></tr>';
																} else {
																	cajaTipoDocumento += '<td class="text-center"><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="No Existe Documento" disabled="disabled"><span class="fa fa-download"></span></button></td></tr>';
																}					
														<%} if (attributes.get("role_id_tablero").toString().equals("3")){%>
																cajaTipoDocumento += '<tr><td>'+webServiceDocumento[p].nombre+'</td><td>'+webServiceDocumento[p].fecha+'</td><td>'+webServiceDocumento[p].descripcion+'</td>';
																if (webServiceDocumento[p].url) {
																	cajaTipoDocumento += '<td class="text-center"><a href="http://spr.stp.gov.py/tablero/DownloadServlet?urlDocumento='+webServiceDocumento[p].url+'" Download="Documento_'+webServiceDocumento[p].nombre+'" ><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="Descargar Documento"><span class="fa fa-download"></span></button></a></td></tr>';
																}else{
																	cajaTipoDocumento += '<td class="text-center"><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="No Existe Documento" disabled="disabled"><span class="fa fa-download"></span></button></td></tr>';
																}
														<%}%>
													}	
												} --%>
												for(var p = 0; p < webServiceDocumento.length; p++)
												{													
													if(webServiceDocumento[p].borrado == true)
													{
														<%if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") ){%>
															cajaTipoDocumento += '<tr><td><del>'+webServiceDocumento[p].nombre+'</del>';
															if(webServiceDocumento[p].url){
																cajaTipoDocumento += '<a href="http://spr.stp.gov.py/tablero/DownloadServlet?urlDocumento='+webServiceDocumento[p].url+'" Download="Documento_'+webServiceDocumento[p].nombre+'" ><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="Descargar Documento"><span class="fa fa-download"></span></button></a></td></tr>';
															}else{
																cajaTipoDocumento += '<button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="No Existe Documento" disabled="disabled"><span class="fa fa-download"></span></button></td></tr>';
															}
														<%}%>
													}else{
														<%if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
																cajaTipoDocumento += '<tr><td>'+webServiceDocumento[p].nombre;
																if (webServiceDocumento[p].url) {
																	cajaTipoDocumento += ' <a href="http://spr.stp.gov.py/tablero/DownloadServlet?urlDocumento='+webServiceDocumento[p].url+'" Download="Documento_'+webServiceDocumento[p].nombre+'" ><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="Descargar Documento"><span class="fa fa-download"></span></button></a></td></tr>';
																} else {
																	cajaTipoDocumento += ' <button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="No Existe Documento" disabled="disabled"><span class="fa fa-download"></span></button></td></tr>';
																}					
														<%} if (attributes.get("role_id_tablero").toString().equals("3")){%>
																cajaTipoDocumento += '<tr><td>'+webServiceDocumento[p].nombre;
																if (webServiceDocumento[p].url) {
																	cajaTipoDocumento += ' <a href="http://spr.stp.gov.py/tablero/DownloadServlet?urlDocumento='+webServiceDocumento[p].url+'" Download="Documento_'+webServiceDocumento[p].nombre+'" ><button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="Descargar Documento"><span class="fa fa-download"></span></button></a></td></tr>';
																}else{
																	cajaTipoDocumento += ' <button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="No Existe Documento" disabled="disabled"><span class="fa fa-download"></span></button></td></tr>';
																}
														<%}%>
													}	
												}
						
					cajaTipoDocumento +=	'						</tbody>'+
											'	            	</table>'+
											'	         	</div>';
				}					

										
				cajaTipoDocumento +=	'			</div>'+
										'		</div>'+
								     	'	</div>'+
										'</div>';
						
				$('#contenedorDocumentos').append(cajaTipoDocumento);
			}

		}
		
		renderTipoDocumento();


		
	});
<%}else{%>
	window.location = "http://spr.stp.gov.py/tablero/resumenLineaAccion.jsp";
<%}%>
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
         
        </section>

        <!-- Main content -->
        <section class="content" id="contenedorDocumentos">
	    	
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
    <!-- script src="plugins/jQuery/jQuery-2.1.3.min.js"></script-->        
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
    
    


    <!-- Librerias para la rutina de cambio de contraseña -->
    <script src="dist/js/jquerymd5.js" type="text/javascript"></script>    	
    <%@ include file="/frames/pass.jsp" %>
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
usuarioRolCasSpr="<%=attributes.get("role_id_tablero") %>";
var usuariosSpr = $.ajax({
	url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getUsuarios&usuario=<%=user.getName()%>',
  	type:'get',
  	dataType:'json',
  	async:false       
}).responseText;
usuariosSpr = JSON.parse(usuariosSpr);
usuariosSpr = usuariosSpr.usuarios;
</script>
  </body>
</html>