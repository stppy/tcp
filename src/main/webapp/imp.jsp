<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Importar datos</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<link rel="stylesheet" 	href="bootstrap/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<link rel="stylesheet" href="plugins/jQueryUI/css/jquery-ui.css">

<!-- <link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css"> -->
<link rel="stylesheet" href="plugins/datatables/css/jquery.dataTables.min.css">


<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<script src="bootstrap/js/bootstrap.min.js"></script>

<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<script src="plugins/jQueryUI/jquery-ui-1.10.3.js"></script>

<!-- <script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script> -->
<script src="plugins/datatables/jquery.dataTables.min.js"></script>

<script src="http://bootboxjs.com/bootbox.js"></script>


<style>
  #sortable { list-style-type: none; margin: 0; padding: 0; width: 100%; }
  #sortable li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1em; height: 30px; }
  #sortable li span { position: absolute; margin-left: -1.3em; }
  #sortable1 { list-style-type: none; margin: 0; padding: 0; width: 100%; }
  #sortable1 li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1em; height: 30px; }
  #sortable1 li span { position: absolute; margin-left: -1.3em; }
  </style>
<script>
  $( function() {
    //$( "#sortable" ).sortable();
    //$( "#sortable" ).disableSelection();
    $( "#sortable1" ).sortable();
    $( "#sortable1" ).disableSelection();
  } );
