<div class="modal fade" id="beneficiarioDetalle" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" >
			<div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">Registrar Beneficiario Detalle</h4>
			</div>
		    <div class="modal-body" >
				<form class="form-horizontal" role="form">
				  <div class="form-group">
				    <label for="valorBeneficiarioDetalle" class="col-lg-2 control-label">Valor</label>
				    <div class="col-lg-10">
				      <input type="hidden" class="form-control" id="idBeneficiarioDetalle">
				      <input type="text" class="form-control" id="valorBeneficiarioDetalle" placeholder="Valor">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="beneficiarioDetalleClavesIdBeneficiarioDetalle" class="col-lg-2 control-label">Beneficiario Detalle Claves Id</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="beneficiarioDetalleClavesIdBeneficiarioDetalle" placeholder="Beneficiario Detalle Claves Id">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="beneficiarioIdBeneficiarioDetalle" class="col-lg-2 control-label">Beneficiario Id</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="beneficiarioIdBeneficiarioDetalle" placeholder="Beneficiario Id">
				    </div>
				  </div>				  				  			  				  
				  <div class="form-group">
				    <div class="col-lg-offset-2 col-lg-10">
				      <button type="submit" class="btn btn-primary" id="guardarBeneficiarioDetalle">Guardar</button>
				    </div>
				  </div>
				</form>		    
		    </div>
			<div class="modal-footer"></div>
		</div> 
	</div>
</div>
	<script>
$("body").on("click", "#guardarBeneficiarioDetalle",function(event){		
		var objeto = new Object();
		var accion = "insBeneficiarioDetalle";
		var valor= $("#valorBeneficiarioDetalle").val();
		var beneficiarioDetalleClavesId= $("#beneficiarioDetalleClavesIdBeneficiarioDetalle").val();	
		var beneficiarioId=$("#beneficiarioIdBeneficiarioDetalle").val();
						
		objeto.valor=valor;
		objeto.beneficiarioDetalleClavesId=beneficiarioDetalleClavesId;
		objeto.beneficiarioId=beneficiarioId;
		
			 
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
	
$("body").on("click", "#actualizarBeneficiarioDetalle",function(event){
	var objeto = new Object();
	var accion = "actBeneficiarioDetalle";
	var id = $("#idBeneficiarioDetalle").val();
	var valor= $("#valorBeneficiarioDetalle").val();
	var beneficiarioDetalleClavesId= $("#beneficiarioDetalleClavesIdBeneficiarioDetalle").val();
	var beneficiarioId= $("#beneficiarioIdBeneficiarioDetalle").val();
	
	objeto.id = id;
	objeto.valor=valor;
	objeto.beneficiarioDetalleClavesId=beneficiarioDetalleClavesId;
	objeto.beneficiarioId=beneficiarioId;
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

$("body").on("click", "#iconoBorradoBeneficiarioDetalle",function(event){		
	var objeto = new Object();
	var accion = "borradoBeneficiarioDetalle";
	var parametrosBorradoBeneficiarioDetalle = $(this).attr("parametrosBorradoBeneficiarioDetalle");
    var idParsed = parametrosBorradoBeneficiarioDetalle.split("-");                                                            
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
		window.location.href = "http://spr.stp.gov.py/tablero/contenedorBeneficiarioDetalle.jsp";
});	
	</script>