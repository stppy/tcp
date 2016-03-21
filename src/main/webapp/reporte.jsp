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
		@media print {
			h1{
	    		font-size: 18px;
	    		margin-bottom: 5px;
				margin-top: 5px;
			}
			h2{
	    		font-size: 15px;
	    		margin-bottom: 5px;
				margin-top: 5px;
			}
			h3{
	    		font-size: 12px;
	    		margin-bottom: 5px;
				margin-top: 5px;
			}
			td{
	    		font-size: 8px;
	    		
			}
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
		
		var distrito = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getDistrito',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;		
		distrito=JSON.parse(distrito);
		
		function getDetallePresupuesto(accionId){
			var pDa = $.ajax({
				url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAccionHasProducto&accionId='+accionId,
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;		
			pDa=JSON.parse(pDa);
			var tabla="<table class='table table-striped table-bordered table-hover table-condensed'><tr><td>Producto</td><td>Proporcion</td><td>U. Medida</td><td>Clase</td><td>Cant. Física</td><td>Cant. Financiera / Presupuesto</td></tr>";
			
			for(var pa=0; pa<pDa.length;pa++){
				if (!pDa[pa].borrado){
					tabla+="<tr><td>"+pDa[pa].nivel+"-"+pDa[pa].nivel+"-"+pDa[pa].nivel+"-"+pDa[pa].entidad+"-"+pDa[pa].tipoPrograma+"-"+pDa[pa].subPrograma+pDa[pa].proyecto+"-"+pDa[pa].sprProductoId+"</td><td>"+pDa[pa].proporcion+"</td><td>"+pDa[pa].unidadMedida+"</td><td>"+pDa[pa].clase+"</td><td>"+pDa[pa].cantidadFisica+"</td><td>"+pDa[pa].totalAsignacion+"/"+pDa[pa].cantidadFinanciera+"</td></tr>"
				}
			}
			tabla+="</table>";
			return tabla;
			
		}
		
		for(var i=0; i<instituciones.length;i++)
		{
			if (!instituciones[i].borrado){
				for(var il=0; il<insLineaAccion.length;il++)
				{
					if (insLineaAccion[il].periodoId=="2016" && !insLineaAccion[il].borrado && insLineaAccion[il].institucionId==instituciones[i].id){
						
						for(var la=0; la<lineaAccion.length;la++)
						{
							if (insLineaAccion[il].lineaAccionId==lineaAccion[la].id){
								var unidadDeMedida="";
								for (var um=0;um<unidadMedida.length;um++){
									if (lineaAccion[la].unidadMedidaId==unidadMedida[um].id){
										unidadDeMedida=unidadMedida[um].descripcion;
									}
								}
								$("#contenedorReporte").append("<h1>"+lineaAccion[la].nombre+"<small>(Meta 2016: "+numeroConComa(insLineaAccion[il].meta.toFixed(2))+" "+unidadDeMedida+")</small></h1>");
								unidadDeMedida="";
								var acciones = $.ajax({
									url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getAccion&lineaAccionId='+insLineaAccion[il].id,
								  	type:'get',
								  	dataType:'json',
								  	async:false       
								}).responseText;		
								acciones=JSON.parse(acciones);
								var flagDepto=0;
								var flagDist=0;
								var contenidoDepto="";
								var contenidoDist="";
								var contenidoAcciones="";
								for(var de=0; de<departamento.length;de++){
									flagDepto=0;
									contenidoDepto="<h2>"+departamento[de].nombreDepartamento+"</h2>";
									for(var di=0; di<distrito.length;di++){
										flagDist=0;
										contenidoDist="<h3>"+distrito[di].descripcion+"</h3>";
										if (distrito[di].departamentoId==departamento[de].idDepartamento){
											var accionesDistintas=[];
											for(var x=0; x<acciones.length;x++){
												if (!acciones[x].borrado && acciones[x].departamentoId==departamento[de].idDepartamento && (acciones[x].distritoId==distrito[di].id &&  acciones[x].departamentoId==distrito[di].departamentoId)){
													if (accionesDistintas.indexOf(acciones[x].accionCatalogoId)<0){
														accionesDistintas.push(acciones[x].accionCatalogoId);
														for(var ac=0; ac<accionCatalogo.length;ac++){
															if 	(accionCatalogo[ac].id==acciones[x].accionCatalogoId){
																flagDepto++;flagDist++;
																
																if(flagDepto=="1"){
																	contenidoAcciones+="<h3>"+contenidoDepto+"</h3>";
																}
																if(flagDist=="1"){
																	contenidoAcciones+="<h4>"+contenidoDist+"</h4>";
																}
																contenidoAcciones+='<table class="table table-striped table-bordered table-hover table-condensed">';
																contenidoAcciones+='<tr><td>Acción</td><td>Peso</td><td>Fecha Ini.</td><td>Fecha Fin</td> <td>1er Trim</td><td>2do Trim</td><td>3er Trim</td><td>4to Trim</td></tr>';
																contenidoAcciones+="<tr><td>"+accionCatalogo[ac].nombre+"</td><td>"+acciones[x].peso+"</td><td>"+acciones[x].fechaInicio+"</td><td>"+acciones[x].fechaFin+"</td><td>"+acciones[x].meta1+"</td><td>"+acciones[x].meta2+"</td><td>"+acciones[x].meta3+"</td><td>"+acciones[x].meta4+"</td></tr>";
																contenidoAcciones+="<tr><td colspan='8'>"+getDetallePresupuesto(acciones[x].id)+"</td></tr>";
																contenidoAcciones+='</table>';
															}
														//	contenidoAcciones+="</table>";

															$("#contenedorReporte").append(contenidoAcciones);
															contenidoAcciones="";
														}
													}
												}
										}//fin deacciones para acciones distintas
										accionesDistintas=[];
									}// si es el depto del distrito
								}//fin distrito
							}//fin departamento
						}//fin de todas las instancias de esa linea	
					}//fin de for de lineas
				}// fin de if de instancias de esa institucion
			}//fin de for de instancias
		}//fin de if instituciones borradas
	}//fin de for de instituciones
		

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
		<div class="row" id="contenedorReporte" class="col-md-12 table-responsive">
		
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