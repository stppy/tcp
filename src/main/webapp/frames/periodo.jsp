<div class="modal fade" id="periodo" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog modal-lg">
<div class="modal-content" >
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<h4 class="modal-title">Registrar Periodo</h4>
</div>
<div class="modal-body">
<form class="form-horizontal" role="form">
<div class="form-group">
<label for="nombreperiodo" class="col-lg-2 control-label">Nombre</label>
<div class="col-lg-10">
<input type="text" class="form-control" id="nombreperiodo" placeholder="Nombre">
</div>
</div>
<div class="form-group">
<label for="descripcionperiodo" class="col-lg-2 control-label">Descripción</label>
<div class="col-lg-10">
<input type="text" class="form-control" id="descripcionperiodo" placeholder="Descripción">
</div>
</div>
<div class="form-group">
<label for="fecha_inicioperiodo" class="col-lg-2 control-label">Fecha Inicio</label>
<div class="col-lg-10">
<input type="date" class="form-control" id="fecha_inicioperiodo" placeholder="fecha_inicio">
</div>
</div>
<div class="form-group">
<label for="fecha_finperiodo" class="col-lg-2 control-label">Fecha Fin</label>
<div class="col-lg-10">
<input type="date" class="form-control" id="fecha_finperiodo" placeholder="fecha_inicio">
</div>
</div>
<div class="form-group">
<div class="col-lg-offset-2 col-lg-10">
<button type="submit" class="btn btn-primary" id="guardarperiodo">Guardar</button>
</div>
</div>
</form> 
</div>
<div class="modal-footer"></div>
</div> 
</div>
</div>
<script>
$("body").on("click", "#guardarperiodo",function(event){ 
var todojunto = new Object();
var accion = "insPeriodo";
var nombre= $("#nombreperiodo").val();
var descripcion= $("#descripcionperiodo").val(); 
var fecha_inicio= $("#fecha_inicioperiodo").val();
var fecha_fin= $("#fecha_finperiodo").val(); 

todojunto.nombre=nombre;
todojunto.descripcion=descripcion;
todojunto.fecha_inicio=fecha_inicio;
todojunto.fecha_fin=fecha_fin;


$.ajax({
url: "http://tablero2015.stp.gov.py/tablero/ajaxInserts2?accion="+accion,
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
</script>