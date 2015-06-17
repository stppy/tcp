<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="org.jasig.cas.client.authentication.AttributePrincipalImpl"%>
<%@ page import="org.jasig.cas.client.authentication.AttributePrincipal"%>
<%@ page import="py.gov.stp.mh.test.Client" %>
<%@ page import="py.gov.stp.mh.tools.SqlHelper" %>
<%@ page import="py.gov.stp.mh.clasificadores.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%@page import="py.gov.stp.mh.tools.SqlSelects"%>
<%@page import="py.gov.stp.mh.test.ClientExport"%>
<%@ page import="py.gov.stp.mh.test.Client" %>
<%@ page import="py.gov.stp.mh.clasificadores.*" %>
<%@ page import="py.gov.stp.mh.test.*" %>

<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="es">
  <head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
    <title>spr | STP</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.2 -->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="//spr.stp.gov.py/dist/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="//spr.stp.gov.py/dist/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Morris chart -->
    <link href="../plugins/morris/morris.css" rel="stylesheet" type="text/css" />
    <!-- jvectormap -->
    <link href="../plugins/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
    <!-- Daterange picker -->
    <link href="../plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="../dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link href="../dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
    <script src="../dist/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="//spr.stp.gov.py/dist/js/html5shiv.js"></script>
        <script src="//spr.stp.gov.py/dist/js/respond.min.js"></script>
    <![endif]-->
    <script src="../frames/main.js"></script>
	 <link href="../frames/main.css" rel="stylesheet" type="text/css" />
  <script src="../frames/entidad.js" type="text/javascript"></script>
