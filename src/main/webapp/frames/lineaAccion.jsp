<div class="modal fade" id="lineaAccion" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" >
			<div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">Registrar Linea Acción</h4>
			</div>
		    <div class="modal-body">
				<form class="form-horizontal" role="form">
				  <div class="form-group">
				    <label for="nombreLineaAccion" class="col-lg-2 control-label">Nombre</label>
				    <div class="col-lg-10">
				      <input type="hidden" class="form-control" id="idLineaAccion">
				      <input type="text" class="form-control" id="nombreLineaAccion" placeholder="Nombre">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="descripcionLineaAccion" class="col-lg-2 control-label">Descripción</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="descripcionLineaAccion" placeholder="Descripción">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="ordenLineaAccion" class="col-lg-2 control-label">Orden</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="ordenLineaAccion" placeholder="Orden">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="pesoLineaAccion" class="col-lg-2 control-label">Peso</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="pesoLineaAccion" placeholder="Peso">
				    </div>
				  </div>	
				  <div class="form-group">
				    <label for="acumularLineaAccion" class="col-lg-2 control-label">Acumular</label>
				    <div class="col-lg-10">
				      <select name="acumularLineaAccion" id="acumularLineaAccion" class="form-control"></select>
				    </div>
				  </div>		
				  <div class="form-group">
				    <label for="tipoAccionIdLineaAccion" class="col-lg-2 control-label">Tipo de Linea de Acción</label>
				    <div class="col-lg-10">
				     <select name="tipoAccionIdLineaAccion" id="tipoAccionIdLineaAccion" class="form-control"></select>
				      
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="estrategiaIdLineaAccion" class="col-lg-2 control-label">Estrategia</label>
				    <div class="col-lg-10">
				        <select name="estrategiaIdLineaAccion" id="estrategiaIdLineaAccion" class="form-control"></select>
				    </div>
				  </div>	
				  <div class="form-group">
				    <label for="unidadMedidaIdLineaAccion" class="col-lg-2 control-label">Unidad de Medida</label>
				    <div class="col-lg-10">
				      <select name="unidadMedidaIdLineaAccion" id="unidadMedidaIdLineaAccion" class="form-control"></select>
				    </div>
				  </div>					  			  				  		  			  				  
				  <div class="form-group">
				    <div class="col-lg-offset-2 col-lg-10">
				      <button type="submit" class="btn btn-primary" id="guardarLineaAccion">Guardar</button>
				    </div>
				  </div>
				</form>		    
		    </div>
			<div class="modal-footer"></div>
		</div> 
	</div>
</div>
	<script>
	
	$(document).ready(function(){
		var tipoAccion = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getTipoAccion',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;		
		tipoAccion=JSON.parse(tipoAccion);
		
		var optionTipoAccion;

		for(i = 0;i<tipoAccion.length; i++){
			optionTipoAccion+='<option value="'+tipoAccion[i].id+'" >'+tipoAccion[i].descripcion+'</option>';
		}
		$("#tipoAccionIdLineaAccion").append(optionTipoAccion);
		
		var unidadMedida = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getUnidadMedida',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		unidadMedida = JSON.parse(unidadMedida);
		var optionUnidadMedida;
		for(var u = 0; u < unidadMedida.length; u++)
		{
			optionUnidadMedida+='<option value="'+unidadMedida[u].id+'" parametro="'+unidadMedida[u].id+'">'+unidadMedida[u].descripcion+'</option>';
		}
		$("#unidadMedidaIdLineaAccion").append(optionUnidadMedida);
		
		var estrategia = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getLineaEstrategica',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		estrategia = JSON.parse(estrategia);
		var optionEstrategia;
		for(var u = 0; u < estrategia.length; u++)
		{
			optionEstrategia+='<option value="'+estrategia[u].id+'" parametro="'+estrategia[u].id+'">'+estrategia[u].nombre+'</option>';
		}
		$("#estrategiaIdLineaAccion").append(optionEstrategia);
	});
	
	$("body").on("click", "#guardarLineaAccion",function(event){		
			var objeto = new Object();
			var accion = "insLineaAccion";
			var nombre= $("#nombreLineaAccion").val();
			var descripcion= $("#descripcionLineaAccion").val();	
			var orden= $("#ordenLineaAccion").val();
			var peso= $("#pesoLineaAccion").val();
			var acumular= $("#acumularLineaAccion").val();				
			var tipoAccionId= $("#tipoAccionIdLineaAccion").val();	
			var estrategiaId= $("#estrategiaIdLineaAccion").val();	
			var unidadMedidaId= $("#unidadMedidaIdLineaAccion").val();				
	
			objeto.nombre=nombre;
			objeto.descripcion=descripcion;
			objeto.orden=orden;
			objeto.peso=peso;
			objeto.acumular=acumular;			
			objeto.tipoAccionId=tipoAccionId;
			objeto.estrategiaId=estrategiaId;
			objeto.unidadMedidaId=unidadMedidaId;

				 
			$.ajax({
			        url: "http://spr.stp.gov.py/tablero/ajaxInserts2?accion="+accion,
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
	
	
$("body").on("click", "#actualizarLineaAccion",function(event)
{
	var objeto = new Object();
	var accion = "actLineaAccion";
	var id = $("#idLineaAccion").val();
	var nombre = $("#nombreLineaAccion").val();
	var descripcion= $("#descripcionLineaAccion").val();
	var orden= $("#ordenLineaAccion").val();
	var peso= $("#pesoLineaAccion").val();
	var acumular= $("#acumularLineaAccion").val();
	var tipoAccionId= $("#tipoAccionIdLineaAccion").val();
	var estrategiaId= $("#estrategiaIdLineaAccion").val();
	var unidadMedidaId= $("#unidadMedidaIdLineaAccion").val();
	
	objeto.id = id;
	objeto.nombre=nombre;
	objeto.descripcion=descripcion;
	objeto.orden=orden;
	objeto.peso=peso;
	objeto.acumular=acumular;
	objeto.tipoAccionId=tipoAccionId;
	objeto.estrategiaId=estrategiaId;
	objeto.unidadMedidaId=unidadMedidaId;
	
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
});

$("body").on("click", "#iconoBorradoLineaAccion",function(event)
{
	var objeto = new Object();
	var accion = "borradoLineaAccion";
	var parametrosBorradoLineaAccion = $(this).attr("parametrosBorradoLineaAccion");
    var idParsed = parametrosBorradoLineaAccion.split("-");                                                            
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
	window.location.href = "http://spr.stp.gov.py/tablero/contenedorLineaAccion.jsp";
});

	</script>	