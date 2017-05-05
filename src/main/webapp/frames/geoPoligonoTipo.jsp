<div class="modal fade" id="geoPoligonoTipo" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog modal-lg">
<div class="modal-content" >
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<h4 class="modal-title">Registrar Geo Poligono Tipo</h4>
</div>
<div class="modal-body">
<form class="form-horizontal" role="form">
<div class="form-group">
<label for="nombreGeoPoligonoTipo" class="col-lg-2 control-label">Nombre</label>
<div class="col-lg-10">
<input type="hidden" class="form-control" id="idGeoPoligonoTipo">
<input type="text" class="form-control" id="nombreGeoPoligonoTipo" placeholder="Nombre">
</div>
</div>
<div class="form-group">
<label for="descripcionGeoPoligonoTipo" class="col-lg-2 control-label">Descripcion</label>
<div class="col-lg-10">
<input type="text" class="form-control" id="descripcionGeoPoligonoTipo" placeholder="Descripcion">
</div>
</div>
<div class="form-group">
<div class="col-lg-offset-2 col-lg-10">
<button type="submit" class="btn btn-primary" id="guardarGeoPoligonoTipo">Guardar</button>
</div>
</div>
</form> 
</div>
<div class="modal-footer"></div>
</div>  
</div>
</div>

<script>
$("body").on("click", "#guardarGeoPoligonoTipo",function(event){ 
var todojunto = new Object();
var accion = "insGeoPoligonoTipo";
var nombre= $("#nombreGeoPoligonoTipo").val();
var descripcion= $("#descripcionGeoPoligonoTipo").val();

todojunto.nombre=nombre;
todojunto.descripcion=descripcion;



$.ajax({
url: "http://spr.stp.gov.py/tablero/ajaxInserts2?accion="+accion,
type: 'POST',
dataType: 'json',
data: JSON.stringify(todojunto),
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

$("body").on("click", "#actualizarGeoPoligonoTipo",function(event){		
	var objeto = new Object();
	var accion = "actGeoPoligonoTipo";
	var id = $("#idGeoPoligonoTipo").val();
	var nombre= $("#nombreGeoPoligonoTipo").val();
	var descripcion= $("#descripcionGeoPoligonoTipo").val();

	objeto.id = id;
	objeto.nombre = nombre;
	objeto.descripcion = descripcion;				

	$.ajax({
	        url: "http://spr.stp.gov.py/tablero/ajaxUpdate2?accion="+accion,
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

$("body").on("click", "#iconoBorradoGeoPoligonoTipo",function(event){
	var objeto = new Object();
	var accion = "borradoGeoPoligonoTipo";
	var parametrosBorradoGeoPoligonoTipo = $(this).attr("parametrosBorradoGeoPoligonoTipo");
    var idParsed = parametrosBorradoGeoPoligonoTipo.split("-");                                                            
	var id = idParsed[0];
	var borrado = idParsed[1];
	
	objeto.id = id;
	objeto.borrado=borrado;
	
	$.ajax({
		url: "http://spr.stp.gov.py/tablero/ajaxUpdate2?accion="+accion,
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
	       	}else
	       	{
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
	window.location.href = "http://spr.stp.gov.py/tablero/contenedorGeoPoligonoTipo.jsp";
});
</script>