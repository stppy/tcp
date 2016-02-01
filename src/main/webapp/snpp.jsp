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
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  
  		<script src="https://cdnjs.cloudflare.com/ajax/libs/floatthead/1.2.10/jquery.floatThead.min.js"></script>
        
<!--   <script src="frames/entidad.js" type="text/javascript"></script> -->
</head>
<body class="skin-blue sidebar-mini sidebar-collapse">
<% AttributePrincipal user = (AttributePrincipal) request.getUserPrincipal();%>
<% Map attributes = user.getAttributes(); 
if (user != null) { %>

<script>
	$(document).ready(function(){
		var entidadCas = "";
		entidadCas ="<%=attributes.get("entidad") %>";
	/*	var usuarios = $.ajax({
			url:'http://spr.stp.gov.py/ajaxSelects?accion=getUsuarios&usuario=<%=user.getName()%>',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		usuarios = JSON.parse(usuarios);
		usuarios = usuarios.usuarios;
		$("#nombreUsuario").append(usuarios[0].correo+" ("+usuarios[0].nivel_id+", "+usuarios[0].entidad_id+")");
		$("#PerfilUsuario").append(usuarios[0].nombre+" ("+usuarios[0].nivel_id+", "+usuarios[0].entidad_id+", "+entidadCas+")");

		var i=parseInt(0);
		var datosNiveles = $.ajax({
	        url:'http://spr.stp.gov.py/ajaxSelects?accion=getNiveles&nivel='+usuarios[0].nivel_id,
	        type:'get',
	        dataType:'json',
	        async:false       
	      }).responseText;
	      datosNiveles = JSON.parse(datosNiveles);
	      datosNiveles.niveles;
	      
	     var datosEntidad = $.ajax({
	          url:'http://spr.stp.gov.py/ajaxSelects?accion=getEntidad&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id,
	          type:'get',
	          dataType:'json',
	          async:false       
	        }).responseText;
	        datosEntidad = JSON.parse(datosEntidad);
	        datosEntidad=datosEntidad.entidades;
	        
	     for (i=0;i<datosEntidad.length;i++){
	    	 if (datosEntidad[i].nivel==usuarios[0].nivel_id && datosEntidad[i].entidad==usuarios[0].entidad_id)
	    		 break;
	     }
*/
	     
	});
	
	
	$(document).ready(function(){
		
		function numeroConComa(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
	/* 	var entidadesjson = $.ajax({
	    	url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getEntidades',
	      	type:'get',
	      	dataType:'json',
	      	crossDomain:true,
	      	async:false       
	    }).responseText;
		var entidades=JSON.parse(entidadesjson);
	 */	
		var eljson = $.ajax({
	    	url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getLineasAccion',
	      	type:'get',
	      	dataType:'json',
	      	crossDomain:true,
	      	async:false       
	    }).responseText;
		var el=JSON.parse(eljson);
		
		
		var el2json = $.ajax({
	    	url:'http://www.programacionsnpp.com/ws/stp-lineas.php?uname=STP&upasswd=STPws2015!',
	      	type:'get',
	      	dataType:'json',
	      	crossDomain:true,
	      	async:false       
	    }).responseText;
		var el2=JSON.parse(el2json);
		
		var acc2json = $.ajax({
	    	url:'http://www.programacionsnpp.com/ws/stp.php?uname=STP&upasswd=STPws2015!',
	      	type:'get',
	      	dataType:'json',
	      	crossDomain:true,
	      	async:false       
	    }).responseText;
		var acc2=JSON.parse(acc2json);
		
		var lineasDeAccion= [];
		lineasDeAccion[1]= new Object();
		lineasDeAccion[2]= new Object();
		lineasDeAccion[3]= new Object();
		
		lineasDeAccion[1].linea_accion="CAPACITACION EN SECTOR AGROPECUARIO";
		lineasDeAccion[2].linea_accion="CAPACITACION EN SECTOR INDUSTRIAL";
		lineasDeAccion[3].linea_accion="CAPACITACION EN SECTOR COMERCIAL Y SERVICIOS";
		
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear();

		if(dd<10) {
		    dd='0'+dd
		} 

		if(mm<10) {
		    mm='0'+mm
		} 

		today = yyyy+'-'+mm+'-'+dd;
		
		
		var sumporAClass="";
		var porAejeClass="";
		var porHejeClass="";
		
		$("#cuerpoTabla").append('<tr><td colspan="12" ><strong>SNPP</strong></td></tr>');
		for (var i = 0; i< acc2.length;i++){
		//	if (acc2[i].accion_fecha_fin>="2015-01-01" && acc2[i].accion_fecha_fin<="2015-12-31"){
				if(acc2[i].accion_costo>0) lineasDeAccion[acc2[i].sector].costo_programado_anho+=parseFloat(acc2[i].accion_costo);
				if(acc2[i].cantidad>0) lineasDeAccion[acc2[i].sector].suma_programada_anho+=parseFloat(acc2[i].cantidad);
				if(acc2[i].cantidad>0) lineasDeAccion[acc2[i].sector].linea_accion_meta+=parseFloat(acc2[i].cantidad);
			//	if (acc2.accion_fecha_fin<=today){
					if(acc2[i].cantidad>0) lineasDeAccion[acc2[i].sector].cantidad_ejectudada_hoy+=parseFloat(acc2[i].cantidad);
					if(acc2[i].cantidad>0) lineasDeAccion[acc2[i].sector].suma_programada_hoy+=parseFloat(acc2[i].cantidad);
				//}
			//}
		}
		lineasDeAccion[1].accion_unidad_medida="Personas Capacitadas";
		lineasDeAccion[2].accion_unidad_medida="Personas Capacitadas";
		lineasDeAccion[3].accion_unidad_medida="Personas Capacitadas";
		
		for(j=1;j<=lineasDeAccion.length;j++){
			
			var porcentajeAnho = (lineasDeAccion[j].suma_programada_hoy*100)/lineasDeAccion[j].suma_programada_anho;
			porcentajeAnho=parseFloat(porcentajeAnho).toFixed(2);
			var porcentajeAnhoEje = (lineasDeAccion[j].cantidad_ejecutada_hoy*100)/lineasDeAccion[j].suma_programada_anho;
			porcentajeAnhoEje=parseFloat(porcentajeAnhoEje).toFixed(2);
			var porcentajeHoyEje = (lineasDeAccion[j].cantidad_ejecutada_hoy*100)/lineasDeAccion[j].suma_programada_hoy;
			porcentajeHoyEje=parseFloat(porcentajeHoyEje).toFixed(2);
			
			porHejeClassRow="";
			if (porcentajeHoyEje<=70){ porHejeClass = "text-danger";porHejeClassRow="danger";}
			if (porcentajeHoyEje>70){ porHejeClass = "text-warning";porHejeClassRow="warning";}
			if (porcentajeHoyEje>90){ porHejeClass = "text-success";porHejeClassRow="success";}
			
			$("#cuerpoTabla").append('<tr class="'+porHejeClassRow+'"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+lineasDeAccion[j].linea_accion+'</td><td>Gs.'+numeroConComa((lineasDeAccion[j].costo_programado_anho/1000000).toFixed(0))+'</td><td>'+lineasDeAccion[j].accion_unidad_medida+'</td><td>'+numeroConComa(lineasDeAccion[j].cantidad_ejecutada_hoy)+'</td><td>'+numeroConComa(lineasDeAccion[j].linea_accion_meta)+'</td><td></td><td class="cell-bordered2">'+numeroConComa(lineasDeAccion[j].suma_programada_anho)+'</td><td class="'+sumporAClass+'">'+porcentajeAnho+'</td><td>'+numeroConComa(lineasDeAccion[j].suma_programada_hoy)+'</td><td class="cell-bordered2">'+numeroConComa(lineasDeAccion[j].cantidad_ejecutada_hoy)+'</td><td class="'+porAejeClass+'">'+porcentajeAnhoEje+'</td><td class="text-center '+porHejeClass+'">'+porcentajeHoyEje+'</td></tr>');
			lineasDeAccion[j]="";
			
		}
		
		
	});

	
	     </script>
  <!-- piwik -->
  <script type="text/javascript">
 /* var _paq = _paq || [];
  _paq.push(["setDocumentTitle", document.domain + "/" + document.title]);
  _paq.push(["setCookieDomain", "*.spr.stp.gov.py"]);
  _paq.push(["setDomains", ["*.spr.stp.gov.py"]]);
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {
    var u="//infra.stp.gov.py/monitoreoweb/";
    _paq.push(['setTrackerUrl', u+'piwik.php']);
    _paq.push(['setSiteId', 4]);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
  })();
  <noscript><p><img src="//infra.stp.gov.py/monitoreoweb/piwik.php?idsite=4" style="border:0;" alt="" /></p></noscript>
  */
</script>

<!-- /piwik -->


<style>
textarea { text-transform: uppercase; }
.cell-bordered2  {
  border: 1px solid #dddddd;
  border-right-width:0px;
}
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
	              <h2 class="box-title text-center" id="tituloTipoPrograma">
	                Tablero de Control Presidencial - STP 	
	              </h2>
	              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	              </div>
	            </div>
	            <div class="box-body table-responsive" style="scroll-x:hidden;scroll-y:auto;">
	            
	            
	              <table id="lineasPorEntidad" class="table table-striped ">
              <thead>
                <tr style="background-color: white;">
                  <th colspan="5">
                  	Lineas De Acción por Entidad
                  </th>
                  <th colspan="3" class="text-center cell-bordered2">Programación</th>
                  <th colspan="3" class="text-center cell-bordered2">Ejecución</th>
                </tr>
                <tr style="background-color: white;">
                  <th>Linea de Acción</th>
                  <th>U. M.</th>
                  <th>Base 2014</th>
                  <th>Costo (MM)</th>
                  <th><!-- Meta 2015 --></th>
                  <th class="cell-bordered2">Cant del Año</th>
                  <th>% del Año</th>
                  <th>Cant. Hoy</th>
                  <th class="cell-bordered2">Cant. Hoy</th>
                  <th>% del Año</th>
                  <th>Desempeño</th>
                  
                </tr>
              </thead>
              <tbody id = "cuerpoTabla">
               
              </tbody>
            </table>

	            </div>
			   </div>
			</div>
          </div><!-- /.row -->


<script>
var $tabla=$("#lineasPorEntidad");
$tabla.floatThead({
	scrollContainer: function($tabla){
		return $tabla.closest('wrapper');
	}
})
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
  </body>
</html>
