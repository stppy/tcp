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
	   				<li><a href="/public/reporte_pnd.jsp"><i class="fa fa-bar-chart-o"></i> <span>Reporte PND</span></a></li>         			
	   			</ul>
			</li>
			<li class="treeview">
				<a href="#">
    				<i class="fa fa-tasks"></i> <span>Monitoreo de planes</span> <i class="fa fa-angle-left pull-right"></i>
    			</a>    			
    			<ul class="treeview-menu" style="display: none;">    			
					<li class=""><a href="/tablero/public/resumenLineaAccion.jsp"><i class="fa fa-dashboard" id="linkResumenLineaAccion"></i>Tablero de Control</a></li>
					<li class=""><a href="/tablero/public/geografico4.jsp"><i class="fa fa-map-marker" id="geografico4"></i>Geográfico</a></li>          			
    			</ul>
   			</li>  		            													            	           	            	           	           
	</ul>
</section>
<!-- /.sidebar -->