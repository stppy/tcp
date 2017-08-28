<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>spr | STP</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.2 -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Morris chart -->
    <link href="plugins/morris/morris.css" rel="stylesheet" type="text/css" />
    <!-- jvectormap -->
    <link href="plugins/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
    <!-- Daterange picker -->
    <link href="plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link href="dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  </head>
  <body class="skin-blue sidebar-mini">
  <!-- piwik -->
  <script type="text/javascript">
  var _paq = _paq || [];
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
</script>
<noscript><p><img src="//infra.stp.gov.py/monitoreoweb/piwik.php?idsite=4" style="border:0;" alt="" /></p></noscript>
<!-- /piwik -->
  
  <style>
  #overlay {
opacity: 0;
background-color: #fff;
position: absolute;
top: 0px;
left: 0px;
z-index: 50;
width: 100%;
height: 100%;
display:none;
}
 
#info {
margin:auto;
padding:20px;
width:600px;
background:#fff;
box-shadow: 0 4px 16px #999;
z-index: 51;
border:1px solid #acacac;
position:absolute;
display:none;
}
  
  .subprograma{
  	margin-left:30px;
  }
  </style>
  <script>
  $("body").on("click", "#listarEntidades",function(event){
	  $("#programacion").html("");
	  var idEntidad = $(this).attr("id");
	  var datos;
		  $("#programacion").append("");
		  $("#programacion").append("<form role=\"form\">");
		  $("#programacion").append("<div class=\"form-group\">");
		  $("#programacion").append("<label for=\"ejemplo_email_1\">Mision</label>");
		  $("#programacion").append("<textarea class=\"form-control\" rows=\"3\" style=\"margin: 0px -18px 0px 0px; height: 74px; width: 100%;\" id=\"ejemplo_email_1\" placeholder=\"Introduce tu mision\"></textarea>");
		  $("#programacion").append("</div>");
		  $("#programacion").append("<div class=\"form-group\">");
		  $("#programacion").append("<label for=\"ejemplo_password_1\">Visión</label>");
		  $("#programacion").append("<textarea class=\"form-control\" rows=\"3\" style=\"margin: 0px -18px 0px 0px; height: 74px; width: 100%;\" id=\"ejemplo_password_1\" placeholder=\"Introduce tu visión\"></textarea>");
		  $("#programacion").append("</div>");
		  $("#programacion").append("<div class=\"form-group\">");
		  $("#programacion").append("<label for=\"ejemplo_archivo_1\">Adjuntar un archivo</label>");
		  $("#programacion").append("<input type=\"file\" id=\"ejemplo_archivo_1\">");
		  $("#programacion").append("<p class=\"help-block\">Ejemplo de texto de ayuda.</p>");
		  $("#programacion").append("</div>");
		  $("#programacion").append("<div class=\"checkbox\">");
		  $("#programacion").append("				  </div>");
		  $("#programacion").append("<button type=\"submit\" class=\"btn btn-info\">Enviar</button>");
		  $("#programacion").append("</form>");
		  /*
		  
		  <div class=\"row\"  id=\"row-programacionfisica\">
        	<div class=\"col-md-10\">
        		<div class=\"box" height=\"1000px\">
        			<div class=\"box-header with-border\" height=\"1000px\">
        				<h3 class=\"box-title\" id="tituloTipoPrograma">
        					<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>Programacion Fisica
        				</h3>
        				<div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button></div>
        			</div>
        			<div class="box-body"  >
        				<ul id="row-body-programacionfisica" class="col-md-10">
        				</ul>
        			</div>
        		</div>
        	</div>
       </div>*/
  });
  
  $(document).ready(function(){
	   $('legend').siblings().hide();
	  $( "legend").click(function(event){
			$(this).siblings().toggle();
			event.stopPropagation();
		});
	  
	  
	  $( "#listarPnd" ).on( "click", function(event) {
		  if ($("#listaPnd").children().length <= 0 && $(this).attr("class")!="entidad"){
		  var datos = $.ajax({
	    		url:'/ajaxHelper?accion=getEntidades&nivel=12',
	    		type:'get',
	    		dataType:'json',
	    		async:false    		
	    	}).responseText;
	      datos = JSON.parse(datos); 
	      var i=0;
	      for (i=0;i<datos.entidades.length;i++){
	    	  //$("#listaProgramacion").append("<li class=\"entidad\" id=\""+datos.entidades[i].entidad+"\"><a href=\"#\"><i class=\"fa fa-circle-o\"></i>"+datos.entidades[i].nombreEntidad+"</a></li>");
	    	  $("#row-body-programacionfisica").append("<li class=\"entidad\" id=\""+datos.entidades[i].entidad+"\"><a href=\"#\"><i class=\"fa fa-circle-o\"></i>"+datos.entidades[i].nombreEntidad+"<i class=\"fa fa-angle-left pull-right\"></i></a><ul id=\"lista-tipoprograma-pf\"  ></ul></li>");
	      }
		  }else{
			  ;
		  }
		  
		});
	  
	  $("body").on("click", "#programacionfisica",function(event){
		 
		});
		  $("body").on("click", "#vinculopnd",function(event){
		  var titulo = $(this).prev().val();
			
			$('#overlay, #info, #result, h3').val(titulo);
			$('#overlay, #info').animate({'opacity':'0.7'}, 300, 'linear');
	     	$('#info').animate({'opacity':'1.00'},300,'linear');
	     	$('#overlay, #info').css('display','block');
	     	$('#info').css({'left':(($(document).width()/2)-($('#info').width()/2))});
	     	$('#info').css({'top':(($(document).height()/2)-($('#info').height()/2)-50)});
			event.stopPropagation();
		});
	  //muestra tipo de presupuesto por anho y entidad
	  $("body").on("click", ".entidad",function(event){
		  var idEntidad = $(this).attr("id");
		  var datos;
		  $("#lista-tipoprograma-pf").html(" ");
		  var tiposPrograma = $.ajax({
	    		url:'/ajaxSelects?accion=getTiposPrograma',
	    		type:'get',
	    		dataType:'json',
	    		async:false    		
	    	}).responseText;
		  tiposPrograma = JSON.parse(tiposPrograma); 
		  var i = 0;
		  for (i=0;i<tiposPrograma.tiposPrograma.length;i++){
			  $("#lista-tipoprograma-pf").append("<li class=\"tipoPrograma\" id=\""+tiposPrograma.tiposPrograma[i].codTipoPrograma+"\" dato=\"tipoPrograma\" entidad=\""+idEntidad+"\"><a href=\"#\"><i class=\"fa fa-circle-o\"></i>"+tiposPrograma.tiposPrograma[i].codTipoPrograma+" ) "+tiposPrograma.tiposPrograma[i].nombreTipoPrograma+"<i class=\"fa fa-angle-left pull-right\"></i></a><ul id=\"lista-programa-pf\"  ></ul></li>");
		  }
		  event.stoppropagation();
	  });
  		//muestra programa por tipo de presupueso entidad y anho
	  $("body").on("click", ".tipoPrograma",function(event){
		  var idEntidad = $(this).attr("entidad");
		  var idTipoPrograma = $(this).attr("id");
		  var datos;
		  var programas = $.ajax({
	    		url:'/ajaxSelects?accion=getProgramas&nivel=12&entidad='+idEntidad+'&tipoPresupuesto='+idTipoPrograma,
	    		type:'get',
	    		dataType:'json',
	    		async:false    		
	    	}).responseText;
		  programas = JSON.parse(programas); 
		  var i = 0;
		  $("#lista-programa-pf").html(" ");
		  for (i=0;i<programas.programas.length;i++){
			  $("#lista-programa-pf").append("<li class=\"programa\" id=\""+programas.programas[i].codigoPrograma+"\" dato=\"programa\" tipoPrograma=\""+idTipoPrograma+"\" entidad=\""+idEntidad+"\"><a href=\"#\"><i class=\"fa fa-circle-o\"></i>"+programas.programas[i].codigoPrograma+" ) "+programas.programas[i].nombrePrograma+"<i id=\"vinculopnd\" class=\"fa fa-wrench pull-right\"></i></a><ul id=\"lista-subprograma-pf\"  ></ul></li>");
		  }
		  event.stoppropagation();
	  });
	  
	  $("body").on("click", "#tituloPrograma",function(event){
		  var idEntidad = $(this).parent().parent().parent().parent().attr("entidad");
		  var idPrograma = $(this).parent().parent().parent().parent().attr("id");
		  var idTipoPrograma = $(this).parent().parent().parent().parent().attr("tipoprograma");
		  var datos;
		  var subprogramas = $.ajax({
	    		url:'/ajaxHelper?accion=getSubprogramas&nivel=12&entidad='+idEntidad+'&tipoPresupuesto='+idTipoPrograma+'&programa='+idPrograma,
	    		type:'get',
	    		dataType:'json',
	    		async:false    		
	    	}).responseText;
		  subprogramas = JSON.parse(subprogramas); 
		  var i = 0;
		  $(this).parent().parent().children().next().html(" ");
		  for (i=0;i<subprogramas.subprogramas.length;i++){
			 
			  $(this).parent().parent().children().next().append("<div class=\"row\" id=\""+subprogramas.subprogramas[i].codigoSubprograma+"\" dato=\"subprograma\" tipoPrograma=\""+idTipoPrograma+"\" entidad=\""+idEntidad+"\" programa=\""+idPrograma+"\"><div class=\"col-md-10\"><div class=\"box box-danger\" height=\"1000px\"><div class=\"box-header with-border\" height=\"1000px\"><h3 class=\"box-title\" id=\"tituloSubprograma\">"+subprogramas.subprogramas[i].codigoSubprograma+" ) "+subprogramas.subprogramas[i].nombreSubprograma+"</h3><div class=\"box-tools pull-right\" height=\"1000px\"><button class=\"btn btn-box-tool\" data-widget=\"collapse\"><i id=\"vinculopnd\"class=\"fa fa-wrench\"></i></button>			                   </div></div><div class=\"box-body\" style=\"display:none\"> <i class=\"fa fa-plus\"></i>Agregar SubPrograma</div></div></div></div>");
		  }
	  });
	  $("body").on("click", "#tituloSubprograma",function(event){
		  var idEntidad = $(this).parent().parent().parent().parent().attr("entidad");
		  var idPrograma = $(this).parent().parent().parent().parent().attr("programa");
		  var idSubprograma = $(this).parent().parent().parent().parent().attr("id");
		  var idTipoPrograma = $(this).parent().parent().parent().parent().attr("tipoprograma");
		  var datos;
		  var proyectos = $.ajax({
	    		url:'/ajaxHelper?accion=getProyectos&nivel=12&entidad='+idEntidad+'&tipoPresupuesto='+idTipoPrograma+'&programa='+idPrograma+'&subprograma='+idSubprograma,
	    		type:'get',
	    		dataType:'json',
	    		async:false    		
	    	}).responseText;
		  proyectos = JSON.parse(proyectos); 
		  var i = 0;
		  $(this).parent().parent().children().next().html(" ");
		  for (i=0;i<proyectos.proyectos.length;i++){
			 
			  $(this).parent().parent().children().next().append("<div class=\"row\" id=\""+proyectos.proyectos[i].codigoProyecto+"\" dato=\"proyecto\" tipoPrograma=\""+idTipoPrograma+"\" entidad=\""+idEntidad+"\" programa=\""+idPrograma+"\" subprograma=\""+idSubprograma+"\"><div class=\"col-md-10\"><div class=\"box box-success\" height=\"1000px\"><div class=\"box-header with-border\" height=\"1000px\"><h3 class=\"box-title\" id=\"tituloProyecto\">"+proyectos.proyectos[i].codigoProyecto+" ) "+proyectos.proyectos[i].nombreProyecto+"</h3><div class=\"box-tools pull-right\" height=\"1000px\"><button class=\"btn btn-box-tool\" data-widget=\"collapse\"><i class=\"fa fa-plus\"></i></button>			                   </div></div><div class=\"box-body\" style=\"display:none\"></div></div></div></div>");
		  }
	  });
	  
	  $("body").on("click", ".fa-minus",function(event){
		  $(this).parent().parent().parent().next().toggle();
		  $(this).attr("class", "fa fa-plus");
	  });
	  $("body").on("click", ".fa-plus",function(event){
		  $(this).parent().parent().parent().children().click();
		  $(this).parent().parent().parent().next().toggle();
		  $(this).attr("class", "fa fa-minus");
	  });
	  $("body").on("click", "#close",function(event){
		     $('#overlay, #info').animate({'opacity':'0'},300,'linear', function(){
		     $('#overlay, #info').css('display','none');
		     event.stopPropagation();
		   });
	  });

	    //  event.stoppropagation();
	  
	      $("body").on("click", ".programa",function(event){
			  var idPrograma = $(this).attr("id");
			  var idEntidad =$(this).attr("entidad");
			  var idTipoPrograma=$(this).attr("tipo");
			  if( $(this).attr("active")=="true") {$(this).child("1").siblings().toggle();$(this).attr("active","false");}
			 // var idEntidad= $("#programacion .box-body").attr("id");
			  var datos;
			  $(this).children().children().html(" ");
			  if ($(this).children().length <= 1 ){
				  var subprogramas = $.ajax({
			    		url:'/ajaxHelper?accion=getSubprogramas&nivel=12&entidad='+idEntidad+'&tipoPresupuesto='+idTipoPrograma+'&programa='+idPrograma,
			    		type:'get',
			    		dataType:'json',
			    		async:false    		
			    	}).responseText;
			      datos = JSON.parse(subprogramas); 
			      i=0;
			      for (i=0;i<datos.subprogramas.length;i++){
			    	  $(".programa[id="+idPrograma+"][entidad="+idEntidad+"][tipo="+idTipoPrograma+"]").append("<span class=\"subprograma\" id=\""+datos.subprogramas[i].subprograma+"\">"+datos.subprogramas[i].nombreSubprograma+"</span><br>");
			      }
			      $(".programa[id="+idPrograma+"][entidad="+idEntidad+"][tipo="+idTipoPrograma+"]").focus();
			      $(".programa[id="+idPrograma+"][entidad="+idEntidad+"][tipo="+idTipoPrograma+"]").attr("active","true");
			   }else{
					  ;
			   }
			  
			//  event.stoppropagation();
	      });

  });
  </script>
    <div class="wrapper">

      <header class="main-header">

        <!-- Logo -->
        <a href="index2.jsp" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><b>s</b>pr</span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><b>spr</b>STP</span>
        </a>

        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a>
          <!-- Navbar Right Menu -->
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">

              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image"/>
                  <span class="hidden-xs">Rafael Palau</span>
                </a>
                <ul class="dropdown-menu">
                  <!-- User image -->
                  <li class="user-header">
                    <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image" />
                    <p>
                      Rafael Palau - DGTIC
                      <small>SecretarÃ­a TÃ©cnica de PlanificaciÃ³n para el Desarrollo EconÃ³mico y Social</small>
                    </p>
                  </li>
                  <!-- Menu Body 
                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <div class="pull-left">
                      <a href="#" class="btn btn-default btn-flat">Perfil</a>
                    </div>
                    <div class="pull-right">
                      <a href="#" class="btn btn-default btn-flat">Salir</a>
                    </div>
                  </li>
                </ul>
              </li>
              <!-- Control Sidebar Toggle Button -->
              <li>
                <a href="#" data-toggle="control-sidebar"><i class="fa fa-outdent"></i></a>
              </li>
            </ul>
          </div>

        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image">
              <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image" />
            </div>
            <div class="pull-left info">
              <p>Rafael Palau</p>

              <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
          </div>
          <!-- search form -->
          <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
              <input type="text" name="q" class="form-control" placeholder="Buscar..."/>
              <span class="input-group-btn">
                <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
            </div>
          </form>
          <!-- /.search form -->
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header">Programacion</li>
            <li class="treeview">
              <a href="#" id="listarEntidades">
                <i class="fa fa-dashboard"></i> <span>Entidad</span> <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu" id="listaEntidades" atyle="display: none;">
              </ul>
            </li>
            <li class="treeview">
              <a id="listarProgramacion" href="#">
                <i class="fa fa-files-o"></i>
                <span>Estructura Programatica</span>
                <span class="label label-primary pull-right">4</span>
              </a>
              <ul class="treeview-menu" id="listaProgramacion">
                
              </ul>
            </li>
            
            <li class="treeview">
              <a id="listarPnd" href="#">
                <i class="fa fa-folder"></i> <span>Vinculación PND</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="pages/examples/invoice.html"><i class="fa fa-circle-o"></i> Programas</a></li>
                <li><a href="pages/examples/login.html"><i class="fa fa-circle-o"></i> Subprogramas </a></li>
                <li><a href="pages/examples/register.html"><i class="fa fa-circle-o"></i> Proyectos</a></li>
               
              </ul>
            </li>
            
            <li class="treeview">
              <a href="#" id="programacionfisica">
                <i class="fa fa-edit"></i> <span>Programacion Fisica</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
             
            </li>
           
            <li><a href="documentation/index.html"><i class="fa fa-book"></i> <span>Documentacion</span></a></li>
            <li class="header">LABELS</li>
            <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Guia de Carga</span></a></li>
            <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Diccionario de Datos</span></a></li>
            <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Presuntas Frecuentes</span></a></li>
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Dashboard
            <small>Version 2.0</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Dashboard</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content" id="programacion">
        <div id="overlay" style="opacity: 0; display: none;"></div>
				<div id="info" style="opacity: 0; display: none; left: 600px; top: 356.5px;">
				  <div id="results">
				  	<p style="float:right;"><a href="#" id="close"><i class="fa fa-times"></i></a></p>
				    <h2>Vinculacion con Objetivos estrategicos del PND</h2>
						<fieldset><legend><strong>1.1 Desarrollo social equitativo</strong></legend>
							<p>
							<input type="checkbox" name="obej1" value="1"> Universalizar el acceso a la identidad de las personas en el país.
							<br><input type="checkbox" name="obej2" value="2"> Erradicar la pobreza extrema de hombres y mujeres.
							<br><input type="checkbox" name="obej3" value="3"> Reducir en 90% la desnutrición crónica infantil, con énfasis en grupos vulnerables.
							<br><input type="checkbox" name="obej4" value="4"> Reducir en 75% la mortalidad materna.
							<br><input type="checkbox" name="obej5" value="5"> Reducir en 70% la mortalidad infantil.
							<br><input type="checkbox" name="obej6" value="6"> Aumentar a 70% la cobertura de educación inicial.
							<br><input type="checkbox" name="obej7" value="7"> Universalizar la educación preescolar.
							<br><input type="checkbox" name="obej8" value="8"> Aumentar 5 veces la escolaridad promedio de la población indígena.
							<br><input type="checkbox" name="obej9" value="9"> Universalizar el alfabetismo en la población indígena.
							<br><input type="checkbox" name="obej10" value="10"> Universalizar la cobertura de la educación escolar básica.
							<br><input type="checkbox" name="obej11" value="11"> Aumentar la cobertura de educación media al 92% (tasa bruta de matriculación en educación media), con énfasis en poblaciones vulnerables.
							<br><input type="checkbox" name="obej12" value="12"> Universalizar la alfabetización en adolescentes y adultos.
							<br><input type="checkbox" name="obej13" value="13"> Aumentar al 75% la participación de las mujeres en el mundo laboral formal en igualdad de condiciones.
							</p>
						</fieldset>
						<fieldset><legend><strong>1.2 Servicios sociales de calidad</strong></legend>
							<p>
						<input type="checkbox" name="obej14" value="14"> Alcanzar los estándares internacionales de calidad educativa (universalización del nivel 2 en prueba PISA y promedio en nivel 3 o más).
						<br><input type="checkbox" name="obej15" value="15"> Aumentar la esperanza de vida al nacer a 79 años.
						<br><input type="checkbox" name="obej16" value="16"> Disminuir en 50% las muertes por enfermedades no contagiosas.
						<br><input type="checkbox" name="obej17" value="17"> Disminuir en 50% la tasa de obesidad de la población.
						<br><input type="checkbox" name="obej18" value="18"> Reducir en 75% la tasa de homicidios dolosos.
						<br><input type="checkbox" name="obej19" value="19"> Reducir en 50% la tasa de muertes por accidentes de tránsito.
						<br><input type="checkbox" name="obej20" value="20"> Disminuir en 50% la tasa de suicidios.
						<br><input type="checkbox" name="obej21" value="21"> Aumentar la proporción de funcionarios públicos incorporados o promocionados con criterio de méritos y aptitudes.
						<br><input type="checkbox" name="obej22" value="22"> Aumentar el acceso a información pública y trámites por medio de redes electrónicas.
						<br><input type="checkbox" name="obej23" value="23"> Mejora del sistema estadístico nacional por encima de 85 puntos en el índice internacional de capacidad estadística.
						</p>
						</fieldset>
						<fieldset><legend><strong>1.3 Desarrollo local participativo</strong></legend>
							<p>
						<input type="checkbox" name="obej24" value="24"> Mejorar condiciones de los asentamientos precarios a través de un proceso de ordenamiento y mejora urbanística adecuada.
						<br><input type="checkbox" name="obej25" value="25"> Descentralización de la gestión de las políticas públicas.
						<br><input type="checkbox" name="obej26" value="26"> Ordenamiento territorial a nivel municipal que determine el uso del suelo rural y urbano considerando los efectos económicos, sociales, culturales y ambientales, de forma a contar con una densidad poblacional adecuada que facilite la provisión de servicios públicos con eficiencia.
						<br><input type="checkbox" name="obej27" value="27"> Rendición de cuentas periódicas de todos los niveles de gobierno.
						</p>
						</fieldset>
						<fieldset><legend><strong>1.4 Hábitat adecuado y sostenible</strong></legend>
							<p>
						<input type="checkbox" name="obej28" value="28"> Reducir en 70% el déficit habitacional.
						<br><input type="checkbox" name="obej29" value="29"> Universalizar el acceso a agua potable (agua corriente segura domiciliaria).
						<br><input type="checkbox" name="obej30" value="30"> Universalizar el acceso a saneamiento mejorado.
						<br><input type="checkbox" name="obej31" value="31"> Universalizar el acceso a energía eléctrica de calidad.
						<br><input type="checkbox" name="obej32" value="32"> Reducir en 95% las muertes atribuibles a la contaminación del aire.
						<br><input type="checkbox" name="obej33" value="33"> Universalizar la disposición y manejo de residuos urbanos e industriales.
						</p>
						</fieldset>
						<fieldset><legend><strong>2.1 Empleo y seguridad social</strong></legend>
							<p>
						<br><input type="checkbox" name="obej34" value="34"> Mantener la tasa de crecimiento del ingreso del 40% de la población de menores ingresos por encima de la tasa promedio de crecimiento de la economía.
						<br><input type="checkbox" name="obej35" value="35"> Aumentar en 7 veces el promedio nacional de población con estudios terciarios, con énfasis en poblaciones vulnerables.
						<br><input type="checkbox" name="obej36" value="36"> Universalizar la cobertura de la seguridad social.
						<br><input type="checkbox" name="obej37" value="37"> Alcanzar la inclusión financiera del 100% de los hogares.
						<br><input type="checkbox" name="obej38" value="38"> 85% de jóvenes de 20-32 años de los quintiles más pobres incluidos en programas de capacitación laboral.
						<br><input type="checkbox" name="obej39" value="39"> Tasa de crecimiento promedio del PIB de 6,8%.
						</p>
						</fieldset>
						<fieldset><legend><strong>2.2 Competitividad e innovación</strong></legend>
							<p>
						<input type="checkbox" name="obej40" value="40"> Consolidar una red de transporte multimodal eficiente (fluvial, aéreo, terrestre, ferroviario) que disminuya los costos logísticos promedios a niveles competitivos internacionalmente.
						<br><input type="checkbox" name="obej41" value="41"> Mantener bajas tasas de inflación (de acuerdo al objetivo definido) y con reducida volatilidad.
						<br><input type="checkbox" name="obej42" value="42"> Alcanzar el 90% de formalización de la actividad económica en los principales sectores, logrando asimismo un incremento en recaudaciones fiscales que permita una presión tributaria de aproximadamente el 18% del PIB.
						<br><input type="checkbox" name="obej43" value="43"> Contar con al menos 1 universidad paraguaya ubicada entre las primeras 400 a nivel mundial (en cualquiera de los 3 rankings más utilizados).
						<br><input type="checkbox" name="obej44" value="44"> Aumentar al 80% el uso de internet de banda ancha –o tecnología equivalente-.
						<br><input type="checkbox" name="obej45" value="45"> Regularizar la tenencia de la tierra por medio de un catastro fiable que incluya también a todos los beneficiarios de la reforma agraria en las últimas décadas, ceñido a un estricto cumplimiento de la Ley.
						<br><input type="checkbox" name="obej46" value="46"> Quintuplicar el número de patentes de invenciones nacionales.
						<br><input type="checkbox" name="obej47" value="47"> Asegurar la transparencia del gasto público en los tres niveles de gobierno y en los tres Poderes del Estado.
						</p>
						</fieldset>
						<fieldset><legend><strong>2.3 Regionalización y diversificación productiva</strong></legend>
							<p>
						<input type="checkbox" name="obej48" value="48"> Reducir a menos de 3% el rezago potencial de la productividad por hectárea de la agricultura familiar con respecto a la agricultura empresarial
						<br><input type="checkbox" name="obej49" value="49"> Reducir a menos de 7% el rezago potencial de los ingresos laborales promedios en la región centro-norte del país (San Pedro, Concepción, Canindeyú, Caazapá y Caaguazú) con respecto al resto de la región oriental.
						<br><input type="checkbox" name="obej50" value="50"> Incrementar el consumo de electricidad para uso industrial.
						<br><input type="checkbox" name="obej51" value="51"> Fomentar la creación de MiPyMEs en industrias de servicios y tecnologías.
						</p>
						</fieldset>
						<fieldset><legend><strong>3.4 Valoración del capital ambiental</strong></legend>
							<p>
						<input type="checkbox" name="obej52" value="52"> Aumentar en 60% el consumo de energías renovables.
						<br><input type="checkbox" name="obej53" value="53"> Reducir en 20% el consumo de combustible fósil.
						</p>
						</fieldset>
						<fieldset><legend><strong>3.1 Igualdad de oportunidades en un mundo globalizado</strong></legend>
							<p>
						<input type="checkbox" name="obej54" value="54"> Asegurar servicios consulares útiles, eficientes a paraguayos migrantes y propiciar los vínculos culturales paraguayos con sus familiares.
						<br><input type="checkbox" name="obej55" value="55"> Ampliar la cobertura territorial y la presencia del país en el mundo, en particular en los países donde existen comunidades crecientes de paraguayos y donde deben promocionarse los productos nacionales y el turismo.
						<br><input type="checkbox" name="obej56" value="56"> Gestión efectiva de la diáspora paraguaya en el exterior.
						<br><input type="checkbox" name="obej57" value="57"> Propiciar la re-incorporación de paraguayos destacados en el exterior, al servicio público, al sector empresarial o científico.
						<br><input type="checkbox" name="obej58" value="58"> Potenciar la contribución al desarrollo paraguayo de la comunidad de inmigrantes en Paraguay en forma armónica e integrada.
						</p>
						</fieldset>
						<fieldset><legend><strong>3.2 Atracción de inversiones, comercio exterior e imagen país</strong></legend>
							<p>
						<input type="checkbox" name="obej59" value="59"> Ubicar a Paraguay entre los primeros exportadores mundiales de alimentos, en rubros tales como sésamo, almidón de mandioca, stevia, frutas y hortalizas, soja, carne, etc.
						<br><input type="checkbox" name="obej60" value="60"> Aumentar la exportación de productos y servicios culturales y tecnológicos.
						<br><input type="checkbox" name="obej61" value="61"> Incrementar a al menos 2 millones el número de turistas por año.
						<br><input type="checkbox" name="obej62" value="62"> Disminuir sustancialmente las vulnerabilidades y amenazas de lavado de activos, financiamiento del terrorismo y proliferación de armas de destrucción masiva.
						<br><input type="checkbox" name="obej63" value="63"> Aumentar los ingresos por venta de energía eléctrica.
						</p>
						</fieldset>
						<fieldset><legend><strong>3.3 Integración económica regional</strong></legend>
							<p>
						<input type="checkbox" name="obej64" value="64"> Hacer del Paraguay el eje de una integración energética regional, aprovechando las potenciales complementariedades energéticas en la región, garantizando así el uso sostenible y eficiente de los recursos energéticos de cada país.
						<br><input type="checkbox" name="obej65" value="65"> Aumentar la capacidad de movimiento portuario.
						<br><input type="checkbox" name="obej66" value="66"> Incrementar el tiempo disponible de uso de las hidrovías a 365 días al año.
						<br><input type="checkbox" name="obej67" value="67"> Aumentar la transitabilidad de transporte de cargas a todas las cabeceras distritales.
						<br><input type="checkbox" name="obej68" value="68"> Restaurar al menos el 20% de los ecosistemas degradados.
						<br><input type="checkbox" name="obej69" value="69"> Aumentar los ingresos nacionales por la venta de servicios ambientales.
						</p>
						</fieldset>
						<fieldset><legend><strong>3.4 Sostenibilidad del hábitat global</strong></legend>
							<p>
						<input type="checkbox" name="obej70" value="70"> Reducir los costos de recuperación ante eventos de desastres causados por efectos climáticos.
						<br><input type="checkbox" name="obej71" value="71"> Explotar los acuíferos en base a planes ambientales debidamente monitoreados.
						<br><input type="checkbox" name="obej72" value="72"> Aumentar la cobertura de áreas forestales y biomasa protegida.
						</p>
				 
				    
				  </div>
				</div>
        
          <!-- Info boxes -->
          <div class="row">
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-aqua"><i class="ion ion-ios-gear-outline"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">Programas</span>
                  <span class="info-box-number">12<small></small></span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-red"><i class="ion ion-ios-gear-outline"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">Subprogramas</span>
                  <span class="info-box-number">41</span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->

            <!-- fix for small devices only -->
            <div class="clearfix visible-sm-block"></div>

            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-green"><i class="ion ion-ios-gear-outline"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">Proyectos</span>
                  <span class="info-box-number">160</span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-yellow"><i class="ion ion-ios-gear-outline"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">Productos</span>
                  <span class="info-box-number">460</span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->
          </div><!-- /.row -->

          
          <div class="row"  id="row-programacionfisica">
          	<div class="col-md-10">
          		<div class="box" height="1000px">
          			<div class="box-header with-border" height="1000px">
          				<h3 class="box-title" id="tituloTipoPrograma">
          					<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>Programacion Fisica
          				</h3>
          				<div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button></div>
          			</div>
          			<div class="box-body"  >
          				<ul id="row-body-programacionfisica" class="col-md-10">
          				</ul>
          			</div>
          		</div>
          	</div>
         </div>
          
          
        
          
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
        <!-- Create the tabs -->
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
          <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
          <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
          <!-- Home tab content -->
          <div class="tab-pane active" id="control-sidebar-home-tab">
            <h3 class="control-sidebar-heading">Recent Activity</h3>
            <ul class='control-sidebar-menu'>
              <li>
                <a href='javascript::;'>
                  <i class="menu-icon fa fa-birthday-cake bg-red"></i>
                  <div class="menu-info">
                    <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>
                    <p>Will be 23 on April 24th</p>
                  </div>
                </a>
              </li>
              <li>
                <a href='javascript::;'>
                  <i class="menu-icon fa fa-user bg-yellow"></i>
                  <div class="menu-info">
                    <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>
                    <p>New phone +1(800)555-1234</p>
                  </div>
                </a>
              </li>
              <li>
                <a href='javascript::;'>
                  <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>
                  <div class="menu-info">
                    <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>
                    <p>nora@example.com</p>
                  </div>
                </a>
              </li>
              <li>
                <a href='javascript::;'>
                  <i class="menu-icon fa fa-file-code-o bg-green"></i>
                  <div class="menu-info">
                    <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>
                    <p>Execution time 5 seconds</p>
                  </div>
                </a>
              </li>
            </ul><!-- /.control-sidebar-menu -->

            <h3 class="control-sidebar-heading">Tasks Progress</h3>
            <ul class='control-sidebar-menu'>
              <li>
                <a href='javascript::;'>
                  <h4 class="control-sidebar-subheading">
                    Custom Template Design
                    <span class="label label-danger pull-right">70%</span>
                  </h4>
                  <div class="progress progress-xxs">
                    <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                  </div>
                </a>
              </li>
              <li>
                <a href='javascript::;'>
                  <h4 class="control-sidebar-subheading">
                    Update Resume
                    <span class="label label-success pull-right">95%</span>
                  </h4>
                  <div class="progress progress-xxs">
                    <div class="progress-bar progress-bar-success" style="width: 95%"></div>
                  </div>
                </a>
              </li>
              <li>
                <a href='javascript::;'>
                  <h4 class="control-sidebar-subheading">
                    Laravel Integration
                    <span class="label label-waring pull-right">50%</span>
                  </h4>
                  <div class="progress progress-xxs">
                    <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
                  </div>
                </a>
              </li>
              <li>
                <a href='javascript::;'>
                  <h4 class="control-sidebar-subheading">
                    Back End Framework
                    <span class="label label-primary pull-right">68%</span>
                  </h4>
                  <div class="progress progress-xxs">
                    <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
                  </div>
                </a>
              </li>
            </ul><!-- /.control-sidebar-menu -->

          </div><!-- /.tab-pane -->

          <!-- Settings tab content -->
          <div class="tab-pane" id="control-sidebar-settings-tab">
            <form method="post">
              <h3 class="control-sidebar-heading">General Settings</h3>
              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Report panel usage
                  <input type="checkbox" class="pull-right" checked />
                </label>
                <p>
                  Some information about this general settings option
                </p>
              </div><!-- /.form-group -->

              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Allow mail redirect
                  <input type="checkbox" class="pull-right" checked />
                </label>
                <p>
                  Other sets of options are available
                </p>
              </div><!-- /.form-group -->

              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Expose author name in posts
                  <input type="checkbox" class="pull-right" checked />
                </label>
                <p>
                  Allow the user to show his name in blog posts
                </p>
              </div><!-- /.form-group -->

              <h3 class="control-sidebar-heading">Chat Settings</h3>

              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Show me as online
                  <input type="checkbox" class="pull-right" checked />
                </label>
              </div><!-- /.form-group -->

              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Turn off notifications
                  <input type="checkbox" class="pull-right" />
                </label>
              </div><!-- /.form-group -->

              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Delete chat history
                  <a href="javascript::;" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
                </label>
              </div><!-- /.form-group -->
            </form>
          </div><!-- /.tab-pane -->
        </div>
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

    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="dist/js/pages/dashboard2.js" type="text/javascript"></script>

    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js" type="text/javascript"></script>
  </body>
</html>