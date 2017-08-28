<div class="modal fade" id="accionHasProducto" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog modal-lg">
<div class="modal-content" >
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<h4 class="modal-title">Registrar Accion Has Producto</h4>
</div>
<div class="modal-body">
<form class="form-horizontal" role="form">
<div class="form-group">
<label for="proporcionAccionHasProducto" class="col-lg-2 control-label">Proporcion</label>
<div class="col-lg-10">
<input type="hidden" class="form-control" id="idAccionHasProducto">
<input type="text" class="form-control" id="proporcionAccionHasProducto" placeholder="Nombre">
</div>
</div>
<div class="form-group">
<label for="accionIdAccionHasProducto" class="col-lg-2 control-label">accionId</label>
<div class="col-lg-10">
<input type="text" class="form-control" id="accionIdAccionHasProducto" placeholder="accionId">
</div>
</div>
<div class="form-group">
<label for="sprProductoIdAccionHasProducto" class="col-lg-2 control-label">sprProductoId</label>
<div class="col-lg-10">
<input type="text" class="form-control" id="sprProductoIdAccionHasProducto" placeholder="sprProductoId">
</div>
</div>
<div class="form-group">
<div class="col-lg-offset-2 col-lg-10">
<button type="submit" class="btn btn-primary" id="guardarAccionHasProducto">Guardar</button>
</div>
</div>
</form> 
</div>
<div class="modal-footer"></div>
</div> 
</div>
</div>

<script>
$("body").on("click", "#guardarAccionHasProducto",function(event){ 
var objeto = new Object();
var accion = "insAccionHasProducto";
var proporcion= $("#proporcionAccionHasProducto").val();
var accionId= $("#accionIdAccionHasProducto").val();
var sprProductoId= $("#sprProductoIdAccionHasProducto").val();

objeto.proporcion=proporcion;
objeto.accionId=accionId;
objeto.sprProductoId=sprProductoId;

$.ajax({
url: "/tablero/ajaxInserts2?accion="+accion,
type: 'POST',
dataType: 'json',
data: JSON.stringify(objeto),
contentType: 'application/json',
mimeType: 'application/json',

success: function (data)
{
if (data.success == true)
{
$("#tituloModalUsuario").html('');
$("#tituloModalUsuario").append('<p class="text-success">GUARDADO</p>');
$("#pass-viejo-form").val("");
$("#pass-nuevo-form").val("");
$("#pass-nuevo1-form").val(""); 
}else{
if (data.success == false){
$("#tituloModalUsuario").html('');
$("#tituloModalUsuario").append('<p class="text-danger">Error no se ha guardado</p>');
}
}
},
error: function(data,status,er)
{
$("#tituloModalUsuario").html('');
$("#tituloModalUsuario").append('<p class="text-danger">Error de conexion intente de nuevo</p>');
}
});

});

$("body").on("click", "#actualizarAccionHasProducto",function(event){		
	var objeto = new Object();
	var accion = "actAccionHasProducto";
	var id = $("#idAccionHasProducto").val();
	var proporcion= $("#proporcionAccionHasProducto").val();
	var accionId= $("#accionIdAccionHasProducto").val();
	var sprProductoId= $("#sprProductoIdAccionHasProducto").val();	

		
	objeto.id = id;
	objeto.proporcion = proporcion;
	objeto.accionId = accionId;	
	objeto.sprProductoId = sprProductoId;			

	$.ajax({
	        url: "/tablero/ajaxUpdate2?accion="+accion,
	        type: 'POST',
	        dataType: 'json',
	        data: JSON.stringify(objeto),
	        contentType: 'application/json',
	        mimeType: 'application/json',
	        
	        success: function (data)
	        {
	        	if (data.success == true)
	        	{
	        		$("#tituloModalUsuario").html('');
					$("#tituloModalUsuario").append('<p class="text-success">GUARDADO</p>');
		    		$("#pass-viejo-form").val("");
					$("#pass-nuevo-form").val("");
					$("#pass-nuevo1-form").val("");	
	        	}else{
	        		if (data.success == false){
	        			$("#tituloModalUsuario").html('');
			        	$("#tituloModalUsuario").append('<p class="text-danger">Error no se ha guardado</p>');
	        		}
	        	}
	        },
	        error: function(data,status,er)
	        {
	        	$("#tituloModalUsuario").html('');
	        	$("#tituloModalUsuario").append('<p class="text-danger">Error de conexion intente de nuevo</p>');
	        }
	 });		
});	

$("body").on("click", "#iconoBorradoAccionHasProducto",function(event){		
	var objeto = new Object();
	var accion = "borradoAccionHasProducto";
	var parametrosBorradoAccionHasProducto = $(this).attr("parametrosBorradoAccionHasProducto");
    var idParsed = parametrosBorradoAccionHasProducto.split("-");                                                            
	var id = idParsed[0];
	var borrado = idParsed[1];
	
	objeto.id = id;
	objeto.borrado = borrado;

	$.ajax({
	    url: "/tablero/ajaxUpdate2?accion="+accion,
	    type: 'POST',
	    dataType: 'json',
	    data: JSON.stringify(objeto),
	    contentType: 'application/json',
	    mimeType: 'application/json',
    
	    success: function (data)
	    {
	    	if (data.success == true)
	    	{
	    		$("#tituloModalUsuario").html('');
				$("#tituloModalUsuario").append('<p class="text-success">GUARDADO</p>');
				 		$("#pass-viejo-form").val("");
				$("#pass-nuevo-form").val("");
				$("#pass-nuevo1-form").val("");	
			}else{
	    		if (data.success == false)
	    		{
	    			$("#tituloModalUsuario").html('');
	      			$("#tituloModalUsuario").append('<p class="text-danger">Error no se ha guardado</p>');
	    		}
	    	}
	    },
	    error: function(data,status,er)
	    {
	    	$("#tituloModalUsuario").html('');
	    	$("#tituloModalUsuario").append('<p class="text-danger">Error de conexion intente de nuevo</p>');
	    }
	});
		window.location.href = "http://spr.stp.gov.py/tablero/contenedorAccionHasProducto.jsp";
});	
</script>