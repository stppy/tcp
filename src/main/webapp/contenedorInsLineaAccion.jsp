<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="org.jasig.cas.client.authentication.AttributePrincipalImpl"%>
<%@ page import="org.jasig.cas.client.authentication.AttributePrincipal"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>


<!DOCTYPE html>
<html>
  <head>
 	 <%@ include file="/frames/head.jsp" %>	 
	<script type="text/javascript" src="dist/canvasjs/canvasjs.min.js" ></script>
	<script src="/dist/js/jspdf.min.js"></script>
	
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrapslider.css" rel="stylesheet">	
	<script src="plugins/jquery-bootstrap-modal-steps.js"></script>	
	
	<!-- jQuery 2.1.3  -->
    <!-- >script src="plugins/jQuery/jQuery-2.1.3.min.js"></script-->
    
    <!-- leaflet css -->
    <link rel="stylesheet" href="plugins/mapa/leaflet.css" />
    <script src="plugins/mapa/leaflet.js"></script>
    <!-- leaflet location picker css -->
    <link href="plugins/mapa/leaflet-locationpicker.css" rel="stylesheet">
    <script src="plugins/mapa/leaflet-locationpicker.js"></script>
    
    <link href="plugins/datatables/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="plugins/datatables/css/buttons.dataTables.min.css" rel="stylesheet">       
	
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
    </style>
    
    



</head>
<body class="skin-blue sidebar-mini sidebar-collapse">

