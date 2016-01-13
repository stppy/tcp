<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
      <div class="col-md-12">
          <div class="box" height="1000px">
            <div class="box-header with-border" height="1000px">
              <h3 class="box-title" id="tituloTipoPrograma">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                Proyecto
              </h3>
              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
              </div>
            </div>
            <div class="box-body" >
              <ul  class="col-md-12">
				<form class="form-horizontal" role="form" id="formulario">
					<input type="hidden"  id="anho" anho="2015" value="2015">
					<input type="hidden"  id="subprograma_id" value="">
				
				
                    <div class="form-group">
                      <label>Nombre</label>
                      
                         <textarea class="form-control" rows="3" placeholder="" nombre="nombre"></textarea>
                    </div>
         
                    
					<div class="form-group">
                      <label>Descripción</label>
                      <textarea class="form-control" rows="3" placeholder="" nombre="descripcion"></textarea>
                    </div>
                    
                    <div class="form-group">
                      <label>Abreviación</label>
                      <input type="text" class="form-control" placeholder="" nombre="abrev"></textarea>
                    </div>
                  
                     <div class="form-group">
                     <label>Subprograma</label>
                      <select class="form-control" rows="3" placeholder="" nombre="subprograma_id" ></select>
                    </div>
                    
                    
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
                      <textarea class="form-control" rows="3" placeholder="" nombre="resultado_esperado"></textarea>
                    </div>
                    
                    <div class="form-group">
                      <label>Departamento</label>
                      <textarea class="form-control" rows="3" placeholder="" nombre="codigo_departamento"></textarea>
                    </div>
                    
                    <div class="box-footer">
                    	<button type="submit" class="btn btn-primary" id="guardar-proyecto">Guardar</button>
                    </div>
              

				</form>
			</ul>
	
	
</div>
