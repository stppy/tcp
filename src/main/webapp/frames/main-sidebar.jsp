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
            
            <li class="treeview">
             <a href=".#" id="vistaInstitucional">
                <i class="fa fa-files-o"></i><span>Institucional</span>
              </a>
              
            </li>
             <li class="treeview">
             <a href=".#" id="vistaDepartamental">
                <i class="fa fa-files-o"></i><span>Departamental</span>
              </a>
              
            </li>
            
            <li class="treeview">
              <a href="#" id="vistaGeografica">
                <i class="fa fa-edit"></i> <span>Geografico</span>
              </a>
            </li>
            <li class="treeview">
              <a href="#" id="vistaCiudadana">
                <i class="fa fa-edit"></i> <span>Ciudadano</span>
              </a>
              
            </li>
            
            <li class="header">LABELS</li>
            <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Documentación</span></a></li>
            <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Diccionario de Datos</span></a></li>
            <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Preguntas Frecuentes</span></a></li>
          </ul>
        </section>
        <!-- /.sidebar -->