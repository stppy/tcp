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
	<!--   <script src="frames/entidad.js" type="text/javascript"></script> -->
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	

</head>
<body class="skin-blue sidebar-mini">
<% AttributePrincipal user = (AttributePrincipal) request.getUserPrincipal();%>
<% Map attributes = user.getAttributes(); 
if (user != null) { %>
	<%@ include file="/frames/perfil.jsp" %>
	
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
    _paq.push(['setSiteId', 20]);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
  })();
</script>
<noscript><p><img src="//infra.stp.gov.py/monitoreoweb/piwik.php?idsite=4" style="border:0;" alt="" /></p></noscript>
<!-- /piwik -->


<style>
textarea { text-transform: uppercase; }
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

	<div class="container">
		<h2>Migrar datos desde Webservices</h2>
		<form class="form-horizontal">
			<div class="row">
				<label class="control-label col-sm-2" for="urlws">URL:</label>
				<div class="col-sm-10">
					<input type="url" class="form-control" id="urlws" placeholder="Ingrese la URL del webservice" value="/tablero/ajaxSelects2?action=getUnidadMedida">
				</div>
			</div>
			<div class="row">
				<label class="control-label col-sm-2" for="metodo">Método:</label>
				<div class="col-sm-10">
					<select class="form-control" id="metodo">
						<option>GET</option>
						<option>POST</option>
					</select>
				</div>
			</div>
			<div class="row">
				<button type="button" class="btn btn-default" id="cargarWs">Mostrar Datos</button>				
			</div>
			<div class="row">
				<table id="tablaJson"><thead id="thtablaJson"></thead><tbody id="cuerpoTabla"></tbody></table>
			</div>			
			<div class="row">
				<div class="row-height">
					<div class="col-xs-6 col-height">
						<h3>Columnas proveídas por el webservice</h3>
					</div>
					<div class="col-xs-6 col-height col-top">
						<h3>Columnas proveídas por la base de datos</h3>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="row-height">
					<div class="col-xs-6 col-height"></div>
					<div class="col-xs-6 col-height col-top">
						<div class="col-sm-4">
							<label for="selbd">Seleccionar Tabla:</label>
						</div>
						<div class="col-sm-8">
							<select class="form-control" id="selbd"></select>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="row-height">
					<div class="col-xs-6 col-height">
						<ul id="sortable">							
						</ul>
					</div>
					<div class="col-xs-6 col-height">
						<ul id="sortable1">							
						</ul>
					</div>
				</div>
			</div>

			<div class="row">
				<button type="button" class="btn btn-default" id="emparejar">Confirmar Emparejamiento</button>
			</div>
			<div class="row">
				<label class="control-label col-sm-2" for="previasql">Comando SQL:</label>
				<div class="col-sm-10">					
  					<textarea class="form-control" rows="5" id="previasql"></textarea>
				</div>
			</div>
			<div class="row">
				<button type="button" class="btn btn-default" id="migrar">Migrar Datos</button>
				<button type="button" class="btn btn-default" id="limpiar">Limpiar</button>
			</div>			
		</form>
	</div>

 <script>
 //$(document).ready(function(){
	 
	 var tablas = $.ajax({
			url:'/tablero/ajaxSelects2?action=getAllTablas',
		  	type:'get',
		  	dataType:'json',
		  	async:false
		}).responseText;
	 tablas = JSON.parse(tablas);
	 
	var listatablas="";
  	for(var i = 0; i < tablas.length; i++){    		  
  		listatablas+='<option value="'+tablas[i].tablename+'">'+tablas[i].tablename+'</option>';		    		  
  	}
  	$("#selbd").append(listatablas);
	 
	$("body").on("click", "#cargarWs",function(event){
		 if($("#urlws").val() !== '' && $("#metodo").val() !== ''){
						
			datos = $.ajax({
		 			url:$("#urlws").val(),
		 		  	type:$("#metodo").val(),
		 		  	dataType:'json',
		 		  	//headers: $("#encabezado").val(),
		 		  	async:false       
		 		}).responseText;
			 datos = JSON.parse(datos);
			 //datos = datos.niveles;
		    	 
		    	 construirTablaHtml();

		    	 // genera un table html a partir del webservice proveído
		    	  function construirTablaHtml() {
		    	      var columns = AgregarHeaders(datos);
		    	  
		    	      for (var i = 0 ; i < datos.length ; i++) {
		    	          var row$ = $('<tr/>');
		    	          for (var colIndex = 0 ; colIndex < columns.length ; colIndex++) {
		    	              var cellValue = datos[i][columns[colIndex]];
		    	  
		    	              if (cellValue == null) { cellValue = ""; }
		    	  
		    	              row$.append($('<td/>').html(cellValue));
		    	          }
		    	          //$("#tablaJson").append(row$);
		    	          $("#cuerpoTabla").append(row$);
		    	      }
		    	  }
		    	  
		    	  
		    	  // agrega los headers al table
		    	  function AgregarHeaders(datos)
		    	  {
		    	      var columnSet = [];
		    	      var headerTr$ = $('<tr/>');
		    	  
		    	      for (var i = 0 ; i < datos.length ; i++) {
		    	          var rowHash = datos[i];
		    	          for (var key in rowHash) {
		    	              if ($.inArray(key, columnSet) == -1){
		    	                  columnSet.push(key);
		    	                  headerTr$.append($('<th/>').html(key));
		    	              }
		    	          }
		    	      }
		    	      //$("#tablaJson").append(headerTr$);
		    	      $("#thtablaJson").append(headerTr$);
		    	  
		    	      return columnSet;
		    	  }
		    	  
		    	  encabezado=new Array();
		    	  $("table tr th").each(function(){    		    
		    		    encabezado.push($(this).text());
		    		});
		    	  
		    	  var listaws="";
		    	  for(var i = 0; i < encabezado.length; i++){    		  
		    		  listaws+='<li class="ui-state-default">'+encabezado[i]+'</li>';		    		  
		    	  }
		    	  $("#sortable").append(listaws);
		    	  $('#tablaJson').DataTable();
		 } 
	 });
	 
	 $("body").on("change", "#selbd",function(event){
		 
		 $("#sortable1").html("");
		 var columnas = $.ajax({
				url:'/tablero/ajaxSelects2?action=getColumna&tabla='+$(this).find('option:selected').val(),
			  	type:'get',
			  	dataType:'json',
			  	async:false
			}).responseText;
		 columnas = JSON.parse(columnas);
		 
	  var listaws="";
   	  for(var i = 0; i < columnas.length; i++){    		  
   		  listaws+='<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>'+columnas[i].column_name+' ['+columnas[i].data_type+','+columnas[i].column_default+','+columnas[i].is_nullable+']</li>';		    		  
   	  }
   	  $("#sortable1").append(listaws);
		 
	 });
	 
	 $("body").on("click", "#emparejar",function(event){
		var sql="insert into "+$("#selbd").find('option:selected').val();
		columnasWs=[], columnasBd=[];
		var sql2="", sqlcuerpo="", filadatos="";
		
		$("#sortable1 li").each(function(index){     	    
			var nombreCol=$(this).text().split('[');
			nombreCol[0]=nombreCol[0].substring(0,nombreCol[0].length - 1);
			columnasBd.push(nombreCol[0]);     	    			
     	});		 
		
		$("#sortable li").each(function(index){     	    
			columnasWs.push($(this).text());     	    			
     	});
		
		for(var i = 0; i < columnasWs.length; i++){
			if(columnasBd[i]!="id"){
				sql2+=columnasBd[i]+",";	
			}			
		}
		sql2=sql2.substring(0,sql2.length - 1);
		sql2="("+sql2+") values";		
				
		for(var i = 0; i < datos.length; i++){    		  
			for(var j = 0; j < columnasBd.length; j++){
				propColumna=$('#sortable1 li').eq(j).text().split('[');
				
				nombreCol=propColumna[0];
				nombreCol=nombreCol.substring(0,nombreCol.length - 1);
				
				caractCol=propColumna[1].split(',');
				tipodatos=caractCol[0];
				valdefecto=caractCol[1];
				nulo=caractCol[2];        	
				nulo=nulo.substring(0,nulo.length - 1);
				
				//isSerial=propColumna[1].search("nextval");
				
				if(nombreCol!="id" && (valdefecto.search("nextval")<0)){ // si no es id serial
					if(columnasWs.length<j){
						if(nulo!="NO" && valdefecto!="null"){
							//sql2=sql2+','+nombreCol; mostrar alert que no coinciden las columnas
						}
					}else{
						if(typeof datos[i][columnasWs[j]] == "undefined"){
							sqlcuerpo+="null,";	
						}else{
							if(tipodatos=="date"){
								//	
							}else{
								sqlcuerpo+="'"+datos[i][columnasWs[j]]+"',";	
							}
						}
					}
				}
			}
			sqlcuerpo="("+sqlcuerpo.substring(0,sqlcuerpo.length - 1)+"),";
			//concat=$("#previasql").text();
			filadatos+=sqlcuerpo;
			sqlcuerpo="";
	   	}
		filadatos=filadatos.substring(0,filadatos.length - 1)+";";
		$("#previasql").text(sql+sql2+filadatos);  
	 });
	 
	 $("body").on("click", "#migrar",function(e){
		 var sql=$("#previasql").text();
		 
		 if(sql!==""){			 
			 bootbox.confirm("Está seguro que desea confirmar la operación?", function(result) {
			      //alert("Confirm result: " + result);
			      if(result==true){
			    	  var info = JSON.stringify(sql);
					    $.ajax({
					        url: "/tablero/ajaxInserts2?accion=insMigrar",
					        type: 'POST',
					        dataType: 'json',
					        data: info,
					        contentType: 'application/json',
					        mimeType: 'application/json',
					        success: function (data) {
					        	if(data.success == true)
					        	{
					            	alert("Registros insertados");	
					            	location.reload();
					        	}else{
					        		alert("Error al migrar datos");		          
					        	}
					        },		        
					        error: function(data,status,er) {}
						 });
			      }
			    });	 
		}
		  
	 });
	 
	 $("body").on("click", "#limpiar",function(event){
		 /* $("#urlws").text("");
		 $("#cuerpoTabla").html("");
		 $("#thtablaJson").html("");
		 $("#sortable1").html("");
		 $("#sortable").html("");
		 $("#previasql").text(""); */
		 location.reload();
	 });
	 
	//http://spr.stp.gov.py/tablero/ajaxSelects2?action=getUnidadMedida
 //});
  </script>



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

    <!-- Librerias para la rutina de cambio de contraseña -->
    <script src="dist/js/jquerymd5.js" type="text/javascript"></script>    	
    <%@ include file="/frames/pass.jsp" %>
    
    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js" type="text/javascript"></script>
        <%  } else { %>
				<p>Favor Iniciar Sesion</p>
			<%  } %>
			
  </body>
</html>
