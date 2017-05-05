<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
      <div class="col-md-12">
          <div class="box" height="1000px">
            <div class="box-header with-border" height="1000px">
              <h3 class="box-title" id="tituloTipoPrograma">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                Indicador
              </h3>
              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
              </div>
            </div>
            <div class="box-body" >
              <ul  class="col-md-12">
				<form class="form-horizontal" role="form" id="formulario">
					<input type="hidden"  name="objetivo_id" value="">
					<input type="hidden"  name="tipo_indicador_id" value="">
					<input type="hidden"  name="metodo_calculo_id" value="">
					<input type="hidden"  name="desagregacion_tipo_zona_geografica_id" value="">
					<input type="hidden"  name="tipo_demografica_id" value="">
					<input type="hidden"  name="fuente_verificacion_id" value="">
					<input type="hidden"  name="observaciones" value="">
					<input type="hidden"  name="descripcion" value="">
					<div class="form-group">
                      <label>Nombre</label>
                      <input type= "text" class="form-control" placeholder="" name="nombre">
                    </div>
                     <div class="form-group">
                      <label>Unidad de Medida</label>
                      <select class= "form-control" name="unidad_medida_id"></select>
                    </div>
                    <div class="form-group">
                      <label>Frecuencia (Meses)</label>
                      <input type="int" class="form-control" rows="3" placeholder="" name="frecuencia_meses">
                    </div>
                     <div class="form-group">
                      <label>Fuente Verificación</label>
                      <select class= "form-control" name="fuente_verificacion_id"></select>
                    </div>
                    <div class="form-group">
                      <label>Observaciones</label>
                      <input type= "text" class="form-control" placeholder="" name="observaciones">
                    </div>
                    
                    <div class="box-footer">
                    	<button type="submit" class="btn btn-warning" id="guardar-indicador">Agregar</button>
                    </div>
				</form>
			</ul>
		</div>
	</div>
</div>