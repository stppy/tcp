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
	
	<link href="bootstrap/css/bootstrapslider.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

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
		
		
		#slider12a .slider-track-high, #slider12c .slider-track-high {
			background: #008d4c;
		}
		
		#slider12b .slider-track-low, #slider12c .slider-track-low {
			background: #d33724;
		}
		
		#slider12c .slider-selection {
			background: #db8b0b;
		}
    </style>
    
    
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link rel="stylesheet" href="plugins/mapa/leaflet.css" />
<script src='dist/leaflet-image.js'></script>

</head>
<body class="skin-blue sidebar-mini sidebar-collapse">



		
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
					
					var pocentajeColor1 = parseInt(70);
					var pocentajeColor2 = parseInt(90);
					
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
							
/* 					function getColorDesemp(val){
						if (parseFloat(val).toFixed(0)>=90){
							return "green";
						}else{
							if (parseFloat(val).toFixed(0)>=70){
								return  color="yellow";
							}else{
								return  color="red";
							}
						}
					} */
					
					function getColorDesemp2(val){
						if (parseFloat(val).toFixed(0)>=pocentajeColor2){
							return "green";
						}else{
							if (parseFloat(val).toFixed(0)>=pocentajeColor1){
								return  color="yellow";
							}else{
								return  color="red";
							}
						}
					}
					
					function setColorBarras(pocentajeColor1, pocentajeColor2){
						
						$("div.progress-bar").each(function(){
							var varlor = parseInt($(this).find('p').html());
							if (varlor >= pocentajeColor2){
								$(this).attr("class", "progress-bar bg-green-active color-palette");
							}else{
								if (varlor >= pocentajeColor1){
									$(this).attr("class", "progress-bar bg-yellow-active color-palette");
								}else{
									$(this).attr("class", "progress-bar bg-red-active color-palette");
								}
							}
						});

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
											color=getColorDesemp2(desPaisDistInst[j].valor);
											$("#tablaInstituciones").append('<tr><td class="col-md-3"><a tipo="filtroPorEntidad" institucion_id='+entidades[i].institucion_id+' depto_id='+e.target.feature.properties.dpto+' dist_id='+e.target.feature.properties.distrito+' >'+entidades[i].institucion+'</a></td><td class="col-md-9"><div class="progress progress-xs"> <div class="progress-bar bg-'+color+'-active color-palette" style="width: '+parseFloat(desPaisDistInst[j].valor).toFixed(0)+'%"><p class="text-left">'+parseFloat(desPaisDistInst[j].valor).toFixed(2)+'%</p></div></div></td></tr>');
										}
									}
								}
							}else{
								
								var lineaAccionDepartamento = $.ajax({
						    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getLineasAccionDepartamento',
						      	type:'get',
						      	dataType:'json',
						      	crossDomain:true,
						      	async:false       
						    }).responseText;
							lineaAccionDepartamento=JSON.parse(lineaAccionDepartamento);
								
								
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
									color=getColorDesemp2(despTotDeptoInst);
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
								color=getColorDesemp2(despTotInst);
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
									color= getColorDesemp2(desempenho)
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
								color= getColorDesemp2(desemp)
								$("#cuerpoTabla").append('<tr class="'+porHejeClassRow+'"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#myModal" class="registro" codigoRegistro='+j+'-'+metasDistEntLinea[j].institucionId+'-'+metasDistEntLinea[j].lineaAccionId+'-'+metasDistEntLinea[j].accionDepartamentoId+'-'+metasDistEntLinea[j].accionDistritoId+'> '+metasDistEntLinea[j].institucion+'- '+metasDistEntLinea[j].lineaAccion+'</a></td><td>'+metasDistEntLinea[j].accionUnidadMedida+'</td><td >'+numeroConComa(metasDistEntLinea[j].sumProgAnho)+'</td><td class="cell-bordered2">'+numeroConComa(metasDistEntLinea[j].cantidadProgHoy)+'</td><td >'+numeroConComa(metasDistEntLinea[j].cantidadEjecHoy)+'</td><td >'+numeroConComa(parseFloat(desemp).toFixed(2))+'</td><td>'+numeroConComa((metasDistEntLinea[j].costoEjecHoy/1000000).toFixed(0))+'</td></tr>');	
							}
	
							
							
						}
					}

						function getColor(d) {
						  
						  return d >= pocentajeColor2  ? '#008d4c' :
						           d >= pocentajeColor1  ? '#db8b0b' :
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

	$("#ex12c").slider({
		id: "slider12c",
		min: 0,
		max: 100,
		range: true,
		value: [ 70, 90 ]
	});


	$("body").on("change", "#ex12c",function(event){
		var rangoDeColor= $("#ex12c").attr("value");
		var splitDeRango=rangoDeColor.split(",");
		pocentajeColor1 = parseInt(splitDeRango[0]);
		pocentajeColor2 = parseInt(splitDeRango[1]); 
		if (typeof distLayer !== "undefined"){
			distLayer.eachLayer(function(l2){distLayer.resetStyle(l2);});
		}
		setColorBarras(pocentajeColor1, pocentajeColor2);
		depto.eachLayer(function(l){depto.resetStyle(l);});

	});
	

	
	var lineaAccionAcumuladoMesDepto;
	
	var vectorMin=0;
	var vectorMax=0;
	var vectorMinEjecucion=0;
	var vectorMaxEjecucion=0;
	
	var porcentaje1 = 70; //la variable porcentaje1 se utiliza para colorear las tablas
	var porcentaje2 = 90 //la variable porcentaje2 se utiliza para colorear las tablas
	
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
		var primerModal="";
		urlFactHitos+='http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getFactHitos2015Accion';
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
		
		if ( $("#myModal").length ) {
			$("#myModal").remove();
			$("#myModal2").remove();
		}
		

		primerModal =     '<div class="modal fade" id="myModal" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">'+
							'<div class="modal-dialog modal-lg" style="width:90%;">'+
							    '<div class="modal-content" >'+
							      '<div class="modal-header">'+
							        '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
							        '<h4 class="modal-title" id="myModalLabel1"></h4>'+
							      '</div>'+
							      '<div class="modal-body" id="cuerpoModalAcciones" >'+
							     		
							     	'<div class="nav-tabs-custom">'+
					                '<ul class="nav nav-tabs pull-right">'+
					              	  '<li class="active"><a href="#tab_1-1" data-toggle="tab"  title="Acciones"><i class="glyphicon glyphicon-list"></i></a></li>'+
					                  '<li><a href="#tab_3-2" data-toggle="tab" title="Evolución"><i class="glyphicon glyphicon-stats"></i></a></li>'+
					                  '<li><a href="#tab_4-2" data-toggle="tab" title="Beneficiarios"><i class="glyphicon glyphicon-user"></i></a></li>'+
					                  '<li><a href="#tab_5-2" data-toggle="tab" title="Ubicaciones"><i class="glyphicon glyphicon glyphicon-map-marker"></i></a></li>'+                    
					                    
					                '</ul>'+
					                '<div class="tab-content">'+
					                  '<div class="tab-pane active" id="tab_1-1"></div>'+
					                  '<div class="tab-pane" id="tab_2-2">'+
			
					                  '</div>'+
					                  '<div class="tab-pane" id="tab_3-2"></div>'+
					                   '<div class="tab-pane" id="tab_4-2"><p>Datos no disponibles</p></div>'+
					                   '<div class="tab-pane" id="tab_5-2"><p>Datos no disponibles</p></div>'+                            
					                '</div>'+
					              '</div>'+
							      '</div>'+
								  '<div class="modal-footer">'+
									
								  '</div>'+
							    '</div>'+ 
							 '</div>'+
							'</div>';
							
		$("body").append(primerModal);
		

		cuerpoModal='<div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">'+
					'<div class="row">'+
						'<div class="row">'+
							'<div class="col-sm-12">'+
								'<div class="table-responsive">'+
									'<table id="example1" class="table table-hover" >'+
									    '<thead>'+
										'<tr class="active"><th>Acción</th><th>Departamento</th><th>Distrito</th><th>U. Medida</th><th>Cantidad. Programado</th><th>Inversión Estimada (Millones de G.)</th><th>Fecha Terminación</th><th>% Programado</th><th>% Ejecutado</th><th>Editar</th><th>Borrar</th></tr>'+
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
							
							cuerpoModal+='<tr><td>'+elRegistro[m].accion+'</td><td>'+elRegistro[m].accion_departamento+'</td><td>'+elRegistro[m].accion_distrito+'</td><td>'+elRegistro[m].accion_unidad_edida+'</td><td>'+elRegistro[m].hito_cantidad_programado+'</td><td>'+numeroConComa((elRegistro[m].accion_costo*elRegistro[m].hito_porcentaje_ejecutado/100000000).toFixed(0))+'</td><td>'+registroFecha[2]+'-'+registroFecha[0]+'-'+registroFecha[1][0]+'</td><td>'+elRegistro[m].hito_porcentaje_programado+'</td><td>'+elRegistro[m].hito_porcentaje_ejecutado+'</td><td><a href="#" class="modalHitoAvances" parametros="'+institucion_id+'-'+linea_accion_id+'-'+idDepartamento+'-'+idDistrito+'-'+elRegistro[m].accion_id+'-'+institucion_id+'-'+linea_accion_id+'-'+idDepartamento+'-'+idDistrito+'" "><span class="glyphicon glyphicon-pencil"></span></a></td><td><span class="glyphicon glyphicon-trash"></span></td></tr>';
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

	function renderTodasLasLineas(){
		
		
		var sumporAClass="";
		var porAejeClass="";
		var porHejeClass="";
		var porHejeClassRow="";
		
		for (var i = 0; i< 18;i++){
			$("#cuerpoTabla").append('<tr><td colspan="12" ><strong>'+departamento[i].nombreDepartamento+'</strong></td></tr>');
			var lineasDeAccion= [];
			for(var j=0;j<lineaAccionDepartamento.length;j++){
				
				if (lineaAccionDepartamento[j].accion_departamento_id==departamento[i].idDepartamento){
					if (lineasDeAccion.indexOf(lineaAccionDepartamento[j].linea_accion_id)<0){
						lineasDeAccion.push(lineaAccionDepartamento[j].linea_accion_id);
						if(lineaAccionDepartamento[j].anho<="2014"){
							var anho1=lineaAccionDepartamento[j];
							
							var anho2;
							for(var k=0;k<lineaAccionDepartamento.length;k++){
								if (anho1.institucion_id==lineaAccionDepartamento[k].institucion_id && anho1.linea_accion_id==lineaAccionDepartamento[k].linea_accion_id && lineaAccionDepartamento[k].anho =="2015" && lineaAccionDepartamento[k].accion_departamento_id ==anho1.accion_departamento_id){
									anho2=lineaAccionDepartamento[k];
								}
							}
							if (typeof anho1==="undefined") {var anho1= new Object(); anho1.cantidad_ejecutada_hoy=""};
							if (typeof anho2==="undefined") {var anho2= new Object(); anho2.cantidad_ejecutada_hoy="";anho2.suma_programada_anho="";anho2.suma_programada_hoy="";};
							if (anho2.suma_programada_anho>0){
								
								//for para recorrer totalLineaPais con if para seleccionar la insittucion, la linea y anho considerando lo cargado en anho2, luego 
								//     anho2.linea_accion_meta = anho2.suma_programada_anho  * 100 / totalLineaPais[y].suma_programada_anho_pais
								for(var l=0; l<totalLineaPais.length;l++)
								{
										if(totalLineaPais[l].institucion_id == anho2.institucion_id && totalLineaPais[l].linea_accion_id == anho2.linea_accion_id && totalLineaPais[l].anho == anho2.anho)
										{
											anho2.linea_accion_meta = parseFloat((anho2.suma_programada_anho / totalLineaPais[l].suma_programada_anho_pais)*anho2.linea_accion_meta).toFixed(2);
										}
								}
						
							//	var porcentajeAnho = (anho2.suma_programada_hoy*100)/anho2.suma_programada_anho;
								var porcentajeAnho = (anho2.suma_programada_anho*100)/anho2.linea_accion_meta;
								porcentajeAnho=parseFloat(porcentajeAnho).toFixed(2);
								var porcentajeAnhoEje = (anho2.cantidad_ejecutada_hoy*100)/anho2.suma_programada_anho;
								porcentajeAnhoEje=parseFloat(porcentajeAnhoEje).toFixed(2);
								var porcentajeHoyEje = (anho2.cantidad_ejecutada_hoy*100)/anho2.suma_programada_hoy;
								porcentajeHoyEje=parseFloat(porcentajeHoyEje).toFixed(2);
								/*if (porcentajeAnho<=70) sumporAClass = "text-danger";
								if (porcentajeAnho>70) sumporAClass = "text-warning";
								if (porcentajeAnho>90) sumporAClass = "text-success";
								
								if (porcentajeAnhoEje<=70) porAejeClass = "text-danger";
								if (porcentajeAnhoEje>70) porAejeClass = "text-warning";
								if (porcentajeAnhoEje>90) porAejeClass = "text-success";
								*/
								porHejeClassRow="";
								/*
								if (porcentajeHoyEje<=70){ porHejeClass = "text-danger";porHejeClassRow="danger";}
								if (porcentajeHoyEje>70){ porHejeClass = "text-warning";porHejeClassRow="warning";}
								if (porcentajeHoyEje>90){ porHejeClass = "text-success";porHejeClassRow="success";}
								
								if (porcentajeAnho<=70){ porHejeClassRow="danger";porHejeClass="";} */
								if (porcentajeAnho<porcentaje2){ porHejeClassRow="danger";porHejeClass="";}
								if (porcentajeAnho>=porcentaje2){ porHejeClassRow="success";
									if (porcentajeHoyEje<=porcentaje1){ porHejeClass = "text-danger";}
									if (porcentajeHoyEje>porcentaje1){ porHejeClass = "text-warning";}
									if (porcentajeHoyEje>porcentaje2){ porHejeClass = "text-success";}
								}
								
								//<td>'+numeroConComa(anho1.cantidad_ejecutada_hoy)+'</td> despues de meta
								$("#cuerpoTabla").append('<tr class="'+porHejeClassRow+'"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#myModal" class="registro" codigoRegistro='+j+'-'+lineaAccionDepartamento[j].institucion_id+'-'+lineaAccionDepartamento[j].linea_accion_id+'-'+lineaAccionDepartamento[j].accion_departamento_id+'> '+lineaAccionDepartamento[j].institucion+'- '+anho2.linea_accion+'</a></td></td><td>Gs.'+numeroConComa((anho2.costo_programado_anho/1000000).toFixed(0))+'</a></td><td>'+anho2.accion_unidad_medida+'</td><td class="cell-bordered2">'+numeroConComa(anho2.linea_accion_meta)+'</td><td></td><td >'+numeroConComa(anho2.suma_programada_anho)+'</td><td class="'+sumporAClass+'">'+porcentajeAnho+'</td><td class="cell-bordered2">'+numeroConComa(anho2.suma_programada_hoy)+'</td><td >'+numeroConComa(anho2.cantidad_ejecutada_hoy)+'</td><td class="text-center '+porHejeClass+'">'+porcentajeHoyEje+'</td></tr>');
															
								
								
								//<td class="'+porAejeClass+'">'+porcentajeAnhoEje+'</td> penultimo
								if ( porcentajeHoyEje ==="NaN"){ porcentajeHoyEje="";porHejeClassRow="";}
							}else{
								var porcentajeAnho = "";
								var porcentajeAnhoEje = "";
								var porcentajeHoyEje ="";
								porHejeClassRow="";
							}
							
							anho2="";
							anho1="";
						}
						if(lineaAccionDepartamento[j].anho>="2015"){
							var anho2=lineaAccionDepartamento[j];
 							var anho1="";
							for(var k=0;k<lineaAccionDepartamento.length;k++){
								if (anho2.institucion_id==lineaAccionDepartamento[k].institucion_id && anho2.linea_accion_id==lineaAccionDepartamento[k].linea_accion_id && lineaAccionDepartamento[k].date_part =="2014"){
									anho1=lineaAccionDepartamento[k];
								}
							}
							if (typeof anho1==="undefined") {var anho1= new Object(); anho1.cantidad_ejecutada_hoy="";};
							if (typeof anho2==="undefined") {var anho2= new Object(); anho2.cantidad_ejecutada_hoy="";anho2.suma_programada_anho="";anho2.suma_programada_hoy="";};
							if (anho2.suma_programada_anho>0){// tenia suma_programada_anho --------------------------------------------------
								
								
								//     anho2.linea_accion_meta = anho2.suma_programada_anho  * 100 / totalLineaPais[y].suma_programada_anho_pais
								for(var l=0; l<totalLineaPais.length;l++)
								{
										if(totalLineaPais[l].institucion_id == anho2.institucion_id && totalLineaPais[l].linea_accion_id == anho2.linea_accion_id && totalLineaPais[l].anho == anho2.anho)
										{
											anho2.linea_accion_meta = parseFloat((anho2.suma_programada_anho / totalLineaPais[l].suma_programada_anho_pais)*anho2.linea_accion_meta).toFixed(2);
										}
								}
								
								
								//var porcentajeAnho = (anho2.suma_programada_hoy*100)/anho2.suma_programada_anho;
								var porcentajeAnho = (anho2.suma_programada_anho*100)/anho2.linea_accion_meta;
								porcentajeAnho=parseFloat(porcentajeAnho).toFixed(2);
								var porcentajeAnhoEje = (anho2.cantidad_ejecutada_hoy*100)/anho2.suma_programada_anho;
								porcentajeAnhoEje=parseFloat(porcentajeAnhoEje).toFixed(2);
								var porcentajeHoyEje = (anho2.cantidad_ejecutada_hoy*100)/anho2.suma_programada_hoy;
								porcentajeHoyEje=parseFloat(porcentajeHoyEje).toFixed(2);
								/*if (porcentajeAnho<=70) sumporAClass = "text-danger";
								if (porcentajeAnho>70) sumporAClass = "text-warning";
								if (porcentajeAnho>90) sumporAClass = "text-success";
								
								if (porcentajeAnhoEje<=70) porAejeClass = "text-danger";
								if (porcentajeAnhoEje>70) porAejeClass = "text-warning";
								if (porcentajeAnhoEje>90) porAejeClass = "text-success";
								*/
								porHejeClassRow="";
								/*
								if (porcentajeHoyEje<=70){ porHejeClass = "text-danger";porHejeClassRow="danger";}
								if (porcentajeHoyEje>70){ porHejeClass = "text-warning";porHejeClassRow="warning";}
								if (porcentajeHoyEje>90){ porHejeClass = "text-success";porHejeClassRow="success";}

								if (porcentajeAnho<=70){ porHejeClassRow="danger";porHejeClass="";} */
								if (porcentajeAnho<porcentaje2){ porHejeClassRow="danger";porHejeClass="";}
								if (porcentajeAnho>=porcentaje2){ porHejeClassRow="success";
									if (porcentajeHoyEje<=porcentaje1){ porHejeClass = "text-danger";}
									if (porcentajeHoyEje>porcentaje1){ porHejeClass = "text-warning";}
									if (porcentajeHoyEje>porcentaje2){ porHejeClass = "text-success";}
								}
								
								
								if (  porcentajeHoyEje ==="NaN"){ porcentajeHoyEje="";porHejeClassRow="";}
							}else{
								var porcentajeAnho = "";
								var porcentajeAnhoEje = "";
								var porcentajeHoyEje ="";
								porHejeClassRow="";
							}
							//<td>'+numeroConComa(anho1.cantidad_ejecutada_hoy)+'</td> despues de meta
							$("#cuerpoTabla").append('<tr class="'+porHejeClassRow+'"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#myModal" class="registro" codigoRegistro='+j+'-'+lineaAccionDepartamento[j].institucion_id+'-'+lineaAccionDepartamento[j].linea_accion_id+'-'+lineaAccionDepartamento[j].accion_departamento_id+'> '+lineaAccionDepartamento[j].institucion+'- '+anho2.linea_accion+'</a></td><td>Gs.'+numeroConComa((anho2.costo_programado_anho/1000000).toFixed(0))+'</td><td>'+anho2.accion_unidad_medida+'</td><td class="cell-bordered2">'+numeroConComa(anho2.linea_accion_meta)+'</td><td></td><td >'+numeroConComa(anho2.suma_programada_anho)+'</td><td class="'+sumporAClass+'">'+porcentajeAnho+'</td><td class="cell-bordered2">'+numeroConComa(anho2.suma_programada_hoy)+'</td><td>'+numeroConComa(anho2.cantidad_ejecutada_hoy)+'</td><td class=" text-center '+porHejeClass+'">'+porcentajeHoyEje+'</td></tr>');
							
							//<td class="'+porAejeClass+'">'+porcentajeAnhoEje+'</td> penultima
							anho2="";
							anho1="";
						}
					}
				}
			}
		}	
		
		
		
	}
	
	//renderTodasLasLineas();
	function cargarTablaAccionHasProducto(accionId){
		
		var accionHasProducto = $.ajax({
	    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getAccionHasProducto&accion_id='+accionId,
	      	type:'get',
	      	dataType:'json',
	      	crossDomain:true,
	      	async:false       
	    }).responseText;		
		accionHasProducto=JSON.parse(accionHasProducto);
		
		
		$("#TablaAccionHasProductos").html("");
		var fila ="";
		for(var f = 0; f < accionHasProducto.length; f++)
		{
			
			fila += "<tr><td>"+accionHasProducto[f].nivel+"</td><td>"+accionHasProducto[f].entidad+"</td><td>"+accionHasProducto[f].tipoPrograma+"</td><td>"+accionHasProducto[f].programa+"</td><td>"+accionHasProducto[f].subPrograma+"</td><td>"+accionHasProducto[f].proyecto+"</td><td>"+accionHasProducto[f].producto+
			"</td><td>"+accionHasProducto[f].cantFisica+"</td><td>"+accionHasProducto[f].uMedida+"</td><td>"+accionHasProducto[f].clase+"</td><td>Gs."+accionHasProducto[f].cantFinanciera+"</td></tr>";
		}
		
		$("#TablaAccionHasProductos").append(fila);
		
	}
	//Falta pregunta si existe el modal y borrar si existe
	$("body").on("click", ".modalHitoAvances",function(event){
		
		if ( $("#myModal2").length ) {
			$("#myModal2").remove();
		}
 		if ( $("#modalAgregarHito").length ) {
			$("#modalAgregarHito").remove();
		} 
		if ( $("#modalDeclararAvance").length ) {
			$("#modalDeclararAvance").remove();
		}
		if ( $("#modalDestinatarios").length ) {
			$("#modalDestinatarios").remove();
		}
		
			
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-");                                                            
		var institucionId=idParsed[0];
		var lineaAccionId=idParsed[1];
		var idDepartamento= idParsed[2];
		var idDistrito= idParsed[3];
		var accionId = idParsed[4];
		var institucionId=idParsed[5];
		var lineaAccionId=idParsed[6];
		var idDepartamento= idParsed[7];
		var idDistrito= idParsed[8];
		var modalHito = "";
		var urlFactHitos="";
		var optionDepartamentos = "";
		var optionDistritos = "";
		urlFactHitos+='http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getFactHitos2015';
		if (typeof institucionId != "undefined"){ urlFactHitos+='&institucion_id='+institucionId;}
		if (typeof lineaAccionId != "undefined"){ urlFactHitos+='&linea_accion_id='+lineaAccionId;}
		if (typeof idDepartamento != "undefined"){ urlFactHitos+='&departamento='+idDepartamento;}
		if (typeof idDistrito != "undefined"){ urlFactHitos+='&distrito='+idDistrito;}
		if (typeof accionId != "undefined"){ urlFactHitos+='&accion_id='+accionId;}

		
		var registrosHitos = $.ajax({
	    	url:urlFactHitos,
	      	type:'get',
	      	dataType:'json',
	      	crossDomain:true,
	      	async:false       
	    }).responseText;		
		var registroHitos=JSON.parse(registrosHitos);
		
		var accion = $.ajax({
	    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getFactHitos2015Accion&accion_id='+accionId,
	      	type:'get',
	      	dataType:'json',
	      	crossDomain:true,
	      	async:false       
	    }).responseText;		
		accion=JSON.parse(accion);
		
		var departamentos = $.ajax({
	    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getDepartamento',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		departamentos = JSON.parse(departamentos);
	
		for(i = 0;i<18; i++){
			optionDepartamentos+='<option value="'+departamentos[i].idDepartamento+'" parametro="'+departamentos[i].idDepartamento+'" class="departamentoSeleccionado">'+departamentos[i].nombreDepartamento+'</option>';
		}
		optionDepartamentos+='<option value="88" parametro="88" class="departamentoSeleccionado">AUX.TRASP.</option>';
		optionDepartamentos+='<option value="99" parametro="99" class="departamentoSeleccionado">ALC.NACIONAL</option>';
/*
		function Combo2(){
			
		    this.selectorDistrito = function(){
		    	
		    }
		}*/
	    
/* 		var eje2 = new Combo();		
		document.getElementsByClassName('departamentoSeleccionado').addEventListener('change',eje2.selectorDistrito,false); */
		

		
		var totalCantidadProgramada=0;
	
		
		modalHito +=	'<div class="modal fade" id="myModal2" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">'+
						'<div class="modal-dialog modal-lg" style="width:90%;" >'+
						    '<div class="modal-content" >'+
						      '<div class="modal-header">'+
						        '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
						        '<h4 class="modal-title" id="myModalLabel1"></h4>'+
						      '</div>'+
						      '<div class="modal-body" style="heigth:1200px;">'+ 
						      
					      			'<div class="row">'+
									'<div class="col-md-12">'+
							         '<div class="box" height="1000px">'+
							           '<div class="box-header with-border" height="1000px">'+
							             '<h2 class="box-title text-center" id="tituloTipoPrograma">'+
							               'Acción'+
							             '</h2>'+
							             '<div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
							             '</div>'+
							           '</div>'+
							           '<div class="box-body" style="display: block;">'+//INICIO DEL BODY
							           '<form role="form">'+
							           '<div class="table-responsive">'+
										'<table class="table table-hover hitos">'+
											'<tbody>'+
												'<tr><td><div class="form-group"><label for="nombreAccion">Acción</label><input type="text" class="form-control" id="nombreAccion" value="'+accion[0].accion+'"><input type="hidden" class="form-control" id="accionId" value="'+accion[0].accion_id+'"></div></td><td><div class="form-group"><label for="umedida">U. medida</label><input type="text" class="form-control" id="umedida" value="'+accion[0].accion_unidad_edida+'"></div></td></tr>'+
												'<tr><td><div class="form-group"><label for="departamento">Departamento</label><select id="selectorDepartamento" name="departamento" class="form-control">'+optionDepartamentos+'</select></div></td><td><div class="form-group"><label for="distrito">Distrito</label><select name="departamento" class="form-control" id="distritosDepartamento"></select></div></td></tr>'+
												'<tr><td colspan="2"><button type="submit" class="btn btn-success">Guardar Acción</button><button type="submit" class="btn btn-success modalAgregarHito" parametros="'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'-'+accionId+'-'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'">Programar Hito</button> <button type="submit" class="btn btn-success modalDeclararAvance" parametros="'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'-'+accionId+'-'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'" >Declarar Avance</button></td></tr>'+
											'</tbody>'+							           
										'</table>'+
										'</div>'+
										'</form>'+
							           '</div>'+//FIN DEL BODY
									   '</div>'+
									'</div>'+
							     '</div>'+	
						      
							      	'<div class="row">'+ 

							      	'<div class="col-md-12">'+
									'<div class="box box-danger">'+
					                	'<div class="box-header with-border">'+
					                  		'<h3 class="box-title">Vinculación de Productos de la acción</h3>'+
				                  			'<div class="box-tools pull-right">'+
							                    '<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>'+
					                    		'</button>'+
					                    		'<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i>'+
					                    		'</button>'+
					                  		'</div>'+
					                	'</div>'+//fin box-heder
					                	'<div class="box-body no-padding">'+
							      			'<div >'+
							      			
							      			'<div class="table-responsive">'+
							                '<table class="table table-striped table-bordered  table-hover">'+
							               ' 	<tr>'+
							                '		<th>Nivel</th>'+
							                '		<th>Entidad</th>'+
							                '		<th>Tipo</th>'+
							                '		<th>Programa</th>'+
							                '		<th>Subprograma</th>'+
							                '		<th>Proyecto</th>'+
							                '		<th>Producto</th>'+
							                '		<th>Total Fisico</th>'+
							                '		<th>U. Medida</th>'+
							                '		<th>Clase</th>'+
							                '		<th>Total Financiero</th>'+
							                '	</tr>'+
							                '<tbody class="table-body-producto" id="TablaAccionHasProductos">'+
							                '</tbody>'+
							                '</table>'+

					                	'</div>'+//fin box-body
					                	'<div class="box-footer">'+
					                	
					                	'<div id="tituloFormulario"></div>'+
				      					'<form class="form-horizontal" role="form" id="formulario" method="post" action="/ajaxUpdate">'+
				      						'<input type="hidden" name="accion" value="actEntidad">'+
				      						'<input type="hidden" name="anho" value="" id="anhoProducto-formulario">'+
				      						'<input type="hidden" name="version" value="" id="versionProducto-formulario">'+

				      						'<div class="form-group col-md-1">'+
				      							'<input type="text" name="nivel" id="nivel-formulario" value="12" class="form-control" disabled>'+
				      						'</div>'+
				      						'<div class="form-group col-md-1">'+
				  								'<input type="text" name="entidad" id="entidad-formulario" value="1" class="form-control" disabled>'+
				  							'</div>'+
				      					    '<div class="form-group col-md-2">'+
				      					    	'<input type="text" name="tipoPrograma" id="tipoPrograma-formulario" placeholder="Tipo Programa" list="listaf3c2" class="form-control">'+
				      					    '</div>'+
				      					    '<div class="form-group col-md-2">'+
				      					    	'<input type="text" name="programa" id="programa-formulario" placeholder="Programa" list="listaf4c2" class="form-control">'+
				      					    '</div>'+
				      					    '<div class="form-group col-md-2">'+
				      					    	'<input type="text" name="subPrograma" id="subPrograma-formulario" placeholder="SubPrograma" list="listaf5c2" class="form-control">'+
				      					    '</div>'+
				      					    '<div class="form-group col-md-2">'+
				      					    	'<input type="text" name="proyecto" id="proyecto-formulario" placeholder="Proyecto" list="listaf6c2" class="form-control">'+
				      					    '</div>'+
				  					    	'<div class="form-group col-md-2">'+
				  					    		'<input type="text" name="producto" id="producto-formulario" placeholder="Producto" list="listaf7c2" class="form-control">'+
				      					  	'</div>'+ 
				      					'</form>'+
				      					
		      					  	'</div>'+
		      					  
					                		'<div class="row">'+
					      					    '<div class="form-group col-md-2">'+
					      					  		'<label for="totalFisico-formulario">Total Fisico</label>'+
				      					    		'<input type="text" name="totalFisico" id="totalFisico-formulario" value="" class="form-control" disabled>'+
				      					    	'</div>'+
					      					    '<div class="form-group col-md-2">'+
				      					  			'<label for="unidadMedida-formulario">U. Medida</label>'+
			      					    			'<input type="text" name="totalFisico" id="unidadMedida-formulario" value="" class="form-control" disabled>'+
			      					    		'</div>'+
					      					    '<div class="form-group col-md-2">'+
			      					  				'<label for="clase-formulario">Clase</label>'+
		      					    				'<input type="text" name="totalFisico" id="clase-formulario" value="" class="form-control" disabled>'+
		      					    			'</div>'+			      					    		
					      					    '<div class="form-group col-md-3">'+
		      					  					'<label for="totalFinanciero-formulario">Total Financiero</label>'+
							      					'<div class="input-group input-group-sm">'+
							      						'<span class="input-group-addon">Gs</span>'+
				      					    			'<input type="text" name="totalFinanciero" id="totalFinanciero-formulario" value="" class="form-control" disabled>'+
							      					'</div>'+
			      					    		'</div>'+
					      					    '<div class="form-group col-md-3">'+
	      					  						'<label for="total-formulario">Total</label>'+
						      						'<div class="input-group input-group-sm">'+
						      							'<span class="input-group-addon">Gs</span>'+
			      					    				'<input type="text" name="total" id="total-formulario" value="" class="form-control" >'+
						      						'</div>'+
		      					    			'</div>'+			      					    		
			      					    	'</div>'+		// fin row
			      					  	'<button type="submit" class="btn btn-success guardarComboProducto"">Guardar</button> <button type="submit" class="btn btn-success verificarDestinatarios" parametros="'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'-'+accionId+'-'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'">Verificar Destinatarios</button>'+
			      					  	

			      					    	
			      					    	'<div class="row">'+//inicio row
				      					    '<div class="form-group col-md-3">'+
      					  					'<label for="totalFinanciero-formulario">Primer Trimestre</label>'+
					      					'<div class="input-group input-group-sm">'+						      			
		      					    			'<input type="text" name="primerTrimestre" id="primerTrimestre-formulario" value="" class="form-control">'+
					      					'</div>'+
	      					    		'</div>'+
	      					    		
				      					'<div class="form-group col-md-3">'+
	  					  					'<label for="totalFinanciero-formulario">Segundo Trimestre</label>'+
					      					'<div class="input-group input-group-sm">'+
		      					    			'<input type="text" name="segundoTrimestre" id="segundoTrimestre-formulario" value="" class="form-control">'+
					      					'</div>'+
	      					    		'</div>'+
      					    		
				      					'<div class="form-group col-md-3">'+
							  					'<label for="totalFinanciero-formulario">Tercer Trimestre</label>'+
					      					'<div class="input-group input-group-sm">'+
		      					    			'<input type="text" name="tercerTrimestre" id="tercerTrimestre-formulario" value="" class="form-control">'+
					      					'</div>'+
		  					    		'</div>'+
  					    		
			      					    '<div class="form-group col-md-3">'+
						  					'<label for="totalFinanciero-formulario">Cuarto Trimestre</label>'+
				      					'<div class="input-group input-group-sm">'+
		  					    			'<input type="text" name="cuartoTrimestre" id="cuartoTrimestre-formulario" value="" class="form-control">'+
				      					'</div>'+
							    		'</div>'+
	      					    	'</div>'+//fin row
			      					  	'<button type="submit" class="btn btn-success guardarComboProducto"">Guardar</button>'+
					                	'</div>'+//fin box-footer
					              	'</div>'+//fin box-danger
					            '</div>'+//fin col-md-6

							      	
						      	
								    	'<div class="col-md-6">'+
								    		 '<div class="box">'+
								      			'<div class="box-header with-border">'+
								       				'<h2 class="box-title text-center">'+
								          				'Agregar Hito'+ 	
								        			'</h2>'+
								        			'<div class="box-tools pull-right"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
								        			'</div>'+
								      			'</div>'+
								      			'<div class="box-body hitosProgramado">'+//cuerpo del body    			
								      				'<div class="table-responsive">'+
														'<table class="table table-hover hitos">'+
															'<thead>'+
																'<tr class="active"><th>Acción</th><th>Departamento</th><th>Distrito</th><th>U. Medida</th><th>Cantidad. Programado</th><th>Costo Total</th><th>Fecha Terminación</th><th>% Programado</th><th>Editar</th></tr>'+
															'</thead>'+
															'<tbody>';
															
															
															for(var m = 0; m < registroHitos.length; m++)
															{
																if(registroHitos[m].hito_porcentaje_programado > 0)
																{
																	modalHito += '<tr><td>'+registroHitos[m].accion+'</td><td>'+registroHitos[m].accion_departamento+'</td><td>'+registroHitos[m].accion_distrito+'</td><td>'+registroHitos[m].accion_unidad_edida+'</td><td>'+registroHitos[m].hito_cantidad_programado+'</td><td>'+registroHitos[m].accion_costo+'</td><td>'+registroHitos[m].hito_fecha_entrega+'</td><td>'+registroHitos[m].hito_porcentaje_programado+'</td><td><a href="#" class="modalEditarHito" parametros="'+registroHitos[m].hito_id+'"><span class="glyphicon glyphicon-pencil"></span></a></td></tr>';
																	totalCantidadProgramada+=registroHitos[m].hito_cantidad_programado;
																}
															}
															totalCantidadProgramada=parseFloat(totalCantidadProgramada).toFixed(2);

															modalHito += '</tbody><tfoot><tr class="active"><td colspan="2">Total Cantidad Programada: </td><td colspan="8">'+totalCantidadProgramada+'</td></tr></tfoot>'+
																		 '</table>'+
																		 '</div>'+
								      			'</div>'+//FIN BODY
									   		'</div>'+
										'</div>'+
								    	'<div class="col-md-6">'+
 							    		'<div class="box">'+
							      			'<div class="box-header with-border">'+
							       				'<h2 class="box-title text-center">'+
							          				'Avance'+ 	
							        			'</h2>'+
							        			'<div class="box-tools pull-right"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>'+
							        			'</div>'+
							      			'</div>'+
							      			'<div class="box-body">'+ 
						      				'<div class="table-responsive">'+
											'<table class="table table-hover hitos">'+
												'<thead>'+
													'<tr class="active"><th>Acción</th><th>Departamento</th><th>Distrito</th><th>U. Medida</th><th>Cantidad. Programado</th><th>Costo Total</th><th>Fecha Terminación</th><th>% Ejecutado</th><th>Editar</th></tr>'+
												'</thead>'+
												'<tbody>';
												
												
												for(var m = 0; m < registroHitos.length; m++)
												{
													if(registroHitos[m].hito_porcentaje_ejecutado > 0)
													{
														modalHito += '<tr><td>'+registroHitos[m].accion+'</td><td>'+registroHitos[m].accion_departamento+'</td><td>'+registroHitos[m].accion_distrito+'</td><td>'+registroHitos[m].accion_unidad_edida+'</td><td>'+registroHitos[m].hito_cantidad_programado+'</td><td>'+registroHitos[m].accion_costo+'</td><td>'+registroHitos[m].hito_fecha_entrega+'</td><td>'+registroHitos[m].hito_porcentaje_ejecutado+'</td><td><a href="#" class="modalEditarHito" parametros="'+registroHitos[m].hito_id+'"><span class="glyphicon glyphicon-pencil"></span></a></td></tr>';
														totalCantidadProgramada+=registroHitos[m].hito_cantidad_programado;
													}
												}
												totalCantidadProgramada=parseFloat(totalCantidadProgramada).toFixed(2);

												modalHito += '</tbody><tfoot><tr class="active"><td colspan="2">Total Cantidad Programada: </td><td colspan="8">'+totalCantidadProgramada+'</td></tr></tfoot>'+
															 '</table>'+
															 '</div>'+						      			
							      			'</div>'+
								   		'</div>'+
									'</div>'+	
									
									
		
									
									
							      	
							    '</div>'+//fin row
							    
						      '</div>'+// fin body
							  '<div class="modal-footer">'+
							 	'<button type="button" class="btn btn-success registro" data-dismiss="modal" codigoregistro="'+institucionId+'-'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'" data-toggle="modal" data-target="#myModal">Cerrar</button>'+
							  '</div>'+
						    '</div>'+
						 '</div>'+
						'</div>';

		
		$("body").append(modalHito);
		$("#myModal2").modal('show');
		
		$("body").on("change", "#selectorDepartamento",function(event){
			//var departamentoId = $(this).attr("parametro");
			var departamentoId = $("#selectorDepartamento option:selected").val();
	    	
			var distritos = $.ajax({
		    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getDistrito&departamento='+departamentoId,
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
			distritos = JSON.parse(distritos);
			optionDistritos="";
			for(k = 0;k<distritos.length; k++){
				
				optionDistritos+='<option value="'+distritos[k].id+'">'+distritos[k].descripcion+'</option>';
			}
			$("#distritosDepartamento").html("");
			$("#distritosDepartamento").append(optionDistritos);
			
		});
		
		cargarTablaAccionHasProducto(accionId);
		
		function Combo(){

		    this.nivelFocus = function(){
			
		   	  var listaDatalist=document.getElementsByTagName('datalist');
		      var datosNiveles = $.ajax({
		          url:'http://spr.stp.gov.py/ajaxSelects?accion=getNiveles',
		          type:'get',
		          	crossDomain: 'true',
		          	dataType:'jsonp',	
		          async:false       
		        }).responseText;  
		  
		        
		        datosNiveles = JSON.parse(datosNiveles);
				
		        if(listaDatalist.length === 0 )
		        {
			        var datalistNiveles = document.createElement('datalist');
			        datalistNiveles.setAttribute('id','listaf1c2');
			        datalistNiveles.setAttribute('size','5'); 
			        var ubicacionDatalistNiveles = document.getElementById('formulario');
			        ubicacionDatalistNiveles.appendChild(datalistNiveles);
			
			        for(var i = 0; i < datosNiveles.niveles.length ; i++) 
			        {    
			        	var option = document.createElement('option');
			          	option.setAttribute('value',datosNiveles.niveles[i].nivel);
			          	option.setAttribute('label',datosNiveles.niveles[i].nombreNivel);
			          	datalistNiveles.appendChild(option);      
			      	} 
		        }
		    } 

		    this.nivel = function(){
		    	//var rutaNivel = document.getElementById('nivel-formulario').value;
		    	var rutaNivel = 12;
		    	var datosNiveles = $.ajax({
		        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getNiveles',
		          	type:'get',
		          	crossDomain: 'true',
		          	dataType:'jsonp',		          	
		          	async:false       
		        }).responseText;

		        
		        datosNiveles = JSON.parse(datosNiveles);
		      	for(var x = 0; x < datosNiveles.niveles.length; x++)
		      	{
		        	if(datosNiveles.niveles[x].nivel === parseInt(rutaNivel))
		        	{
			        	var mostrarNivel = datosNiveles.niveles[x].nombreNivel;
			          	var nt=document.createTextNode(mostrarNivel+" >");
			          	var nparrafo=document.getElementById('tituloFormulario');
			          	nparrafo.innerHTML="";
			          	nparrafo.appendChild(nt);
			        }
		      	}
		    }  


		    this.entidadFocus = function(){ 
		      	//var linkEntidad = document.getElementById('nivel-formulario').value;
		    	var linkEntidad = 12;
		    	var datosEntidades = $.ajax({
		         	 url:'http://spr.stp.gov.py/ajaxSelects?accion=getEntidades&nivel='+linkEntidad,
		          	type:'get',
		          	crossDomain: 'true',
		          	dataType:'jsonp',
		          	async:false
		    	}).responseText;

		          	option.setAttribute('value',datosEntidades.entidades[i].entidad);
		          	option.setAttribute('label',datosEntidades.entidades[i].nombreEntidad);
		          	datalistEntidades.appendChild(option);      
		      	}   
		     


		    this.entidad = function(){ 
		    	//var linkEntidad = document.getElementById('nivel-formulario').value;
		      	//var rutaEntidad2 = document.getElementById('entidad-formulario').value;
		    	var linkEntidad = 12;
		      	var rutaEntidad2 = 1;
		      	

		      	var datosEntidades = $.ajax({
		        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getEntidades&nivel='+linkEntidad,
		          	type:'get',
		          	dataType:'json',
		          	async:false       
		        }).responseText;

		        datosEntidades = JSON.parse(datosEntidades);
		 
		    	for(var x = 0; x < datosEntidades.entidades.length; x++)
		      	{
		        	if(datosEntidades.entidades[x].entidad === parseInt(rutaEntidad2)) 
		        	{
		        		document.getElementById('entidad-formulario').setAttribute("entidad",rutaEntidad2 );
		        		var mostrarEntidad = datosEntidades.entidades[x].nombreEntidad;
		          		var nt=document.createTextNode(mostrarEntidad);
		          		var nparrafo=document.getElementById('tituloFormulario');
		          		//nparrafo.innerHTML="";
		          		nparrafo.appendChild(nt);
		        	} 
		      	} 
		    }  

		    this.tipoProgramaFocus = function(){

		    	var rutaNivel = 12;
		    	var datosNiveles = [];
		    	
				if ( $("#listaf3c2").length ) {
					$("#listaf3c2").remove();
					$('#tipoPrograma-formulario').val('');
					$("#listaf4c2").remove();
					$('#programa-formulario').val('');
					$("#listaf5c2").remove();
					$('#subPrograma-formulario').val('');
					$("#listaf6c2").remove();
					$('#proyecto-formulario').val('');
					$("#listaf7c2").remove();
					$('#producto-formulario').val('');
					$('#totalFisico-formulario').val('');
					$('#unidadMedida-formulario').val('');
					$('#clase-formulario').val('');
					$('#totalFinanciero-formulario').val('');
				}
				
			    $.ajax({
			        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getNiveles',
			          	type:'get',
			          	crossDomain: 'true',
			          	dataType:'jsonp',
		                jsonp: 'callback',
		                jsonpCallback: 'jsonpCallback',
			          	async:false,
			          	success: function( data, textStatus, jqXHR) {
			          		if(data.success){
			          			jsonpCallback(data)
			          		}
			          	}
			        });
		    			
 			    	 function jsonpCallback(data) {
			          		datosNiveles= data;
			          		
					      	for(var y = 0; y < datosNiveles.niveles.length; y++)
					      	{
					        	if(datosNiveles.niveles[y].nivel === parseInt(rutaNivel))
					        	{
						        	var mostrarNivel = datosNiveles.niveles[y].nombreNivel;
						          	var nt=document.createElement('small');
						          	var ntText = document.createTextNode(mostrarNivel);
						          	nt.appendChild(ntText);
						          	var separador=document.createTextNode(" > ");
						          	var nparrafo=document.getElementById('tituloFormulario');
						          	var strong = document.createElement('strong');
						          	strong.appendChild(separador);
						          	nparrafo.innerHTML="";
						          	nparrafo.appendChild(nt);
						          	nparrafo.appendChild(strong);
						          	
						        }
					      	}
					    	
					    	var linkEntidad = 12;
					      	var rutaEntidad2 = 1;
					      	

					      	var datosEntidades =[];
					      		$.ajax({
					        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getEntidades&nivel='+linkEntidad,
					          	type:'get',
					          	crossDomain: 'true',
					          	dataType:'jsonp',
				                jsonp: 'callback',
				                jsonpCallback: 'jsonpCallbackEntidad',
					          	async:false,
					          	success: function( data, textStatus, jqXHR) {
					          		if(data.success){
					          			jsonpCallbackEntidad(data)
					          		}
					          	}
					        });
					      		
					      	function jsonpCallbackEntidad(data) {
					      		datosEntidades= data;
					 
						    	for(var x = 0; x < datosEntidades.entidades.length; x++)
						      	{
						        	if(datosEntidades.entidades[x].entidad === parseInt(rutaEntidad2)) 
						        	{
						        		document.getElementById('entidad-formulario').setAttribute("entidad",rutaEntidad2 );
						        		var mostrarEntidad = datosEntidades.entidades[x].nombreEntidad;
						        		var nt=document.createElement('small');
						          		var ntText=document.createTextNode(mostrarEntidad);
						          		nt.appendChild(ntText);
							          	var separador=document.createTextNode(" > ");
							          	var nparrafo=document.getElementById('tituloFormulario');
							          	var strong = document.createElement('strong');
							          	strong.appendChild(separador);
						          		nparrafo.appendChild(nt);
							          	nparrafo.appendChild(strong);

						        	} 
						      	}
						    	
						      	var datosTipoPrograma = [];
						      		$.ajax({
						        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getTiposPrograma',
						          	type:'get',
						          	crossDomain: 'true',
						          	dataType:'jsonp',
					                jsonp: 'callback',
					                jsonpCallback: 'jsonpCallbackTipoPrograma',
						          	async:false,
						          	success: function( data, textStatus, jqXHR) {
						          		if(data.success){
						          			jsonpCallbackTipoPrograma(data)
						          		}
						          	}    
						        });
	
							    function jsonpCallbackTipoPrograma(data) {
							    	datosTipoPrograma= data;
							    	
							      	var datalistEntidades = document.createElement('datalist'); 
							        datalistEntidades.setAttribute('id','listaf3c2'); 
							        var ubicacionDatalistEntidades = document.getElementById('formulario');
							        ubicacionDatalistEntidades.appendChild(datalistEntidades);
		
							        for(var i = 0; i < datosTipoPrograma.tiposPrograma.length ; i++) 
							        {       
							        	var option = document.createElement('option');
							          	option.setAttribute('value',datosTipoPrograma.tiposPrograma[i].numeroFila);
							          	option.setAttribute('label',datosTipoPrograma.tiposPrograma[i].nombreTipoPrograma);
							          	datalistEntidades.appendChild(option);      
							      	}   
							        
							    }
			          		
					      	}
			          		
			          		
			          		
			          		
			          		
 			    	 } 
		    	   
		    	
		    	   
		    }
		    this.tipoPrograma = function(){
		    	var linkTipoPrograma = document.getElementById('tipoPrograma-formulario').value;

		      	var datosTipoPrograma = [];
		      	
		      	$.ajax({
		        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getTiposPrograma',
		          	type:'get',
		          	crossDomain: 'true',
		          	dataType:'jsonp',
	                jsonp: 'callback',
	                jsonpCallback: 'jsonpCallbackTipoPrograma',
		          	async:false,
		          	success: function( data, textStatus, jqXHR) {
		          		if(data.success){
		          			jsonpCallbackTipoPrograma(data)
		          		}
		          	}        
		        });
		      	
			    function jsonpCallbackTipoPrograma(data) {
			    	datosTipoPrograma= data;

			    	for(var x = 0; x < datosTipoPrograma.tiposPrograma.length; x++)
			      	{
			        	if(datosTipoPrograma.tiposPrograma[x].numeroFila === parseInt(linkTipoPrograma)) 
			        	{
			        		var mostrarTipoPrograma = datosTipoPrograma.tiposPrograma[x].nombreTipoPrograma;
			          		var ntText=document.createTextNode(mostrarTipoPrograma);
			              	var nt=document.createElement('small');
			              	var ntText = document.createTextNode(mostrarTipoPrograma);
			              	nt.appendChild(ntText);
			              	var separador=document.createTextNode(" > ");
			          		var nparrafo=document.getElementById('tituloFormulario');
			              	var strong = document.createElement('strong');
			              	strong.appendChild(separador);
			              	nparrafo.appendChild(nt);
			              	nparrafo.appendChild(strong);
			        	} 
			      	}
			    }
		    }    	

		    this.programasFocus = function(){
		      	//var linkNivel = document.getElementById('nivel-formulario').value;
		      	//var linkEntidad = document.getElementById("entidad-formulario").value;
		    	var linkNivel = 12;
		      	var linkEntidad = 1;
		      	var linkTipoPrograma = parseInt(document.getElementById("tipoPrograma-formulario").value)
		      	;

		    	var datosProgramas = [];
		    	
				if ( $("#listaf4c2").length ) {
					$("#listaf4c2").remove();
					$('#programa-formulario').val('');
					$("#listaf5c2").remove();
					$('#subPrograma-formulario').val('');
					$("#listaf6c2").remove();
					$('#proyecto-formulario').val('');
					$("#listaf7c2").remove();
					$('#producto-formulario').val('');
					$('#totalFisico-formulario').val('');
					$('#unidadMedida-formulario').val('');
					$('#clase-formulario').val('');
					$('#totalFinanciero-formulario').val('');

				}
		    	
		    	$.ajax({
		        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getProgramas&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPrograma,
		          	type:'get',
		          	crossDomain: 'true',
		          	dataType:'jsonp',
	                jsonp: 'callback',
	                jsonpCallback: 'jsonpCallbackPrograma',
		          	async:false,
		          	success: function( data, textStatus, jqXHR) {
		          		if(data.success){
		          			jsonpCallbackPrograma(data)
		          		}
		          	}         
		        });
		        
			    function jsonpCallbackPrograma(data) {
			    	datosProgramas = data;

			    	$("#listaf4c2").remove();
			        var datalistProgramas = document.createElement('datalist');
			        datalistProgramas.setAttribute('id','listaf4c2'); 
			        var ubicacionDatalistProgramas = document.getElementById('formulario');
			        ubicacionDatalistProgramas.appendChild(datalistProgramas);
	
			        for(var i = 0; i < datosProgramas.programas.length ; i++) 
			        {       
				        var option = document.createElement('option');
			    	    option.setAttribute('value',datosProgramas.programas[i].codigoPrograma);
			    	    option.setAttribute('label',datosProgramas.programas[i].nombrePrograma);
			        	datalistProgramas.appendChild(option);       
			      	} 
			    }
		    }
		    
		    this.programas = function(){
		      	//var linkNivel = document.getElementById('nivel-formulario').value;
		      	//var linkEntidad = document.getElementById("entidad-formulario").value;
		    	var linkNivel = 12;
		      	var linkEntidad = 1;
		      	var linkTipoPrograma = document.getElementById("tipoPrograma-formulario").value;
		      	var numeroProgramaIngresado = document.getElementById("programa-formulario").value;

		    	var datosProgramas =  [];
		    	
		    	$.ajax({
		        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getProgramas&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPrograma,
		          	type:'get',
		          	crossDomain: 'true',
		          	dataType:'jsonp',
	                jsonp: 'callback',
	                jsonpCallback: 'jsonpCallbackPrograma',
		          	async:false,
		          	success: function( data, textStatus, jqXHR) {
		          		if(data.success){
		          			jsonpCallbackPrograma(data)
		          		}
		          	}      
		        });

			    function jsonpCallbackPrograma(data) {
			    	datosProgramas = data;
			    	
			    	for(var x = 0; x < datosProgramas.programas.length; x++)
			    	{
			        	if(datosProgramas.programas[x].codigoPrograma === parseInt(numeroProgramaIngresado))
			        	{
			        		var mostrarNombrePrograma = datosProgramas.programas[x].nombrePrograma;
			        		var nt=document.createElement('small');
					        var ntText=document.createTextNode(mostrarNombrePrograma);
					        nt.appendChild(ntText);
					        var separador=document.createTextNode(" > ");
					        var nparrafo=document.getElementById('tituloFormulario');
				          	var strong = document.createElement('strong');
				          	strong.appendChild(separador);
				          	nparrafo.appendChild(nt);
				          	nparrafo.appendChild(strong);

					    }
			      	}
			    }
		    } 

		    this.subProgramasFocus = function(){
			    //var linkNivel = document.getElementById('nivel-formulario').value;
			    //var linkEntidad = document.getElementById('entidad-formulario').value;
		    	var linkNivel = 12;
		      	var linkEntidad = 1;    	
			    var linkTipoPrograma = document.getElementById("tipoPrograma-formulario").value;
			    var linkPrograma = document.getElementById("programa-formulario").value;

		    	var datosSubProgramas = [];
		    	
				if ( $("#listaf5c2").length ) {
					$("#listaf5c2").remove();
					$('#subPrograma-formulario').val('');
					$("#listaf6c2").remove();
					$('#proyecto-formulario').val('');
					$("#listaf7c2").remove();
					$('#producto-formulario').val('');
					$('#totalFisico-formulario').val('');
					$('#unidadMedida-formulario').val('');
					$('#clase-formulario').val('');
					$('#totalFinanciero-formulario').val('');
				}
		    	
		    	$.ajax({
		        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getSubprogramas&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPrograma+'&programa='+linkPrograma,
		          	type:'get',
		          	crossDomain: 'true',
		          	dataType:'jsonp',
	                jsonp: 'callback',
	                jsonpCallback: 'jsonpCallbackSubPrograma',
		          	async:false,
		          	success: function( data, textStatus, jqXHR) {
		          		if(data.success){
		          			jsonpCallbackSubPrograma(data)
		          		}
		          	}       
		        });

			    function jsonpCallbackSubPrograma(data) {
			    	datosSubProgramas = data;
			    	
			        var datalistSubProgramas = document.createElement('datalist');
			        datalistSubProgramas.setAttribute('id','listaf5c2'); 
			        var ubicacionDatalistProgramas = document.getElementById('formulario');
			        ubicacionDatalistProgramas.appendChild(datalistSubProgramas);
	
			          for(var i = 0; i < datosSubProgramas.subprogramas.length ; i++) 
			          {       
				          var option = document.createElement('option');
				          option.setAttribute('value', datosSubProgramas.subprogramas[i].id);
				          option.setAttribute('label', datosSubProgramas.subprogramas[i].nombre);
				          datalistSubProgramas.appendChild(option);     
			      	  } 
			    }
		    } 
		    
		    this.subProgramas = function(){
			    //var linkNivel = document.getElementById('nivel-formulario').value;
			    //var linkEntidad = document.getElementById('entidad-formulario').value;
		    	var linkNivel = 12;
		      	var linkEntidad = 1;
			    var linkTipoPrograma = document.getElementById("tipoPrograma-formulario").value;
			    var linkPrograma = document.getElementById("programa-formulario").value;
			    var numeroSubProgramaIngresado = document.getElementById("subPrograma-formulario").value;

		    	var datosSubProgramas = [];
		    	
		    	$.ajax({
		        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getSubprogramas&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPrograma+'&programa='+linkPrograma,
		          	type:'get',
		          	crossDomain: 'true',
		          	dataType:'jsonp',
	                jsonp: 'callback',
	                jsonpCallback: 'jsonpCallbackSubPrograma',
		          	async:false,
		          	success: function( data, textStatus, jqXHR) {
		          		if(data.success){
		          			jsonpCallbackSubPrograma(data)
		          		}
		          	} 
		        });

			    function jsonpCallbackSubPrograma(data) {
			    	datosSubProgramas = data;
			    	
			      	for(var x = 0; x < datosSubProgramas.subprogramas.length; x++)
			      	{
			        	if(datosSubProgramas.subprogramas[x].id === parseInt(numeroSubProgramaIngresado))
			        	{
				        	var mostrarNombrePrograma = datosSubProgramas.subprogramas[x].nombre;
				        	var nt=document.createElement('small');
				          	var ntText=document.createTextNode(mostrarNombrePrograma);
					        nt.appendChild(ntText);
					        var separador=document.createTextNode(" > ");
				          	var nparrafo=document.getElementById('tituloFormulario');
				          	var strong = document.createElement('strong');
				          	strong.appendChild(separador);
				          	nparrafo.appendChild(nt);
				          	nparrafo.appendChild(strong);
				        }
			      	}
			    }
		    } 
		    
		    this.proyectoFocus = function(){
			    //var linkNivel = document.getElementById("nivel-formulario").value;
			    //var linkEntidad = document.getElementById("entidad-formulario").value;
		    	var linkNivel = 12;
		      	var linkEntidad = 1;
			    var linkTipoPrograma = document.getElementById("tipoPrograma-formulario").value;
			    var linkPrograma = document.getElementById('programa-formulario').value;
			    var linkSubPrograma = document.getElementById('subPrograma-formulario').value;

		    	var datosProyectos = [];
		    	
				if ( $("#listaf6c2").length ) {
					$("#listaf6c2").remove();
					$('#proyecto-formulario').val('');
					$("#listaf7c2").remove();
					$('#producto-formulario').val('');
					$('#totalFisico-formulario').val('');
					$('#unidadMedida-formulario').val('');
					$('#clase-formulario').val('');
					$('#totalFinanciero-formulario').val('');
				}
		    	
		    	$.ajax({
		         	 url:'http://spr.stp.gov.py/ajaxSelects?accion=getProyectos&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPrograma+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma,
		          	type:'get',
		          	crossDomain: 'true',
		          	dataType:'jsonp',
	                jsonp: 'callback',
	                jsonpCallback: 'jsonpCallbackProyecto',
		          	async:false,
		          	success: function( data, textStatus, jqXHR) {
		          		if(data.success){
		          			jsonpCallbackProyecto(data)
		          		}
		          	}    
		        });

			    function jsonpCallbackProyecto(data) {
			    	datosProyectos = data;

			        var datalistProyectos = document.createElement('datalist');
			        datalistProyectos.setAttribute('id','listaf6c2'); 
			        var ubicacionDatalistProyectos = document.getElementById('formulario');
			        ubicacionDatalistProyectos.appendChild(datalistProyectos);
	
			          for(var i = 0; i < datosProyectos.proyectos.length ; i++) 
			          {       
				          var option = document.createElement('option');
				          option.setAttribute('value', datosProyectos.proyectos[i].codigoProyecto);
				          option.setAttribute('label', datosProyectos.proyectos[i].nombreProyecto);
				          datalistProyectos.appendChild(option);      
			      	  } 
			    }
		    }
		    this.proyecto = function(){
			    //var linkNivel = document.getElementById("nivel-formulario").value;
			    //var linkEntidad = document.getElementById("entidad-formulario").value;
		    	var linkNivel = 12;
		      	var linkEntidad = 1;
			    var linkTipoPrograma = document.getElementById("tipoPrograma-formulario").value;
			    var linkPrograma = document.getElementById('programa-formulario').value;
			    var linkSubPrograma = document.getElementById('subPrograma-formulario').value;
			    var numeroProyectoIngresado = document.getElementById("proyecto-formulario").value;

		    	var datosProyectos = [];
		    	$.ajax({
		          url:'http://spr.stp.gov.py/ajaxSelects?accion=getProyectos&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPrograma+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma,
		          type:'get',
		          	crossDomain: 'true',
		          	dataType:'jsonp',
	                jsonp: 'callback',
	                jsonpCallback: 'jsonpCallbackProyecto',
		          	async:false,
		          	success: function( data, textStatus, jqXHR) {
		          		if(data.success){
		          			jsonpCallbackProyecto(data)
		          		}
		          	}    
		        });

			    function jsonpCallbackProyecto(data) {
			    	datosProyectos = data;
				    for(var x = 0; x < datosProyectos.proyectos.length; x++)
			      	{
			        	if(datosProyectos.proyectos[x].codigoProyecto === parseInt(numeroProyectoIngresado))
			        	{
			        		var mostrarNombreProyecto = datosProyectos.proyectos[x].nombreProyecto;
			        		var nt=document.createElement('small');
			          		var ntText=document.createTextNode(mostrarNombreProyecto);
			    	        nt.appendChild(ntText);
			    	        var separador=document.createTextNode(" > ");
			          		var nparrafo=document.getElementById('tituloFormulario');
			              	var strong = document.createElement('strong');
			              	strong.appendChild(separador);
			              	nparrafo.appendChild(nt);
			              	nparrafo.appendChild(strong);

			        	}
			      	}
			   }
		    }
		    
		    this.productoFocus = function(){
			    //var linkNivel = document.getElementById("nivel-formulario").value;
			    //var linkEntidad = document.getElementById("entidad-formulario").value;
		    	var linkNivel = 12;
		      	var linkEntidad = 1;
			    var linkTipoPrograma = document.getElementById("tipoPrograma-formulario").value;
			    var linkPrograma = document.getElementById('programa-formulario').value;
			    var linkSubPrograma = document.getElementById('subPrograma-formulario').value;
			    var linkProyecto = document.getElementById('proyecto-formulario').value;   


		    	var datosProductos = [];
		    	var datosProductosDetalle = [];
		    	
				if ( $("#listaf7c2").length ) {
					$("#listaf7c2").remove();
					$('#producto-formulario').val('');
					$('#totalFisico-formulario').val('');
					$('#unidadMedida-formulario').val('');
					$('#clase-formulario').val('');
					$('#totalFinanciero-formulario').val('');
					
				}
		    	$.ajax({
		         	 url:'http://spr.stp.gov.py/ajaxSelects?accion=getProductosPresupuesto&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipo='+linkTipoPrograma+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma+'&proyecto='+linkProyecto,
		          	type:'get',
		          	crossDomain: 'true',
		          	dataType:'jsonp',
	                jsonp: 'callback',
	                jsonpCallback: 'jsonpCallbackProducto',
		          	async:false,
		          	success: function( data, textStatus, jqXHR) {
		          		if(data.success){
		          			jsonpCallbackProducto(data)
		          		}
		          	}    
		        });

			    function jsonpCallbackProducto(data) {
			    	datosProductos = data;
			    	
			    	
			        var datalistProductos = document.createElement('datalist');
			        datalistProductos.setAttribute('id','listaf7c2'); 
			        var ubicacionDatalistProductos = document.getElementById('formulario');
			        ubicacionDatalistProductos.appendChild(datalistProductos);
			        
 			          for(var i = 0; i < datosProductos.producto.length ; i++) 
			          {       

					    	$.ajax({
					         	 url:'http://spr.stp.gov.py/ajaxSelects?accion=getProductos&producto='+datosProductos.producto[i].producto_id,
					          	type:'get',
					          	crossDomain: 'true',
					          	dataType:'jsonp',
				                jsonp: 'callback',
				                jsonpCallback: 'jsonpCallbackProductoDetalle',
					          	async:false,
					          	success: function( data, textStatus, jqXHR) {
					          		if(data.success){
					          			jsonpCallbackProductoDetalle(data)
					          		}
					          	}    
					        });
			          } 
					    	
			        	  function jsonpCallbackProductoDetalle(data) {
						    	datosProductosDetalle = data;
						    	
					    	
   
							          var option = document.createElement('option');
							          option.setAttribute('value', datosProductosDetalle.productos[0].codigoCatalogo);
							          option.setAttribute('label', datosProductosDetalle.productos[0].nombreCatalogo);
							          datalistProductos.appendChild(option);      
						    }
			        	  
			      	  
			    	
			    }//fin primer callback
		    }
		    
		    this.producto = function(){
			    //var linkNivel = document.getElementById("nivel-formulario").value;
			    //var linkEntidad = document.getElementById("entidad-formulario").value;
		    	var linkNivel = 12;
		      	var linkEntidad = 1;
			    var linkTipoPrograma = document.getElementById("tipoPrograma-formulario").value;
			    var linkPrograma = document.getElementById('programa-formulario').value;
			    var linkSubPrograma = document.getElementById('subPrograma-formulario').value;
			    var linkProyecto = document.getElementById('proyecto-formulario').value; 
			    var linkProducto = document.getElementById('producto-formulario').value; 
			    var datosProductos = [];
			    var valorProducto = [];
			    var datosProductoUnidadMedida = [];
			    var datos = [];
			    var sumaTotal=0;
			    var maxValor = 0;	
			    var totalFinanciero;  
			    
		    	$.ajax({
		         	 url:'http://spr.stp.gov.py/ajaxSelects?accion=getProductos&producto='+linkProducto,
		          	type:'get',
		          	crossDomain: 'true',
		          	dataType:'jsonp',
	                jsonp: 'callback',
	                jsonpCallback: 'jsonpCallbackProducto',
		          	async:false,
		          	success: function( data, textStatus, jqXHR) {
		          		if(data.success){
		          			jsonpCallbackProducto(data)
		          		}
		          	}    
		        });
		    	
		    	function jsonpCallbackProducto(data) {
					datosProductos = data;
		    		
			    	$.ajax({
			         	 url:'http://spr.stp.gov.py/ajaxSelects?accion=getProductoUnidadMedida&unidadMedidaId='+datosProductos.productos[0].codUnidadMedida,
			          	type:'get',
			          	crossDomain: 'true',
			          	dataType:'jsonp',
		                jsonp: 'callback',
		                jsonpCallback: 'jsonpCallbackProductoUnidadMedida',
			          	async:false,
			          	success: function( data, textStatus, jqXHR) {
			          		if(data.success){
			          			jsonpCallbackProductoUnidadMedida(data)
			          		}
			          	}    
			        });
			    	
			    	function jsonpCallbackProductoUnidadMedida(data) {
						datosProductoUnidadMedida = data;
						
		        		var mostrarUnidadMedida = datosProductoUnidadMedida.producto[0].unidadMedidaNombre;
			    		$("#unidadMedida-formulario").val(mostrarUnidadMedida);
			    		
				    	$.ajax({
				         	 url:'http://spr.stp.gov.py/ajaxSelects?accion=getAsignacionPresiVersion&nivel=12&entidad=1&tipo='+linkTipoPrograma+'&programa='+linkPrograma+'&subPrograma='+linkSubPrograma+'&proyecto='+linkProyecto+'&producto='+linkProducto,
				          	type:'get',
				          	crossDomain: 'true',
				          	dataType:'jsonp',
			                jsonp: 'callback',
			                jsonpCallback: 'jsonpCallbackAsignacionPresi',
				          	async:false,
				          	success: function( data, textStatus, jqXHR) {
				          			jsonpCallbackAsignacionPresi(data);
				          	}    
				        });
				    	
				    	function jsonpCallbackAsignacionPresi(data) {
							datos = data;
							totalFinanciero = 0;
			        		for(var z = 0; z < datos.length; z++)
			        		{
			        			totalFinanciero += ( parseFloat(datos[z].planificado1) + parseFloat(datos[z].planificado2) + parseFloat(datos[z].planificado3) + parseFloat(datos[z].planificado4) + parseFloat(datos[z].planificado5) + parseFloat(datos[z].planificado6) + parseFloat(datos[z].planificado7) + parseFloat(datos[z].planificado8) + parseFloat(datos[z].planificado9) + parseFloat(datos[z].planificado10) + parseFloat(datos[z].planificado11) + parseFloat(datos[z].planificado12) );
			        		}
				    		//$("#totalFinanciero-formulario").val(numeroConComa(totalFinanciero));
				    		$("#totalFinanciero-formulario").val(totalFinanciero);
				    		$("#anhoProducto-formulario").val(datos[0].anho);
				    		$("#versionProducto-formulario").val(datos[0].version);


				    	}
			    	}
			    	    	
	        		var mostrarNombreProducto = datosProductos.productos[0].nombreCatalogo;
	        		var nt=document.createElement('small');
	          		var ntText=document.createTextNode(mostrarNombreProducto);
	    	        nt.appendChild(ntText);
	    	        var separador=document.createTextNode(" > ");
	          		var nparrafo=document.getElementById('tituloFormulario');
	              	var strong = document.createElement('strong');
	              	strong.appendChild(separador);
	              	nparrafo.appendChild(nt);
	              	nparrafo.appendChild(strong);
	    	              	
	        		var mostrarClase = datosProductos.productos[0].clase;
		    		$("#clase-formulario").val(mostrarClase);
	              	
					if( datosProductos.productos[0].clase === "N" )
					{
				    	$.ajax({
				         	 url:'http://spr.stp.gov.py/ajaxSelects?accion=getProductoTipoN&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipo='+linkTipoPrograma+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma+'&proyecto='+linkProyecto+'&producto='+linkProducto,
				          	type:'get',
				          	crossDomain: 'true',
				          	dataType:'jsonp',
			                jsonp: 'callback',
			                jsonpCallback: 'jsonpCallbackProductoTipoN',
				          	async:false,
				          	success: function( data, textStatus, jqXHR) {
				          		if(data.success){
				          			jsonpCallbackProductoTipoN(data)
				          		}
				          	}
				        });
				    	
				    	function jsonpCallbackProductoTipoN(data) {
				    		valorProducto = data;
				    		
				    		for(var x = 0; x < valorProducto.productoTipoN.length; x++){
				    			sumaTotal += parseInt(valorProducto.productoTipoN[x].valor);
				    		}
				    		$("#totalFisico-formulario").val(sumaTotal);
				    	}	
					}//finIf
					
 					if( datosProductos.productos[0].clase === "C" )
					{
				    	$.ajax({
				         	 url:'http://spr.stp.gov.py/ajaxSelects?accion=getProductoTipoN&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipo='+linkTipoPrograma+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma+'&proyecto='+linkProyecto+'&producto='+linkProducto,
				          	type:'get',
				          	crossDomain: 'true',
				          	dataType:'jsonp',
			                jsonp: 'callback',
			                jsonpCallback: 'jsonpCallbackProductoTipoC',
				          	async:false,
 				          	success: function( data, textStatus, jqXHR) {
				          		if(data.success){
				          			jsonpCallbackProductoTipoC(data)
				          		}
				          	}   
				        });
				    	function jsonpCallbackProductoTipoC(data) {
				    		valorProducto = data;
				    		
				    		for(var x = 0; x < valorProducto.productoTipoN.length; x++){
				    			if(valorProducto.productoTipoN[x].valor > maxValor)
				    			{
				    				maxValor = valorProducto.productoTipoN[x].valor;
				    			}
				    		}
				    	}		
					} 
		    	}//finCallbackProducto

		    }
		    
		}//fin combo
		
		  var eje1 = new Combo();
		  document.getElementById('nivel-formulario').addEventListener('focus',eje1.nivelFocus,false);
		  document.getElementById('nivel-formulario').addEventListener('change',eje1.nivel,false);
		  document.getElementById('entidad-formulario').addEventListener('focus',eje1.entidadFocus,false);
		  document.getElementById('entidad-formulario').addEventListener('change',eje1.entidad,false);
		  document.getElementById('tipoPrograma-formulario').addEventListener('focus',eje1.tipoProgramaFocus,false); 
		  document.getElementById('tipoPrograma-formulario').addEventListener('change',eje1.tipoPrograma,false);
		  document.getElementById('programa-formulario').addEventListener('focus',eje1.programasFocus,false); 
		  document.getElementById('programa-formulario').addEventListener('change',eje1.programas,false); 
		  document.getElementById('subPrograma-formulario').addEventListener('focus',eje1.subProgramasFocus,false); 
		  document.getElementById('subPrograma-formulario').addEventListener('change',eje1.subProgramas,false);  
		  document.getElementById('proyecto-formulario').addEventListener('focus',eje1.proyectoFocus,false); 
		  document.getElementById('proyecto-formulario').addEventListener('change',eje1.proyecto,false);
		  document.getElementById('producto-formulario').addEventListener('focus',eje1.productoFocus,false); 
		  document.getElementById('producto-formulario').addEventListener('change',eje1.producto,false); 

		
		
	});

	$("body").on("click", ".modalEditarHito",function(event){
		$("#modalEditarHito").remove();
		
		
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-");                                                            
		var hitoId=idParsed[0];
		
		var hitoParaEditar = $.ajax({
	    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getFactHitos2015&hito_id='+hitoId,
	      	type:'get',
	      	dataType:'json',
	      	crossDomain:true,
	      	async:false       
	    }).responseText;		
		hitoParaEditar=JSON.parse(hitoParaEditar);		

		
//MODAL PARA EDITAR HITO
		var modalEditarHito = "";

		modalEditarHito =	 '<div class="modal fade" role="dialog" id="modalEditarHito" data-backdrop="static" data-keyboard="false">'+ 
							    '<div class="modal-dialog modal-lg">'+ 
							    
							      '<div class="modal-content">'+ 
							        '<div class="modal-header">'+ 
							          '<button type="button" class="close" data-dismiss="modal">&times;</button>'+ 
							          '<h4 class="modal-title">Editar Hito</h4><small>('+hitoParaEditar[0].accion_departamento+'-'+hitoParaEditar[0].accion_distrito+'-'+hitoParaEditar[0].institucion+'-'+hitoParaEditar[0].linea_accion+'-'+hitoParaEditar[0].accion+')</small>'+ 
							        '</div>'+ 
							        '<div class="modal-body">'+ 				        
							        '<form role="form">'+
								  	  '<div class="form-group">'+
								  	    '<label for="nombreHito">Nombre Hito</label>'+
								  	    '<input type="text" class="form-control" id="nombreHito" value="'+hitoParaEditar[0].hito+'">'+
								  	  '</div>'+
								  	  '<div class="form-group">'+
								  	    '<label for="unidadMedida">U. Medida</label>'+
								  	    '<input type="text" class="form-control" id="uMedida" value="'+hitoParaEditar[0].accion_unidad_edida+'">'+
								  	  '</div>'+
								  	  '<div class="form-group">'+
								  	    '<label for="cantProgramado">Cantidad Programado</label>'+
								  	    '<input type="text" id="cantProgramado" class="form-control" value="'+hitoParaEditar[0].hito_cantidad_programado+'">'+
								  	  '</div>'+
								  	  '<div class="form-group">'+
								  	    '<label for="costoTotal">Costo Total</label>'+
								  	    '<input type="text" class="form-control" id="costoTotal" value="'+hitoParaEditar[0].accion_costo+'">'+
								  	  '</div>'+
								  	  '<div class="form-group">'+
								  	    '<label for="fechaTerminacion">Fecha Terminación</label>'+
								  	    '<input type="text" class="form-control" id="fechaTerminacion" value="'+hitoParaEditar[0].hito_fecha_entrega+'">'+
								  	  '</div>'+
								  	  '<div class="form-group">'+
								  	    '<label for="porcProgramado">% Programado</label>'+
								  	    '<input type="date" class="form-control" id="porcProgramado" value="'+hitoParaEditar[0].hito_porcentaje_programado+'">'+
								  	  '</div>'+
								  	  '<button type="submit" class="btn btn-success">Guardar</button>'+
								  	'</form>'+
							        
							        '</div>'+ 
							        '<div class="modal-footer">'+ 
							          '<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>'+ 
							        '</div>'+ 
							      '</div>'+ 
							      
							    '</div>'+ 
							  '</div>';
							
															
															
		
		$("body").append(modalEditarHito);
		$("#modalEditarHito").modal('show');
//FIN MODAL PARA EDITAR HITO
		
	});
	
	//Guarda nivel-entidad-tipo-programa-subPrograma-proyecto-producto-anho-version en la tabla accion_has_producto
	$("body").on("click", ".guardarComboProducto",function(event){
		event.stopPropagation();
		event.preventDefault();
		
    	var nivel = 12;
      	var entidad = 1;
	    var tipoPrograma = document.getElementById("tipoPrograma-formulario").value;
	    var programa = document.getElementById('programa-formulario').value;
	    var subPrograma = document.getElementById('subPrograma-formulario').value;
	    var proyecto = document.getElementById('proyecto-formulario').value; 
	    var producto = document.getElementById('producto-formulario').value; 
	    var accionId = document.getElementById('accionId').value; 
	    var anho = document.getElementById('anhoProducto-formulario').value; 
	    var version = document.getElementById('versionProducto-formulario').value; 
	    var totalFisico = document.getElementById('totalFisico-formulario').value; 
	    var unidadMedida = document.getElementById('unidadMedida-formulario').value; 
	    var clase = document.getElementById('clase-formulario').value; 
	    var totalFinanciero = document.getElementById('totalFinanciero-formulario').value; 

	    var datos = new Object();
	    
	    datos.nivel = nivel;
	    datos.entidad = entidad;
	    datos.tipoPrograma = tipoPrograma;
	    datos.programa = programa;
	    datos.subPrograma = subPrograma;
	    datos.proyecto = proyecto;
	    datos.producto = producto;
	    datos.accionId = accionId;
	    datos.anho = anho;
	    datos.version = version;
	    datos.uMedida = unidadMedida;
	    datos.cantFisica = totalFisico;
	    datos.clase = clase;
	    datos.cantFinanciera = totalFinanciero;

	  	var info = JSON.stringify(datos);
	    $.ajax({
	        url: "ajaxInserts?accion=insAccionHasProducto",
	        type: 'POST',
	        dataType: 'json',
	        data: info,
	        contentType: 'application/json',
	        mimeType: 'application/json',
	        success: function (data) {
	        	alert("Guardado!");
	        	cargarTablaAccionHasProducto(accionId);
	        	},
	        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
	        error: function(data,status,er) {
	        	alert("Guardado");
	        	cargarTablaAccionHasProducto(accionId);
	        	}
		 });
		$('#tipoPrograma-formulario').val('');
		$('#programa-formulario').val('');
		$('#subPrograma-formulario').val('');
		$('#proyecto-formulario').val('');
		$('#producto-formulario').val('');
		$('#totalFisico-formulario').val('');
		$('#unidadMedida-formulario').val('');
		$('#clase-formulario').val('');
		$('#totalFinanciero-formulario').val('');
		$('#anhoProducto-formulario').val('');
		$('#versionProducto-formulario').val('');

		
		

		
		
	});
	
	$("body").on("click", ".modalAgregarHito",function(event){
		event.stopPropagation();
		event.preventDefault();
		if ( $("#modalAgregarHito").length ) {
			$("#modalAgregarHito").remove();
		}
		
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-");                                                            
		var institucionId=idParsed[0];
		var lineaAccionId=idParsed[1];
		var idDepartamento= idParsed[2];
		var idDistrito= idParsed[3];
		var accionId = idParsed[4];
		var institucionId=idParsed[5];
		var lineaAccionId=idParsed[6];
		var idDepartamento= idParsed[7];
		var idDistrito= idParsed[8];
		
		var accion = $.ajax({
	    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getFactHitos2015Accion&accion_id='+accionId,
	      	type:'get',
	      	dataType:'json',
	      	crossDomain:true,
	      	async:false       
	    }).responseText;		
		accion=JSON.parse(accion);

		var modalAgregarHito = "";

		modalAgregarHito =	 '<div class="modal fade" role="dialog" id="modalAgregarHito" data-backdrop="static" data-keyboard="false">'+ 
							    '<div class="modal-dialog modal-lg">'+ 
							    
							      '<div class="modal-content">'+ 
							        '<div class="modal-header">'+ 
							          '<button type="button" class="close modalHitoAvances" parametros="'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'-'+accionId+'-'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'">&times;</button>'+ 
							          '<h4 class="modal-title">Agregar Hito</h4>'+ 
							        '</div>'+ 
							        '<div class="modal-body">'+ 
							        
								    	'<form role="form">'+
									  	  '<div class="form-group">'+
									  	    '<label for="departamento">Departamento</label>'+
									  	    '<input type="text" class="form-control" id="departamento" value="'+accion[0].accion_departamento+'" disabled>'+
									  	  '</div>'+
									  	  '<div class="form-group">'+
									  	    '<label for="distrito">Distrito</label>'+
									  	    '<input type="text" class="form-control" id="distrito" value="'+accion[0].accion_distrito+'" disabled>'+
									  	  '</div>'+										  	  
									  	  '<div class="form-group">'+
									  	    '<label for="accionHito">Acción</label>'+
									  	    '<input type="text" class="form-control" id="accionHito" value="'+accion[0].accion+'" disabled>'+
									  	  '</div>'+
								    	'<form role="form">'+
									  	  '<div class="form-group">'+
									  	    '<label for="nombreHito">Nombre Hito</label>'+
									  	    '<input type="text" class="form-control" id="nombreHito" placeholder="Introduzca nombre del hito">'+
									  	  '</div>'+
									  	  '<div class="form-group">'+
									  	    '<label for="tipoHito">Tipo Hito</label>'+
												'<select class="form-control" id="tipoHito">'+
											  	  '<option value="Entregable">Entregable</option>'+
											  	  '<option value="Intermedio">Intermedio</option>'+
											  	  '<option value="Autonomo">Autonomo</option>'+
											  	'</select>'+
									  	  '</div>'+
									  	  '<div class="form-group">'+
									  	    '<label for="unidadMedidaHito">Unidad Medida</label>'+
									  	    '<input type="text" id="unidadMedidaHito" class="form-control" placeholder="Unidad Medida">'+
									  	  '</div>'+
									  	  '<div class="form-group">'+
									  	    '<label for="cantidadPrevistaHito">Cantidad Prevista</label>'+
									  	    '<input type="text" class="form-control" id="cantidadPrevistaHito" placeholder="Cantidad Prevista">'+
									  	  '</div>'+
									  	  '<div class="form-group">'+
									  	    '<label for="cantidadRealHito">Fecha de Entrega</label>'+
									  	    '<input type="text" class="form-control" id="cantidadRealHito" placeholder="Fecha de Entrega">'+
									  	  '</div>'+
									  	  '<button type="submit" class="btn btn-success guardarHito">Guardar</button>'+
									  	'</form>'+
							        
							        '</div>'+ 
							        '<div class="modal-footer">'+ 
							          '<button type="button" class="btn btn-default modalHitoAvances" parametros="'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'-'+accionId+'-'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'">Cerrar</button>'+ 
							        '</div>'+ 
							      '</div>'+ 
							      
							    '</div>'+ 
							  '</div>';
							
															
															
		
		$("body").append(modalAgregarHito);
		$("#modalAgregarHito").modal('show');
		
	});
	
	$("body").on("click", ".guardarHito",function(event){
		
		var accionhito = $("#accionHito").val();
		var nombreHito = $("#nombreHito").val();
		var tipoHito = $("#tipoHito").val();
		var unidadMedida = $("#unidadMedidaHito").val();
		var cantidadPrevista = $("#cantidadPrevistaHito").val();
		var cantidadReal = $("#cantidadRealHito").val();
		var accion = "insHitoPrueba";
		var obj= new Object();
		
		//aca como la clase
		obj.accion = accionhito;
		obj.nombreHito = nombreHito;
		obj.tipoHito = tipoHito;		
		obj.unidadMedida = unidadMedida;
		obj.cantidadPrevista = cantidadPrevista;
		obj.cantidadReal = cantidadReal;

		 $.ajax({
		        url: "ajaxInserts?accion="+accion,
		        type: 'POST',
		        dataType: 'json',
		        data: JSON.stringify(obj),
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        success: function (data) {},
		        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
		        error: function(data,status,er) {}
		 });

		 $("#modalAgregarHito").modal('hide');
	});
	

	
});




//Modal para desplegar Destinatarios
$("body").on("click", ".verificarDestinatarios",function(event){
	event.stopPropagation();
	event.preventDefault();
	
	if ( $("#modalDestinatarios").length ) {
		$("#modalDestinatarios").remove();
	}
	
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");                                                            
	var institucionId=idParsed[0];
	var lineaAccionId=idParsed[1];
	var idDepartamento= idParsed[2];
	var idDistrito= idParsed[3];
	var accionId = idParsed[4];
	var institucionId=idParsed[5];
	var lineaAccionId=idParsed[6];
	var idDepartamento= idParsed[7];
	var idDistrito= idParsed[8];

	var linkNivel = 12;
  	var linkEntidad = 1;
    var linkTipoPrograma = document.getElementById("tipoPrograma-formulario").value;
    var linkPrograma = document.getElementById('programa-formulario').value;
    var linkSubPrograma = document.getElementById('subPrograma-formulario').value;
    var linkProyecto = document.getElementById('proyecto-formulario').value; 
    var linkProducto = document.getElementById('producto-formulario').value;
    var linkDepartamentoId = document.getElementById('selectorDepartamento').value;
    var nombreDepartamento = $("#selectorDepartamento option:selected").text();
    
	var modalVerificarDestinatarios = "";
	var cuerpoTablaDestinatario="";
	var tabla='#tabla-destinatarios-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPrograma+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto;
	

	      $(tabla).html("");
	      
	      //callback ProductoPresupuestoDestinatario
	      	var datosProductoPresupuestoDestinatario =[];
      		$.ajax({
        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getProductoPresupuestoDestinatario&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPrograma+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma+'&proyecto='+linkProyecto+'&producto='+linkProducto+'&deptoPais='+linkDepartamentoId,
          	type:'get',
          	crossDomain: 'true',
          	dataType:'jsonp',
            jsonp: 'callback',
            jsonpCallback: 'jsonpCallbackProductoPresupuestoDestinatarios',
          	async:false,
          	success: function( data, textStatus, jqXHR) {
          		if(data.success){
          			jsonpCallbackProductoPresupuestoDestinatarios(data);
          		}
          	}
        });
      		
      		

      	function jsonpCallbackProductoPresupuestoDestinatarios(data) {
      		datosProductoPresupuestoDestinatario= data;
      		
      		
	      	var datosDepartamentos =[];
      		$.ajax({
        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getDepartamentos',
          	type:'get',
          	crossDomain: 'true',
          	dataType:'jsonp',
            jsonp: 'callback',
            jsonpCallback: 'jsonpCallbackDepartamento',
          	async:false,
          	success: function( data, textStatus, jqXHR) {
          		if(data.success){
          			jsonpCallbackDepartamento(data);
          		}
          	}
        });
      		
      		

      	function jsonpCallbackDepartamento(data) {
      		datosDepartamentos= data;
      		
      		
      		
      		
      		 var modalVerificarDestinatarios="";
      		modalVerificarDestinatarios+='<div class="modal fade" id="modalDestinatarios" data-backdrop="static" data-keyboard="false">'+
 		  '<div class="modal-dialog modal-lg" >'+
 		    '<div class="modal-content">'+
 		      '<div class="modal-header">'+
	          '<button type="button" class="btn btn-default modalHitoAvances" data-dismiss="modal" parametros="'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'-'+accionId+'-'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'" aria-label="Close"><span aria-hidden="true">&times;</button>'+ 
 		      '</div>'+
 		      '<div class="modal-body">'; 
 		    modalVerificarDestinatarios+=
 		        '<div class="box" height="1000px" style="overflow-y: initial !important;overflow-x: initial !important">'+
 		         '<div class="box-header with-border" height="1000px">'+
 		          '<h3 class="box-title" id="tituloTipoPrograma">'+
 		           '<strong>Destinatarios</strong>'+
 		            '</h3>'+
 		              '</div>'+
 		           
 		            
 		            '<div class="box-body scroll-x pre-scrollable">'+
 		              '<ul  class="col-md-12">'+
 		              '<form id="form-guardar-destinatario-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPrograma+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'">'+
                       '<table class="table table-striped table-bordered  table-hover">'+
 	                     ' 	<tr>'+
                       '<th>Destinatario</th>';
 		    				 for (var iDep=0;iDep<20;iDep++){
 		    					modalVerificarDestinatarios+= '<th>'+datosDepartamentos.departamentos[iDep].abrevDepartamento+'</th>';
 		    				 }
 		    				
 		    				
 		    				modalVerificarDestinatarios+='	</tr>'+
 	                      '<tbody class="table-body-producto-destinatario" id="tabla-destinatarios-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPrograma+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'">'+
 	                      '</tbody>'+
 	                      '</table>'+
 	                      '<br>'+
 		                    '<div class="box-footer">'+
					          '<button type="button" class="btn btn-default modalHitoAvances" parametros="'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'-'+accionId+'-'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'">Cerrar</button>'+ 
 		                    '</div>'+
 						'</form>'+
 					'</ul>'+
 				'</div>'+
 				 '</div>'+
 		'</div>';
 		
		    				$("body").append(modalVerificarDestinatarios);
		    				
		    				
		    			  	  var cuerpoTablaDestinatario="";
		    			  	  var destinatarioGrupo= new Array(); //tiene los meses
		    			  	  var destinatarioDepto = new Array(); //tiene los departamentos
		    			  	  var fmr = $(formulario);
		    			  	  for (var iDest=0;iDest<datosProductoPresupuestoDestinatario.producto.length;iDest++){
		    			  		  cuerpoTablaDestinatario+="<tr><td>"+datosProductoPresupuestoDestinatario.producto[iDest].nombreCatalogo+"</td>";
		    			  		  detalleMes=new Array();
		    				    	  if (datosProductoPresupuestoDestinatario.producto.length>0){  
		    				    		  for (var iDepto=0;iDepto<18;iDepto++){
		    				    			  if(datosProductoPresupuestoDestinatario.producto[iDest].departamento == iDepto){
			    				    		  	cuerpoTablaDestinatario+='<td><input type="text" class= "destinatario-dest-dept" size="5px" name="destinatarios-'+linkProducto+'-'+iDest+'-'+iDepto+'" id="dest-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPrograma+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-'+iDest+'-'+iDepto+'" value="'+datosProductoPresupuestoDestinatario.producto[iDest].cantidad+'"></td>';
		    				    			  }else{
				    				    		cuerpoTablaDestinatario+='<td><input type="text" class= "destinatario-dest-dept" size="5px" name="destinatarios-'+linkProducto+'-'+iDest+'-'+iDepto+'" id="dest-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPrograma+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-'+iDest+'-'+iDepto+'" value=""></td>';		 
		    				    			  }
		    				    		  }
		    				    		  	if (datosProductoPresupuestoDestinatario.producto[iDest].departamento == 88){
			    				    		  	cuerpoTablaDestinatario+='<td><input type="text" class= "destinatario-dest-dept" size="5px" name="destinatarios-'+linkProducto+'-'+iDest+'-'+iDepto+'" id="dest-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPrograma+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-'+iDest+'-'+iDepto+'" value="'+datosProductoPresupuestoDestinatario.producto[iDest].cantidad+'"></td><td><input type="text" class= "destinatario-dest-dept" size="5px" name="destinatarios-'+linkProducto+'-'+iDest+'-'+iDepto+'" id="dest-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPrograma+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-'+iDest+'-'+iDepto+'" value=""></td>';			    				    		  		
		    				    		  	}
		    				    		  	if (datosProductoPresupuestoDestinatario.producto[iDest].departamento == 99){
			    				    		  	cuerpoTablaDestinatario+='<td><input type="text" class= "destinatario-dest-dept" size="5px" name="destinatarios-'+linkProducto+'-'+iDest+'-'+iDepto+'" id="dest-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPrograma+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-'+iDest+'-'+iDepto+'" value=""></td><td><input type="text" class= "destinatario-dest-dept" size="5px" name="destinatarios-'+linkProducto+'-'+iDest+'-'+iDepto+'" id="dest-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPrograma+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-'+iDest+'-'+iDepto+'" value="'+datosProductoPresupuestoDestinatario.producto[iDest].cantidad+'"></td>';			    				    		  		
		    				    		  	
	    				    			  	}
		    				    		  	if (datosProductoPresupuestoDestinatario.producto[iDest].departamento != 88 && datosProductoPresupuestoDestinatario.producto[iDest].departamento != 99){
			    				    		  	cuerpoTablaDestinatario+='<td><input type="text" class= "destinatario-dest-dept" size="5px" name="destinatarios-'+linkProducto+'-'+iDest+'-'+iDepto+'" id="dest-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPrograma+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-'+iDest+'-'+iDepto+'" value=""></td><td><input type="text" class= "destinatario-dest-dept" size="5px" name="destinatarios-'+linkProducto+'-'+iDest+'-'+iDepto+'" id="dest-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPrograma+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-'+iDest+'-'+iDepto+'" value=""></td>';			    				    		  			  
	    				    			  	}
		    				    		  
/* 		    				    		  iDepto=88; cuerpoTablaDestinatario+='<td><input type="text" class= "destinatario-dest-dept" size="5px" name="destinatarios-'+linkProducto+'-'+iDest+'-'+iDepto+'" id="dest-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPrograma+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-'+iDest+'-'+iDepto+'" value="'+datosProductoPresupuestoDestinatario.producto[iDest].cantidad+'"></td>';
		    				    		  iDepto=99; cuerpoTablaDestinatario+='<td><input type="text" class= "destinatario-dest-dept" size="5px" name="destinatarios-'+linkProducto+'-'+iDest+'-'+iDepto+'" id="dest-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPrograma+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-'+iDest+'-'+iDepto+'" value="'+datosProductoPresupuestoDestinatario.producto[iDest].cantidad+'"></td>'; */
		    				    	  }else{
		    				    		  for (var iDepto=0;iDepto<20;iDepto++){
		    				    			  cuerpoTablaDestinatario+='<td><input type="text" class= "destinatario-dest-dept" size="5px" name="destinatarios-'+linkProducto+'-'+iDest+'-'+iDepto+'" id="dest-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPrograma+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-'+iDest+'-'+iDepto+'" value=""></td>';
		    				    			  
		    				    		  }
/* 		    				    		  iDepto=88; cuerpoTablaDestinatario+='<td><input type="text" class= "destinatario-dest-dept" size="5px" name="destinatarios-'+linkProducto+'-'+iDest+'-'+iDepto+'" id="dest-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPrograma+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-'+iDest+'-'+iDepto+'" value=""></td>';
		    				    		  iDepto=99; cuerpoTablaDestinatario+='<td><input type="text" class= "destinatario-dest-dept" size="5px" name="destinatarios-'+linkProducto+'-'+iDest+'-'+iDepto+'" id="dest-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPrograma+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-'+iDest+'-'+iDepto+'" value=""></td>'; */
		    				    	  }
		    			  		  cuerpoTablaDestinatario+='<input type="hidden" name="catalogo_destinatario[]" value="'+datosProductoPresupuestoDestinatario.producto[iDest].id+'">'
		    			  		  cuerpoTablaDestinatario+='</tr>';
		    			  		  
		    			  	  }
		    			  	  $(tabla).append(cuerpoTablaDestinatario);				
		    				
	
		    				
		    				
		    				$('#modalDestinatarios').modal('show');
      		
        	}//fin callback departamentos
      }// fin callback productoPresupuestoDestinatario
     
});
 



$("body").on("click", ".modalDeclararAvance",function(event){
	event.stopPropagation();
	event.preventDefault();
	
	if ( $("#modalDeclararAvance").length ) {
		$("#modalDeclararAvance").remove();
	}
	
	var parametros = $(this).attr("parametros");
    var idParsed = parametros.split("-");                                                            
	var institucionId=idParsed[0];
	var lineaAccionId=idParsed[1];
	var idDepartamento= idParsed[2];
	var idDistrito= idParsed[3];
	var accionId = idParsed[4];
	var institucionId=idParsed[5];
	var lineaAccionId=idParsed[6];
	var idDepartamento= idParsed[7];
	var idDistrito= idParsed[8];
	
	var accion = $.ajax({
    	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects?action=getFactHitos2015Accion&accion_id='+accionId,
      	type:'get',
      	dataType:'json',
      	crossDomain:true,
      	async:false       
    }).responseText;		
	accion=JSON.parse(accion);

	var modalDeclararAvance = "";

	modalDeclararAvance =	 '<div class="modal fade" role="dialog" id="modalDeclararAvance" data-backdrop="static" data-keyboard="false">'+ 
						    '<div class="modal-dialog modal-lg">'+ 
						    
						      '<div class="modal-content">'+ 
						        '<div class="modal-header">'+ 
						          '<button type="button" class="close modalHitoAvances" data-dismiss="modal" parametros="'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'-'+accionId+'-'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'">&times;</button>'+ 
						          '<h4 class="modal-title">Declarar Avances</h4>'+ 
						        '</div>'+ 
						        '<div class="modal-body">'+ 
						        
					      			'<form role="form">'+
						      		  '<div class="form-group">'+
						      		    '<label for="departamento">Departamento</label>'+
						      		    '<input type="text" class="form-control" id="departamento" value="'+accion[0].accion_departamento+'" disabled>'+
						      		  '</div>'+
						      		  '<div class="form-group">'+
						      		    '<label for="distrito">Distrito</label>'+
						      		    '<input type="text" class="form-control" id="distrito" value="'+accion[0].accion_distrito+'" disabled>'+
						      		  '</div>'+
						      		  '<div class="form-group">'+
						      		    '<label for="cantidadAvances">Cantidad</label>'+
						      		    '<input type="number" class="form-control" id="cantidadAvances" placeholder="Introduzca cantidad">'+
						      		  '</div>'+
						      		  '<div class="form-group">'+
						      		    '<label for="url">Url</label>'+
						      		    '<input type="url" class="form-control" id="url" placeholder="Introduzca URL">'+
						      		  '</div>'+
						      		  '<div class="form-group">'+
						      		    '<label for="fecha">Fecha Avance</label>'+
						      		    '<input type="date" class="form-control" id="fecha" placeholder="Fecha">'+
						      		  '</div>'+
						      		  '<div class="form-group">'+
						      		    '<label for="coordenadas">Coordenadas Geográficas</label>'+
						      		    '<table class="table">'+
						      		    '<tr><td><input type="text" class="form-control" placeholder="Latitud"></td><td><input type="text" class="form-control" placeholder="Longitud"></td></tr>'+
										'</table>'+
						      		  '</div>'+
						      		  '<div class="form-group">'+
						      		    '<label for="codigoContratacion">Código Contratación</label>'+
						      		    '<input type="text" class="form-control" id="codigoContratacion" placeholder="Código Contratación">'+
						      		  '</div>'+
						      		  '<div class="form-group">'+
						      		    '<label for="beneficiarios">Beneficiarios</label>'+
						      		    '<input type="text" class="form-control" id="beneficiarios" placeholder="Beneficiarios">'+
						      		  '</div>'+
						      		  '<div class="form-group">'+
						      		    '<label for="objetoGasto">Objeto de Gasto</label>'+
						      		    '<input type="text" class="form-control" id="objetoGasto" placeholder="Objeto Gasto">'+
						      		  '</div>'+			
						      		  '<div class="form-group">'+
						      		    '<label for="monto">Monto</label>'+
						      		    '<input type="text" class="form-control" id="monto" placeholder="Monto">'+
						      		  '</div>'+							      		  
						      		  '<button type="submit" class="btn btn-success guardarAvance">Guardar</button>'+
					      			'</form>'+
						        
						        '</div>'+ 
						        '<div class="modal-footer">'+ 
						          '<button type="button" class="btn btn-default modalHitoAvances" data-dismiss="modal" parametros="'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'-'+accionId+'-'+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'">Cerrar</button>'+ 
						        '</div>'+ 
						      '</div>'+ 
						      
						    '</div>'+ 
						  '</div>';
						
														
														
	
	$("body").append(modalDeclararAvance);
	$("#modalDeclararAvance").modal('show');

});

$("body").on("click", ".guardarAvance",function(event){
	var cantidadAvance = $("#cantidadAvances").val();
	var url = $("#url").val();
	//var fecha = $("#Fecha").val();
	var accion = "insAvancePrueba";
	var obj= new Object();
	
	//aca como la clase
	obj.cantidadAvance = cantidadAvance;
	obj.url = url;


	 $.ajax({
	        url: "ajaxInserts?accion="+accion,
	        type: 'POST',
	        dataType: 'json',
	        data: JSON.stringify(obj),
	        contentType: 'application/json',
	        mimeType: 'application/json',
	        success: function (data) {},
	        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
	        error: function(data,status,er) {}
	 });

	 $("#modalAgregarHito").modal('hide');

});

</script>    
<script type="text/javascript" src="bootstrap/js/bootstrap-slider.js"></script>
  </body>
</html>
