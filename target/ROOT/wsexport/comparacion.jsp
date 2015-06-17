<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="py.gov.stp.mh.test.Client" %>
<%@ page import="py.gov.stp.mh.tools.SqlHelper" %>
<%@ page import="py.gov.stp.mh.clasificadores.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.JsonElement" %>
<%@ page import="com.google.gson.JsonObject" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Niveles</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/plugins/jsonTable.js"></script>
</head>
<body>
<div id="datos">


<% 
    int anio=2016;
    int pais=2;
	
    JsonObject myObj = new JsonObject();
    
	List unidadesDeMedida = Client.getUnidadesDeMedida();
	String jsonUnidadesMedida = new Gson().toJson(unidadesDeMedida);
	
	List pilares = Client.getPilares();
	String jsonPilares = new Gson().toJson(pilares);

	
	List planes = Client.getPlanes();
	String jsonPlanes = new Gson().toJson(planes);

	List proyectosSnip = Client.getProyectosSNIP();
	String jsonSnip = new Gson().toJson(proyectosSnip);

	List proyectosSnipAutorizados = Client.getProyectoSNIPPAutorizado(anio);
	String jsonSnipAutorizados = new Gson().toJson(proyectosSnipAutorizados);

	List ejes = Client.getEjesPorPlans(); 
	JsonElement jsonEjesPlan = new Gson().toJsonTree(ejes.size());

	List funcionales = Client.getFuncionales(anio);
	JsonElement jsonFuncionales = new Gson().toJsonTree(funcionales.size());

	List niveles = Client.getNiveles(anio);
	JsonElement jsonNiveles = new Gson().toJsonTree(niveles.size());

	List catalogosDncp = Client.getCatalgoDncp(anio);
	JsonElement jsonDncp = new Gson().toJsonTree(catalogosDncp.size());

	List catalogosProductos = Client.getCatalogosProductoMetas(anio);
	JsonElement jsonProductos = new Gson().toJsonTree(catalogosProductos.size());

	//List objetosDeGasto = Client.getObjetosDeGasto(anio);
	//JsonElement jsonUnidadesMedida = new Gson().toJsonTree(unidadesDeMedida.size());

	//List organismosFinanciadores = Client.getOrganismosFinanciadores(anio);
	//JsonElement jsonUnidadesMedida = new Gson().toJsonTree(unidadesDeMedida.size());

	List unidadesResponsables = Client.getUnidadesResponsables(anio);
	JsonElement jsonUr = new Gson().toJsonTree(unidadesResponsables.size());

	List tipoProgramas = Client.getTiposPrograma(anio);
	JsonElement jsonTipoPrograma = new Gson().toJsonTree(tipoProgramas.size());

	List departamentos = Client.getDepartamentos(pais, anio);
	JsonElement jsonDepartamentos = new Gson().toJsonTree(departamentos.size());

	List entidades = Client.todasLasEntidadesPorAnio(anio);
	JsonElement jsonEntidades = new Gson().toJsonTree(entidades.size());

	List programas = Client.todosLosProgramasPorAnio(anio);
	JsonElement jsonProgramas = new Gson().toJsonTree(programas.size());

	List subprogramas = Client.todosLosSubprogramasPorAnio(anio);
	JsonElement jsonSubprogramas = new Gson().toJsonTree(subprogramas.size());

	List proyectos = Client.todosLosProyectosPorAnio(anio);
	JsonElement jsonProyectos = new Gson().toJsonTree(proyectos.size());

	List productos = Client.todosLosProductosPorAnio(anio);
	JsonElement jsonProductosPresupusto = new Gson().toJsonTree(productos.size());


	myObj.add("unidadesMedida", jsonUnidadesMedida);
	
%>   
<script>

