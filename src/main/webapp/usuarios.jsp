<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%> 
<%@ page import="org.jasig.cas.client.authentication.AttributePrincipalImpl"%>
<%@ page import="org.jasig.cas.client.authentication.AttributePrincipal"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>


<!DOCTYPE html>
<html>
  <head>
  	<!--  ISO-8859-1 -->
  	<%@ include file="/frames/head.jsp" %>
 	<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

   	<script src="https://cdnjs.cloudflare.com/ajax/libs/floatthead/1.2.10/jquery.floatThead.min.js"></script> -->	
        
	<!--<script src="frames/entidad.js" type="text/javascript"></script> -->
	<script type="text/javascript" src="dist/canvasjs/canvasjs.min.js" ></script>
	
	<link href="bootstrap/css/bootstrapslider.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <style type="text/css">
		/* Example 1 custom styles */
		#ex1Slider .slider-selection {
   			background: #BABABA;
  		}

    	/* Example 3 custom styles */
		#RGB {
    		height: 20px;
    		background: rgb(128, 128, 128);
  		}
		#RC .slider-selection {
		    background: #FF8282;
		}
		#RC .slider-handle {
			background: red;
		}
		#GC .slider-selection {
			background: #428041;
		}
		#GC .slider-handle {
			background: green;
		}
		#BC .slider-selection {
			background: #8283FF;
		}
		#BC .slider-handle {
			border-bottom-color: blue;
		}
		#R, #G, #B {
			width: 300px;
		}
		
		
		#slider12a .slider-track-high, #slider12c .slider-track-high {
			background: #008d4c;
		}
		
		#slider12b .slider-track-low, #slider12c .slider-track-low {
			background: #d33724;
		}
		
		#slider12c .slider-selection {
			background: #db8b0b;
		}
    </style>
    
    
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link rel="stylesheet" href="plugins/mapa/leaflet.css" />
<script src='dist/leaflet-image.js'></script>

