<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<script>
var lineaAccion = $.ajax({
	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getLineaAccion',
  	type:'get',
  	dataType:'json',
  	async:false       
}).responseText;
lineaAccion = JSON.parse(lineaAccion);
var optionLineaAccion;

for(i = 0;i<lineaAccion.length; i++){
	optionLineaAccion+='<option value="'+lineaAccion[i].id+'" >'+lineaAccion[i].nombre+'</option>';
}


var institucion = $.ajax({
	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getInstitucion',
  	type:'get',
  	dataType:'json',
  	async:false       
}).responseText;
institucion = JSON.parse(institucion);
var optionInstitucion;

for(m = 0;m<institucion.length; m++){
	optionInstitucion+='<option value="'+institucion[m].id+'" >'+institucion[m].nombre+'</option>';
}

var periodo = $.ajax({
	url:'http://tablero2015.stp.gov.py/tablero/ajaxSelects2?action=getPeriodo',
  	type:'get',
  	dataType:'json',
  	async:false       
}).responseText;
periodo = JSON.parse(periodo);
var optionPeriodo;

for(p = 0;p<periodo.length; p++)
{
	if(periodo[p].id == 2016)
	{
		optionPeriodo+='<option value="'+periodo[p].id+'" selected>'+periodo[p].nombre+'</option>';
	}else{
		optionPeriodo+='<option value="'+periodo[p].id+'" >'+periodo[p].nombre+'</option>';
	}
}
var contenido = "";
contenido =     '<div class="col-md-12">'+
			    ' 	<div class="box">'+
			    '   	<div class="box-header with-border">'+
			    '        	<h3 class="box-title">Tabla ins_linea_accion</h3>'+
			    '        	<div class="box-tools pull-right" height="1000px"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button></div>'+
			    '       </div>'+
			    '       <div class="box-body">'+
				'					<form role="form">'+
				'						<div class="form-group">'+
				'							<label for="nombreLineaAccion">Nombre Linea Acción</label>'+
				'							<select name="lineaAccion" id="nombreLineaAccionInsLineaAccion" class="form-control">'+optionLineaAccion+'</select>'+
				'						</div>'+	
				'						<div class="form-group">'+
				'							<label for="nombreInstitucion">Nombre Institución</label>'+
				'							<select name="institucion" id="nombreInstitucionInsLineaAccion" class="form-control">'+optionInstitucion+'</select>'+
				'						</div>'+	
				'						<div class="form-group">'+
				'							<label for="periodo">Periodo</label>'+
				'							<select id="periodoInsLineaAccion" class="form-control">'+optionPeriodo+'</select>'+
				'						</div>'+	
				'						<div class="form-group">'+
				'							<label for="meta">Meta</label>'+
				'							<input type="number" id="metaInsLineaAccion" class="form-control" name="meta" placeholder="Ingrese Meta">'+
				'						</div>'+
				'						<div class="form-group">'+
				'							<label for="version">Versión</label>'+
				'							<input type="number" id="versionInsLineaAccion" class="form-control" name="version" placeholder="Ingrese Versión">'+
				'						</div>'+				
				'					</form>'+			
				'		</div>'+
			    '       <div class="box-footer">'+
			    '       		<button type="submit" class="btn btn-success guardarInsLineaAccion">Guardar</button>'+
			    '       </div>'+
				'	</div>'+
				'</div>';
				
$("#todasLasTablas").append(contenido);

$("body").on("click", ".guardarInsLineaAccion",function(event){
	event.stopPropagation();
	event.preventDefault();
	
	var lineaAccionId = $("#nombreInstitucionInsLineaAccion option:selected").val();
	var institucionId = $("#nombreInstitucionInsLineaAccion option:selected").val();
	var periodoId = $("#periodoInsLineaAccion option:selected").val();

    var meta = document.getElementById('metaInsLineaAccion').value; 
    var version = document.getElementById('versionInsLineaAccion').value; 

    var datos = new Object();
    datos.lineaAccionId = lineaAccionId;
    datos.institucionId = institucionId;
    datos.periodoId = periodoId;
    datos.meta = meta;
    datos.version = version;


   	var info = JSON.stringify(datos);
    $.ajax({
        url: "ajaxInserts2?accion=insInsLineaAccion",
        type: 'POST',
        dataType: 'json',
        data: info,
        contentType: 'application/json',
        mimeType: 'application/json',
        success: function (data) {
        	alert("Guardado!");
        	},
        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
        error: function(data,status,er) {
        	alert("Error");
        	}
	 });
	$('#nombreLineaAccionInsLineaAccion').val('');
	$('#nombreInstitucionInsLineaAccion').val('');
	$('#metaInsLineaAccion').val('');
	$('#versionInsLineaAccion').val('');
	
});
	
</script>