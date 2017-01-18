<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Importar datos</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>


<style>
  #sortable { list-style-type: none; margin: 0; padding: 0; width: 60%; }
  #sortable li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1em; height: 30px; }
  #sortable li span { position: absolute; margin-left: -1.3em; }
  #sortable1 { list-style-type: none; margin: 0; padding: 0; width: 60%; }
  #sortable1 li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1em; height: 30px; }
  #sortable1 li span { position: absolute; margin-left: -1.3em; }
  </style>
<script>
  $( function() {
    $( "#sortable" ).sortable();
    $( "#sortable" ).disableSelection();
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
					<input type="url" class="form-control" id="urlws" placeholder="Ingrese la URL del webservice">
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
				<table id="tablaJson"></table>
			</div>
			<div class="row">
				<div class="col-md-6">
					<h3>Columnas proveídas por el webservice</h3>
					<ul id="sortable"><br><br>
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
			</div>
			<div class="row">
				<button type="button" class="btn btn-default" id="emparejar">Confirmar Emparejamiento</button>
			</div>
			<div class="row">
				<label class="control-label col-sm-2" for="comment">Comando SQL:</label>
				<div class="col-sm-10">					
  					<textarea class="form-control" rows="5" id="comment"></textarea>
				</div>
			</div>
			<div class="row">
				<button type="button" class="btn btn-default" id="migrar">Migrar Datos</button>
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
  		listatablas+='<option value="'+tablas[i]+'">'+tablas[i]+'</option>';		    		  
  	}
  	$("#selbd").append(listatablas);
	 
	$("body").on("click", "#cargarWs",function(event){
		 if($("#urlws").val() !== '' && $("#metodo").val() !== ''){
			 
			var myList = $.ajax({
		 			url:$("#urlws").val(),
		 		  	type:$("#metodo").val(),
		 		  	dataType:'json',
		 		  	//headers: $("#encabezado").val(),
		 		  	async:false       
		 		}).responseText;
			 myList = JSON.parse(myList);
			 myList = myList.niveles;
		    	 
		    	 buildHtmlTable();

		    	 // Builds the HTML Table out of myList json data from Ivy restful service.
		    	  function buildHtmlTable() {
		    	      var columns = addAllColumnHeaders(myList);
		    	  
		    	      for (var i = 0 ; i < myList.length ; i++) {
		    	          var row$ = $('<tr/>');
		    	          for (var colIndex = 0 ; colIndex < columns.length ; colIndex++) {
		    	              var cellValue = myList[i][columns[colIndex]];
		    	  
		    	              if (cellValue == null) { cellValue = ""; }
		    	  
		    	              row$.append($('<td/>').html(cellValue));
		    	          }
		    	          $("#tablaJson").append(row$);
		    	      }
		    	  }
		    	  
		    	  // Adds a header row to the table and returns the set of columns.
		    	  // Need to do union of keys from all records as some records may not contain
		    	  // all records
		    	  function addAllColumnHeaders(myList)
		    	  {
		    	      var columnSet = [];
		    	      var headerTr$ = $('<tr/>');
		    	  
		    	      for (var i = 0 ; i < myList.length ; i++) {
		    	          var rowHash = myList[i];
		    	          for (var key in rowHash) {
		    	              if ($.inArray(key, columnSet) == -1){
		    	                  columnSet.push(key);
		    	                  headerTr$.append($('<th/>').html(key));
		    	              }
		    	          }
		    	      }
		    	      $("#tablaJson").append(headerTr$);
		    	  
		    	      return columnSet;
		    	  }
		    	  
		    	  encabezado=new Array();
		    	  $("table tr th").each(function(){    		    
		    		    encabezado.push($(this).text());
		    		});
		    	  
		    	  var listaws="";
		    	  for(var i = 0; i < encabezado.length; i++){    		  
		    		  listaws+='<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>'+encabezado[i]+'</li>';		    		  
		    	  }
		    	  $("#sortable").append(listaws);
		    	  //$('#tablaJson').DataTable();
		 }
		 
		 /* SELECT * FROM spr.pg_catalog.pg_tables where schemaname='public'

			 SELECT *
			 FROM spr.information_schema.columns
			 WHERE table_schema = 'public'
			   AND table_name   = 'meta'
 */		 
 
/*  
 http://stackoverflow.com/questions/5180382/convert-json-data-to-a-html-table
	 http://stackoverflow.com/questions/5180382/convert-json-data-to-a-html-table
		 http://jsfiddle.net/manishmmulani/7MRx6/
			 http://jsfiddle.net/7MRx6/338/
				 http://stackoverflow.com/questions/9888861/view-json-file-in-browser
					 http://www.jsonviewer.com/
	 */				 
 
 
	 });
	 
	 $("body").on("onchange", "#selbd",function(event){
		 
		 
		 
		 
		 
	 });
 });
  </script>


</body>
</html>