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
        
<!--   <script src="frames/entidad.js" type="text/javascript"></script> -->
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
                  <li class="active"><a href="#tab_1-1" data-toggle="tab"><i class="glyphicon glyphicon-list-alt"></i></a></li>
                  <!--<li><a href="#tab_2-2" data-toggle="tab"><i class="glyphicon glyphicon-map-marker"></i></a></li>-->
                  <li><a href="#tab_3-2" data-toggle="tab"><i class="glyphicon glyphicon-stats"></i></a></li>
                    
                </ul>
                <div class="tab-content">
                  <div class="tab-pane active" id="tab_1-1"></div><!-- /.tab-pane -->
                  <div class="tab-pane" id="tab_2-2">
               		<!--  <iframe width='100%' height='520' frameborder='0' src='http://geo.stp.gov.py/user/stp/viz/8f7c6480-2f1c-11e5-aaea-b6fa9714a3b6/embed_map' allowfullscreen webkitallowfullscreen mozallowfullscreen oallowfullscreen msallowfullscreen>
		     		</iframe>  -->
                  </div><!-- /.tab-pane -->
                  <div class="tab-pane" id="tab_3-2">
                  	
                  </div><!-- /.tab-pane -->
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
	
		
	});
	
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
                  <th > Inversión Estimada (Millones de G.)</th>
                </tr>
              </thead>
              <tbody id="cuerpoTabla">