<% AttributePrincipal user = (AttributePrincipal) request.getUserPrincipal();%> 
<% Map attributes = user.getAttributes(); 
if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2") || attributes.get("role_id_tablero").toString().equals("3")){
if (user != null && user.getName()!= "parce@nandeparaguay.org") { %>
	<%@ include file="/frames/perfil.jsp" %>
<script>
//periodoSeleccionado=new Date().getFullYear();
//periodoSeleccionado = $("#periodoSeleccion option:selected").val();
function renderInsLineaAccion(PeriodoActual){
	
	var insLineaAccion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getInsLineaAccion',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;		
	insLineaAccion=JSON.parse(insLineaAccion);

	var lineaAccion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getLineaAccion',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	lineaAccion = JSON.parse(lineaAccion);

	var institucion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getInstitucion',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	institucion = JSON.parse(institucion);

	var periodo = $.ajax({
		url:'/tablero/ajaxSelects2?action=getPeriodo',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	periodo = JSON.parse(periodo);

	var unidadMedida = $.ajax({
		url:'/tablero/ajaxSelects2?action=getUnidadMedida',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	unidadMedida = JSON.parse(unidadMedida);

	var usuarioLineaAccion = $.ajax({
		url:'/tablero/ajaxSelects2?action=getUsuarioLineaAccion',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	usuarioLineaAccion = JSON.parse(usuarioLineaAccion);

	var todasLasLineasAccion="";
	for(var f = 0; f < insLineaAccion.length; f++)
	{
		if (todasLasLineasAccion.indexOf(""+insLineaAccion[f].id) == -1){ 
			todasLasLineasAccion += insLineaAccion[f].id+",";
		}
	}
	todasLasLineasAccion = todasLasLineasAccion.substring(0,todasLasLineasAccion.length - 1);

	var insLineaAccionHasEtiqueta = $.ajax({
		url:'/tablero/ajaxSelects2?action=getInsLineaAccionHasEtiqueta&insLineaAccionIdConcat='+todasLasLineasAccion,
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	insLineaAccionHasEtiqueta = JSON.parse(insLineaAccionHasEtiqueta);
	
	var usuarioEtiqueta = $.ajax({
		url:'/tablero/ajaxSelects2?action=getUsuarioEtiqueta',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	usuarioEtiqueta = JSON.parse(usuarioEtiqueta);
	

	var tablaInsLineaAccion="";
	var cuerpoTablaInsLineaAccion="";
	$("#cuerpoInsLineaAccion").html("");
	
	var tablaInsLineaAccionPosterior = "";
	var cuerpoTablaInsLineaAccionPosterior="";
	$("#cuerpoInsLineaAccionPosterior").html("");
	
	var tablaInsLineaAccionAnterior = "";
	var cuerpoTablaInsLineaAccionAnterior="";
	$("#cuerpoInsLineaAccionAnterior").html("");
	

 	var bandLineaAccion;
 	var bandInstitucion;
 	var bandPeriodo;
 	
	for(var w=0; w<insLineaAccion.length;w++)
	{
		
		if(onoff==true && insLineaAccion[w].borrado == true){
			// pasa a la siguiente fila en el for ++
		}else{
			bandLineaAccion = 0;
		 	bandInstitucion = 0;
		 	bandPeriodo = 0;
		 	
		 	
		 	for(var l = 0; l < usuarioEtiqueta.length; l++)
			{
				//if(usuarioEtiqueta[l].etiqueta_id == 1 && usuarioEtiqueta[l].borrado != true)
		 		if(usuarioEtiqueta[l].etiqueta_id == 1)
				{
					for(var t = 0; t < insLineaAccionHasEtiqueta.length; t++)
					{
						if(insLineaAccionHasEtiqueta[t].ins_linea_accion_id == insLineaAccion[w].id && insLineaAccionHasEtiqueta[t].etiqueta_id == 1)
						{
							for(var d=0; d<usuarioLineaAccion.length;d++)
							{
								if(usuarioLineaAccion[d].lineaAccionId == insLineaAccion[w].lineaAccionId)
								{
									if(insLineaAccion[w].periodoId == PeriodoActual)
								 	{		 		
										for(p = 0;p<periodo.length; p++)
										{
											if(insLineaAccion[w].periodoId == periodo[p].id)
											{
												if(insLineaAccion[w].borrado == true){
													<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1")){%>
														cuerpoTablaInsLineaAccion+='<tr><td><del>'+periodo[p].nombre+'</del></td>';
													<%}%>
												}else{
													<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
														cuerpoTablaInsLineaAccion+='<tr><td>'+periodo[p].nombre+'</td>';
													<%} if (attributes.get("role_id_tablero").toString().equals("3")){%>
														cuerpoTablaInsLineaAccion+='<tr><td>'+periodo[p].nombre+'</td>';
													<%}%>
												}
												bandPeriodo = 1;
											}
										}
										
										if(bandPeriodo == 0)
										{
											cuerpoTablaInsLineaAccion+='<td>'+insLineaAccion[w].periodoId+'</td>';
										} 
										for(m = 0;m<institucion.length; m++){
											if(insLineaAccion[w].institucionId == institucion[m].id)
											{
												if(insLineaAccion[w].borrado == true){
													<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1")){%>
														cuerpoTablaInsLineaAccion+='<td><del>'+institucion[m].sigla+'</del></td>';
													<%}%>
												}else{
													<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
														cuerpoTablaInsLineaAccion+='<td>'+institucion[m].sigla+'</td>';
													<%} if (attributes.get("role_id_tablero").toString().equals("3")){%>
														cuerpoTablaInsLineaAccion+='<td>'+institucion[m].sigla+'</td>';
													<%}%>
												}
												bandInstitucion = 1;
											}
										}
										
										if(bandInstitucion == 0)
										{
											cuerpoTablaInsLineaAccion+='<td>'+insLineaAccion[w].institucionId+'</td>';
										}
										
										for(i = 0;i<lineaAccion.length; i++){				
											if(insLineaAccion[w].lineaAccionId == lineaAccion[i].id)
											{
												if(insLineaAccion[w].borrado == true){
													<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1")){%>
														cuerpoTablaInsLineaAccion+='<td><del>'+lineaAccion[i].nombre+'</del></td>';
													<%}%>
												}else{
													<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
														cuerpoTablaInsLineaAccion+='<td>'+lineaAccion[i].nombre+'</td>';
													<%} if (attributes.get("role_id_tablero").toString().equals("3")){%>
														cuerpoTablaInsLineaAccion+='<td>'+lineaAccion[i].nombre+'</td>';
													<%}%>
												}
												bandLineaAccion = 1;
											}
										}
													
										if(bandLineaAccion == 0)
										{
											cuerpoTablaInsLineaAccion+='<td>'+insLineaAccion[w].lineaAccionId+'</td>';
										}
																
										var codigoUnidadMedida;
										var nombreUnidadMedida;
										for(h = 0;h<lineaAccion.length; h++){				
											if(insLineaAccion[w].lineaAccionId == lineaAccion[h].id)
											{
												codigoUnidadMedida=lineaAccion[h].unidadMedidaId;
												
												for(var k = 0; k < unidadMedida.length; k++)
												{
													if(codigoUnidadMedida == unidadMedida[k].id)
													{
														nombreUnidadMedida = unidadMedida[k].descripcion;
													}
												}
											}
										}
										
										if(insLineaAccion[w].borrado == true){
											<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1")){%>
					 							cuerpoTablaInsLineaAccion+='<td><del>'+numeroConComa(parseFloat(insLineaAccion[w].meta))+'</del></td><td class="text-center"><del>'+nombreUnidadMedida+'</del></td><td class="text-center"><button type="button" class="btn btn-default btn-sm consultaBorrarInsLineaAccion" data-toggle="tooltip" data-placement="top" title="Borrar Acción" parametrosBorradoInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].borrado+'><span class="glyphicon glyphicon-refresh"></span></button></td></tr>';
						 					<%}%>	
											}else{
											<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
					 							cuerpoTablaInsLineaAccion+='<td>'+numeroConComa(parseFloat(insLineaAccion[w].meta))+'</td><td class="text-center">'+nombreUnidadMedida+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm registrosInsLineaAccion" data-toggle="tooltip" data-placement="top" title="Editar Línea de Acción" codigoRegistroInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'-'+insLineaAccion[w].meta+'-'+insLineaAccion[w].version+'><span class="glyphicon glyphicon-pencil" ></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarInsLineaAccion" data-toggle="tooltip" data-placement="top" title="Borrar Línea de Acción" parametrosBorradoInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].borrado+'><span class="glyphicon glyphicon-trash"></span></button><button type="button" class="btn btn-default btn-sm  agregarAccion" data-toggle="tooltip" data-placement="top" title="Agregar Acción" parametros="'+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'"><span class="glyphicon glyphicon-list-alt"></span></button><button type="button" class="btn btn-default btn-sm avanceCualitativo" data-toggle="tooltip" data-placement="top" title="Avance Cualitativo" parametros="'+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'"><span class="glyphicon glyphicon-tasks"></span></button></td></tr>';
											<%} if (attributes.get("role_id_tablero").toString().equals("3")){%>
												cuerpoTablaInsLineaAccion+='<td>'+numeroConComa(parseFloat(insLineaAccion[w].meta))+'</td><td class="text-center">'+nombreUnidadMedida+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm  agregarAccion" data-toggle="tooltip" data-placement="top" title="Agregar Acción" parametros="'+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'"><span class="glyphicon glyphicon-list-alt"></span></button><button type="button" class="btn btn-default btn-sm avanceCualitativo" data-toggle="tooltip" data-placement="top" title="Avance Cualitativo" parametros="'+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'"><span class="glyphicon glyphicon-tasks"></span></button></td></tr>';
											<%}%>
										}
									}
									
								 	//Periodo posterior		 	
								 	 if(insLineaAccion[w].periodoId > PeriodoActual )
								 	{		 		
										for(p = 0;p<periodo.length; p++)
										{
											if(insLineaAccion[w].periodoId == periodo[p].id)
											{
												if(insLineaAccion[w].borrado == true){
													<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1")){%>
														cuerpoTablaInsLineaAccionPosterior+='<tr><td><del>'+periodo[p].nombre+'</del></td>';
													<%}%>
												}else{
													<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
														cuerpoTablaInsLineaAccionPosterior+='<tr><td>'+periodo[p].nombre+'</td>';
													<%} if (attributes.get("role_id_tablero").toString().equals("3")){%>
														cuerpoTablaInsLineaAccionPosterior+='<tr><td>'+periodo[p].nombre+'</td>';
													<%}%>
												}
												bandPeriodo = 1;
											}
										}
										
										if(bandPeriodo == 0)
										{
											cuerpoTablaInsLineaAccionPosterior+='<td>'+insLineaAccion[w].periodoId+'</td>';
										}
									
										for(m = 0;m<institucion.length; m++){
											if(insLineaAccion[w].institucionId == institucion[m].id)
											{
												if(insLineaAccion[w].borrado == true){
													<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1")){%>
														cuerpoTablaInsLineaAccionPosterior+='<td><del>'+institucion[m].sigla+'</del></td>';
													<%}%>
												}else{
													<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
														cuerpoTablaInsLineaAccionPosterior+='<td>'+institucion[m].sigla+'</td>';
													<%} if (attributes.get("role_id_tablero").toString().equals("3")){%>
														cuerpoTablaInsLineaAccionPosterior+='<td>'+institucion[m].sigla+'</td>';
													<%}%>
												}
												bandInstitucion = 1;
											}
										}
										
										if(bandInstitucion == 0)
										{
											cuerpoTablaInsLineaAccionPosterior+='<td>'+insLineaAccion[w].institucionId+'</td>';
										}
										
										for(i = 0;i<lineaAccion.length; i++){				
											if(insLineaAccion[w].lineaAccionId == lineaAccion[i].id)
											{
												if(insLineaAccion[w].borrado == true){
													<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1")){%>
														cuerpoTablaInsLineaAccionPosterior+='<td><del>'+lineaAccion[i].nombre+'</del></td>';
													<%}%>
												}else{
													<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
														cuerpoTablaInsLineaAccionPosterior+='<td>'+lineaAccion[i].nombre+'</td>';	
													<%} if (attributes.get("role_id_tablero").toString().equals("3")){%>
														cuerpoTablaInsLineaAccionPosterior+='<td>'+lineaAccion[i].nombre+'</td>';	
													<%}%>
												}
												bandLineaAccion = 1;
											}
										}
													
										if(bandLineaAccion == 0)
										{
											cuerpoTablaInsLineaAccionPosterior+='<td>'+insLineaAccion[w].lineaAccionId+'</td>';
										}
																
										var codigoUnidadMedida;
										var nombreUnidadMedida;
										for(h = 0;h<lineaAccion.length; h++){				
											if(insLineaAccion[w].lineaAccionId == lineaAccion[h].id)
											{
												codigoUnidadMedida=lineaAccion[h].unidadMedidaId;
												
												for(var k = 0; k < unidadMedida.length; k++)
												{
													if(codigoUnidadMedida == unidadMedida[k].id)
													{
														nombreUnidadMedida = unidadMedida[k].descripcion;
													}
												}
											}
										}
										
										if(insLineaAccion[w].borrado == true){
											<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1")){%>
						 						cuerpoTablaInsLineaAccionPosterior+='<td><del>'+insLineaAccion[w].meta+'</del></td><td class="text-center"><del>'+nombreUnidadMedida+'</del></td><td class="text-center"><button type="button" class="btn btn-default btn-sm registrosInsLineaAccion" data-toggle="tooltip" data-placement="top" title="Editar Línea de Acción" codigoRegistroInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'-'+insLineaAccion[w].meta+'-'+insLineaAccion[w].version+'><span class="glyphicon glyphicon-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarInsLineaAccion" data-toggle="tooltip" data-placement="top" title="Borrar Línea de Acción" parametrosBorradoInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].borrado+'><span class="glyphicon glyphicon-trash"></span></button><button type="button" class="btn btn-default btn-sm agregarAccion" data-toggle="tooltip" data-placement="top" title="Agregar Acción" parametros="'+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'"><span class="glyphicon glyphicon-list-alt"></span></button><button type="button" class="btn btn-default btn-sm avanceCualitativo" data-toggle="tooltip" data-placement="top" title="Avance Cualitativo" parametros="'+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'"><span class="glyphicon glyphicon-tasks"></span></button></td></tr>'; 
											<%}%>
										}else{
											<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
						 						cuerpoTablaInsLineaAccionPosterior+='<td>'+insLineaAccion[w].meta+'</td><td class="text-center">'+nombreUnidadMedida+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm registrosInsLineaAccion" data-toggle="tooltip" data-placement="top" title="Editar Línea de Acción" codigoRegistroInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'-'+insLineaAccion[w].meta+'-'+insLineaAccion[w].version+'><span class="glyphicon glyphicon-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarInsLineaAccion" data-toggle="tooltip" data-placement="top" title="Borrar Línea de Acción" parametrosBorradoInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].borrado+'><span class="glyphicon glyphicon-trash"></span></button><button type="button" class="btn btn-default btn-sm agregarAccion" data-toggle="tooltip" data-placement="top" title="Agregar Acción" parametros="'+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'"><span class="glyphicon glyphicon-list-alt"></span></button><button type="button" class="btn btn-default btn-sm avanceCualitativo" data-toggle="tooltip" data-placement="top" title="Avance Cualitativo" parametros="'+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'"><span class="glyphicon glyphicon-tasks"></span></button></td></tr>';
											<%} if (attributes.get("role_id_tablero").toString().equals("3")){%>
												cuerpoTablaInsLineaAccionPosterior+='<td>'+insLineaAccion[w].meta+'</td><td class="text-center">'+nombreUnidadMedida+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm agregarAccion" data-toggle="tooltip" data-placement="top" title="Agregar Acción" parametros="'+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'"><span class="glyphicon glyphicon-list-alt"></span></button><button type="button" class="btn btn-default btn-sm avanceCualitativo" data-toggle="tooltip" data-placement="top" title="Avance Cualitativo" parametros="'+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'"><span class="glyphicon glyphicon-tasks"></span></button></td></tr>';
											<%}%>
										}
									}
								 	
								 	//periodo anterior
								 	if(insLineaAccion[w].periodoId < PeriodoActual)
								 	{		 		
										for(p = 0;p<periodo.length; p++)
										{
											if(insLineaAccion[w].periodoId == periodo[p].id)
											{
												if(insLineaAccion[w].borrado == true){
													<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1")){%>
														cuerpoTablaInsLineaAccionAnterior+='<tr><td><del>'+periodo[p].nombre+'</del></td>';
													<%}%>
												}else{
													<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
														cuerpoTablaInsLineaAccionAnterior+='<tr><td>'+periodo[p].nombre+'</td>';
													<%} if (attributes.get("role_id_tablero").toString().equals("3")){%>
														cuerpoTablaInsLineaAccionAnterior+='<tr><td>'+periodo[p].nombre+'</td>';
													<%}%>
												}
												bandPeriodo = 1;
											}
										}
										
										if(bandPeriodo == 0)
										{
											cuerpoTablaInsLineaAccionAnterior+='<td>'+insLineaAccion[w].periodoId+'</td>';
										}
									
										for(m = 0;m<institucion.length; m++){
											if(insLineaAccion[w].institucionId == institucion[m].id)
											{
												if(insLineaAccion[w].borrado == true){
													<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1")){%>
														cuerpoTablaInsLineaAccionAnterior+='<td><del>'+institucion[m].sigla+'</del></td>';
													<%}%>
												}else{
													<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
														cuerpoTablaInsLineaAccionAnterior+='<td>'+institucion[m].sigla+'</td>';
													<%} if (attributes.get("role_id_tablero").toString().equals("3")){%>
														cuerpoTablaInsLineaAccionAnterior+='<td>'+institucion[m].sigla+'</td>';
													<%}%>
												}
												bandInstitucion = 1;
											}
										}
										
										if(bandInstitucion == 0)
										{
											cuerpoTablaInsLineaAccionAnterior+='<td>'+insLineaAccion[w].institucionId+'</td>';
										}
										
										for(i = 0;i<lineaAccion.length; i++){				
											if(insLineaAccion[w].lineaAccionId == lineaAccion[i].id)
											{
												if(insLineaAccion[w].borrado == true){
													<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1")){%>
														cuerpoTablaInsLineaAccionAnterior+='<td><del>'+lineaAccion[i].nombre+'</del></td>';
													<%}%>
												}else{
													<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
														cuerpoTablaInsLineaAccionAnterior+='<td>'+lineaAccion[i].nombre+'</td>';
													<%} if (attributes.get("role_id_tablero").toString().equals("3")){%>
														cuerpoTablaInsLineaAccionAnterior+='<td>'+lineaAccion[i].nombre+'</td>';
													<%}%>
												}
												bandLineaAccion = 1;
											}
										}
													
										if(bandLineaAccion == 0)
										{
											cuerpoTablaInsLineaAccionAnterior+='<td>'+insLineaAccion[w].lineaAccionId+'</td>';
										}
																
										var codigoUnidadMedida;
										var nombreUnidadMedida;
										for(h = 0;h<lineaAccion.length; h++){				
											if(insLineaAccion[w].lineaAccionId == lineaAccion[h].id)
											{
												codigoUnidadMedida=lineaAccion[h].unidadMedidaId;
												
												for(var k = 0; k < unidadMedida.length; k++)
												{
													if(codigoUnidadMedida == unidadMedida[k].id)
													{
														nombreUnidadMedida = unidadMedida[k].descripcion;
													}
												}
											}
										}
										
										if(insLineaAccion[w].borrado == true){
											<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1")){%>
						 						cuerpoTablaInsLineaAccionAnterior+='<td><del>'+insLineaAccion[w].meta+'</del></td><td class="text-center"><del>'+nombreUnidadMedida+'</del></td><td class="text-center"><button type="button" class="btn btn-default btn-sm registrosInsLineaAccion" data-toggle="tooltip" data-placement="top" title="Editar Línea de Acción" codigoRegistroInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'-'+insLineaAccion[w].meta+'-'+insLineaAccion[w].version+'><span class="glyphicon glyphicon-pencil"></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarInsLineaAccion" data-toggle="tooltip" data-placement="top" title="Borrar Línea de Acción" parametrosBorradoInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].borrado+'><span class="glyphicon glyphicon-trash"></span></button><button type="button" class="btn btn-default btn-sm agregarAccion" data-toggle="tooltip" data-placement="top" title="Agregar Acción" parametros="'+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'"><span class="glyphicon glyphicon-list-alt"></span></button><button type="button" class="btn btn-default btn-sm avanceCualitativo" data-toggle="tooltip" data-placement="top" title="Avance Cualitativo" parametros="'+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'"><span class="glyphicon glyphicon-tasks"></span></button></td></tr>';
											<%}%>
										}else{
											<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
						 						cuerpoTablaInsLineaAccionAnterior+='<td>'+insLineaAccion[w].meta+'</td><td class="text-center">'+nombreUnidadMedida+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm registrosInsLineaAccion" data-toggle="tooltip" data-placement="top" title="Editar Línea de Acción" codigoRegistroInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'-'+insLineaAccion[w].meta+'-'+insLineaAccion[w].version+'><span class="glyphicon glyphicon-pencil" ></span></button><button type="button" class="btn btn-default btn-sm consultaBorrarInsLineaAccion" data-toggle="tooltip" data-placement="top" title="Borrar Línea de Acción" parametrosBorradoInsLineaAccion='+insLineaAccion[w].id+'-'+insLineaAccion[w].borrado+'><span class="glyphicon glyphicon-trash"></span></button><button type="button" class="btn btn-default btn-sm agregarAccion" data-toggle="tooltip" data-placement="top" title="Agregar Acción" parametros="'+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'"><span class="glyphicon glyphicon-list-alt"></span></button><button type="button" class="btn btn-default btn-sm avanceCualitativo" data-toggle="tooltip" data-placement="top" title="Avance Cualitativo" parametros="'+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'"><span class="glyphicon glyphicon-tasks"></span></button></td></tr>';
											<%} if (attributes.get("role_id_tablero").toString().equals("3")){%>
												cuerpoTablaInsLineaAccionAnterior+='<td>'+insLineaAccion[w].meta+'</td><td class="text-center">'+nombreUnidadMedida+'</td><td class="text-center"><button type="button" class="btn btn-default btn-sm agregarAccion" data-toggle="tooltip" data-placement="top" title="Agregar Acción" parametros="'+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'"><span class="glyphicon glyphicon-list-alt"></span></button><button type="button" class="btn btn-default btn-sm avanceCualitativo" data-toggle="tooltip" data-placement="top" title="Avance Cualitativo" parametros="'+insLineaAccion[w].id+'-'+insLineaAccion[w].lineaAccionId+'-'+insLineaAccion[w].institucionId+'-'+insLineaAccion[w].periodoId+'"><span class="glyphicon glyphicon-tasks"></span></button></td></tr>';
											<%}%>
										}
									}	
								}
							}	
						}
					}
				}	
			}
		}	
	 	
	}
	//Tabla de linea de accion actual
	var tablaInsLineaAccion = 	'<div class="table-responsive">'+
			'<table class="table table-hover" id="dataTableInsLineaAccion">'+
				'<thead>'+
			  		'<tr class="active"><th colspan="6">Línea de Acción por Institución</th></tr>'+
			  		'<tr class="active"><th style="min-width:110px">Periodo</th><th>Institución</th><th>Línea de Acción</th><th>Meta</th><th class="text-center">U.Medida</th><th style="min-width:250px" class="text-center">Administrar Linea Acción </th></tr>'+
			 	'</thead>'+
			 	'<tfoot>'+
			 		'<tr>'+
			 			'<th>Total</th><th></th><th></th><th></th><th></th><th></th>'+
			 		'</tr>'+
	            '</tfoot>'+

			 	'<tbody id="tablaCuerpoInsLineaAccionPrecargados">'+
			 	
			 	'</tbody>'+
			' </table> '+
		'</div>';
	$('#cuerpoInsLineaAccion').append(tablaInsLineaAccion);
	$('#tablaCuerpoInsLineaAccionPrecargados').append(cuerpoTablaInsLineaAccion);
		
	$('#dataTableInsLineaAccion').DataTable(
	{
	        dom: 'Bfrtip',
	        buttons: [
	                    {
	                        extend: 'copy',
	                        exportOptions: {
	                    columns: [ 0, 1, 2, 3, 4 ]
	                }
	                    },
	                    {
	                        extend: 'csv',
	                        exportOptions: {
	                    columns: [ 0, 1, 2, 3, 4 ]
	                }
	                    },
	                    {
	                        extend: 'excel',
	                        exportOptions: {
	                    columns: [ 0, 1, 2, 3, 4 ]
	                }
	                    },
	                    {
	                        extend: 'pdf',
	                        exportOptions: {
	                    columns: [ 0, 1, 2, 3, 4 ]
	                }
	                    },
	                    {
	                        extend: 'print',
	                        exportOptions: {
	                    columns: [ 0, 1, 2, 3, 4 ]
	                }
	                    }
	                ],
	        "footerCallback": function ( row, data, start, end, display ) {
	        	var api = this.api(), data;
	        	SumarizarColumnas(row, data, start, end, display, api, 1, null );
	        },
	        "search": {
	            "regex": true
			}
	}
	
	);
		
	function SumarizarColumnas( row, data, start, end, display, api, cantColumnas, Indices ){
		//var api = this.api(), data;
		 
        // saca los puntos y <del> de la cadena para pasarlo a entero
		var intVal = function(i){
        	if(typeof i==='string'){	
        		i=i.replace(/[\."<\/*del>""Gs\."]/g, '');
        		i=i.replace(/[","]/g, '.');
        		i=i*1;		            		
        	}else{
        		if(typeof i==='number'){
        			i=i;		            			
        	}else{
        		i=0;
        	}
        }
        	return i;
        };

        // total general para todas las paginas
        total = api
            .column( 3 )
            .data()
            .reduce( function (a, b) {
                return intVal(a) + intVal(b);
            }, 0 );

        // total por pagina 
        pageTotal = api
            .column( 3, { page: 'current'} )
            .data()
            .reduce( function (a, b) {
                return intVal(a) + intVal(b);
            }, 0 );

        // se muestran los valores de los totales en el footer del table
        $( api.column( 3 ).footer() ).html(
        		'Total Pág. '+numeroConComa(pageTotal) +' (Total Gral. '+ numeroConComa(total) +')'
        );	
	}
		
	//Tabla de linea de accion del año que viene
	var tablaInsLineaAccionPosterior = 	'<div class="table-responsive">'+
			'<table class="table table-hover" id="dataTableInsLineaAccionPosterior">'+
				'<thead>'+
			  		'<tr class="active"><th colspan="6">Línea de Acción por Institución</th></tr>'+
			  		'<tr class="active"><th style="min-width:110px">Periodo</th><th>Institución</th><th>Línea de Acción</th><th>Meta</th><th class="text-center">U.Medida</th><th style="min-width:250px" class="text-center">Administrar Linea Acción</th></tr>'+
			 	'</thead>'+
			 	'<tfoot>'+
		 			'<tr>'+
		 				'<th>Total</th><th></th><th></th><th></th><th></th><th></th>'+
		 			'</tr>'+
            	'</tfoot>'+
			 	'<tbody id="tablaCuerpoInsLineaAccionPrecargadosPosterior">'+			 	
			 	'</tbody>'+
			' </table> '+
		'</div>';
	$('#cuerpoInsLineaAccionPosterior').append(tablaInsLineaAccionPosterior);
	$('#tablaCuerpoInsLineaAccionPrecargadosPosterior').append(cuerpoTablaInsLineaAccionPosterior);
	$("#dataTableInsLineaAccionPosterior").DataTable(
	{
	        dom: 'Bfrtip',
	        buttons: [
	                    {
	                        extend: 'copy',
	                        exportOptions: {
	                    columns: [ 0, 1, 2, 3, 4 ]
	                }
	                    },
	                    {
	                        extend: 'csv',
	                        exportOptions: {
	                    columns: [ 0, 1, 2, 3, 4 ]
	                }
	                    },
	                    {
	                        extend: 'excel',
	                        exportOptions: {
	                    columns: [ 0, 1, 2, 3, 4 ]
	                }
	                    },
	                    {
	                        extend: 'pdf',
	                        exportOptions: {
	                    columns: [ 0, 1, 2, 3, 4 ]
	                }
	                    },
	                    {
	                        extend: 'print',
	                        exportOptions: {
	                    columns: [ 0, 1, 2, 3, 4 ]
	                }
	                    }
	                ],
	        "footerCallback": function ( row, data, start, end, display ) {
	        	var api = this.api(), data;
	        	SumarizarColumnas(row, data, start, end, display, api, 1, null );
	        },
	        "search": {
	            "regex": true
			}
	});
	
	//Tabla de linea de accion del año anterior
	var tablaInsLineaAccionAnterior = 	'<div class="table-responsive">'+
		'<table class="table table-hover" id="dataTableInsLineaAccionAnterior">'+
			'<thead>'+
		  		'<tr class="active"><th colspan="6">Línea de Acción por Institución</th></tr>'+
		  		'<tr class="active"><th style="min-width:110px">Periodo</th><th>Institución</th><th>Línea de Acción</th><th>Meta</th><th class="text-center">U.Medida</th><th style="min-width:250px" class="text-center">Administrar Linea Acción</th></tr>'+
		 	'</thead>'+
		 	'<tfoot>'+
 				'<tr>'+
 					'<th>Total</th><th></th><th></th><th></th><th></th><th></th>'+
 				'</tr>'+
    		'</tfoot>'+
		 	'<tbody id="tablaCuerpoInsLineaAccionPrecargadosAnterior">'+
		 	
		 	'</tbody>'+
		' </table> '+
		'</div>';
	$('#cuerpoInsLineaAccionAnterior').append(tablaInsLineaAccionAnterior);
	$('#tablaCuerpoInsLineaAccionPrecargadosAnterior').append(cuerpoTablaInsLineaAccionAnterior);
	$("#dataTableInsLineaAccionAnterior").DataTable(
	{
		        dom: 'Bfrtip',
		        buttons: [
		                    {
		                        extend: 'copy',
		                        exportOptions: {
		                    columns: [ 0, 1, 2, 3, 4 ]
		                }
		                    },
		                    {
		                        extend: 'csv',
		                        exportOptions: {
		                    columns: [ 0, 1, 2, 3, 4 ]
		                }
		                    },
		                    {
		                        extend: 'excel',
		                        exportOptions: {
		                    columns: [ 0, 1, 2, 3, 4 ]
		                }
		                    },
		                    {
		                        extend: 'pdf',
		                        exportOptions: {
		                    columns: [ 0, 1, 2, 3, 4 ]
		                }
		                    },
		                    {
		                        extend: 'print',
		                        exportOptions: {
		                    columns: [ 0, 1, 2, 3, 4 ]
		                }
		                    }
		                ],
		        "footerCallback": function ( row, data, start, end, display ) {
		        	var api = this.api(), data;
		        	SumarizarColumnas(row, data, start, end, display, api, 1, null );
		        },
		        "search": {
		            "regex": true
				}	
	}
	);
	
	}

