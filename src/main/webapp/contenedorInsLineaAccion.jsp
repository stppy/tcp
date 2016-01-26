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

	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrapslider.css" rel="stylesheet">	
	<script src="http://www.jqueryscript.net/demo/Create-Step-By-Step-Modal-with-jQuery-Bootstrap/src/jquery-bootstrap-modal-steps.js"></script>
	
	<script src="http://www.jqueryscript.net/demo/Create-Step-By-Step-Modal-with-jQuery-Bootstrap/src/jquery-bootstrap-modal-steps.js"></script>
	
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

<% AttributePrincipal user = (AttributePrincipal) request.getUserPrincipal();%>
<% Map attributes = user.getAttributes(); 
if (user != null) { %>

<script>
	
	$(document).ready(function(){
		
	
		
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
		
		var insLineaAccion = $.ajax({
			url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getInsLineaAccion',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;		
		insLineaAccion=JSON.parse(insLineaAccion);
		
		var lineaAccion = $.ajax({
			url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getLineaAccion',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		lineaAccion = JSON.parse(lineaAccion);
		
		var institucion = $.ajax({
			url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getInstitucion',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		institucion = JSON.parse(institucion);
		
		var periodo = $.ajax({
			url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getPeriodo',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		periodo = JSON.parse(periodo);

		
		renderInsLineaAccion();
		function renderInsLineaAccion(){
			
		$('.box-body').html('');
		var tablaInsLineaAccion="";
		tablaInsLineaAccion = 	'<div class="table-responsive">'+
								'<table class="table table-hover">'+
								  '<tr class="active"><td colspan="9">Linea de Acción por Institución</td></tr>'+
								  '<tr class="active"><td>Id</td><td>Linea de Acción</td><td>Institución</td><td>Periodo</td><td>Meta</td><td>Estado</td><td>Editar</td><td>Borrar</td><td>Acción</td></tr>';
								  
	 	var bandLineaAccion;
	 	var bandInstitucion;
	 	var bandPeriodo;
		for(var w=0; w<insLineaAccion.length;w++)
		{
		 	bandLineaAccion = 0;
		 	bandInstitucion = 0;
		 	bandPeriodo = 0;
			
			if(insLineaAccion[w].borrado == true){
				tablaInsLineaAccion+='<tr><td><del>'+insLineaAccion[w].id+'</del></td>';
			}else{
				tablaInsLineaAccion+='<tr><td>'+insLineaAccion[w].id+'</td>';	
			}
		
			
			for(i = 0;i<lineaAccion.length; i++){				
				if(insLineaAccion[w].lineaAccionId == lineaAccion[i].id)
				{
					if(insLineaAccion[w].borrado == true){
						tablaInsLineaAccion+='<td><del>'+lineaAccion[i].nombre+'</del></td>';
					}else{
						tablaInsLineaAccion+='<td>'+lineaAccion[i].nombre+'</td>';	
					}
					bandLineaAccion = 1;
				}
			}
			
			if(bandLineaAccion == 0)
			{
				tablaInsLineaAccion+='<td>'+insLineaAccion[w].lineaAccionId+'</td>';
			}
						
			for(m = 0;m<institucion.length; m++){
				if(insLineaAccion[w].institucionId == institucion[m].id)
				{
					if(insLineaAccion[w].borrado == true){
						tablaInsLineaAccion+='<td><del>'+institucion[m].sigla+'</del></td>';
					}else{
						tablaInsLineaAccion+='<td>'+institucion[m].sigla+'</td>';	
					}
					bandInstitucion = 1;
				}
			}
			
			if(bandInstitucion == 0)
			{
				tablaInsLineaAccion+='<td>'+insLineaAccion[w].institucionId+'</td>';
			}
						
			for(p = 0;p<periodo.length; p++)
			{
				if(insLineaAccion[w].periodoId == periodo[p].id)
				{
					if(insLineaAccion[w].borrado == true){
						tablaInsLineaAccion+='<td><del>'+periodo[p].nombre+'</del></td>';
					}else{
						tablaInsLineaAccion+='<td>'+periodo[p].nombre+'</td>';	
					}
					bandPeriodo = 1;
				}
			}
			
			if(bandPeriodo == 0)
			{
				tablaInsLineaAccion+='<td>'+insLineaAccion[w].periodoId+'</td>';
			}
			
			if(insLineaAccion[w].borrado == true){
				tablaInsLineaAccion+='<td><del>'+insLineaAccion[w].meta+'</del></td><td><del>'+insLineaAccion[w].borrado+'</del></td><td><span class="glyphicon glyphicon-pencil registrosInsLineaAccion" codigoRegistroInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'-'+insLineaAccion[w].meta+'-'+insLineaAccion[w].version+'></span></td><td><span class="glyphicon glyphicon-trash" parametrosBorradoInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].borrado+' id="iconoBorradoInsLineaAccion"></span></td><td><span class="glyphicon glyphicon-list-alt" parametrosAccionInsLineaAccion="'+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'"></span></td></tr>';
			}else{
				tablaInsLineaAccion+='<td>'+insLineaAccion[w].meta+'</td><td>'+insLineaAccion[w].borrado+'</td><td><span class="glyphicon glyphicon-pencil registrosInsLineaAccion" codigoRegistroInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'-'+insLineaAccion[w].meta+'-'+insLineaAccion[w].version+'></span></td><td><span class="glyphicon glyphicon-trash" parametrosBorradoInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].borrado+' id="iconoBorradoInsLineaAccion"></span></td><td><span class="glyphicon glyphicon-list-alt agregarAccion2" parametrosAccionInsLineaAccion="'+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'"></span></td></tr>';	
			}
			
		}
		
		
		tablaInsLineaAccion +='<tr><td colspan="9"></td></tr>';
		tablaInsLineaAccion +='</table></div>';				
		
		$('.box-body').html(tablaInsLineaAccion);
		
		}
		
		
		
		
		 
		
	});
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
	          <div class="box" >
	            <div class="box-header with-border">
	              <h2 class="box-title text-center" id="tituloTipoPrograma">
	                Contenedor InsLineaAcción	
	              </h2>
	              <div class="box-tools pull-right"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	              </div>
	            </div>
	            <div class="box-body" style="height:600px; overflow: auto; display: block;">
	            
	            
	            </div>
	             <div class="box-footer" style="height:600px; overflow: auto; display: block;">
	             	<button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#insLineaAccion">Agregar Linea de Acción</button>
	             </div>
			   </div>
			</div>
          </div><!-- /.row -->
          


            
    </section><!-- /.content -->
    
    <div class="modal fade" id="modalAgregarAccion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg" style="width:90%">				      						<tr><th></th><th></th><th></th><th></th><th></th><th>Meta1</th><th>Meta2</th><th>Meta3</th><th>Meta4</th><th></th><th></th><th></th></tr>
		  
		   <div class="modal-content">
		      <div class="modal-header">
		        <h4 class="js-title-step"></h4>
		      </div>
		      <div class="modal-body">
		        <div class="row" data-step="1" data-title="Agregar Acción">
		          <div class="well">
				      	<div class="row">
				      		<div class="col-md-12">
			      				<div class="table-responsive">
									<table class="table table-hover">
				      					<thead>
				      						<tr><th rowspan="2" class="text-center">Depto</th><th rowspan="2" class="text-center">Distrito</th><th rowspan="2" class="text-center">FechaInicio</th><th rowspan="2" class="text-center">FechaFin</th><th rowspan="2" class="text-center">Costo</th><th colspan="4" class="text-center">Metas</th><th rowspan="2" class="text-center">Contribución</th><th rowspan="2" class="text-center">Versión</th></tr>
				      						<tr><th class="text-center">1er Trimestre</th><th class="text-center">2do Trimestre</th><th class="text-center">3er Trimestre</th><th class="text-center">4to Trimestre</th></tr>
				      					</thead>
				      					<tbody id="tablaAcciones">
				      					
				      					</tbody>
				      				</table>
				      			</div>
				      		</div>
				      	</div>		          
			 		<form role="form">
						<div class="table-responsive">
							<table class="table table-hover">
								<tbody>
									<input type="hidden" value="3" id="versionAccion">
									<tr><td><div class="form-group"><label for="nombreAccion">Acción</label><select id="selectorAccion" name="accion" class="form-control">'+optionAccionCatalogo+'</select></div></td><td><div class="form-group"><label for="umedida">U. medida</label><select id="selectorUnidadMedida" class="form-control">'+optionUnidadMedida+'</select></div></td></tr>
									<tr><td><div class="form-group"><label for="departamento">Departamento</label><select id="selectorDepartamento" name="departamento" class="form-control">'+optionDepartamentos+'</select></div></td><td><div class="form-group"><label for="distrito">Distrito</label><select name="departamento" class="form-control" id="distritosDepartamento"></select></div></td></tr>
								</tbody>
							</table>
						</div>
					</form>
		          </div>
		        </div>
		        <div class="row hide" data-step="2" data-title="Planificar Metas">
		          <div class="well">
		  			   	<div class="row">
		 					<div class="form-group col-md-3">
		 						<label for="totalFinanciero-formulario">Primer Trimestre</label>
		  						<div class="input-group input-group-sm">     			
						    				<input type="text" name="primerTrimestre" id="primerTrimestre-formulario" value="" class="form-control">
		  						</div>
							</div>
							    		
		  					<div class="form-group col-md-3">
		  					<label for="totalFinanciero-formulario">Segundo Trimestre</label>
		   					<div class="input-group input-group-sm">
							    			<input type="text" name="segundoTrimestre" id="segundoTrimestre-formulario" value="" class="form-control">
		   					</div>
						    </div>
			    		
		  					<div class="form-group col-md-3">
		 					<label for="totalFinanciero-formulario">Tercer Trimestre</label>
		   					<div class="input-group input-group-sm">
							   <input type="text" name="tercerTrimestre" id="tercerTrimestre-formulario" value="" class="form-control">
		   					</div>
			    			</div>
		 					    <div class="form-group col-md-3">
									<label for="totalFinanciero-formulario">Cuarto Trimestre</label>
		  						<div class="input-group input-group-sm">
			    				<input type="text" name="cuartoTrimestre" id="cuartoTrimestre-formulario" value="" class="form-control">
		  						</div>
		   					</div>
						</div>
					      			       
		          </div>
		        </div>
		        	                
		        <div class="row hide" data-step="3" data-title="Vinculación de Productos de la Acción">
		          <div class="well">
			 		 <form role="form">
						<div class="table-responsive">
							<table class="table table-hover">
								<tbody>
									<tr><td>Acción</td><td>Entidad</td><td>Programa</td><td>Sub Programa</td><td>Proyecto</td><td>Producto</td><td>Total Fisico</td><td>U. Medida</td><td>Clase</td><td>Total Financiero</td><td>Asignación Financiera</td><td>Destinatarios</td></tr>								
									<tr>
				 						<td><input type="text" name="accionStep" id="accionStep" value="" class="form-control"></td>
										<td><input type="text" name="entidadStep" id="entidadStep" value="" class="form-control"></td>
					    				<td><input type="text" name="programaStep" id="programaStep" value="" class="form-control"></td>
					    				<td><input type="text" name="subProgramaStep" id="subProgramaStep" value="" class="form-control"></td>
										<td><input type="text" name="proyectoStep" id="proyectoStep" value="" class="form-control"></td>
										<td><input type="text" name="productoStep" id="productoStep" value="" class="form-control"></td>
					    				<td><input type="text" name="totalFisicoStep" id="totalFisicoStep" value="" class="form-control"></td>
					    				<td><input type="text" name="unidadMedidaStep" id="unidadMedidaStep" value="" class="form-control"></td>
										<td><input type="text" name="claseSetp" id="claseStep" value="" class="form-control"></td>
										<td><input type="text" name="totalFinancieroStep" id="totalFinancieroStep" value="" class="form-control"></td>    
					    				<td><input type="text" name="asignacionFinancieraStep" id="asignacionFinancieraStep" value="" class="form-control"></td>
					    				<td><input type="text" name="destinatariosStep" id="destinatariosStep" value="" class="form-control"></td>
				   					</tr>
				   			  </tbody>
				   		  </table>
				   		  </div>
				   	</form>
				   	<br>
				   	<br>
				   					<div id="tituloFormulario"></div>
				      					<form class="form-horizontal" role="form" id="formulario" method="post" action="/ajaxUpdate">
				      						<input type="hidden" name="accion" value="actEntidad">
				      						<input type="hidden" name="anho" value="" id="anhoProducto-formulario">
				      						<input type="hidden" name="version" value="" id="versionProducto-formulario">
											<div class="row">
					      						<div class="form-group col-md-1">
					      							<input type="text" name="nivel" id="nivel-formulario" value="12" class="form-control" disabled>
					      						</div>
					      						<div class="form-group col-md-1">
					  								<input type="text" name="entidad" id="entidad-formulario" value="1" class="form-control" disabled>
					  							</div>
					      					    <div class="form-group col-md-1">
					      					    	<input type="text" name="tipoPrograma" id="tipoPrograma-formulario" placeholder="Tipo Programa" list="listaf3c2" class="form-control">
					      					    </div>
					      					    <div class="form-group col-md-1">
					      					    	<input type="text" name="programa" id="programa-formulario" placeholder="Programa" list="listaf4c2" class="form-control">
					      					    </div>
					      					    <div class="form-group col-md-1">
					      					    	<input type="text" name="subPrograma" id="subPrograma-formulario" placeholder="SubPrograma" list="listaf5c2" class="form-control">
					      					    </div>
					      					    <div class="form-group col-md-2">
					      					    	<input type="text" name="proyecto" id="proyecto-formulario" placeholder="Proyecto" list="listaf6c2" class="form-control">
					      					    </div>
					  					    	<div class="form-group col-md-2">
					  					    		<input type="text" name="producto" id="producto-formulario" placeholder="Producto" list="listaf7c2" class="form-control">
					      					  	</div>
					  					    	<div class="form-group col-md-3">
						      						<div class="input-group input-group-md">
						      							<span class="input-group-addon">Gs</span>
			      					    				<input type="text" name="total" id="total-formulario" value="" class="form-control">
			      					                    <div class="input-group-btn">
				      					                	<button type="submit" class="btn btn-success guardarComboProducto" parametros='+institucionId+'-'+lineaAccionId+'-'+idDepartamento+'-'+idDistrito+'-'+accionId+'><span class="glyphicon glyphicon-plus"></span></button>
				      					                </div>			      					    				
			      					    			</div>
					  					    	</div>	
					  					    </div>
				      					</form>		
				  </div>															      			       
				</div>
		        
		        		        		        	        
		        <div class="row hide" data-step="4" data-title="Declarar Hito">
		          <div class="well">
		  			   	<div class="row">
		 					<div class="form-group col-md-3">
		 						<label for="accion2">Acción</label>
		  						<div class="input-group input-group-sm">     			
						    				<input type="text" name="accionStep2" id="accionStep2" value="" class="form-control">
		  						</div>
							</div>
							    		
		  					<div class="form-group col-md-3">
		  					<label for="departamento">Departamento</label>
		   					<div class="input-group input-group-sm">
							    			<input type="text" name="departamentoStep" id="departamentoStep" value="" class="form-control">
		   					</div>
						    </div>
			    		
		  					<div class="form-group col-md-3">
		 					<label for="distrito">Distrito</label>
		   					<div class="input-group input-group-sm">
							   <input type="text" name="distritoStep" id="distritoStep" value="" class="form-control">
		   					</div>
			    			</div>
		 					    <div class="form-group col-md-3">
									<label for="unidadMedida2">U. Medida</label>
		  						<div class="input-group input-group-sm">
			    				<input type="text" name="unidadMedidaStep2" id="unidadMedidaStep2" value="" class="form-control">
		  						</div>
		   					</div>
						</div>
						
		  			   	<div class="row">
		 					<div class="form-group col-md-3">
		 						<label for="cantidadProgramada">Cantidad Programada</label>
		  						<div class="input-group input-group-sm">     			
						    				<input type="text" name="cantProgramadaStep" id="cantProgramadaStep" value="" class="form-control">
		  						</div>
							</div>
							    		
		  					<div class="form-group col-md-3">
		  					<label for="fechaTerminacion">Fecha Terminación</label>
		   					<div class="input-group input-group-sm">
							    			<input type="text" name="fechaTerminacionStep" id="fechaTerminacionStep" value="" class="form-control">
		   					</div>
						    </div>
			    		
		  					<div class="form-group col-md-3">
		 					<label for="porcentajeProgramado">% Programado</label>
		   					<div class="input-group input-group-sm">
							   <input type="text" name="porcentajeProgramadoStep" id="porcentajeProgramadoStep" value="" class="form-control">
		   					</div>
			    			</div>
						</div>											    			       
		          </div>
		        </div>			        
 
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default js-btn-step pull-left" data-orientation="cancel" data-dismiss="modal">Cancelar</button>
		        <button type="button" class="btn btn-warning js-btn-step" data-orientation="previous">Prev.</button>
		        <button type="button" class="btn btn-success js-btn-step" data-orientation="next">Sig.</button>
		      </div>
		    </div>
		  </div>
		</div>
    
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

    <!-- jQuery 2.1.3 
    <script src="plugins/jQuery/jQuery-2.1.3.min.js"></script> -->
    <!-- Bootstrap 3.3.2 JS -->
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- DATA TABES SCRIPT -->
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
     <!-- AdminLTE App -->
    <script src="dist/js/app.min.js" type="text/javascript"></script>   
    
    


    <!-- Librerias para la rutina de cambio de contraseña -->
    <script src="dist/js/jquerymd5.js" type="text/javascript"></script>    	
    <%@ include file="/frames/pass.jsp" %>
    <%@ include file="/frames/insLineaAccion.jsp" %>
    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js" type="text/javascript"></script>
        <%  } else { %>
				est<p>Favor Iniciar Sesion</p>
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
    
    </script>
  </body>
</html>
