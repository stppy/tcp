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
            
            	<% if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("2")){%>                        
		    	<li class="treeview">
					<a href="#">
		   				<i class="fa fa-list-alt"></i> <span>Plan Operativo Institucional</span> <i class="fa fa-angle-left pull-right"></i>
		   			</a>
		   			<ul class="treeview-menu" style="display: none;">
		   				<li><a href="http://spr.stp.gov.py/entidad.jsp"><i class="fa fa-home" id="linkEntidad"></i>Entidad</a></li>
		        			<li class=""><a href="http://spr.stp.gov.py/programacion.jsp"><i class="fa fa-sitemap" id="linkEstructuraProgramatica"></i>Estructura Programática</a></li>
		        			<li class=""><a href="http://spr.stp.gov.py/producto.jsp"><i class="fa fa-edit" id="linkProgramacionProducto"></i>Programación de Productos</a></li>         			
		   			</ul>
				</li>
			<%}%>
			<li class="treeview">
				<a href="#">
    				<i class="fa fa-tasks"></i> <span>Plan de Acción</span> <i class="fa fa-angle-left pull-right"></i>
    			</a>
    			<ul class="treeview-menu" style="display: none;">
    			<% if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("2")){%>                        
    				<li><a href="http://spr.stp.gov.py/tablero/contenedorInsLineaAccion.jsp"><i class="fa fa-wrench"></i>Elaboración de Plan de Acción</a></li>
    			<%}%>
         			<li class=""><a href="http://spr.stp.gov.py/tablero/reporte.jsp"><i class="fa fa-file" id="linkReportePa"></i>Reporte de Plan de Acción</a></li>
         			<li class=""><a href="http://spr.stp.gov.py/tablero/pivotPresupuesto.jsp"><i class="fa fa-signal" id="linkPivotPresupuesto"></i>Análisis de Productos</a></li>
					<li class=""><a href="http://spr.stp.gov.py/tablero/pivotDestinatario.jsp"><i class="fa fa-group" id="linkPivotDestinatario"></i>Análisis de Destinatarios</a></li>
					<li class=""><a href="http://spr.stp.gov.py/tablero/pivotProgramado.jsp"><i class="fa fa-calendar" id="linkPivotProgramacion"></i>Análisis de Programación</a></li>
					<li class=""><a href="http://spr.stp.gov.py/tablero/pivotAvance.jsp"><i class="fa fa-line-chart" id="linkPivotAvances"></i>Análisis de Avances</a></li>
					<li class=""><a href="http://spr.stp.gov.py/tablero/resumenLineaAccion.jsp"><i class="fa fa-dashboard" id="linkResumenLineaAccion"></i>Tablero de Control</a></li>
					<li class=""><a href="http://spr.stp.gov.py/tablero/descargasConstancias.jsp"><i class="fa fa-cloud-download" id="linkDescargasConstancias"></i>Descargar Constancias</a></li>          			
    			</ul>
 			</li>
 			
 			  <li class="treeview">
				<a href="#">
    				<i class="fa fa-desktop"></i> <span>Reporte Ciudadano</span> <i class="fa fa-angle-left pull-right"></i>
    			</a>
 			</li>  		
 			<li class="header">LABELS</li>
            <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Documentación</span></a></li>
            <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Diccionario de Datos</span></a></li>
            <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Preguntas Frecuentes</span></a></li>
            <!-- 
            <li class="treeview">
             <a href=".#" id="programarPlan">
                <i class="fa fa-files-o"></i><span>Programar Plan de Accion</span>
              </a>
              
            </li>
         
            <li class="treeview">
              <a href="#" id="vistaGeografica">
                <i class="fa fa-edit"></i> <span>Resumen</span>
              </a>
            </li>
            <li class="treeview">
              <a href="#" id="vistaCiudadana">
                <i class="fa fa-edit"></i> <span>Reporte</span>
              </a>
              
            </li>
             
 			
            <li class="treeview">
				<a href="#">
    				<i class="fa fa-dashboard"></i> <span>Documentación</span> <i class="fa fa-angle-left pull-right"></i>
    			</a>
    			<ul class="treeview-menu" style="display: none;">
    			</ul>
 			</li> 	
 			-->
          			
 			
          </ul>
        </section>
        <!-- /.sidebar -->