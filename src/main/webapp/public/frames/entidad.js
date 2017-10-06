$( document ).ready(function() {
	
	$("body").on("click", ".btn-primary",function(event){
		var entidadObj= new Object();
		entidadObj.id=$("#formulario").find('[name="entidad"]').val();
		entidadObj.anho=parseInt(2015);
		entidadObj.nivel_id=$("#formulario").find('[name="nivel"]').val();
		entidadObj.abrev=$("#formulario").find('[name="abrev"]').val();

		entidadObj.base_legal=$("#formulario").find('[name="baseLegal"]').val();
		entidadObj.mision=$("#formulario").find('[name="mision"]').val();
		entidadObj.vision=$("#formulario").find('[name="vision"]').val();
		entidadObj.diagnostico=$("#formulario").find('[name="diagnostico"]').val();
		entidadObj.objetivo=$("#formulario").find('[name="objetivo"]').val();
		entidadObj.politica=$("#formulario").find('[name="politica"]').val();
		entidadObj.version=parseInt(50);
		$.ajax({
	        url: "ajaxUpdate?accion=actEntidad",
	        type: 'POST',
	        dataType: 'json',
	        data: JSON.stringify(entidadObj),
	        contentType: 'application/json',
	        mimeType: 'application/json',
	        success: function (data) {alert("Guardado!");},
	        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
	        error: function(data,status,er) {alert("Guardado");}
	   });
	   event.stopPropagation();
	   event.preventDefault();
	   return false;
	});
	
});