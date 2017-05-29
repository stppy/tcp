<%@page import="org.springframework.security.core.userdetails.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
    <!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image"> 
				<!-- <img src="dist/img/2/Logo_STP.png" class="img-circle" alt="User Image" /> -->
				<img src="dist/img/2/user.png" class="img-circle" alt="User Image" /> 
            </div>
            <div class="pull-left info">
				<p id="nombreUsuario"></p>
				<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
			</div>
		</div>
          
		<!-- /.search form -->
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
            <li class="header">Tablero</li>
            
            <% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2") || attributes.get("role_id_tablero").toString().equals("3")){%>                        
		    	<li class="treeview">
					<a href="#">
		   				<i class="fa fa-list-alt"></i> <span>Plan Operativo Institucional</span> <i class="fa fa-angle-left pull-right"></i>
		   			</a>
		   			<ul class="treeview-menu" style="display: none;">
		   				<li class=""><a href="/entidad.jsp"><i class="fa fa-home" id="linkEntidad"></i>Perfil Institucional</a></li>
		        		<li class=""><a href="/programacion.jsp"><i class="fa fa-sitemap" id="linkEstructuraProgramatica"></i>Estructura Programática</a></li>
		        		<li class=""><a href="/producto.jsp"><i class="fa fa-edit" id="linkProgramacionProducto"></i>Programación de Productos</a></li>         			
		   			</ul>
				</li>
			<%}%>
			<li class="treeview">
				<a href="#">
    				<i class="fa fa-tasks"></i> <span>Monitoreo de planes</span> <i class="fa fa-angle-left pull-right"></i>
    			</a>
    			
    			<ul class="treeview-menu" style="display: none;">
    			<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>                        
    				<li class=""><a href="/tablero/contenedorInsLineaAccion.jsp"><i class="fa fa-wrench"></i>Carga y actualización</a></li>
    			<%}%>
         			<li class=""><a href="/tablero/reporte.jsp"><i class="fa fa-file" id="linkReportePa"></i>Reporte de Plan de Acción</a></li>
         			<li class=""><a href="/tablero/pivotPresupuesto.jsp"><i class="fa fa-signal" id="linkPivotPresupuesto"></i>Análisis de Productos</a></li>
					<li class=""><a href="/tablero/pivotDestinatario.jsp"><i class="fa fa-group" id="linkPivotDestinatario"></i>Análisis de Destinatarios</a></li>
					<li class=""><a href="/tablero/pivotProgramado.jsp"><i class="fa fa-calendar" id="linkPivotProgramacion"></i>Análisis de Programación</a></li>
					<li class=""><a href="/tablero/pivotCostoAvance.jsp"><i class="fa fa-money" id="linkPivotCostosAvances"></i>Análisis de Costos de Avances</a></li>
					<li class=""><a href="/tablero/pivotBeneficiarioAvance.jsp"><i class="fa fa-male" id="linkPivotBeneficiariosAvances"></i>Análisis de Beneficiarios de Avances</a></li>
					<li class=""><a href="/tablero/pivotEvidenciaAvance.jsp"><i class="fa fa-area-chart" id="linkPivotEvidenciasAvances"></i>Análisis de Evidencias de Avances</a></li>
					<li class=""><a href="/tablero/pivotAvance.jsp"><i class="fa fa-line-chart" id="linkPivotAvances"></i>Análisis de Avances</a></li>
					<li class=""><a href="/tablero/pivotPlanAccionAvances.jsp"><i class="fa fa-line-chart" id="linkPivotPlanAccionAvances"></i>Análisis de Programación y Avances</a></li>
					<li class=""><a href="/tablero/resumenLineaAccion.jsp"><i class="fa fa-dashboard" id="linkResumenLineaAccion"></i>Tablero de Control</a></li>
					<li class=""><a href="/tablero/descargarDocumentos.jsp"><i class="fa fa-cloud-download" id="linkDescargasConstancias"></i>Descargar Constancias</a></li>
					<li class=""><a href="/tablero/geografico4.jsp"><i class="fa fa-map-marker" id="geografico4"></i>Geográfico</a></li>
					<!-- li class=""><a href="javascript:imprimirAvancesInstitucion()"><i class="fa fa-cloud-download" id="linkGeneracionAvancesPorInstitucionPDF"></i>Descargar Avances Cualitativos de la Institución</a></li-->          			
    			</ul>
   			</li>
    			<!-- <li class="treeview">
    				<a href="http://spr.stp.gov.py/tablero/geografico4.jsp">
    					<i class="fa fa-globe"></i> <span>Geográfico</span> <i class="fa fa-angle-left pull-right"></i>
    				</a>
    			</li> -->
 			
 			<li class="treeview"><a href="#"><i class="fa fa-desktop"></i> <span>Reporte Ciudadano</span> <i class="fa fa-angle-left pull-right"></i></a></li>  		

 			<li class="header">MÁS INFO</li>
            	<li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Documentación</span></a></li>
<!--           	<li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Diccionario de Datos</span></a></li>
            	<li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Preguntas Frecuentes</span></a></li> --> 
            	<li><a href="/documentacion.jsp"><i class="fa fa-circle-o text-green"></i> <span>Acerca de Tablero de Control</span></a></li>
				<li><a href="https://nube.stp.gov.py/index.php/s/a6JRumfONc48ynV" target="_blank"><i class="fa fa-user" id="linkFichaSocial"></i><span>Ficha Social</span></a></li>
				<li><a href="/reporte_pnd.jsp"><i class="fa fa-circle-o text-green"></i> <span>Reporte PND</span></a></li>
            <% if (attributes.get("role_id_tablero").toString().equals("0")  && user.getName()!="parce@nandeparaguay.org"){%>	 
           	 <li class="header">ADMINISTRAR</li>
            	<li><a href="/indicadores.jsp"><i class="glyphicon glyphicon-info-sign text-red"></i> <span>Indicadores</span></a></li>
            	<li><a href="/objetivo.jsp"><i class="glyphicon glyphicon-flag text-yellow"></i> <span>Objetivos</span></a></li>
            	<li><a href="#"><i class="glyphicon glyphicon-flag text-green"></i> <span>Objetivos Sugeridos</span></a></li>
            	<li><a href="/usuarios.jsp"><i class="glyphicon glyphicon-user text-aqua"></i> <span>Usuarios</span></a></li>
           	<%}%>
            <!-- 
	            <li class="treeview"><a href=".#" id="programarPlan"><i class="fa fa-files-o"></i><span>Programar Plan de Accion</span></a></li>
	            <li class="treeview"><a href="#" id="vistaGeografica"><i class="fa fa-edit"></i> <span>Resumen</span></a></li>
	            <li class="treeview"><a href="#" id="vistaCiudadana"><i class="fa fa-edit"></i> <span>Reporte</span></a></li>
	            <li class="treeview"><a href="#"><i class="fa fa-dashboard"></i> <span>Documentación</span> <i class="fa fa-angle-left pull-right"></i></a><ul class="treeview-menu" style="display: none;"></ul></li> 	
 			-->
		</ul>
	</section>
        <!-- /.sidebar -->