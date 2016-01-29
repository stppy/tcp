<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<div class="col-md-12">
	<div class="box collapsed-box" height="1000px">
		<div class="box-header with-border" height="1000px">
			<h3 class="box-title" id="crearProductoForm">
				<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>Agregue un producto a la programaci�n f�sica
			</h3>
            <div class="box-tools pull-right" height="1000px">
            	<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
            </div>
		</div>
        <div class="box-body" id="body-crear-producto">
			<ul  class="col-md-12">
				<form class="form-horizontal" role="form" id="formulario-crear-producto">
					<input type="hidden"  name="anho-crear-producto" id="anho-crear-producto" value="">
					<input type="hidden"  name="nivel-crear-producto" id="nivel-crear-producto" value="">
					<input type="hidden"  name="entidad-crear-producto" id="entidad-crear-producto" value="">
					<input type="hidden"  name="tipo-crear-producto" id="tipo-crear-producto" value="">
					<input type="hidden"  name="programa-crear-producto" id="programa-crear-producto" value="">
					<input type="hidden"  name="subprograma-crear-producto" id="subprograma-crear-producto" value="">
					<input type="hidden"  name="proyecto-crear-producto" id="proyecto-crear-producto" value="">
					<input type="hidden" name="producto_unidad_medida_id-crear-producto" id="producto_unidad_medida_id-crear-producto" value=""  >
					<div class="form-group col-md-12">
	                   <label>Producto</label> 
	                   <select id="producto_id-crear-producto" class="form-control" name="producto_id-crear-producto"></select>
                 	</div>
                 	<div class="form-group col-md-12">
	                   	<label>Unidad de Medida</label>
	                  	<input type="text"  id="producto_unidad_medida_nombre-crear-producto" name="producto_unidad_medida_nombre-crear-producto" >
                 	</div>
                 	<!--  <div class="form-group col-md-12">
	                   	<label>Clase</label>
	                  	<select id="producto_clase-crear-producto" name="producto_clase-crear-producto" >
		                  	<option value="N">Normal</option>
		                  	<option value="C">Constante</option>
	                  	</select>
                 	</div>
                 	 -->
					<div class="box-footer">
						<div class="form-group col-md-12">
							<button type="submit" class="btn btn-primary" id="crear-producto-boton">Agregar</button>
						</div>
					</div>
				</form>
			</ul>
       </div>
	</div>
</div>
<script>


</script>