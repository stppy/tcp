<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
				<form class="form-horizontal" role="form" id="formulario" action="http://spr.stp.gov.py/ajaxUpdate" method="post">
					<input type="hidden" name="anho" id="anho" anho="2015" value="2015">
					<input type="hidden" name="nivel"  id="nivel" anho="2015" value="">
					<input type="hidden" name="entidad"  id="entidad" anho="2015" value="">
					<input type="hidden" name="accion"  id="accion" name="accion" anho="2015" value="actEntidad">
					<div class="form-group">
					
                      <label>Nivel</label>
                      <input type="text" class="form-control" placeholder=""  value="" name="nivel2" id="nivel2">
                    </div>
                    
                    <div class="form-group">
                      <label>Entidad</label>
                      <input type="text" class="form-control" placeholder=""  value="" name="entidad2" id="entidad2">
                    </div>
                    
					<!-- <div class="form-group">
                      <label>Descripción</label>
                      <textarea class="form-control" rows="3" placeholder="" name="descripcion" id="descripcion" ></textarea>
                    </div>
                     -->
                     
                    <div class="form-group">
                      <label>Abreviación</label>
                      <input type="text" class="form-control" placeholder="" name="abrev" id="abrev" >
                    </div>
                    
                      <div class="form-group">
                      <label>Base Legal de creación</label>
                      <textarea class="form-control" rows="3" placeholder="" name="baseLegal" id="baseLegal" ></textarea>
                    </div>
                    
                    <div class="form-group">
                      <label>Misión</label>
                      <textarea class="form-control" rows="3" placeholder="" name="mision" id="mision" ></textarea>
                    </div>
                    
                    <div class="form-group">
                      <label>Visión</label>
                      <textarea class="form-control" rows="3" placeholder="" name="vision" id="vision" ></textarea>
                    </div>
                    
                    <div class="form-group">
                      <label>Diagnóstico General de la Institución</label>
                      <textarea class="form-control" rows="3" placeholder="" name="diagnostico" id="diagnostico" ></textarea>
                    </div>
                    
                    <div class="form-group">
                      <label>Objetivos Generales de la Institución</label>
                      <textarea class="form-control" rows="3" placeholder="" name="objetivo" id="objetivo" ></textarea>
                    </div>
                    
                     <div class="form-group">
                      <label>Principales políticas institucionales</label>
                      <textarea class="form-control" rows="3" placeholder="" name="politica" id="politica" ></textarea>
                    </div>
                    
                    <!-- <div class="form-group">
                      <label>Sigla</label>
                      <input type="text" class="form-control" placeholder="" name="sigla" id="sigla" >
                    </div> --> 
                    
                  
                  <div class="box-footer">
                    	<button type="submit" class="btn btn-primary" id="guardar-entidad">Guardar</button>
                    </div>

				</form>
