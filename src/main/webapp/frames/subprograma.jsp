<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<div class="col-md-12">
          <div class="box" height="1000px">
            <div class="box-header with-border" height="1000px">
              <h3 class="box-title" id="tituloTipoPrograma">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                Subprograma
              </h3>
              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
              </div>
            </div>
            <div class="box-body" >
              <ul  class="col-md-12">
				<form class="form-horizontal" role="form" id="formulario">
					<input type="hidden"  id="anho" anho="2015" value="2015">
					<div class="form-group">
                      <label>Programa</label>
                       <select class="form-control" rows="3" placeholder="" nombre="programa_id" ></select>
                    </div>
                    <div class="form-group">
                      <label>Nombre</label>
                      <input type="text" class="form-control" placeholder="" disabled="" nombre="nombre" >
                    </div>
                    
					<div class="form-group">
                      <label>Descripción</label>
                       <input type="text" class="form-control" placeholder="" disabled="" nombre="descripcion"></textarea>
                    </div>
                    <div class="form-group">
                      <label>Abreviación</label>
                      <textarea class="form-control" rows="3" placeholder="" nombre="abrev"></textarea>
                    </div>
                    <div class="form-group">
                      <label>Programa Tipo de Presupuesto </label>
                       <select class="form-control" rows="3" placeholder="" nombre="programa_tipo_presupuesto_id" ></select>
                      
                    </div>
                     <div class="form-group">
                      <label>Programa Entidad Nivel</label>
                     
                       <select class="form-control" rows="3" placeholder="" nombre="programa_entidad_nivel_id" ></select>
                    </div>
                
                     <div class="form-group">
                      <label>Programa Entidad</label>
                      <select class="form-control" rows="3" placeholder="" nombre="programa_entidad_id" ></select>
                      	</div>
            
                 
                    <div class="form-group">
                      <label>Departamento</label>
                      <textarea class="form-control" rows="3" placeholder="" nombre="codigo_departamento"></textarea>
                    </div>
       
                    <div class="form-group">
                      <label>Objetivo</label>
                      <textarea class="form-control" rows="3" placeholder="" nombre="objetivo" nivel="" entidad=""></textarea>
               	    </div>
           			
                    
                  
                  
                    <div class="box-footer">
                    	<button type="submit" class="btn btn-primary" id="guardar-subprograma">Guardar</button>
                    </div>

				</form>
			</ul>
		</div>
	</div>
</div>
