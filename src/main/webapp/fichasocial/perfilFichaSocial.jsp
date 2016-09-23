<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page
	import="org.jasig.cas.client.authentication.AttributePrincipalImpl"%>
<%@ page import="org.jasig.cas.client.authentication.AttributePrincipal"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<!--  ISO-8859-1 -->
<%@ include file="/frames/head.jsp"%>
<!--   <script src="frames/entidad.js" type="text/javascript"></script> -->
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/bootstrap/css/bootstrapslider.css" rel="stylesheet">

</head>
<body class="skin-blue sidebar-mini">
	<%
		AttributePrincipal user = (AttributePrincipal) request
				.getUserPrincipal();
	%>
	<%
		Map attributes = user.getAttributes();
		if (user != null) {
	%>
	 <%@ include file="/frames/perfil.jsp"%> 

	<!-- piwik -->
	<script type="text/javascript">
		var _paq = _paq || [];
		_paq
				.push([ "setDocumentTitle",
						document.domain + "/" + document.title ]);
		_paq.push([ "setCookieDomain", "*.spr.stp.gov.py" ]);
		_paq.push([ "setDomains", [ "*.spr.stp.gov.py" ] ]);
		_paq.push([ 'trackPageView' ]);
		_paq.push([ 'enableLinkTracking' ]);
		(function() {
			var u = "//infra.stp.gov.py/monitoreoweb/";
			_paq.push([ 'setTrackerUrl', u + 'piwik.php' ]);
			_paq.push([ 'setSiteId', 4 ]);
			var d = document, g = d.createElement('script'), s = d
					.getElementsByTagName('script')[0];
			g.type = 'text/javascript';
			g.async = true;
			g.defer = true;
			g.src = u + 'piwik.js';
			s.parentNode.insertBefore(g, s);
		})();
	</script>
	<noscript>
		<p>
			<img src="//infra.stp.gov.py/monitoreoweb/piwik.php?idsite=4"
				style="border: 0;" alt="" />
		</p>
	</noscript>
	<!-- /piwik -->


	<style>
textarea {
	text-transform: uppercase;
}

body {
	background: #F1F3FA;
}

/* Profile container */
.profile {
	margin: 20px 0;
}

/* Profile sidebar */
.profile-sidebar {
	padding: 20px 0 10px 0;
	background: #fff;
}

.profile-userpic img {
	float: none;
	margin: 0 auto;
	width: 50%;
	height: 50%;
	-webkit-border-radius: 50% !important;
	-moz-border-radius: 50% !important;
	border-radius: 50% !important;
}

.profile-usertitle {
	text-align: center;
	margin-top: 20px;
}

.profile-usertitle-name {
	color: #5a7391;
	font-size: 16px;
	font-weight: 600;
	margin-bottom: 7px;
}

.profile-usertitle-job {
	text-transform: uppercase;
	color: #5b9bd1;
	font-size: 12px;
	font-weight: 600;
	margin-bottom: 15px;
}

.profile-userbuttons {
	text-align: center;
	margin-top: 10px;
}

.profile-userbuttons .btn {
	text-transform: uppercase;
	font-size: 11px;
	font-weight: 600;
	padding: 6px 15px;
	margin-right: 5px;
}

.profile-userbuttons .btn:last-child {
	margin-right: 0px;
}

.profile-usermenu {
	margin-top: 30px;
}

.profile-usermenu ul li {
	border-bottom: 1px solid #f0f4f7;
}

.profile-usermenu ul li:last-child {
	border-bottom: none;
}

.profile-usermenu ul li a {
	color: #93a3b5;
	font-size: 14px;
	font-weight: 400;
}

.profile-usermenu ul li a i {
	margin-right: 8px;
	font-size: 14px;
}

.profile-usermenu ul li a:hover {
	background-color: #fafcfd;
	color: #5b9bd1;
}

.profile-usermenu ul li.active {
	border-bottom: none;
}

.profile-usermenu ul li.active a {
	color: #5b9bd1;
	background-color: #f6f9fb;
	border-left: 2px solid #5b9bd1;
	margin-left: -2px;
}

/* Profile Content */
.profile-content {
	padding: 20px;
	background: #fff;
	min-height: 460px;
}
</style>

	<div class="container">
		<div class="row profile">
			<div class="col-md-3">
				<div class="profile-sidebar">
					<!-- SIDEBAR USERPIC -->
					<div class="profile-userpic">
						<img
							src="http://icons.iconarchive.com/icons/paomedia/small-n-flat/96/user-male-icon.png"
							class="img-responsive" alt="">
					</div>
					<!-- END SIDEBAR USERPIC -->
					<!-- SIDEBAR USER TITLE -->
					<div class="profile-usertitle">
						<div class="profile-usertitle-name" id="nombrePersona"></div>
						<div class="profile-usertitle-job" id="cargoPersona">Jefe de Hogar</div>
					</div>
					<!-- END SIDEBAR USER TITLE -->
					<!-- SIDEBAR BUTTONS -->
					<div class="profile-userbuttons">
						<button type="button" class="btn btn-success btn-sm">Procesar</button>
						<button type="button" class="btn btn-danger btn-sm">Editar</button>
					</div>
					<!-- END SIDEBAR BUTTONS -->
					<!-- SIDEBAR MENU -->
					<div class="profile-usermenu">
						<ul class="nav">
							<li class="active"><a href="#"> <i
									class="glyphicon glyphicon-home"></i> VIVIENDA
							</a></li>
							<li><a href="#"> <i class="glyphicon glyphicon-user"></i>
									SOCIODEMOGRAFICO
							</a></li>
							<li><a href="#" target="#"> <i
									class="glyphicon glyphicon-education"></i> EDUCACION
							</a></li>
							<li><a href="#"> <i
									class="glyphicon glyphicon-briefcase"></i> EMPLEO
							</a></li>
							<li><a href="#"> <i class="glyphicon glyphicon-globe"></i>
									AGROPECUARIA
							</a></li>
						</ul>
					</div>
					<!-- END MENU -->
				</div>
			</div>
			<div class="col-md-9">
				<div class="profile-content" id="detalleSecciones">					
						<!-- <div class="row">
							<div class="col-md-8">
							</div>
						</div> -->
				</div>
			</div>
		</div>
	</div>

	<script>
	$(document).ready(function(){
		
		var personas = $.ajax({
			url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getPersonas',
		  	type:'get',
		  	dataType:'json',
		  	async:false
		}).responseText;
		personas = JSON.parse(personas);
		
		$("#nombrePersona").append(personas[0].nombre_primero);
		//$("#cargoPersona").append();
		
		$("body").on("change", ".respuestas_text",function(event){
			var id=$(this).attr('id');			
			var idparsed=id.split("-");
			var nro_ficha = idparsed[1];
			var pregunta_id= idparsed[2];
			var respuesta_seleccionada=idparsed[3];
			var respuesta_text=$(this).val(); 
			
			var objeto = new Object();
			
			objeto.nroFicha = nro_ficha;
			objeto.fechaRealizacion = "2016-01-01";
			objeto.viviendaNro="1";
			objeto.preguntaId = pregunta_id;
			objeto.respuestaObtenidaId = respuesta_seleccionada;
			objeto.respuesta = respuesta_text;
			objeto.respuestaBoleana=false;
			
			var info = JSON.stringify(objeto);
		    $.ajax({
		        url: 'http://spr.stp.gov.py/tablero/ajaxUpdate2?accion=actRespuestasViviendas',
		        type: 'POST',
		        dataType: 'json',
		        data: info,
		        contentType: 'application/json',
		        mimeType: 'application/json',
			 });
		});
		
		$("body").on("click", ".respuestas",function(event){				
			var id=$(this).attr('id');			
			var idparsed=id.split("-");
			var nro_ficha = idparsed[1];
			var pregunta_id= idparsed[2];
			var respuesta_seleccionada=idparsed[3];
			
			
			$.ajax({
		        url: "http://spr.stp.gov.py/tablero/ajaxDelete?accion=delRespuestasViviendas&nroFicha="+nro_ficha+"&preguntaId="+pregunta_id,
		        type: 'POST',
		        dataType: 'json',
		        //data: JSON.stringify(etiquetapresupuesto),
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        success: function (data) {
		        	if(data.success == true){
					
		        		
		        		var objeto = new Object();
		    			
		    			objeto.nroFicha = nro_ficha;
		    			objeto.fechaRealizacion = "2016-01-01";
		    			objeto.viviendaNro="1";
		    			objeto.preguntaId = pregunta_id;
		    			objeto.respuestaObtenidaId = respuesta_seleccionada;
		    			objeto.respuesta = "";
		    			objeto.respuestaBoleana=false;
		    			
		    			var info = JSON.stringify(objeto);
		    		    $.ajax({
		    		        url: "http://spr.stp.gov.py/tablero/ajaxInserts2?accion=insRespuestasViviendas",
		    		        type: 'POST',
		    		        dataType: 'json',
		    		        data: info,
		    		        contentType: 'application/json',
		    		        mimeType: 'application/json',
		    			 });
		        		
		        		
		    		}else{
					//	alert("ERROR");
					}        	
		        },
		        error: function(data,status,er) {
		        //	alert("ERROR function");
		        }
		 });			
			
		});
				
		$("body").on("click", ".nav",function(event){
			
			var preguntas = $.ajax({
				url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getPreguntas',
			  	type:'get',
			  	dataType:'json',
			  	async:false
			}).responseText;
			preguntas = JSON.parse(preguntas);
			
			var respuestas_posibles = $.ajax({
				url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getRespuestasPosibles',
			  	type:'get',
			  	dataType:'json',
			  	async:false
			}).responseText;
			respuestas_posibles = JSON.parse(respuestas_posibles);
			
			var respuestas_viviendas = $.ajax({
				url:'http://spr.stp.gov.py/tablero/ajaxSelects?action=getRespuestasViviendas',
			  	type:'get',
			  	dataType:'json',
			  	async:false
			}).responseText;
			respuestas_viviendas = JSON.parse(respuestas_viviendas);
			
			$("#detalleSecciones").html("");
			
			var lista_respuestas="";
			
			/* for(i = 0;i<preguntas.length; i++){
				
				lista_respuestas+=	'<div class="panel panel-primary">'+
							'		<div class="panel-heading">'+
							'			<h3 class="panel-title">'+
							'				<span class="glyphicon glyphicon-arrow-right"></span>'
											+preguntas[i].descripcion+ 
							'			</h3>'+
							'		</div>'
							'		<div class="panel-body">'+
							'			<ul class="list-group">';
							
				for(w = 0;w<respuestas_posibles.length; w++){					
					if(preguntas[i].id==respuestas_posibles[w].pregunta_id){
						lista_respuestas+= '		<li class="list-group-item">'+
									'			<div class="radio">'+
									'				<label> <input type="radio" name="optionsRadios">'
													+respuestas_posibles[w].descripcion+
									'				</label>'+
									'			</div>'+
									'		</li>';
					}
				}
				lista_respuestas+=	'	</ul>'+
							'		</div>'+									
							'</div>';	
			}
			$("#detalleSecciones").append(lista_respuestas); */
			
			var lista_titulo_preguntas="", lista_preguntasyrespuestas="", lista_footer="";
			
			var pregunta_id_aux=respuestas_viviendas[0].id_pregunta;
			
			var pregunta_aux=respuestas_viviendas[0].preguntas;
			
			/* for(i = 0;i<respuestas_viviendas.length; i++){
				
				lista_titulo_preguntas=	'<div class="panel panel-primary">'+
										'		<div class="panel-heading">'+
										'			<h3 class="panel-title">'+
										'				<span class="glyphicon glyphicon-arrow-right"></span>'
														+pregunta_aux+ 
										'			</h3>'+
										'		</div>'+
										'		<div class="panel-body">'+
										'			<ul class="list-group">';
				
				if(pregunta_id_aux==respuestas_viviendas[i].id_pregunta){
					lista_preguntasyrespuestas+= 	'		<li class="list-group-item">'+
													'			<div class="radio">'+
													'				<label> <input type="radio" name="optionsRadios">'
																	+respuestas_viviendas[i].respuestas_posibles+
													'				</label>'+
													'			</div>'+
													'		</li>';
				}else{					
					lista_footer=			'	</ul>'+
												'		</div>'+									
												'</div>';	
					pregunta_id_aux=respuestas_viviendas[i].id_pregunta;
					pregunta_aux=respuestas_viviendas[i].preguntas;
					i=i-1;
					lista_respuestas+=lista_titulo_preguntas+lista_preguntasyrespuestas+lista_footer;
					lista_titulo_preguntas="";
					lista_preguntasyrespuestas="";
					lista_footer="";
				}				 
			} */
			var impreso=false;
			for(j = 0;j<preguntas.length; j++){
				for(i = 0;i<respuestas_viviendas.length; i++){					
					if(preguntas[j].id==respuestas_viviendas[i].id_pregunta && impreso==false){
						lista_titulo_preguntas=	'<div class="panel panel-primary">'+
						'		<div class="panel-heading">'+
						'			<h3 class="panel-title">'+
						'				<span class="glyphicon glyphicon-arrow-right"></span>'
										+preguntas[j].descripcion+ 
						'			</h3>'+
						'		</div>'+
						'		<div class="panel-body" id="pregunta-100-'+preguntas[j].id+'"></div>';
						$("#detalleSecciones").append(lista_titulo_preguntas);
						impreso=true;
					}else{
						if(preguntas[j].id!=respuestas_viviendas[i].id_pregunta && impreso==true){
							impreso=false;
						}
					}
				}
			}
			var cabecera="", footer="";
			
			for(j = 0;j<preguntas.length; j++){
				for(i = 0;i<respuestas_viviendas.length; i++){
					if(preguntas[j].id==respuestas_viviendas[i].id_pregunta && respuestas_viviendas[i].nro_ficha==0 && (respuestas_viviendas[i].respuestas_text==null || respuestas_viviendas[i].respuestas_text=="" ) && respuestas_viviendas[i].respuestas_bolean==null && respuestas_viviendas[i].tipo_respuesta=="lista"){
						lista_preguntasyrespuestas+= 	'		<li class="list-group-item">'+
														'			<div class="radio">'+
														'				<label> <input type="radio" id="respuestas-100-'+preguntas[j].id+'-'+respuestas_viviendas[i].id_respuesta_posible+'" name="respuestas-100-'+preguntas[j].id+'" class="respuestas">'
																		+respuestas_viviendas[i].respuestas_posibles+
														'				</label>'+
														'			</div>'+
														'		</li>';
					}else{
						if(preguntas[j].id==respuestas_viviendas[i].id_pregunta && respuestas_viviendas[i].nro_ficha!=0 && (respuestas_viviendas[i].respuestas_text==null || respuestas_viviendas[i].respuestas_text=="" ) && respuestas_viviendas[i].respuestas_bolean==null && respuestas_viviendas[i].tipo_respuesta=="lista"){
							lista_preguntasyrespuestas+= 	'		<li class="list-group-item">'+
							'			<div class="radio">'+
							'				<label> <input type="radio" id="respuestas-100-'+preguntas[j].id+'-'+respuestas_viviendas[i].id_respuesta_posible+'" name="respuestas-100-'+preguntas[j].id+'" checked=true>'
											+respuestas_viviendas[i].respuestas_posibles+
							'				</label>'+
							'			</div>'+
							'		</li>';
						}else{
							if(preguntas[j].id==respuestas_viviendas[i].id_pregunta && respuestas_viviendas[i].nro_ficha!=0 && respuestas_viviendas[i].respuestas_posibles=="0" && (respuestas_viviendas[i].respuestas_text!="" || respuestas_viviendas[i].respuestas_text!=null)){
								lista_preguntasyrespuestas='<input type="text" id="respuestas-100-'+preguntas[j].id+'-'+respuestas_viviendas[i].id_respuesta_posible+'" value="'+respuestas_viviendas[i].respuestas_text+'" class="respuestas_text">';
							}else{
								if(preguntas[j].id==respuestas_viviendas[i].id_pregunta && respuestas_viviendas[i].nro_ficha!=0 && respuestas_viviendas[i].tipo_respuesta=="multitexto"){
									lista_preguntasyrespuestas+='<input id="respuestas-100-'+preguntas[j].id+'-'+respuestas_viviendas[i].id_respuesta_posible+'" type="checkbox" checked>'+respuestas_viviendas[i].respuestas_posibles+' <input type="number" id="respuestas" value="'+respuestas_viviendas[i].respuestas_text+'"><br>';// check con input
								}else{
										if(preguntas[j].id==respuestas_viviendas[i].id_pregunta && respuestas_viviendas[i].nro_ficha!=0 && respuestas_viviendas[i].tipo_respuesta=="multiple"){
											lista_preguntasyrespuestas+='<input id="respuestas-100-'+preguntas[j].id+'-'+respuestas_viviendas[i].id_respuesta_posible+'" type="checkbox" checked>'+respuestas_viviendas[i].respuestas_posibles+' <br>';// check  
										}	
									}
								}
							}
						}
					
				}
				cabecera='<fieldset id="respuestas-100-'+preguntas[j].id+'"><ul class="list-group">';
				footer='	</fieldset></ul></div></div>';
				$("#pregunta-100-"+preguntas[j].id).append(cabecera+lista_preguntasyrespuestas+footer);
				lista_preguntasyrespuestas="";
			}
			
		});
		
	});
	
	</script>
	<!-- jQuery 2.1.3 -->
	<script src="/plugins/jQuery/jQuery-2.1.3.min.js"></script>
	<!-- Bootstrap 3.3.2 JS -->
	<script src="/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<!-- FastClick -->
	<script src='/plugins/fastclick/fastclick.min.js'></script>
	<!-- AdminLTE App -->
	<script src="../dist/js/app.min.js" type="text/javascript"></script>
	<!-- Sparkline -->
	<script src="/plugins/sparkline/jquery.sparkline.min.js"
		type="text/javascript"></script>
	<!-- jvectormap -->
	<script src="/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"
		type="text/javascript"></script>
	<script src="/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"
		type="text/javascript"></script>
	<!-- daterangepicker -->
	<script src="/plugins/daterangepicker/daterangepicker.js"
		type="text/javascript"></script>
	<!-- datepicker -->
	<script src="/plugins/datepicker/bootstrap-datepicker.js"
		type="text/javascript"></script>
	<!-- SlimScroll 1.3.0 -->
	<script src="/plugins/slimScroll/jquery.slimscroll.min.js"
		type="text/javascript"></script>
	<!-- ChartJS 1.0.1 -->
	<script src="/plugins/chartjs/Chart.min.js" type="text/javascript"></script>

	<!-- AdminLTE dashboard demo (This is only for demo purposes) 
    <script src="dist/js/pages/dashboard2.js" type="text/javascript"></script>-->

	<!-- Librerias para la rutina de cambio de contraseña -->
	<script src="/dist/js/jquerymd5.js" type="text/javascript"></script>
	<%@ include file="/frames/pass.jsp"%>

	<!-- AdminLTE for demo purposes -->
	<script src="/dist/js/demo.js" type="text/javascript"></script>
	<%
		} else {
	%>
	<p>Favor Iniciar Sesion</p>
	<%
		}
	%>
	
