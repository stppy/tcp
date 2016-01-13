<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<div class="col-md-12">
          <div class="box" height="1000px">
            <div class="box-header with-border" height="1000px">
              <h3 class="box-title" id="tituloTipoPrograma">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                Estructura Programática
              </h3>
              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
              </div>
            </div>
            <div class="box-body" >
              <ul  class="col-md-12">
				<form class="form-horizontal" role="form" id="formulario">
					<input type="hidden"  id="anho" anho="2015" value="2015">
					<input type="hidden"  id="nivel_id" value="">
					<input type="hidden"  id="entidad_id" value="">
					<input type="hidden"  id="tipo_id" value="">
					<input type="hidden"  id="programa_id" value="">
					<input type="hidden"  id="subprograma_id" value="">
					<input type="hidden"  id="proyecto_id" value="">
					<input type="hidden"  id="nfprograma" value="">
					<input type="hidden"  id="nfsubprograma" value="">
					<input type="hidden"  id="nfproyecto" value="">
					
				
				                   
                   <div class="form-group">
                      <label>Unidad Responsable</label>
                        <select class="form-control" rows="3" placeholder="" nombre="unidad_responsable_id" ></select>
                    </div>
                     <div class="form-group">
                      <label>Funcional</label>
                       <select class="form-control" rows="3" placeholder="" nombre="funcional_id" ></select>
                    </div>
                    <div class="form-group">
                      <label>Diagnóstico</label>
                      <textarea class="form-control" rows="3" placeholder="" nombre="diagnostico"></textarea>
                    </div>
                    <div class="form-group">
                      <label>Resultado Esperado</label>
                      <textarea class="form-control" rows="3" placeholder="" nombre="diagnostico"></textarea>
                    </div>
                    <div class="form-group">
                      <label>Objetivo</label>
                      <textarea class="form-control" rows="3" placeholder="" nombre="diagnostico"></textarea>
                    </div>
                    <div class="form-group">
                      <label>Base Legal</label>
                      <textarea class="form-control" rows="3" placeholder="" nombre="diagnostico"></textarea>
                    </div>
                    <div class="form-group">
                      <label>Nombre</label>
                      <textarea class="form-control" rows="3" placeholder="" nombre="diagnostico"></textarea>
                    </div>
                    <div class="form-group">
                      <label>Abreviacion</label>
                      <textarea class="form-control" rows="3" placeholder="" nombre="diagnostico"></textarea>
                    </div>
                    <div class="form-group">
                      <label>Descripción</label>
                      <textarea class="form-control" rows="3" placeholder="" nombre="diagnostico"></textarea>
                    </div>
				
					<div class="box-footer">
                    	<button type="submit" class="btn btn-primary" id="guardar-proyecto">Guardar</button>
                    </div>

				</form>
			</ul>
	
	
</div>
					
					
					