<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
        <!-- Create the tabs -->
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
          <!--  <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>  -->
          <li class="active"><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
        </ul>
        <!-- Tab panes -->
        
        <div class="tab-content">

          <!-- Settings tab content -->
          <div class="tab-pane active" id="control-sidebar-settings-tab">
            <form method="post">
              <h3 class="control-sidebar-heading">Configuraciones</h3>
              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Año
                  <select class="form-control pull-right" />
	                  <option>2016</option>
                  </select>
                  <p class="help-block">Seleccione el año a ser considerado por el sistema en las secciones de Plan Operativo Institucional y Plan de Acción </p>
                </label>
              </div><!-- /.form-group -->
              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Version
                  <select class="form-control pull-right" />
    	              <option>50</option>
                  </select>
                  <p class="help-block">Seleccione la version a ser considerado por el sistema en las secciones de Plan Operativo Institucional.</p>
                </label>
              </div><!-- /.form-group -->

            </form>
          </div><!-- /.tab-pane -->
        </div>