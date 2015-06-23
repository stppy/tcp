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
            <li class="header">PROGRAMACIÓN</li>
            <li class="treeview">
              <a href="#" id="listarEntidades">
                <i class="fa fa-dashboard"></i> <span>Entidad</span> <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu" id="listaEntidades" atyle="display: none;">
              </ul>
            </li>
            <li class="treeview">
             <a href=".#" id="listarProgramacion">
                <i class="fa fa-files-o"></i>
                <span>Estructura Programática</span>
                <span class="label label-primary pull-right">4</span>
              </a>
              <ul class="treeview-menu" id="listaProgramacion">
                
              </ul>
            </li>
            <!-- <li class="treeview">
            	<a href="/estructura-programatica.jsp">
            	<i class="fa fa-book"></i> <span>Modificación de Estructura Programática</span></a></li>
           <li class="treeview">
               <a href="/pnd.jsp" id="listarPnd">
                <i class="fa fa-folder"></i> <span>Vinculación PND</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
            </li> -->
            
            <li class="treeview">
              <a href="#" id="listarProductos">
                <i class="fa fa-edit"></i> <span>Programación de Productos</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
              </ul>
            </li>
            
            <li class="header">LABELS</li>
            <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Documentación</span></a></li>
            <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Diccionario de Datos</span></a></li>
            <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Preguntas Frecuentes</span></a></li>
          </ul>
        </section>
        <!-- /.sidebar -->