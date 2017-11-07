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
	<script src="/dist/js/jspdf.min.js"></script>
	
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrapslider.css" rel="stylesheet">	
	<script src="plugins/jquery-bootstrap-modal-steps.js"></script>	
	
	<!-- bootstrap datepicker css  -->
	<link href="plugins/datepicker/datepicker3.css" rel="stylesheet">
	
	<!-- bootstrap wysihtml5 css  -->
	<link href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css">
	
	<!-- jQuery 2.1.3  -->
    <!-- >script src="plugins/jQuery/jQuery-2.1.3.min.js"></script-->
    
    <!-- leaflet css -->
    <link rel="stylesheet" href="plugins/mapa/leaflet.css" />
    <script src="plugins/mapa/leaflet.js"></script>
    <!-- leaflet location picker css -->
    <link href="plugins/mapa/leaflet-locationpicker.css" rel="stylesheet">
    <script src="plugins/mapa/leaflet-locationpicker.js"></script>
    
    <link href="plugins/datatables/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="plugins/datatables/css/buttons.dataTables.min.css" rel="stylesheet">       
	
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
		
		/* Ajusta el tamaño del select y limita la longitud del texto a desplegar
		 poniendole ... cuando supera la longitud máxima */
		select option {
		  	white-space: nowrap;
		  	overflow: hidden;
		  	text-overflow: ellipsis;
		  	max-width: 785px;
		}
    </style>

</head>
<body class="skin-blue sidebar-mini sidebar-collapse">

<% AttributePrincipal user = (AttributePrincipal) request.getUserPrincipal();%> 
<% Map attributes = user.getAttributes(); 
if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2") || attributes.get("role_id_tablero").toString().equals("3")){
if (user != null && user.getName()!= "parce@nandeparaguay.org") { %>
	<%@ include file="/frames/perfil.jsp" %>
<script>

<%if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
	$(document).ready(function(){
		
		var strDate;
		var d = new Date();
		
		if(d.getDate() < 10 ){
			strDate = d.getFullYear() + "-" + (d.getMonth()+1) + "-" + "0"+d.getDate();
		}else{
			 strDate = d.getFullYear() + "-" + (d.getMonth()+1) + "-" + d.getDate();
		}

		$("#fecha").val(strDate);

		$("body").on("click", ".crear",function(event){
		            var descripcion = $("#descripcion").val();
		            
		        	var objeto = new Object();
		        	var issues = new Object();
		        	
		        	objeto.project_id =  280;
		        	objeto.subject = "Tarea nueva";
		        	objeto.priority_id = 3;
		        	objeto.description = descripcion;
		        	
		        	
		        	issues.issues = objeto;
		        	

		            createIssue(issues);
		        });
		 
		        var createIssue = function (issues) {
		            $.ajax({
		                url: "https://redmine.stp.gov.py/issues.json?key=a07888bdc60c529428c80661952ea3d4b40d21b6",
		                type: 'POST',
		              	crossDomain: 'true',
		              	dataType:'jsonp',
		                data: JSON.stringify(issues),
		                headers: {
		                    'Accept': 'application/json',
		                    'Content-Type': 'application/json'
		                },
		                success: function (data) {
		                    alert(data[0].description);
		                },
		                error: function () {
		                    alert('Failed!');
		                },
		            });
		        };

					
	});
<%}else{%>
	window.location = "/tablero/geografico4.jsp";
<%}%>