</script>	
</head>
<body>

	<div class="container">
		<h2>Migrar datos desde Webservices</h2>
		<form class="form-horizontal">
			<div class="row">
				<label class="control-label col-sm-2" for="urlws">URL:</label>
				<div class="col-sm-10">
					<input type="url" class="form-control" id="urlws" placeholder="Ingrese la URL del webservice" value="/tablero/ajaxSelects2?action=getUnidadMedida">
				</div>
			</div>
			<div class="row">
				<label class="control-label col-sm-2" for="metodo">Método:</label>
				<div class="col-sm-10">
					<select class="form-control" id="metodo">
						<option>GET</option>
						<option>POST</option>
					</select>
				</div>
			</div>
			<div class="row">
				<button type="button" class="btn btn-default" id="cargarWs">Mostrar Datos</button>				
			</div>
			<div class="row">
				<table id="tablaJson"><thead id="thtablaJson"></thead><tbody id="cuerpoTabla"></tbody></table>
			</div>
			<!-- <div class="row">
				<div class="col-md-6">
					<h3>Columnas proveídas por el webservice</h3>
					<div class="row"></div>
					<ul id="sortable">
					</ul>
				</div>
				<div class="col-md-6">
					<h3>Columnas proveídas por la base de datos</h3>
					<div class="row">
						<div class="col-sm-4">
							<label for="selbd">Seleccionar Tabla:</label>
						</div>					
						<div class="col-sm-8">
							<select class="form-control" id="selbd"></select>
						</div>
					</div>					
					<div class="row">						
						<ul id="sortable1">	
					</ul>
					</div>
				</div>
			</div> -->
			<div class="row">
				<div class="row-height">
					<div class="col-xs-6 col-height">
						<h3>Columnas proveídas por el webservice</h3>
					</div>
					<div class="col-xs-6 col-height col-top">
						<h3>Columnas proveídas por la base de datos</h3>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="row-height">
					<div class="col-xs-6 col-height"></div>
					<div class="col-xs-6 col-height col-top">
						<div class="col-sm-4">
							<label for="selbd">Seleccionar Tabla:</label>
						</div>
						<div class="col-sm-8">
							<select class="form-control" id="selbd"></select>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="row-height">
					<div class="col-xs-6 col-height">
						<ul id="sortable">							
						</ul>
					</div>
					<div class="col-xs-6 col-height">
						<ul id="sortable1">							
						</ul>
					</div>
				</div>
			</div>

			<div class="row">
				<button type="button" class="btn btn-default" id="emparejar">Confirmar Emparejamiento</button>
			</div>
			<div class="row">
				<label class="control-label col-sm-2" for="previasql">Comando SQL:</label>
				<div class="col-sm-10">					
  					<textarea class="form-control" rows="5" id="previasql"></textarea>
				</div>
			</div>
			<div class="row">
				<button type="button" class="btn btn-default" id="migrar">Migrar Datos</button>
				<button type="button" class="btn btn-default" id="limpiar">Limpiar</button>
			</div>			
		</form>
	</div>

 <script>
 $(document).ready(function(){
	 
	 var tablas = $.ajax({
			url:'/tablero/ajaxSelects2?action=getAllTablas',
		  	type:'get',
		  	dataType:'json',
		  	async:false
		}).responseText;
	 tablas = JSON.parse(tablas);
	 
	var listatablas="";
  	for(var i = 0; i < tablas.length; i++){    		  
  		listatablas+='<option value="'+tablas[i].tablename+'">'+tablas[i].tablename+'</option>';		    		  
  	}
  	$("#selbd").append(listatablas);
	 
	$("body").on("click", "#cargarWs",function(event){
		 if($("#urlws").val() !== '' && $("#metodo").val() !== ''){
						
			datos = $.ajax({
		 			url:$("#urlws").val(),
		 		  	type:$("#metodo").val(),
		 		  	dataType:'json',
		 		  	//headers: $("#encabezado").val(),
		 		  	async:false       
		 		}).responseText;
			 datos = JSON.parse(datos);
			 //datos = datos.niveles;
		    	 
		    	 construirTablaHtml();

		    	 // genera un table html a partir del webservice proveído
		    	  function construirTablaHtml() {
		    	      var columns = AgregarHeaders(datos);
		    	  
		    	      for (var i = 0 ; i < datos.length ; i++) {
		    	          var row$ = $('<tr/>');
		    	          for (var colIndex = 0 ; colIndex < columns.length ; colIndex++) {
		    	              var cellValue = datos[i][columns[colIndex]];
		    	  
		    	              if (cellValue == null) { cellValue = ""; }
		    	  
		    	              row$.append($('<td/>').html(cellValue));
		    	          }
		    	          //$("#tablaJson").append(row$);
		    	          $("#cuerpoTabla").append(row$);
		    	      }
		    	  }
		    	  
		    	  
		    	  // agrega los headers al table
		    	  function AgregarHeaders(datos)
		    	  {
		    	      var columnSet = [];
		    	      var headerTr$ = $('<tr/>');
		    	  
		    	      for (var i = 0 ; i < datos.length ; i++) {
		    	          var rowHash = datos[i];
		    	          for (var key in rowHash) {
		    	              if ($.inArray(key, columnSet) == -1){
		    	                  columnSet.push(key);
		    	                  headerTr$.append($('<th/>').html(key));
		    	              }
		    	          }
		    	      }
		    	      //$("#tablaJson").append(headerTr$);
		    	      $("#thtablaJson").append(headerTr$);
		    	  
		    	      return columnSet;
		    	  }
		    	  
		    	  encabezado=new Array();
		    	  $("table tr th").each(function(){    		    
		    		    encabezado.push($(this).text());
		    		});
		    	  
		    	  var listaws="";
		    	  for(var i = 0; i < encabezado.length; i++){    		  
		    		  listaws+='<li class="ui-state-default">'+encabezado[i]+'</li>';		    		  
		    	  }
		    	  $("#sortable").append(listaws);
		    	  $('#tablaJson').DataTable();
		 } 
	 });
	 
	 $("body").on("change", "#selbd",function(event){
		 
		 $("#sortable1").html("");
		 var columnas = $.ajax({
				url:'/tablero/ajaxSelects2?action=getColumna&tabla='+$(this).find('option:selected').val(),
			  	type:'get',
			  	dataType:'json',
			  	async:false
			}).responseText;
		 columnas = JSON.parse(columnas);
		 
	  var listaws="";
   	  for(var i = 0; i < columnas.length; i++){    		  
   		  listaws+='<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>'+columnas[i].column_name+' ['+columnas[i].data_type+','+columnas[i].column_default+','+columnas[i].is_nullable+']</li>';		    		  
   	  }
   	  $("#sortable1").append(listaws);
		 
	 });
	 
	 $("body").on("click", "#emparejar",function(event){
		var sql="insert into "+$("#selbd").find('option:selected').val();
		columnasWs=[], columnasBd=[];
		var sql2="", sqlcuerpo="", filadatos="";
		
		$("#sortable1 li").each(function(index){     	    
			var nombreCol=$(this).text().split('[');
			nombreCol[0]=nombreCol[0].substring(0,nombreCol[0].length - 1);
			columnasBd.push(nombreCol[0]);     	    			
     	});		 
		
		$("#sortable li").each(function(index){     	    
			columnasWs.push($(this).text());     	    			
     	});
		
		for(var i = 0; i < columnasWs.length; i++){
			if(columnasBd[i]!="id"){
				sql2+=columnasBd[i]+",";	
			}			
		}
		sql2=sql2.substring(0,sql2.length - 1);
		sql2="("+sql2+") values";		
				
		for(var i = 0; i < datos.length; i++){    		  
			for(var j = 0; j < columnasBd.length; j++){
				propColumna=$('#sortable1 li').eq(j).text().split('[');
				
				nombreCol=propColumna[0];
				nombreCol=nombreCol.substring(0,nombreCol.length - 1);
				
				caractCol=propColumna[1].split(',');
				tipodatos=caractCol[0];
				valdefecto=caractCol[1];
				nulo=caractCol[2];        	
				nulo=nulo.substring(0,nulo.length - 1);
				
				//isSerial=propColumna[1].search("nextval");
				
				if(nombreCol!="id" && (valdefecto.search("nextval")<0)){ // si no es id serial
					if(columnasWs.length<j){
						if(nulo!="NO" && valdefecto!="null"){
							//sql2=sql2+','+nombreCol; mostrar alert que no coinciden las columnas
						}
					}else{
						if(typeof datos[i][columnasWs[j]] == "undefined"){
							sqlcuerpo+="null,";	
						}else{
							if(tipodatos=="date"){
								//	
							}else{
								sqlcuerpo+="'"+datos[i][columnasWs[j]]+"',";	
							}
						}
					}
				}
			}
			sqlcuerpo="("+sqlcuerpo.substring(0,sqlcuerpo.length - 1)+"),";
			//concat=$("#previasql").text();
			filadatos+=sqlcuerpo;
			sqlcuerpo="";
	   	}
		filadatos=filadatos.substring(0,filadatos.length - 1)+";";
		$("#previasql").text(sql+sql2+filadatos);  
	 });
	 
	 $("body").on("click", "#migrar",function(e){
		 var sql=$("#previasql").text();
		 
		 if(sql!==""){			 
			 bootbox.confirm("Está seguro que desea confirmar la operación?", function(result) {
			      //alert("Confirm result: " + result);
			      if(result==true){
			    	  var info = JSON.stringify(sql);
					    $.ajax({
					        url: "/tablero/ajaxInserts2?accion=insMigrar",
					        type: 'POST',
					        dataType: 'json',
					        data: info,
					        contentType: 'application/json',
					        mimeType: 'application/json',
					        success: function (data) {
					        	if(data.success == true)
					        	{
					            	alert("Registros insertados");	
					            	location.reload();
					        	}else{
					        		alert("Error al migrar datos");		          
					        	}
					        },		        
					        error: function(data,status,er) {}
						 });
			      }
			    });	 
		}
		  
	 });
	 
	 $("body").on("click", "#limpiar",function(event){
		 /* $("#urlws").text("");
		 $("#cuerpoTabla").html("");
		 $("#thtablaJson").html("");
		 $("#sortable1").html("");
		 $("#sortable").html("");
		 $("#previasql").text(""); */
		 location.reload();
	 });
	 
	//http://spr.stp.gov.py/tablero/ajaxSelects2?action=getUnidadMedida
 });
  </script>


</body>
</html>