<tr><td colspan="7"><strong>CONCEPCION</strong><small style="padding-left:10px"><a href="http://tablero2015.stp.gov.py/descargas/1.pdf" target="_blank">Detalle Por Distrito</a> / <a href="http://tablero2015.stp.gov.py/descargas/1.pdf" target="_blank">Detalle Por Departamento</a><small></small></small></td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Asistencia Técnica Agropecuaria</td><td>Familias</td><td>10419</td><td class="cell-bordered2">2145</td><td>3402</td><td class="text-center">158,6</td><td>4521</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Inversión en insumos y tecnología agropecuaria</td><td>Familias</td><td>2921</td><td class="cell-bordered2">466</td><td>462</td><td class="text-center">99,1</td><td>202</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Mejoramiento de Suelo</td><td>Familias</td><td>1300</td><td class="cell-bordered2">800</td><td>664</td><td class=" text-center">83,0</td><td>3030</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Construcción de Puentes</td><td>Metros</td><td>15,01</td><td class="cell-bordered2">8,75</td><td>8,75</td><td class="text-center">100,00</td><td>664</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Construcción de Rutas Pavimentadas</td><td>Kilómetros</td><td>50,69</td><td class="cell-bordered2">24,9</td><td>19,93</td><td class="text-center">80,00</td><td>43051</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Mantenimiento de Caminos Vecinales</td><td>Kilómetros</td><td>3373,85</td><td class="cell-bordered2">3108,92</td><td>3008,37</td><td class="text-center">96,8</td><td>4475</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Mantenimiento de Puentes</td><td>Metros</td><td>60,98</td><td class="cell-bordered2">35,56</td><td>35,56</td><td class=" text-center">100,0</td><td>160</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENAVITAT- Soluciones Habitacionales</td><td>Viviendas Sociales</td><td>1435</td><td class="cell-bordered2">265</td><td>386,81</td><td class="text-center">146,0</td><td>20910</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades agropecuarias</td><td>Personas</td><td>298</td><td class="cell-bordered2">135</td><td>135</td><td class=" text-center">100,0</td><td>46</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades comerciales y de servicios</td><td>Personas</td><td>1120</td><td class="cell-bordered2">636</td><td>636</td><td class="text-center">100,0</td><td>136</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades industriales</td><td>Personas</td><td>1589</td><td class="cell-bordered2">764</td><td>764</td><td class=" text-center">100,0</td><td>268</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UI- Fichas Sociales aplicadas</td><td>Familias</td><td>1600</td><td class="cell-bordered2">300</td><td>300</td><td class=" text-center">100,0</td><td>34</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UI- Acondicionamiento de suelo - Familias</td><td>Familias</td><td>1388</td><td class="cell-bordered2">1093</td><td>1093</td><td class=" text-center">100,0</td><td>5027</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UI- Acondicionamiento de suelo - Hectáreas</td><td>Hectáreas</td><td>2617</td><td class="cell-bordered2">1313,97</td><td>1314,07</td><td class=" text-center">100,0</td><td>3200</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UI- Siembra mecanizada - Familias</td><td>Familias</td><td>900</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UI- Siembra mecanizada - Hectáreas</td><td>Hectáreas</td><td>1800</td><td class="cell-bordered2">300</td><td>1428,57</td><td class=" text-center">476,2</td><td>183</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SAS- Familias con Transferencias TEKOPORA</td><td>Familias</td><td>9153</td><td class="cell-bordered2">9153</td><td>9183</td><td class=" text-center">100,3</td><td>23730</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SAS- Promoción social a familias con Transferencias TEKOPORA</a></td><td>Familias</td><td>9540</td><td class="cell-bordered2">9540</td><td>9540</td><td class=" text-center">100,0</td><td>3522</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MH- Adultos mayores con pensión alimentaria</td><td>Personas</td><td>1823</td><td class="cell-bordered2">0</td><td>2243</td><td class="text-center">ND</td><td>19847</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atencion Extramural adultos mayores</td><td>Personas Atendidas</td><td>1901</td><td class="cell-bordered2">1237</td><td>1237</td><td class=" text-center">100,0</td><td>80</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención en Unidades de Salud de la Familia</td><td>Personas Atendidas</td><td>100755</td><td class="cell-bordered2">60453</td><td>60453</td><td class=" text-center">100,0</td><td>7079</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención extramural bucodental</td><td>Personas Atendidas</td><td>2364</td><td class="cell-bordered2">2114</td><td>2114</td><td class=" text-center">100,0</td><td>125</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención extramural ocular</td><td>Personas Atendidas</td><td>8381</td><td class="cell-bordered2">1280</td><td>1306</td><td class=" text-center">102,0</td><td>85</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Contratación de personal en APS</td><td>Personas contratadas</td><td>32</td><td class="cell-bordered2">20</td><td>20</td><td class=" text-center">100,0</td><td>2426</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Fortalecimiento de Unidades de Salud Familiar existentes</td><td>USF</td><td>20</td><td class="cell-bordered2">10</td><td>10</td><td class=" text-center">100,0</td><td>104</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Habilitación de nuevas Unidades de Salud Familiar</td><td>USF</td><td>9</td><td class="cell-bordered2">9</td><td>9,4</td><td class=" text-center">104,4</td><td>4463</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENASA- Suministro de agua potable</td><td>Sistemas de agua</td><td>8,3</td><td class="cell-bordered2">5,1</td><td>4,7</td><td class="text-center">92,2</td><td>1937</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Capacitación docente indígena</td><td>Personas</td><td>2</td><td class="cell-bordered2">2</td><td>4</td><td class=" text-center">200,0</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Expansión de la Iniciación Profesional Agropecuaria - IPA</td><td>Estudiantes</td><td>13</td><td class="cell-bordered2">5,2</td><td>6,5</td><td class=" text-center">125,0</td><td>3</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Iniciación Profesional Agropecuaria - IPA - Capacitación docente</td><td>Docentes</td><td>20</td><td class="cell-bordered2">4</td><td>4</td><td class=" text-center">100,0</td><td>3</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Iniciación Profesional Agropecuaria - IPA - Equipamientos</td><td>Equipamientos</td><td>6</td><td class="cell-bordered2">0,6</td><td>1,8</td><td class=" text-center">300,0</td><td>12</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Transferencias a instituciones educativas</td><td>Matriculados</td><td>19275</td><td class="cell-bordered2">19275</td><td>19275</td><td class="text-center">100,0</td><td>502</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Ampliación y reparación de establecimientos escolares - Proyectos 111 y 822</td><td>Establecimientos</td><td>39,2</td><td class="cell-bordered2">4</td><td>4</td><td class="text-center">100,0</td><td>780</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Construcción de espacios educativos para la primera infancia</td><td>Establecimientos</td><td>5</td><td class="cell-bordered2">5</td><td>5</td><td class=" text-center">100,0</td><td>624</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ANDE- Mejoramiento de Líneas de Distribución</td><td>Kilómetros</td><td>225,36</td><td class="cell-bordered2">31,92</td><td>86,64</td><td class="text-center">271,4</td><td>1436</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DIBEN- Asistencia Alimentaria</td><td>Beneficiarios</td><td>1781</td><td class="cell-bordered2">1781</td><td>1781</td><td class=" text-center">100,0</td><td>75</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DIBEN- Ayuda en Salud Individual</td><td>Personas</td><td>71</td><td class="cell-bordered2">45</td><td>45</td><td class=" text-center">100,0</td><td>169</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SINAFOCAL- Micro y pequeños empresarios</td><td>Personas</td><td>485</td><td class="cell-bordered2">485</td><td>485</td><td class=" text-center">100,0</td><td>588</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Transferencias monetarias a familias</td><td>Familias</td><td>43</td><td class="cell-bordered2">43</td><td>43</td><td class=" text-center">100,0</td><td>175</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Promoción social a familias</td><td>Familias</td><td>54</td><td class="cell-bordered2">54</td><td>8</td><td class=" text-center">14,8,</td><td>11</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Alimentación en centros</td><td>Personas</td><td>16</td><td class="cell-bordered2">16</td><td>38</td><td class=" text-center">237,5</td><td>284</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Apoyo escolar en centros</td><td>Personas</td><td>9</td><td class="cell-bordered2">9</td><td>38</td><td class=" text-center">422,2</td><td>55</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Monitoreo a entidades de abrigo</td><td>Entidades</td><td>1</td><td class="cell-bordered2">1</td><td>1</td><td class=" text-center">100,0,</td><td>1</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Monitoreo a niñez separada de su familia</td><td>Personas</td><td>70</td><td class="cell-bordered2">70</td><td>63</td><td class=" text-center">90,0</td><td>57</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MDI- Cedulación por primera vez</td><td>Personas</td><td>11337</td><td class="cell-bordered2">5337</td><td>5337</td><td class=" text-center">100,0</td><td>169</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENADIS- Asistencia a personas con discapacidad</td><td>Servicios ofrecidos</td><td>822</td><td class="cell-bordered2">822</td><td>822</td><td class=" text-center">100,0</td><td>623</td></tr>

				<tr><td colspan="7"><strong>SAN PEDRO</strong><small style="padding-left:10px"><a href="http://tablero2015.stp.gov.py/descargas/2.pdf" target="_blank">Detalle Por Distrito</a> / <a href="http://tablero2015.stp.gov.py/descargas/2.pdf" target="_blank">Detalle Por Departamento</a><small></small></small></td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Asistencia Técnica Agropecuaria</td><td>Familias</td><td>21722</td><td class="cell-bordered2">3655</td><td>14734</td><td class=" text-center">403,1</td><td>22901</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Cadenas de Valor-Sector Privado</td><td>Familias</td><td>1376</td><td class="cell-bordered2">884</td><td>975</td><td class="text-center">110,3</td><td>381</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Inversión en insumos y tecnología agropecuaria</td><td>Familias</td><td>4892</td><td class="cell-bordered2">1171</td><td>1196</td><td class="text-center">102,1</td><td>1549</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Mejoramiento de Suelo</td><td>Familias</td><td>1470</td><td class="cell-bordered2">970</td><td>816</td><td class=" text-center">84,1</td><td>3725</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Construcción de Caminos Vecinales</td><td>Kilómetros</td><td>6.56</td><td class="cell-bordered2">6,56</td><td>3,11</td><td class="text-center">47,4</td><td>2747</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Construcción de Rutas Pavimentadas</td><td>Kilómetros</td><td>84,89</td><td class="cell-bordered2">50,85</td><td>36,85</td><td class="text-center">72,5</td><td>95102</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Mantenimiento de Caminos Vecinales</td><td>Kilómetros</td><td>2236,98</td><td class="cell-bordered2">2149,51</td><td>2011,16</td><td class="text-center">93,6</td><td>4431</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Mantenimiento de Puentes</td><td>Metros</td><td>93,47</td><td class="cell-bordered2">57,84</td><td>57,84</td><td class=" text-center">100,0</td><td>260</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Mantenimiento de Rutas Pavimentadas</td><td>Kilómetros</td><td>363,5</td><td class="cell-bordered2">0</td><td>0</td><td class="text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENAVITAT- Soluciones Habitacionales</td><td>Viviendas Sociales</td><td>1,773</td><td class="cell-bordered2">55</td><td>241.75</td><td class="text-center">439.55</td><td>11,176</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades agropecuarias</td><td>Personas</td><td>824</td><td class="cell-bordered2">235</td><td>235</td><td class=" text-center">100,0</td><td>81</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades comerciales y de servicios</td><td>Personas</td><td>3355</td><td class="cell-bordered2">1783</td><td>1783</td><td class=" text-center">100,0</td><td>239</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades industriales</td><td>Personas</td><td>2081</td><td class="cell-bordered2">952</td><td>952</td><td class=" text-center">100,0</td><td>138</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UI- Fichas Sociales aplicadas</td><td>Familias</td><td>20900</td><td class="cell-bordered2">73</td><td>73</td><td class=" text-center">100,0</td><td>6</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UI- Acondicionamiento de suelo - Familias</td><td>Familias</td><td>2442</td><td class="cell-bordered2">1893</td><td>1893</td><td class=" text-center">100</td><td>6113</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UI- Acondicionamiento de suelo - Hectáreas</td><td>Hectáreas</td><td>4247,02</td><td class="cell-bordered2">2740,98</td><td>2621,22</td><td class=" text-center">95,6</td><td>5070</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UI- Siembra mecanizada - Familias</td><td>Familias</td><td>1981</td><td class="cell-bordered2">381</td><td>625</td><td class=" text-center">164,0</td><td>4404</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UI- Siembra mecanizada - Hectáreas</td><td>Hectáreas</td><td>4724</td><td class="cell-bordered2">2724</td><td>3307,23</td><td class=" text-center">121,4</td><td>3458</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SAS- Familias con Transferencias TEKOPORA</td><td>Familias</td><td>24210</td><td class="cell-bordered2">24210</td><td>24210</td><td class=" text-center">100,0</td><td>56918</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SAS- Promoción social a familias con Transferencias TEKOPORA</td><td>Familias</td><td>24964</td><td class="cell-bordered2">24964</td><td>24964</td><td class=" text-center">100,0</td><td>9217</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MH- Adultos mayores con pensión alimentaria</td><td>Personas</td><td>2208</td><td class="cell-bordered2">0</td><td>5334</td><td class="text-center">ND</td><td>43004</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atencion Extramural adultos mayores</td><td>Personas Atendidas</td><td>1009</td><td class="cell-bordered2">656</td><td>656</td><td class=" text-center">100,0</td><td>43</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención en Unidades de Salud de la Familia</td><td>Personas Atendidas</td><td>145775</td><td class="cell-bordered2">87465</td><td>87465</td><td class=" text-center">100,0</td><td>10242</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención extramural bucodental</td><td>Personas Atendidas</td><td>3110</td><td class="cell-bordered2">2760</td><td>2760</td><td class=" text-center">100,0</td><td>112</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención extramural ocular</td><td>Personas Atendidas</td><td>1350</td><td class="cell-bordered2">930</td><td>681</td><td class=" text-center">73,2</td><td>44</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Contratación de personal en APS</td><td>Personas contratadas</td><td>62</td><td class="cell-bordered2">35</td><td>35</td><td class=" text-center">100,0</td><td>3973</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Fortalecimiento de Unidades de Salud Familiar existentes</td><td>USF</td><td>35</td><td class="cell-bordered2">20</td><td>20</td><td class=" text-center">100,0</td><td>172</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Habilitación de nuevas Unidades de Salud Familiar</td><td>USF</td><td>12</td><td class="cell-bordered2">12</td><td>12</td><td class=" text-center">100,0</td><td>5001</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENASA- Suministro de agua potable</td><td>Sistemas de agua</td><td>40,2</td><td class="cell-bordered2">29</td><td>21,45</td><td class="text-center">74,0</td><td>13832</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Expansión de la Iniciación Profesional Agropecuaria - IPA</td><td>Estudiantes</td><td>111</td><td class="cell-bordered2">44,4</td><td>55,5</td><td class=" text-center">125,0</td><td>52</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Iniciación Profesional Agropecuaria - IPA - Capacitación docente</td><td>Docentes</td><td>41</td><td class="cell-bordered2">8,2</td><td>8,2</td><td class=" text-center">100,0</td><td>5</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Iniciación Profesional Agropecuaria - IPA - Equipamientos</td><td>Equipamientos</td><td>16</td><td class="cell-bordered2">1,6</td><td>4,8</td><td class=" text-center">300,0</td><td>32</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Transferencias a instituciones educativas</td><td>Matriculados</td><td>31920</td><td class="cell-bordered2">31920</td><td>31920</td><td class="text-center">100,0</td><td>737</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Ampliación y reparación de establecimientos escolares - Proyectos 111 y 822</td><td>Establecimientos</td><td>0</td><td class="cell-bordered2">0</td><td>0</td><td class="text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Construcción de espacios educativos para la primera infancia</td><td>Establecimientos</td><td>8</td><td class="cell-bordered2">8</td><td>17</td><td class=" text-center">212,5</td><td>2143</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ANDE- Mejoramiento de Líneas de Distribución</td><td>Kilómetros</td><td>434,1</td><td class="cell-bordered2">153,33</td><td>133,16</td><td class="text-center">86,8</td><td>2715</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DIBEN- Asistencia Alimentaria</td><td>Beneficiarios</td><td>3066</td><td class="cell-bordered2">3066</td><td>3066</td><td class=" text-center">100,0</td><td>53</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DIBEN- Ayuda en Salud Individual</td><td>Personas</td><td>292</td><td class="cell-bordered2">187</td><td>187</td><td class="text-center">100,0</td><td>551</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SINAFOCAL- Micro y pequeños empresarios</td><td>Personas</td><td>585</td><td class="cell-bordered2">585</td><td>585</td><td class=" text-center">100,0</td><td>1012</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MDI- Cedulación por primera vez</td><td>Personas</td><td>17422</td><td class="cell-bordered2">9527</td><td>9527</td><td class=" text-center">100,0</td><td>301</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENADIS- Asistencia a personas con discapacidad</td><td>Servicios ofrecidos</td><td>1529</td><td class="cell-bordered2">1529</td><td>1529</td><td class=" text-center">104,1</td><td>1351</td></tr>						              
						              
				<tr><td colspan="7"><strong>CORDILLERA</strong><small style="padding-left:10px"><a href="http://tablero2015.stp.gov.py/descargas/3.pdf" target="_blank">Detalle Por Distrito</a> / <a href="http://tablero2015.stp.gov.py/descargas/3.pdf" target="_blank">Detalle Por Departamento</a><small></small></small></td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Asistencia Técnica Agropecuaria</td><td>Familias</td><td>2307</td><td class="cell-bordered2">1660</td><td>2232</td><td class=" text-center">134,5</td><td>2931</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Inversión en insumos y tecnología agropecuaria </td><td>Familias</td><td>623</td><td class="cell-bordered2">368</td><td>362</td><td class="text-center">98,4</td><td>1474</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Mejoramiento de Suelo</td><td>Familias</td><td>541</td><td class="cell-bordered2">141</td><td>113</td><td class=" text-center">80,1</td><td>515</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Construcción de Rutas Pavimentadas</td><td>Kilómetros</td><td>164,32</td><td class="cell-bordered2">158,45</td><td>413,45</td><td class="text-center">260,2</td><td>351223</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Mantenimiento de Caminos Vecinales</td><td>Kilómetros</td><td>4,34</td><td class="cell-bordered2">2,56</td><td>13,51</td><td class="text-center">527,7</td><td>9</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Mantenimiento de Rutas Pavimentadas</td><td>Kilómetros</td><td>148,51</td><td class="cell-bordered2">7,43</td><td>0</td><td class="text-center">0,0</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENAVITAT- Soluciones Habitacionales</td><td>Viviendas Sociales</td><td>338,02</td><td class="cell-bordered2">233,02</td><td>360</td><td class="text-center">154,5</td><td>17939</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades agropecuarias</td><td>Personas</td><td>1077</td><td class="cell-bordered2">622</td><td>622</td><td class=" text-center">100,0</td><td>127</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades comerciales y de servicios</td><td>Personas</td><td>3063</td><td class="cell-bordered2">2134</td><td>2134</td><td class=" text-center">100,0</td><td>259</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP - Capacitación en actividades industriales</td><td>Personas</td><td>1784</td><td class="cell-bordered2">986</td><td>986</td><td class=" text-center">100,0</td><td>355</td></tr>			
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UI- Fichas Sociales aplicadas</td><td>Familias</td><td>2800</td><td class="cell-bordered2">298</td><td>298</td><td class=" text-center">100,0</td><td>24</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SAS- Familias con Transferencias TEKOPORA</td><td>Familias</td><td>627</td><td class="cell-bordered2">627</td><td>627</td><td class=" text-center">100,0</td><td>1469</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SAS- Promoción social a familias con Transferencias TEKOPORA</td><td>Familias</td><td>644</td><td class="cell-bordered2">644</td><td>644</td><td class=" text-center">100,0</td><td>238</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MH- Adultos mayores con pensión alimentaria</td><td>Personas</td><td>2073</td><td class="cell-bordered2">0</td><td>85,27</td><td class="text-center">ND</td><td>35041</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atencion Extramural adultos mayores</td><td>Personas Atendidas</td><td>1791</td><td class="cell-bordered2">1165</td><td>1165</td><td class=" text-center">100,0</td><td>76</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención en Unidades de Salud de la Familia</td><td>Personas Atendidas</td><td>92180</td><td class="cell-bordered2">55308</td><td>55308</td><td class=" text-center">100,0</td><td>6476</td></tr>
				<tr class=""><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención extramural bucodental</td><td>Personas Atendidas</td><td>890</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención extramural ocular</td><td>Personas Atendidas</td><td>540</td><td class="cell-bordered2">340</td><td>311</td><td class=" text-center">91,5</td><td>20</td></tr>
				<tr class=""><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Contratación de personal en APS</td><td>Personas contratadas</td><td>11</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Fortalecimiento de Unidades de Salud Familiar existentes</td><td>USF</td><td>5</td><td class="cell-bordered2">5</td><td>5</td><td class=" text-center">100,0</td><td>47</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENASA- Suministro de agua potable</td><td>Sistemas de agua</td><td>3,1</td><td class="cell-bordered2">0</td><td>0</td><td class="text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Expansión de la Iniciación Profesional Agropecuaria - IPA</td><td>Estudiantes</td><td>36</td><td class="cell-bordered2">14,4</td><td>18</td><td class=" text-center">125,0</td><td>7</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Iniciación Profesional Agropecuaria - IPA - Capacitación docente</td><td>Docentes</td><td>2</td><td class="cell-bordered2">0,4</td><td>0,4</td><td class=" text-center">100,0</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Iniciación Profesional Agropecuaria - IPA - Equipamientos</td><td>Equipamientos informáticos</td><td>6</td><td class="cell-bordered2">0,6</td><td>1,8</td><td class=" text-center">300,0</td><td>534</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Transferencias a instituciones educativas</td><td>Matriculados</td><td>22662</td><td class="cell-bordered2">22662</td><td>22662</td><td class="text-center">100,0</td><td>534</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Ampliación y reparación de establecimientos escolares - Proyectos 111 y 822</td><td>Establecimientos</td><td>0,6</td><td class="cell-bordered2">0</td><td>0</td><td class="text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ANDE- Mejoramiento de Líneas de Distribución</td><td>Kilómetros</td><td>60</td><td class="cell-bordered2">5,4</td><td>10,8</td><td class=" text-center">200,0</td><td>228</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DIBEN- Asistencia Alimentaria</td><td>Beneficiarios</td><td>77</td><td class="cell-bordered2">77</td><td>77</td><td class=" text-center">100,0</td><td>2</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DIBEN- Ayuda en Salud Individual</td><td>Personas</td><td>399</td><td class="cell-bordered2">256</td><td>256</td><td class="text-center">100,0</td><td>794</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SINAFOCAL- Micro y pequeños empresarios</td><td>Personas</td><td>705</td><td class="cell-bordered2">705</td><td>705</td><td class=" text-center">100,0</td><td>894</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Transferencias monetarias a familias</td><td>Familias</td><td>180</td><td class="cell-bordered2">180</td><td>176</td><td class=" text-center">97,8</td><td>722</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Promoción social a familias</td><td>Familias</td><td>250</td><td class="cell-bordered2">250</td><td>86</td><td class=" text-center">34,4</td><td>120</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Alimentación en centros</td><td>Personas</td><td>150</td><td class="cell-bordered2">150</td><td>184</td><td class=" text-center">122,7</td><td>1374</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Apoyo escolar en centros</td><td>Personas</td><td>56</td><td class="cell-bordered2">56</td><td>184</td><td class=" text-center">328,6</td><td>265</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Monitoreo a entidades de abrigo</td><td>Entidades</td><td>2</td><td class="cell-bordered2">1</td><td>1</td><td class=" text-center">100.00</td><td>1</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Monitoreo a niñez separada de su familia</td><td>Personas</td><td>30</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MDI- Cedulación por primera vez</td><td>Personas</td><td>5336</td><td class="cell-bordered2">2936</td><td>2936</td><td class=" text-center">100,0</td><td>93</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENADIS- Asistencia a personas con discapacidad</td><td>Servicios ofrecidos</td><td>2490</td><td class="cell-bordered2">2490</td><td>2490</td><td class=" text-center">100,0</td><td>346</td></tr>
				  
				<tr><td colspan="7"><strong>GUAIRA</strong><small style="padding-left:10px"><a href="http://tablero2015.stp.gov.py/descargas/4.pdf" target="_blank">Detalle Por Distrito</a> / <a href="http://tablero2015.stp.gov.py/descargas/4.pdf" target="_blank">Detalle Por Departamento</a><small></small></small></td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Asistencia Técnica Agropecuaria</td><td>Familias</td><td>2370</td><td class="cell-bordered2">912</td><td>1093</td><td class=" text-center">119,8</td><td>1333</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Inversión en insumos y tecnología agropecuaria </td><td>Familias</td><td>1157</td><td class="cell-bordered2">724</td><td>491</td><td class="text-center">67,8</td><td>502</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Mejoramiento de Suelo</td><td>Familias</td><td>697</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Construcción de Puentes</td><td>Metros</td><td>479,1</td><td class="cell-bordered2">279,37</td><td>271,87</td><td class=" text-center">97,3</td><td>14382</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Construcción de Rutas Pavimentadas</td><td>Kilómetros</td><td>46</td><td class="cell-bordered2">35,77</td><td>98,55</td><td class="text-center">275,5</td><td>110715</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Mantenimiento de Caminos Vecinales</td><td>Kilómetros</td><td>546,77</td><td class="cell-bordered2">93,05</td><td>93,05</td><td class="text-center">100,0</td><td>732</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Mantenimiento de Puentes</td><td>Metros</td><td>461,06</td><td class="cell-bordered2">274,68</td><td>247,02</td><td class="text-center">89,9</td><td>1111</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENAVITAT- Soluciones Habitacionales</td><td>Viviendas Sociales</td><td>267</td><td class="cell-bordered2">0</td><td>63</td><td class="text-center">ND</td><td>3572</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades agropecuarias</td><td>Personas</td><td>370</td><td class="cell-bordered2">116</td><td>116</td><td class=" text-center">100,0</td><td>17</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades comerciales y de servicios</td><td>Personas</td><td>1773</td><td class="cell-bordered2">993</td><td>993</td><td class=" text-center">100,0</td><td>61</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades industriales</td><td>Personas</td><td>1535</td><td class="cell-bordered2">620</td><td>620</td><td class=" text-center">100,0</td><td>141</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UI- Fichas Sociales aplicadas</td><td>Familias</td><td>1600</td><td class="cell-bordered2">209</td><td>209</td><td class=" text-center">100,0</td><td>17</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SAS- Familias con Transferencias TEKOPORA</td><td>Familias</td><td>5936</td><td class="cell-bordered2">5936</td><td>5936</td><td class=" text-center">100,0</td><td>12086</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SAS- Promoción social a familias con Transferencias TEKOPORA</td><td>Familias</td><td>5295</td><td class="cell-bordered2">5295</td><td>5295</td><td class=" text-center">100,0</td><td>1955</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MH- Adultos mayores con pensión alimentari</td><td>Personas</td><td>2079</td><td class="cell-bordered2">0</td><td>2973</td><td class="text-center">ND</td><td>25881</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atencion Extramural adultos mayores</td><td>Personas Atendidas</td><td>1902</td><td class="cell-bordered2">1241</td><td>1241</td><td class=" text-center">100,0</td><td>81</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención en Unidades de Salud de la Familia</td><td>Personas Atendidas</td><td>120050</td><td class="cell-bordered2">72030</td><td>72030</td><td class=" text-center">100,0</td><td>8434</td></tr>
				<tr class=""><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención extramural bucodental</td><td>Personas Atendidas</td><td>424</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención extramural ocular</td><td>Personas Atendidas</td><td>100</td><td class="cell-bordered2">100</td><td>82</td><td class=" text-center">82,0</td><td>5</td></tr>
				<tr class=""><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Contratación de personal en APS</td><td>Personas contratadas</td><td>1</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Fortalecimiento de Unidades de Salud Familiar existentes</td><td>USF</td><td>5</td><td class="cell-bordered2">5</td><td>5</td><td class=" text-center">100.00</td><td>62</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Habilitación de nuevas Unidades de Salud Familiar</td><td>USF</td><td>4</td><td class="cell-bordered2">4</td><td>4</td><td class=" text-center">100,00</td><td>1288</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENASA- Suministro de agua potable</td><td>Sistemas de agua</td><td>2,6</td><td class="cell-bordered2">0,3</td><td>0,3</td><td class="text-center">100,0</td><td>210</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Capacitación docente indígena</td><td>Personas</td><td>35</td><td class="cell-bordered2">28</td><td>26</td><td class=" text-center">92,9</td><td>9</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Expansión de la Iniciación Profesional Agropecuaria - IPA</td><td>Estudiantes</td><td>89</td><td class="cell-bordered2">35,6</td><td>44,5</td><td class=" text-center">125,0</td><td>17</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Iniciación Profesional Agropecuaria - IPA - Capacitación docente</td><td>Docentes</td><td>1</td><td class="cell-bordered2">0,2</td><td>0,2</td><td class=" text-center">100,0</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Iniciación Profesional Agropecuaria - IPA - Equipamientos</td><td>Equipamientos informáticos</td><td>2</td><td class="cell-bordered2">0,2</td><td>0,6</td><td class=" text-center">300,0</td><td>4</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Transferencias a instituciones educativas</td><td>Matriculados</td><td>12521</td><td class="cell-bordered2">12521</td><td>12521</td><td class="text-center">100,0</td><td>292</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Ampliación y reparación de establecimientos escolares - Proyectos 111 y 822</td><td>Establecimientos</td><td>2,4</td><td class="cell-bordered2">0</td><td>0</td><td class="text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Construcción de espacios educativos para la primera infancia</td><td>Establecimientos</td><td>4</td><td class="cell-bordered2">4</td><td>1,8</td><td class=" text-center">45,0</td><td>207</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ANDE- Mejoramiento de Líneas de Distribución</td><td>Kilómetros</td><td>144,8</td><td class="cell-bordered2">46</td><td>72,1</td><td class="text-center">156,7</td><td>1638</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DIBEN- Asistencia Alimentaria</td><td>Beneficiarios</td><td>505</td><td class="cell-bordered2">505</td><td>505</td><td class=" text-center">100,0</td><td>31</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DIBEN- Ayuda en Salud Individual</td><td>Personas</td><td>104</td><td class="cell-bordered2">63</td><td>63</td><td class="text-center">100,0</td><td>184</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SINAFOCAL- Micro y pequeños empresarios</td><td>Personas</td><td>227</td><td class="cell-bordered2">227</td><td>227</td><td class=" text-center">100,0</td><td>280</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Transferencias monetarias a familias</td><td>Familias</td><td>31</td><td class="cell-bordered2">31</td><td>31</td><td class=" text-center">100,0</td><td>110</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Promoción social a familias</td><td>Familias</td><td>37</td><td class="cell-bordered2">37</td><td>35</td><td class=" text-center">94,6</td><td>49</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Alimentación en centros</td><td>Personas</td><td>49</td><td class="cell-bordered2">49</td><td>42</td><td class=" text-center">85,7</td><td>314</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Apoyo escolar en centros</td><td>Personas</td><td>29</td><td class="cell-bordered2">29</td><td>42</td><td class=" text-center">144,8</td><td>61</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Monitoreo a entidades de abrigo</td><td>Entidades</td><td>3</td><td class="cell-bordered2">3</td><td>3</td><td class=" text-center">100,0</td><td>2</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Monitoreo a niñez separada de su familia</td><td>Personas</td><td>43</td><td class="cell-bordered2">43</td><td>40</td><td class=" text-center">93,0</td><td>8</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MDI- Cedulación por primera vez</td><td>Personas</td><td>5331</td><td class="cell-bordered2">2931</td><td>2931</td><td class=" text-center">100,0</td><td>93</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENADIS- Asistencia a personas con discapacidad</td><td>Servicios ofrecidos</td><td>657</td><td class="cell-bordered2">657</td><td>657</td><td class=" text-center">100,0</td><td>353</td></tr>

				<tr><td colspan="7"><strong>CAAGUAZU</strong><small style="padding-left:10px"><a href="http://tablero2015.stp.gov.py/descargas/5.pdf" target="_blank">Detalle Por Distrito</a> / <a href="http://tablero2015.stp.gov.py/descargas/5.pdf" target="_blank">Detalle Por Departamento</a><small></small></small></td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Asistencia Técnica Agropecuaria</td><td>Familias</td><td>18906</td><td class="cell-bordered2">3202</td><td>9772</td><td class=" text-center">305,2</td><td>15286</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Cadenas de Valor-Sector Privado</td><td>Familias</td><td>525</td><td class="cell-bordered2">421</td><td>442</td><td class="text-center">105,0</td><td>198</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Inversión en insumos y tecnología agropecuaria</td><td>Familias</td><td>2383</td><td class="cell-bordered2">626</td><td>629</td><td class="text-center">100,5</td><td>1424</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Mejoramiento de Suelo</td><td>Familias</td><td>707</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Construcción de Caminos Vecinales</td><td>Kilómetros</td><td>4,06</td><td class="cell-bordered2">4,06</td><td>7,86</td><td class="text-center">193,6</td><td>6216</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Construcción de Rutas Pavimentadas</td><td>Kilómetros</td><td>122,49</td><td class="cell-bordered2">86,99</td><td>39,01</td><td class="text-center">44,8</td><td>73750</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Mantenimiento de Caminos Vecinales</td><td>Kilómetros</td><td>1770,48</td><td class="cell-bordered2">382,66</td><td>382,66</td><td class=" text-center">100,0</td><td>428</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Mantenimiento de Puentes</td><td>Metros</td><td>324,97</td><td class="cell-bordered2">189,49</td><td>171,33</td><td class=" text-center">90,4</td><td>771</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Mantenimiento de Rutas Pavimentadas</td><td>Kilómetros</td><td>447,5</td><td class="cell-bordered2">223,75</td><td>0</td><td class="text-center">0,0</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENAVITAT- Soluciones Habitacionales</td><td>Viviendas Sociales</td><td>1282</td><td class="cell-bordered2">828</td><td>411,07</td><td class="text-center">49,6</td><td>22098</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades agropecuarias</td><td>Personas</td><td>234</td><td class="cell-bordered2">113</td><td>113</td><td class=" text-center">100,0</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades comerciales y de servicios</td><td>Personas</td><td>1659</td><td class="cell-bordered2">595</td><td>595</td><td class=" text-center">100,0</td><td>118</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades industriales</td><td>Personas</td><td>1779</td><td class="cell-bordered2">782</td><td>782</td><td class=" text-center">100,0</td><td>222</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UI- Fichas Sociales aplicadas</td><td>Familias</td><td>39000</td><td class="cell-bordered2">885</td><td>885</td><td class=" text-center">100,0</td><td>71</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UI- Acondicionamiento de suelo - Familias</td><td>Familias</td><td>419</td><td class="cell-bordered2">419</td><td>419</td><td class=" text-center">100,0</td><td>981</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UI- Acondicionamiento de suelo - Hectáreas</td><td>Hectáreas</td><td>470,09</td><td class="cell-bordered2">470,09</td><td>470,04</td><td class=" text-center">100,0</td><td>981</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SAS- Familias con Transferencias TEKOPORA</td><td>Familias</td><td>14880</td><td class="cell-bordered2">14880</td><td>14882</td><td class=" text-center">100,0</td><td>37006</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SAS- Promoción social a familias con Transferencias TEKOPORA</td><td>Familias</td><td>16229</td><td class="cell-bordered2">16229</td><td>16229</td><td class=" text-center">100,0</td><td>5992</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MH- Adultos mayores con pensión alimentaria</td><td>Personas</td><td>2915</td><td class="cell-bordered2">0</td><td>5245</td><td class="text-center">ND</td><td>43650</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atencion Extramural adultos mayores</td><td>Personas Atendidas</td><td>1644</td><td class="cell-bordered2">1074</td><td>1074</td><td class=" text-center">100,0</td><td>70</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención en Unidades de Salud de la Familia</td><td>Personas Atendidas</td><td>92180</td><td class="cell-bordered2">55308</td><td>55308</td><td class=" text-center">100,0</td><td>6476</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención extramural bucodental</td><td>Personas Atendidas</td><td>1895</td><td class="cell-bordered2">1551</td><td>1551</td><td class=" text-center">100,0</td><td>32</td></tr>
				<tr class=""><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Contratación de personal en APS</td><td>Personas contratadas</td><td>9</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Fortalecimiento de Unidades de Salud Familiar existentes</td><td>USF</td><td>15</td><td class="cell-bordered2">15</td><td>15</td><td class=" text-center">100,0</td><td>140</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Habilitación de nuevas Unidades de Salud Familiar</td><td>USF</td><td>3</td><td class="cell-bordered2">2</td><td>2</td><td class=" text-center">100,0</td><td>1071</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENASA- Suministro de agua potable</td><td>Sistemas de agua</td><td>13,6</td><td class="cell-bordered2">1,9</td><td>1,5</td><td class="text-center">78,9</td><td>1050</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Capacitación docente indígena</td><td>Personas</td><td>172</td><td class="cell-bordered2">143</td><td>138</td><td class=" text-center">96,5</td><td>24</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Expansión de la Iniciación Profesional Agropecuaria - IPA</td><td>Estudiantes</td><td>257</td><td class="cell-bordered2">102,8</td><td>128,5</td><td class=" text-center">125,0</td><td>46</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Iniciación Profesional Agropecuaria - IPA - Capacitación docente</td><td>Docentes</td><td>51</td><td class="cell-bordered2">10,2</td><td>10,2</td><td class=" text-center">100,0</td><td>6</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Iniciación Profesional Agropecuaria - IPA - Equipamientos</td><td>Equipamientos informáticos</td><td>15</td><td class="cell-bordered2">1,5</td><td>4,5</td><td class=" text-center">300,0</td><td>30</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Transferencias a instituciones educativas</td><td>Matriculados</td><td>44562</td><td class="cell-bordered2">44562</td><td>44562</td><td class="text-center">100,0</td><td>1350</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Ampliación y reparación de establecimientos escolares - Proyectos 111 y 822</td><td>Establecimientos</td><td>1</td><td class="cell-bordered2">0,5</td><td>0,5</td><td class="text-center">100,0</td><td>787</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Construcción de espacios educativos para la primera infancia</td><td>Establecimientos</td><td>7</td><td class="cell-bordered2">7</td><td>4,2</td><td class=" text-center">60,0</td><td>482</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ANDE- Mejoramiento de Líneas de Distribución</td><td>Kilómetros</td><td>49</td><td class="cell-bordered2">23,52</td><td>42,63</td><td class=" text-center">181,3</td><td>933</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DIBEN- Asistencia Alimentaria</td><td>Beneficiarios</td><td>1423</td><td class="cell-bordered2">1423</td><td>1423</td><td class=" text-center">100,0</td><td>65</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DIBEN- Ayuda en Salud Individual</td><td>Personas</td><td>268</td><td class="cell-bordered2">175</td><td>175</td><td class="text-center">100,0</td><td>638</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Transferencias monetarias a familias</td><td>Familias</td><td>39</td><td class="cell-bordered2">39</td><td>38</td><td class=" text-center">97,4</td><td>146</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Promoción social a familias</td><td>Familias</td><td>58</td><td class="cell-bordered2">58</td><td>52</td><td class=" text-center">89,7</td><td>72</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Alimentación en centros</td><td>Personas</td><td>55</td><td class="cell-bordered2">55</td><td>93</td><td class=" text-center">169,1</td><td>695</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Apoyo escolar en centros</td><td>Personas</td><td>40</td><td class="cell-bordered2">40</td><td>93</td><td class=" text-center">232,5</td><td>134</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Monitoreo a entidades de abrigo</td><td>Entidades</td><td>2</td><td class="cell-bordered2">2</td><td>1</td><td class=" text-center">50,0</td><td>1</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Monitoreo a niñez separada de su familia</td><td>Personas</td><td>39</td><td class="cell-bordered2">39</td><td>12</td><td class=" text-center">30,8</td><td>11</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MDI- Cedulación por primera vez</td><td>Personas</td><td>16184</td><td class="cell-bordered2">8684</td><td>8684</td><td class=" text-center">100,0</td><td>274</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENADIS- Asistencia a personas con discapacidad</td><td>Servicios ofrecidos</td><td>1126</td><td class="cell-bordered2">1126</td><td>1126</td><td class=" text-center">100,0</td><td>462</td></tr>			

				<tr><td colspan="7"><strong>CAAZAPA</strong><small style="padding-left:10px"><a href="http://tablero2015.stp.gov.py/descargas/6.pdf" target="_blank">Detalle Por Distrito</a> / <a href="http://tablero2015.stp.gov.py/descargas/6.pdf" target="_blank">Detalle Por Departamento</a><small></small></small></td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Asistencia Técnica Agropecuaria</td><td>Familias</td><td>3902</td><td class="cell-bordered2">827</td><td>1600</td><td class=" text-center">193.5</td><td>3225</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Cadenas de Valor-Sector Privado</td><td>Familias</td><td>159</td><td class="cell-bordered2">39</td><td>105</td><td class="text-center">269.2</td><td>384</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Inversión en insumos y tecnología agropecuaria</td><td>Familias</td><td>2198</td><td class="cell-bordered2">750</td><td>635</td><td class="text-center">84.7</td><td>518</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Mejoramiento de Suelo</td><td>Familias</td><td>500</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Construcción de Rutas Pavimentadas</td><td>Kilómetros</td><td>59.22</td><td class="cell-bordered2">35.33</td><td>12.02</td><td class="text-center">34.0</td><td>31973</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Mantenimiento de Caminos Vecinales</td><td>Kilómetros</td><td>858.45</td><td class="cell-bordered2">273.36</td><td>273.36</td><td class=" text-center">100.0</td><td>178</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Mantenimiento de Rutas Pavimentadas</td><td>Kilómetros</td><td>0.6</td><td class="cell-bordered2">0</td><td>0</td><td class="text-center">Nd</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENAVITAT- Soluciones Habitacionales</td><td>Viviendas Sociales</td><td>474</td><td class="cell-bordered2">268</td><td>186.5</td><td class="text-center">69.6</td><td>10883</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades agropecuarias</td><td>Personas</td><td>511</td><td class="cell-bordered2">200</td><td>200</td><td class=" text-center">100.0</td><td>36</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UI- Fichas Sociales aplicadas</td><td>Familias</td><td>5200</td><td class="cell-bordered2">854</td><td>854</td><td class=" text-center">100.0</td><td>68</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UI- Siembra mecanizada - Familias</td><td>Familias</td><td>12</td><td class="cell-bordered2">12</td><td>12</td><td class=" text-center">100.0</td><td>278</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SAS- Familias con Transferencias TEKOPORA</td><td>Familias</td><td>7768</td><td class="cell-bordered2">7768</td><td>7768</td><td class=" text-center">100.0</td><td>18600</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SAS- Promoción social a familias con Transferencias TEKOPORA</td><td>Familias</td><td>8158</td><td class="cell-bordered2">8158</td><td>8158</td><td class=" text-center">100.0</td><td>3012</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MH- Adultos mayores con pensión alimentaria</td><td>Personas</td><td>1287</td><td class="cell-bordered2">0</td><td>1449</td><td class="text-center">ND</td><td>16799</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atencion Extramural adultos mayores</td><td>Personas Atendidas</td><td>1680</td><td class="cell-bordered2">1093</td><td>1093</td><td class=" text-center">100.0</td><td>71</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención en Unidades de Salud de la Familia</td><td>Personas Atendidas</td><td>102900</td><td class="cell-bordered2">61740</td><td>61740</td><td class=" text-center">100.0</td><td>7229</td></tr>
				<tr class=""><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención extramural bucodental</td><td>Personas Atendidas</td><td>280</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>
				<tr class=""><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención extramural ocular</td><td>Personas Atendidas</td><td>200</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Contratación de personal en APS</td><td>Personas contratadas</td><td>20</td><td class="cell-bordered2">6</td><td>6</td><td class=" text-center">100.0</td><td>926</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Fortalecimiento de Unidades de Salud Familiar existentes</td><td>USF</td><td>10</td><td class="cell-bordered2">10</td><td>10</td><td class=" text-center">100.0</td><td>90</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENASA- Suministro de agua potable</td><td>Sistemas de agua</td><td>6.3</td><td class="cell-bordered2">2.2</td><td>2.2</td><td class="text-center">100.0</td><td>1540</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Expansión de la Iniciación Profesional Agropecuaria - IPA</td><td>Estudiantes</td><td>119</td><td class="cell-bordered2">47.6</td><td>59.5</td><td class=" text-center">125.0</td><td>23</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Iniciación Profesional Agropecuaria - IPA - Equipamientos</td><td>Equipamientos informáticos</td><td>1</td><td class="cell-bordered2">0.1</td><td>0.3</td><td class=" text-center">300.0</td><td>2</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Transferencias a instituciones educativas</td><td>Matriculados</td><td>13442</td><td class="cell-bordered2">13442</td><td>13442</td><td class="text-center">100.0</td><td>343</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Ampliación y reparación de establecimientos escolares - Proyectos 111 y 822</td><td>Establecimientos</td><td>0</td><td class="cell-bordered2">0</td><td>0</td><td class="text-center">ND</td><td>189</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Construcción de espacios educativos para la primera infancia</td><td>Establecimientos</td><td>4</td><td class="cell-bordered2">4</td><td>2.4</td><td class=" text-center">60.0</td><td>272</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ANDE- Mejoramiento de Líneas de Distribución</td><td>Kilómetros</td><td>91.02</td><td class="cell-bordered2">0</td><td>34.44</td><td class="text-center">ND</td><td>910</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DIBEN- Asistencia Alimentaria</td><td>Beneficiarios</td><td>430</td><td class="cell-bordered2">430</td><td>430</td><td class=" text-center">100.0</td><td>13</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DIBEN- Ayuda en Salud Individual</td><td>Personas</td><td>58</td><td class="cell-bordered2">38</td><td>38</td><td class="text-center">100.0</td><td>137</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MDI- Cedulación por primera vez</td><td>Personas</td><td>7195</td><td class="cell-bordered2">3870</td><td>3870</td><td class=" text-center">100.0</td><td>61</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENADIS- Asistencia a personas con discapacidad</td><td>Servicios ofrecidos</td><td>741</td><td class="cell-bordered2">741</td><td>741</td><td class=" text-center">100.0</td><td>321</td></tr>
							
				<tr><td colspan="7"><strong>ITAPUA</strong><small style="padding-left:10px"><a href="http://tablero2015.stp.gov.py/descargas/7.pdf" target="_blank">Detalle Por Distrito</a> / <a href="http://tablero2015.stp.gov.py/descargas/7.pdf" target="_blank">Detalle Por Departamento</a><small></small></small></td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Asistencia Técnica Agropecuaria</td><td>Familias</td><td>7358</td><td class="cell-bordered2">1667</td><td>2286</td><td class=" text-center">137,1</td><td>3079</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Cadenas de Valor-Sector Privado</td><td>Familias</td><td>125</td><td class="cell-bordered2">125</td><td>125</td><td class=" text-center">100,0</td><td>22</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Inversión en insumos y tecnología agropecuaria</td><td>Familias</td><td>943</td><td class="cell-bordered2">340</td><td>221</td><td class="text-center">65,0</td><td>478</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Mejoramiento de Suelo</td><td>Familias</td><td>500</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Construcción de Caminos Vecinales</td><td>Kilómetros</td><td>50,13</td><td class="cell-bordered2">26,27</td><td>26,27</td><td class=" text-center">100,0</td><td>12260</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Construcción de Rutas Pavimentadas</td><td>Kilómetros</td><td>64,11</td><td class="cell-bordered2">46,7</td><td>30,38</td><td class="text-center">65,1</td><td>39775</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Mantenimiento de Caminos Vecinales</td><td>Kilómetros</td><td>2124,07</td><td class="cell-bordered2">1419,34</td><td>1419,34</td><td class="text-center">100,0</td><td>2971</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Mantenimiento de Rutas Pavimentadas</td><td>Kilómetros</td><td>11,05</td><td class="cell-bordered2">0</td><td>0</td><td class="text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENAVITAT- Soluciones Habitacionales</td><td>Viviendas Sociales</td><td>418</td><td class="cell-bordered2">277</td><td>245,57</td><td class="text-center">88,7</td><td>13971</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades agropecuarias</td><td>Personas</td><td>740</td><td class="cell-bordered2">199</td><td>199</td><td class=" text-center">100,0</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades industriales</td><td>Personas</td><td>2399</td><td class="cell-bordered2">917</td><td>917</td><td class=" text-center">100,0</td><td>78</td></tr>
				<tr class=""><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UI- Fichas Sociales aplicadas</td><td>Familias</td><td>15000</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SAS- Familias con Transferencias TEKOPORA</td><td>Familias</td><td>8044</td><td class="cell-bordered2">8044</td><td>8044</td><td class=" text-center">100,0</td><td>17348</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SAS- Promoción social a familias con Transferencias TEKOPORA</td><td>Familias</td><td>7525</td><td class="cell-bordered2">7525</td><td>7525</td><td class=" text-center">100,0</td><td>2778</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MH- Adultos mayores con pensión alimentaria</td><td>Personas</td><td>3412</td><td class="cell-bordered2">0</td><td>3618</td><td class="text-center">ND</td><td>36196</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atencion Extramural adultos mayores</td><td>Personas Atendidas</td><td>1274</td><td class="cell-bordered2">834</td><td>834</td><td class=" text-center">100,0</td><td>54</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención en Unidades de Salud de la Familia</td><td>Personas Atendidas</td><td>124337</td><td class="cell-bordered2">74602</td><td>74602</td><td class=" text-center">100,0</td><td>8735</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención extramural bucodental</td><td>Personas Atendidas</td><td>1324</td><td class="cell-bordered2">998</td><td>998</td><td class=" text-center">100,0</td><td>61</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención extramural ocular</td><td>Personas Atendidas</td><td>300</td><td class="cell-bordered2">300</td><td>270</td><td class=" text-center">90,0</td><td>18</td></tr>
				<tr class=""><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Contratación de personal en APS</td><td>Personas contratadas</td><td>10</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Fortalecimiento de Unidades de Salud Familiar existentes</td><td>USF</td><td>15</td><td class="cell-bordered2">15</td><td>15</td><td class=" text-center">100,0</td><td>142</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Habilitación de nuevas Unidades de Salud Familiar</td><td>USF</td><td>2</td><td class="cell-bordered2">2</td><td>2</td><td class=" text-center">100,0</td><td>1071</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENASA- Suministro de agua potable</td><td>Sistemas de agua</td><td>14,8</td><td class="cell-bordered2">4,2</td><td>4,2</td><td class="text-center">100,0</td><td>2502</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Expansión de la Iniciación Profesional Agropecuaria - IPA</td><td>Estudiantes</td><td>301</td><td class="cell-bordered2">120,4</td><td>150,5</td><td class=" text-center">125,0</td><td>53</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Iniciación Profesional Agropecuaria - IPA - Capacitación docente</td><td>Docentes</td><td>47</td><td class="cell-bordered2">9,4</td><td>9,42</td><td class=" text-center">100,2</td><td>5</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Iniciación Profesional Agropecuaria - IPA - Equipamientos</td><td>Equipamientos informáticos</td><td>11</td><td class="cell-bordered2">1,1</td><td>3,3</td><td class=" text-center">300,0</td><td>22</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Transferencias a instituciones educativas</td><td>Matriculados</td><td>39096</td><td class="cell-bordered2">39096</td><td>39096</td><td class="text-center">100,0</td><td>869</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Ampliación y reparación de establecimientos escolares - Proyectos 111 y 822</td><td>Establecimientos</td><td>19,2</td><td class="cell-bordered2">0</td><td>0</td><td class="text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Construcción de espacios educativos para la primera infancia</td><td>Establecimientos</td><td>9</td><td class="cell-bordered2">9</td><td>5,4</td><td class=" text-center">60,0</td><td>577</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DIBEN- Asistencia Alimentaria</td><td>Beneficiarios</td><td>415</td><td class="cell-bordered2">415</td><td>415</td><td class=" text-center">100,0</td><td>19</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DIBEN- Ayuda en Salud Individual</td><td>Personas</td><td>107</td><td class="cell-bordered2">72</td><td>72</td><td class="text-center">100,0</td><td>222</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Transferencias monetarias a familias</td><td>Familias</td><td>56</td><td class="cell-bordered2">56</td><td>56</td><td class=" text-center">100,0</td><td>195</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Promoción social a familias</td><td>Familias</td><td>91</td><td class="cell-bordered2">91</td><td>54</td><td class=" text-center">59,3</td><td>75</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Alimentación en centros</td><td>Personas</td><td>146</td><td class="cell-bordered2">146</td><td>329</td><td class=" text-center">225,3</td><td>2457</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Apoyo escolar en centros</td><td>Personas</td><td>88</td><td class="cell-bordered2">88</td><td>329</td><td class=" text-center">373,9</td><td>475</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Monitoreo a entidades de abrigo</td><td>Entidades</td><td>5</td><td class="cell-bordered2">2</td><td>1</td><td class=" text-center">50,0</td><td>1</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Monitoreo a niñez separada de su familia</td><td>Personas</td><td>215</td><td class="cell-bordered2">39</td><td>20</td><td class=" text-center">51,3</td><td>16</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MDI- Cedulación por primera vez</td><td>Personas</td><td>14806</td><td class="cell-bordered2">8156</td><td>8156</td><td class=" text-center">100,0</td><td>258</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENADIS- Asistencia a personas con discapacidad</td><td>Servicios ofrecidos</td><td>437</td><td class="cell-bordered2">437</td><td>437</td><td class=" text-center">100,0</td><td>134</td></tr>			
			
				<tr><td colspan="7"><strong>MISIONES</strong><small style="padding-left:10px"><a href="http://tablero2015.stp.gov.py/descargas/8.pdf" target="_blank">Detalle Por Distrito</a> / <a href="http://tablero2015.stp.gov.py/descargas/8.pdf" target="_blank">Detalle Por Departamento</a><small></small></small></td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Asistencia Técnica Agropecuaria</td><td>Familias</td><td>1841</td><td class="cell-bordered2">92</td><td>708</td><td class=" text-center">769,6</td><td>1622</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Inversión en insumos y tecnología agropecuaria</td><td>Familias</td><td>1157</td><td class="cell-bordered2">951</td><td>950</td><td class="text-center">99,9</td><td>380</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Mejoramiento de Suelo</td><td>Familias</td><td>200</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Construcción de Puentes</td><td>Metros</td><td>47</td><td class="cell-bordered2">20,21</td><td>20,21</td><td class=" text-center">100,0</td><td>1317</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Construcción de Rutas Pavimentadas</td><td>Kilómetros</td><td>18,7</td><td class="cell-bordered2">14,94</td><td>2,97</td><td class="text-center">19,9</td><td>3298</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENAVITAT- Soluciones Habitacionales</td><td>Viviendas Sociales</td><td>164</td><td class="cell-bordered2">74</td><td>45,4</td><td class="text-center">61,4</td><td>3464</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades agropecuarias</td><td>Personas</td><td>132</td><td class="cell-bordered2">96</td><td>96</td><td class=" text-center">100,0</td><td>28</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades comerciales y de servicios</td><td>Personas</td><td>1507</td><td class="cell-bordered2">947</td><td>947</td><td class=" text-center">100,0</td><td>51</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades industriales</td><td>Personas</td><td>958</td><td class="cell-bordered2">515</td><td>515</td><td class=" text-center">100,0</td><td>159</td></tr>
				<tr class=""><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UI- Fichas Sociales aplicadas</td><td>Familias</td><td>600</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SAS- Familias con Transferencias TEKOPORA</td><td>Familias</td><td>1789</td><td class="cell-bordered2">1789</td><td>1789</td><td class=" text-center">100,0</td><td>3832</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SAS- Promoción social a familias con Transferencias TEKOPORA</td><td>Familias</td><td>1680</td><td class="cell-bordered2">1680</td><td>1680</td><td class=" text-center">100,0</td><td>620</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MH- Adultos mayores con pensión alimentaria</td><td>Personas</td><td>835</td><td class="cell-bordered2">0</td><td>1312</td><td class="text-center">ND</td><td>11001</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atencion Extramural adultos mayores</td><td>Personas Atendidas</td><td>2095</td><td class="cell-bordered2">1363</td><td>1363</td><td class=" text-center">100,0</td><td>89</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención en Unidades de Salud de la Familia</td><td>Personas Atendidas</td><td>77175</td><td class="cell-bordered2">46305</td><td>46305</td><td class=" text-center">100,0</td><td>5422</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención extramural bucodental</td><td>Personas Atendidas</td><td>1</td><td class="cell-bordered2">1</td><td>1</td><td class=" text-center">100,0</td><td>0</td></tr>
				<tr class=""><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Contratación de personal en APS</td><td>Personas contratadas</td><td>9</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Expansión de la Iniciación Profesional Agropecuaria - IPA</td><td>Estudiantes</td><td>36</td><td class="cell-bordered2">14,4</td><td>18</td><td class=" text-center">125,0</td><td>19</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Iniciación Profesional Agropecuaria - IPA - Capacitación docente</td><td>Docentes</td><td>1</td><td class="cell-bordered2">0,2</td><td>0,2</td><td class=" text-center">100,0</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Iniciación Profesional Agropecuaria - IPA - Equipamientos</td><td>Equipamientos informáticos</td><td>3</td><td class="cell-bordered2">0,3</td><td>0,9</td><td class=" text-center">300,0</td><td>6</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Transferencias a instituciones educativas</td><td>Matriculados</td><td>10584</td><td class="cell-bordered2">10584</td><td>10584</td><td class="text-center">100,0</td><td>244</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Ampliación y reparación de establecimientos escolares - Proyectos 111 y 822</td><td>Establecimientos</td><td>11,6</td><td class="cell-bordered2">2,5</td><td>2,5</td><td class="text-center">100,0</td><td>582</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ANDE- Mejoramiento de Líneas de Distribución</td><td>Kilómetros</td><td>336,13</td><td class="cell-bordered2">25,29</td><td>118,08</td><td class="text-center">466,9</td><td>2419</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DIBEN- Asistencia Alimentaria</td><td>Beneficiarios</td><td>706</td><td class="cell-bordered2">706</td><td>706</td><td class=" text-center">100,0</td><td>38</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DIBEN- Ayuda en Salud Individual</td><td>Personas</td><td>69</td><td class="cell-bordered2">51</td><td>51</td><td class=" text-center">100,0</td><td>269</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Transferencias monetarias a familias</td><td>Familias</td><td>16</td><td class="cell-bordered2">16</td><td>23</td><td class=" text-center">143,8</td><td>74</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Promoción social a familias</td><td>Familias</td><td>17</td><td class="cell-bordered2">17</td><td>0</td><td class=" text-center">0,0</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Alimentación en centros</td><td>Personas</td><td>25</td><td class="cell-bordered2">25</td><td>62</td><td class=" text-center">248,0</td><td>463</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Apoyo escolar en centros</td><td>Personas</td><td>16</td><td class="cell-bordered2">16</td><td>62</td><td class=" text-center">387,5</td><td>89</td></tr>
				<tr class=""><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Monitoreo a entidades de abrigo</td><td>Entidades</td><td>1</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>
				<tr class=""><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Monitoreo a niñez separada de su familia</td><td>Personas</td><td>101</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MDI- Cedulación por primera vez</td><td>Personas</td><td>3112</td><td class="cell-bordered2">1712</td><td>1712</td><td class=" text-center">100,0</td><td>54</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENADIS- Asistencia a personas con discapacidad</td><td>Servicios ofrecidos</td><td>731</td><td class="cell-bordered2">731</td><td>731</td><td class=" text-center">100,0</td><td>631</td></tr>

				<tr><td colspan="7"><strong>PARAGUARI</strong><small style="padding-left:10px"><a href="http://tablero2015.stp.gov.py/descargas/9.pdf" target="_blank">Detalle Por Distrito</a> / <a href="http://tablero2015.stp.gov.py/descargas/9.pdf" target="_blank">Detalle Por Departamento</a><small></small></small></td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Asistencia Técnica Agropecuaria</td><td>Familias</td><td>2385</td><td class="cell-bordered2">1612</td><td>2058</td><td class=" text-center">127,7</td><td>3668</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Inversión en insumos y tecnología agropecuaria </td><td>Familias</td><td>303</td><td class="cell-bordered2">139</td><td>139</td><td class="text-center">100,0</td><td>130</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Mejoramiento de Suelo</td><td>Familias</td><td>900</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Construcción de Puentes</td><td>Metros</td><td>228,08</td><td class="cell-bordered2">133</td><td>110,74</td><td class="text-center">83,3</td><td>7351</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Construcción de Rutas Pavimentadas</td><td>Kilómetros</td><td>22,34</td><td class="cell-bordered2">15,63</td><td>4,99</td><td class="text-center">31,9</td><td>18560</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENAVITAT- Soluciones Habitacionales</td><td>Viviendas Sociales</td><td>239</td><td class="cell-bordered2">20</td><td>0</td><td class="text-center">0,0</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades agropecuarias</td><td>Personas</td><td>461</td><td class="cell-bordered2">196</td><td>196</td><td class=" text-center">100,0</td><td>13</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades comerciales y de servicios</td><td>Personas</td><td>3865</td><td class="cell-bordered2">2809</td><td>2809</td><td class=" text-center">100,0</td><td>50</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades industriales</td><td>Personas</td><td>1683</td><td class="cell-bordered2">929</td><td>929</td><td class=" text-center">100,0</td><td>121</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UI- Fichas Sociales aplicadas</td><td>Familias</td><td>5100</td><td class="cell-bordered2">428</td><td>428</td><td class=" text-center">100,0</td><td>34</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SAS- Familias con Transferencias TEKOPORA</td><td>Familias</td><td>3896</td><td class="cell-bordered2">3896</td><td>3,896</td><td class=" text-center">100.00</td><td>9,090</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SAS- Promoción social a familias con Transferencias TEKOPORA</td><td>Familias</td><td>3986</td><td class="cell-bordered2">3986</td><td>3986</td><td class=" text-center">100,0</td><td>9090</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MH- Adultos mayores con pensión alimentaria</td><td>Personas</td><td>2056</td><td class="cell-bordered2">0</td><td>7525</td><td class="text-center">ND</td><td>41607</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atencion Extramural adultos mayores</td><td>Personas Atendidas</td><td>4375</td><td class="cell-bordered2">2843</td><td>2843</td><td class=" text-center">100,0</td><td>189</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención en Unidades de Salud de la Familia</td><td>Personas Atendidas</td><td>100755</td><td class="cell-bordered2">60453</td><td>60453</td><td class=" text-center">100,0</td><td>7079</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención extramural bucodental</td><td>Personas Atendidas</td><td>1</td><td class="cell-bordered2">1</td><td>0</td><td class=" text-center">0,0</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención extramural ocular</td><td>Personas Atendidas</td><td>100</td><td class="cell-bordered2">100</td><td>80</td><td class=" text-center">80,0</td><td>5</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Contratación de personal en APS</td><td>Personas contratadas</td><td>27</td><td class="cell-bordered2">1</td><td>1</td><td class=" text-center">100,0</td><td>143</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Fortalecimiento de Unidades de Salud Familiar existentes</td><td>USF</td><td>5</td><td class="cell-bordered2">5</td><td>5</td><td class=" text-center">100,0</td><td>50</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Habilitación de nuevas Unidades de Salud Familiar</td><td>USF</td><td>1</td><td class="cell-bordered2">1</td><td>1</td><td class=" text-center">100,0</td><td>535</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENASA- Suministro de agua potable</td><td>Sistemas de agua</td><td>0,7</td><td class="cell-bordered2">0,4</td><td>0</td><td class="text-center">0,0</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Expansión de la Iniciación Profesional Agropecuaria - IPA</td><td>Estudiantes</td><td>96</td><td class="cell-bordered2">38.4</td><td>48</td><td class=" text-center">125,0</td><td>17</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Iniciación Profesional Agropecuaria - IPA - Capacitación docente</td><td>Docentes</td><td>23</td><td class="cell-bordered2">4,6</td><td>4,62</td><td class=" text-center">100,4</td><td>3</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Iniciación Profesional Agropecuaria - IPA - Equipamientos</td><td>Equipamientos informáticos</td><td>13</td><td class="cell-bordered2">1,3</td><td>3,9</td><td class=" text-center">300,0</td><td>26</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Transferencias a instituciones educativas</td><td>Matriculados</td><td>16226</td><td class="cell-bordered2">16226</td><td>16226</td><td class="text-center">100,0</td><td>359</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Ampliación y reparación de establecimientos escolares - Proyectos 111 y 822</td><td>Establecimientos</td><td>0</td><td class="cell-bordered2">0</td><td>0</td><td class="text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ANDE- Mejoramiento de Líneas de Distribución</td><td>Kilómetros</td><td>99,75</td><td class="cell-bordered2">57,43</td><td>48,63</td><td class="text-center">84,7</td><td>1399</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DIBEN- Asistencia Alimentaria</td><td>Beneficiarios</td><td>242</td><td class="cell-bordered2">242</td><td>242</td><td class=" text-center">100,0</td><td>6</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DIBEN- Ayuda en Salud Individual</td><td>Personas</td><td>264</td><td class="cell-bordered2">161</td><td>161</td><td class="text-center">100,0</td><td>412</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Transferencias monetarias a familias</td><td>Familias</td><td>1</td><td class="cell-bordered2">1</td><td>1</td><td class=" text-center">100,0</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Promoción social a familias</td><td>Familias</td><td>2</td><td class="cell-bordered2">2</td><td>2</td><td class=" text-center">100,0</td><td>1</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Monitoreo a entidades de abrigo</td><td>Entidades</td><td>4</td><td class="cell-bordered2">4</td><td>4</td><td class=" text-center">100,0</td><td>3</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Monitoreo a niñez separada de su familia</td><td>Personas</td><td>76</td><td class="cell-bordered2">61</td><td>26</td><td class=" text-center">42,6</td><td>13</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MDI- Cedulación por primera vez</td><td>Personas</td><td>5561</td><td class="cell-bordered2">3061</td><td>3061</td><td class=" text-center">100,0</td><td>97</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENADIS- Asistencia a personas con discapacidad</td><td>Servicios ofrecidos</td><td>1116</td><td class="cell-bordered2">1116</td><td>1116</td><td class=" text-center">100,0</td><td>362</td></tr>

				<tr><td colspan="7"><strong>ALTO PARANA</strong><small style="padding-left:10px"><a href="http://tablero2015.stp.gov.py/descargas/10.pdf" target="_blank">Detalle Por Distrito</a> / <a href="http://tablero2015.stp.gov.py/descargas/10.pdf" target="_blank">Detalle Por Departamento</a><small></small></small></td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ANDE- Mejoramiento de Líneas de Distribución</td><td>Kilómetros</td><td>8,05</td><td class="cell-bordered2">7</td><td>52</td><td class=" text-center">742,9</td><td>1050</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DIBEN- Asistencia Alimentaria</td><td>Beneficiarios</td><td>98</td><td class="cell-bordered2">98</td><td>98</td><td class=" text-center">100,0</td><td>6</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DIBEN- Ayuda en Salud Individual</td><td>Personas</td><td>111</td><td class="cell-bordered2">86</td><td>86</td><td class="text-center">100,0</td><td>299</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Asistencia Técnica Agropecuaria</td><td>Familias</td><td>6791</td><td class="cell-bordered2">1126</td><td>2488</td><td class=" text-center">221,0</td><td>2697</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Inversión en insumos y tecnología agropecuaria</td><td>Familias</td><td>1563</td><td class="cell-bordered2">664</td><td>663</td><td class="text-center">99,8</td><td>1135</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MDI- Cedulación por primera vez</td><td>Personas</td><td>25827</td><td class="cell-bordered2">13332</td><td>13332</td><td class=" text-center">100,0</td><td>421</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Ampliación y reparación de establecimientos escolares - Proyectos 111 y 822</td><td>Establecimientos</td><td>5,8</td><td class="cell-bordered2">0,5</td><td>0,5</td><td class="text-center">100,0</td><td>114</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Capacitación docente indígena</td><td>Personas</td><td>10</td><td class="cell-bordered2">8</td><td>8</td><td class=" text-center">100,0</td><td>2</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Construcción de espacios educativos para la primera infancia</td><td>Establecimientos</td><td>10</td><td class="cell-bordered2">10</td><td>10</td><td class=" text-center">100,0</td><td>1281</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Expansión de la Iniciación Profesional Agropecuaria - IPA</td><td>Estudiantes</td><td>114</td><td class="cell-bordered2">45,6</td><td>57</td><td class=" text-center">125,0</td><td>49</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Iniciación Profesional Agropecuaria - IPA - Capacitación docente</td><td>Docentes</td><td>27</td><td class="cell-bordered2">5,4</td><td>5,4</td><td class=" text-center">100,0</td><td>3</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Iniciación Profesional Agropecuaria - IPA - Equipamientos</td><td>Equipamientos informáticos</td><td>11</td><td class="cell-bordered2">1,1</td><td>3,3</td><td class=" text-center">300,0</td><td>22</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Transferencias a instituciones educativas</td><td>Matriculados</td><td>35160</td><td class="cell-bordered2">35160</td><td>35160</td><td class="text-center">100,0</td><td>807</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MH- Adultos mayores con pensión alimentaria</td><td>Personas</td><td>1860</td><td class="cell-bordered2">0</td><td>1882</td><td class="text-center">ND</td><td>19767</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Construcción de Caminos Vecinales</td><td>Kilómetros</td><td>48,76</td><td class="cell-bordered2">48,76</td><td>48,76</td><td class=" text-center">100,0</td><td>25795</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Construcción de Rutas Pavimentadas</td><td>Kilómetros</td><td>16,68</td><td class="cell-bordered2">14,57</td><td>9,81</td><td class="text-center">67,3</td><td>11070</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Mantenimiento de Caminos Vecinales</td><td>Kilómetros</td><td>1852,17</td><td class="cell-bordered2">1522,29</td><td>1522,29</td><td class="text-center">100,0</td><td>3892</td></tr>
				<tr class=""><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Mantenimiento de Rutas Pavimentadas</td><td>Kilómetros</td><td>4,8</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención en Unidades de Salud de la Familia</td><td>Personas Atendidas</td><td>165070</td><td class="cell-bordered2">99042</td><td>99042</td><td class=" text-center">100,0</td><td>11597</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atencion Extramural adultos mayores</td><td>Personas Atendidas</td><td>4800</td><td class="cell-bordered2">2882</td><td>2882</td><td class=" text-center">100,0</td><td>187</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención extramural bucodental</td><td>Personas Atendidas</td><td>1496</td><td class="cell-bordered2">818</td><td>818</td><td class=" text-center">100,0</td><td>38</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención extramural ocular</td><td>Personas Atendidas</td><td>650</td><td class="cell-bordered2">650</td><td>624</td><td class=" text-center">96,0</td><td>41</td></tr>
				<tr class=""><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Contratación de personal en APS</td><td>Personas contratadas</td><td>18</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Fortalecimiento de Unidades de Salud Familiar existentes</td><td>USF</td><td>15</td><td class="cell-bordered2">15</td><td>15</td><td class=" text-center">100,0</td><td>138</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SAS- Familias con Transferencias TEKOPORA</td><td>Familias</td><td>3410</td><td class="cell-bordered2">3410</td><td>3410</td><td class=" text-center">100,0</td><td>7875</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SAS- Promoción social a familias con Transferencias TEKOPORA</td><td>Familias</td><td>3454</td><td class="cell-bordered2">3454</td><td>3454</td><td class=" text-center">100,0</td><td>1275</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENADIS- Asistencia a personas con discapacidad</td><td>Servicios ofrecidos</td><td>394</td><td class="cell-bordered2">394</td><td>394</td><td class=" text-center">100,0</td><td>127</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENASA- Suministro de agua potable</td><td>Sistemas de agua</td><td>16,4</td><td class="cell-bordered2">2,3</td><td>1,8</td><td class="text-center">78,3</td><td>1515</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENAVITAT- Soluciones Habitacionales</td><td>Viviendas Sociales</td><td>1097,4</td><td class="cell-bordered2">200</td><td>125</td><td class="text-center">62,5</td><td>1403</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SINAFOCAL- Micro y pequeños empresarios</td><td>Personas</td><td>279</td><td class="cell-bordered2">279</td><td>279</td><td class=" text-center">100,0</td><td>312</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Alimentación en centros</td><td>Personas</td><td>272</td><td class="cell-bordered2">272</td><td>372</td><td class=" text-center">136,8</td><td>2779</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Apoyo escolar en centros</td><td>Personas</td><td>187</td><td class="cell-bordered2">187</td><td>372</td><td class=" text-center">198,9</td><td>537</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Monitoreo a entidades de abrigo</td><td>Entidades</td><td>11</td><td class="cell-bordered2">9</td><td>7</td><td class=" text-center">77,8</td><td>6</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Monitoreo a niñez separada de su familia</td><td>Personas</td><td>258</td><td class="cell-bordered2">160</td><td>34</td><td class=" text-center">14,8</td><td>47</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Promoción social a familias</td><td>Familias</td><td>229</td><td class="cell-bordered2">229</td><td>34</td><td class=" text-center">14,8</td><td>47</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Transferencias monetarias a familias</td><td>Familias</td><td>178</td><td class="cell-bordered2">178</td><td>165</td><td class=" text-center">92,7</td><td>614</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades agropecuarias</td><td>Personas</td><td>133</td><td class="cell-bordered2">64</td><td>64</td><td class=" text-center">100,0</td><td>163</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades comerciales y de servicios</td><td>Personas</td><td>2210</td><td class="cell-bordered2">838</td><td>838</td><td class=" text-center">100,0</td><td>163</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades industriales</td><td>Personas</td><td>3441</td><td class="cell-bordered2">1779</td><td>1779</td><td class=" text-center">100,0</td><td>139</td></tr>
				<tr class=""><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UI- Fichas Sociales aplicadas</td><td>Familias</td><td>600</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>
						
				<tr><td colspan="7"><strong>CENTRAL</strong><small style="padding-left:10px"><a href="http://tablero2015.stp.gov.py/descargas/11.pdf" target="_blank">Detalle Por Distrito</a> / <a href="http://tablero2015.stp.gov.py/descargas/11.pdf" target="_blank">Detalle Por Departamento</a><small></small></small></td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DIBEN- Asistencia Alimentaria</td><td>Beneficiarios</td><td>868</td><td class="cell-bordered2">868</td><td>868</td><td class=" text-center">100,0</td><td>23</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DIBEN- Ayuda en Salud Individual</td><td>Personas</td><td>3479</td><td class="cell-bordered2">2165</td><td>2165</td><td class="text-center">100,0</td><td>5670</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Asistencia Técnica Agropecuaria</td><td>Familias</td><td>353</td><td class="cell-bordered2">353</td><td>915</td><td class=" text-center">259,2</td><td>1255</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Cadenas de Valor-Sector Privado</td><td>Familias</td><td>6003</td><td class="cell-bordered2">6003</td><td>5636</td><td class=" text-center">93,9</td><td>1317</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Inversión en insumos y tecnología agropecuaria</td><td>Familias</td><td>39</td><td class="cell-bordered2">39</td><td>33</td><td class="text-center">84,6</td><td>2233</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MDI- Cedulación por primera vez</td><td>Personas</td><td>24753</td><td class="cell-bordered2">12258</td><td>12258</td><td class=" text-center">100,0</td><td>387</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Capacitación docente indígena</td><td>Personas</td><td>1</td><td class="cell-bordered2">1</td><td>0</td><td class=" text-center">0,0</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Construcción de espacios educativos para la primera infancia</td><td>Establecimientos</td><td>39</td><td class="cell-bordered2">39</td><td>23,4</td><td class=" text-center">60,0</td><td>2501</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Expansión de la Iniciación Profesional Agropecuaria - IPA</td><td>Estudiantes</td><td>80</td><td class="cell-bordered2">32</td><td>40</td><td class=" text-center">125,0</td><td>10</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Iniciación Profesional Agropecuaria - IPA - Capacitación docente</td><td>Docentes</td><td>4</td><td class="cell-bordered2">0,8</td><td>0,8</td><td class=" text-center">100,0</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Transferencias a instituciones educativas</td><td>Matriculados</td><td>8115</td><td class="cell-bordered2">8115</td><td>8014</td><td class="text-center">98,8</td><td>281</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MH- Adultos mayores con pensión alimentaria</td><td>Personas</td><td>13579</td><td class="cell-bordered2">0</td><td>6810</td><td class="text-center">ND</td><td>56564</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Construcción de Rutas Pavimentadas</td><td>Kilómetros</td><td>86,43</td><td class="cell-bordered2">71,76</td><td>39,89</td><td class="text-center">55,5</td><td>45440</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Mantenimiento de Rutas Pavimentadas</td><td>Kilómetros</td><td>163,86</td><td class="cell-bordered2">81,93</td><td>0</td><td class="text-center">0,0</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención en Unidades de Salud de la Familia</td><td>Personas Atendidas</td><td>222950</td><td class="cell-bordered2">133770</td><td>133770</td><td class=" text-center">100,0</td><td>15664</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atencion Extramural adultos mayores</td><td>Personas Atendidas</td><td>3434</td><td class="cell-bordered2">2235</td><td>2235</td><td class=" text-center">100,0</td><td>145</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención extramural bucodental</td><td>Personas Atendidas</td><td>6925</td><td class="cell-bordered2">4226</td><td>4226</td><td class=" text-center">100,0</td><td>35</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención extramural ocular</td><td>Personas Atendidas</td><td>210</td><td class="cell-bordered2">210</td><td>203</td><td class=" text-center">96,7</td><td>13</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Contratación de personal en APS</td><td>Personas contratadas</td><td>23</td><td class="cell-bordered2">1</td><td>1</td><td class=" text-center">100,0</td><td>130</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Fortalecimiento de Unidades de Salud Familiar existentes</td><td>USF</td><td>20</td><td class="cell-bordered2">20</td><td>20</td><td class=" text-center">100,0</td><td>169</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Habilitación de nuevas Unidades de Salud Familiar</td><td>USF</td><td>2</td><td class="cell-bordered2">1</td><td>1</td><td class=" text-center">100,0</td><td>535</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SAS- Familias con Transferencias TEKOPORA</td><td>Familias</td><td>1306</td><td class="cell-bordered2">1306</td><td>1306</td><td class=" text-center">100,0</td><td>3042</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SAS- Promoción social a familias con Transferencias TEKOPORA</td><td>Familias</td><td>1334</td><td class="cell-bordered2">1334</td><td>1334</td><td class=" text-center">100,0</td><td>493</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENADIS- Asistencia a personas con discapacidad</td><td>Servicios ofrecidos</td><td>119454</td><td class="cell-bordered2">55954</td><td>55954</td><td class=" text-center">100,0</td><td>7356</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENAVITAT- Soluciones Habitacionales</td><td>Viviendas Sociales</td><td>1058</td><td class="cell-bordered2">686</td><td>525,9</td><td class="text-center">76,7</td><td>31689</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Alimentación en centros</td><td>Personas</td><td>1155</td><td class="cell-bordered2">1155</td><td>1107</td><td class=" text-center">95,8</td><td>8269</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Alimentación en centros para pueblos indígenas</td><td>Personas</td><td>400</td><td class="cell-bordered2">400</td><td>310</td><td class=" text-center">77,5</td><td>1892</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Apoyo escolar en centros</td><td>Personas</td><td>931</td><td class="cell-bordered2">931</td><td>566</td><td class=" text-center">60,8</td><td>816</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Monitoreo a entidades de abrigo</td><td>Entidades</td><td>14</td><td class="cell-bordered2">7</td><td>5</td><td class=" text-center">71,4</td><td>3</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Monitoreo a niñez separada de su familia</td><td>Personas</td><td>482</td><td class="cell-bordered2">194</td><td>82</td><td class=" text-center">43,3</td><td>33</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Promoción social a familias</td><td>Familias</td><td>1310</td><td class="cell-bordered2">1310</td><td>202</td><td class=" text-center">15,4</td><td>280</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNNA- Transferencias monetarias a familias</td><td>Familias</td><td>1097</td><td class="cell-bordered2">1097</td><td>1125</td><td class=" text-center">102,6</td><td>3927</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades agropecuarias</td><td>Personas</td><td>4523</td><td class="cell-bordered2">3135</td><td>3135</td><td class=" text-center">100,0</td><td>204</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades comerciales y de servicios</td><td>Personas</td><td>30662</td><td class="cell-bordered2">17147</td><td>17147</td><td class="text-center">100,0</td><td>1455</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades industriales</td><td>Personas</td><td>19498</td><td class="cell-bordered2">9141</td><td>9141</td><td class=" text-center">100,0</td><td>1301</td></tr>
				<tr class=""><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UI- Fichas Sociales aplicadas</td><td>Familias</td><td>500</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>			             
				
				<tr><td colspan="7"><strong><a href="http://tablero2015.stp.gov.py/descargas/201507/departamento/12.pdf" target="_blank">ÑEEMBUCU</strong><small style="padding-left:10px"><a href="http://tablero2015.stp.gov.py/descargas/201507/distrito/12.pdf" target="_blank">Detalle Por Distrito</a><small></small></small></td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MAG- Asistencia Técnica Agropecuaria</td><td>Familias</td><td>955</td><td class="cell-bordered2">925</td><td>1284</td><td class=" text-center">138,8</td><td>1119</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MAG- Inversión en insumos y tecnología agropecuaria</td><td>Familias</td><td>96</td><td class="cell-bordered2">40</td><td>40</td><td class="text-center">100,0</td><td>64</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MOPC- Construcción de Rutas Pavimentada</td><td>Kilómetros</td><td>19,29</td><td class="cell-bordered2">15,29</td><td>0</td><td class="text-center">0,00</td><td>1692</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MOPC- Mantenimiento de Caminos Vecinales</td><td>Kilómetros</td><td>1023,65</td><td class="cell-bordered2">75,73</td><td>75,73</td><td class=" text-center">100,0</td><td>49</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MOPC- Mantenimiento de Rutas Pavimentadas</td><td>Kilómetros</td><td>7,3</td><td class="cell-bordered2">7,3</td><td>0</td><td class="text-center">0,00</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SENAVITAT- Soluciones Habitacionales</td><td>Viviendas Sociales</td><td>95</td><td class="cell-bordered2">70</td><td>70</td><td class=" text-center">100,0</td><td>5272</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SNPP- Capacitación en actividades agropecuarias</td><td>Personas</td><td>215</td><td class="cell-bordered2">70</td><td>70</td><td class=" text-center">100,0</td><td>39</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SNPP- Capacitación en actividades comerciales y de servicios</td><td>Personas</td><td>831</td><td class="cell-bordered2">303</td><td>303</td><td class=" text-center">100,0</td><td>24</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UI- Fichas Sociales aplicadas</td><td>Familias</td><td>322</td><td class="cell-bordered2">322</td><td>322</td><td class=" text-center">100,0</td><td>24</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SAS- Familias con Transferencias TEKOPORA</td><td>Familias</td><td>1285</td><td class="cell-bordered2">1285</td><td>1285</td><td class=" text-center">100,0</td><td>3053</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SAS- Promoción social a familias con Transferencias TEKOPORA</td><td>Familias</td><td>1339</td><td class="cell-bordered2">1339</td><td>1339</td><td class=" text-center">100,0</td><td>494</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MH- Adultos mayores con pensión alimentaria</td><td>Personas</td><td>1061</td><td class="cell-bordered2">0</td><td>953</td><td class="text-center">ND</td><td>11699</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSPBS- Atencion Extramural adultos mayores</td><td>Personas Atendidas</td><td>4422</td><td class="cell-bordered2">2875</td><td>2875</td><td class=" text-center">100,0</td><td>187</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSPBS- Atención en Unidades de Salud de la Familia</td><td>Personas Atendidas</td><td>53595</td><td class="cell-bordered2">32157</td><td>32157</td><td class=" text-center">100,0</td><td>3765</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSPBS- Atención extramural bucodental</td><td>Personas Atendidas</td><td>429</td><td class="cell-bordered2">429</td><td>429</td><td class=" text-center">100,0</td><td>33</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSPBS- Atención extramural ocular</td><td>Personas Atendidas</td><td>910</td><td class="cell-bordered2">160</td><td>221</td><td class=" text-center">138,1</td><td>14</td></tr>
				<tr class=""><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSPBS- Contratación de personal en APS</td><td>Personas contratadas</td><td>9</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>
				<tr class=""><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SENASA- Suministro de agua potable</td><td>Sistemas de agua</td><td>0,6</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MEC- Transferencias a instituciones educativas</td><td>Matriculados</td><td>2304</td><td class="cell-bordered2">2304</td><td>2304</td><td class="text-center">100,0</td><td>54</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MEC- Ampliación y reparación de establecimientos escolares - Proyectos 111 y 822</td><td>Establecimientos</td><td>0</td><td class="cell-bordered2">0</td><td>0</td><td class="text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ANDE- Mejoramiento de Líneas de Distribución</td><td>Kilómetros</td><td>158</td><td class="cell-bordered2">30,66</td><td>88,34</td><td class="text-center">288,1</td><td>1642</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DIBEN- Asistencia Alimentaria</td><td>Beneficiarios</td><td>261</td><td class="cell-bordered2">261</td><td>261</td><td class=" text-center">100,0</td><td>17</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DIBEN- Ayuda en Salud Individual</td><td>Personas</td><td>26</td><td class="cell-bordered2">19</td><td>19</td><td class=" text-center">100,0</td><td>30</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MDI- Cedulación por primera vez</td><td>Personas</td><td>1578</td><td class="cell-bordered2">828</td><td>828</td><td class=" text-center">100,0</td><td>31</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SENADIS- Asistencia a personas con discapacidad</td><td>Servicios ofrecidos</td><td>470</td><td class="cell-bordered2">470</td><td>470</td><td class=" text-center">100,0</td><td>506</td></tr>             
              
				<tr><td colspan="7"><strong><a href="http://tablero2015.stp.gov.py/descargas/201507/departamento/13.pdf" target="_blank">AMAMBAY</a></strong><small style="padding-left:10px"><a href="http://tablero2015.stp.gov.py/descargas/201507/distrito/13.pdf" target="_blank">Detalle Por Distrito</a><small></small></small></td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MAG- Asistencia Técnica Agropecuaria</td><td>Familias</td><td>2353</td><td class="cell-bordered2">1932</td><td>2002</td><td class=" text-center">101.70</td><td>1,494</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MAG- Cadenas de Valor-Sector Privado</td><td>Familias</td><td>153</td><td class="cell-bordered2">153</td><td>153</td><td class=" text-center">100,0</td><td>24</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MAG- Inversión en insumos y tecnología agropecuaria</td><td>Familias</td><td>288</td><td class="cell-bordered2">38</td><td>38</td><td class=" text-center">100,0</td><td>98</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MOPC- Construcción de Caminos Vecinales</td><td>Kilómetros</td><td>17.53</td><td class="cell-bordered2">2.92</td><td>2.92</td><td class=" text-center">100.00</td><td>1,174</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MOPC- Construcción de Puentes</td><td>Metros</td><td>50.05</td><td class="cell-bordered2">29.19</td><td>29.19</td><td class="text-center">100.00</td><td>1,506</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MOPC- Construcción de Rutas Pavimentadas</td><td>Kilómetros</td><td>99.91</td><td class="cell-bordered2">61.84</td><td>55.61</td><td class="text-center">89.93</td><td>194,575</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MOPC- Mantenimiento de Caminos Vecinales</td><td>Kilómetros</td><td>110.17</td><td class="cell-bordered2">55.76</td><td>54.12</td><td class="text-center">97.06</td><td>1,524</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Mantenimiento de Puentes</td><td>Metros</td><td>217.03</td><td class="cell-bordered2">126.56</td><td>146.14</td><td class=" text-center">115.47</td><td>657</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SENAVITAT- Soluciones Habitacionales</td><td>Viviendas Sociales</td><td>341</td><td class="cell-bordered2">191</td><td>4.59</td><td class="text-center">2.40</td><td>284</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SNPP- Capacitación en actividades comerciales y de servicios</td><td>Personas</td><td>64</td><td class="cell-bordered2">64</td><td>64</td><td class=" text-center">100.00</td><td>8</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SNPP- Capacitación en actividades industriales</td><td>Personas</td><td>24</td><td class="cell-bordered2">24</td><td>24</td><td class=" text-center">100.00</td><td>9</td></tr>
				<tr class=""><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UI- Fichas Sociales aplicadas</td><td>Familias</td><td>500</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center"></td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SAS- Familias con Transferencias TEKOPORA</td><td>Familias</td><td>1,661</td><td class="cell-bordered2">1,661</td><td>1,661</td><td class=" text-center">100.00</td><td>3,350</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SAS- Promoción social a familias con Transferencias TEKOPORA</td><td>Familias</td><td>1,466</td><td class="cell-bordered2">1,466</td><td>1,466</td><td class=" text-center">100.00</td><td>541</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MH- Adultos mayores con pensión alimentaria</td><td>Personas</td><td>491</td><td class="cell-bordered2">0</td><td>420</td><td class="text-center">ND</td><td>7628</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSPBS- Atencion Extramural adultos mayores</td><td>Personas Atendidas</td><td>308</td><td class="cell-bordered2">201</td><td>201</td><td class=" text-center">100,0</td><td>13</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSPBS- Atención en Unidades de Salud de la Familia</td><td>Personas Atendidas</td><td>47162</td><td class="cell-bordered2">28297</td><td>28297</td><td class=" text-center">100,0</td><td>3313</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSPBS- Atención extramural bucodental</td><td>Personas Atendidas</td><td>581</td><td class="cell-bordered2">581</td><td>581</td><td class=" text-center">100,0</td><td>49</td></tr>
				<tr class=""><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSPBS- Atención extramural ocular</td><td>Personas Atendidas</td><td>240</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>
				<tr class=""><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSPBS- Contratación de personal en APS</td><td>Personas contratadas</td><td>6</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSPBS- Fortalecimiento de Unidades de Salud Familiar existentes</td><td>USF</td><td>10</td><td class="cell-bordered2">10</td><td>10</td><td class=" text-center">100,0</td><td>89</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSPBS- Habilitación de nuevas Unidades de Salud Familiar</td><td>USF</td><td>1</td><td class="cell-bordered2">1</td><td>1</td><td class=" text-center">100,0</td><td>535</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SENASA- Suministro de agua potable</td><td>Sistemas de agua</td><td>10</td><td class="cell-bordered2">1,4</td><td>1,4</td><td class="text-center">100,00</td><td>842</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MEC- Capacitación docente indígena</td><td>Personas</td><td>11</td><td class="cell-bordered2">9</td><td>12</td><td class=" text-center">100,0</td><td>2</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MEC- Expansión de la Iniciación Profesional Agropecuaria - IPA</td><td>Estudiantes</td><td>20</td><td class="cell-bordered2">8</td><td>10</td><td class=" text-center">125,0</td><td>3</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MEC- Iniciación Profesional Agropecuaria - IPA - Capacitación docente</td><td>Docentes</td><td>1</td><td class="cell-bordered2">0,2</td><td>0,2</td><td class=" text-center">100,0</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MEC- Iniciación Profesional Agropecuaria - IPA - Equipamientos</td><td>Equipamientos informáticos</td><td>2</td><td class="cell-bordered2">0,2</td><td>0,6</td><td class=" text-center">300,0</td><td>4</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MEC- Transferencias a instituciones educativas</td><td>Matriculados</td><td>3135</td><td class="cell-bordered2">3135</td><td>3135</td><td class="text-center">100,0</td><td>101</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MEC- Ampliación y reparación de establecimientos escolares - Proyectos 111 y 822</td><td>Establecimientos</td><td>7,2</td><td class="cell-bordered2">0</td><td>0</td><td class="text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MEC- Construcción de espacios educativos para la primera infancia</td><td>Establecimientos</td><td>2</td><td class="cell-bordered2">2</td><td>2</td><td class=" text-center">100,0</td><td>253</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ANDE- Mejoramiento de Líneas de Distribución</td><td>Kilómetros</td><td>58</td><td class="cell-bordered2">29,58</td><td>29,58</td><td class=" text-center">100,0</td><td>508</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DIBEN- Ayuda en Salud Individual</td><td>Personas</td><td>29</td><td class="cell-bordered2">20</td><td>20</td><td class="text-center">100,0</td><td>146</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SINAFOCAL-Micro y pequeños empresarios</td><td>Personas</td><td>169</td><td class="cell-bordered2">169</td><td>94</td><td class=" text-center">55,6</td><td>287</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SNNA- Transferencias monetarias a familias</td><td>Familias</td><td>40</td><td class="cell-bordered2">40</td><td>39</td><td class=" text-center">97,50</td><td>140</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SNNA- Promoción social a familias</td><td>Familias</td><td>46</td><td class="cell-bordered2">46</td><td>0</td><td class=" text-center">0,00</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SNNA- Monitoreo a entidades de abrigo</td><td>Entidades</td><td>1</td><td class="cell-bordered2">1</td><td>0</td><td class=" text-center">0,00</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SNNA- Monitoreo a niñez separada de su familia</td><td>Personas</td><td>30</td><td class="cell-bordered2">30</td><td>0</td><td class=" text-center">0,00</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MDI- Cedulación por primera vez</td><td>Personas</td><td>6650</td><td class="cell-bordered2">3575</td><td>3575</td><td class=" text-center">100,0</td><td>113</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SENADIS- Asistencia a personas con discapacidad</td><td>Servicios ofrecidos</td><td>193</td><td class="cell-bordered2">193</td><td>193</td><td class=" text-center">100,00</td><td>78</td></tr><tr>              
              
              
				<tr><td colspan="7"><strong><a href="http://tablero2015.stp.gov.py/descargas/201507/departamento/14.pdf" target="_blank">CANINDEYU</a></strong><small style="padding-left:10px"><a href="http://tablero2015.stp.gov.py/descargas/201507/distrito/14.pdf" target="_blank">Detalle Por Distrito</a><small></small></small></td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ANDE- Mejoramiento de Líneas de Distribución</td><td>Kilómetros</td><td>193,72</td><td class="cell-bordered2">35,56</td><td>129,57</td><td class="text-center">364,4</td><td>3499</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DIBEN- Asistencia Alimentaria</td><td>Beneficiarios</td><td>3141</td><td class="cell-bordered2">3141</td><td>3141</td><td class=" text-center">100,0</td><td>124</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DIBEN- Ayuda en Salud Individual</td><td>Personas</td><td>69</td><td class="cell-bordered2">44</td><td>44</td><td class="text-center">100,0</td><td>95</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Asistencia Técnica Agropecuaria</td><td>Familias</td><td>11366</td><td class="cell-bordered2">5632</td><td>7546</td><td class=" text-center">134,0</td><td>6409</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Cadenas de Valor-Sector Privado</td><td>Familias</td><td>745</td><td class="cell-bordered2">745</td><td>745</td><td class=" text-center">100,00</td><td>21</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Inversión en insumos y tecnología agropecuaria</td><td>Familias</td><td>6040</td><td class="cell-bordered2">510</td><td>490</td><td class="text-center">96,1</td><td>866</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MDI- Cedulación por primera vez</td><td>Personas</td><td>12458</td><td class="cell-bordered2">6208</td><td>6208</td><td class=" text-center">100,0</td><td>196</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MEC- Ampliación y reparación de establecimientos escolares - Proyectos 111 y 822</td><td>Establecimientos</td><td>38</td><td class="cell-bordered2">4</td><td>4</td><td class="text-center">100,0</td><td>1066</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Capacitación docente indígena</td><td>Personas</td><td>11</td><td class="cell-bordered2">9</td><td>8</td><td class=" text-center">88,9</td><td>3</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MEC- Expansión de la Iniciación Profesional Agropecuaria - IPA</td><td>Estudiantes</td><td>250</td><td class="cell-bordered2">100</td><td>125</td><td class=" text-center">125,0</td><td>43</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Iniciación Profesional Agropecuaria - IPA - Capacitación docente</td><td>Docentes</td><td>37</td><td class="cell-bordered2">7,4</td><td>7,2</td><td class=" text-center">97,3</td><td>4</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Iniciación Profesional Agropecuaria - IPA - EquipamientoS</td><td>Equipamientos informáticos</td><td>4</td><td class="cell-bordered2">0,4</td><td>1,2</td><td class=" text-center">300,0</td><td>8</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Transferencias a instituciones educativas</td><td>Matriculados</td><td>21687</td><td class="cell-bordered2">21687</td><td>21867</td><td class="text-center">100,0</td><td>488</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MH- Adultos mayores con pensión alimentaria</td><td>Personas</td><td>687</td><td class="cell-bordered2">0</td><td>910</td><td class="text-center">ND</td><td>9561</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MOPC- Construcción de Caminos Vecinales</td><td>Kilómetros</td><td>23,83</td><td class="cell-bordered2">3,97</td><td>3,97</td><td class=" text-center">100,00</td><td>1406</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Construcción de Rutas Pavimentadas</td><td>Kilómetros</td><td>15</td><td class="cell-bordered2">6</td><td>9</td><td class="text-center">150,0</td><td>24233</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MOPC- Mantenimiento de Caminos Vecinales</td><td>Kilómetros</td><td>1029</td><td class="cell-bordered2">1029</td><td>1029</td><td class="text-center">100,0</td><td>3062</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención en Unidades de Salud de la Familia</td><td>Personas Atendidas</td><td>102900</td><td class="cell-bordered2">61740</td><td>61740</td><td class=" text-center">100,0</td><td>7229</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atencion Extramural adultos mayores</td><td>Personas Atendidas</td><td>1893</td><td class="cell-bordered2">1233</td><td>1233</td><td class=" text-center">100,0</td><td>80</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención extramural bucodental</td><td>Personas Atendidas</td><td>1412</td><td class="cell-bordered2">1412</td><td>1412</td><td class=" text-center">100,0</td><td>68</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención extramural ocular</td><td>Personas Atendidas</td><td>90</td><td class="cell-bordered2">90</td><td>86</td><td class=" text-center">95,56</td><td>6</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSPBS- Contratación de personal en APS</td><td>Personas contratadas</td><td>43</td><td class="cell-bordered2">18</td><td>18</td><td class=" text-center">100,00</td><td>1934</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSPBS- Fortalecimiento de Unidades de Salud Familiar existentes</td><td>USF</td><td>30</td><td class="cell-bordered2">15</td><td>15</td><td class=" text-center">100,00</td><td>131</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSPBS- Habilitación de nuevas Unidades de Salud Familiar</td><td>USF</td><td>6</td><td class="cell-bordered2">6</td><td>6</td><td class=" text-center">100,0</td><td>3212</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SAS- Familias con Transferencias TEKOPORA</td><td>Familias</td><td>8835</td><td class="cell-bordered2">8835</td><td>8835</td><td class=" text-center">100,0</td><td>18257</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SAS- Promoción social a familias con Transferencias TEKOPORA</td><td>Familias</td><td>7744</td><td class="cell-bordered2">7744</td><td>7744</td><td class=" text-center">100,0</td><td>2859</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENADIS- Asistencia a personas con discapacidad</td><td>Servicios ofrecidos</td><td>450</td><td class="cell-bordered2">450</td><td>450</td><td class=" text-center">100,0</td><td>339</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SENASA- Suministro de agua potable</td><td>Sistemas de agua</td><td>17,3</td><td class="cell-bordered2">13,3</td><td>10,8</td><td class="text-center">81,2</td><td>6521</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SENAVITAT- Soluciones Habitacionales</td><td>Viviendas Sociales</td><td>1406</td><td class="cell-bordered2">20</td><td>365,06</td><td class="text-center">1560,3</td><td>17567</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SNNA- Promoción social a familias</td><td>Familias</td><td>28</td><td class="cell-bordered2">28</td><td>0</td><td class=" text-center">0,0</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SNNA- Transferencias monetarias a familias</td><td>Familias</td><td>22</td><td class="cell-bordered2">22</td><td>19</td><td class=" text-center">86,4</td><td>59</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SNPP- Capacitación en actividades agropecuarias</td><td>Personas</td><td>629</td><td class="cell-bordered2">390</td><td>390</td><td class=" text-center">100,0</td><td>34</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SNPP- Capacitación en actividades comerciales y de servicios</td><td>Personas</td><td>1779</td><td class="cell-bordered2">1151</td><td>1151</td><td class=" text-center">100,0</td><td>57</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SNPP- Capacitación en actividades industriales</td><td>Personas</td><td>1049</td><td class="cell-bordered2">605</td><td>605</td><td class=" text-center">100,0</td><td>106</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UI- Acondicionamiento de suelo - Familias</td><td>Familias</td><td>1644</td><td class="cell-bordered2">1379</td><td>1379</td><td class=" text-center">100,0</td><td>4334</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UI- Acondicionamiento de suelo - Hectáreas</td><td>Hectáreas</td><td>3438,02</td><td class="cell-bordered2">2274,02</td><td>1782,02</td><td class=" text-center">78,4</td><td>2716</td></tr>
				<tr class=""><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UI- Fichas Sociales aplicadas</td><td>Familias</td><td>6100</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UI- Siembra mecanizada - Familias</td><td>Familias</td><td>762</td><td class="cell-bordered2">12</td><td>12</td><td class=" text-center">100,0</td><td>278</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UI- Siembra mecanizada - Hectáreas</td><td>Hectáreas</td><td>1513</td><td class="cell-bordered2">13</td><td>13</td><td class=" text-center">100,0</td><td>278</td></tr>
						
								
				<tr><td colspan="7"><strong><a href="http://tablero2015.stp.gov.py/descargas/201507/departamento/15.pdf" target="_blank">PRESIDENTE HAYES</a></strong><small style="padding-left:10px"><a href="http://tablero2015.stp.gov.py/descargas/201507/distrito/15.pdf" target="_blank">Detalle Por Distrito</a><small></small></small></td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DIBEN- Asistencia Alimentaria</td><td>Beneficiarios</td><td>830</td><td class="cell-bordered2">830</td><td>830</td><td class=" text-center">100.00</td><td>42</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DIBEN- Ayuda en Salud Individual</td><td>Personas</td><td>110</td><td class="cell-bordered2">66</td><td>66</td><td class="text-center">100.00</td><td>113</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Asistencia Técnica Agropecuaria</td><td>Familias</td><td>981</td><td class="cell-bordered2">981</td><td>963</td><td class=" text-center">98.2</td><td>439</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Inversión en insumos y tecnología agropecuaria</td><td>Familias</td><td>61</td><td class="cell-bordered2">61</td><td>61</td><td class="text-center">100.00</td><td>82</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MDI- Cedulación por primera vez</td><td>Personas</td><td>2153</td><td class="cell-bordered2">1153</td><td>1153</td><td class=" text-center">100.00</td><td>36</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MEC- Ampliación y reparación de establecimientos escolares - Proyectos 111 y 822</td><td>Establecimientos</td><td>0</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>328</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Capacitación docente indígena</td><td>Personas</td><td>232</td><td class="cell-bordered2">189</td><td>195</td><td class=" text-center">103.2</td><td>42</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Construcción de espacios educativos para la primera infancia</td><td>Establecimientos</td><td>2</td><td class="cell-bordered2">2</td><td>1.2</td><td class=" text-center">60.00</td><td>141</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MEC- Expansión de la Iniciación Profesional Agropecuaria - IPA</td><td>Estudiantes</td><td>18</td><td class="cell-bordered2">7.2</td><td>9</td><td class=" text-center">125.00</td><td>3</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MEC- Iniciación Profesional Agropecuaria - IPA - Capacitación docente</td><td>Docentes</td><td>2</td><td class="cell-bordered2">0.4</td><td>0.4</td><td class=" text-center">100.00</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MEC- Iniciación Profesional Agropecuaria - IPA - Equipamientos</td><td>Equipamientos informáticos</td><td>1</td><td class="cell-bordered2">0.1</td><td>0.3</td><td class=" text-center">300.00</td><td>2</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MEC- Transferencias a instituciones educativas</td><td>Matriculados</td><td>7016</td><td class="cell-bordered2">7016</td><td>7016</td><td class="text-center">100.00</td><td>165</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MH- Adultos mayores con pensión alimentaria</td><td>Personas</td><td>1418</td><td class="cell-bordered2">0</td><td>274</td><td class="text-center">ND</td><td>6966</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MOPC- Construcción de Rutas Pavimentadas</td><td>Kilómetros</td><td>3.92</td><td class="cell-bordered2">2.23</td><td>1.48</td><td class="text-center">66.4</td><td>1246</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MOPC- Mantenimiento de Caminos Vecinales</td><td>Kilómetros</td><td>529.04</td><td class="cell-bordered2">529.04</td><td>330.02</td><td class=" text-center">62.4</td><td>201</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSPBS- Atención en Unidades de Salud de la Familia</td><td>Personas Atendidas</td><td>38587</td><td class="cell-bordered2">23152</td><td>23152</td><td class=" text-center">100.00</td><td>2711</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSPBS- Atencion Extramural adultos mayores</td><td>Personas Atendidas</td><td>553</td><td class="cell-bordered2">361</td><td>361</td><td class=" text-center">100.00</td><td>2711</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSPBS- Atención extramural bucodental</td><td>Personas Atendidas</td><td>40</td><td class="cell-bordered2">40</td><td>40</td><td class=" text-center">100.00</td><td>23</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSPBS- Atención extramural ocular</td><td>Personas Atendidas</td><td>40</td><td class="cell-bordered2">40</td><td>40</td><td class=" text-center">100.00</td><td>23</td></tr>
				<tr class=""><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSPBS- Contratación de personal en APS</td><td>Personas contratadas</td><td>11</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SAS- Familias con Transferencias TEKOPORA</td><td>Familias</td><td>5786</td><td class="cell-bordered2">5786</td><td>5786</td><td class=" text-center">100.00</td><td>9394</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SAS- Promoción social a familias con Transferencias TEKOPORA</td><td>Familias</td><td>3968</td><td class="cell-bordered2">3968</td><td>3968</td><td class=" text-center">100.00</td><td>1465</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SENADIS- Asistencia a personas con discapacidad</td><td>Servicios ofrecidos</td><td>657</td><td class="cell-bordered2">657</td><td>657</td><td class=" text-center">100.00</td><td>90</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SENASA- Suministro de agua potable</td><td>Sistemas de agua</td><td>4,4</td><td class="cell-bordered2">4,4</td><td>3.65</td><td class="text-center">83,0</td><td>2555</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SENAVITAT- Soluciones Habitacionales</td><td>Viviendas Sociales</td><td>34.4</td><td class="cell-bordered2">32</td><td>16,21</td><td class=" text-center">50,66</td><td>9479</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SNNA- Promoción social a familias</td><td>Familias</td><td>5</td><td class="cell-bordered2">5</td><td>0</td><td class=" text-center">0,0</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SNNA- Transferencias monetarias a familias</td><td>Familias</td><td>4</td><td class="cell-bordered2">4</td><td>5</td><td class=" text-center">125.00</td><td>25</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SNPP- Capacitación en actividades agropecuarias</td><td>Personas</td><td>672</td><td class="cell-bordered2">260</td><td>260</td><td class=" text-center">100.00</td><td>54</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SNPP- Capacitación en actividades comerciales y servicios</td><td>Personas</td><td>1719</td><td class="cell-bordered2">985</td><td>985</td><td class=" text-center">100.00</td><td>90</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SNPP- Capacitación en actividades industriales</td><td>Personas</td><td>915</td><td class="cell-bordered2">417</td><td>417</td><td class=" text-center">100.00</td><td>112</td></tr>
				<tr class=""><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UI- Fichas Sociales aplicadas</td><td>Familias</td><td>200</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>				
				 				
				<tr><td colspan="7"><strong><a href="http://tablero2015.stp.gov.py/descargas/201507/departamento/16.pdf" target="_blank">BOQUERON</a></strong><small style="padding-left:10px"><a href="http://tablero2015.stp.gov.py/descargas/201507/distrito/16.pdf" target="_blank">Detalle Por Distrito</a><small></small></small></td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DIBEN- Ayuda en Salud Individual</td><td>Personas</td><td>18</td><td class="cell-bordered2">13</td><td>13</td><td class="text-center">100.00</td><td>50</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Asistencia Técnica Agropecuaria</td><td>Familias</td><td>236</td><td class="cell-bordered2">236</td><td>191</td><td class=" text-center">80,9</td><td>209</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Inversión en insumos y tecnología agropecuaria</td><td>Familias</td><td>126</td><td class="cell-bordered2">126</td><td>126</td><td class="text-center">100,00</td><td>45</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MDI- Cedulación por primera veZ</td><td>Personas</td><td>2249</td><td class="cell-bordered2">1249</td><td>1249</td><td class=" text-center">100,0</td><td>39</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MEC- Transferencias a instituciones educativas</td><td>Matriculados</td><td>2078</td><td class="cell-bordered2">2078</td><td>2078</td><td class="text-center">100,00</td><td>52</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MH- Adultos mayores con pensión alimentaria</td><td>Personas</td><td>81</td><td class="cell-bordered2">0</td><td>194</td><td class="text-center">ND</td><td>2981</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Mantenimiento de Caminos Vecinales</td><td>Kilómetros</td><td>381</td><td class="cell-bordered2">381</td><td>136,92</td><td class=" text-center">35,9</td><td>89</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Mantenimiento de Rutas Pavimentadas</td><td>Kilómetros</td><td>336,41</td><td class="cell-bordered2">203,91</td><td>71,15</td><td class="text-center">34,9</td><td>40284</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención en Unidades de Salud de la Familia</td><td>Personas Atendidas</td><td>21437</td><td class="cell-bordered2">12862</td><td>12862</td><td class=" text-center">100,00</td><td>1506</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSPBS- Atencion Extramural adultos mayores</td><td>Personas Atendidas</td><td>290</td><td class="cell-bordered2">191</td><td>191</td><td class=" text-center">100,0</td><td>12</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSPBS- Atención extramural bucodental</td><td>Personas Atendidas</td><td>1</td><td class="cell-bordered2">1</td><td>1</td><td class=" text-center">100,0</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención extramural ocular</td><td>Personas Atendidas</td><td>120</td><td class="cell-bordered2">120</td><td>122</td><td class=" text-center">101,7</td><td>8</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSPBS- Contratación de personal en APS</td><td>Personas contratadas</td><td>9</td><td class="cell-bordered2">1</td><td>1</td><td class=" text-center">100,0</td><td>157</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Fortalecimiento de Unidades de Salud Familiar existentes</td><td>USF</td><td>10</td><td class="cell-bordered2">10</td><td>10</td><td class=" text-center">100,00</td><td>77</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENADIS- Asistencia a personas con discapacidad</td><td>Servicios ofrecidos</td><td>77</td><td class="cell-bordered2">77</td><td>81</td><td class=" text-center">105,2</td><td>282</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SENASA- Suministro de agua potable</td><td>Sistemas de agua</td><td>15,1</td><td class="cell-bordered2">13,6</td><td>13,5</td><td class="text-center">93,3</td><td>9660</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SINAFOCAL- Micro y pequeños empresarios</td><td>Personas</td><td>96</td><td class="cell-bordered2">96</td><td>96</td><td class=" text-center">100,0</td><td>147</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SNPP- Capacitación en actividades agropecuarias</td><td>Personas</td><td>140</td><td class="cell-bordered2">60</td><td>60</td><td class=" text-center">100,0</td><td>27</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades comerciales y de servicios</td><td>Personas</td><td>725</td><td class="cell-bordered2">452</td><td>452</td><td class=" text-center">100,0</td><td>107</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades industriales</td><td>Personas</td><td>560</td><td class="cell-bordered2">280</td><td>280</td><td class=" text-center">100,0</td><td>113</td></tr>
								
				
				<tr><td colspan="7"><strong><a href="http://tablero2015.stp.gov.py/descargas/201507/departamento/17.pdf" target="_blank">ALTO PARAGUAY</a></strong><small style="padding-left:10px"><a href="http://tablero2015.stp.gov.py/descargas/201507/distrito/17.pdf" target="_blank">Detalle Por Distrito</a><small></small></small></td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DIBEN- Asistencia Alimentaria</td><td>Beneficiarios</td><td>139</td><td class="cell-bordered2">139</td><td>139</td><td class=" text-center">100.00</td><td>13</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DIBEN- Ayuda en Salud Individual</td><td>Personas</td><td>29</td><td class="cell-bordered2">18</td><td>18</td><td class=" text-center">100.00</td><td>24</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Asistencia Técnica Agropecuaria</td><td>Familias</td><td>235</td><td class="cell-bordered2">235</td><td>200</td><td class=" text-center">85.1</td><td>90</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MDI- Cedulación por primera vez</td><td>Personas</td><td>274</td><td class="cell-bordered2">149</td><td>149</td><td class=" text-center">100.00</td><td>5</td></tr>
				<tr class=""><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MEC- Iniciación Profesional Agropecuaria - IPA - Equipamientos</td><td>Equipamientos informáticos</td><td>1</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>2</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEC- Transferencias a instituciones educativas</td><td>Matriculados</td><td>946</td><td class="cell-bordered2">946</td><td>946</td><td class="text-center">100.00</td><td>22</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MH- Adultos mayores con pensión alimentaria</td><td>Personas</td><td>88</td><td class="cell-bordered2">0</td><td>73</td><td class="text-center">ND</td><td>867</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOPC- Mantenimiento de Caminos Vecinales</td><td>Kilómetros</td><td>618.04</td><td class="cell-bordered2">618.04</td><td>397.53</td><td class=" text-center">64.3</td><td>7238</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención en Unidades de Salud de la Familia</td><td>Personas Atendidas</td><td>17150</td><td class="cell-bordered2">10290</td><td>10290</td><td class=" text-center">100.00</td><td>1205</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atencion Extramural adultos mayores</td><td>Personas Atendidas</td><td>235</td><td class="cell-bordered2">153</td><td>153</td><td class=" text-center">100.00</td><td>10</td></tr>
				<tr class=""><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Atención extramural bucodental</td><td>Personas Atendidas</td><td>325</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>
				<tr class=""><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSPBS- Contratación de personal en APS</td><td>Personas contratadas</td><td>5</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center">ND</td><td>0</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSPBS- Fortalecimiento de Unidades de Salud Familiar existentes</td><td>USF</td><td>5</td><td class="cell-bordered2">5</td><td>5</td><td class=" text-center">100.00</td><td>45</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SAS- Familias con Transferencias TEKOPORA</td><td>Familias</td><td>1095</td><td class="cell-bordered2">1095</td><td>1095</td><td class=" text-center">100.00</td><td>2440</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SAS- Promoción social a familias con Transferencias TEKOPORA</td><td>Familias</td><td>1070</td><td class="cell-bordered2">1070</td><td>1070</td><td class=" text-center">100.00</td><td>395</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SENADIS- Asistencia a personas con discapacidad</td><td>Servicios ofrecidos</td><td>140</td><td class="cell-bordered2">45</td><td>90</td><td class=" text-center">200.0</td><td>98</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SENASA- Suministro de agua potable</td><td>Sistemas de agua</td><td>0.6</td><td class="cell-bordered2">0.6</td><td>0.6</td><td class=" text-center">100.00</td><td>420</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MEC- Becas para estudiantes de la Educación Media</td><td>Estudiantes</td><td>24</td><td class="cell-bordered2">12</td><td>6</td><td class=" text-center">50.00</td><td>3</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades agropecuarias</td><td>Personas</td><td>365</td><td class="cell-bordered2">198</td><td>198</td><td class=" text-center">100.00</td><td>89</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNPP- Capacitación en actividades comerciales y de servicios</td><td>Personas</td><td>249</td><td class="cell-bordered2">103</td><td>103</td><td class=" text-center">100.00</td><td>38</td></tr>
				<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SNPP- Capacitación en actividades industriales</td><td>Personas</td><td>371</td><td class="cell-bordered2">195</td><td>195</td><td class=" text-center">100.00</td><td>121</td></tr>             

              	<tr><td colspan="7"><strong><a href="http://tablero2015.stp.gov.py/descargas/201507/departamento/0.pdf" target="_blank">CAPITAL</a></strong><small style="padding-left:10px"><a href="http://tablero2015.stp.gov.py/descargas/201507/distrito/0.pdf" target="_blank">Detalle Por Distrito</a><small></small></small></td></tr>
              	<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MAG- Asistencia Técnica Agropecuaria</td><td>Familias</td><td>100</td><td class="cell-bordered2">100</td><td>50</td><td class=" text-center">50.00</td><td>0</td></tr>
              	<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAG- Cadenas de Valor-Sector Privado</td><td>Familias</td><td>2,872</td><td class="cell-bordered2">2,872</td><td>2,872</td><td class=" text-center">100.00</td><td>89</td></tr>
              	<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MOPC- Construcción de Rutas Pavimentadas</td><td>Kilómetros</td><td>0.07</td><td class="cell-bordered2">0</td><td>0.03</td><td class="text-center">Infinity</td><td>1,298</td></tr>
              	<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SENAVITAT- Soluciones Habitacionales</td><td>Viviendas Sociales</td><td>101</td><td class="cell-bordered2">101</td><td>6.67</td><td class=" text-center">6.60</td><td>616</td></tr>
              	<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SNPP- Capacitación en actividades agropecuarias</td><td>Personas</td><td>43</td><td class="cell-bordered2">43</td><td>43</td><td class=" text-center">100.00</td><td>10</td></tr>
              	<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SNPP- Capacitación en actividades comerciales y de servicios</td><td>Personas</td><td>1,576</td><td class="cell-bordered2">1,576</td><td>1,576</td><td class=" text-center">100.00</td><td>147</td></tr>
              	<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SAS- Familias con Transferencias TEKOPORA</td><td>Familias</td><td>30,719</td><td class="cell-bordered2">2,133</td><td>2,133</td><td class=" text-center">100.00</td><td>5,027</td></tr>
              	<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SAS- Promoción social a familias con Transferencias TEKOPORA</td><td>Familias</td><td>2,205</td><td class="cell-bordered2">2,205</td><td>2,205</td><td class=" text-center">100.00</td><td>814</td></tr>
              	<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MH- Adultos mayores con pensión alimentaria</td><td>Personas</td><td>138,237.39</td><td class="cell-bordered2">136,238</td><td>136,477.71</td><td class="text-center">100.18</td><td>337,255</td></tr>
              	<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSPBS- Atencion Extramural adultos mayores</td><td>Personas Atendidas</td><td>1,269</td><td class="cell-bordered2">825</td><td>825</td><td class=" text-center">100.00</td><td>54</td></tr>
              	<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSPBS- Atención en Unidades de Salud de la Familia</td><td>Personas Atendidas</td><td>70,744</td><td class="cell-bordered2">42,446.4</td><td>42,446.4</td><td class=" text-center">100.00</td><td>4,970</td></tr>
              	<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSPBS- Atención extramural bucodental</td><td>Personas Atendidas</td><td>736</td><td class="cell-bordered2">524.99</td><td>524.99</td><td class=" text-center">100.00</td><td>17</td></tr>
              	<tr class=""><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSPBS- Contratación de personal en APS</td><td>Personas contratadas</td><td>10</td><td class="cell-bordered2">0</td><td>0</td><td class=" text-center"></td><td>0</td></tr><tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#myModal" class="registro" codigoregistro="768-297-87-20-0"> MEC- Becas para estudiantes de la Educación Media</a></td><td>Estudiantes</td><td>4</td><td class="cell-bordered2">2</td><td>1</td><td class=" text-center">50.00</td><td>1</td></tr>
              	<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MEC- Transferencias a instituciones educativas</td><td>Matriculados</td><td>6,528</td><td class="cell-bordered2">6,528</td><td>6,777.6</td><td class="text-center">103.82</td><td>152</td></tr>
              	<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MEC- Ampliación y reparación de establecimientos escolares - Proyectos 111 y 822</td><td>Establecimientos</td><td>1</td><td class="cell-bordered2">0.5</td><td>0.5</td><td class=" text-center">100.00</td><td>446</td></tr><tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#myModal" class="registro" codigoregistro="935-297-62-27-0"> MEC- Construcción de espacios educativos para la primera infancia</a></td><td>Establecimientos</td><td>10</td><td class="cell-bordered2">10</td><td>10</td><td class=" text-center">100.00</td><td>857</td></tr>
              	<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DIBEN- Asistencia Alimentaria</td><td>Beneficiarios</td><td>458</td><td class="cell-bordered2">458</td><td>458</td><td class=" text-center">100.00</td><td>13</td></tr>
              	<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DIBEN- Ayuda en Salud Individual</td><td>Personas</td><td>1,100</td><td class="cell-bordered2">730</td><td>730</td><td class="text-center">100.00</td><td>1,903</td></tr>
              	<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SNNA- Transferencias monetarias a familias</td><td>Familias</td><td>284</td><td class="cell-bordered2">284</td><td>284</td><td class=" text-center">100.00</td><td>1,075</td></tr>
              	<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SNNA- Promoción social a familias</td><td>Familias</td><td>354</td><td class="cell-bordered2">354</td><td>89.99</td><td class=" text-center">25.42</td><td>125</td></tr>
              	<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SNNA- Alimentación en centros</td><td>Personas</td><td>532</td><td class="cell-bordered2">532</td><td>662.98</td><td class=" text-center">124.62</td><td>4,952</td></tr>
              	<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SNNA- Apoyo escolar en centros</td><td>Personas</td><td>344</td><td class="cell-bordered2">344</td><td>199</td><td class=" text-center">57.85</td><td>287</td></tr>
              	<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SNNA- Monitoreo a entidades de abrigo</td><td>Entidades</td><td>14</td><td class="cell-bordered2">8</td><td>5</td><td class=" text-center">62.50</td><td>4</td></tr>
              	<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SNNA- Monitoreo a niñez separada de su familia</td><td>Personas</td><td>350.03</td><td class="cell-bordered2">247.99</td><td>103.99</td><td class=" text-center">41.93</td><td>103</td></tr>
              	<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MDI- Cedulación por primera vez</td><td>Personas</td><td>48,653</td><td class="cell-bordered2">31,309</td><td>31,309</td><td class=" text-center">100.00</td><td>4,219</td></tr><tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#myModal" class="registro" codigoregistro="1231-47882-155-19-0"> SENADIS- Acciones de promoción de derechos de las Personas con Discapacidad</a></td><td>Beneficiarios</td><td>1,000</td><td class="cell-bordered2">61</td><td>1,057</td><td class=" text-center">1732.79</td><td>21</td></tr>
              	<tr class="none"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SENADIS- Asistencia a personas con discapacidad</td><td>Servicios ofrecidos</td><td>10,773.99</td><td class="cell-bordered2">10,773.99</td><td>10,774</td><td class=" text-center">100.00</td><td>1,346</td></tr>

              
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
				est<p>Favor Iniciar Sesion</p>
			<%  } %>

<!-- Piwik -->
<script type="text/javascript">

$('#example1').dataTable({
    "bPaginate": false,
    "bLengthChange": false,
    "bFilter": true,
    "bSort": true,
    "bInfo": true,
    "bAutoWidth": false
  });

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

<script type="text/javascript" src="bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap-slider.js"></script>

    
    
  </body>
</html>
