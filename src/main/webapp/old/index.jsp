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
  .subprograma{
  	margin-left:30px;
  }
  </style>
  <script>
  $("body").on("click", "#listarEntidades",function(event){
	  $("#programacion").html("");
	  var idEntidad = $(this).attr("id");
	  var datos;
		/*  $("#programacion").append("");
		  $("#programacion").append("<form role=\"form\">");
		  $("#programacion").append("<div class=\"form-group\">");
		  $("#programacion").append("<label for=\"ejemplo_email_1\">Base Legal</label>");
		  $("#programacion").append("<textarea class=\"form-control\" rows=\"3\" style=\"margin: 0px -18px 0px 0px; height: 74px; width: 100%;\" id=\"ejemplo_email_1\" placeholder=\"Introduce Base Legal\"></textarea>");
		  $("#programacion").append("</div>");
		  $("#programacion").append("<div class=\"form-group\">");
		  $("#programacion").append("<label for=\"ejemplo_email_1\">Mision</label>");
		  $("#programacion").append("<textarea class=\"form-control\" rows=\"3\" style=\"margin: 0px -18px 0px 0px; height: 74px; width: 100%;\" id=\"ejemplo_email_1\" placeholder=\"Introduce  Mision\"></textarea>");
		  $("#programacion").append("</div>");
		  $("#programacion").append("<div class=\"form-group\">");
		  $("#programacion").append("<label for=\"ejemplo_password_1\">Visi�n</label>");
		  $("#programacion").append("<textarea class=\"form-control\" rows=\"3\" style=\"margin: 0px -18px 0px 0px; height: 74px; width: 100%;\" id=\"ejemplo_password_1\" placeholder=\"Introduce  Visi�n\"></textarea>");
		  $("#programacion").append("</div>");
		  $("#programacion").append("<div class=\"form-group\">");
		  $("#programacion").append("<label for=\"ejemplo_email_1\">Diagnostico General</label>");
		  $("#programacion").append("<textarea class=\"form-control\" rows=\"3\" style=\"margin: 0px -18px 0px 0px; height: 74px; width: 100%;\" id=\"ejemplo_email_1\" placeholder=\"Introduce Diagnostigo General\"></textarea>");
		  $("#programacion").append("</div>");
		  $("#programacion").append("<div class=\"form-group\">");
		  $("#programacion").append("<label for=\"ejemplo_email_1\">Objetivos Generales</label>");
		  $("#programacion").append("<textarea class=\"form-control\" rows=\"3\" style=\"margin: 0px -18px 0px 0px; height: 74px; width: 100%;\" id=\"ejemplo_email_1\" placeholder=\"Describa los objetivos Generales de la Institucion\"></textarea>");
		  $("#programacion").append("</div>");
		  $("#programacion").append("<div class=\"form-group\">");
		  $("#programacion").append("<label for=\"ejemplo_email_1\">Principales Politicas Institucionales</label>");
		  $("#programacion").append("<textarea class=\"form-control\" rows=\"3\" style=\"margin: 0px -18px 0px 0px; height: 74px; width: 100%;\" id=\"ejemplo_email_1\" placeholder=\"Describa las principales institucionales\"></textarea>");
		  $("#programacion").append("</div>");
		  $("#programacion").append("<div class=\"form-group\">");
		  $("#programacion").append("<label for=\"ejemplo_archivo_1\">Adjuntar un archivo</label>");
		  $("#programacion").append("<input type=\"file\" id=\"ejemplo_archivo_1\">");
		  $("#programacion").append("<p class=\"help-block\">Adjunte archivos referenciales.</p>");
		  $("#programacion").append("</div>");
		  $("#programacion").append("<div class=\"checkbox\">");
		  $("#programacion").append("				  </div>");
		  $("#programacion").append("<button type=\"submit\" class=\"btn btn-info\">Enviar</button>");
		  $("#programacion").append("</form>");
		  */
		  $("#programacion").append('<iframe src="http://sprsoporte.stp.gov.py/index.php/goba/entidad/edit/6" name="frame1" style="border: 0; width: 100%; height: 900px;padding-left:10%;padding-top:20px" id="frame1"></iframe>');
  });
  
  $(document).ready(function(){
	  $( "#listarProgramacion" ).on( "click", function(event) {
		  window.location.href='';
		  if ($("#listaProgramacion").children().length <= 0 && $(this).attr("class")!="entidad"){
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
	    	  $("#listaProgramacion").append("<li class=\"entidad\" id=\""+datos.entidades[i].entidad+"\"><a href=\"#\"><i class=\"fa fa-circle-o\"></i>"+datos.entidades[i].nombreEntidad+"<i class=\"fa fa-angle-left pull-right\"></i></a><ul class=\"treeview-menu\" style=\"display:none\"><li><a href=\"#\"><i class=\"fa fa-circle-o\"></i> Level Three</a></li><li><a href=\"#\"><i class=\"fa fa-circle-o\"></i> Level Three</a></li></ul></li>");
	      }
		  }else{
			  ;
		  }
		});
	  //muestra tipo de presupuesto por anho y entidad
	  $("body").on("click", ".entidad",function(event){
		  var idEntidad = $(this).attr("id");
		  var datos;
		  $("#programacion").html(" ");
		  var tiposPrograma = $.ajax({
	    		url:'/ajaxHelper?accion=getTipoPrograma',
	    		type:'get',
	    		dataType:'json',
	    		async:false    		
	    	}).responseText;
		  tiposPrograma = JSON.parse(tiposPrograma); 
		  var i = 0;
		  for (i=0;i<tiposPrograma.tiposPrograma.length;i++){
			 
			  $("#programacion").append("<div class=\"row\" id=\""+tiposPrograma.tiposPrograma[i].codTipoPrograma+"\" dato=\"tipoPrograma\" entidad=\""+idEntidad+"\"><div class=\"col-md-12\"><div class=\"box\" height=\"1000px\"><div class=\"box-header with-border\" height=\"1000px\"><h3 class=\"box-title\" id=\"tituloTipoPrograma\"><button class=\"btn btn-box-tool\" data-widget=\"collapse\"><i class=\"fa fa-plus\"></i></button>"+tiposPrograma.tiposPrograma[i].codTipoPrograma+" ) "+tiposPrograma.tiposPrograma[i].nombreTipoPrograma+"</h3><div class=\"box-tools pull-right\" height=\"1000px\"><button class=\"btn btn-box-tool\" data-widget=\"collapse\"><i class=\"fa fa-plus\"></i></button>			                   </div></div><div class=\"box-body\" style=\"display:none\"></div></div></div></div>");
		  }
	  });
  		//muestra programa por tipo de presupueso entidad y anho
	  $("body").on("click", "#tituloTipoPrograma",function(event){
		  var idEntidad = $(this).parent().parent().parent().parent().attr("entidad");
		  var idTipoPrograma = $(this).parent().parent().parent().parent().attr("id");
		  var datos;
		  var programas = $.ajax({
	    		url:'/ajaxHelper?accion=getProgramas&nivel=12&entidad='+idEntidad+'&tipoPresupuesto='+idTipoPrograma,
	    		type:'get',
	    		dataType:'json',
	    		async:false    		
	    	}).responseText;
		  programas = JSON.parse(programas); 
		  var i = 0;
		  $(this).parent().parent().children().next().html(" ");
		  for (i=0;i<programas.programas.length;i++){
			 
			  $(this).parent().parent().children().next().append("<div class=\"row\" id=\""+programas.programas[i].codigoPrograma+"\" dato=\"programa\" tipoPrograma=\""+idTipoPrograma+"\" entidad=\""+idEntidad+"\"><div class=\"col-md-10\"><div class=\"box box-info\" height=\"1000px\"><div class=\"box-header with-border\" height=\"1000px\"><h3 class=\"box-title\" id=\"tituloPrograma\">"+programas.programas[i].codigoPrograma+" ) "+programas.programas[i].nombrePrograma+"</h3><div class=\"box-tools pull-right\" height=\"1000px\"><button class=\"btn btn-box-tool\" data-widget=\"collapse\"><i class=\"fa fa-plus\"></i></button>			                   </div></div><div class=\"box-body\" style=\"display:none\"></div></div></div></div>");
		  }
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
			 
			  $(this).parent().parent().children().next().append("<div class=\"row\" id=\""+subprogramas.subprogramas[i].codigoSubprograma+"\" dato=\"subprograma\" tipoPrograma=\""+idTipoPrograma+"\" entidad=\""+idEntidad+"\" programa=\""+idPrograma+"\"><div class=\"col-md-10\"><div class=\"box box-danger\" height=\"1000px\"><div class=\"box-header with-border\" height=\"1000px\"><h3 class=\"box-title\" id=\"tituloSubprograma\">"+subprogramas.subprogramas[i].codigoSubprograma+" ) "+subprogramas.subprogramas[i].nombreSubprograma+"</h3><div class=\"box-tools pull-right\" height=\"1000px\"><button class=\"btn btn-box-tool\" data-widget=\"collapse\"><i class=\"fa fa-plus\"></i></button>			                   </div></div><div class=\"box-body\" style=\"display:none\"></div></div></div></div>");
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
              <a href="#">
                <i class="fa fa-folder"></i> <span>Vinculacion PND</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="pages/examples/invoice.html"><i class="fa fa-circle-o"></i> Programas</a></li>
                <li><a href="pages/examples/login.html"><i class="fa fa-circle-o"></i> Subprogramas </a></li>
                <li><a href="pages/examples/register.html"><i class="fa fa-circle-o"></i> Proyectos</a></li>
               
              </ul>
            </li>
            
            <li class="treeview">
              <a href="#">
                <i class="fa fa-edit"></i> <span>Programacion Fisica</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="pages/forms/general.html"><i class="fa fa-circle-o"></i> Objetivos Estrategicos</a></li>
                <li><a href="pages/forms/advanced.html"><i class="fa fa-circle-o"></i> Resultados</a></li>
                <li><a href="pages/forms/editors.html"><i class="fa fa-circle-o"></i> Proudccion</a></li>
              </ul>
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
            Poder Ejecutivo >  <small>Ministerio de Hacienda</small>
           
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Dashboard</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content" id="programacion">
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
<<<<<<< HEAD
</html>
=======
</html>
>>>>>>> mejoras/master
