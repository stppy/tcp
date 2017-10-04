<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<section class="sidebar">
	<ul class="sidebar-menu">
	    <li class="header">Tablero</li>                                                
	    	<li class="treeview">
				<a href="#">
	   				<i class="fa fa-list-alt"></i> <span>Plan Operativo Institucional</span> <i class="fa fa-angle-left pull-right"></i>
	   			</a>
	   			<ul class="treeview-menu" style="display: none;">         			
	   			</ul>
			</li>
			<li class="treeview">
				<a href="#">
    				<i class="fa fa-tasks"></i> <span>Monitoreo de planes</span> <i class="fa fa-angle-left pull-right"></i>
    			</a>    			
    			<ul class="treeview-menu" style="display: none;">    			
					<li class=""><a href="/tablero/resumenLineaAccion.jsp"><i class="fa fa-dashboard" id="linkResumenLineaAccion"></i>Tablero de Control</a></li>
					<li class=""><a href="/tablero/geografico4.jsp"><i class="fa fa-map-marker" id="geografico4"></i>Geográfico</a></li>          			
    			</ul>
   			</li>  		
 			<li class="header">MÁS INFO</li>
            	<li><a href="/documentacion.jsp"><i class="fa fa-circle-o text-green"></i> <span>Acerca de Tablero de Control</span></a></li>
				<!-- >li><a href="https://nube.stp.gov.py/index.php/s/a6JRumfONc48ynV" target="_blank"><i class="fa fa-user" id="linkFichaSocial"></i><span>Ficha Social</span></a></li-->				
				<li><a href="/reporte_pnd.jsp"><i class="fa fa-circle-o text-green"></i> <span>Reporte PND</span></a></li>            	           	            	           	           
	</ul>
</section>
<!-- /.sidebar -->