</head>
<body class="skin-blue sidebar-mini sidebar-collapse">



		
<% AttributePrincipal user = (AttributePrincipal) request.getUserPrincipal();%>
<% Map attributes = user.getAttributes(); 
if (user != null) { %>

<script>
<%if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("2")){%>
 	$(document).ready(function(){

		var entidadCas = "";
		entidadCas ="<%=attributes.get("entidad") %>";
		usuarioRolCas="<%=attributes.get("role_id") %>";
		var usuarios = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getUsuarios&usuario=<%=user.getName()%>',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		usuarios = JSON.parse(usuarios);
		usuarios = usuarios.usuarios;
		
		$("#nombreUsuario").append(usuarios[0].correo+" ("+usuarios[0].nivel_id+", "+usuarios[0].entidad_id+")");
		$("#PerfilUsuario").append(usuarios[0].nombre+" ("+usuarios[0].nivel_id+", "+usuarios[0].entidad_id+", "+entidadCas+")");
		
		function renderUsuarios(){
			
			var tablaUsuarios = "";
			var cuerpoTabla = "";
			$("#cuerpoUsuario").html("");
			
			var usuarios = $.ajax({
				url:'http://spr.stp.gov.py/ajaxSelects?accion=getUsuarios',
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			usuarios = JSON.parse(usuarios);
			usuarios = usuarios.usuarios;
			
			var roles = $.ajax({
				url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getRol',
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			roles = JSON.parse(roles);
			
			var rolId;
			for(var q = 0; q < usuarios.length; q++){
				
				rolId = "";
				for(var r = 0; r < roles.length; r++){
					if(usuarios[q].rol_id == roles[r].rolId){
						rolId = roles[r].nombre;
					}
				}
				if(usuarios[q].borrado == true)
				{
					<%if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") ){%>
						cuerpoTabla += '<tr><td><del>'+usuarios[q].entidad+'</del></td>';
						if(usuarios[q].url){
							cuerpoTabla += '<td><del><a href="http://spr.stp.gov.py/tablero/DownloadServlet?urlDocumento='+usuarios[q].url+'" Download="Nota_usuario_'+usuarios[q].nombre+'" >'+usuarios[q].nombre+'</a></del></td><td><del>'+usuarios[q].correo+'</del></td><td><del>'+rolId+'</del></td><td class="text-center"><button type="button" class="btn btn-default btn-sm registrosInsLineaAccion" data-toggle="tooltip" data-placement="top" title="Editar Usuario" ><span class="glyphicon glyphicon-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarUsuario" data-toggle="tooltip" data-placement="top" title="Borrar Usuario" parametros="'+usuarios[q].id+'"><span class="glyphicon glyphicon-trash"></span></button><button type="button" class="btn btn-default btn-sm agregarUsuario" data-toggle="tooltip" data-placement="top" title="Agregar Usuario"><span class="glyphicon glyphicon-user"></span></button></td></tr>';
						}else{
							cuerpoTabla += '<td><del>'+usuarios[q].nombre+'</del></td><td><del>'+usuarios[q].correo+'</del></td><td><del>'+rolId+'</del></td><td class="text-center"><button type="button" class="btn btn-default btn-sm registrosInsLineaAccion" data-toggle="tooltip" data-placement="top" title="Editar Usuario" ><span class="glyphicon glyphicon-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarUsuario" data-toggle="tooltip" data-placement="top" title="Borrar Usuario" parametros="'+usuarios[q].id+'"><span class="glyphicon glyphicon-trash"></span></button><button type="button" class="btn btn-default btn-sm agregarUsuario" data-toggle="tooltip" data-placement="top" title="Agregar Usuario"><span class="glyphicon glyphicon-user"></span></button></td></tr>';
						}
					<%}%>
				}else{
					<%if (attributes.get("role_id").toString().equals("0") || attributes.get("role_id").toString().equals("1") || attributes.get("role_id").toString().equals("2")){%>
						cuerpoTabla += '<tr><td>'+usuarios[q].entidad+'</td>';
						
							if (usuarios[q].url) {
								cuerpoTabla += '<td><a href="http://spr.stp.gov.py/tablero/DownloadServlet?urlDocumento='+usuarios[q].url+'" Download="Nota_usuario_'+usuarios[q].nombre+'" >'+usuarios[q].nombre+'</a></td><td>'+usuarios[q].correo+'</td><td>'+rolId+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm registrosInsLineaAccion" data-toggle="tooltip" data-placement="top" title="Editar Usuario" ><span class="glyphicon glyphicon-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarUsuario" data-toggle="tooltip" data-placement="top" title="Borrar Usuario" parametros="'+usuarios[q].id+'"><span class="glyphicon glyphicon-trash"></span></button><button type="button" class="btn btn-default btn-sm agregarUsuario" data-toggle="tooltip" data-placement="top" title="Agregar Usuario"><span class="glyphicon glyphicon-user"></span></button></td></tr>';
							} else {
								cuerpoTabla += '<td>'+ usuarios[q].nombre+'</td><td>'+usuarios[q].correo+'</td><td>'+rolId+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm registrosInsLineaAccion" data-toggle="tooltip" data-placement="top" title="Editar Usuario" ><span class="glyphicon glyphicon-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarUsuario" data-toggle="tooltip" data-placement="top" title="Borrar Usuario" parametros="'+usuarios[q].id+'"><span class="glyphicon glyphicon-trash"></span></button><button type="button" class="btn btn-default btn-sm agregarUsuario" data-toggle="tooltip" data-placement="top" title="Agregar Usuario"><span class="glyphicon glyphicon-user"></span></button></td></tr>';	
							}					
					<%} if (attributes.get("role_id").toString().equals("3")){%>
						cuerpoTabla += '<tr><td>'+usuarios[q].entidad+'</td>';
						if (usuarios[q].url) {
							cuerpoTabla += '<td><a href="http://spr.stp.gov.py/tablero/DownloadServlet?urlDocumento='+usuarios[q].url+'" Download="Nota_usuario_'+usuarios[q].nombre+'" >'+usuarios[q].nombre+'</a></td><td>'+usuarios[q].correo+'</td><td>'+rolId+'</td><td class="text-center"></td></tr>';
						}else{
							cuerpoTabla += '<td>'+usuarios[q].nombre+'</td><td>'+usuarios[q].correo+'</td><td>'+rolId+'</td><td class="text-center"></td></tr>';
						}
					<%}%>
				}	
			}
			
			
			var tablaUsuarios ='<div class="table-responsive">'+
			'	              	<table class="table table-hover table-bordered" id="dataTablesUsuarios">'+
			'	                	<thead>'+
			'	                		<tr class="active"><th class="text-center">Entidad</th><th class="text-center">Nombre</th><th class="text-center">Correo</th><th class="text-center">Rol_Id</th><th class="text-center">Administrar</th></tr>'+
			'	                	</thead>'+
			'	                	<tbody id="tablaUsuariosPrecargados">'+
			'	                	</tbody>'+
			'	                </table>'+
			'	              </div>';
			
			$('#cuerpoUsuario').append(tablaUsuarios);
			$('#tablaUsuariosPrecargados').append(cuerpoTabla);
			$("#dataTablesUsuarios").DataTable();

		}
		
		renderUsuarios();
		
		$("body").on("click", ".agregarUsuario",function(event){
			
			if ( $("#modalUsuario").length )
			{
				$("#modalUsuario").remove();
			}	
			
			
			var roles = $.ajax({
				url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getRol',
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			roles = JSON.parse(roles);
			
			optionRoles = "";
			for(var r = 0; r < roles.length; r++){
				optionRoles += '<option value="'+roles[r].rolId+'" >'+roles[r].nombre+'</option>';
				
			}
			
			var cuerpoModalUsuario = "";

		    cuerpoModalUsuario =	'<div class="modal fade" id="modalUsuario" tabindex="-1" aria-labelledby="myLargeModalLabel">'+
			'	<div class="modal-dialog modal-lg" style="width:90%">'+
			'		<div class="modal-content" >'+
			'			<div class="modal-header">'+
			'		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>'+
			'		        <h4 class="modal-title">Agregar Usuario</h4>'+   
			'			</div>'+
			'		    <div class="modal-body" id="accionCuerpo" >'+
			
			'		      	<div class="row">'+ 
			'		      		<div class="col-md-12">'+
			'						<div class="box box-warning">'+
			'		                	<div class="box-header with-border">'+
			'		                  		<h3 class="box-title"></h3>'+
			'	                  			<div class="box-tools pull-right">'+
			'		                  		</div>'+
			'               			</div>'+//fin box-heder
			'               			<div class="box-body" id="cuerpoModalUsuario">'+
			
			'								<form role="form" id="formulario">'+
			'									<div class="table-responsive">'+
			'										<table class="table table-hover">'+
			'											<tbody>'+
			'												<tr><td><div class="form-group"><label for="nivelUsuario">Nivel</label><input type="text" class="form-control" id="nivelUsuario" list="listaNiveles" placeholder="Nivel" /></div></td><td><div class="form-group"><label for="entidadUsuario">Entidad</label><input type="text" class="form-control" id="entidadUsuario" list="listaEntidades" /></div></td></tr>'+
			'												<tr><td><div class="form-group"><label for="correoUsuario">Correo</label><input type="text" class="form-control" id="correoUsuario" value="" placeholder="Ingrese Correo del Usuario"></div></td><td><div class="form-group"><label for="contrasenaUsuario">Contraseña</label><input type="password" class="form-control" id="contrasenaUsuario" placeholder="Ingrese una Contraseña" /></div></td></tr>'+
			'												<tr><td><div class="form-group"><label for="unidadResponsableUsuario">U. Responsable</label><select id="unidadResponsableUsuario" class="form-control"></select></div></td><td><div class="form-group"><label for="NombreUsuario">Nombre</label><input type="text" class="form-control" id="nombreUsuarioFormulario" placeholder="Ingrese Nombre del Usuario" /></div></td></tr>'+
			'												<tr><td><label for="documentoUsuario">Adjuntar Documento</label><input type="file" id="documentoUsuario" name="documentoUsuario" /><input type="hidden" id="urlDocUsuario" name="urlDocUsuario" value="" /></td><td><div class="form-group"><label for="rolIdUsuario">Rol Id</label><select id="rolIdUsuario" class="form-control">'+optionRoles+'</select></div></td></tr>'+
			'											</tbody>'+							           
			'										</table>'+
			'									</div>'+
			'								</form>'+
			'               			</div>'+//fin box-body
			'							<div class="modal-footer">'+
			'								<button type="button" class="btn btn-success btn-sm guardarUsuario" id="botonGuardarUsuario">Guardar Usuario</button>'+
			'							</div>'+
			'                		</div>'+	
			'                	</div>'+
			'                </div>'+											

			'		    </div>'+
	
			'		</div>'+ 
			'	</div>'+
			'</div>'; 

			$("body").append(cuerpoModalUsuario);
			$("#modalUsuario").modal('show');
			
			function Combo(){

			    this.nivelFocus = function(){
				if ( $("#listaNiveles").length ) {
					$("#listaNiveles").remove();
					$('#nivelUsuario').val('');
					$("#listaEntidades").remove();
					$('#entidadUsuario').val('');
					$("#listaResponsable").remove();
					$('#unidadResponsableUsuario').val('');
				}
				
			   	  var listaDatalist=document.getElementsByTagName('datalist');
			      var datosNiveles = $.ajax({
			          url:'http://spr.stp.gov.py/ajaxSelects?accion=getNiveles',
			          type:'get',
			          dataType:'json',	
			          async:false       
			        }).responseText;   
			        datosNiveles = JSON.parse(datosNiveles);
			        
					
			        if(listaDatalist.length === 0 )
			        {
				        var datalistNiveles = document.createElement('datalist');
				        datalistNiveles.setAttribute('id','listaNiveles');
				        datalistNiveles.setAttribute('size','5'); 
				        var ubicacionDatalistNiveles = document.getElementById('formulario');
				        ubicacionDatalistNiveles.appendChild(datalistNiveles);
				
				        for(var i = 0; i < datosNiveles.niveles.length ; i++) 
				        {    
				        	var option = document.createElement('option');
				          	option.setAttribute('value',datosNiveles.niveles[i].nivel);
				          	option.setAttribute('label',datosNiveles.niveles[i].nombreNivel);
				          	datalistNiveles.appendChild(option);      
				      	} 
			        }
			    } 

			    this.entidadFocus = function(){ 
			    	
					if ( $("#listaEntidades").length ) {
						$("#listaEntidades").remove();
						$('#entidadUsuario').val('');
						$("#listaResponsable").remove();
						$('#unidadResponsableUsuario').val('');
					}
			    	var linkNivel = document.getElementById('nivelUsuario').value;
			    	var datosEntidades = $.ajax({
			         	 url:'http://spr.stp.gov.py/ajaxSelects?accion=getEntidades&nivel='+linkNivel,
			          	type:'get',
			          	dataType:'json',
			          	async:false
			    	}).responseText;
			    	datosEntidades = JSON.parse(datosEntidades);
			    	
			        var datalistNiveles = document.createElement('datalist');
			        datalistNiveles.setAttribute('id','listaEntidades');
			        datalistNiveles.setAttribute('size','5'); 
			        var ubicacionDatalistNiveles = document.getElementById('formulario');
			        ubicacionDatalistNiveles.appendChild(datalistNiveles);
			
			        for(var i = 0; i < datosEntidades.entidades.length ; i++) 
			        {    
			        	var option = document.createElement('option');
			          	option.setAttribute('value',datosEntidades.entidades[i].entidad);
			          	option.setAttribute('label',datosEntidades.entidades[i].nombreEntidad);
			          	datalistNiveles.appendChild(option);      
			      	} 
			    	
			     } 
			    this.unidadResponsableFocus = function(){ 
			    	
					if ($("#listaResponsable").length ) {
						$("#listaResponsable").remove();
						$('#unidadResponsableUsuario').val('');
					}
			    	var linkNivel = document.getElementById('nivelUsuario').value;
			    	var linkEntidad = document.getElementById('entidadUsuario').value;

			    	var unidadResponsable = $.ajax({
			         	 url:'http://spr.stp.gov.py/tablero/ajaxSelects2?action=getUnidadResponsable&nivelId='+linkNivel+'&entidadId='+linkEntidad,
			          	type:'get',
			          	dataType:'json',
			          	async:false
			    	}).responseText;
			    	unidadResponsable = JSON.parse(unidadResponsable);
			    				      	
			      	$("#unidadResponsableUsuario").html(""); 
			      	var optionUnidadRes="";
					for(var r = 0; r < unidadResponsable.length; r++){
						optionUnidadRes += '<option value="'+unidadResponsable[r].id+'" >'+unidadResponsable[r].nombre+'</option>';
					}
			    	$("#unidadResponsableUsuario").append(optionUnidadRes);
			     }  
			    
			}//fin combo
			
			  var eje1 = new Combo();
			  document.getElementById('nivelUsuario').addEventListener('focus',eje1.nivelFocus,false);
			  document.getElementById('entidadUsuario').addEventListener('focus',eje1.entidadFocus,false);
			  document.getElementById('unidadResponsableUsuario').addEventListener('focus',eje1.unidadResponsableFocus,false); 			

		});
	
		$("body").on("click", ".guardarUsuario",function(event){

			var docUsuarioFile = document.getElementById("documentoUsuario").files[0];
		    
			if (docUsuarioFile != null){
			    var formdata = new FormData();
			    formdata.append('documentoEvidencia', docUsuarioFile);
			    
			     $.ajax({
				         type: "POST",
				         url: "/tablero/UploadServlet", /* contextPath + servletPath, */
				         data: formdata, /* + $('#custIdList').val(), */
				         async: false,
				         processData: false,  // tell jQuery not to process the data
				         contentType: false,   // tell jQuery not to set contentType
				         success: function(data){
				               $("#urlDocUsuario").val(data);
				           }
				     });
			}
		
			var nivelId = $("#nivelUsuario").val();
			var entidadId = $("#entidadUsuario").val();
			var correo = $("#correoUsuario").val();
			var contrasena = $.md5($("#contrasenaUsuario").val());
			var unidadResponsable = $("#unidadResponsableUsuario").val();
			var nombre = $("#nombreUsuarioFormulario").val(); 
			var urlDocumento; 
				if (docUsuarioFile != undefined) urlDocumento = $("#urlDocUsuario").val();
				
			var rolId = $("#rolIdUsuario").val();
			
	    	var nombreEntidad = $.ajax({
	         	 url:'http://spr.stp.gov.py/ajaxSelects?accion=getEntidades&entidadId='+entidadId+'&nivel='+nivelId,
	          	type:'get',
	          	dataType:'json',
	          	async:false
	    	}).responseText;
	    	nombreEntidad = JSON.parse(nombreEntidad);

		  
			//var avanceId = $("#avanceIdEvidencia").val(); No utilizo esta variable xq ya viene en el parse pero lo ideal seria obtener del formulario
		
			//Vaciar los inputs
			$("#nivelUsuario").val("");
			$("#entidadUsuario").val("");
			$("#urlDocUsuario").val("");	
			$("#correoUsuario").val("");
			$("#rolIdUsuario").val("");
			$("#nombreUsuarioFormulario").val("");
			$("#unidadResponsableUsuario").val("");
			$("#contrasenaUsuario").val("");

			
			var objeto = new Object();
			
			objeto.nivel_id = nivelId;
			objeto.entidad_id = entidadId;
			objeto.correo = correo;
			objeto.passwd = contrasena;
			objeto.unidadResponsable = unidadResponsable;
			objeto.nombre = nombre;
			objeto.url = urlDocumento;
			objeto.rol_id = rolId;
			objeto.entidad = nombreEntidad.entidades[0].abrevEntidad;

			//objeto.documentoEvidencia = documentoEvidencia;
			
		  	var info = JSON.stringify(objeto);
		    $.ajax({
		        url: "http://spr.stp.gov.py/ajaxInserts?accion=insUsuario",
		        type: 'POST',
		        dataType: 'json',
		        data: info,
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        success: function (data) {
		        	if(data.success == true)
		        	{
		        		$("#botonGuardarUsuario").remove();
		            	$("#cuerpoModalUsuario").html("");
		            	$("#cuerpoModalUsuario").html("<h3 class='text-center'>GUARDADO EXITOSAMENTE!!</h3>");
		        		renderUsuarios();		        		
		        	}		        	
		        	},
		        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
		        error: function(data,status,er) {
		        	
		        	}
			 });	
		});
		
	$("body").on("click", ".consultaBorrarUsuario",function(event){
		var parametros = $(this).attr("parametros");
	    var idParsed = parametros.split("-"); 
	    var usuarioId = idParsed[0];
	    
		if ( $("#modalBorrarUsuario").length )
		{
			$("#modalBorrarUsuario").remove();
		}		
		
		var usuarios = $.ajax({
			url:'http://spr.stp.gov.py/ajaxSelects?accion=getUsuarios&usuarioId='+usuarioId,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		usuarios = JSON.parse(usuarios);
		usuarios = usuarios.usuarios;
   		
		var contenido = "";

		contenido =			'<div class="modal fade" id="modalBorrarUsuario"  data-backdrop="static" data-keyboard="false" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">'+
							'	<div class="modal-dialog modal-lg">'+
							'		<div class="modal-content" >'+
							'			<div class="modal-header">'+
							'		        <button type="button" class="close cerrarActualizar" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
							'		        <h4 class="modal-title" >Borrar - Restaurar Usuario</h4>'+
							'			</div>'+
							'		    <div class="modal-body">'+
							'			<div id="mensajeBorradoUsuario"></div>'+
							'		    </div>'+
							'			<div class="modal-footer" id="agregarBotonBorradoUsuario">'+
							'			</div>'+
							'		</div>'+ 
							'	</div>'+
							'</div>';
							
			$("body").append(contenido);
			
			if(usuarios[0].borrado == true){
				$("#mensajeBorradoUsuario").html("");
				$("#mensajeBorradoUsuario").append('<h3 class="text-center">Ud. esta seguro que desea RESTABLACER<strong> '+usuarios[0].correo+'</strong></h3>');
				$("#agregarBotonBorradoUsuario").html("");
				$("#agregarBotonBorradoUsuario").append('<button type="button" class="btn btn-success btn-sm borrarUsuario" id="botonRestaurarAccion" parametros='+usuarioId+'-r>Restaurar Acción</button>');
			}else{
				$("#mensajeBorradoUsuario").html("");
				$("#mensajeBorradoUsuario").append('<h3 class="text-center">Ud. esta seguro que desea BORRAR<strong> '+usuarios[0].correo+'</strong></h3');
				$("#agregarBotonBorradoUsuario").html("");
				$("#agregarBotonBorradoUsuario").append('<button type="button" class="btn btn-danger btn-sm borrarUsuario" id="botonBorradoAccion" parametros='+usuarioId+'-b>Borrar Acción</button>');
			}
			
			$('#modalBorrarUsuario').modal('show');
	});
	
	$("body").on("click", ".cerrarActualizar",function(event){

		renderUsuarios();
	});
		
	});
<%}else{%>
	window.location = "http://spr.stp.gov.py/tablero/resumenLineaAccion.jsp";
<%}%>
</script>

    <div class="wrapper">

      <header class="main-header">
		  <%@ include file="/frames/mainheader.jsp" %>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
  			 <%@ include file="/frames/main-sidebar.jsp" %>
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">

        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            <small>
            <!--  Titulo, donde antes estaba dashboard -->
            </small>
          </h1>
         
        </section>

        <!-- Main content -->
        <section class="content">
	          <!-- Info row de buscador de productos -->
	          
			<div class="row">
            	<div class="col-md-12">
              		<div class="box box-default">
	            		<div class="box-header with-border">
	              			<h2 class="box-title text-center">Administrar Usuarios</h2>
	              			<div class="box-tools pull-right"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button></div>
	            		</div><!-- /.header -->
	                	<div class="box-body" id="cuerpoUsuario">

		                </div><!-- /.box-body -->
	              </div><!-- /.box -->
	            </div><!-- /.col -->
          </div><!-- /.row -->
	          
	                  
    </section><!-- /.content -->
      </div><!-- /.content-wrapper -->

      <footer class="main-footer">
        <div class="pull-right hidden-xs">
          <b>Version</b> 2.0
        </div>
        <strong>Copyright &copy; 2015 <a href="http://www.stp.gov.py">STP</a>.</strong> All rights reserved.
      </footer>

      <!-- Control Sidebar -->
      <aside class="control-sidebar control-sidebar-light">
		<!-- include file="/frames/control-sidebar.jsp"  -->
      </aside><!-- /.control-sidebar -->
      <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
      <div class='control-sidebar-bg'></div>

    </div><!-- ./wrapper -->

    <!-- jQuery 2.1.3 -->
    <script src="plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
    <script src="plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='plugins/fastclick/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="dist/js/app.min.js" type="text/javascript"></script>
    <!-- Sparkline -->
    <script src="plugins/sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
    <!-- jvectormap -->
    <script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
    <script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
    <!-- daterangepicker -->
    <script src="plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
    <!-- datepicker -->
    <script src="plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <!-- SlimScroll 1.3.0 -->
    <script src="plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- ChartJS 1.0.1 -->
    <script src="plugins/chartjs/Chart.min.js" type="text/javascript"></script>
    
    
    <!-- AdminLTE dashboard demo (This is only for demo purposes) 
    <script src="dist/js/pages/dashboard2.js" type="text/javascript"></script>-->
    
    <!-- Librerias para la rutina de cambio de contraseña -->
    <script src="dist/js/jquerymd5.js" type="text/javascript"></script>    	
    <%@ include file="/frames/pass.jsp" %>
    
    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js" type="text/javascript"></script>
     
        <%  } else { %>
				est<p>Favor Iniciar Sesion</p>
			<%} %>
	

<!-- Piwik -->
<script type="text/javascript">


  var _paq = _paq || [];
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {
    var u="//infra.stp.gov.py/monitoreoweb/";
    _paq.push(['setTrackerUrl', u+'piwik.php']);
    _paq.push(['setSiteId', 9]);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
  })();
</script>
<noscript><p><img src="//infra.stp.gov.py/monitoreoweb/piwik.php?idsite=9" style="border:0;" alt="" /></p></noscript>
<!-- End Piwik Code  -->

<script type="text/javascript" src="bootstrap/js/bootstrap-slider.js"></script>
</body>
</html>
