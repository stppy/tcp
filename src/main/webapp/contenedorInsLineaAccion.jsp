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

	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrapslider.css" rel="stylesheet">	
	<script src="http://www.jqueryscript.net/demo/Create-Step-By-Step-Modal-with-jQuery-Bootstrap/src/jquery-bootstrap-modal-steps.js"></script>
	
	<script src="http://www.jqueryscript.net/demo/Create-Step-By-Step-Modal-with-jQuery-Bootstrap/src/jquery-bootstrap-modal-steps.js"></script>
	
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
			url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getUsuarios&usuario=<%=user.getName()%>',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		usuarios = JSON.parse(usuarios);
		usuarios = usuarios.usuarios;
		$("#nombreUsuario").append(usuarios[0].correo+" ("+usuarios[0].nivel_id+", "+usuarios[0].entidad_id+")");
		$("#PerfilUsuario").append(usuarios[0].nombre+" ("+usuarios[0].nivel_id+", "+usuarios[0].entidad_id+", "+entidadCas+")");
		
		var insLineaAccion = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getInsLineaAccion',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;		
		insLineaAccion=JSON.parse(insLineaAccion);
		
		var lineaAccion = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getLineaAccion',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		lineaAccion = JSON.parse(lineaAccion);
		
		var institucion = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getInstitucion',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		institucion = JSON.parse(institucion);
		
		var periodo = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getPeriodo',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		periodo = JSON.parse(periodo);
		
		var unidadMedida = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getUnidadMedida',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		unidadMedida = JSON.parse(unidadMedida);

		
		renderInsLineaAccion();
		function renderInsLineaAccion(){
			
		$('.box-body').html('');
		var tablaInsLineaAccion="";
		tablaInsLineaAccion = 	'<div class="table-responsive">'+
								'<table class="table table-hover">'+
								  '<tr class="active"><td colspan="10">Linea de Acción por Institución</td></tr>'+
								  '<tr class="active"><td>Id</td><td>Linea de Acción</td><td>Institución</td><td>Periodo</td><td class="text-center">U.Medida</td><td>Meta</td><td>Estado</td><td>Editar</td><td>Borrar</td><td>Acción</td></tr>';
								  
	 	var bandLineaAccion;
	 	var bandInstitucion;
	 	var bandPeriodo;
		for(var w=0; w<insLineaAccion.length;w++)
		{
		 	bandLineaAccion = 0;
		 	bandInstitucion = 0;
		 	bandPeriodo = 0;
			
			if(insLineaAccion[w].borrado == true){
				tablaInsLineaAccion+='<tr><td><del>'+insLineaAccion[w].id+'</del></td>';
			}else{
				tablaInsLineaAccion+='<tr><td>'+insLineaAccion[w].id+'</td>';	
			}
		
			
			for(i = 0;i<lineaAccion.length; i++){				
				if(insLineaAccion[w].lineaAccionId == lineaAccion[i].id)
				{
					if(insLineaAccion[w].borrado == true){
						tablaInsLineaAccion+='<td><del>'+lineaAccion[i].nombre+'</del></td>';
					}else{
						tablaInsLineaAccion+='<td>'+lineaAccion[i].nombre+'</td>';	
					}
					bandLineaAccion = 1;
				}
			}
						
			if(bandLineaAccion == 0)
			{
				tablaInsLineaAccion+='<td>'+insLineaAccion[w].lineaAccionId+'</td>';
			}
						
			for(m = 0;m<institucion.length; m++){
				if(insLineaAccion[w].institucionId == institucion[m].id)
				{
					if(insLineaAccion[w].borrado == true){
						tablaInsLineaAccion+='<td><del>'+institucion[m].sigla+'</del></td>';
					}else{
						tablaInsLineaAccion+='<td>'+institucion[m].sigla+'</td>';	
					}
					bandInstitucion = 1;
				}
			}
			
			if(bandInstitucion == 0)
			{
				tablaInsLineaAccion+='<td>'+insLineaAccion[w].institucionId+'</td>';
			}
						
			for(p = 0;p<periodo.length; p++)
			{
				if(insLineaAccion[w].periodoId == periodo[p].id)
				{
					if(insLineaAccion[w].borrado == true){
						tablaInsLineaAccion+='<td><del>'+periodo[p].nombre+'</del></td>';
					}else{
						tablaInsLineaAccion+='<td>'+periodo[p].nombre+'</td>';	
					}
					bandPeriodo = 1;
				}
			}
			
			if(bandPeriodo == 0)
			{
				tablaInsLineaAccion+='<td>'+insLineaAccion[w].periodoId+'</td>';
			}
			
			var codigoUnidadMedida;
			var nombreUnidadMedida;
			for(h = 0;h<lineaAccion.length; h++){				
				if(insLineaAccion[w].lineaAccionId == lineaAccion[h].id)
				{
					codigoUnidadMedida=lineaAccion[h].unidadMedidaId;
					
					for(var k = 0; k < unidadMedida.length; k++)
					{
						if(codigoUnidadMedida == unidadMedida[k].id)
						{
							nombreUnidadMedida = unidadMedida[k].descripcion;
						}
					}
				}
			}
			
			if(insLineaAccion[w].borrado == true){
				tablaInsLineaAccion+='<td class="text-center"><del>'+nombreUnidadMedida+'</del></td><td><del>'+insLineaAccion[w].meta+'</del></td><td><del>'+insLineaAccion[w].borrado+'</del></td><td><span class="glyphicon glyphicon-pencil registrosInsLineaAccion" codigoRegistroInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'-'+insLineaAccion[w].meta+'-'+insLineaAccion[w].version+'></span></td><td><span class="glyphicon glyphicon-trash" parametrosBorradoInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].borrado+' id="iconoBorradoInsLineaAccion"></span></td><td><span class="glyphicon glyphicon-list-alt" parametrosAccionInsLineaAccion="'+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'"></span></td></tr>';
			}else{
				tablaInsLineaAccion+='<td class="text-center">'+nombreUnidadMedida+'</td><td>'+insLineaAccion[w].meta+'</td><td>'+insLineaAccion[w].borrado+'</td><td><span class="glyphicon glyphicon-pencil registrosInsLineaAccion" codigoRegistroInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'-'+insLineaAccion[w].meta+'-'+insLineaAccion[w].version+'></span></td><td><span class="glyphicon glyphicon-trash" parametrosBorradoInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].borrado+' id="iconoBorradoInsLineaAccion"></span></td><td><span class="glyphicon glyphicon-list-alt agregarAccion" parametrosAccionInsLineaAccion="'+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'"></span></td></tr>';	
			}
			
		}
		
		
		tablaInsLineaAccion +='<tr><td colspan="9"></td></tr>';
		tablaInsLineaAccion +='</table></div>';				
		
		$('.box-body').html(tablaInsLineaAccion);
		
		}
		
		
		
		
		 
		
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
	          <div class="box" >
	            <div class="box-header with-border">
	              <h2 class="box-title text-center" id="tituloTipoPrograma">
	                Contenedor InsLineaAcción	
	              </h2>
	              <div class="box-tools pull-right"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	              </div>
	            </div>
	            <div class="box-body" style="height:600px; overflow: auto; display: block;">
	            
	            
	            </div>
	             <div class="box-footer" style="height:600px; overflow: auto; display: block;">
	             	<button type="submit" class="btn btn-primary nuevaInsLineaAccion">Agregar Linea de Acción</button>
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
 

  </body>
</html>
