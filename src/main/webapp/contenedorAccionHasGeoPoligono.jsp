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
		
		var accionHasGeoPoligono = $.ajax({
			url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getAccionHasGeoPoligono',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;		
		accionHasGeoPoligono=JSON.parse(accionHasGeoPoligono);
		
		renderAccionHasGeoPoligono();
		function renderAccionHasGeoPoligono(){
			
			$('.box-body').html('');
			var tablaAccionHasGeoPoligono="";
			tablaAccionHasGeoPoligono = '<table class="table table-striped ">'+
						  '<tr><td colspan="6">Tabla Acción Has Geo Poligono</td><td><a href="#" data-toggle="modal" data-target="#accionHasGeoPoligono"><span class="glyphicon glyphicon-plus"></span></a></td></tr>'+
						  '<tr><td>accionId</td><td>geoPoligonoId</td><td>geoPoligonoGeoPoligonoId</td><td>proporcion</td><td>borrado</td><td>Editar</td><td>Borrado</td></tr>';
			for(var q=0; q<accionHasGeoPoligono.length;q++)
			{
				if(accionHasGeoPoligono[q].borrado == true)
				{
					tablaAccionHasGeoPoligono+='<tr><td><del>'+accionHasGeoPoligono[q].accionId+'</del></td><td><del>'+accionHasGeoPoligono[q].geoPoligonoId+'</del></td><td><del>'+accionHasGeoPoligono[q].geoPoligonoGeoPoligonoId+'</del></td><td><del>'+accionHasGeoPoligono[q].proporcion+'</del></td><td><del>'+accionHasGeoPoligono[q].borrado+'</del></td><td><span class="glyphicon glyphicon-pencil registrosAccionHasGeoPoligono" codigoRegistroAccionHasGeoPoligono='+q+'></span></td><td><span class="glyphicon glyphicon-trash" id="iconoBorradoAccionHasGeoPoligono" parametrosBorradoAccionHasGeoPoligono='+accionHasGeoPoligono[q].accionId+'-'+accionHasGeoPoligono[q].geoPoligonoId+'-'+accionHasGeoPoligono[q].geoPoligonoGeoPoligonoId+'-'+accionHasGeoPoligono[q].borrado+'></span></td></tr>';
				}else{
					tablaAccionHasGeoPoligono+='<tr><td>'+accionHasGeoPoligono[q].accionId+'</td><td>'+accionHasGeoPoligono[q].geoPoligonoId+'</td><td>'+accionHasGeoPoligono[q].geoPoligonoGeoPoligonoId+'</td><td>'+accionHasGeoPoligono[q].proporcion+'</td><td>'+accionHasGeoPoligono[q].borrado+'</td><td><span class="glyphicon glyphicon-pencil registrosAccionHasGeoPoligono" codigoRegistroAccionHasGeoPoligono='+q+'></span></td><td><span class="glyphicon glyphicon-trash" id="iconoBorradoAccionHasGeoPoligono" parametrosBorradoAccionHasGeoPoligono='+accionHasGeoPoligono[q].accionId+'-'+accionHasGeoPoligono[q].geoPoligonoId+'-'+accionHasGeoPoligono[q].geoPoligonoGeoPoligonoId+'-'+accionHasGeoPoligono[q].borrado+'></span></td></tr>';
				}
			}
			tablaAccionHasGeoPoligono +='</table>';		
			
			$('.box-body').html(tablaAccionHasGeoPoligono);
		}
		
		$("body").on("click", ".registrosAccionHasGeoPoligono",function(event){
			var codigoRegistro = $(this).attr("codigoRegistroAccionHasGeoPoligono");
				
			$("#borradoBotonAccionHasGeoPoligono").remove();
			$("#guardarAccionHasGeoPoligono").remove();
			$('#accionHasGeoPoligono').modal('show');
			$("#accionHasGeoPoligono").find(".form-horizontal").append('<div class="form-group" id="borradoBotonAccionHasGeoPoligono"><div class="col-lg-offset-2 col-lg-10"><button type="submit" class="btn btn-success" id="actualizarAccionHasGeoPoligono">Actualizar</button></div></div>');
			$("#accionIdAccionHasGeoPoligono").val(accionHasGeoPoligono[codigoRegistro].accionId);
			$("#geoPoligonoIdAccionHasGeoPoligono").val(accionHasGeoPoligono[codigoRegistro].geoPoligonoId);
			$("#geoPoligonoGeoPoligonoIdAccionHasGeoPoligono").val(accionHasGeoPoligono[codigoRegistro].geoPoligonoGeoPoligonoId);
			$("#proporcionAccionHasGeoPoligono").val(accionHasGeoPoligono[codigoRegistro].proporcion);
			$("#borradoAccionHasGeoPoligono").val(accionHasGeoPoligono[codigoRegistro].borrado);
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
         
        </section>

        <!-- Main content -->
        <section class="content" id="programacion">
	          <!-- Info row de buscador de productos -->
	          <div class="row">
	         <div class="col-md-12">
	          <div class="box" height="1000px">
	            <div class="box-header with-border" height="1000px">
	              <h2 class="box-title text-center" id="tituloTipoPrograma">
	                Editar Registros
	              </h2>
	              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	              </div>
	            </div>
	            <div class="box-body table-responsive" style="scroll-x:hidden;scroll-y:auto;">
	            

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
    <%@ include file="/frames/accion_has_geo_poligono.jsp" %>          
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
 
    
  </body>
</html>
