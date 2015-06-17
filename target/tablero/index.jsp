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
</head>
<body class="skin-blue sidebar-mini">
<% AttributePrincipal user = (AttributePrincipal) request.getUserPrincipal();%>
<% Map attributes = user.getAttributes(); 
if (user != null) { %>

<script>
	$(document).ready(function(){
		var entidadCas = "";
		entidadCas ="<%=attributes.get("entidad") %>";
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

	     
	});
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
	              <h3 class="box-title" id="tituloTipoPrograma">
	                Requerimientos 	
	              </h3>
	              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	              </div>
	            </div>
	            <div class="box-body" >
	            <table class="table table-striped table-bordered table-hover">
	            	<tr>
	            		<td>
	  						Conectividad
	  					</td> 
	  					<td>
	  						Red Metropolitana
	  					</td>
	  				</tr>
	  				<tr>
	            		<td>
	  						Usuarios
	  					</td>
	  					<td>
	  						Nota enviada por la máxima autoridad de la institución, asignado usuario titular y usuario suplente del sistema. Debe remitirse correo electrónico, nombre y apellido, entidad y cargo
	  					</td>
	  				</tr>
	  			</table> 
	            </div>
			   </div>
			</div>
          </div><!-- /.row -->
	         <div class="row">
	         <div class="col-md-12">
	          <div class="box" height="1000px">
	            <div class="box-header with-border" height="1000px">
	              <h3 class="box-title" id="tituloTipoPrograma">
	                Base Legal
	              </h3>
	              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	              </div>
	            </div>
	            <div class="box-body" >
	            
	          <table class="table table-striped table-bordered table-hover">
	            	<tr>
	            		<td>
	  						<a href="http://www.presidencia.gov.py/archivos/documentos/DECRETO3361_o5xy3ffc.pdf">Decreto 3361 de la Presidencia de la República del Paraguay</a>
	  					</td>
	  					
	  					<td>
	  						POR EL CUAL SE ESTABLECEN LOS LINEAMIENTOS GENERALES PARA LOS PROCESOS DE PROGRAMACIÓN, FORMULACIÓN Y PRESENTACIÓN DE LOS ANTEPROYECTOS DE PRESUPUESTOS INSTITUCIONALES COMO MARCO DE REFERENCIA PARA LA ELABORACIÓN DEL PROYECTO DE PRESUPUESTO GENERAL DE LA NACIÓN CORRESPONDIENTE AL EJERCICIO FISCAL 2016 Y PARA LA PROGRAMACIÓN DEL PRESUPUESTO PLURIANUAL 2016-2018.
	  					</td>
	  				</tr>
			
	  			</table>
	  			
	            </div>
			   </div>
			</div>
     
     <!--             <div class="row">-->
	         <div class="col-md-12">
	          <div class="box" height="1000px">
	            <div class="box-header with-border" height="1000px">
	              <h3 class="box-title" id="tituloTipoPrograma">
	                Condiciones de Uso
	              </h3> 
	              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	              </div>
	            </div>
	            <div class="box-body" >
	            
	          <table class="table table-striped table-bordered table-hover">
	            	<tr>
	            		
	  					
	  					<td>
	  						
	  						
	  						Condiciones de Uso del Sistema de Planificación por Resultados:</br>
							<p align="justify"> 
							<OL>
							<LI>La cuenta de usuario es asignada para su uso exclusivo en los sistemas de información administrados por la DGTIC . Cualquier otro método de acceso (utilitarios SQL, ODBC, etc.) está prohibido, salvo que sea explicitamente autorizado.
							<LI>Queda prohibida la copia o divulgación por cualquier medio de la información accedida durante la utilización del usuario asignado, salvo que exista una autorización explícita de la DGTIC.
							<LI>Todo permiso que no esté explícitamente asignado al usuario, está prohibido.
							<LI>El usuario debe notificar a la DGTIC inexactitudes en la información contenida en los sistemas, así como violaciones a la seguridad que sean detectadas mediante la cuenta de correo soporte@stp.gov.py
							<LI>La DGTIC se reserva el derecho de revocar cualquier acceso sin previo aviso, en caso de que se detecte que la seguridad de la cuenta ha sido vulnerada.
							<LI>El Usuario está obligado a solicitar la baja de su cuenta de usuario, cuando ya no vaya a utilizar en sus funciones.
							<LI>La cuenta de usuario es personal, y la contraseña no debe ser compartida con otra/s persona/s.
							<LI>Las operaciones realizadas en la base de datos con la cuenta de usuario solicitada son de exclusiva responsabilidad del usuario.
							El solo ingreso a los sistemas administrados por la DGTIC, implica la aceptación de los presentes condiciones de Uso.
							</OL>
							</p>
	  					</td>
	  				</tr>
			
	  			</table>
	  			
	            </div>
			   </div>
			<!--</div>-->
        
          
          </div><!-- /.row -->
          
           <div class="row">
	         <div class="col-md-12">
	          <div class="box" height="1000px">
	            <div class="box-header with-border" height="1000px">
	              <h3 class="box-title" id="tituloTipoPrograma">
	                Datos de Contacto
	              </h3>
	              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	              </div>
	            </div>
	            <div class="box-body" >
	            <table class="table table-striped table-bordered table-hover">
	            	<tr>
	            		<td>Nombre</td>
	  					<td>Sebastian Codas</td>
	  				</tr>
	  				<tr>
	            		<td>Correo Electrónico</td>
	  					<td>scs@stp.gov.py</td>
	  				</tr>
	  				<tr>
	            		<td>Telef. Laboral</td>
	  					<td>+595 21 450422 #114</td>
	  				</tr>
	  				<tr>
	            		<td>Telef. Movil</td>
	  					<td>+595 982 511383 </td>
	  				</tr>
	  			</table> 
	            </div>
			   </div>
			</div>
          </div><!-- /.row -->
          <div class="row">
	         <div class="col-md-12">
	          <div class="box" height="1000px">
	            <div class="box-header with-border" height="1000px">
	              <h3 class="box-title" id="tituloTipoPrograma">
	                Procesos
	              </h3>
	              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	              </div>
	            </div>
	            <div class="box-body" >
	             <ul  class="col-md-12">
	             
	             
	             	<div class="row">
				         <div class="col-md-12">
				          <div class="box box-info" height="1000px">
				            <div class="box-header with-border" height="1000px">
				              <h3 class="box-title" id="tituloTipoPrograma">
				                Memoria Institucional
				              </h3>
				              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
				              </div>
				            </div>
				            <div class="box-body" >
				             <ul  class="col-md-12">
								<td><img alt="Imagen"  width="960"  height="540" src="/dist/img/doc/1.png" /></td> 
				  			  </ul>	
				            </div>
						   </div>
						</div>
			          </div><!-- /.row -->
	  				<div class="row">
				         <div class="col-md-12">
				          <div class="box box-info" height="1000px">
				            <div class="box-header with-border" height="1000px">
				              <h3 class="box-title" id="tituloTipoPrograma">
				                Estructura Programática
				              </h3>
				              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
				              </div>
				            </div>
				            <div class="box-body" >
				             <ul  class="col-md-12">
				            
								<tr><td><img alt="Imagen"  width="960"  height="540" src="/dist/img/doc/4.png" /></td>  </tr>
								<tr><td><img alt="Imagen"  width="960"  height="540" src="/dist/img/doc/5.png" /></td> </tr>
								<tr><td><img alt="Imagen"  width="960"  height="540" src="/dist/img/doc/6.png" /></td> </tr>
								<tr><td><img alt="Imagen"  width="960"  height="540" src="/dist/img/doc/7.png" /></td> </tr>
								<tr><td><img alt="Imagen"  width="960"  height="540" src="/dist/img/doc/29.png" /></td></tr>
				  			  </ul>	
				            </div>
						   </div>
						</div>
			          </div><!-- /.row -->
			          
			          <div class="row">
				         <div class="col-md-12">
				          <div class="box box-info" height="1000px">
				            <div class="box-header with-border" height="1000px">
				              <h3 class="box-title" id="tituloTipoPrograma">
				               Vinculación con el Plan Nacional de Desarrollo Paraguay 2030
				              </h3>
				              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
				              </div>
				            </div>
				            <div class="box-body" >
				             <ul  class="col-md-12">
								<tr><td><img alt="Imagen"  width="960"  height="540" src="/dist/img/doc/12.png" /></td></tr>
								
				  			  </ul>	
				            </div>
						   </div>
						</div>
			          </div><!-- /.row -->
			          
			          <div class="row">
				         <div class="col-md-12">
				          <div class="box box-info" height="1000px">
				            <div class="box-header with-border" height="1000px">
				              <h3 class="box-title" id="tituloTipoPrograma">
				               Planificación de Resultados
				              </h3>
				              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
				              </div>
				            </div>
				            <div class="box-body" >
				             <ul  class="col-md-12">
								<tr><td><img alt="Imagen"  width="960"  height="540" src="/dist/img/doc/44.png" /></td></tr>
				  			  </ul>	
				            </div>
						   </div>
						</div>
			          </div><!-- /.row -->
			          
					  <div class="row">
				         <div class="col-md-12">
				          <div class="box box-info" height="1000px">
				            <div class="box-header with-border" height="1000px">
				              <h3 class="box-title" id="tituloTipoPrograma">
				              	Programación de Productos
				              </h3>
				              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
				              </div>
				            </div>
				            <div class="box-body" >
				             <ul  class="col-md-12">
								<tr><td><img alt="Imagen"  width="960"  height="540" src="/dist/img/doc/30.png" /></td></tr>
								<tr><td><img alt="Imagen"  width="960"  height="540" src="/dist/img/doc/imagen.png" /></td></tr> 
				  			  </ul>	
				            </div>
						   </div>
						</div>
			          </div><!-- /.row -->
			          
			          
			          
			          
	  			  </ul>	
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
				<p>Favor Iniciar Sesion</p>
			<%  } %>
  </body>
</html>
