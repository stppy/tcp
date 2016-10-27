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
<style type="text/css">
div{
	border-top: 1px solid silver;
	}
</style>
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
			url:'/ajaxSelects?accion=getUsuarios&usuario=<%=user.getName()%>',
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		usuarios = JSON.parse(usuarios);
		usuarios = usuarios.usuarios;
		
		var i=parseInt(0);
		var datosNiveles = $.ajax({
	        url:'/ajaxSelects?accion=getNiveles&nivel='+usuarios[0].nivel_id,
	        type:'get',
	        dataType:'json',
	        async:false       
	      }).responseText;
	      datosNiveles = JSON.parse(datosNiveles);
	      datosNiveles=datosNiveles.niveles;
	      
	     var datosEntidad = $.ajax({
	          url:'/ajaxSelects?accion=getEntidad&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id,
	          type:'get',
	          dataType:'json',
	          async:false       
	        }).responseText;
	        datosEntidad = JSON.parse(datosEntidad);
	        datosEntidad=datosEntidad.entidades;
	        
	        var programas = $.ajax({
	        	url:'/ajaxSelects?accion=getProgramas&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id,
	          	type:'get',
	          	dataType:'json',
	          	async:false       
	        }).responseText;

			programas = JSON.parse(programas);
			programas = programas.programas;
	        
			var tiposPrograma = $.ajax({
		    	url:'/ajaxSelects?accion=getTiposPrograma',
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText; 

			tiposPrograma = JSON.parse(tiposPrograma);
			tiposPrograma = tiposPrograma.tiposPrograma;
			
			var departamentos = $.ajax({
		    	url:'/ajaxSelects?accion=getDepartamentos',
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
			departamentos = JSON.parse(departamentos);
			departamentos = departamentos.departamentos;
			var optionDepartamentos='';
			for(var i = 0;i<departamentos.length; i++){
				optionDepartamentos+='<option value="'+departamentos[i].deptoPais+'">'+departamentos[i].abrevDepartamento+'</option>';
			}
			
			/*var optionUnidadResponsable='';
			var unidadesResponsables = $.ajax({
		    	url:'/ajaxSelects?accion=getUnidadesResponsables&anio=2015&nivel='+nivel+'&entidad='+entidad,
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
			unidadesResponsables = JSON.parse(unidadesResponsables);
			unidadesResponsables = unidadesResponsables.unidadesResponsables;
			for(var d = 0;d<unidadesResponsables.length; d++){
				optionUnidadResponsable+='<option value="'+unidadesResponsables[d].unrCodigo+'">'+unidadesResponsables[d].unrNombre+'</option>';
			}*/
						
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
	
		var subprogramaCuerpo='';
		var ubicacion12=0;
		var ubicacion13=0;
		var ubicacion14=0;
		var ubicacion15=0;
		var ubicacion22=0;
		var ubicacion23=0;
		var ubicacion24=0;
		var ubicacion25=0;
		var ubicacion32=0;
		var ubicacion33=0;
		var ubicacion34=0;
		var ubicacion35=0;
		for (var l = 1; l < 5; l++ )
		{
				var band=0;
				var programas = $.ajax({
	        	url:'/ajaxSelects?accion=getProgramas&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id+'&tipoPresupuesto='+l,
	          	type:'get',
	          	dataType:'json',
	          	async:false       
	       		}).responseText;

				programas = JSON.parse(programas);
				programas = programas.programas;
				
			for(var m = 0; m < programas.length; m++)
			{
					var subprogramas = $.ajax({
		        	url:'/ajaxSelects?accion=getSubprogramas&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id+'&tipoPresupuesto='+l+'&programa='+programas[m].codigoPrograma,
		          	type:'get',
		          	dataType:'json',
		          	async:false       
			        }).responseText;

					subprogramas = JSON.parse(subprogramas); 
					subprogramas = subprogramas.subprogramas;
					subprogramaCuerpo='';
					for(var v=0; v < subprogramas.length; v++)
					{
							
	
								var proyectos = $.ajax({
						        	url:'/ajaxSelects?accion=getProyectos&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id+'&tipoPresupuesto='+l+'&programa='+programas[m].codigoPrograma+'&subprograma='+subprogramas[v].id,
						          	type:'get',
						          	dataType:'json', 
						          	async:false       
						        }).responseText; 
			
								proyectos = JSON.parse(proyectos);
								proyectos = proyectos.proyectos;
							
								for( var k=0; k<proyectos.length;k++)
								{	
									var objetivos = $.ajax({
								    	url:'/ajaxSelects?accion=getObjetivosEstrategicos&objetivo='+proyectos[k].objetivo_estrategico_id,
								      	type:'get',
								      	dataType:'json',
								      	async:false       
								    }).responseText;
								  	objetivos = JSON.parse(objetivos);
								  	objetivos = objetivos.objetivos;
								  	
									var estrategias = $.ajax({
								    	url:'/ajaxSelects?accion=getEstrategias&codigoPilar='+objetivos[0].estrategia_id,
								      	type:'get',
								      	dataType:'json',
								      	async:false       
								    }).responseText;
									estrategias = JSON.parse(estrategias);
								  	estrategias = estrategias.estrategias;
								  	
									var lineaTransversal = $.ajax({
								    	url:'/ajaxSelects?accion=getLineaTransversal&idLinea='+estrategias[0].lineaTransversal,
								      	type:'get',
								      	dataType:'json',
								      	async:false       
								    }).responseText;
									lineaTransversal = JSON.parse(lineaTransversal);
									lineaTransversal = lineaTransversal.lineaTransversal;
									
									var ejeEstrategico = $.ajax({
								    	url:'/ajaxSelects?accion=getEjeEstrategico&idEje='+estrategias[0].ejeEstrategico,
								      	type:'get',
								      	dataType:'json', 
								      	async:false
								    }).responseText;
									ejeEstrategico = JSON.parse(ejeEstrategico);
									ejeEstrategico = ejeEstrategico.ejeEstrategico;																				
											
									if (estrategias[0].codigoPilar == 1)
									{
										ubicacion12=ubicacion12+1;
									}
									if (estrategias[0].codigoPilar == 2)
									{
										ubicacion13=ubicacion13+1;
									}
									if (estrategias[0].codigoPilar == 3)
									{
										ubicacion14=ubicacion14+1;
									}
									if (estrategias[0].codigoPilar == 4)
									{
										ubicacion15=ubicacion15+1;
									}
									if (estrategias[0].codigoPilar == 5)
									{
										ubicacion22=ubicacion22+1;
									}
									if (estrategias[0].codigoPilar == 6)
									{
										ubicacion23=ubicacion23+1;
									}
									if (estrategias[0].codigoPilar == 7)
									{
										ubicacion24=ubicacion24+1;
									}
									if (estrategias[0].codigoPilar == 8)
									{
										ubicacion25=ubicacion25+1;
									}
									if (estrategias[0].codigoPilar == 9)
									{
										ubicacion32=ubicacion32+1;
									}
									if (estrategias[0].codigoPilar == 10)
									{
										ubicacion33=ubicacion33+1;
									}
									if (estrategias[0].codigoPilar == 11)
									{
										ubicacion34=ubicacion34+1;
									}
									if (estrategias[0].codigoPilar == 12)
									{
										ubicacion35=ubicacion35+1;
									}
						  	 		/*subprogramaCuerpo+='<div class="row">'+
													   		'<div class="col-md-12">';
														
																if(band==0)
																{
																	subprogramaCuerpo+='<h4>Tipo Presupuesto </4>'+l;	
																	band=1;
																}
											subprogramaCuerpo+='</div><!-- /.col -->'+  
														'</div><!-- /.row -->'+
						  	 							'<div class="row">'+
						 									'<div class="col-md-12">'+
																usuarios[0].nivel_id+'-'+usuarios[0].entidad_id+'-'+l+'-'+programas[m].codigoPrograma+'-'+subprogramas[v].id+'-'+proyectos[k].codigoProyecto+'-'+proyectos[k].nombreProyecto+
															'</div><!-- /.col -->'+ 
														'</div><!-- /.row -->'+*/
														/*'<div class="row">'+
															'<div class="col-sm-12">'+
																'Nombre Proyecto: '+proyectos[k].nombreProyecto+
															'</div><!-- /.col -->'+ 
														'</div><!-- /.row -->'+*/
								  	
						  	 							/*'<div class="row">'+
							  	 							'<div class="col-xs-3">'+
																'Estrategia: '+
															'</div><!-- /.col -->'+   
															'<div class="col-xs-9">'+ 
																estrategias[0].pilarNombre+
															'</div><!-- /.col -->'+ 
														'</div><!-- /.row -->'+
						  	 							'<div class="row">'+
							  	 							'<div class="col-xs-3">'+
				        										'Objetivo Estratégico PND: '+
					  										'</div><!-- /.col -->'+   
					  										'<div class="col-xs-9">'+ 
					  											objetivos[0].objetivoNombre+
					  										'</div><!-- /.col -->'+ 
														'</div><!-- /.row -->'+
														'<div class="row">'+
						  	 								'<div class="col-xs-3">'+
			        											'Linea Transversal: '+
				  											'</div><!-- /.col -->'+   
				  											'<div class="col-xs-9">'+ 
				  												lineaTransversal[0].nombre+
				  											'</div><!-- /.col -->'+ 
														'</div><!-- /.row -->'+
														'<div class="row">'+
					  	 									'<div class="col-xs-3">'+
																'Eje Estrategico: '+
															'</div><!-- /.col -->'+   
															'<div class="col-xs-9">'+ 
																ejeEstrategico[0].nombre+
															'</div><!-- /.col -->'+ 
														'</div></br><!-- /.row -->';*/
							}
					
					}
					//$("#hoja3-cuerpo-programajaja").append(subprogramaCuerpo); 
				}
			/*subprogramaCuerpo+='<div style="page-break-after:always"></div>';
			$("#hoja3-cuerpo-programajaja").append(subprogramaCuerpo); */
		} 
		var total02;
		var total03;
		var total04;
		var total05;
		var total11;
		var total21;
		var total31;
		
		total02 = ubicacion12+ubicacion22+ubicacion32;
		total03 = ubicacion13+ubicacion23+ubicacion33;
		total04 = ubicacion14+ubicacion24+ubicacion34;
		total05 = ubicacion15+ubicacion25+ubicacion35;
		total11 = ubicacion12+ubicacion13+ubicacion14+ubicacion15;
		total21 = ubicacion22+ubicacion23+ubicacion24+ubicacion25;
		total31 = ubicacion32+ubicacion33+ubicacion34+ubicacion35;
		$("#fc12").append(ubicacion12);
		$("#fc13").append(ubicacion13);
		$("#fc14").append(ubicacion14);
		$("#fc15").append(ubicacion15);
		$("#fc22").append(ubicacion22);
		$("#fc23").append(ubicacion23);
		$("#fc24").append(ubicacion24);
		$("#fc25").append(ubicacion25);
		$("#fc32").append(ubicacion32);
		$("#fc33").append(ubicacion33);
		$("#fc34").append(ubicacion34);
		$("#fc35").append(ubicacion35);
		$("#fc02").append(total02);
		$("#fc03").append(total03);
		$("#fc04").append(total04);
		$("#fc05").append(total05);
		$("#fc11").append(total11);
		$("#fc21").append(total21);
		$("#fc31").append(total31);
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
       	 	</br></br></br></br></br></br></br></br></br></br></br></br></br>
       	 	<div class="col-xs-12"></div>
		</div><!-- /.section -->
	</div><!-- /.wrapper -->
	
	<div style="page-break-after:always"></div>
	
	<div class="wrapper" style="padding:30px 0px 0px 30px">
		<section class="invoice">
			<div class="row" id="hoja3-cuerpo-programajaja" style="padding:10px 4px 5px 4px" >
				<h3><center>INDICADOR DE RESULTADOS POR PROYECTO</center></h3>
	        	<div class="table-responsive">
				 	<table class="table">
				  		<tr class="success"><td></td><td colspan="4"><strong>Líneas transversales</strong></td></tr>
				  		<tr class="success"><td><strong>Ejes estratégicos</strong></td><td>Igualdad de oportunidades<span class="badge pull-right" id="fc02" style="background-color:green;"></span></td><td>Gestión pública eficiente y transparente<span class="badge pull-right" id="fc03" style="background-color:green;"></span></td><td>Ordenamiento territorial<span class="badge pull-right" id="fc04" style="background-color:green;"></span></td><td>Sostenibilidad ambiental<span class="badge pull-right" id="fc05" style="background-color:green;"></span></td></tr>
				  		<tr><td class="success">Reducción de pobreza y desarrollo social<span class="badge pull-right" id="fc11" style="background-color:green;"></span></td><td>Desarrollo social equitativo<span class="badge pull-right" id="fc12"></span></td><td>Servicios sociales de calidad<span class="badge pull-right" id="fc13"></span></td><td>Desarrollo local participativo<span class="badge pull-right" id="fc14"></span></td><td>Hábitat adecuado y sostenible<span class="badge pull-right" id="fc15"></span></td></tr>
				  		<tr><td class="success">Crecimiento económico inclusivo<span class="badge pull-right" id="fc21" style="background-color:green;"></span></td><td>Empleo y seguridad social<span class="badge pull-right" id="fc22"></span></td><td>Competitividad e innovación<span class="badge pull-right" id="fc23"></span></td><td>Regionalización y diversificación productiva<span class="badge pull-right" id="fc24"></span></td><td>Valorización del capital ambiental<span class="badge pull-right" id="fc25"></span></td></tr>
				  		<tr><td class="success">Inserción de Paraguay en el mundo<span class="badge pull-right" id="fc31" style="background-color:green;"></span></td><td>Igualdad de oportunidades en un mundo globalizado<span class="badge pull-right" id="fc32"></span></td><td>Atracción de inversiones, comercio exterior e imagen país<span class="badge pull-right" id="fc33"></span></td><td>Integración económica regional<span class="badge pull-right" id="fc34"></span></td><td>Sostenibilidad del hábitat global<span class="badge pull-right" id="fc35"></span></td></tr>
				  	</table>
				</div>		
			</div><!-- /.row -->
													
						
					
												
			
		</section>
	</wrapper>     	
 <div style="page-break-after:always"></div>  

    <!-- AdminLTE App -->
    <script src="../../dist/js/app.min.js" type="text/javascript"></script>
    <%  } else { %>
				<p>Favor Iniciar Sesion</p>
			<%  } %>
  </body>
</html>