<%if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){%>
 $(document).ready(function(){	
 			
		 <!-- /*%if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1") || attributes.get("role_id_tablero").toString().equals("2")){% */ -->
			var periodo = $.ajax({
				url:'/tablero/ajaxSelects2?action=getPeriodo',
			  	type:'get',
			  	dataType:'json',
			  	async:false       
			}).responseText;
			periodo = JSON.parse(periodo);
			var optionPeriodo;
	
			for(p = 0;p<periodo.length; p++)
			{
				if(periodo[p].id >= 2014){
					if(periodo[p].id == 2016)
					{
						optionPeriodo+='<option value="'+periodo[p].id+'" selected>'+periodo[p].nombre+'</option>';
					}else{
						optionPeriodo+='<option value="'+periodo[p].id+'" >'+periodo[p].nombre+'</option>';
					}
				}
			}	
		
			var ocultarBorrado= '<div class="col-sm-4">'+
									'<label for="periodoSeleccion">Periodo</label>'+
									'<select id="periodoSeleccion" class="form-control">'+optionPeriodo+'</select>'+
								'</div>'+
								'<div class="col-sm-6">'+
								'</div>'+
								'<div class="col-sm-2">'+
									'<div class="checkbox">'+
										'<label> <input type="checkbox" id="chkMostrarOcultar">Ocultar Registros Borrados</label>'+
									'</div>'+
								'</div>';
								
			$('#mostrarOcultarBorrado').append(ocultarBorrado);
		<!-- /*%}%*/ -->
	 
	 	periodoSeleccionado = $("#periodoSeleccion option:selected").val();
	 
 		onoff=false;
		function OcultarRegistrosBorrados(){
			if($("#chkMostrarOcultar").is(':checked')){
				onoff=true;						
			}else{
				onoff=false;			
			}	
			renderInsLineaAccion(periodoSeleccionado);
			//$("tr > td > del").closest("tr").toggle(onoff);
		}

		var entidadCas = "";
		entidadCas ="<%=attributes.get("entidad") %>";
		usuarioRolCas="<%=attributes.get("role_id_tablero") %>";
		
		usr_nivel_id="<%=attributes.get("nivel_id") %>";
		usr_entidad_id="<%=attributes.get("entidad_id") %>";
		usr_unr_id="<%=attributes.get("unr_id") %>";
		
		var usuarios = $.ajax({
			url:'/tablero/ajaxSelects?action=getUsuarios&usuario=<%=user.getName()%>',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		usuarios = JSON.parse(usuarios);
		usuarios = usuarios.usuarios;
		
		//$("#nombreUsuario").append(usuarios[0].correo+" ("+usuarios[0].nivel_id+", "+usuarios[0].entidad_id+")");
		//$("#PerfilUsuario").append(usuarios[0].nombre+" ("+usuarios[0].nivel_id+", "+usuarios[0].entidad_id+", "+entidadCas+")");
		
		//$("#botonImprimirAvanceInstitucional").attr('parametros', usuarios[0].nivel_id+"-"+usuarios[0].entidad_id+"-"+usuarios[0].unidadResponsable);
		
				
		renderInsLineaAccion(periodoSeleccionado);				
		
		$("body").on("click", "#chkMostrarOcultar",function(event){			
			OcultarRegistrosBorrados();
		});		
		
		$("body").on("change", "#periodoSeleccion",function(event){	
		   	periodoSeleccionado = $("#periodoSeleccion option:selected").val();
		   	renderInsLineaAccion(periodoSeleccionado);
		   			   	
		});
				
		/* $('.pagination').on('click',function(){
			OcultarRegistrosBorrados();
			}); */
					
	});
<%}else{%>
	window.location = "http://spr.stp.gov.py/tablero/geografico4.jsp";
<%}%>
	var onoff=null;
	function OcultarRegistrosBorrados(){
		
		if($("#chkMostrarOcultar").is(':checked')){
			onoff=false;						
		}else{
			onoff=true;			
		}
		$("tr > td > del").closest("tr").toggle(onoff);
	}
	
	function ProcesarCambioPeriodo(){
		
		//periodoSeleccionado
	}
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
        <div class="row">
        		
				<div class="col-md-12" id="mostrarOcultarBorrado"></div>					
		</div>

        <!-- Main content -->
        <section class="content" id="programacion">
	         <!-- row periodo actual -->
	    	<div class="row">
	        	<div class="col-md-12">
	         		<div class="box" > 
	            		<div class="box-header with-border">
	              			<h2 class="box-title text-center">Líneas de Acción del Periodo Selecionado</h2>
	              			<div class="box-tools pull-right"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button></div>
	            		</div>
	            		<div class="box-body" id="cuerpoInsLineaAccion" style="height:auto; overflow: auto; display: block;">
	            			
	            		</div>
	             		<div class="box-footer" style="height:auto; overflow: auto; display: block;">
	             			<div class="col-md-6" align="left">
		             			<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1")){%>
		             				<button type="submit" class="btn btn-primary nuevaInsLineaAccion">Agregar Línea de Acción</button>
		             			<%}%>
	             			</div>
	             			<!-- link para acceder a la pagina de descarga de los avances y constancias -->
							<div class="col-md-6" align="right">								
								<button id="botonImprimirAvanceInstitucional" type="button" class="btn btn-primary imprimirAvanceCualitativoInstitucion" >
									<span class="glyphicon glyphicon-download-alt"></span> Descargar Avances
								</button>															
								<!-- <a href="http://spr.stp.gov.py/tablero/descargasConstancias.jsp">									
									<button type="button" class="btn btn-primary">
										<span class="glyphicon glyphicon-download-alt"></span> Descargar Constancias
									</button>
								</a> -->
							</div><!--fin div de link de avances y constancias -->
	             		</div>
			   		</div>
				</div>
          	</div><!-- /.row -->
			
          	<div class="row">
	        	<div class="col-md-12">
	         		<div class="box collapsed-box" >
	            		<div class="box-header with-border">
	              			<h2 class="box-title text-center">Líneas de Acción a Futuro</h2>
	              			<div class="box-tools pull-right"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button></div>
	            		</div>
	            		<div class="box-body" id="periodoPosterior"style="height:600px; overflow: auto; display: none;">
	            			<div class="box-body" id="cuerpoInsLineaAccionPosterior">
	            			
	            			</div>
	            		</div>
	             		<div class="box-footer" style="height:auto; overflow: auto; display: none;">
	             			<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1")){%>
	             				<button type="submit" class="btn btn-primary nuevaInsLineaAccion">Agregar Línea de Acción</button>
	             			<%}%>
	             		</div>
			   		</div>
				</div>
          	</div><!-- /.row -->
          	
	    	<div class="row">
	        	<div class="col-md-12">
	         		<div class="box collapsed-box" >
	            		<div class="box-header with-border">
	              			<h2 class="box-title text-center">Líneas de Acción Anteriores</h2>
	              			<div class="box-tools pull-right"><button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button></div>
	            		</div>
	            		<div class="box-body" id="periodoAnterior"style="height:600px; overflow: auto; display: none;">
	            			<div class="box-body" id="cuerpoInsLineaAccionAnterior">
	            			
	            			</div>
	            		</div>
	             		<div class="box-footer" style="height:auto; overflow: auto; display: none;">
	             			<% if (attributes.get("role_id_tablero").toString().equals("0") || attributes.get("role_id_tablero").toString().equals("1")){%>	             		
	             				<button type="submit" class="btn btn-primary nuevaInsLineaAccion">Agregar Línea de Acción</button>
	             			<%}%>	             				
	             		</div>
			   		</div>
				</div>
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
    <!-- script src="plugins/jQuery/jQuery-2.1.3.min.js"></script-->        
	<!-- Bootstrap 3.3.2 JS -->
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- DATA TABES SCRIPT -->    
    <script src="plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
    <!-- <script src="plugins/datatables/Plugins/api/sum().js"></script> -->
        
	<script src="plugins/datatables/dataTables.buttons.min.js" type="text/javascript"></script>
	<script src="plugins/datatables/buttons.flash.min.js" type="text/javascript"></script>
	<script src="plugins/datatables/jszip.min.js" type="text/javascript"></script>
	<script src="plugins/datatables/pdfmake.min.js" type="text/javascript"></script>
	<script src="plugins/datatables/vfs_fonts.js" type="text/javascript"></script>
	<script src="plugins/datatables/buttons.html5.min.js" type="text/javascript"></script>
	<script src="plugins/datatables/buttons.print.min.js" type="text/javascript"></script>
	
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
     <!-- AdminLTE App -->
    <script src="dist/js/app.min.js" type="text/javascript"></script>       
    
    


    <!-- Librerias para la rutina de cambio de contraseña -->
    <script src="dist/js/jquerymd5.js" type="text/javascript"></script>    	
    <%@ include file="/frames/pass.jsp" %>
    <%@ include file="/frames/insLineaAccion.jsp" %>
    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js" type="text/javascript"></script>
        <%  } else { %>
        	<script type="text/javascript">window.location = "http://spr.stp.gov.py/tablero/geografico4.jsp";</script>
				<!-- <p>Favor Iniciar Sesion</p> -->
			<% } %> 

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
<!-- End Piwik Code -->
<script type="text/javascript" src="bootstrap/js/bootstrap-slider.js"></script>
 
<script>
var entidadCasSpr = "";
entidadCasSpr ="<%=attributes.get("entidad") %>";
usuarioRolCasSpr="<%=attributes.get("role_id_tablero") %>";
var usuariosSpr = $.ajax({
	url:'/tablero/ajaxSelects?action=getUsuarios&usuario=<%=user.getName()%>',
  	type:'get',
  	dataType:'json',
  	async:false       
}).responseText;
usuariosSpr = JSON.parse(usuariosSpr);
usuariosSpr = usuariosSpr.usuarios;
</script>
		<%  } else { %>
            <script type="text/javascript">window.location = "http://spr.stp.gov.py";</script>
        <%  } %> 
  </body>
</html>
