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
	<script src="plugins/jQuery/jQuery-2.1.3.min.js"></script>



		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <title>Pivot Table - Ficha Social</title>
        <link rel="stylesheet" type="text/css" href="tablero_files/pivot.css">
        <script type="text/javascript" src="tablero_files/d3.js"></script>
        <script type="text/javascript" src="tablero_files/jsapi"></script>
        <script type="text/javascript" src="tablero_files/jquery-1.js"></script>
        <script type="text/javascript" src="tablero_files/jquery-ui-1.js"></script>
        <script type="text/javascript" src="tablero_files/pivot.js"></script>
        <script type="text/javascript" src="tablero_files/gchart_renderers.js"></script>
        <script type="text/javascript" src="tablero_files/d3_renderers.js"></script>
        <script type="text/javascript" src="tablero_files/export_renderers.js"></script>
        <script type="text/javascript" src="tablero_files/jquery.js"></script>
        <script type="text/javascript" src="tablero_files/export_renderers.js"></script>        
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
	
	$("#nombreUsuario").append(usuarios[0].correo+" ("+usuarios[0].nivel_id+", "+usuarios[0].entidad_id+")");
	$("#PerfilUsuario").append(usuarios[0].nombre+" ("+usuarios[0].nivel_id+", "+usuarios[0].entidad_id+", "+entidadCas+")");
		var i=parseInt(0);
		/* var datosNiveles = $.ajax({
	        url:'/ajaxSelects?accion=getNiveles&nivel='+usuarios[0].nivel_id,
	        type:'get',
	        dataType:'json',
	        async:false       
	      }).responseText;
	      datosNiveles = JSON.parse(datosNiveles);
	      datosNiveles.niveles;
	      
	     var datosEntidad = $.ajax({
	          url:'/ajaxSelects?accion=getEntidad&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id,
	          type:'get',
	          dataType:'json',
	          async:false       
	        }).responseText;
	        datosEntidad = JSON.parse(datosEntidad);
	        datosEntidad=datosEntidad.entidades;
	        
	     for (i=0;i<datosEntidad.length;i++){
	    	 if (datosEntidad[i].nivel==usuarios[0].nivel_id && datosEntidad[i].entidad==usuarios[0].entidad_id)
	    		 break;
	     } */

	     
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
	              <h3 class="box-title" id="tituloTipoPrograma">
	                Población Ficha Social
	              </h3> 
	              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	              </div>
	            </div>
	            <div class="box-body" style="overflow: auto; display: block;">
	            
	          <table class="table table-striped table-bordered table-hover">
	            	<tr>	  					
	  					<td>
							<input type="button" name="btn1" id="btn1" value="Ocultar Columnas">
		<script src="tablero_files/a" type="text/javascript"></script>
		<link href="tablero_files/uientableencharteditoren.css" type="text/css" rel="stylesheet">
		<script src="tablero_files/formatendefaultenuientableenorgchartenmotionchartengaugeenann.js" type="text/javascript"></script>
		<script type="text/javascript">
				
		$( document ).ready(function() {
            google.load("visualization", "1", {packages:["corechart", "charteditor"]});
            $(function(){
            	$.noConflict();
                var derivers = $.pivotUtilities.derivers;
                var renderers = $.extend($.pivotUtilities.renderers, 
                        $.pivotUtilities.export_renderers);
				
                $.getJSON("/tablero/ajaxSelects2?action=getPivotFicha", function(mps) {
                	$("#output").pivotUI(mps, {
                        renderers: $.extend(
                            $.pivotUtilities.renderers, 
                            $.pivotUtilities.gchart_renderers, 
                            $.pivotUtilities.d3_renderers
                            ),
                            rendererName: "TSV Export"/*,
                        derivedAttributes: {
                            "Age Bin": derivers.bin("Age", 10),
                            "Gender Imbalance": function(mp) {
                                return mp["Gender"] == "Male" ? 1 : -1;
                            }
                        },
                        cols: ["Age Bin"], rows: ["Gender"],
                        rendererName: "Area Chart"
						*/
                    });
                });
             });
		});
        </script>

        
        <div id="output" style="margin: 30px;">
        <table cellpadding="5">
			<tbody>
				<tr> 
					<td>
						<select class="pvtRenderer">
							<option selected="selected" value="Table">Table</option>
							<option value="Table Barchart">Table Barchart</option>
							<option value="Heatmap">Heatmap</option>
							<option value="Row Heatmap">Row Heatmap</option>
							<option value="Col Heatmap">Col Heatmap</option>
							<option value="Line Chart">Line Chart</option>
							<option value="Bar Chart">Bar Chart</option>
							<option value="Stacked Bar Chart">Stacked Bar Chart</option>
							<option value="Area Chart">Area Chart</option>
							<option value="Treemap">Treemap</option>
						</select>
					</td>
					<td class="pvtAxisContainer pvtUnused pvtHorizList ui-sortable"></td>
				</tr><tr>
					<td class="pvtVals">
						<select class="pvtAggregator">
							<option selected="selected" value="Count">Count</option>
							<option value="Count Unique Values">Count Unique Values</option>
							<option value="List Unique Values">List Unique Values</option>
							<option value="Sum">Sum</option>
							<option value="Integer Sum">Integer Sum</option>
							<option value="Average">Average</option>
							<option value="Minimum">Minimum</option>
							<option value="Maximum">Maximum</option>
							<option value="Sum over Sum">Sum over Sum</option>
							<option value="80% Upper Bound">80% Upper Bound</option>
							<option value="80% Lower Bound">80% Lower Bound</option>
							<option value="Sum as Fraction of Total">Sum as Fraction of Total</option>
							<option value="Sum as Fraction of Rows">Sum as Fraction of Rows</option>
							<option value="Sum as Fraction of Columns">Sum as Fraction of Columns</option>
							<option value="Count as Fraction of Total">Count as Fraction of Total</option>
							<option value="Count as Fraction of Rows">Count as Fraction of Rows</option>
							<option value="Count as Fraction of Columns">Count as Fraction of Columns</option>
						</select><br>
					</td>
					<td class="pvtAxisContainer pvtHorizList pvtCols ui-sortable"></td>
				</tr><tr>
					<td class="pvtAxisContainer pvtRows ui-sortable" valign="top"></td>
					<td style="opacity: 1;" class="pvtRendererArea" valign="top">.</td>
				</tr>
			</tbody>
		</table></div> 
		<script>
		document.getElementById('btn1').addEventListener('click',pasarParametro,false);
		function pasarParametro()
		{
        	var t = document.getElementById('output');
        	var boton =document.getElementById('btn1');
        	var p = t.getElementsByTagName('td')
        	//p[4].childNodes[0].nodeValue=p[4].childNodes[0].nodeValue + ' NO PUEDO MAS |'; 
        	if (p[0].style.display != "none" && p[1].style.display != "none" && p[2].style.display != "none" && p[3].style.display != "none" && p[4].style.display != "none") {
   				p[0].style.display = "none"; //ocultar columna 
   				p[1].style.display = "none"; //ocultar columna 
   				p[2].style.display = "none"; //ocultar columna 
   				p[3].style.display = "none"; //ocultar columna 
   				p[4].style.display = "none"; //ocultar columna 
   				boton.value="Ver Columnas";
 			} else {
    			p[0].style.display = ""; //mostrar columna 
    			p[1].style.display = ""; //mostrar columna
    			p[2].style.display = ""; //mostrar columna  
    			p[3].style.display = ""; //mostrar columna 
    			p[4].style.display = ""; //mostrar columna  
    			boton.value="Ocultar Columnas";
  			}
        }
	</script>
	  					</td>
	  				</tr>
			
	  			</table>
	  			
	            </div>
			   </div>
			   </div>
			<!--</div>-->
        
          
          </div><!-- /.row -->

				<div class="row" id="contenedorTablePivot">				
				</div>
				
				<!--</div>-->
        
          
          </div><!-- /.row -->
   
   <script type="text/javascript">
       
   	/* var tablePivotFicha = $.ajax({
		url:'/tablero/ajaxSelects2?action=getPivotFicha',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
   	tablePivotFicha = JSON.parse(tablePivotFicha);
	
	var bodyresumenDpto= '<div class="col-md-12">'+
							'<div class="box" height="1000px">'+
								'<div class="box-header with-border" height="1000px">'+
									'<h3 class="box-title" id="tituloTipoPrograma">Resúmen</h3>'+
									'<div class="box-tools pull-right" height="1000px">'+
										'<button class="btn btn-box-tool" data-widget="collapse">'+
											'<i class="fa fa-minus"></i>'+
										'</button>'+
									'</div>'+
								'</div>'+
								'<div class="box-body" style="overflow: auto; display: block;">'+
									'<table class="table table-hover table-bordered" id="dataTablesPivotFicha">'+
										'<thead>'+
											'<tr class="active">'+
												'<th class="text-center">Dpto. Cod</th>'+
												'<th class="text-center">Departamento</th>'+
												'<th class="text-center">Dist. Cod</th>'+
												'<th class="text-center">Distrito</th>'+
												'<th class="text-center">Barloc_Cod</th>'+
												'<th class="text-center">Localidad</th>'+
												'<th class="text-center">Area</th>'+
												'<th class="text-center">Manzana</th>'+
												'<th class="text-center">Dirección</th>'+												
												'<th class="text-center">Nro. Casa</th>'+
												'<th class="text-center">Coordenada x</th>'+
												'<th class="text-center">Coordenada y</th>'+
												'<th class="text-center">Nombres</th>'+
												'<th class="text-center">Apellidos</th>'+
												'<th class="text-center">Edad</th>'+
												'<th class="text-center">Sexo</th>'+
												'<th class="text-center">Parentesco</th>'+
												'<th class="text-center">Jefe</th>'+
												'<th class="text-center">Año</th>'+
												'<th class="text-center">Mes</th>'+
												'<th class="text-center">Día</th>'+
												'<th class="text-center">Cédula</th>'+
												'<th class="text-center">Teléfono</th>'+
												'<th class="text-center">Estado Pobreza</th>'+
												'<th class="text-center">Año Ficha</th>'+
											'</tr>'+
										'</thead>'+										
										'<tbody id="cuerpoFicha">'+
										'</tbody>'+
									'</table>'+
								'</div>'+
							'</div>'+
						'</div>';
						
	$('#contenedorTablePivot').append(bodyresumenDpto);
	
	var bodyFicha="";
	for(var e = 0; e < tablePivotFicha.length; e++)
	{
		bodyFicha +="<tr>"+
		"<td class='text-center'>"+tablePivotFicha[e].dpto_cod+"</td>"+
		"<td class='text-center'>"+tablePivotFicha[e].departamento+"</td>"+
		"<td class='text-center'>"+tablePivotFicha[e].dist_cod+"</td>"+
		"<td class='text-center'>"+tablePivotFicha[e].distrito+"</td>"+
		"<td class='text-center'>"+tablePivotFicha[e].barloc_cod+"</td>"+
		"<td class='text-center'>"+tablePivotFicha[e].localidad+"</td>"+
		"<td class='text-center'>"+tablePivotFicha[e].area+"</td>"+
		"<td class='text-center'>"+tablePivotFicha[e].manzana+"</td>"+
		"<td class='text-center'>"+tablePivotFicha[e].direccion+"</td>"+		
		"<td class='text-center'>"+tablePivotFicha[e].nro_casa+"</td>"+
		"<td class='text-center'>"+tablePivotFicha[e].coordenada_x+"</td>"+
		"<td class='text-center'>"+tablePivotFicha[e].coordenada_y+"</td>"+
		"<td class='text-center'>"+tablePivotFicha[e].nombre+"</td>"+
		"<td class='text-center'>"+tablePivotFicha[e].apellido+"</td>"+
		"<td class='text-center'>"+tablePivotFicha[e].sexo+"</td>"+
		"<td class='text-center'>"+tablePivotFicha[e].parentesco+"</td>"+
		"<td class='text-center'>"+tablePivotFicha[e].jefe+"</td>"+
		"<td class='text-center'>"+tablePivotFicha[e].ano+"</td>"+
		"<td class='text-center'>"+tablePivotFicha[e].mes+"</td>"+
		"<td class='text-center'>"+tablePivotFicha[e].dia+"</td>"+
		"<td class='text-center'>"+tablePivotFicha[e].cedula+"</td>"+
		"<td class='text-center'>"+tablePivotFicha[e].telefono+"</td>"+
		"<td class='text-center'>"+tablePivotFicha[e].estado_pobreza+"</td>"+
		"<td class='text-center'>"+tablePivotFicha[e].anho_ficha+"</td></tr>";		
		
	}
	$('#cuerpoFicha').append(bodyFicha); */
	//$('#dataTablesPivotFicha').DataTable();
  
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
    
    <script src="plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>   
        
	<script src="plugins/datatables/dataTables.buttons.min.js" type="text/javascript"></script>
	<script src="plugins/datatables/buttons.flash.min.js" type="text/javascript"></script>
	<script src="plugins/datatables/jszip.min.js" type="text/javascript"></script>
	<script src="plugins/datatables/pdfmake.min.js" type="text/javascript"></script>
	<script src="plugins/datatables/vfs_fonts.js" type="text/javascript"></script>
	<script src="plugins/datatables/buttons.html5.min.js" type="text/javascript"></script>
	<script src="plugins/datatables/buttons.print.min.js" type="text/javascript"></script>
	
    <script src="plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>

    <!-- AdminLTE dashboard demo (This is only for demo purposes) 
    <script src="dist/js/pages/dashboard2.js" type="text/javascript"></script>-->

    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js" type="text/javascript"></script>
        <%  } else { %>
			<p>Favor Iniciar Sesion</p>
		<%  } %>
		<%  } else { %>
            <script type="text/javascript">window.location = "http://spr.stp.gov.py";</script>
        <%  } %> 
  </body>
</html>