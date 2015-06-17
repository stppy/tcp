<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="org.jasig.cas.client.authentication.AttributePrincipalImpl"%>
<%@ page import="org.jasig.cas.client.authentication.AttributePrincipal"%>
<%@ page import="py.gov.stp.mh.test.Client" %>
<%@ page import="py.gov.stp.mh.tools.SqlHelper" %>
<%@ page import="py.gov.stp.mh.clasificadores.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8">
    <title>spr | STP</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.2 -->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="../dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
 <script src="../dist/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="//spr.stp.gov.py/dist/js/html5shiv.js"></script>
        <script src="//spr.stp.gov.py/dist/js/respond.min.js"></script>
    <![endif]-->
    <script src="../frames/main.js"></script>
	 <link href="../frames/main.css" rel="stylesheet" type="text/css" />

</head>
<body onload="window.print();">
<% AttributePrincipal user = (AttributePrincipal) request.getUserPrincipal();%>
<% Map attributes = user.getAttributes(); 
if (user != null) { %>
	<script>
	$(document).ready(function(){
		var entidadCas = "";
		entidadCas = "<%= attributes.get("entidad") %>";
		var usuarios = $.ajax({
			url:'http://spr.stp.gov.py/ajaxSelects?accion=getUsuarios&usuario=<%=user.getName()%>',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		usuarios = JSON.parse(usuarios);
		usuarios = usuarios.usuarios;
		
		var i=parseInt(0);
		var datosNiveles = $.ajax({
	        url:'http://spr.stp.gov.py/ajaxSelects?accion=getNiveles&nivel='+usuarios[0].nivel_id,
	        type:'get',
	        dataType:'json',
	        async:false       
	      }).responseText;
	      datosNiveles = JSON.parse(datosNiveles);
	      datosNiveles=datosNiveles.niveles;
	      
	     var datosEntidad = $.ajax({
	          url:'http://spr.stp.gov.py/ajaxSelects?accion=getEntidad&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id,
	          type:'get',
	          dataType:'json',
	          async:false       
	        }).responseText;
	        datosEntidad = JSON.parse(datosEntidad);
	        datosEntidad=datosEntidad.entidades;
	        
	        var programas = $.ajax({
	        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getProgramas&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id,
	          	type:'get',
	          	dataType:'json',
	          	async:false       
	        }).responseText;

			programas = JSON.parse(programas);
			programas = programas.programas;
	        
			var tiposPrograma = $.ajax({
		    	url:'http://spr.stp.gov.py/ajaxSelects?accion=getTiposPrograma',
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText; 

			tiposPrograma = JSON.parse(tiposPrograma);
			tiposPrograma = tiposPrograma.tiposPrograma;
			
			var departamentos = $.ajax({
		    	url:'http://spr.stp.gov.py/ajaxSelects?accion=getDepartamentos',
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
			departamentos = JSON.parse(departamentos);
			departamentos = departamentos.departamentos;
						
		$("#tituloEntidad").children().append(usuarios[0].entidad);
		$("#hoja2-nombre-entidad").append(datosEntidad[0].nombreEntidad);
		$("#hoja2-abrev-entidad").append(datosEntidad[0].abrevEntidad);
		$("#hoja2-base-legal").append(datosEntidad[0].baseLegal);
		$("#hoja2-vision-entidad").append(datosEntidad[0].vision);
		$("#hoja2-mision-entidad").append(datosEntidad[0].mision);
		$("#hoja2-diagnostico").append(datosEntidad[0].diagnostico);
		$("#hoja2-objetivo-general").append(datosEntidad[0].objetivo);
		$("#hoja2-politica-institucional").append(datosEntidad[0].politica);
		$("#hoja3-nombre-entidad").append(datosEntidad[0].nombreEntidad);
		$("#hoja3-nivel-entidad").append(datosNiveles[0].nombreNivel);
	
		var programasCuerpo ='';
		var subprogramaCuerpo='';
		var proyectoCuerpo='';
		for (var l = 1; l < 5; l++ )
		{
				var programas = $.ajax({
	        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getProgramas&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id+'&tipoPresupuesto='+l,
	          	type:'get',
	          	dataType:'json',
	          	async:false       
	       		}).responseText;

				programas = JSON.parse(programas);
				programas = programas.programas;
			for(var m = 0; m < programas.length; m++)
			{
				programasCuerpo='';
				programasCuerpo+='<h2><center>FUNDAMENTACIÓN DE LOS PROGRAMAS / SUBPROGRAMAS / PROYECTOS</center></h2>'+
		        	'<div class="row ">'+
		          		'<div class="col-xs-12">'+
		      				'<h3>Entidad: '+datosEntidad[0].nivel+' '+datosEntidad[0].nombreEntidad+'</h3>'+ 
		          		'</div><!-- /.col -->'+
		            '</div> '+           
					'<div class="row invoice-info">'+
		            	'<div class="col-xs-12">'+
		            		'<h3>Tipo Presupuesto: '+tiposPrograma[l-1].numeroFila+' '+tiposPrograma[l-1].nombreTipoPrograma+'</h3>'+
		          		'</div><!-- /.col -->'+
					'</div></br><!-- /.row -->'+
					
					'<div class="row">'+
		            	'<div class="col-xs-12">'+
		            		'<h4>PROGRAMA CÓD: '+programas[m].tipoPrograma+'-'+programas[m].id+'-'+programas[m].nombrePrograma+'</h4>'+
		          		'</div><!-- /.col -->'+        		
					'</div><!-- /.row -->'+				
					'<div class="row ">'+
		            	'<div class="col-xs-4">'+
		            		'Diagnostico'+
		          		'</div><!-- /.col -->'+
		            	'<div class="col-xs-8">'+
		            	''+programas[m].diagnostico+
		          		'</div><!-- /.col --> '+        		
					'</div><!-- /.row -->'+			
					'<div class="row">'+
		            	'<div class="col-xs-4">'+
		            		'Objetivo'+
		          		'</div><!-- /.col -->'+
		            	'<div class="col-xs-8">'+
		            		''+programas[m].objetivo+
		          		'</div><!-- /.col -->'+         		
					'</div><!-- /.row -->'+			
					'<div class="row">'+
		            	'<div class="col-xs-4">'+
		            		'Base Legal'+
		          		'</div><!-- /.col -->'+
		            	'<div class="col-xs-8">'+
		            		''+programas[m].baseLegal+
		          		'</div><!-- /.col -->'+         		
					'</div><!-- /.row -->'+			
					'<div class="row ">'+
		            	'<div class="col-xs-4">'+
		            		'Departamento'+
		          		'</div><!-- /.col -->'+
		            	'<div class="col-xs-8">'+
		            	''+programas[m].codigoDepartamento+
		          		'</div><!-- /.col -->'+         		
					'</div></br><!-- /.row -->';

					var subprogramas = $.ajax({
			        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getSubprogramas&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id+'&tipoPresupuesto='+l+'&programa='+m,
			          	type:'get',
			          	dataType:'json',
			          	async:false       
			        }).responseText;

					subprogramas = JSON.parse(subprogramas); 
					subprogramas = subprogramas.subprogramas;
					subprogramaCuerpo=''
					for(var v=0; v < subprogramas.length; v++)
					{
							subprogramaCuerpo+='<div class="row">'+
		            	'<div class="col-xs-12">'+
		            		'<h5>SUBPROGRAMA CÓD: '+programas[v].tipoPrograma+'-'+programas[v].id+'-'+subprogramas[v].id+'-'+subprogramas[v].nombre+'</h5>'+
		          		'</div><!-- /.col -->'+
					'</div><!-- /.row -->'+				
					'<div class="row ">'+
		            	'<div class="col-xs-4">'+
		            		'Diagnostico'+
		          		'</div><!-- /.col -->'+
		            	'<div class="col-xs-8">'+
		            	''+subprogramas[v].descripcion+
		          		'</div><!-- /.col --> '+        		
					'</div><!-- /.row -->'+			
					'<div class="row">'+
		            	'<div class="col-xs-4">'+
		            		'Objetivo'+
		          		'</div><!-- /.col -->'+
		            	'<div class="col-xs-8">'+
		            		subprogramas[v].objetivo+
		          		'</div><!-- /.col -->'+         		
					'</div><!-- /.row -->'+			
					'<div class="row">'+
		            	'<div class="col-xs-4">'+
		            		'Base Legal'+
		          		'</div><!-- /.col -->'+
		            	'<div class="col-xs-8">'+
		            		//''+subprogramas[v].baseLegal+
		          		'</div><!-- /.col -->'+         		
					'</div><!-- /.row -->'+			
					'<div class="row ">'+
		            	'<div class="col-xs-4">'+
		            		'Departamento'+
		          		'</div><!-- /.col -->'+
		            	'<div class="col-xs-8">'+
		            	subprogramas[v].codigo_departamento+
		          		'</div><!-- /.col -->'+         		
					'</div></br><!-- /.row -->'+
					'<div class="row ">';
	
								var proyectos = $.ajax({
						        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getProyectos&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id+'&tipoPresupuesto='+l+'&programa='+m+'&subprograma='+v,
						          	type:'get',
						          	dataType:'json',
						          	async:false       
						        }).responseText;
			
								proyectos = JSON.parse(proyectos);
								proyectos = proyectos.proyectos;
							
								for( var k=0; k<proyectos.length;k++)
								{	
									subprogramaCuerpo+= '<div class="row ">'+
						            						'<div class="col-xs-12">'+
																'<h5>PROYECTO CÓD: '+programas[m].tipoPrograma+'-'+programas[m].id+'-'+subprogramas[v].id+'-'+proyectos[k].codigoProyecto+'-'+proyectos[k].nombreProyecto+'</h5>'+                         
					          								'</div><!-- /.col -->'+
														'</div><!-- /.row -->'+
														'<div class="row ">'+
										            		'<div class="col-xs-4">'+
										            			'Diagnostico'+
										          			'</div><!-- /.col -->'+
										            		'<div class="col-xs-8">'+
										            		proyectos[k].diagnostico+
									          				'</div><!-- /.col -->'+ 
										          		'</div><!-- /.row -->'+
														'<div class="row ">'+
									            			'<div class="col-xs-4">'+
									            				'Objetivo'+
									          				'</div><!-- /.col -->'+
									            			'<div class="col-xs-8">'+
									            			proyectos[k].descripcionProyecto+
								          					'</div><!-- /.col -->'+
									          			'</div><!-- /.row -->'+	 	
														'<div class="row ">'+
								            				'<div class="col-xs-4">'+
								            					'Base Legal'+
								          					'</div><!-- /.col -->'+
								            				'<div class="col-xs-8">'+
							            						'Falta imprimir base Legal'+
							          						'</div><!-- /.col -->'+
								          				'</div><!-- /.row -->'+	
														'<div class="row ">'+
							            					'<div class="col-xs-4">'+
							            						'Objetivo PND: '+
							          						'</div><!-- /.col -->'+
							            					'<div class="col-xs-8">'+
							            						proyectos[k].objetivo_estrategico_id+
						          							'</div><!-- /.col -->'+
							          					'</div><!-- /.row -->'+	 	
														'<div class="row ">'+
						            						'<div class="col-xs-4">'+
						            							'Unidad Responsable: '+
						          							'</div><!-- /.col -->'+
						            						'<div class="col-xs-8">'+
						            							proyectos[k].codigoUnidadResponsable+
					          								'</div><!-- /.col -->'+
									          			'</div><!-- /.row -->'+	
														'<div class="row ">'+
								            				'<div class="col-xs-4">'+
								            					'Clasificacion Funcional: '+
								          					'</div><!-- /.col -->'+
								            				'<div class="col-xs-8">'+
								            					proyectos[k].codigoFuncional+
							          						'</div><!-- /.col -->'+
								          				'</div><!-- /.row -->'+	
														'<div class="row ">'+
							            					'<div class="col-xs-4">'+
							            						'COD. SNIP: '+
							          						'</div><!-- /.col -->'+
							            					'<div class="col-xs-8">'+
							            						proyectos[k].codigoSnip+
						          							'</div><!-- /.col -->'+
							          					'</div><!-- /.row -->'+
							          					'<div class="row ">'+
						            						'<div class="col-xs-4">'+
						            							'Departamento: '+
						          							'</div><!-- /.col -->'+
						            						'<div class="col-xs-8">'+
						            							proyectos[k].codigoDepartamento+
					          								'</div><!-- /.col -->'+
						          						'</div><!-- /.row -->';

					
								}
								subprogramaCuerpo+='</div></br><!-- /.row -->';
								
					}
					$("#hoja3-cuerpo-programajaja").append(programasCuerpo);
					$("#hoja3-cuerpo-programajaja").append(subprogramaCuerpo);

					}

				}
		
		
		/*$("#nombreUsuario").append(usuarios[0].correo+" ("+usuarios[0].nivel_id+", "+usuarios[0].entidad_id+")");
		$("#PerfilUsuario").append(usuarios[0].nombre+" ("+usuarios[0].nivel_id+", "+usuarios[0].entidad_id+", "+entidadCas+")");
		$("#nombreUsuario").append("entidad: "+usuarios[0].entidad);;
		$("#nombreUsuario").append("entidad_id: "+usuarios[0].entidad_id);
		$("#nombreUsuario").append("nivel_id: "+usuarios[0].nivel_id);*/

	        
	     
	    	//datosEntidad[i].nivel==usuarios[0].nivel_id && datosEntidad[0].entidad==usuarios[0].entidad_id

	});

</script>
			
  <!-- piwik -->
  <script type="text/javascript">
  var _paq = _paq || [];
  _paq.push(["setDocumentTitle", document.domain + "/" + document.title]);
  _paq.push(["setCookieDomain", "*.spr.stp.gov.py"]);
  _paq.push(["setDomains", ["*.spr.stp.gov.py"]]);
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {
    var u="//infra.stp.gov.py/monitoreoweb/";
    _paq.push(['setTrackerUrl', u+'piwik.php']);
    _paq.push(['setSiteId', 4]);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
  })();
</script>
<noscript><p><img src="//infra.stp.gov.py/monitoreoweb/piwik.php?idsite=4" style="border:0;" alt="" /></p></noscript>
<!-- /piwik -->


<style>
textarea { text-transform: uppercase; }
input { text-transform: uppercase; }
</style>

</script> 

          
	<div class="wrapper" style="padding:30px 0px 0px 30px">
		<section class="invoice" >
        	<!-- title row -->
       		<div class="row">
          		<div class="col-xs-3" style="padding-top:19px">
              		<img src="http://webmail.stp.gov.py/intranet/prueba/logo_izquierda.png" />
          		</div>
         	 	<div class="col-xs-6">
         	 		<center>
	                	PRESIDENCIA DE LA REPÚBLICA <br>
	                	STP -POI<br> 
	                	2016 – 2018
                	</center>
                </div>
          		<div class="col-xs-3">
		  			<img src="http://webmail.stp.gov.py/intranet/prueba/logo_derecha.png" />
          		</div><!-- /.col -->
       	 	</div><!-- /.row -->
       	 	</br></br></br></br></br></br></br></br></br></br></br></br></br></br>
       	 	<h1 id="tituloEntidad"><center></center></h1></br>
       	 	<small><center>PLAN OPERATIVO INSTITUCIONAL PERIODO<br>
       	 	2016 – 2018</center></small>
       	 	</br></br></br></br></br></br></br></br>
       	 	<div class="col-xs-12"></div>
		</div><!-- /.section -->
	</div><!-- /.wrapper -->
	
	<div style="page-break-after:always"></div>
	
	<div class="row">
		<div class="col-xs-3" style="padding-top:19px">
     		<img src="http://webmail.stp.gov.py/intranet/prueba/logo_izquierda.png" />
 		</div>
  	 	<div class="col-xs-6">
  	 		<center>
          	PRESIDENCIA DE LA REPÚBLICA <br>
          	STP -POI<br> 
          	2016 – 2018
         	</center>

         </div>
   		<div class="col-xs-3">
			<img src="http://webmail.stp.gov.py/intranet/prueba/logo_derecha.png" />
   		</div><!-- /.col -->
	</div><!-- /.row -->


	<div class="wrapper" style="padding:30px 0px 0px 30px">
		<section class="invoice">
			<center><h3>MEMORIA DE LA ENTIDAD</h3></center>
        	<div class="row invoice-info">
          		<div class="col-sm-12">
      				<h4>DENOMINACIÓN DE LA ENTIDAD</h4>
          		</div><!-- /.col -->
          	</div>
          	<div class="row invoice-info">
            	<div class="col-sm-4" >
            		<strong>Nombre: </strong>
          		</div><!-- /.col -->
            	<div class="col-sm-8" id="hoja2-nombre-entidad">
          		</div><!-- /.col -->
          	</div>
          	<div class="row invoice-info">
            	<div class="col-sm-4" >
            		<strong>Abreviación: </strong>
          		</div><!-- /.col -->
            	<div class="col-sm-8" id="hoja2-abrev-entidad">
          		</div><!-- /.col -->
          	</div>
            	<hr>

			<div class="row invoice-info">
            	<div class="col-sm-12 ">
            		<h4>BASE LEGAL DE CREACIÓN</h4>
          		</div><!-- /.col -->
			</div>
			<div class="row invoice-info" id="hoja2-base-legal">
            	<div class="col-sm-12 ">
          		</div><!-- /.col -->
			</div>
<hr>          	
			<div class="row invoice-info">
            	<div class="col-sm-4 ">
            		<strong>Visión Entidad:</strong>
          		</div><!-- /.col -->
            	<div class="col-sm-8 " id="hoja2-vision-entidad">
           		</div><!-- /.col -->
			</div><!-- /.row -->
			<div class="row invoice-info">
            	<div class="col-sm-4 ">
            		<strong>Misión Entidad:</strong>
          		</div><!-- /.col -->
            	<div class="col-sm-8 " id="hoja2-mision-entidad">
           		</div><!-- /.col -->
			</div><!-- /.row -->
			
			
			<div class="row invoice-info">
            	<div class="col-sm-4 ">
            		<strong>Diagnóstico General de la Institución</strong>
          		</div><!-- /.col -->
            	<div class="col-sm-8 " id="hoja2-diagnostico">
          		</div><!-- /.col -->
          	</div>
			<div class="row invoice-info">
            	<div class="col-sm-4 ">
            		<strong>Descripción de los Objetivos Generales de la Institución</strong>
          		</div><!-- /.col -->
            	<div class="col-sm-8 " id="hoja2-objetivo-general">
          		</div><!-- /.col -->
          	</div>
			<div class="row invoice-info">
            	<div class="col-sm-4 ">
            		<strong>Descripción de las Principales Políticas Institucionales</strong>
          		</div><!-- /.col -->
            	<div class="col-sm-8 " id="hoja2-politica-institucional">
          		</div><!-- /.col -->
          	</div>

	
		</section>
	</wrapper>     	
 <div style="page-break-after:always"></div>      	


	<div class="wrapper" style="padding:30px 0px 0px 30px">
		<section class="invoice">

		
			<div class="row" id="hoja3-cuerpo-programajaja" style="padding:10px 4px 0px 4px" >
        		     		
			</div><!-- /.row -->
			

			
			
	
			<div class="row invoice-info">
            	<div class="col-sm-12 invoice-col">
            		Resultados Esperados
          		</div><!-- /.col -->       		       		
			</div></br><!-- /.row -->	

			<div class="row invoice-info">
            	<div class="col-sm-6 invoice-col">
            		Objetivo
          		</div><!-- /.col -->
            	<div class="col-sm-6 invoice-col">
            		[objetivo:nombre]
          		</div><!-- /.col -->         		       		
			</div></br><!-- /.row -->																			
						
					
												
			
		</section>
	</wrapper>     	
 <div style="page-break-after:always"></div>  
	
	
	
	
	      	
          	
          	
          	

	<div class="wrapper" style="padding:30px 0px 0px 30px">
		<section class="invoice"> 
		
		
		<div class="row invoice-info">
          		<div class="col-sm-6 invoice-col">
      				INDICADOR
          		</div><!-- /.col -->
          		<div class="col-sm-6 invoice-col">
      				[indicador:nombre]
          		</div><!-- /.col -->
         </div>
		<div class="row invoice-info">
          		<div class="col-sm-6 invoice-col">
      				UNIDAD DE MEDIDA
          		</div><!-- /.col -->
          		<div class="col-sm-6 invoice-col">
      				[unidad_medida:nombre]
          		</div><!-- /.col -->
         </div>
		<div class="row invoice-info">
          		<div class="col-sm-6 invoice-col">
      				FRECUENCIA DE MEDICION (meses)
          		</div><!-- /.col -->
          		<div class="col-sm-6 invoice-col">
      				[indicador:frecuencia_meses]
          		</div><!-- /.col -->
         </div>
		<div class="row invoice-info">
          		<div class="col-sm-6 invoice-col">
      				METODOLOGIA DE CALCULO
          		</div><!-- /.col -->
          		<div class="col-sm-6 invoice-col">
      				[indicador:xxxx]
          		</div><!-- /.col -->
         </div>
		<div class="row invoice-info">
          		<div class="col-sm-6 invoice-col">
      				FUENTE DE INFORMACION
          		</div><!-- /.col -->
          		<div class="col-sm-6 invoice-col">
      				[indicador:xxxx]
          		</div><!-- /.col -->
         </div>
		<div class="row invoice-info">
          		<div class="col-sm-6 invoice-col">
      				OBSERVACIONES
          		</div><!-- /.col -->
          		<div class="col-sm-6 invoice-col">
      				[indicador:observaciones]
          		</div><!-- /.col -->
         </div>
		<div class="row invoice-info">
          		<div class="col-sm-12 invoice-col">
      				EVOLUCION DEL INDICADOR
          		</div><!-- /.col -->

        </div>
		<div class="row invoice-info">
          		<div class="col-sm-3 invoice-col">
      				2014
          		</div><!-- /.col -->
          		<div class="col-sm-3 invoice-col">
      				2015
          		</div><!-- /.col -->
          		<div class="col-sm-2 invoice-col">
      				2016
          		</div><!-- /.col -->
          		<div class="col-sm-2 invoice-col">
      				2017
          		</div><!-- /.col -->
          		<div class="col-sm-2 invoice-col">
      				2018
          		</div><!-- /.col -->
         </div>
		<div class="row invoice-info">
          		<div class="col-sm-3 invoice-col">
      				[meta:cantidad]
          		</div><!-- /.col -->
          		<div class="col-sm-3 invoice-col">
      				[meta:cantidad]
          		</div><!-- /.col -->
          		<div class="col-sm-2 invoice-col">
      				[meta:cantidad]
          		</div><!-- /.col -->
          		<div class="col-sm-2 invoice-col">
      				[meta:cantidad]
          		</div><!-- /.col -->
          		<div class="col-sm-2 invoice-col">
      				[meta:cantidad]
          		</div><!-- /.col -->
         </div></br>
  
		<div class="row invoice-info">
          		<div class="col-sm-12 invoice-col">
      				PRODUCTOS
          		</div><!-- /.col -->
         </div>
		<div class="row invoice-info">
          		<div class="col-sm-2 invoice-col">
      				[supbprograma:id]
          		</div><!-- /.col -->
          		<div class="col-sm-2 invoice-col">
      				[proyecto:id]
          		</div><!-- /.col -->
          		<div class="col-sm-2 invoice-col">
      				[producto:id]
          		</div><!-- /.col -->
          		<div class="col-sm-2 invoice-col">
      				[producto:nombre]
          		</div><!-- /.col -->
          		<div class="col-sm-2 invoice-col">
      				[undiad_medida:nombre]
          		</div><!-- /.col -->
       			<div class="col-sm-2 invoice-col">
      				Tipo [proudcto:clase]
          		</div><!-- /.col -->
         </div></br>
         
 		<div class="row invoice-info">
 			<div class="col-sm-12 invoice-col">
 			<table class="table table-striped">
              <thead>
              	<tr> 
              		<th colspan="13">AÑO 2016</th>
              	</tr>
                <tr>
                  <th>DEPTO/MES</th>
                  <th>01</th>
                  <th>02</th>
                  <th>03</th>
                  <th>04</th>
                  <th>05</th>
                  <th>06</th>
                  <th>07</th>
                  <th>08</th>
                  <th>09</th>
                  <th>10</th>
                  <th>11</th>
                  <th>12</th>
                  <th>TOTAL</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Asunción</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
                <tr>
                  <td>Concepción</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
                <tr>
                  <td>San Pedro</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
                <tr>
                  <td>Cordillera</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
                <tr>
                  <td>Caaguazú</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
                <tr>
                  <td>Caazapá</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
                <tr>
                  <td>Itapua</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
                <tr>
                  <td>Misiones</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
                <tr>
                  <td>Paraguari</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr> 
                <tr>
                  <td>Alto Paraná</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
                <tr>
                  <td>Central</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
                <tr>
                  <td>Ñeembucú</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>  
                <tr>
                  <td>Amambay</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>  
                <tr>
                  <td>Canindeyú</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>  
                <tr>
                  <td>Presidente Hayes</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>  
                <tr>
                  <td>Boquerón</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr> 
                <tr>
                  <td>Alto Paraguay</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>  
                <tr>
                  <td>AUX. TRASP.</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
                <tr>
                  <td>ALCANCE NAC.</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>  
                <tr>
                  <td>Total mes:</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>                                                                                                                                                                                                  
              </tbody>
            </table>
            </br>

		<div class="row invoice-info">
          		<div class="col-sm-3 invoice-col">
      				AÑO 2017:
          		</div><!-- /.col -->
          		<div class="col-sm-3 invoice-col">
      				[meta:cantidad]
          		</div><!-- /.col -->
          		<div class="col-sm-3 invoice-col">
      				AÑO 2018:
          		</div><!-- /.col -->
          		<div class="col-sm-3 invoice-col">
      				[meta:cantidad]
          		</div><!-- /.col -->
         </div>
         </br>
		<div class="row invoice-info">
          		<div class="col-sm-12 invoice-col">
      				DESTINATARIOS DEL PRODUCTO POR DEPARTAMENTO
          		</div><!-- /.col -->
         </div>
		
 			<table class="table table-striped">
            	  <thead>
      					<tbody>
      						<tr>
	      						<th>DESTINATARIOS</th>
	      						<th>ASU</th>
	      						<th>01</th>
	      						<th>02</th>
	      						<th>03</th>
	      						<th>04</th>
	      						<th>05</th>
	      						<th>06</th>
	      						<th>07</th>
	      						<th>08</th>
	      						<th>09</th>
	      						<th>10</th>
	      						<th>11</th>
	      						<th>12</th>
	      						<th>13</th>
	      						<th>14</th>
	      						<th>15</th>
	      						<th>16</th>
	      						<th>17</th>
	      						<th>A.T.</th>
	      						<th>A.N.</th>
	      					</tr>
      					</tbody>
      			</thead>
      		</table>
          		                 
         
            
 			</div>
 		</div>
		

      </section><!-- /.content -->
    </div><!-- ./wrapper -->
    <!-- AdminLTE App -->
    <script src="../../dist/js/app.min.js" type="text/javascript"></script>
    <%  } else { %>
				<p>Favor Iniciar Sesion</p>
			<%  } %>
  </body>
</html>
