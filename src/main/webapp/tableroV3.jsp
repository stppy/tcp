<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<!-- <script src="frames/entidad.js" type="text/javascript"></script> -->
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
         
        </section>

        <!-- Main content -->
        <section class="content" id="programacion">
	          <!-- Info row de buscador de productos -->
	          <div class="row">
	         <div class="col-md-12">
	          <div class="box" height="1000px">
	            <div class="box-header with-border" height="1000px">
	              <h2 class="box-title text-center" id="tituloTipoPrograma">
	                Links para la carga de Formulario	
	              </h2>
	              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	              </div>
	            </div>
	            <div class="box-body table-responsive" style="scroll-x:hidden;scroll-y:auto;">
	            
	            
	             <table id="lineasPorEntidad" class="table table-striped ">
             	 <thead> 
                <tr style="background-color: white;">
                  <th>Links</th> 
                </tr>
              </thead>
              <tbody id="cuerpoTabla">

              	<tr><td><a >Acción Has Etiqueta</a></td></tr>  
              	<tr><td><a href="#" data-toggle="modal" data-target="#accion">Acción</a></td></tr>
              	<tr><td><a>Acción Has Geo Poligono</a></td></tr>   
              	<tr><td><a href="#" data-toggle="modal" data-target="#AccionHasProducto">AccionHasProducto</a></td></tr>
              	<tr><td><a href="#" data-toggle="modal" data-target="#Beneficiario">Beneficiario</a></td></tr>      
              	<tr><td><a>Beneficiario Detalle</a></td></tr>     
              	<tr><td><a href="#" data-toggle="modal" data-target="#Evidencia">Evidencia</a></td></tr>
              	<tr><td><a href="#" data-toggle="modal" data-target="#geoPoligonoTipo">GeoPoligonoTipo</a></td></tr>
              	<tr><td><a href="#" data-toggle="modal" data-target="#beneficiarioDetalleClave">Beneficiario Detalle Clave</a></td></tr>              	    	        	
              	<tr><td><a href="#" data-toggle="modal" data-target="#beneficiarioTipo">Beneficiario Tipo</a></td></tr> 
              	<tr><td><a href="#" data-toggle="modal" data-target="#etiqueta">Etiqueta</a></td></tr>
              	<tr><td><a>Geo Poligono</a></td></tr>
              	<tr><td><a href="#" data-toggle="modal" data-target="#hito">Hito</a></td></tr>
              	<tr><td><a>Hito Has Beneficiario</a></td></tr>
              	<tr><td><a href="#" data-toggle="modal" data-target="#hitoTipo">Hito Tipo</a></td></tr>
              	<tr><td><a>Ins Linea Accion</a></td></tr> 
              	<tr><td><a href="#" data-toggle="modal" data-target="#institucion">Institución</a></td></tr>
              	<tr><td><a href="#" data-toggle="modal" data-target="#lineaAccion">Linea Acción</a></td></tr>
              	<tr><td><a>Linea Estrategica</a></td></tr>
              	<tr><td><a href="#" data-toggle="modal" data-target="#Periodo">Periodo</a></td></tr>    
              	<tr><td><a href="#" data-toggle="modal" data-target="#sprProducto">Spr Producto</a></td></tr>
              	<tr><td><a href="#" data-toggle="modal" data-target="#tipoAccion">Tipo Acción</a></td></tr>
              	<tr><td><a href="#" data-toggle="modal" data-target="#unidadMedida">Unidad Medida</a></td></tr>
              	<tr><td><a href="#" data-toggle="modal" data-target="#wsTipo">Ws Tipo</a></td></tr>              	    	        	    	    	        	
              	<tr><td><a href="#" data-toggle="modal" data-target="#ws">Ws</a></td></tr>
         	    	        	    	    	        	
               
              </tbody> 
            </table>

	            </div>
			   </div>
			</div>
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
    <%@ include file="/frames/TipoAccion.jsp" %>
    <%@ include file="/frames/hito.jsp" %>    
    <%@ include file="/frames/lineaAccion.jsp" %>

    <%@ include file="/frames/beneficiario.jsp" %>
    <%@ include file="/frames/accion_has_producto.jsp" %>
    <%@ include file="/frames/evidencia.jsp" %>
    <%@ include file="/frames/periodo.jsp" %>
    <%@ include file="/frames/GeoPoligonoTipo.jsp" %>
     

    <%@ include file="/frames/hitoTipo.jsp" %> 
    <%@ include file="/frames/unidadMedida.jsp" %>
    <%@ include file="/frames/wsTipo.jsp" %>           
    <%@ include file="/frames/ws.jsp" %>
    <%@ include file="/frames/institucion.jsp" %>
    <%@ include file="/frames/sprProducto.jsp" %>   
    <%@ include file="/frames/accion.jsp" %> 
    <%@ include file="/frames/beneficiarioTipo.jsp" %> 
    <%@ include file="/frames/beneficiarioDetalleClave.jsp" %>  
    <%@ include file="/frames/etiqueta.jsp" %>  
            


  
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
