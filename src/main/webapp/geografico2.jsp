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
 	<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

   	<script src="https://cdnjs.cloudflare.com/ajax/libs/floatthead/1.2.10/jquery.floatThead.min.js"></script> -->	
        
	<!--<script src="frames/entidad.js" type="text/javascript"></script> -->
	<script type="text/javascript" src="dist/canvasjs/canvasjs.min.js" ></script>

<script>
var datosGeo=[];
</script>

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
    
    
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link rel="stylesheet" href="plugins/mapa/leaflet.css" />
<script src='dist/leaflet-image.js'></script>

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
                  <!--<li><a href="#tab_2-2" data-toggle="tab"><i class="glyphicon glyphicon-map-marker"></i></a></li>-->
                  <li><a href="#tab_3-2" data-toggle="tab" title="Evolución"><i class="glyphicon glyphicon-stats"></i></a></li>
                  <li><a href="#tab_4-2" data-toggle="tab" title="Beneficiarios"><i class="glyphicon glyphicon-user"></i></a></li>
                  <li><a href="#tab_5-2" data-toggle="tab" title="Ubicaciones"><i class="glyphicon glyphicon glyphicon-map-marker"></i></a></li>                    
                    
                </ul>
                <div class="tab-content">
                  <div class="tab-pane active" id="tab_1-1"></div><!-- /.tab-pane -->
                  <div class="tab-pane" id="tab_2-2">
               		<!--  <iframe width='100%' height='520' frameborder='0' src='http://geo.stp.gov.py/user/stp/viz/8f7c6480-2f1c-11e5-aaea-b6fa9714a3b6/embed_map' allowfullscreen webkitallowfullscreen mozallowfullscreen oallowfullscreen msallowfullscreen>
		     		</iframe>  -->
                  </div><!-- /.tab-pane -->
                  <div class="tab-pane" id="tab_3-2"></div><!-- /.tab-pane -->
                   <div class="tab-pane" id="tab_4-2"><p>Datos no disponibles</p></div><!-- /.tab-pane -->
                   <div class="tab-pane" id="tab_5-2"><p>Datos no disponibles</p></div><!-- /.tab-pane -->                            
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
	
	
	
	
	//event.stopPropagation();
	
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
  border-bottom-width:0px;
}
tbody {
    height: 100%;
    overflow-y: auto;
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
            <div class="col-md-6">
              <div class="box box-default">
                <div class="box-header with-border">
                  <i class="fa fa-map-marker"></i>
                  <h3 class="box-title">Desempeño Geográfico</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  	<div id="map" style="width: 800x; height: 600px"></div>

					<script src="plugins/mapa/deptos2012.geojson" type="text/javascript"></script>
					<!-- <script src="mapa/0.geojson" type="text/javascript"></script>  -->
					<script src="plugins/mapa/leaflet.js"></script>
					<script type="text/javascript" src="mapa/leaflet.ajax.js"></script>
					<script src="mapa/spin.js"></script>
					<script src="mapa/leaflet.spin.js"></script>
					
				
					<script>
					
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

					var i=parseInt(0);
					
					function numeroConComa(x) {
						return x.toString().replace(".", ",").replace(/\B(?=(\d{3})+(?!\d))/g, ".");
					}
					
					var entidades = $.ajax({
				    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getEntidades',
				      	type:'get',
				      	dataType:'json',
				      	crossDomain:true,
				      	async:false       
				    }).responseText;
					entidades=JSON.parse(entidades);
					
					
					var lineaAccionDepartamento = $.ajax({
				    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getLineasAccionDepartamento',
				      	type:'get',
				      	dataType:'json',
				      	crossDomain:true,
				      	async:false       
				    }).responseText;
					lineaAccionDepartamento=JSON.parse(lineaAccionDepartamento);
					
					var departamento = $.ajax({
				    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getDepartamento',
				      	type:'get',
				      	dataType:'json',
				      	crossDomain:true,
				      	async:false       
				    }).responseText;
					departamento=JSON.parse(departamento);
					

					
					var desPaisDeptojson = $.ajax({
				    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getDesempPaisPorDepto',
				      	type:'get',
				      	dataType:'json',
				      	crossDomain:true,
				      	async:false       
				    }).responseText;
					var desPaisDepto=JSON.parse(desPaisDeptojson);
					
					var desPaisDistjson = $.ajax({
				    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getDesempPaisPorDist',
				      	type:'get',
				      	dataType:'json',
				      	crossDomain:true,
				      	async:false       
				    }).responseText;
					var desPaisDist=JSON.parse(desPaisDistjson);
					
					var desPaisDistInstjson = $.ajax({
				    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getDesempPaisPorDistInst',
				      	type:'get',
				      	dataType:'json',
				      	crossDomain:true,
				      	async:false       
				    }).responseText;
					var desPaisDistInst=JSON.parse(desPaisDistInstjson);
				    

					
					//var totalLineaPais=[];
					var y=0;
					/*for (var z=0; z<elPais.length;z++){
						if (elPais[z].anho=="2015")
						{
							totalLineaPais[y] = new Object();
							totalLineaPais[y].institucion_id=elPais[z].institucion_id;
							totalLineaPais[y].linea_accion_id=elPais[z].linea_accion_id;
							totalLineaPais[y].anho="2015";
							totalLineaPais[y].suma_programada_anho_pais= elPais[z].suma_programada_anho;
							totalLineaPais[y].accion_departamento_id= elPais[z].suma_programada_anho;
							y++;
						}
					}*/
					y=0;

					var sumporAClass="";
					var porAejeClass="";
					var porHejeClass="";
					var porHejeClassRow="";
					
					function getColorDesemp(val){
						if (parseFloat(val).toFixed(0)>=90){
							return "green";
						}else{
							if (parseFloat(val).toFixed(0)>=70){
								return  color="yellow";
							}else{
								return  color="red";
							}
						}
					}

					
					
					function renderEntidades(e){
						var array=[];var tipoInstituciones="";
						$("#tablaInstituciones").html("");
						
						if (typeof e != 'undefined'){
							if (e.target.feature.properties.hasOwnProperty("distrito")){
								tipoInstituciones="distrito";
								$("#tabla-derecho").html("");
														
								$("#tabla-derecho").append('<div class="col-md-4" style="margin:0">Instituciones en: </div><div  class="col-md-4" >'+
									    e.target.feature.properties.dpto_desc+
									 '</div>'+
									 '<div class="col-md-4" >'+
									    e.target.feature.properties.dist_desc+ 
									  '</div>'+
									'</div>');
								var color="";
								for (var i = 0; i< entidades.length;i++){
									for(var j=0;j < desPaisDistInst.length;j++){
										if ((desPaisDistInst[j].clave3==entidades[i].institucion_id) && (desPaisDistInst[j].clave1==e.target.feature.properties.dpto) && (desPaisDistInst[j].clave2 == e.target.feature.properties.distrito)){
											color=getColorDesemp(desPaisDistInst[j].valor);
											$("#tablaInstituciones").append('<tr><td class="col-md-3"><a tipo="filtroPorEntidad" institucion_id='+entidades[i].institucion_id+' depto_id='+e.target.feature.properties.dpto+' dist_id='+e.target.feature.properties.distrito+' >'+entidades[i].institucion+'</a></td><td class="col-md-9"><div class="progress progress-xs"> <div class="progress-bar bg-'+color+'-active color-palette" style="width: '+parseFloat(desPaisDistInst[j].valor).toFixed(0)+'%"><p class="text-left">'+parseFloat(desPaisDistInst[j].valor).toFixed(2)+'%</p></div></div></td></tr>');
										}
									}
								}
							}else{
								tipoInstituciones="departamento";
								array=lineaAccionDepartamento;
								$("#tabla-derecho").html("");
								$("#tabla-derecho").append('Instituciones en '+e.target.feature.properties.dpto_desc);
								var color="";var depemDeptoInst;var countDeptoInst;var despTotDeptoInst;
								for (var i = 0; i< entidades.length;i++){
									countDeptoInst=0;
									depemDeptoInst=0.0;
									despTotDeptoInst=0.0;
									for(var j=0;j < desPaisDistInst.length;j++){
										if ((desPaisDistInst[j].clave3==entidades[i].institucion_id) && (desPaisDistInst[j].clave1==e.target.feature.properties.dpto)){
											depemDeptoInst+=desPaisDistInst[j].valor;
											countDeptoInst++;
										}
									}
									despTotDeptoInst=depemDeptoInst/countDeptoInst;
									color=getColorDesemp(despTotDeptoInst);
									if (!isNaN(despTotDeptoInst)) $("#tablaInstituciones").append('<tr><td class="col-md-3"><a tipo="filtroPorEntidad" institucion_id='+entidades[i].institucion_id+' depto_id='+e.target.feature.properties.dpto+' >'+entidades[i].institucion+'</a></td><td class="col-md-9"><div class="progress progress-xs"> <div class="progress-bar bg-'+color+'-active color-palette" style="width: '+parseFloat(despTotDeptoInst).toFixed(0)+'%"><p class="text-left">'+parseFloat(despTotDeptoInst).toFixed(2)+'%</p></div></div></td></tr>');
								}
							}
						}else{ //d
							var color="";var depemInst;var countInst;var despTotInst;
							for (var i = 0; i< entidades.length;i++){
								countInst=0;
								depemInst=0.0;
								despTotInst=0.0;
								for(var j=0;j < desPaisDistInst.length;j++){
									if ((desPaisDistInst[j].clave3==entidades[i].institucion_id) ){
										depemInst+=desPaisDistInst[j].valor;
										countInst++;
									}
								}
								despTotInst=depemInst/countInst;
								color=getColorDesemp(despTotInst);
								if (!isNaN(despTotInst)) $("#tablaInstituciones").append('<tr><td class="col-md-3"><a tipo="filtroPorEntidad" institucion_id='+entidades[i].institucion_id+'  >'+entidades[i].institucion+'</a></td><td class="col-md-9"><div class="progress progress-xs"> <div class="progress-bar bg-'+color+'-active color-palette" style="width: '+parseFloat(despTotInst).toFixed(0)+'%"><p class="text-left">'+parseFloat(despTotInst).toFixed(2)+'%</p></div></div></td></tr>');
							}
						}
					}
					
					function renderLineaAccion(depto_id, institucion_id, dist_id)
					{
						var iteracionDepto=0;
						var porcentajeAnhoAcumuladoDepto=0;
						var porcentajeHoyEjeAcumuladoDepto=0;
						datosGeo=[];
						var porcentajeAnhoAcumuladoDeptoTotal=0;
						var porcentajeHoyEjeAcumuladoDeptoTotal=0;

						$("#cuerpoTabla").html("");
						var lineasDeAccion= [];
						
						if (dist_id=="" && depto_id != ""){
							var metasDistEntLineajson = $.ajax({
						    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getMetasDistEntLinea&departamento='+depto_id+'&institucion_id='+institucion_id,
						      	type:'get',
						      	dataType:'json',
						      	crossDomain:true,
						      	async:false       
						    }).responseText;
							var metasDistEntLinea=JSON.parse(metasDistEntLineajson);
							var desemp=0.0;
							var color="";
							var porHejeClassRow="";
							var acumuladorPlanificacionAnho=0.0;
							var acumuladorPlanificacion=0.0;
							var acumuladorEjecucion=0.0;
							var acumuladorInversion=0.0;
							var desempenho=0.0;
							var lineasDeAccion=[];
							
							for(var l=0;l<metasDistEntLinea.length;l++){
							
								if (lineasDeAccion.indexOf(metasDistEntLinea[l].lineaAccionId)<0){
									lineasDeAccion.push(metasDistEntLinea[l].lineaAccionId);
									acumuladorPlanificacionAnho=0.0;
									acumuladorPlanificacion=0.0;
									acumuladorEjecucion=0.0;
									acumuladorInversion=0.0;
									
									for(var k=0;k<metasDistEntLinea.length;k++){
										if(metasDistEntLinea[l].lineaAccionId==metasDistEntLinea[k].lineaAccionId){
											acumuladorPlanificacionAnho += parseFloat(metasDistEntLinea[k].sumProgAnho);
											acumuladorPlanificacion += parseFloat(metasDistEntLinea[k].cantidadProgHoy);
											acumuladorEjecucion += parseFloat(metasDistEntLinea[k].cantidadEjecHoy);
											acumuladorInversion += parseFloat(metasDistEntLinea[k].costoProgHoy);													
										}
									}
									desempenho = parseFloat((acumuladorEjecucion/acumuladorPlanificacion)*100);
									color= getColorDesemp(desempenho)
									$("#cuerpoTabla").append('<tr class="'+porHejeClassRow+'"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#myModal" class="registro" codigoRegistro='+l+'-'+metasDistEntLinea[l].institucionId+'-'+metasDistEntLinea[l].lineaAccionId+'-'+metasDistEntLinea[l].accionDepartamentoId+'> '+metasDistEntLinea[l].institucion+'- '+metasDistEntLinea[l].lineaAccion+'</a></td><td>'+metasDistEntLinea[l].accionUnidadMedida+'</td><td >'+numeroConComa(parseFloat(acumuladorPlanificacionAnho).toFixed(2))+'</td><td class="cell-bordered2">'+numeroConComa(parseFloat(acumuladorPlanificacion).toFixed(2))+'</td><td >'+numeroConComa(parseFloat(acumuladorEjecucion).toFixed(2))+'</td><td >'+numeroConComa(parseFloat(desempenho).toFixed(2))+'</td><td>'+numeroConComa((acumuladorInversion/1000000).toFixed(0)))+'</td></tr>';
								}
								
		
							}
						}else{
							var metasDistEntLineajson = $.ajax({
						    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getMetasDistEntLinea&departamento='+depto_id+'&distrito='+dist_id+'&institucion_id='+institucion_id,
						      	type:'get',
						      	dataType:'json',
						      	crossDomain:true,
						      	async:false       
						    }).responseText;
							var metasDistEntLinea=JSON.parse(metasDistEntLineajson);
							var desemp=0.0;
							var color="";
							var porHejeClassRow="";
							for(var j=0;j<metasDistEntLinea.length;j++){
								
								desemp = parseFloat((metasDistEntLinea[j].cantidadEjecHoy/metasDistEntLinea[j].cantidadProgHoy)*100);
								color= getColorDesemp(desemp)
								$("#cuerpoTabla").append('<tr class="'+porHejeClassRow+'"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#myModal" class="registro" codigoRegistro='+j+'-'+metasDistEntLinea[j].institucionId+'-'+metasDistEntLinea[j].lineaAccionId+'-'+metasDistEntLinea[j].accionDepartamentoId+'-'+metasDistEntLinea[j].accionDistritoId+'> '+metasDistEntLinea[j].institucion+'- '+metasDistEntLinea[j].lineaAccion+'</a></td><td>'+metasDistEntLinea[j].accionUnidadMedida+'</td><td >'+numeroConComa(metasDistEntLinea[j].sumProgAnho)+'</td><td class="cell-bordered2">'+numeroConComa(metasDistEntLinea[j].cantidadProgHoy)+'</td><td >'+numeroConComa(metasDistEntLinea[j].cantidadEjecHoy)+'</td><td >'+numeroConComa(parseFloat(desemp).toFixed(2))+'</td><td>'+numeroConComa((metasDistEntLinea[j].costoEjecHoy/1000000).toFixed(0))+'</td></tr>');	
							}
							
									
							
							
							
						}
					}

						function getColor(d) {
						  
						  return d >= 90  ? '#008d4c' :
						           d >= 70  ? '#db8b0b' :
						                      '#d33724';
						 /*
							return d >= 90  ? 'green' :
						           d >= 70  ? 'yellow' :
						                      'red';
						  */
						}
						
						function compareGenerico(a,b) {             
							  if (a.clave < b.clave)
							    return -1;
							  if (a.clave > b.clave)
							    return 1;
							  return 0;
							}

						function getClave2(array, clave1, clave2) {
							var val;
							for (val of array){
								if (val.clave1==clave1 && val.clave2==clave2)
									return val.valor;
							}
						}
						
						desPaisDepto=desPaisDepto.sort(compareGenerico);

						function style(feature) {
							return {
								 fillColor: getColor(desPaisDepto[parseInt(feature.properties.dpto)].valor),
						        weight: 2,
						        opacity: 0.6,
						        color: 'white',
						        dashArray: '3',
						        fillOpacity: 0.6
						    };						    
						}
						function style2(feature) {
							return {
								 fillColor: getColor(getClave2(desPaisDist,parseInt(feature.properties.dpto), parseInt(feature.properties.distrito))),
						        weight: 2,
						        opacity: 1,
						        color: 'white',
						        dashArray: '3',
						        fillOpacity: 1
						    };						    
						}
						
						function highlightFeature(e) {
						    var layer = e.target;

						    layer.setStyle({
						        weight: 4,
						        fillOpacity: 1
						    });

						    if (!L.Browser.ie && !L.Browser.opera) {
						        layer.bringToFront();
						    }
						}
						function highlightFeature2(e) {
						    var layer = e.target;
							
						    layer.setStyle({
						        weight: 5,
						        fillOpacity: 1,
						        dashArray: '1'
						    });

						    if (!L.Browser.ie && !L.Browser.opera) {
						        layer.bringToFront();
						    }
						}
						

						
						var map = L.map('map').setView([-24.5, -57], 6);
						var depto = new L.geoJson(deptoGeojson,{style:style,onEachFeature: onEachFeature});
						depto.addTo(map);
						var distLayer;

						function renderEntidad(e){
							$("#cuerpoTabla").html("");
							
							depto.eachLayer(function(l){depto.resetStyle(l);});
							if (typeof distLayer !== "undefined"){
								if (e.target.feature.properties.hasOwnProperty("distrito")){
									renderEntidades(e);
									distLayer.eachLayer(function(l2){distLayer.resetStyle(l2);});
									highlightFeature2(e);
								}else{
									map.removeLayer(distLayer);
									highlightFeature(e);
									renderEntidades(e);
									map.fitBounds(e.target.getBounds());
									e.target.feature.properties.dpto
									distLayer = new L.GeoJSON.AJAX("mapa/"+e.target.feature.properties.dpto+".geojson",{style:style2,onEachFeature: onEachFeature});
									distLayer.addTo(map);
								}
							}else{
								highlightFeature(e);
								renderEntidades(e);
								map.fitBounds(e.target.getBounds());
								e.target.feature.properties.dpto
								distLayer = new L.GeoJSON.AJAX("mapa/"+e.target.feature.properties.dpto+".geojson",{style:style2,onEachFeature: onEachFeature});
								distLayer.addTo(map);
								/* var distritos = new L.geoJson(dist0Geojson,{style:style2,onEachFeature: onEachFeature2});
								distritos.addTo(map);*/
							}

						}
						function onEachFeature(feature, layer) {
						layer.on({
								click: renderEntidad
							});
						}


					</script>
                  
                  
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->

            <div class="col-md-6">
              <div class="box box-default">
                <div class="box-header with-border">
                  <i class="fa fa-building-o"></i>

                  <h3 class="box-title" id="tabla-derecho">Instituciones</h3>

                </div><!-- /.box-header -->
                <div class="box-body no-padding">
                  <table class="table table-condensed">
                    <thead>
                    <tr>
                      <th class="col-md-3">Institución</th>
                      <th class="col-md-9">Desempeño</th>
                    </tr>
                    </thead>
              		<tbody id="tablaInstituciones">

                  </tbody></table>

                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div>
	          
	          
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
                  <th>

                  	Líneas de Acción por Institución
                  </th>
                  
                  <th></th>
                  <th></th>
                  <th colspan="4" class="text-center cell-bordered2">A la fecha</th>
                 
                </tr>
                <tr style="background-color: white;">
                  
                  <th></th>
                  <th>Unidad de Medida</th>
                  <th >Planificación 2015</th>
                  <th class="cell-bordered2">Planificación</th>
                  <th >Ejecución</th>
                  <th>Desempeño (%)</th>
                  <th> Inversión Estimada (Millones de G.)</th>
                </tr>
              </thead>
              <tbody id="cuerpoTabla">
               
              </tbody>
            </table>

	            </div>
			   </div>
			</div>
          </div><!-- /.row -->


<script>
var $tabla=$("#lineasPorEntidad");
/* $tabla.floatThead({
	scrollContainer: function($tabla){
		return $tabla.closest('wrapper');
	}
})*/
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
    
    
    <!-- AdminLTE dashboard demo (This is only for demo purposes) 
    <script src="dist/js/pages/dashboard2.js" type="text/javascript"></script>-->
    
    <!-- Librerias para la rutina de cambio de contraseña -->
    <script src="dist/js/jquerymd5.js" type="text/javascript"></script>    	
    <%@ include file="/frames/pass.jsp" %>
    
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
<!-- End Piwik Code 

<script type="text/javascript" src="bootstrap/js/jquery.min.js"></script>--> 
<script type="text/javascript" src="bootstrap/js/bootstrap-slider.js"></script>

<script>

$("body").on("click", "#cierreEtiquetaDepartamento",function(event){
	var distrito;
	if($("#cierreEtiquetaDistrito").attr("value")!= ""){
		alert ("existe un distrito");
		
		
	}else{
		alert("puede cerrar");
		
	}
	
});


$("body").on("click", "#cierreEtiquetaDistrito",function(event){
	

	var idDepartamento = $(this).attr("parametroDepartamento");
	renderEntidades(idDepartamento);
	
});




$("body").on("click", "#tablaInstituciones",function(event){
	
	
	var institucion_id=event.target.attributes.institucion_id.value;
	var depto_id=event.target.attributes.depto_id.value;
	var dist_id="";
	if (event.target.attributes.hasOwnProperty("dist_id")){
		dist_id=event.target.attributes.dist_id.value;
	}
	if (depto_id==""){
		alert("Favor seleccionar previamente Departamento en el mapa");
	}else{
		renderLineaAccion(depto_id, institucion_id, dist_id);
	}
	
	
	event.stopPropagation();
	
	
});


$(document).ready(function(){
	var lineaAccionAcumuladoMesDepto;
	
	var vectorMin=0;
	var vectorMax=0;
	var vectorMinEjecucion=0;
	var vectorMaxEjecucion=0;
	
	function dibujarLineaAccionAcumuladoMesDepto(lineaAccionAcumuladoMesDepto, vectorMin, vectorMax, vectorMinEjecucion, vectorMaxEjecucion){
		
		var dataPoints=[];
		var ejecutada=[];
		
		var mes;
		var anho;
		var cantidadTotalProgramada=parseFloat(0);
		var cantidadTotalEjecutada=parseFloat(0);
		
		
		$("#rango-fecha").attr("data-slider-min",vectorMin);
		$("#rango-fecha").attr("data-slider-max",vectorMax);
		$("#rango-fecha").attr("data-slider-value","["+vectorMin+","+vectorMax+"]");
		
		$("#rango-fecha-ejecucion").attr("data-slider-min",vectorMinEjecucion);
		$("#rango-fecha-ejecucion").attr("data-slider-max",vectorMaxEjecucion);
		$("#rango-fecha-ejecucion").attr("data-slider-value","["+vectorMinEjecucion+","+vectorMaxEjecucion+"]");
		
		
		$("#fechaInicio").html(lineaAccionAcumuladoMesDepto[vectorMin].mes+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		$("#fechaInicioEjecucion").html(lineaAccionAcumuladoMesDepto[vectorMinEjecucion].mes+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		$("#fechaFin").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+lineaAccionAcumuladoMesDepto[vectorMax].mes);
		$("#fechaFinEjecucion").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+lineaAccionAcumuladoMesDepto[vectorMaxEjecucion].mes);
		
		$("#rango-fecha").slider({});
		$("#rango-fecha-ejecucion").slider({});
		for(var i = 0;i<lineaAccionAcumuladoMesDepto.length; i++)
		{
			cantidadTotalProgramada+=lineaAccionAcumuladoMesDepto[i].cantidad_programada;
	
			if(lineaAccionAcumuladoMesDepto[i].mes >= lineaAccionAcumuladoMesDepto[vectorMin].mes && lineaAccionAcumuladoMesDepto[i].mes <= lineaAccionAcumuladoMesDepto[vectorMax].mes)
			{
 				dataPoints.push({ x: new Date( lineaAccionAcumuladoMesDepto[i].mes), y: cantidadTotalProgramada});
			}

		}
		
		for(var i = 0;i<lineaAccionAcumuladoMesDepto.length; i++)
		{
			cantidadTotalEjecutada+=lineaAccionAcumuladoMesDepto[i].cantidad_ejecutda;
	
			if(lineaAccionAcumuladoMesDepto[i].mes >= lineaAccionAcumuladoMesDepto[vectorMinEjecucion].mes && lineaAccionAcumuladoMesDepto[i].mes <= lineaAccionAcumuladoMesDepto[vectorMaxEjecucion].mes)
			{
 				if (lineaAccionAcumuladoMesDepto[i].cantidad_ejecutda!=0)  ejecutada.push({ x: new Date( lineaAccionAcumuladoMesDepto[i].mes), y: cantidadTotalEjecutada});
			}

		}


		var chart = new CanvasJS.Chart("chartContainer",
				{
						zoomEnabled: true,
						exportEnabled: true,
						exportFileName: lineaAccionAcumuladoMesDepto[0].institucion+" - "+lineaAccionAcumuladoMesDepto[0].linea_accion+" ("+lineaAccionAcumuladoMesDepto[0].accion_unidad_medida+")",
						title: {
							text: "Evolución Mensual" +" ("+lineaAccionAcumuladoMesDepto[0].accion_unidad_medida+")" 
						},
                        	animationEnabled: true,
                        	width: 800,
					axisX:{      
						valueFormatString: "YYYY-MM" ,
						interval: 1,
						intervalType: "month",
						labelAngle: -50,
						labelFontColor: "rgb(0,75,141)",
					},
					axisY: {
						title: "",
						interlacedColor: "#F0FFFF",
						tickColor: "azure",
						titleFontColor: "rgb(0,75,141)"
					},
					data: [
					{        
						indexLabelFontColor: "darkSlateGray",
						showInLegend: true, 
						name: 'programada',
						type: "line",
						//color: "rgba(0,75,141,0.7)",
						markerSize:8,
						legendText:"Programación",
						dataPoints:dataPoints
					},
					{        
						indexLabelFontColor: "darkSlateGray",
						showInLegend: true, 
						name: 'ejecutadas',
						type: "area",
						//color: "rgba(0,75,141,0.8)",
						markerSize:8,
						legendText:"Ejecución",
						dataPoints:ejecutada
					}
				  ]
				});
				
		chart.render();
	 }

	$("body").on("change", "#rango-fecha",function(event){
		var rangoDeFecha= $("#rango-fecha").val();
		var splitDeRango=rangoDeFecha.split(",");
		vectorMin=splitDeRango[0];
		vectorMax=splitDeRango[1];
		
		var rangoDeFechaEjecucion= $("#rango-fecha-ejecucion").val();
		var splitDeRangoEjecucion=rangoDeFechaEjecucion.split(",");
		vectorMinEjecucion=splitDeRangoEjecucion[0];
		vectorMaxEjecucion=splitDeRangoEjecucion[1];
		
		dibujarLineaAccionAcumuladoMesDepto(lineaAccionAcumuladoMesDepto, vectorMin, vectorMax, vectorMinEjecucion, vectorMaxEjecucion);
		
	});
	
	
	$("body").on("change", "#rango-fecha-ejecucion",function(event){
		var rangoDeFecha= $("#rango-fecha").val();
		var splitDeRango=rangoDeFecha.split(",");
		vectorMin=splitDeRango[0];
		vectorMax=splitDeRango[1];
		
		var rangoDeFechaEjecucion= $("#rango-fecha-ejecucion").val();
		var splitDeRangoEjecucion=rangoDeFechaEjecucion.split(",");
		vectorMinEjecucion=splitDeRangoEjecucion[0];
		vectorMaxEjecucion=splitDeRangoEjecucion[1];
		
		dibujarLineaAccionAcumuladoMesDepto(lineaAccionAcumuladoMesDepto, vectorMin, vectorMax, vectorMinEjecucion, vectorMaxEjecucion);
		
	});
	
	$("body").on("click", ".registro",function(event){
		var codigoRegistro = $(this).attr("codigoRegistro");
	    var idParsed = codigoRegistro.split("-");                                                            
		var institucion_id=idParsed[1];
		var linea_accion_id=idParsed[2];
		//var unidad_medida= idParsed[3];
		var idDepartamento= idParsed[3];
		var idDistrito= idParsed[4];
		var tituloModal="";
		var cuerpoModal="";
		var footerModal="<br><br><br>";
		var urlFactHitos="";
		urlFactHitos+='http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getFactHitos2015';
		if (typeof institucion_id != "undefined") urlFactHitos+='&institucion_id='+institucion_id;
		if (typeof linea_accion_id != "undefined") urlFactHitos+='&linea_accion_id='+linea_accion_id;
		if (typeof idDepartamento != "undefined") urlFactHitos+='&departamento='+idDepartamento;
		if (typeof idDistrito != "undefined") urlFactHitos+='&distrito='+idDistrito;
		var registros = $.ajax({
	    	url:urlFactHitos,
	      	type:'get',
	      	dataType:'json',
	      	crossDomain:true,
	      	async:false       
	    }).responseText;
		var elRegistro=JSON.parse(registros);
		
		

		cuerpoModal='<div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">'+
					'<div class="row">'+
						'<div class="row">'+
							'<div class="col-sm-12">'+
								'<div class="table-responsive">'+
									'<table id="example1" class="table table-hover" >'+
									    '<thead>'+
										'<tr class="active"><th>Acción</th><th>Departamento</th><th>Distrito</th><th>U. Medida</th><th>Cantidad. Programado</th><th>Inversión Estimada (Millones de G.)</th><th>Fecha Terminación</th><th>% Programado</th><th>% Ejecutado</th></tr>'+
										'</thead><tbody>';
					var totalCantidadProgramada=0;
					tituloModal='<h3><center>'+elRegistro[0].institucion+'&nbsp;&nbsp;-&nbsp;&nbsp;'+elRegistro[0].linea_accion+'</center></h3>';
					for(var m=0; m<elRegistro.length;m++)
					{
							var registroFecha= elRegistro[m].hito_fecha_entrega.split(" ");
							if (registroFecha[0]=="Jan" || registroFecha[0]=="ene") registroFecha[0]=1;
							if (registroFecha[0]=="Feb" || registroFecha[0]=="feb") registroFecha[0]=2;
							if (registroFecha[0]=="Mar" || registroFecha[0]=="mar") registroFecha[0]=3;
							if (registroFecha[0]=="Apr" || registroFecha[0]=="abr") registroFecha[0]=4;
							if (registroFecha[0]=="May" || registroFecha[0]=="may") registroFecha[0]=5;
							if (registroFecha[0]=="Jun" || registroFecha[0]=="jun") registroFecha[0]=6;
							if (registroFecha[0]=="Jul" || registroFecha[0]=="jul") registroFecha[0]=7;
							if (registroFecha[0]=="Aug" || registroFecha[0]=="ago") registroFecha[0]=8;
							if (registroFecha[0]=="Sep" || registroFecha[0]=="sep") registroFecha[0]=9;
							if (registroFecha[0]=="Oct" || registroFecha[0]=="oct") registroFecha[0]=10;
							if (registroFecha[0]=="Nov" || registroFecha[0]=="nov") registroFecha[0]=11;
							if (registroFecha[0]=="Dec" || registroFecha[0]=="dic") registroFecha[0]=12;
							registroFecha[1].split(",");
							
							cuerpoModal+='<tr><td>'+elRegistro[m].accion+'</td><td>'+elRegistro[m].accion_departamento+'</td><td>'+elRegistro[m].accion_distrito+'</td><td>'+elRegistro[m].accion_unidad_edida+'</td><td>'+elRegistro[m].hito_cantidad_programado+'</td><td>'+numeroConComa((elRegistro[m].accion_costo*elRegistro[m].hito_porcentaje_ejecutado/100000000).toFixed(0))+'</td><td>'+registroFecha[2]+'-'+registroFecha[0]+'-'+registroFecha[1][0]+'</td><td>'+elRegistro[m].hito_porcentaje_programado+'</td><td>'+elRegistro[m].hito_porcentaje_ejecutado+'</td></tr>';
							totalCantidadProgramada+=elRegistro[m].hito_cantidad_programado;
					}
					totalCantidadProgramada=parseFloat(totalCantidadProgramada).toFixed(2);

					cuerpoModal+='</tbody><tfoot><tr class="active"><td colspan="2">Total Cantidad Programada: </td><td colspan="8">'+totalCantidadProgramada+'</td></tr></tfoot>'+
								 '</table>'+
								 '</div></div></div></div></div>';
		
		$('#myModal').find(".modal-title").html("");			
		$('#myModal').find("#tab_1-1").html(""); 
		$('#myModal').find("#tab_2-2").html("");
		$('#myModal').find("#tab_3-2").html("");			
		
		$('#myModal').find(".modal-title").html(tituloModal);
		$('#myModal').find("#tab_1-1").html(cuerpoModal);
		$("#tab_3-2").append('Programación: <label id="fechaInicio"></label><input id="rango-fecha" type="text" class="span2" value="" data-slider-min="10" data-slider-max="1000" data-slider-step="1" data-slider-value="[250,450]"/><label id="fechaFin"></label>');
		$("#tab_3-2").append('<br><br>Ejecución: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label id="fechaInicioEjecucion"></label><input id="rango-fecha-ejecucion" type="text" class="span2" value="" data-slider-min="10" data-slider-max="1000" data-slider-step="1" data-slider-value="[250,450]"/><label id="fechaFinEjecucion"></label>');


		//$('#myModal').find(".modal-footer").html(footerModal);
		var urlAcumulado="";
		var urlFinal="";
		
		
		if (typeof idDistrito != "undefined") {urlAcumulado+='getLineaAccionAcumuladoMesDistrito';urlFinal+="&distrito="+idDistrito}else{
			if (typeof idDepartamento != "undefined") urlAcumulado+='getLineaAccionAcumuladoMesDepto';	
		}
		
		lineaAccionAcumuladoMesDepto = $.ajax({
	    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action='+urlAcumulado+'&institucion_id='+institucion_id+'&linea_accion_id='+linea_accion_id+'&departamento='+idDepartamento+urlFinal,
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		
		
		lineaAccionAcumuladoMesDepto = JSON.parse(lineaAccionAcumuladoMesDepto);
		
		 vectorMin=0;
		 vectorMax=lineaAccionAcumuladoMesDepto.length-1;
		 
		 vectorMinEjecucion=0;
		 vectorMaxEjecucion=lineaAccionAcumuladoMesDepto.length-1;
		//grafico de total cantidad programada y total cantidad ejecutada
		
		$('#myModal').find("#tab_3-2").append('<div id="chartContainer" style="height:400px;"></div>');
		
		function compare(a,b) {             
			  if (a.mes < b.mes)
			    return -1;
			  if (a.mes > b.mes)
			    return 1;
			  return 0;
			}
		
		
		lineaAccionAcumuladoMesDepto=lineaAccionAcumuladoMesDepto.sort(compare);
		
		dibujarLineaAccionAcumuladoMesDepto(lineaAccionAcumuladoMesDepto, vectorMin, vectorMax, vectorMinEjecucion, vectorMaxEjecucion);
		
		 $(function () {
		       
		        $('#example1').dataTable({
		          "bPaginate": false,
		          "bLengthChange": false,
		          "bFilter": true,
		          "bSort": true,
		          "bInfo": true,
		          "bAutoWidth": false,
		          "language":{
		        	    "sProcessing":     "Procesando...",
		        	    "sLengthMenu":     "Mostrar _MENU_ registros",
		        	    "sZeroRecords":    "No se encontraron resultados",
		        	    "sEmptyTable":     "Ningún dato disponible en esta tabla",
		        	    "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
		        	    "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
		        	    "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
		        	    "sInfoPostFix":    "",
		        	    "sSearch":         "Buscar:",
		        	    "sUrl":            "",
		        	    "sInfoThousands":  ",",
		        	    "sLoadingRecords": "Cargando...",
		        	    "oPaginate": {
		        	        "sFirst":    "Primero",
		        	        "sLast":     "Último",
		        	        "sNext":     "Siguiente",
		        	        "sPrevious": "Anterior"
		        	    },
		        	    "oAria": {
		        	        "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
		        	        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
		        	    }
		        	}
		        });
		      });
});
	
	
	
	
	
	renderEntidades();

	
	
});

</script>    
    
  </body>
</html>
