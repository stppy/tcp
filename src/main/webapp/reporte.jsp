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
<%//if (attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("0")){%>
 	$(document).ready(function(){
 		
 		function numeroConComa(x) {
			return x.toString().replace(".", ",").replace(/\B(?=(\d{3})+(?!\d))/g, ".");
		}
		
		function orden(a,b) {             
			  if (a.orden < b.orden)
			    return -1;
			  if (a.orden > b.orden)
			    return 1;
			  return 0;
			}
		function idDepartamentoOrden(a,b) {             
			  if (a.idDepartamento < b.idDepartamento)
			    return -1;
			  if (a.idDepartamento > b.idDepartamento)
			    return 1;
			  return 0;
			}
	
		var unidadMedida = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getUnidadMedida',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		unidadMedida = JSON.parse(unidadMedida);
		
		var instituciones = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getInstitucion',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;		
		instituciones=JSON.parse(instituciones);
		instituciones=instituciones.sort(orden);
		
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
		lineaAccion=JSON.parse(lineaAccion);
		
		var accionCatalogo = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAccionCatalogo',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;		
		accionCatalogo=JSON.parse(accionCatalogo);
		
		
		
		var departamento = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getDepartamento',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;		
		departamento=JSON.parse(departamento);
		departamento=departamento.sort(idDepartamentoOrden);
		
		for(var i=0; i<instituciones.length;i++)
		{
			if (!instituciones[i].borrado){
				for(var il=0; il<insLineaAccion.length;il++)
				{
					if (insLineaAccion[il].periodoId=="2016" && !insLineaAccion[il].borrado && insLineaAccion[il].institucionId==instituciones[i].id){
						
						for(var la=0; la<lineaAccion.length;la++)
						{
							if (insLineaAccion[il].lineaAccionId==lineaAccion[la].id){
								$("#contenedorReporte").append(lineaAccion[la].nombre+"<br>");
								
								var acciones = $.ajax({
									url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAccion&lineaAccionId='+insLineaAccion[il].id,
								  	type:'get',
								  	dataType:'json',
								  	async:false       
								}).responseText;		
								acciones=JSON.parse(acciones);
								var accionesDistintas=[];
								for(var x=0; x<acciones.length;x++){
									if (accionesDistintas.indexOf(acciones[x].accionCatalogoId)<0){
										accionesDistintas.push(acciones[x].accionCatalogoId);
										for(var ac=0; ac<accionCatalogo.length;ac++){
											if 	(accionCatalogo[ac].id==acciones[x].accionCatalogoId){
												$("#contenedorReporte").append(" &nbsp;  &nbsp;  &nbsp; "+accionCatalogo[ac].nombre+"<br>");
												// aca falta recorrer departamentos y distritos y si tiene acciones segun el siguiente query dibujar tablas
												//http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAccion&lineaAccionId=69&departamento=3&accionCatalogoId=5&distrito=2
											}
										}
										
									}
								}
								
							}
							
						}
					}
				}
			}
		}
		

 		/*
 		
 		http://spr.stp.gov.py/tablero/ajaxSelects?action=getDistrito
 		http://spr.stp.gov.py/tablero/ajaxSelects?action=getDistrito&departamento=0
 		
 		
*/
		
		
		
	});
<%//}else{%>
	//window.location = "http://spr.stp.gov.py/tablero/resumenLineaAccion.jsp";
<%//}%>
</script>
	
 <div class="container">
		<div class="row" id="contenedorReporte">
		
        </div><!-- /.row -->          	
        
 </div><!-- /.container -->

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