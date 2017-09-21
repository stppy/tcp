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
      $("#programacion").append("");
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
      $("#programacion").append("<label for=\"ejemplo_password_1\">VisiÛn</label>");
      $("#programacion").append("<textarea class=\"form-control\" rows=\"3\" style=\"margin: 0px -18px 0px 0px; height: 74px; width: 100%;\" id=\"ejemplo_password_1\" placeholder=\"Introduce  VisiÛn\"></textarea>");
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
      $("#programacion").append("         </div>");
      $("#programacion").append("<button type=\"submit\" class=\"btn btn-info\">Enviar</button>");
      $("#programacion").append("</form>");
  });
  
  $(document).ready(function(){
    $( "#listarProgramacion" ).on( "click", function(event) {
      if ($("#listaProgramacion").children().length <= 0 && $(this).attr("class")!="entidad"){
      var datos = $.ajax({
          url:'http://spr.stp.gov.py/ajaxHelper?accion=getEntidades&nivel=12',
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
          url:'http://spr.stp.gov.py/ajaxHelper?accion=getTipoPrograma',
          type:'get',
          dataType:'json',
          async:false       
        }).responseText;
      tiposPrograma = JSON.parse(tiposPrograma); 
      var i = 0;
      for (i=0;i<tiposPrograma.tiposPrograma.length;i++){
       
        $("#programacion").append("<div class=\"row\" id=\""+tiposPrograma.tiposPrograma[i].codTipoPrograma+"\" dato=\"tipoPrograma\" entidad=\""+idEntidad+"\"><div class=\"col-md-12\"><div class=\"box\" height=\"1000px\"><div class=\"box-header with-border\" height=\"1000px\"><h3 class=\"box-title\" id=\"tituloTipoPrograma\"><button class=\"btn btn-box-tool\" data-widget=\"collapse\"><i class=\"fa fa-plus\"></i></button>"+tiposPrograma.tiposPrograma[i].codTipoPrograma+" ) "+tiposPrograma.tiposPrograma[i].nombreTipoPrograma+"</h3><div class=\"box-tools pull-right\" height=\"1000px\"><button class=\"btn btn-box-tool\" data-widget=\"collapse\"><i class=\"fa fa-plus\"></i></button>                        </div></div><div class=\"box-body\" style=\"display:none\"></div></div></div></div>");
      }
    });
      //muestra programa por tipo de presupueso entidad y anho
    $("body").on("click", "#tituloTipoPrograma",function(event){
      var idEntidad = $(this).parent().parent().parent().parent().attr("entidad");
      var idTipoPrograma = $(this).parent().parent().parent().parent().attr("id");
      var datos;
      var programas = $.ajax({
          url:'http://spr.stp.gov.py/ajaxHelper?accion=getProgramas&nivel=12&entidad='+idEntidad+'&tipoPresupuesto='+idTipoPrograma,
          type:'get',
          dataType:'json',
          async:false       
        }).responseText;
      programas = JSON.parse(programas); 
      var i = 0;
      $(this).parent().parent().children().next().html(" ");
      for (i=0;i<programas.programas.length;i++){
       
        $(this).parent().parent().children().next().append("<div class=\"row\" id=\""+programas.programas[i].codigoPrograma+"\" dato=\"programa\" tipoPrograma=\""+idTipoPrograma+"\" entidad=\""+idEntidad+"\"><div class=\"col-md-10\"><div class=\"box box-info\" height=\"1000px\"><div class=\"box-header with-border\" height=\"1000px\"><h3 class=\"box-title\" id=\"tituloPrograma\">"+programas.programas[i].codigoPrograma+" ) "+programas.programas[i].nombrePrograma+"</h3><div class=\"box-tools pull-right\" height=\"1000px\"><button class=\"btn btn-box-tool\" data-widget=\"collapse\"><i class=\"fa fa-plus\"></i></button>                         </div></div><div class=\"box-body\" style=\"display:none\"></div></div></div></div>");
      }
    });
    
    $("body").on("click", "#tituloPrograma",function(event){
      var idEntidad = $(this).parent().parent().parent().parent().attr("entidad");
      var idPrograma = $(this).parent().parent().parent().parent().attr("id");
      var idTipoPrograma = $(this).parent().parent().parent().parent().attr("tipoprograma");
      var datos;
      var subprogramas = $.ajax({
          url:'http://spr.stp.gov.py/ajaxHelper?accion=getSubprogramas&nivel=12&entidad='+idEntidad+'&tipoPresupuesto='+idTipoPrograma+'&programa='+idPrograma,
          type:'get',
          dataType:'json',
          async:false       
        }).responseText;
      subprogramas = JSON.parse(subprogramas); 
      var i = 0;
      $(this).parent().parent().children().next().html(" ");
      for (i=0;i<subprogramas.subprogramas.length;i++){
       
        $(this).parent().parent().children().next().append("<div class=\"row\" id=\""+subprogramas.subprogramas[i].codigoSubprograma+"\" dato=\"subprograma\" tipoPrograma=\""+idTipoPrograma+"\" entidad=\""+idEntidad+"\" programa=\""+idPrograma+"\"><div class=\"col-md-10\"><div class=\"box box-danger\" height=\"1000px\"><div class=\"box-header with-border\" height=\"1000px\"><h3 class=\"box-title\" id=\"tituloSubprograma\">"+subprogramas.subprogramas[i].codigoSubprograma+" ) "+subprogramas.subprogramas[i].nombreSubprograma+"</h3><div class=\"box-tools pull-right\" height=\"1000px\"><button class=\"btn btn-box-tool\" data-widget=\"collapse\"><i class=\"fa fa-plus\"></i></button>                        </div></div><div class=\"box-body\" style=\"display:none\"></div></div></div></div>");
      }
    });
    $("body").on("click", "#tituloSubprograma",function(event){
      var idEntidad = $(this).parent().parent().parent().parent().attr("entidad");
      var idPrograma = $(this).parent().parent().parent().parent().attr("programa");
      var idSubprograma = $(this).parent().parent().parent().parent().attr("id");
      var idTipoPrograma = $(this).parent().parent().parent().parent().attr("tipoprograma");
      var datos;
      var proyectos = $.ajax({
          url:'http://spr.stp.gov.py/ajaxHelper?accion=getProyectos&nivel=12&entidad='+idEntidad+'&tipoPresupuesto='+idTipoPrograma+'&programa='+idPrograma+'&subprograma='+idSubprograma,
          type:'get',
          dataType:'json',
          async:false       
        }).responseText;
      proyectos = JSON.parse(proyectos); 
      var i = 0;
      $(this).parent().parent().children().next().html(" ");
      for (i=0;i<proyectos.proyectos.length;i++){
       
        $(this).parent().parent().children().next().append("<div class=\"row\" id=\""+proyectos.proyectos[i].codigoProyecto+"\" dato=\"proyecto\" tipoPrograma=\""+idTipoPrograma+"\" entidad=\""+idEntidad+"\" programa=\""+idPrograma+"\" subprograma=\""+idSubprograma+"\"><div class=\"col-md-10\"><div class=\"box box-success\" height=\"1000px\"><div class=\"box-header with-border\" height=\"1000px\"><h3 class=\"box-title\" id=\"tituloProyecto\">"+proyectos.proyectos[i].codigoProyecto+" ) "+proyectos.proyectos[i].nombreProyecto+"</h3><div class=\"box-tools pull-right\" height=\"1000px\"><button class=\"btn btn-box-tool\" data-widget=\"collapse\"><i class=\"fa fa-plus\"></i></button>                        </div></div><div class=\"box-body\" style=\"display:none\"></div></div></div></div>");
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
              url:'http://spr.stp.gov.py/ajaxHelper?accion=getSubprogramas&nivel=12&entidad='+idEntidad+'&tipoPresupuesto='+idTipoPrograma+'&programa='+idPrograma,
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
                      <small>Secretar√≠a T√©cnica de Planificaci√≥n para el Desarrollo Econ√≥mico y Social</small>
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

 <div class="row" id="buscar-producto">
            <div class="col-md-10">
              <div class="box" height="1000px">
                <div class="box-header with-border" height="1000px">
                  <h3 class="box-title" id="tituloTipoPrograma">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>Programacion Fisica
                  </h3>
                  <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button></div>
                </div>
                <div class="box-body" >
                  <ul id="row-body-programacionfisica" class="col-md-10">

  <form class="contact_form" action="" method="" id="formulario">

            
        <table>
          <tr>
            <td>          
                <input type="text" name="nivel" id="nivel" placeholder="Ingrese  Nivel" list="listaNiveles" />
              </td>
              <td id="f1c2"></td> 
            </tr>
          <tr>
            <td>          
                <input type="text" name="entidad" id="entidad" placeholder="Ingrese Entidad" list="listaEntidades" />
              </td>
              <td id="f2c2"></td> 
            </tr>
          <tr>
            <td>          
                <input type="text" name="programa" id="programa" placeholder="Ingrese Programa" list="listaProgramas" />
              </td>
              <td id="f3c2"></td> 
            </tr>
            <tr>
              <td>
            <input type="text" id="subPrograma" placeholder="Ingrese SubPrograma" list="listaSubProgramas">
                <!--<input type="number" name="subprograma" id="subprograma" placeholder="Ingrese N∫ SubPrograma" />-->
            </td>
            <td id="f4c2"></td>
        </tr>
      <tr>
        <td>
               <input type="text" name="proyecto" id="proyecto" placeholder="Ingrese  Proyecto" list="listaProyectos"/>
            </td>
            <td id="f5c2"></td>
        </tr>
      <tr>
        <td>
                <input type="text" name="producto" id="producto" placeholder="Ingrese Producto" list="listaProductos" />
            </td>
            <td id="f6c2"></td>
        </tr>
      <tr>
        <td>
                <button class="submit" type="submit" id="btn">Enviar</button> 
              </td>
              <td></td>
            </tr>
        </table>

</form>
<div id="box"></div>

<script>
 
  
  
  function Combo(){

    this.nivel = function(){
      var rutaNivel = document.getElementById('nivel').value;

      var datosNiveles = $.ajax({
          url:'http://spr.stp.gov.py/ajaxHelper?accion=getNiveles',
          type:'get',
          dataType:'json',
          async:false       
        }).responseText;

        
        datosNiveles = JSON.parse(datosNiveles);

        var datalistNiveles = document.createElement('datalist');
        datalistNiveles.setAttribute('id','listaNiveles'); 
        var ubicacionDatalistNiveles = document.getElementById('formulario');
        ubicacionDatalistNiveles.appendChild(datalistNiveles);

          for(var i = 0; i < datosNiveles.niveles.length ; i++) 
          {       
          var option = document.createElement('option');
          option.setAttribute('value',datosNiveles.niveles[i].nivel + ' - ' + datosNiveles.niveles[i].abrevNivel);
          datalistNiveles.appendChild(option);      
      } 

      for(var x = 0; x < datosNiveles.niveles.length; x++)
      {
        if(datosNiveles.niveles[x].nivel === parseInt(rutaNivel))
        {
          var mostrarNivel = datosNiveles.niveles[x].nombreNivel;
          var nt=document.createTextNode(mostrarNivel);
          var nparrafo=document.getElementById('f1c2');
          nparrafo.appendChild(nt);
        }
      }
    }  

    this.entidad = function(){ 
      this.linkEntidad = document.getElementById('nivel').value;
      this.rutaEntidad2 = document.getElementById('entidad').value;

      this.datosEntidades = $.ajax({
          url:'http://spr.stp.gov.py/ajaxHelper?accion=getEntidadesPorNivel&nivel='+this.linkEntidad,
          type:'get',
          dataType:'json',
          async:false       
        }).responseText;

        
        datosEntidades = JSON.parse(this.datosEntidades);
 
        var datalistEntidades = document.createElement('datalist');
        datalistEntidades.setAttribute('id','listaEntidades'); 
        var ubicacionDatalistEntidades = document.getElementById('formulario');
        ubicacionDatalistEntidades.appendChild(datalistEntidades);

          for(var i = 0; i < datosEntidades.entidades.length ; i++) 
          {       
          var option = document.createElement('option');
          option.setAttribute('value',datosEntidades.entidades[i].entidad + ' ) ' + datosEntidades.entidades[i].abrevEntidad);
          datalistEntidades.appendChild(option);      
      } 

      for(var x = 0; x < datosEntidades.entidades.length; x++)
      {
        if(datosEntidades.entidades[x].entidad === parseInt(this.rutaEntidad2))
        {
          var mostrarEntidad = datosEntidades.entidades[x].nombreEntidad;
          var nt=document.createTextNode(mostrarEntidad);
          var nparrafo=document.getElementById('f2c2');
          nparrafo.appendChild(nt);
        }
      }
    } 

    this.programas = function(){
      this.rutaPrograma = document.getElementById('programa').value;
      this.linkNivel = document.getElementById("nivel").value;
      this.linkEntidad = document.getElementById("entidad").value;

      this.datosProgramas = $.ajax({
          url:'http://spr.stp.gov.py/ajaxHelper?accion=getProgramas&anio=2015&nivel='+this.linkNivel+'&entidad='+this.linkEntidad+'&tipoPresupuesto=3&programa='+this.rutaPrograma,
          type:'get',
          dataType:'json',
          async:false       
        }).responseText;

        
        datosProgramas = JSON.parse(this.datosProgramas);

        var datalistProgramas = document.createElement('datalist');
        datalistProgramas.setAttribute('id','listaProgramas'); 
        var ubicacionDatalistProgramas = document.getElementById('formulario');
        ubicacionDatalistProgramas.appendChild(datalistProgramas);

          for(var i = 0; i < datosProgramas.programas.length ; i++) 
          {       
          var option = document.createElement('option');
          option.setAttribute('value',datosProgramas.programas[i].codigoPrograma + ' ) ' + datosProgramas.programas[i].abrevPrograma);
          datalistProgramas.appendChild(option);      
      } 

      for(var x = 0; x < datosProgramas.programas.length; x++)
      {
        if(datosProgramas.programas[x].codigoPrograma === parseInt(this.rutaPrograma))
        {
          var mostrarNombrePrograma = datosProgramas.programas[x].nombrePrograma;
          var nt=document.createTextNode(mostrarNombrePrograma);
          var nparrafo=document.getElementById('f3c2');
          nparrafo.appendChild(nt);
        }
      }
    } 
    this.subProgramas = function(){
      this.rutaSubPrograma = document.getElementById('subPrograma').value;
      this.rutaProgramas = document.getElementById('programa').value;
      this.linkNivel = document.getElementById("nivel").value;
      this.linkEntidad = document.getElementById("entidad").value;

      this.datosSubProgramas = $.ajax({
          url:'http://spr.stp.gov.py/ajaxHelper?accion=getSubprogramas&anio=2015&nivel='+this.linkNivel+'&entidad='+this.linkEntidad+'&tipoPresupuesto=1&programa='+this.rutaProgramas,
          type:'get',
          dataType:'json',
          async:false       
        }).responseText;

        
        datosSubProgramas = JSON.parse(this.datosSubProgramas);

        var datalistSubProgramas = document.createElement('datalist');
        datalistSubProgramas.setAttribute('id','listaSubProgramas'); 
        var ubicacionDatalistProgramas = document.getElementById('formulario');
        ubicacionDatalistProgramas.appendChild(datalistSubProgramas);

          for(var i = 0; i < datosSubProgramas.subprogramas.length ; i++) 
          {       
          var option = document.createElement('option');
          option.setAttribute('value', datosSubProgramas.subprogramas[i].codigoSubprograma + ' ) ' + datosSubProgramas.subprogramas[i].abrevSubprograma);
          datalistSubProgramas.appendChild(option);     
      } 

      for(var x = 0; x < datosSubProgramas.subprogramas.length; x++)
      {
        if(datosSubProgramas.subprogramas[x].codigoSubprograma === parseInt(this.rutaSubPrograma))
        {
          var mostrarNombrePrograma = datosSubProgramas.subprogramas[x].nombreSubprograma;
          var nt=document.createTextNode(mostrarNombrePrograma);
          var nparrafo=document.getElementById('f4c2');
          nparrafo.appendChild(nt);
        }
      }
    } 

    this.proyecto = function(){
      this.linkNivel = document.getElementById("nivel").value;
      this.linkEntidad = document.getElementById("entidad").value;
      this.linkPrograma = document.getElementById("programa").value;
      this.codigoSubprograma = document.getElementById('subPrograma').value;
      this.rutaProyecto = document.getElementById('proyecto').value;
      
      
      
      

      this.datosProyectos = $.ajax({
          url:'http://spr.stp.gov.py/ajaxHelper?accion=getProyectos&anio=2015&nivel='+this.linkNivel+'&entidad='+this.linkEntidad+'&tipoPresupuesto=3&programa='+this.linkPrograma+'&subprograma='+this.codigoSubprograma,
          type:'get',
          dataType:'json',
          async:false       
        }).responseText;

        
        datosProyectos = JSON.parse(this.datosProyectos);

        var datalistProyectos = document.createElement('datalist');
        datalistProyectos.setAttribute('id','listaProyectos'); 
        var ubicacionDatalistProyectos = document.getElementById('formulario');
        ubicacionDatalistProyectos.appendChild(datalistProyectos);

          for(var i = 0; i < datosProyectos.proyectos.length ; i++) 
          {       
          var option = document.createElement('option');
          option.setAttribute('value', datosProyectos.proyectos[i].codigoProyecto + ' ) ' + datosProyectos.proyectos[i].abrevProyecto);
          datalistProyectos.appendChild(option);      
      } 

      for(var x = 0; x < datosProyectos.proyectos.length; x++)
      {
        if(datosProyectos.proyectos[x].codigoProyecto === parseInt(this.rutaProyecto))
        {
          var mostrarNombreProyecto = datosProyectos.proyectos[x].nombreProyecto;
          var nt=document.createTextNode(mostrarNombreProyecto);
          var nparrafo=document.getElementById('f5c2');
          nparrafo.appendChild(nt);
        }
      }
    }
    this.producto = function(){
      this.linkNivel = document.getElementById("nivel").value;
      this.linkEntidad = document.getElementById("entidad").value;
      this.linkPrograma = document.getElementById("programa").value;
      this.linkSubPrograma = document.getElementById("subPrograma").value;
      this.linkProyecto = document.getElementById("proyecto").value;
      this.linkProducto = document.getElementById("producto").value;


      this.datosProductos = $.ajax({
          url:'http://spr.stp.gov.py/ajaxHelper?accion=todosLosProductosPorAnio',
          type:'get',
          dataType:'json',
          async:false       
        }).responseText;

        
        datosProductos = JSON.parse(this.datosProductos);

        var datalistProductos = document.createElement('datalist');
        datalistProductos.setAttribute('id','listaProductos'); 
        var ubicacionDatalistProductos = document.getElementById('formulario');
        ubicacionDatalistProductos.appendChild(datalistProductos);

          for(var i = 0; i < datosProductos.todosLosProductosPorAnio.length ; i++) 
          {       
            if( (datosProductos.todosLosProductosPorAnio[i].nivel === parseInt(this.linkNivel)) && (datosProductos.todosLosProductosPorAnio[i].entidad === parseInt(this.linkEntidad)) && (datosProductos.todosLosProductosPorAnio[i].codigoPrograma === parseInt(this.linkPrograma)) && (datosProductos.todosLosProductosPorAnio[i].codigoSubprograma === parseInt(this.linkSubPrograma)) && (datosProductos.todosLosProductosPorAnio[i].codigoProyecto === parseInt(this.linkProyecto)) && (datosProductos.todosLosProductosPorAnio[i].codigoProducto === parseInt(this.linkProducto)) )
            {
            var option = document.createElement('option');
            option.setAttribute('value', datosProductos.todosLosProductosPorAnio[i].codigoProducto + ' ) ' + datosProductos.todosLosProductosPorAnio[i].clase);
            datalistProductos.appendChild(option);  
          }   
      } 

      for(var x = 0; x < datosProductos.todosLosProductosPorAnio.length; x++)
      {
        if( (datosProductos.todosLosProductosPorAnio[x].nivel === parseInt(this.linkNivel)) && (datosProductos.todosLosProductosPorAnio[x].entidad === parseInt(this.linkEntidad)) && (datosProductos.todosLosProductosPorAnio[x].codigoPrograma === parseInt(this.linkPrograma)) && (datosProductos.todosLosProductosPorAnio[x].codigoSubprograma === parseInt(this.linkSubPrograma)) && (datosProductos.todosLosProductosPorAnio[x].codigoProyecto === parseInt(this.linkProyecto)) && (datosProductos.todosLosProductosPorAnio[x].codigoProducto === parseInt(this.linkProducto)) )
        {
          var mostrarNombreProducto = datosProductos.todosLosProductosPorAnio[x].descripcion;
          var nt=document.createTextNode(mostrarNombreProducto);
          var nparrafo=document.getElementById('f6c2');
          nparrafo.appendChild(nt);
        }
      }
    } 

    this.dibujar = function(){
      this.linkNivel = document.getElementById("nivel").value;
      this.linkEntidad = document.getElementById("entidad").value;
      this.linkPrograma = document.getElementById("programa").value;
      this.linkSubPrograma = document.getElementById("subPrograma").value;
      this.linkProyecto = document.getElementById("proyecto").value;
      this.linkProducto = document.getElementById("producto").value;


      var datosProductos = $.ajax({
          url:'http://spr.stp.gov.py/ajaxHelper?accion=todosLosProductosPorAnio',
          type:'get',
          dataType:'json',
          async:false       
        }).responseText;

        
        datosProductos = JSON.parse(datosProductos);

        var datalistProductos = document.createElement('datalist');
        datalistProductos.setAttribute('id','listaProductos'); 
        var ubicacionDatalistProductos = document.getElementById('formulario');
        ubicacionDatalistProductos.appendChild(datalistProductos);

          for(var i = 0; i < datosProductos.todosLosProductosPorAnio.length ; i++) 
          {       
            if( (datosProductos.todosLosProductosPorAnio[i].nivel === parseInt(this.linkNivel)) && (datosProductos.todosLosProductosPorAnio[i].entidad === parseInt(this.linkEntidad)) && (datosProductos.todosLosProductosPorAnio[i].codigoPrograma === parseInt(this.linkPrograma)) && (datosProductos.todosLosProductosPorAnio[i].codigoSubprograma === parseInt(this.linkSubPrograma)) && (datosProductos.todosLosProductosPorAnio[i].codigoProyecto === parseInt(this.linkProyecto)) && (datosProductos.todosLosProductosPorAnio[i].codigoProducto === parseInt(this.linkProducto)) )
            {
        var input = document.createElement('input');
            input.setAttribute('id', 'numeroFila'); 
            var ubicacionDiv = document.getElementById('box');
            ubicacionDiv.appendChild(input);
            var numeroFila = datosProductos.todosLosProductosPorAnio[i].numeroFila;
            var txt1=document.createTextNode("NumeroFila : "+numeroFila);
            var nbox1=document.getElementById('numeroFila');
            nbox1.appendChild(txt1);

             /* var div2 = document.createElement('div');
              div2.setAttribute('id', 'anio'); 
              ubicacionDiv.appendChild(div2);
            var anio = datosProductos.todosLosProductosPorAnio[i].anio;
            var txt2=document.createTextNode("Anio : "+anio);
            var nbox2=document.getElementById('anio');
            nbox2.appendChild(txt2); 

              var div3 = document.createElement('div');
              div3.setAttribute('id', 'nivel2'); 
              ubicacionDiv.appendChild(div3);
            var nivel = datosProductos.todosLosProductosPorAnio[i].nivel;
            var txt3=document.createTextNode("Nivel : "+nivel);
            var nbox3=document.getElementById('nivel2');
            nbox3.appendChild(txt3); 

              var div4 = document.createElement('div');
              div4.setAttribute('id', 'entidad2'); 
              ubicacionDiv.appendChild(div4);
            var entidad = datosProductos.todosLosProductosPorAnio[i].entidad;
            var txt4=document.createTextNode("Entidad : "+entidad);
            var nbox4=document.getElementById('entidad2');
            nbox4.appendChild(txt4); 

              var div5 = document.createElement('div');
              div5.setAttribute('id', 'tipoPrograma'); 
              ubicacionDiv.appendChild(div5);
            var tipoPrograma = datosProductos.todosLosProductosPorAnio[i].tipoPrograma;
            var txt5=document.createTextNode("TipoPrograma : "+tipoPrograma);
            var nbox5=document.getElementById('tipoPrograma');
            nbox5.appendChild(txt5); 

              var div6 = document.createElement('div');
              div6.setAttribute('id', 'codigoPrograma'); 
              ubicacionDiv.appendChild(div6);
            var codigoPrograma = datosProductos.todosLosProductosPorAnio[i].codigoPrograma;
            var txt6=document.createTextNode("CodigoPrograma : "+codigoPrograma);
            var nbox6=document.getElementById('codigoPrograma');
            nbox6.appendChild(txt6); 

              var div7 = document.createElement('div');
              div7.setAttribute('id', 'codigoSubprograma'); 
              ubicacionDiv.appendChild(div7);
            var codigoSubprograma = datosProductos.todosLosProductosPorAnio[i].codigoSubprograma;
            var txt7=document.createTextNode("CodigoSubprograma : "+codigoSubprograma);
            var nbox7=document.getElementById('codigoSubprograma');
            nbox7.appendChild(txt7); 

              var div8 = document.createElement('div');
              div8.setAttribute('id', 'codigoProyecto'); 
              ubicacionDiv.appendChild(div8);
            var codigoProyecto = datosProductos.todosLosProductosPorAnio[i].codigoProyecto;
            var txt8=document.createTextNode("codigoProyecto : "+codigoProyecto);
            var nbox8=document.getElementById('codigoProyecto');
            nbox8.appendChild(txt8); 

              var div9 = document.createElement('div');
              div9.setAttribute('id', 'codigoProducto'); 
              ubicacionDiv.appendChild(div9);
            var codigoProducto = datosProductos.todosLosProductosPorAnio[i].codigoProducto;
            var txt9=document.createTextNode("codigoProducto : "+codigoProducto);
            var nbox9=document.getElementById('codigoProducto');
            nbox9.appendChild(txt9); 
            */
              var div10 = document.createElement('div');
              div10.setAttribute('id', 'version'); 
              ubicacionDiv.appendChild(div10);
            var version = datosProductos.todosLosProductosPorAnio[i].version;
            var txt10=document.createTextNode("version : "+version);
            var nbox10=document.getElementById('version');
            nbox10.appendChild(txt10);

              var div11 = document.createElement('div');
              div11.setAttribute('id', 'codigoUnidadMedida'); 
              ubicacionDiv.appendChild(div11);
            var codigoUnidadMedida = datosProductos.todosLosProductosPorAnio[i].codigoUnidadMedida;
            var txt11=document.createTextNode("codigoUnidadMedida : "+codigoUnidadMedida);
            var nbox11=document.getElementById('codigoUnidadMedida');
            nbox11.appendChild(txt11);

              var div12 = document.createElement('div');
              div12.setAttribute('id', 'descripcion'); 
              ubicacionDiv.appendChild(div12);
            var descripcion = datosProductos.todosLosProductosPorAnio[i].descripcion;
            var txt12=document.createTextNode("descripcion : "+descripcion);
            var nbox12=document.getElementById('descripcion');
            nbox12.appendChild(txt12);

              var div13 = document.createElement('div');
              div13.setAttribute('id', 'clase'); 
              ubicacionDiv.appendChild(div13);
            var clase = datosProductos.todosLosProductosPorAnio[i].clase;
            var txt13=document.createTextNode("clase : "+clase);
            var nbox13=document.getElementById('clase');
            nbox13.appendChild(txt13);

              var div14 = document.createElement('div');
              div14.setAttribute('id', 'metaEnero'); 
              ubicacionDiv.appendChild(div14);
            var metaEnero = datosProductos.todosLosProductosPorAnio[i].metaEnero;
            var txt14=document.createTextNode("metaEnero : "+metaEnero);
            var nbox14=document.getElementById('metaEnero');
            nbox14.appendChild(txt14);

              var div15 = document.createElement('div');
              div15.setAttribute('id', 'metaFebrero'); 
              ubicacionDiv.appendChild(div15);
            var metaFebrero = datosProductos.todosLosProductosPorAnio[i].metaFebrero;
            var txt15=document.createTextNode("metaFebrero : "+metaFebrero);
            var nbox15=document.getElementById('metaFebrero');
            nbox15.appendChild(txt15);

              var div16 = document.createElement('div');
              div16.setAttribute('id', 'metaMarzo'); 
              ubicacionDiv.appendChild(div16);
            var metaMarzo = datosProductos.todosLosProductosPorAnio[i].metaMarzo;
            var txt16=document.createTextNode("metaMarzo : "+metaMarzo);
            var nbox16=document.getElementById('metaMarzo');
            nbox16.appendChild(txt16);

              var div17 = document.createElement('div');
              div17.setAttribute('id', 'metaAbril'); 
              ubicacionDiv.appendChild(div17);
            var metaAbril = datosProductos.todosLosProductosPorAnio[i].metaAbril;
            var txt17=document.createTextNode("metaAbril : "+metaAbril);
            var nbox17=document.getElementById('metaAbril');
            nbox17.appendChild(txt17);

              var div18 = document.createElement('div');
              div18.setAttribute('id', 'metaMayo'); 
              ubicacionDiv.appendChild(div18);
            var metaMayo = datosProductos.todosLosProductosPorAnio[i].metaMayo;
            var txt18=document.createTextNode("metaMayo : "+metaMayo);
            var nbox18=document.getElementById('metaMayo');
            nbox18.appendChild(txt18);

              var div19 = document.createElement('div');
              div19.setAttribute('id', 'metaJunio'); 
              ubicacionDiv.appendChild(div19);
            var metaJunio = datosProductos.todosLosProductosPorAnio[i].metaJunio;
            var txt19=document.createTextNode("metaJunio : "+metaJunio);
            var nbox19=document.getElementById('metaJunio');
            nbox19.appendChild(txt19);

              var div20 = document.createElement('div');
              div20.setAttribute('id', 'metaJulio'); 
              ubicacionDiv.appendChild(div20);
            var metaJulio = datosProductos.todosLosProductosPorAnio[i].metaJulio;
            var txt20=document.createTextNode("metaJulio : "+metaJulio);
            var nbox20=document.getElementById('metaJulio');
            nbox20.appendChild(txt20);

              var div21 = document.createElement('div');
              div21.setAttribute('id', 'metaAgosto'); 
              ubicacionDiv.appendChild(div21);
            var metaAgosto = datosProductos.todosLosProductosPorAnio[i].metaAgosto;
            var txt21=document.createTextNode("metaAgosto : "+metaAgosto);
            var nbox21=document.getElementById('metaAgosto');
            nbox21.appendChild(txt21);

              var div22 = document.createElement('div');
              div22.setAttribute('id', 'metaSetiembre'); 
              ubicacionDiv.appendChild(div22);
            var metaSetiembre = datosProductos.todosLosProductosPorAnio[i].metaSetiembre;
            var txt22=document.createTextNode("metaSetiembre : "+metaSetiembre);
            var nbox22=document.getElementById('metaSetiembre');
            nbox22.appendChild(txt22);

              var div23 = document.createElement('div');
              div23.setAttribute('id', 'metaOctubre'); 
              ubicacionDiv.appendChild(div23);
            var metaOctubre = datosProductos.todosLosProductosPorAnio[i].metaOctubre;
            var txt23=document.createTextNode("metaOctubre : "+metaOctubre);
            var nbox23=document.getElementById('metaOctubre');
            nbox23.appendChild(txt23);

              var div24 = document.createElement('div');
              div24.setAttribute('id', 'metaNoviembre'); 
              ubicacionDiv.appendChild(div24);
            var metaNoviembre = datosProductos.todosLosProductosPorAnio[i].metaNoviembre;
            var txt24=document.createTextNode("metaNoviembre : "+metaNoviembre);
            var nbox24=document.getElementById('metaNoviembre');
            nbox24.appendChild(txt24);

              var div25 = document.createElement('div');
              div25.setAttribute('id', 'metaDiciembre'); 
              ubicacionDiv.appendChild(div25);
            var metaDiciembre = datosProductos.todosLosProductosPorAnio[i].metaDiciembre;
            var txt25=document.createTextNode("metaDiciembre : "+metaDiciembre);
            var nbox25=document.getElementById('metaDiciembre');
            nbox25.appendChild(txt25);
          }   
      }
    }

    this.enviar = function(){
      var entidad = document.getElementById("entidad").value;
      var nivel = document.getElementById("nivel").value;
      var programa = document.getElementById("programa").value;

      $.ajax({
        type:"post",
        url: "http://webmail.stp.gov.py/intranet/rafa/z/enviando.php",
        data:{
          entidad:entidad,
          nivel:nivel,
          programa:programa
        },
        success: function(data){
          $("#response").append(data);
        }
      });
    }
  }

  var eje1 = new Combo();
  document.getElementById('programa').addEventListener('change',eje1.programas,false);
  document.getElementById('subPrograma').addEventListener('change',eje1.subProgramas,false);
  document.getElementById('proyecto').addEventListener('change',eje1.proyecto,false);
  document.getElementById('nivel').addEventListener('change',eje1.nivel,false);
  document.getElementById('entidad').addEventListener('change',eje1.entidad,false);
  document.getElementById('producto').addEventListener('change',eje1.producto,false);
  document.getElementById('producto').addEventListener('change',eje1.dibujar,false);
  document.getElementById('btn').addEventListener('click',eje1.enviar,false);
</script>

<!-- fin de box body-->

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