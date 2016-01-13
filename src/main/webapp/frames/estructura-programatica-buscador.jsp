 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
 <div class="col-md-12">
          <div class="box" height="1000px">
            <div class="box-header with-border" height="1000px">
              <h3 class="box-title" id="tituloTipoPrograma">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>Selector de Programa, Subprograma y Proyecto
              </h3>
              <div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
              </div>
            </div>
            <div class="box-body" >
              <ul  class="col-md-12">
				<form class="form-horizontal" role="form" id="formulario">
					<div class="form-group">
					<label for="nivel-formulario" class="col-lg-1 control-label" >Nivel:</label> 
				    	<div class="col-lg-2">
				    	<input type="text" name="nivel" id="nivel-formulario" placeholder="Nivel" list="listaf1c2" class="form-control" />
				    	</div>
				    	<label for="nivel-formulario" class="col-lg-3 control-label" id="f1c2"></label> 
				  	</div>
				
					<div class="form-group">
					<label for="nivel-formulario" class="col-lg-1 control-label" >Entidad:</label> 
				    	<div class="col-lg-2">
				    		<input type="text" name="entidad" id="entidad-formulario" placeholder="Entidad" list="listaf2c2" class="form-control" />
				    	</div>
				    	<label for="entidad-formulario" class="col-lg-3 control-label" id="f2c2"></label> 
				  	</div>
				
					<div class="form-group">
					<label for="nivel-formulario" class="col-lg-1 control-label" >Tipo de Programa:</label> 
				    	<div class="col-lg-2">
				    		<input type="text" name="tipoPrograma" id="tipoPrograma-formulario" placeholder="Tipo Programa" list="listaf3c2" class="form-control" />
				    	</div>
				    	<label for="tipoPrograma-formulario" class="col-lg-3 control-label" id="f3c2"></label> 
				  	</div>
				
					<div class="form-group">
					<label for="nivel-formulario" class="col-lg-1 control-label" >Programa:</label> 
				    	<div class="col-lg-2">
				    		<input type="text" name="programa" id="programa-formulario" placeholder="Programa" list="listaf4c2" class="form-control" />
				    	</div>
				    	<label for="programa-formulario" class="col-lg-3 control-label" id="f4c2"></label> 
				  	</div>
				
					<div class="form-group">
					<label for="nivel-formulario" class="col-lg-1 control-label" >Subprograma:</label> 
				    	<div class="col-lg-2">
				    		<input type="text" name="subPrograma" id="subPrograma-formulario" placeholder="SubPrograma" list="listaf5c2" class="form-control" />
				    	</div>
				    	<label for="subPrograma-formulario" class="col-lg-3 control-label" id="f5c2"></label> 
				  	</div>
				
					<div class="form-group">
					<label for="nivel-formulario" class="col-lg-1 control-label" >Proyecto:</label> 
				    	<div class="col-lg-2">
				    		<input type="text" name="proyecto" id="proyecto-formulario" placeholder="Proyecto" list="listaf6c2" class="form-control" />
				    	</div>
				    	<label for="proyecto-formulario" class="col-lg-3 control-label" id="f6c2"></label> 
				  	</div>
				
				</form>
			</ul>
		</div>
	</div>
</div>