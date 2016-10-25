<!DOCTYPE html>
<html>
  <head>

<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script src="http://www.jqueryscript.net/demo/Create-Step-By-Step-Modal-with-jQuery-Bootstrap/src/jquery-bootstrap-modal-steps.js"></script>


</head>
<body>

<h1>Bootstrap Modal Steps jQuery Plugin Demos</h1>

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal"> Launch demo modal </button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="js-title-step"></h4>
      </div>
      <div class="modal-body">
        <div class="row hide" data-step="1" data-title="Agregar Acción">
          <div class="well">
	 		<form role="form">
				<div class="table-responsive">
					<table class="table table-hover">
						<tbody>
							<tr><td><div class="form-group"><label for="nombreAccion">Acción</label><input type="text" class="form-control" id="nombreAccion" value=""><input type="hidden" class="form-control" id="insLineaAccionId" value="'+insLineaAccionId+'"></div></td><td><div class="form-group"><label for="umedida">U. medida</label><select id="selectorUnidadMedida" class="form-control">'+optionUnidadMedida+'</select></div></td></tr>
							<tr><td><div class="form-group"><label for="departamento">Departamento</label><select id="selectorDepartamento" name="departamento" class="form-control">'+optionDepartamentos+'</select></div></td><td><div class="form-group"><label for="distrito">Distrito</label><select name="departamento" class="form-control" id="distritosDepartamento"></select></div></td></tr>
						</tbody>
					</table>
				</div>
			</form>
          </div>
        </div>
        <div class="row hide" data-step="2" data-title="Planificar Metas">
          <div class="well">
  			   	<div class="row">
 					    <div class="form-group col-md-3">
 						<label for="totalFinanciero-formulario">Primer Trimestre</label>
  						<div class="input-group input-group-sm">      			
				    				<input type="text" name="primerTrimestre" id="primerTrimestre-formulario" value="" class="form-control">
  						</div>
					    </div>
					    		
  					<div class="form-group col-md-3">
  					<label for="totalFinanciero-formulario">Segundo Trimestre</label>
   					<div class="input-group input-group-sm">
					    			<input type="text" name="segundoTrimestre" id="segundoTrimestre-formulario" value="" class="form-control">
   					</div>
				    </div>
	    		
  					<div class="form-group col-md-3">
 					<label for="totalFinanciero-formulario">Tercer Trimestre</label>
   					<div class="input-group input-group-sm">
					   <input type="text" name="tercerTrimestre" id="tercerTrimestre-formulario" value="" class="form-control">
   					</div>
	    			</div>
   		
 					    <div class="form-group col-md-3">
							<label for="totalFinanciero-formulario">Cuarto Trimestre</label>
  						<div class="input-group input-group-sm">
	    				<input type="text" name="cuartoTrimestre" id="cuartoTrimestre-formulario" value="" class="form-control">
  						</div>
   						</div>
				</div>
			      			       
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default js-btn-step pull-left" data-orientation="cancel" data-dismiss="modal"></button>
        <button type="button" class="btn btn-warning js-btn-step" data-orientation="previous"></button>
        <button type="button" class="btn btn-success js-btn-step" data-orientation="next"></button>
      </div>
    </div>
  </div>
</div>
<script>
$('#myModal').modalSteps();
</script>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>


    
  </body>
</html>
