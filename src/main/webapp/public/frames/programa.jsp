<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
 <div class="col-md-12">
          <div class="box" height="1000px">
            <div class="box-header with-border" height="1000px">
              <h3 class="box-title" id="tituloTipoPrograma">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                Programa
              </h3>
              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
              </div>
            </div>
            <div class="box-body" >
              <ul  class="col-md-12">
				<form class="form-horizontal" role="form" id="formulario">
					<input type="hidden"  id="anho"  value="2015">
					<input type="hidden"  id="entidad_id" value="">
					<input type="hidden"  id="tipo_presupuesto_id" value="">
					
					
                    <div class="form-group">
                      <label>Nombre</label>
                      <input type="text" class="form-control" placeholder="" disabled="" nombre="nombre" >
                    </div>
					<div class="form-group">
                      <label>Descripción</label>
                      <textarea class="form-control" rows="3" placeholder="" nombre="descripcion" ></textarea>
                    </div>
                    <div class="form-group">
                      <label>Abreviación</label>
                      <input type="text" class="form-control" placeholder="" nombre="abrev" ></textarea>
                    </div>
                     <div class="form-group">
                      <label>Objetivo</label>
                      <input type="text" class="form-control" placeholder="" nombre="obv" ></textarea>
                    </div>
                      <div class="form-group">
                      <label>Diagnóstico</label>
                      <textarea class="form-control" rows="3" placeholder="" nombre="diagnostico" ></textarea>
                    </div>
                 
                      <div class="form-group">
                      <label>Base Legal</label>
                      <textarea class="form-control" rows="3" placeholder="" nombre="base_legal" ></textarea>
                    </div>
            
                    <div class="form-group">
                      <label>Resultado</label>
                      <textarea class="form-control" rows="3" placeholder="" nombre="resultado"></textarea>
                    </div>
                    <div class="form-group">
                      <label>Departamento</label>
                      <textarea class="form-control" rows="3" placeholder="" nombre="codigodedepartamento" ></textarea>
                    </div>
               
              		<div class="form-group">
                      <label>Tipo de Presupuesto</label>
                      <textarea class="form-control" rows="3" placeholder="" nombre="codigodedepartamento" ></textarea>
                    </div>
           			
              		<div class="form-group">
                      <label>Entidad</label>
                      <textarea class="form-control" rows="3" placeholder="" nombre="codigodedepartamento" ></textarea>
                    </div>
                    
                    <div class="form-group">
                      <label>Tipo de Presupuesto</label>
                      <select class="form-control" rows="3" placeholder="" nombre="tipo_presupuesto_id" ></select>
                    </div>
                    
                    <div class="form-group">
                      <label>Entidad</label>
                      <select class="form-control" rows="3" placeholder="" nombre="entidad_id" ></select>
                    </div>
           
              		<div class="form-group">
                      <label>Entidad_nivel</label>
                      <select class="form-control" rows="4" placeholder="" nombre="entidad_nivel_id" ></select>
                    </div>
           
           
                  
                  
                    <div class="box-footer">
                    	<button type="submit" class="btn btn-primary" id="guardar-programa">Guardar</button>
                    </div>

				</form>
			</ul>
		</div>
	</div>
</div>
