<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
        <!-- Logo -->
        <a href="index.jsp" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><b>t</b>cp</span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><b>tcp</b>STP</span>
        </a>

        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" id="sideBar" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a>
          <!-- Navbar Right Menu -->
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">

              <li class="dropdown user user-menu">
                <a id="user-menu" href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                 <img src="dist/img/2/user.png" class="user-image" alt="User Image"/>
                 
                  <span id="PerfilUsuario" class="hidden-xs"></span>
                </a>
                <ul class="dropdown-menu">
                  <!-- User image -->
                  <li class="user-header">
                     <img src="dist/img/2/user.png" class="img-circle" alt="User Image"/>
                     <p id="PerfilUsuario2"></p>
                   <p> 
                    <span id="PerfilNombre" class="hidden-xs"></span>
                      <small><span id="PerfilEntidad" class="hidden-xs"></span></small>
                    </p>
                  </li>
                  <!-- Menu Body 
                  <li class="user-body">
                    <div class="col-xs-4 text-center">
                      <a href="#">Followers</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Sales</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Friends</a>
                    </div>
                  </li>-->
                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <div class="pull-left">
                      <!--  Modal para cambio de contraseña -->                      
                      	 <button id="launchPass" type="button" class="btn btn-default btn-flat btnPass" data-toggle="modal" data-target="#pass_modal">Cambiar Clave</button>
                    </div>
                    
                    <div class="pull-right">
                      <a href="https://login.stp.gov.py/cas/logout" class="btn btn-default btn-flat">Salir</a>
                    </div>
                  </li>
                </ul>
              </li>
              <!-- Control Sidebar Toggle Button -->
              <li>
                <a href="#"  id="sideBar2" data-toggle="control-sidebar"><i class="fa fa-outdent"></i></a>
              </li>
            </ul>
          </div>
         <div class="navbar-custom-menu">
          	<div style="padding-top:5px">.</div>
          <!-- 	<input id="ex12c" type="text"/> -->
           </div> 

        </nav>