</body>
</html>
<!-- <div class="panel panel-primary">
									<div class="panel-heading">
										<h3 class="panel-title">
											<span class="glyphicon glyphicon-arrow-right"></span>
											Primer Nombre 
										</h3>
									</div>	
										<ul class="list-group">
											<li class="list-group-item">												
													<label> <input type="text" value="JOSE">														
													</label>												
											</li>
										</ul>
									<div class="panel-footer">
										<button type="button" class="btn btn-primary btn-sm">Guardar</button>										
									</div>
								</div>
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h3 class="panel-title">
											<span class="glyphicon glyphicon-arrow-right"></span>
											Segundo Nombre 
										</h3>
									</div>									
									<div class="panel-body">
										<ul class="list-group">
											<li class="list-group-item">												
													<label> <input type="text" value="MIGUEL">														
													</label>												
											</li>
										</ul>									
								</div>
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h3 class="panel-title">
											<span class="glyphicon glyphicon-arrow-right"></span>
											Primer Apellido 
										</h3>
									</div>									
									<div class="panel-body">
										<ul class="list-group">
											<li class="list-group-item">												
													<label> <input type="text" value="PERALTA">														
													</label>												
											</li>
										</ul>									
								</div>
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h3 class="panel-title">
											<span class="glyphicon glyphicon-arrow-right"></span>
											Segundo Apellido 
										</h3>
									</div>									
									<div class="panel-body">
										<ul class="list-group">
											<li class="list-group-item">												
													<label> <input type="text" value="DOMINGUEZ">														
													</label>												
											</li>
										</ul>									
								</div>
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h3 class="panel-title">
											<span class="glyphicon glyphicon-arrow-right"></span>
											Cuantos años cumplidos tiene JOSE? 
										</h3>
									</div>									
									<div class="panel-body">
										<ul class="list-group">
											<li class="list-group-item">												
													<label> <input type="text" value="24">														
													</label>												
											</li>
										</ul>									
								</div>
								
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h3 class="panel-title">
											<span class="glyphicon glyphicon-arrow-right"></span>
											Sexo 
										</h3>
									</div>
									<div class="panel-body">
										<ul class="list-group">
											<li class="list-group-item">
												<div class="radio">
													<label> <input type="radio" name="optionsRadios">
														Hombre
													</label>
												</div>
											</li>
											<li class="list-group-item">
												<div class="radio">
													<label> <input type="radio" name="optionsRadios">
														Mujer
													</label>
												</div>
											</li>											
										</ul>
									</div>									
								</div>
							</div>
							
							siguiente pregunta
							<div class="col-md-8">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h3 class="panel-title">
											<span class="glyphicon glyphicon-arrow-right"></span>
											Que relación de parentesco tiene DIEGO con el/la Jefe/a del Hogar? 
										</h3>
									</div>
									<div class="panel-body">
										<ul class="list-group">
											<li class="list-group-item">
												<div class="radio">
													<label> <input type="radio" name="optionsRadios">
														Jefe/a
													</label>
												</div>
											</li>
											<li class="list-group-item">
												<div class="radio">
													<label> <input type="radio" name="optionsRadios">
														Esposo/a, compañero/a
													</label>
												</div>
											</li>
											<li class="list-group-item">
												<div class="radio">
													<label> <input type="radio" name="optionsRadios">
														Hijo/a
													</label>
												</div>
											</li>
											<li class="list-group-item">
												<div class="radio">
													<label> <input type="radio" name="optionsRadios">
														Hijastro/a
													</label>
												</div>
											</li>
											<li class="list-group-item">
												<div class="radio">
													<label> <input type="radio" name="optionsRadios">
														Nieto/a
													</label>
												</div>
											</li>
										</ul>
									</div>
									<div class="panel-footer">
										<button type="button" class="btn btn-primary btn-sm">Guardar</button>										
									</div>
								</div>
								
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h3 class="panel-title">
											<span class="glyphicon glyphicon-arrow-right"></span>
											Es miembro del hogar... JOSE? 
										</h3>
									</div>
									<div class="panel-body">
										<ul class="list-group">
											<li class="list-group-item">
												<div class="radio">
													<label> <input type="radio" name="optionsRadios">
														Si
													</label>
												</div>
											</li>
											<li class="list-group-item">
												<div class="radio">
													<label> <input type="radio" name="optionsRadios">
														No
													</label>
												</div>
											</li>											
										</ul>
									</div>
									<div class="panel-footer">
										<button type="button" class="btn btn-primary btn-sm">
											Vote</button>
										<a href="#">View Result</a>
									</div>
								</div>
								
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h3 class="panel-title">
											<span class="glyphicon glyphicon-arrow-right"></span>
											Tiene... JOSE cédula de identidad policial? 
										</h3>
									</div>
									<div class="panel-body">
										<ul class="list-group">
											<li class="list-group-item">
												<div class="radio">
													<label> <input type="radio" name="optionsRadios">
														paraguaya?
													</label>
												</div>
											</li>
											<li class="list-group-item">
												<div class="radio">
													<label> <input type="radio" name="optionsRadios">
														extranjera?
													</label>
												</div>
											</li>		
											<li class="list-group-item">
												<div class="radio">
													<label> <input type="radio" name="optionsRadios">
														ambas?
													</label>
												</div>
											</li>											
											<li class="list-group-item">
												<div class="radio">
													<label> <input type="radio" name="optionsRadios">
														no tiene
													</label>
												</div>
											</li>
										</ul>
									</div>									
								</div>
								
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h3 class="panel-title">
											<span class="glyphicon glyphicon-arrow-right"></span>
											Anote el número de cédula de identidad policial de... JOSE 
										</h3>
									</div>									
									<div class="panel-body">
										<ul class="list-group">
											<li class="list-group-item">												
													<label> <input type="text" value="3.551.478">														
													</label>												
											</li>
										</ul>									
								</div>
								
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h3 class="panel-title">
											<span class="glyphicon glyphicon-arrow-right"></span>
											Se anotó JOSE su nombre de nacimiento en el registro civil? 
										</h3>
									</div>
									<div class="panel-body">
										<ul class="list-group">
											<li class="list-group-item">
												<div class="radio">
													<label> <input type="radio" name="optionsRadios">
														Si
													</label>
												</div>
											</li>
											<li class="list-group-item">
												<div class="radio">
													<label> <input type="radio" name="optionsRadios">
														No
													</label>
												</div>
											</li>		
											<li class="list-group-item">
												<div class="radio">
													<label> <input type="radio" name="optionsRadios">
														No sabe
													</label>
												</div>
											</li>
										</ul>
									</div>									
								</div>
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h3 class="panel-title">
											<span class="glyphicon glyphicon-arrow-right"></span>
											En que fecha nació JOSE? 
										</h3>
									</div>									
									<div class="panel-body">
										<ul class="list-group">
											<li class="list-group-item">												
													<label> <input type="text" value="24/04/1988">														
													</label>												
											</li>
										</ul>									
								</div>
								
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h3 class="panel-title">
											<span class="glyphicon glyphicon-arrow-right"></span>
											Cual es el estado civil o conyugal de JOSE? 
										</h3>
									</div>
									<div class="panel-body">
										<ul class="list-group">
											<li class="list-group-item">
												<div class="radio">
													<label> <input type="radio" name="optionsRadios">
														Casado
													</label>
												</div>
											</li>
											<li class="list-group-item">
												<div class="radio">
													<label> <input type="radio" name="optionsRadios">
														Unido
													</label>
												</div>
											</li>		
											<li class="list-group-item">
												<div class="radio">
													<label> <input type="radio" name="optionsRadios">
														Separado
													</label>
												</div>
											</li>
											<li class="list-group-item">
												<div class="radio">
													<label> <input type="radio" name="optionsRadios">
														Viudo
													</label>
												</div>
											</li>
											<li class="list-group-item">
												<div class="radio">
													<label> <input type="radio" name="optionsRadios">
														Soltero
													</label>
												</div>
											</li>
											<li class="list-group-item">
												<div class="radio">
													<label> <input type="radio" name="optionsRadios">
														Divorciado
													</label>
												</div>
											</li>
										</ul>
									</div>									
								</div>
								
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h3 class="panel-title">
											<span class="glyphicon glyphicon-arrow-right"></span>
											N° de teléfono (linea baja o celular) 
										</h3>
									</div>									
									<div class="panel-body">
										<ul class="list-group">
											<li class="list-group-item">												
													<label> <input type="text" value="0981-458-874">														
													</label>												
											</li>
										</ul>									
								</div>
 -->