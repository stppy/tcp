<div class="modal fade" id="unidadMedida" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog modal-lg">
<div class="modal-content" >
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<h4 class="modal-title">Registrar Unidad Medida</h4>
</div>
<div class="modal-body" >
<form class="form-horizontal" role="form">
<div class="form-group">
<label for="nombreUnidadMedida" class="col-lg-2 control-label">Nombre</label>
<div class="col-lg-10">
<input type="hidden" class="form-control" id="idUnidadMedida">
<input type="text" class="form-control" id="nombreUnidadMedida" placeholder="Nombre">
</div>
</div>
<div class="form-group">
<label for="descripcionUnidadMedida" class="col-lg-2 control-label">Descripción</label>
<div class="col-lg-10">
<input type="text" class="form-control" id="descripcionUnidadMedida" placeholder="Descripción">
</div>
</div>
<div class="form-group">
<label for="siglaUnidadMedida" class="col-lg-2 control-label">Sigla</label>
<div class="col-lg-10">
<input type="text" class="form-control" id="siglaUnidadMedida" placeholder="Sigla">
</div>
</div>
<div class="form-group">
<div class="col-lg-offset-2 col-lg-10">
<button type="submit" class="btn btn-primary" id="guardarUnidadMedida">Guardar</button>
</div>
</div>
</form>
</div>
<div class="modal-footer"></div>
</div>
</div>
</div>
<script>
$("body").on("click", "#guardarUnidadMedida",function(event){
var objeto = new Object();
var accion = "insUnidadMedida";
var nombre= $("#nombreUnidadMedida").val();
var descripcion= $("#descripcionUnidadMedida").val();
var sigla= $("#siglaUnidadMedida").val();

objeto.nombre=nombre;
objeto.descripcion=descripcion;
objeto.sigla=sigla;

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


$("body").on("click", "#actualizarUnidadMedida",function(event){		
	var objeto = new Object();
	var accion = "actUnidadMedida";
	var id = $("#idUnidadMedida").val();
	var nombre= $("#nombreUnidadMedida").val();	
	var descripcion= $("#descripcionUnidadMedida").val();		
	var sigla= $("#siglaUnidadMedida").val();
		
	objeto.id =id;
	objeto.nombre =nombre;
	objeto.descripcion =descripcion;	
	objeto.sigla =sigla;
	

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

$("body").on("click", "#iconoBorradoUnidadMedida",function(event){		
	var objeto = new Object();
	var accion = "borradoUnidadMedida";
	var parametrosBorradoUnidadMedida = $(this).attr("parametrosBorradoUnidadMedida");
    var idParsed = parametrosBorradoUnidadMedida.split("-");                                                            
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
	window.location.href = "http://spr.stp.gov.py/tablero/contenedorUnidadMedida.jsp";
});	
</script>