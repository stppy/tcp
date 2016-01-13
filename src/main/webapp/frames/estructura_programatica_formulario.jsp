<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<div class="col-md-12">
          <div class="box" height="1000px">
            <div class="box-header with-border" height="1000px">
              <h3 class="box-title" id="estructuraProgramatica">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                Estructura Programática
              </h3>
              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
              </div>
            </div>
            <div class="box-body" >
              <ul  class="col-md-12">
				<form class="form-horizontal" role="form" id="formulario">
					<input type="hidden"  name="anho"		id="anho"  value="2015">
					<input type="hidden"  name="nivel"		id="nivel_id" value="">
					<input type="hidden"  name="entidad"	id="entidad" value="">
					<input type="hidden"  name="tipo"		id="tipo" value="">
					<input type="hidden"  name="programa"	id="programa" value="">
					<input type="hidden"  name="subprograma"id="subprograma" 	value="">
					<input type="hidden"  name="proyecto"	id="proyecto" value="">
					<input type="hidden"  name="nfprograma"	id="nfprograma" value="">
					<input type="hidden"  name="nfsubrpograma"id="nfsubprograma" value="">
					<input type="hidden"  name="nfproyecto"	id="nfproyecto" value="">               
                   <table class="table table-striped table-bordered  table-hover">
                   
                  <tr>
                    <td class="form-group">
                      <label>Nombre</label>
                      <textarea class="form-control" rows="3" placeholder="" name="diagnostico"></textarea>
                    </td>
                    </tr>
                    <tr>
                    <td class="form-group">
                      <label>Descripción</label>
                      <textarea class="form-control" rows="3" placeholder="" name="diagnostico"></textarea>
                    </td>
                    </tr>
                    <tr>
                    <td class="form-group">
                      <label>Abreviación</label>
                      <textarea class="form-control" rows="3" placeholder="" name="diagnostico"></textarea>
                    </td>
                    </tr>
                    <tr>
                    <td class="form-group">
                      <label>Base Legal</label>
                      <textarea class="form-control" rows="3" placeholder="" name="diagnostico"></textarea>
                    </td>
                    </tr>
                    
                    <tr>
                    	<td class="form-group">
                      	<label>ObjEstPND</label>
                      	</td> 
                      	<td>
                      	<a href="">VINCULAR </a>
                      	</td>
                    </tr>
                    
                    
                    <tr>
                    <td class="form-group">
                      <label>Diagnóstico</label>
                      <textarea class="form-control" rows="3" placeholder="" name="diagnostico"></textarea>
                    </td>
                    </tr>
                    <tr>
                    <td class="form-group">
                      <label>Objetivo</label>
                      <textarea class="form-control" rows="3" placeholder="" name="objetivo"></textarea>
                    </td>
                    </tr>
                    <tr>
                    <td class="form-group">
                      <label>Resultado Esperado</label>
                      <textarea class="form-control" rows="3" placeholder="" name="diagnostico"></textarea>
                    </td>
                    </tr>
                    <tr>
                    	<td class="form-group">
                     		<label>Unidad Responsable</label>
                        	<select class="form-control" rows="3"  name="unidad_responsable_id" ></select>
                    	</td>   
                    </tr>
                    <tr>
                     <td class="form-group">
                      <label>Funcional</label>
                       <select class="form-control" rows="3" placeholder="" name="funcional" ></select>
                    </td>
                    </tr>
                    
                   <tr>
                   		<td class="form-group">
                      		<label>Departamento</label>
                        	<select class="form-control"   name="departamento" ></select>
                    	</td>
                    </tr>

                                  
		
					<tr class="box-footer">
                    	<button type="submit" class="btn btn-primary" id="guardar-proyecto">Guardar</button>
                    </tr>

				</form>
			</ul>	
	</div>	
	</div>
</div>					