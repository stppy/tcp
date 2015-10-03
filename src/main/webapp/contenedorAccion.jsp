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

		var accion = $.ajax({
			url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getAccion',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;		
		accion=JSON.parse(accion);
		
		var tablaAccion="";
		tablaAccion = '<table class="table table-striped ">'+
					  '<tr><td colspan="11">Tabla Acción</td></tr>'+
					  '<tr><td>Id</td><td>insLineaAccionId</td><td>Nombre</td><td>Descripción</td><td>Costo</td><td>Peso</td><td>FechaInicio</td><td>FechaFin</td><td>Borrado</td><td>Insertar</td><td>Editar</td></tr>';
		for(var m=0; m<accion.length;m++)
		{
			tablaAccion+='<tr><td>'+accion[m].id+'</td><td>'+accion[m].insLineaAccionId+'</td><td>'+accion[m].nombre+'</td><td>'+accion[m].descripcion+'</td><td>'+accion[m].costo+'</td><td>'+accion[m].peso+'</td><td>'+accion[m].fechaInicio+'</td><td>'+accion[m].fechaFin+'</td><td>'+accion[m].borrado+'</td><td><a href="#" data-toggle="modal" data-target="#accion"><span class="glyphicon glyphicon-plus"></span></a></td><td><span class="glyphicon glyphicon-pencil registrosAccion" codigoRegistroAccion='+m+'></span></td></tr>';
		}
		tablaAccion +=  '</table>';
		
		var accionHasGeoPoligono = $.ajax({
			url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getAccionHasGeoPoligono',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;		
		accionHasGeoPoligono=JSON.parse(accionHasGeoPoligono);
		
		var tablaAccionHasGeoPoligono="";
		tablaAccionHasGeoPoligono = '<table class="table table-striped ">'+
					  '<tr><td colspan="5">Tabla Acción Has Geo Poligono</td></tr>'+
					  '<tr><td>accionId</td><td>geoPoligonoId</td><td>geoPoligonoGeoPoligonoId</td><td>proporcion</td><td>borrado</td></tr>';
		for(var q=0; q<accionHasGeoPoligono.length;q++)
		{
			tablaAccionHasGeoPoligono+='<tr class="registrosAccionHasGeoPoligono" codigoRegistroAccionHasGeoPoligono='+q+'-'+accionHasGeoPoligono[q].accionId+'-'+accionHasGeoPoligono[q].geoPoligonoId+'-'+accionHasGeoPoligono[q].geoPoligonoGeoPoligonoId+'-'+accionHasGeoPoligono[q].proporcion+'-'+accionHasGeoPoligono[q].borrado+'><td>'+accionHasGeoPoligono[q].accionId+'</td><td>'+accionHasGeoPoligono[q].geoPoligonoId+'</td><td>'+accionHasGeoPoligono[q].geoPoligonoGeoPoligonoId+'</td><td>'+accionHasGeoPoligono[q].proporcion+'</td><td>'+accionHasGeoPoligono[q].borrado+'</td></tr>';
		}
		tablaAccionHasGeoPoligono +='</table>';		
		
		var beneficiario = $.ajax({
			url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getBeneficiario',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;		
		beneficiario=JSON.parse(beneficiario);
		
		var tablaBeneficiario="";
		tablaBeneficiario = '<table class="table table-striped ">'+
					  '<tr><td colspan="5">Tabla Beneficiario</td></tr>'+
					  '<tr><td>Id</td><td>Nombre</td><td>Descripción</td><td>beneficiarioTipoId</td><td>borrado</td></tr>';
		for(var w=0; w<beneficiario.length;w++)
		{
			tablaBeneficiario+='<tr class="registrosBeneficiario" codigoRegistroBeneficiario='+w+'-'+beneficiario[w].id+'-'+beneficiario[w].nombre+'-'+beneficiario[w].descripcion+'-'+beneficiario[w].beneficiarioTipoId+'-'+beneficiario[w].borrado+'><td>'+beneficiario[w].id+'</td><td>'+beneficiario[w].nombre+'</td><td>'+beneficiario[w].descripcion+'</td><td>'+beneficiario[w].beneficiarioTipoId+'</td><td>'+beneficiario[w].borrado+'</td></tr>';
		}
		tablaBeneficiario +='</table>';			
		
		var beneficiarioDetalle = $.ajax({
			url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getBeneficiarioDetalle',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;		
		beneficiarioDetalle=JSON.parse(beneficiarioDetalle);
		
		var tablaBeneficiarioDetalle="";
		tablaBeneficiarioDetalle = '<table class="table table-striped ">'+
					  '<tr><td colspan="5">Tabla Beneficiario Detalle</td></tr>'+
					  '<tr><td>Id</td><td>Valor</td><td>beneficiarioDetalleClavesId</td><td>beneficiarioId</td></tr>';
		for(var e=0; e<beneficiarioDetalle.length;e++)
		{
			tablaBeneficiarioDetalle+='<tr class="registrosBeneficiarioDetalle" codigoRegistroBeneficiarioDetalle='+e+'-'+beneficiarioDetalle[e].id+'-'+beneficiarioDetalle[e].valor+'-'+beneficiarioDetalle[e].beneficiarioDetalleClavesId+'-'+beneficiarioDetalle[e].beneficiarioId+'><td>'+beneficiarioDetalle[e].id+'</td><td>'+beneficiarioDetalle[e].valor+'</td><td>'+beneficiarioDetalle[e].beneficiarioDetalleClavesId+'</td><td>'+beneficiarioDetalle[e].beneficiarioId+'</td></tr>';
		}
		tablaBeneficiarioDetalle +='</table>';			
		
		
		$('.box-body').html(tablaAccion);
		//$('.box-body').find("#tablaAccionHasGeoPoligono").html(tablaAccionHasGeoPoligono);
		//$('.box-body').find("#tablaBeneficiario").html(tablaBeneficiario);
		//$('.box-body').find("#tablaBeneficiarioDetalle").html(tablaBeneficiarioDetalle);		

		
		$("body").on("click", ".registrosAccion",function(event){
			var codigoRegistro = parseInt($(this).attr("codigoRegistroAccion"));
			
			$("#borradoLabelAccion").remove();
			$("#borradoBotonAccion").remove();
			$("#guardarAccion").remove();
			$('#accion').modal('show');
			$("#accion").find(".form-horizontal").append('<div class="form-group" id="borradoLabelAccion"><label for="borradoAccion" class="col-lg-2 control-label">Borrado</label><div class="col-lg-10"><input type="text" class="form-control" id="borradoAccion" placeholder="borrado"></div></div>');
			$("#accion").find(".form-horizontal").append('<div class="form-group" id="borradoBotonAccion"><div class="col-lg-offset-2 col-lg-10"><button type="submit" class="btn btn-success" id="actualizarAccion">Actualizar</button></div></div>');
			$("#idAccion").val(accion[codigoRegistro].id);
			$("#insLineaAccionIdAccion").val(accion[codigoRegistro].insLineaAccionId);
			$("#nombreAccion").val(accion[codigoRegistro].nombre);
			$("#descripcionAccion").val(accion[codigoRegistro].descripcion);
			$("#costoAccion").val(accion[codigoRegistro].costo);
			$("#pesoAccion").val(accion[codigoRegistro].peso);
			$("#fechaInicioAccion").val(accion[codigoRegistro].fechaInicio);
			$("#fechaFinAccion").val(accion[codigoRegistro].fechaFin);
			$("#borradoAccion").val(accion[codigoRegistro].borrado);
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
	                Links para la carga de Formulario	
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
    <%@ include file="/frames/accion.jsp" %> 
    <%@ include file="/frames/accion_has_etiqueta.jsp" %>
    <%@ include file="/frames/accion_has_geo_poligono.jsp" %>
    <%@ include file="/frames/accion_has_producto.jsp" %>
    <%@ include file="/frames/beneficiario.jsp" %>
    <%@ include file="/frames/beneficiarioDetalle.jsp" %>
    <%@ include file="/frames/beneficiarioDetalleClave.jsp" %> 
    <%@ include file="/frames/beneficiarioTipo.jsp" %> 
    <%@ include file="/frames/etiqueta.jsp" %>  
    <%@ include file="/frames/evidencia.jsp" %>
    <%@ include file="/frames/geo_poligono.jsp" %>
    <%@ include file="/frames/geoPoligonoTipo.jsp" %>
    <%@ include file="/frames/hito.jsp" %>
    <%@ include file="/frames/hito_has_beneficiario.jsp" %>
    <%@ include file="/frames/hitoTipo.jsp" %>
    <%@ include file="/frames/insLineaAccion.jsp" %>
    <%@ include file="/frames/institucion.jsp" %>
    <%@ include file="/frames/lineaAccion.jsp" %>
    <%@ include file="/frames/lineaEstrategica.jsp" %>
    <%@ include file="/frames/periodo.jsp" %>
    <%@ include file="/frames/sprProducto.jsp" %>
    <%@ include file="/frames/tipoAccion.jsp" %>
    <%@ include file="/frames/unidadMedida.jsp" %>
    <%@ include file="/frames/ws.jsp" %>
    <%@ include file="/frames/wsTipo.jsp" %>           
    
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
