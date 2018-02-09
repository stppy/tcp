<div class="modal fade" id="beneficiarioDetalleClave" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog modal-lg">
<div class="modal-content" >
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<h4 class="modal-title">Registrar Beneficiario Clave</h4>
</div>
<div class="modal-body" >
<form class="form-horizontal" role="form">
<div class="form-group">
<label for="claveBeneficiarioDetalleClave" class="col-lg-2 control-label">Clave</label>
<div class="col-lg-10">
<input type="hidden" class="form-control" id="idBeneficiarioDetalleClave">
<input type="text" class="form-control" id="claveBeneficiarioDetalleClave" placeholder="Clave">
</div>
</div>
<div class="form-group">
<div class="col-lg-offset-2 col-lg-10">
<button type="submit" class="btn btn-primary" id="guardarBeneficiarioDetalleClave">Guardar</button>
</div>
</div>
</form>
</div>
<div class="modal-footer"></div>
</div>
</div>
</div>
<script>
$("body").on("click", "#guardarBeneficiarioDetalleClave",function(event){
var objeto = new Object();
var accion = "insBeneficiarioDetalleClave";
var clave= $("#claveBeneficiarioDetalleClave").val();

objeto.clave=clave;

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

$("body").on("click", "#actualizarBeneficiarioDetalleClave",function(event)
		{
			var objeto = new Object();
			var accion = "actBeneficiarioDetalleClave";
			var id = $("#idBeneficiarioDetalleClave").val();
			var clave = $("#claveBeneficiarioDetalleClave").val();

			objeto.id = id;
			objeto.clave = clave;

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
</script>