$( document ).ready(function() {
	var jsUnidadMedidas=<%=jsonUnidadesMedida%>;
	var jsonObj = JSON.parse(JSON.stringify(jsUnidadMedidas));
	
	var tabla = '<table id="unidadMedida">';
	for (var i =0; i< jsonObj.length; i++){
		tabla += "<tr>";
			tabla += "<td>"+jsonObj[i].codigoUnidadMedida+"</td>";
			tabla += "<td>"+jsonObj[i].nombre+"</td>";
			tabla += "<td>"+jsonObj[i].abreviacion+"</td>";
		tabla += "</tr>"
	}
	$("#datos").append(tabla);
	tabla+="</table>";
	
	
	
	

	
	var jsPilares=<%=jsonPilares%>;
	var jsonObj = JSON.parse(JSON.stringify(jsPilares));
	
	var tabla = '<table id="pilares">';
	for (var i =0; i< jsonObj.length; i++){
		tabla += "<tr>";
			tabla += "<td>"+jsonObj[i].numeroFila+"</td>";
			tabla += "<td>"+jsonObj[i].codigoPilar+"</td>";
			tabla += "<td>"+jsonObj[i].codigoPlan+"</td>";
			tabla += "<td>"+jsonObj[i].pilarNombre+"</td>";
			tabla += "<td>"+jsonObj[i].pilarDescripcion+"</td>";
		tabla += "</tr>"
	}
	$("#datos").append(tabla);
	tabla+="</table>";
	
	
	
	

	
	var jsPlanes=<%=jsonPlanes%>;
	var jsonObj = JSON.parse(JSON.stringify(jsPlanes));
	
	var tabla = '<table id="planes">';
	for (var i =0; i< jsonObj.length; i++){
		tabla += "<tr>";
			tabla += "<td>"+jsonObj[i].codigoPlan+"</td>";
			tabla += "<td>"+jsonObj[i].entidadResponsable+"</td>";
			tabla += "<td>"+jsonObj[i].planNombre+"</td>";
			tabla += "<td>"+jsonObj[i].planDescripcion+"</td>";
			tabla += "<td>"+jsonObj[i].planDetalle+"</td>";
			tabla += "<td>"+jsonObj[i].planDesde+"</td>";
		tabla += "</tr>"
	}
	$("#datos").append(tabla);
	tabla+="</table>";
	
	
	
	
	
	
	var jsProyectosSNIP=<%=jsonSnip%>;
	var jsonObj = JSON.parse(JSON.stringify(jsProyectosSNIP));
	
	var tabla = '<table id="ProyectosSnip">';
	for (var i =0; i< jsonObj.length; i++){
		tabla += "<tr>";
			tabla += "<td>"+jsonObj[i].codigoSnip+"</td>";
			tabla += "<td>"+jsonObj[i].nombreProyecto+"</td>";
			tabla += "<td>"+jsonObj[i].estado+"</td>";
		tabla += "</tr>"
	}
	$("#datos").append(tabla);
	tabla+="</table>";
	
	
	
	
	
	

	var jsSnipAutorizados=<%=jsonSnipAutorizados%>;
	var jsonObj = JSON.parse(JSON.stringify(jsSnipAutorizados));
	
	var tabla = '<table id="SnipAutorizados">';
	for (var i =0; i< jsonObj.length; i++){
		tabla += "<tr>";
			tabla += "<td>"+jsonObj[i].numeroFila+"</td>";
			tabla += "<td>"+jsonObj[i].codigoSnip+"</td>";
			tabla += "<td>"+jsonObj[i].anio+"</td>";
			tabla += "<td>"+jsonObj[i].nivel+"</td>";
			tabla += "<td>"+jsonObj[i].entidad+"</td>";
			tabla += "<td>"+jsonObj[i].codFuenteFinanciamiento+"</td>";
		tabla += "</tr>"
	}
	$("#datos").append(tabla);
	tabla+="</table>";
	
	
	
	
	

	
	var jsEjes=<%=jsonEjesPlan%>;
	var jsonObj = JSON.parse(JSON.stringify(jsEjes));
	
	var tabla = '<table id="Ejes">';
	for (var i =0; i< jsonObj.length; i++){
		tabla += "<tr>";
			tabla += "<td>"+jsonObj[i].numeroFila+"</td>";
			tabla += "<td>"+jsonObj[i].codigoPlan+"</td>";
			tabla += "<td>"+jsonObj[i].ejeCodigo+"</td>";
			tabla += "<td>"+jsonObj[i].ejeNombre+"</td>";
			tabla += "<td>"+jsonObj[i].ejeDescripcion+"</td>";
		tabla += "</tr>"
	}
	$("#datos").append(tabla);
	tabla+="</table>";
	
	
	
	

	
	var jsFuncionales=<%=jsonFuncionales%>;
	var jsonObj = JSON.parse(JSON.stringify(jsFuncionales));
	
	var tabla = '<table id="funcionales">';
	for (var i =0; i< jsonObj.length; i++){
		tabla += "<tr>";
			tabla += "<td>"+jsonObj[i].numeroFila+"</td>";
			tabla += "<td>"+jsonObj[i].codigoFuncional+"</td>";
			tabla += "<td>"+jsonObj[i].nombre+"</td>";
			tabla += "<td>"+jsonObj[i].abreviacion+"</td>";
			tabla += "<td>"+jsonObj[i].esImputable+"</td>";
		tabla += "</tr>"
	}
	$("#datos").append(tabla);
	tabla+="</table>";
	
	
	
	
	
	
	
	
	var jsNiveles=<%=jsonNiveles%>;
	var jsonObj = JSON.parse(JSON.stringify(jsNiveles));
	
	var tabla = '<table id="niveles">';
	for (var i =0; i< jsonObj.length; i++){
		tabla += "<tr>";
			tabla += "<td>"+jsonObj[i].numeroFila+"</td>";
			tabla += "<td>"+jsonObj[i].anio+"</td>";
			tabla += "<td>"+jsonObj[i].nivel+"</td>";
			tabla += "<td>"+jsonObj[i].nombreNivle+"</td>"; //ojo con .nombreNivle hay un error de tipeo
			tabla += "<td>"+jsonObj[i].abrevNivel+"</td>";
			tabla += "<td>"+jsonObj[i].esImputable+"</td>";
		tabla += "</tr>"
	}
	$("#datos").append(tabla);
	tabla+="</table>";
	
	
	
	
	
	
	
	var jsDncp=<%=jsonDncp%>;
	var jsonObj = JSON.parse(JSON.stringify(jsDncp));
	
	var tabla = '<table id="dncp">';
	for (var i =0; i< jsonObj.length; i++){
		tabla += "<tr>";
			tabla += "<td>"+jsonObj[i].numeroFila+"</td>";
			tabla += "<td>"+jsonObj[i].anio+"</td>";
			tabla += "<td>"+jsonObj[i].codCatalogo+"</td>";
			tabla += "<td>"+jsonObj[i].nombreCatalogo+"</td>";
			tabla += "<td>"+jsonObj[i].precio+"</td>";
			tabla += "<td>"+jsonObj[i].codObjetoGasto+"</td>";
		tabla += "</tr>"
	}
	$("#datos").append(tabla);
	tabla+="</table>";
	
	
	
	
	
	
	var jsProductos=<%=jsonProductos%>;
	var jsonObj = JSON.parse(JSON.stringify(jsProductos));
	
	var tabla = '<table id="productos">';
	for (var i =0; i< jsonObj.length; i++){
		tabla += "<tr>";
			tabla += "<td>"+jsonObj[i].numeroFila+"</td>";
			tabla += "<td>"+jsonObj[i].anio+"</td>";
			tabla += "<td>"+jsonObj[i].nivel+"</td>";
			tabla += "<td>"+jsonObj[i].entidad+"</td>";
			tabla += "<td>"+jsonObj[i].tipoPrograma+"</td>";
		tabla += "</tr>"
	}
	$("#datos").append(tabla);
	tabla+="</table>";
	
	
	
	
	
	
	
	
	var jsUr=<%=jsonUr%>;
	var jsonObj = JSON.parse(JSON.stringify(jsUr));
	
	var tabla = '<table id="ur">';
	for (var i =0; i< jsonObj.length; i++){
		tabla += "<tr>";
			tabla += "<td>"+jsonObj[i].numeroFila+"</td>";
			tabla += "<td>"+jsonObj[i].nivel+"</td>";
			tabla += "<td>"+jsonObj[i].entidad+"</td>";
			tabla += "<td>"+jsonObj[i].unrCodigo+"</td>";
			tabla += "<td>"+jsonObj[i].ujeCodigo+"</td>";
			tabla += "<td>"+jsonObj[i].unrNombre+"</td>";
			
		tabla += "</tr>"
	}
	$("#datos").append(tabla);
	tabla+="</table>";
	
	
	
	 
	var jsTipoPrograma=<%=jsonTipoPrograma%>;
	var jsonObj = JSON.parse(JSON.stringify(jsTipoPrograma));
	
	var tabla = '<table id="tipoPrograma">';
	for (var i =0; i< jsonObj.length; i++){
		tabla += "<tr>";
			tabla += "<td>"+jsonObj[i].numeroFila+"</td>";
			tabla += "<td>"+jsonObj[i].anio+"</td>";
			tabla += "<td>"+jsonObj[i].codigoTipoPrograma+"</td>";
			tabla += "<td>"+jsonObj[i].nombreTipoPrograma+"</td>";
			tabla += "<td>"+jsonObj[i].abrevTipoPrograma+"</td>";
		tabla += "</tr>"
	}
	$("#datos").append(tabla);
	tabla+="</table>";
	
	
	
	
	
	
	
	
	
	var jsDepartamentos=<%=jsonDepartamentos%>;
	var jsonObj = JSON.parse(JSON.stringify(jsDepartamentos));
	
	var tabla = '<table id="departamentos">';
	for (var i =0; i< jsonObj.length; i++){
		tabla += "<tr>";
			tabla += "<td>"+jsonObj[i].numeroFila+"</td>";
			tabla += "<td>"+jsonObj[i].codigoPais+"</td>";
			tabla += "<td>"+jsonObj[i].nombreDepartamento+"</td>";
			tabla += "<td>"+jsonObj[i].abrevDepartamento+"</td>";
			tabla += "<td>"+jsonObj[i].descripcion+"</td>";
		tabla += "</tr>"
	}
	$("#datos").append(tabla);
	tabla+="</table>";
	
	
	
	
	
	
	
	
	var jsEntidades=<%=jsonEntidades%>;
	var jsonObj = JSON.parse(JSON.stringify(jsEntidades));
	
	var tabla = '<table id="entidades">';
	for (var i =0; i< jsonObj.length; i++){
		tabla += "<tr>";
			tabla += "<td>"+jsonObj[i].numeroFila+"</td>";
			tabla += "<td>"+jsonObj[i].anio+"</td>";
			tabla += "<td>"+jsonObj[i].nivel+"</td>";
			tabla += "<td>"+jsonObj[i].entidad+"</td>";
			tabla += "<td>"+jsonObj[i].nombreEntidad+"</td>";
			tabla += "<td>"+jsonObj[i].abrevEntidad+"</td>";
		tabla += "</tr>"
	}
	$("#datos").append(tabla);
	tabla+="</table>";
	
	
	
	
	
	
	
	var jsProgramas=<%=jsonProgramas%>;
	var jsonObj = JSON.parse(JSON.stringify(jsProgramas));
	
	var tabla = '<table id="programas">';
	for (var i =0; i< jsonObj.length; i++){
		tabla += "<tr>";
			tabla += "<td>"+jsonObj[i].numeroFila+"</td>";
			tabla += "<td>"+jsonObj[i].anio+"</td>";
			tabla += "<td>"+jsonObj[i].nivel+"</td>";
			tabla += "<td>"+jsonObj[i].entidad+"</td>";
			tabla += "<td>"+jsonObj[i].tipoPrograma+"</td>";
			tabla += "<td>"+jsonObj[i].codigoPrograma+"</td>";
			tabla += "<td>"+jsonObj[i].nombrePrograma+"</td>";
			tabla += "<td>"+jsonObj[i].abrevPrograma+"</td>";
			tabla += "<td>"+jsonObj[i].descripcionPrograma+"</td>";
			tabla += "<td>"+jsonObj[i].objetivo+"</td>";
			tabla += "<td>"+jsonObj[i].diagnostico+"</td>";
			tabla += "<td>"+jsonObj[i].baseLegal+"</td>";
			tabla += "<td>"+jsonObj[i].resultado+"</td>";
			tabla += "<td>"+jsonObj[i].codigoDepartamento+"</td>";
		tabla += "</tr>"
	}
	$("#datos").append(tabla);
	tabla+="</table>";
	
	
	
	
	
	
	var jsSubprogramas=<%=jsonSubprogramas%>;
	var jsonObj = JSON.parse(JSON.stringify(jsSubprogramas));
	
	var tabla = '<table id="subprogramas">';
	for (var i =0; i< jsonObj.length; i++){
		tabla += "<tr>";
			tabla += "<td>"+jsonObj[i].numeroFila+"</td>";
			tabla += "<td>"+jsonObj[i].anio+"</td>";
			tabla += "<td>"+jsonObj[i].nivel+"</td>";
			tabla += "<td>"+jsonObj[i].entidad+"</td>";
			tabla += "<td>"+jsonObj[i].tipoPrograma+"</td>";
			tabla += "<td>"+jsonObj[i].codigoPrograma+"</td>";
			tabla += "<td>"+jsonObj[i].codigoSubprograma+"</td>";
			tabla += "<td>"+jsonObj[i].nombreSubprograma+"</td>";
			tabla += "<td>"+jsonObj[i].abrevSubprograma+"</td>";
			tabla += "<td>"+jsonObj[i].descripcionSubprograma+"</td>";
			tabla += "<td>"+jsonObj[i].objetivo+"</td>";
			tabla += "<td>"+jsonObj[i].codigoDepartamento+"</td>";
		tabla += "</tr>"
	}
	$("#datos").append(tabla);
	tabla+="</table>";
	
	
	
	
	
	
	var jsProyectos=<%=jsonProyectos%>;
	var jsonObj = JSON.parse(JSON.stringify(jsProyectos));
	
	var tabla = '<table id="proyectos">';
	for (var i =0; i< jsonObj.length; i++){
		tabla += "<tr>";
			tabla += "<td>"+jsonObj[i].numeroFila+"</td>";
			tabla += "<td>"+jsonObj[i].anio+"</td>";
			tabla += "<td>"+jsonObj[i].nivel+"</td>";
			tabla += "<td>"+jsonObj[i].entidad+"</td>";
			tabla += "<td>"+jsonObj[i].tipoPrograma+"</td>";
			tabla += "<td>"+jsonObj[i].codigoPrograma+"</td>";
			tabla += "<td>"+jsonObj[i].codigoSubprograma+"</td>";
			tabla += "<td>"+jsonObj[i].codigoProyecto+"</td>";
			tabla += "<td>"+jsonObj[i].nombreProyecto+"</td>";
			tabla += "<td>"+jsonObj[i].descripcionProyecto+"</td>";
			tabla += "<td>"+jsonObj[i].abrevProyecto+"</td>";
			tabla += "<td>"+jsonObj[i].codigoUnidadResponsable+"</td>";
			tabla += "<td>"+jsonObj[i].codigoFuncional+"</td>";
			tabla += "<td>"+jsonObj[i].diagnostico+"</td>";
			tabla += "<td>"+jsonObj[i].resultadoEsperado+"</td>";
			tabla += "<td>"+jsonObj[i].CodigoDepartamento+"</td>";
		tabla += "</tr>"
	}
	$("#datos").append(tabla);
	tabla+="</table>";
	
	
	
	
	
	
	
	
	var jsProductosPresupuesto=<%=jsonProductosPresupusto%>;
	var jsonObj = JSON.parse(JSON.stringify(jsProductosPresupuesto));
	
	var tabla = '<table id="productospresupuesto">';
	for (var i =0; i< jsonObj.length; i++){
		tabla += "<tr>";
			tabla += "<td>"+jsonObj[i].numeroFila+"</td>";
			tabla += "<td>"+jsonObj[i].anio+"</td>";
			tabla += "<td>"+jsonObj[i].codigoTipoPrograma+"</td>";
			tabla += "<td>"+jsonObj[i].nombreTipoPrograma+"</td>";
			tabla += "<td>"+jsonObj[i].abrevTipoPrograma+"</td>";
		tabla += "</tr>"
	}
	$("#datos").append(tabla);
	tabla+="</table>";
	
	

	
	
});
</script>
</div>
</body>
</html>