</script>
	
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
        <div class="row">
        		
				<div class="col-md-12" id="mostrarOcultarBorrado"></div>					
		</div>

        <!-- Main content -->
        <section class="content" id="programacion">
	         <!-- row periodo actual -->
	    	<div class="row">
	        	<div class="col-md-12">
	         		<div class="box" > 
	            		<div class="box-header with-border">
	              			<h2 class="box-title text-center">Sugerencias</h2>
	              			<div class="box-tools pull-right"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button></div>
	            		</div>
	            		<div class="box-body" id="cuerpoInsLineaAccion" style="height:auto; overflow: auto; display: block;">
	            			<form role="form">
				              <div class="box-body">
				              	<div class="form-group">
				                  <label>Textarea</label>
				                  <textarea class="form-control" rows="3" id="descripcion" placeholder="Por favor describa su sugerencia o inconveniente al utilizar el sistema"></textarea>
				                </div>
				                <div class="form-group">
				                  <label for="exampleInputEmail1">Usuario</label>
				                  <input type="text" class="form-control" id="usuario" value="<%=user.getName()%>">
				                </div>
				                <div class="form-group">
				                  <label for="exampleInputPassword1">Password</label>
				                  <input type="date" class="form-control" id="fecha">
				                </div>
		
				              </div>
				              <!-- /.box-body -->
				
				              <div class="box-footer">
				                <button type="submit" class="btn btn-primary crear" >Submit</button>
				              </div>
				            </form>
	            			
	            		</div>
	             		<div class="box-footer" style="height:auto; overflow: auto; display: block;">
							<div class="col-md-6" align="right">														
							</div><!--fin div de link de avances y constancias -->
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

       <!-- Control Sidebar -->
      <aside class="control-sidebar control-sidebar-light">
		 <%@ include file="/frames/control-sidebar.jsp"  %>
      </aside><!-- /.control-sidebar -->
      <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
      <div class='control-sidebar-bg'></div>
      
      
      <script type="text/javascript">
			$(document).ready(function(){
				$("#sideBar2").click(function(){
					//Update options
					var o = $.AdminLTE.options.controlSidebarOptions;
					//Get the sidebar
					var sidebar = $(o.selector);
					
					//If the sidebar is not open
					if (!sidebar.hasClass('control-sidebar-open') && !$('body').hasClass('control-sidebar-open')) {
						//Open the sidebar
						open(sidebar, o.slide);
					} else {
						close(sidebar, o.slide);
					}
					
					   //If the body has a boxed layout, fix the sidebar bg position
					   var bg = $(".control-sidebar-bg");
					   fix(bg);
					   
					   //Open the control sidebar
					function open (sidebar, slide) {
					    //Slide over content
					    if (slide)
					      sidebar.addClass('control-sidebar-open');
					    //Push the content by adding the open class to the body instead 
					    //of the sidebar itself
					    else
					      $('body').addClass('control-sidebar-open');
					}  
					//Close the control sidebar
					function close (sidebar, slide) {
					    if (slide)
					      sidebar.removeClass('control-sidebar-open');
					    else
					      $('body').removeClass('control-sidebar-open');
					}
					 
					function fix (sidebar) {
						var _this = this;
					    if ($("body").hasClass('layout-boxed')) {
					       sidebar.css('position', 'absolute');
					       sidebar.height($(".wrapper").height());
					       $(window).resize(function () {
					         fix(sidebar);
					       });
					    } else {
					       sidebar.css({
					         'position': 'fixed',
					         'height': 'auto'
					       });
					     }
					   }
				});
			});
		</script>
	
    </div><!-- ./wrapper -->

    <!-- jQuery 2.1.3 -->
    <!-- script src="plugins/jQuery/jQuery-2.1.3.min.js"></script-->        
	<!-- Bootstrap 3.3.2 JS -->
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- bootstrap wysihtml5 js  -->
	<script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>
    <!-- DATA TABES SCRIPT -->    
    <script src="plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
    <!-- <script src="plugins/datatables/Plugins/api/sum().js"></script> -->
        
	<script src="plugins/datatables/dataTables.buttons.min.js" type="text/javascript"></script>
	<script src="plugins/datatables/buttons.flash.min.js" type="text/javascript"></script>
	<script src="plugins/datatables/jszip.min.js" type="text/javascript"></script>
	<script src="plugins/datatables/pdfmake.min.js" type="text/javascript"></script>
	<script src="plugins/datatables/vfs_fonts.js" type="text/javascript"></script>
	<script src="plugins/datatables/buttons.html5.min.js" type="text/javascript"></script>
	<script src="plugins/datatables/buttons.print.min.js" type="text/javascript"></script>
	
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
    <script src="plugins/datepicker/locales/bootstrap-datepicker.es.js" charset="UTF-8"></script>
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
        	<script type="text/javascript">window.location = "/tablero/geografico4.jsp";</script>
				<!-- <p>Favor Iniciar Sesion</p> -->
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
usuarioRolCasSpr="<%=attributes.get("role_id_tablero") %>";
var usuariosSpr = $.ajax({
	url:'/tablero/ajaxSelects?action=getUsuarios&usuario=<%=user.getName()%>',
  	type:'get',
  	dataType:'json',
  	async:false       
}).responseText;
usuariosSpr = JSON.parse(usuariosSpr);
usuariosSpr = usuariosSpr.usuarios;
</script>
		<%  } else { %>
            <script type="text/javascript">window.location = "";</script>
        <% } %> 
  </body>
</html>
