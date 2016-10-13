<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<div class="col-md-12">
          <div class="box" height="1000px">
            <div class="box-header with-border" height="1000px">
              <h3 class="box-title" id="tituloTipoPrograma">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                Objetivo
              </h3>
              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
              </div>
            </div>
            <div class="box-body" >
              <ul  class="col-md-12">
				<form class="form-horizontal" role="form" id="formulario">
					<input type="hidden"  id="objetivo_id" value="">
					<div class="form-group">
                      <label>Nombre</label>
                      <input type="text" class="form-control" placeholder="" nombre="nombre">
                    </div>
                    <div class="form-group">
                      <label>Diagnostico</label>
                      <input type="text" class="form-control" placeholder="" nombre="diagnostico">
                    </div>
					<div class="form-group">
                      <label>Tipo Objetivo</label>
                      <select class= "form-control" nombre="tipo_objetivo_id"></select>
                    </div>
                    
                    
                                        
                    <div class="box-footer">
                    	<button type="submit" class="btn btn-primary" id="guardar-objetivo">Guardar</button>
                    </div>

				</form>
			</ul>
		</div>
	</div>
</div>