</head>
<body class="skin-blue sidebar-mini">
<% AttributePrincipal user = (AttributePrincipal) request.getUserPrincipal();%>
<% Map attributes = user.getAttributes(); 
if (user != null) { %>
	<script>
	$(document).ready(function(){
		var entidadCas = "";
		entidadCas = "<%= attributes.get("entidad") %>";
		var usuarios = $.ajax({
			url:'http://spr.stp.gov.py/ajaxSelects?accion=getUsuarios&usuario=<%=user.getName()%>',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		usuarios = JSON.parse(usuarios);
		usuarios = usuarios.usuarios;
		$("#nombreUsuario").append(usuarios[0].correo+" ("+usuarios[0].nivel_id+", "+usuarios[0].entidad_id+")");
		$("#PerfilUsuario").append(usuarios[0].nombre+" ("+usuarios[0].nivel_id+", "+usuarios[0].entidad_id+", "+entidadCas+")");
		/*$("#nombreUsuario").append("entidad: "+usuarios[0].entidad);;
		$("#nombreUsuario").append("entidad_id: "+usuarios[0].entidad_id);
		$("#nombreUsuario").append("nivel_id: "+usuarios[0].nivel_id);*/
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
	        
	   
		

		$("body").on("click", "#listarEntidades",function(event){
			window.location.replace("./entidad.jsp");
		});
		$("body").on("click", "#listarProgramacion",function(event){
			window.location.replace("./programacion.jsp");
		});
		$("body").on("click", "#listarProductos",function(event){
			window.location.replace("./producto.jsp");
		});
		$("body").on("click", "#listarProgramas",function(event){
			window.location.replace("./pnd.jsp");
		});
		
		$("body").on("click", ".btn-danger",function(event){
			var id = $(this).attr("id");
		    var idParsed = id.split("-");
			var accion=idParsed[0];
			var elemento=idParsed[1];
			
			event.preventDefault();
			var condicion = new Object();
			condicion.nivel=usuarios[0].nivel_id;
			condicion.entidad=usuarios[0].entidad_id;
			
			if (accion==="actualizar"){
				if (elemento==="entidad"){
					var dialog=confirm("Esta seguro que desea Actualizar la Entidad en el SIPP?. Este cambio no se puede deshacer");
					 if (  dialog == true ) {
						var entidadesAct=	$.ajax({
					        url: "/ajaxExport?accion=actEntidad",
					        type: 'POST',
					        dataType: 'json',
					        data: JSON.stringify(condicion),
					        contentType: 'application/json',
					        mimeType: 'application/json',
					        success: function (data) {
					        	$("#actualizar-entidad").attr("disabled","");
					        	$("#progreso-act-ent").attr("aria-valuenow", "100");
					        	$("#progreso-act-ent").attr("style", "width: 100%");
					        },
					        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
					        error: function(data,status,er) {
					        	$("#actualizar-entidad").attr("disabled","");
					        	$("#progreso-act-ent").attr("aria-valuenow", "100");
					        	$("#progreso-act-ent").attr("style", "width: 100%");
					        }
					   });
					   entidadesAct = JSON.parse(entidadesAct);
					   entidadesAct = entidadesAct.entidadesAct;
					   
						$(".box-body").append("Entidades actualizadas: "+entidadesAct+"<br>");
					 }else{
						 alert("No se han realizado cambios en SIPP");
					 }
				}
				if (elemento==="programa"){
					var dialog=confirm("Esta seguro que desea Actualizar programas en el SIPP?. Este cambio no se puede deshacer");
					 if (  dialog == true ) {
						var programasAct=	$.ajax({
					        url: "/ajaxExport?accion=actPrograma",
					        type: 'POST',
					        dataType: 'json',
					        data: JSON.stringify(condicion),
					        contentType: 'application/json',
					        mimeType: 'application/json',
					        success: function (data) {
					        	$("#actualizar-programa").attr("disabled","");
					        	$("#progreso-act-prog").attr("aria-valuenow", "100");
					        	$("#progreso-act-prog").attr("style", "width: 100%");
					        },
					        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
					        error: function(data,status,er) {
					        	$("#actualizar-programa").attr("disabled","");
					        	$("#progreso-act-prog").attr("aria-valuenow", "100");
					        	$("#progreso-act-prog").attr("style", "width: 100%");
					        }
					   });
						programasAct = JSON.parse(programasAct);
						programasAct = programasAct.programasAct;
					   
						$(".box-body").append("Programas actualizados: "+programasAct+"<br>");
					 }else{
						 alert("No se han realizado cambios en SIPP");
					 }
				}
				if (elemento==="subprograma"){
					var dialog=confirm("Esta seguro que desea Actualizar subprogramas en el SIPP?. Este cambio no se puede deshacer");
					 if (  dialog == true ) {
						var subprogramasAct=	$.ajax({
					        url: "/ajaxExport?accion=actSubrograma",
					        type: 'POST',
					        dataType: 'json',
					        data: JSON.stringify(condicion),
					        contentType: 'application/json',
					        mimeType: 'application/json',
					        success: function (data) {
					        	$("#actualizar-subprograma").attr("disabled","");
					        	$("#progreso-act-subp").attr("aria-valuenow", "100");
					        	$("#progreso-act-subp").attr("style", "width: 100%");
					        },
					        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
					        error: function(data,status,er) {
					        	$("#actualizar-subprograma").attr("disabled","");
					        	$("#progreso-act-subp").attr("aria-valuenow", "100");
					        	$("#progreso-act-subp").attr("style", "width: 100%");
					        }
					   });
						subprogramasAct = JSON.parse(subprogramasAct);
						subprogramasAct = subprogramasAct.subprogramasAct;
					   
						$(".box-body").append("Subrogramas actualizados: "+subprogramasAct+"<br>");
					 }else{
						 alert("No se han realizado cambios en SIPP");
					 }
				}
				if (elemento==="proyecto"){
					var dialog=confirm("Esta seguro que desea Actualizar proyectos en el SIPP?. Este cambio no se puede deshacer");
					 if (  dialog == true ) {
						var proyectosAct=	$.ajax({
					        url: "/ajaxExport?accion=actProyecto",
					        type: 'POST',
					        dataType: 'json',
					        data: JSON.stringify(condicion),
					        contentType: 'application/json',
					        mimeType: 'application/json',
					        success: function (data) {
					        	$("#actualizar-proyecto").attr("disabled","");
					        	$("#progreso-act-proy").attr("aria-valuenow", "100");
					        	$("#progreso-act-proy").attr("style", "width: 100%");
					        },
					        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
					        error: function(data,status,er) {
					        	$("#actualizar-proyecto").attr("disabled","");
					        	$("#progreso-act-proy").attr("aria-valuenow", "100");
					        	$("#progreso-act-proy").attr("style", "width: 100%");
					        }
					   });
						proyectosAct = JSON.parse(proyectosAct);
						proyectosAct = proyectosAct.proyectosAct;
					   
						$(".box-body").append("Proyectos actualizados: "+proyectosAct+"<br>");
					 }else{
						 alert("No se han realizado cambios en SIPP");
					 }
				}
			}
			
			
			if (accion==="insertar"){
				if (elemento==="programa"){
					var dialog=confirm("Esta seguro que desea Insertar programas en el SIPP?. Este cambio no se puede deshacer");
					 if (  dialog == true ) {
						var programasIns=	$.ajax({
					        url: "/ajaxExport?accion=insPrograma",
					        type: 'POST',
					        dataType: 'json',
					        data: JSON.stringify(condicion),
					        contentType: 'application/json',
					        mimeType: 'application/json',
					        success: function (data) {
					        	$("#insertar-programa").attr("disabled","");
					        	$("#progreso-ins-prog").attr("aria-valuenow", "100");
					        	$("#progreso-ins-prog").attr("style", "width: 100%");
					        },
					        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
					        error: function(data,status,er) {
					        	$("#insertar-programa").attr("disabled","");
					        	$("#progreso-ins-prog").attr("aria-valuenow", "100");
					        	$("#progreso-ins-prog").attr("style", "width: 100%");
					        }
					   });
						programasIns = JSON.parse(programasIns);
						programasIns = programasIns.programasIns;
					   
						$(".box-body").append("Programas insertados: "+programasIns+"<br>");
					 }else{
						 alert("No se han realizado cambios en SIPP");
					 }
				}
				if (elemento==="subprograma"){
					var dialog=confirm("Esta seguro que desea Insertar subprogramas en el SIPP?. Este cambio no se puede deshacer");
					 if (  dialog == true ) {
						var subprogramasIns=	$.ajax({
					        url: "/ajaxExport?accion=insSubrograma",
					        type: 'POST',
					        dataType: 'json',
					        data: JSON.stringify(condicion),
					        contentType: 'application/json',
					        mimeType: 'application/json',
					        success: function (data) {
					        	$("#insertar-subprograma").attr("disabled","");
					        	$("#progreso-ins-subp").attr("aria-valuenow", "100");
					        	$("#progreso-ins-subp").attr("style", "width: 100%");
					        },
					        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
					        error: function(data,status,er) {
					        	$("#insertar-subprograma").attr("disabled","");
					        	$("#progreso-ins-subp").attr("aria-valuenow", "100");
					        	$("#progreso-ins-subp").attr("style", "width: 100%");
					        }
					   });
						subprogramasIns = JSON.parse(subprogramasIns);
						subprogramasIns = subprogramasIns.subprogramasIns;
					   
						$(".box-body").append("Subrogramas insertados: "+subprogramasIns+"<br>");
					 }else{
						 alert("No se han realizado cambios en SIPP");
					 }
				}
				if (elemento==="proyecto"){
					var dialog=confirm("Esta seguro que desea Insertar proyectos en el SIPP?. Este cambio no se puede deshacer");
					 if (  dialog == true ) {
						var proyectosIns=	$.ajax({
					        url: "/ajaxExport?accion=insProyecto",
					        type: 'POST',
					        dataType: 'json',
					        data: JSON.stringify(condicion),
					        contentType: 'application/json',
					        mimeType: 'application/json',
					        success: function (data) {
					        	$("#insertar-proyecto").attr("disabled","");
					        	$("#progreso-ins-proy").attr("aria-valuenow", "100");
					        	$("#progreso-ins-proy").attr("style", "width: 100%");
					        },
					        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
					        error: function(data,status,er) {
					        	$("#insertar-proyecto").attr("disabled","");
					        	$("#progreso-ins-proy").attr("aria-valuenow", "100");
					        	$("#progreso-ins-proy").attr("style", "width: 100%");
					        }
					   });
						proyectosIns = JSON.parse(proyectosIns);
						proyectosIns = proyectosIns.proyectosIns;
					   
						$(".box-body").append("Proyectos insertados: "+proyectosIns+"<br>");
					 }else{
						 alert("No se han realizado cambios en SIPP");
					 }
				}
				if (elemento==="producto"){
					var dialog=confirm("Esta seguro que desea Insertar productos en el SIPP?. Este cambio no se puede deshacer");
					 if (  dialog == true ) {
						var productosIns=	$.ajax({
					        url: "/ajaxExport?accion=insProdcuto",
					        type: 'POST',
					        dataType: 'json',
					        data: JSON.stringify(condicion),
					        contentType: 'application/json',
					        mimeType: 'application/json',
					        success: function (data) {
					        	$("#insertar-producto").attr("disabled","");
					        	$("#progreso-ins-prod").attr("aria-valuenow", "100");
					        	$("#progreso-ins-prod").attr("style", "width: 100%");
					        },
					        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
					        error: function(data,status,er) {;}
					   });
						productosIns = JSON.parse(productosIns);
						productosIns = proyectosIns.productosIns;
					   
						$(".box-body").append("Productos insertados: "+proyectosIns+"<br>");
					 }else{
						 alert("No se han realizado cambios en SIPP");
					 }
				}			
				
			}
			event.stopPropagation();
			event.preventDefault();
			return false;
			
		});
		
	});

</script>
			
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
textarea { text-transform: uppercase; }
input { text-transform: uppercase; }
</style>
<script>
var entidad;
var entidades;

</script>
    <div class="wrapper">

      <header class="main-header">
		          <a href="../index.jsp" class="logo">
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
                 <img src="../dist/img/2/user.png" class="user-image" alt="User Image"/>
                 
                  <span id="PerfilUsuario" class="hidden-xs"></span>
                </a>
                <ul class="dropdown-menu">
                  <!-- User image -->
                  <li class="user-header">
                     <img src="../dist/img/2/user.png" class="img-circle" alt="User Image"/>
                    
                    <p>
                      Rafael Palau - DGTIC
                      <small>Secretaría Técnica de Planificación para el Desarrollo Económico y Social</small>
                    </p>
                  </li>
                  <!-- Menu Body 
                  <li class="user-body">
                    <div class="col-xs-4 text-center">
                      <a href="#">Followers</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Sales</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Friends</a>
                    </div>
                  </li>-->
                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <div class="pull-left">
                      <a href="#" class="btn btn-default btn-flat">Perfil</a>
                    </div>
                    <div class="pull-right">
                      <a href="https://login.stp.gov.py:8443/cas/logout" class="btn btn-default btn-flat">Salir</a>
                    </div>
                  </li>
                </ul>
              </li>
              <!-- Control Sidebar Toggle Button 
              <li>
                <a href="#" data-toggle="control-sidebar"><i class="fa fa-outdent"></i></a>
              </li>-->
            </ul>
          </div>

        </nav>
      </header>
      <aside class="main-sidebar">
      <!-- Left side column. contains the logo and sidebar -->
            <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image"> 
               <!-- <img src="dist/img/2/Logo_STP.png" class="img-circle" alt="User Image" /> -->
               <img src="../dist/img/2/user.png" class="img-circle" alt="User Image" /> 
            </div>
            <div class="pull-left info">
              <p id="nombreUsuario"></p>

              <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
          </div>
          
          <!-- /.search form -->
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header">PROGRAMACIÓN</li>
            <li class="treeview">
              <a href="../entidad.jsp" id="listarEntidades">
                <i class="fa fa-dashboard"></i> <span>Entidad</span> <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu" id="listaEntidades" atyle="display: none;">
              </ul>
            </li>
            <li class="treeview">
             <a href="../programacion.jsp" id="listarProgramacion">
                <i class="fa fa-files-o"></i>
                <span>Estructura Programática</span>
                <span class="label label-primary pull-right">4</span>
              </a>
              <ul class="treeview-menu" id="listaProgramacion">
                
              </ul>
            </li>
            <!-- <li class="treeview">
            	<a href="/estructura-programatica.jsp">
            	<i class="fa fa-book"></i> <span>Modificación de Estructura Programática</span></a></li>
           <li class="treeview">
               <a href="/pnd.jsp" id="listarPnd">
                <i class="fa fa-folder"></i> <span>Vinculación PND</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
            </li> -->
            
            <li class="treeview">
              <a href="../producto.jsp" id="listarProductos">
                <i class="fa fa-edit"></i> <span>Programación de Productos</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
              </ul>
            </li>
            
            <li class="header">LABELS</li>
            <li><a href="../documentacion.jsp"><i class="fa fa-circle-o text-red"></i> <span>Documentación</span></a></li>
            <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Diccionario de Datos</span></a></li>
            <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Preguntas Frecuentes</span></a></li>
          </ul>
        </section>
        <!-- /.sidebar -->
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
          <ol class="breadcrumb">
            <li id="f1c2"><i class="fa fa-dashboard"></i> </li>
            <li id="f2c2" ></li>
            <li id="f3c2" ></li>
            <li id="f4c2" ></li>
            <li id="f5c2"></li>
            <li id="f6c2" class="active"></li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content" id="programacion">
          <!-- Info row de buscador de productos -->
         <div class="row">
          <div class="col-md-12">
          <div class="box" height="1000px">
            <div class="box-header with-border" height="1000px">
              <h3 class="box-title" id="tituloTipoPrograma">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                Migracion de entidad Entidad: <%=attributes.get("entidad")  %>
              </h3>
              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
              </div>
            </div>
            <div class="box-body" >
              <ul  class="col-md-6">
              <div class="btn-group-vertical">  
	              <button class="btn btn-danger" id="actualizar-entidad" data-request-confirm="Seguro?">Actualizar Memoria de la Entidad</button><br><br>
	              <button class="btn btn-danger" id="actualizar-programa">Actualizar Programas Existentes</button><br><br>
	              <button class="btn btn-danger" id="actualizar-subprograma">Actualizar Subrogramas Existentes</button><br><br>
	              <button class="btn btn-danger" id="actualizar-proyecto">Actualizar Proyectos Existentes</button><br><br>
	              <br>
	              
	              <button class="btn btn-danger" id="insertar-programa">Insertar Programas Nuevos</button><br><br>
	              <button class="btn btn-danger" id="insertar-subprograma">Insertar Subrogramas Nuevos</button><br><br>
	              <button class="btn btn-danger" id="insertar-proyecto">Insertar Proyectos Nuevos</button><br><br>
	              <button class="btn btn-danger" id="insertar-producto">Insertar Productos Nuevos</button><br><br>
	              
              </div>
             </ul>
             <ul  class="col-md-6">
              <div class="progress" style="margin-bottom: 15px;">
                    <div id="progreso-act-ent" class="progress-bar progress-bar-green" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                      <span class="sr-only">40% Complete (success)</span>
                    </div>
              </div><br><br>
              <div class="progress" style="margin-bottom: 15px;">
                    <div id="progreso-act-prog" class="progress-bar progress-bar-green" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                      <span class="sr-only">40% Complete (success)</span>
                    </div>
              </div><br><br>
              <div class="progress" style="margin-bottom: 15px;">
                    <div id="progreso-act-subp" class="progress-bar progress-bar-green" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                      <span class="sr-only">40% Complete (success)</span>
                    </div>
              </div><br><br>
              <div class="progress" style="margin-bottom: 15px;">
                    <div id="progreso-act-proy" class="progress-bar progress-bar-green" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                      <span class="sr-only">40% Complete (success)</span>
                    </div>
              </div><br><br>
              <br>
              
              <div class="progress" style="margin-bottom: 15px;">
                    <div id="progreso-ins-prog" class="progress-bar progress-bar-green" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                      <span class="sr-only">40% Complete (success)</span>
                    </div>
              </div><br><br>
              <div class="progress" style="margin-bottom: 15px;">
                    <div id="progreso-ins-subp" class="progress-bar progress-bar-green" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                      <span class="sr-only">40% Complete (success)</span>
                    </div>
              </div><br><br>
              <div class="progress" style="margin-bottom: 15px;">
                    <div id="progreso-ins-proy" class="progress-bar progress-bar-green" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                      <span class="sr-only">40% Complete (success)</span>
                    </div>
              </div><br><br>
              <div class="progress" style="margin-bottom: 15px;">
                    <div id="progreso-ins-prod" class="progress-bar progress-bar-green" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                      <span class="sr-only">40% Complete (success)</span>
                    </div>
              </div><br><br>
             </ul>              
			<script>
		$( document ).ready(function() {
			
		});
			</script>
			
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

      
      

    </div><!-- ./wrapper -->

    <!-- jQuery 2.1.3 -->
    <script src="../plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='../plugins/fastclick/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="../dist/js/app.min.js" type="text/javascript"></script>
    <!-- Sparkline -->
    <script src="../plugins/sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
    <!-- jvectormap -->
    <script src="../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
    <script src="../plugins/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
    <!-- daterangepicker -->
    <script src="../plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
    <!-- datepicker -->
    <script src="../plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <!-- SlimScroll 1.3.0 -->
    <script src="../plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- ChartJS 1.0.1 -->
    <script src="../plugins/chartjs/Chart.min.js" type="text/javascript"></script>

    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="../dist/js/pages/dashboard2.js" type="text/javascript"></script>

    <!-- AdminLTE for demo purposes -->
    <script src="../dist/js/demo.js" type="text/javascript"></script>
    <%  } else { %>
				<p>Favor Iniciar Sesion</p>
			<%  } %>
  </body>
</html>
