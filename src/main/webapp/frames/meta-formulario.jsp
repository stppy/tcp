<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<div class="col-md-12">
          <div class="box" height="1000px">
            <div class="box-header with-border" height="1000px">
              <h3 class="box-title" id="tituloTipoPrograma">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                Meta
              </h3>
              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
              </div>
            </div>
            <div class="box-body" >
              <ul  class="col-md-12">
				<form class="form-horizontal" role="form" id="formulario">
					<input type="hidden"  id="indicador_id" value="">
					<div class="form-group">
                      <label>Cantidad</label>
                      <input type="text" class="form-control" placeholder="" nombre="cantidad">
                    </div>
                    <div class="form-group">
                      <label>Vencimiento</label>
                      <input type="text" class="form-control" placeholder="" nombre="vencimiento">
                    </div>
					<div class="form-group">
                      <label>Indicador</label>
                      <select class= "form-control" nombre="indicador_id"></select>
                    </div>
                    <div class="form-group">
                      <label>Zona Geogr�fica</label>
                      <select class= "form-control" nombre="zona_geografica_id"></select>
                    </div>
                     <div class="form-group">
                      <label>Demograf�a</label>
                      <select class= "form-control" nombre="demografia-id"></select>
                    </div>
                                        
                    <div class="box-footer">
                    	<button type="submit" class="btn btn-primary" id="guardar-meta">Guardar</button>
                    </div>

				</form>
			</ul>
		</div>
	</div>
</div>