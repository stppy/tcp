<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="py.gov.stp.mh.test.Client" %>
<%@ page import="py.gov.stp.mh.tools.SqlHelper" %>
<%@ page import="py.gov.stp.mh.clasificadores.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Niveles</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>
<div id="niveles">


<% 
    int anio=2015;
    int pais=1;
	
	List unidadesDeMedida = Client.getUnidadesDeMedida();
	List pilares = Client.getPilares();
	List planes = Client.getPlanes();
	List proyectosSnip = Client.getProyectosSNIP();
	List proyectosSnipAutorizados = Client.getProyectoSNIPPAutorizado(anio);
	List ejes = Client.getEjesPorPlans();
	List funcionales = Client.getFuncionales(anio);
	List niveles = Client.getNiveles(anio);
	List catalogosDncp = Client.getCatalgoDncp(anio);
	List catalogosProductos = Client.getCatalogosProductoMetas(anio);
	List objetosDeGasto = Client.getObjetosDeGasto(anio);
	List organismosFinanciadores = Client.getOrganismosFinanciadores(anio);
	List unidadesResponsables = Client.getUnidadesResponsables(anio);
	List tipoProgramas = Client.getTiposPrograma(anio);
	List departamentos = Client.getDepartamentos(pais, anio);
	List entidades = Client.todasLasEntidadesPorAnio(anio);
	
%>   
<script>
$( document ).ready(function() {
		
			<%
			
			for(Iterator<Plan> iterador = planes.iterator(); iterador.hasNext(); ) {
				Plan plan = iterador.next();
	//	        SqlHelper.insertPlanes(plan.getCodigoPlan(), plan.getEntidadResponsable(), plan.getPlanNombre(), plan.getPlanDescripcion(), plan.getPlanDetalle(),plan.getPlanDesde(), plan.getPlanHasta());
			}
			%>$("#niveles").append("Planes Listo <br>");<%
			
			SqlHelper.insertLineasTransversales(1,"Igualdad de oportunidades", "", 9);
			SqlHelper.insertLineasTransversales(2,"Gestión pública eficiente y transparente", "", 9);
			SqlHelper.insertLineasTransversales(3,"Ordenamiento territorial", "", 9);
			SqlHelper.insertLineasTransversales(4,"Sostenibilidad ambiental", "", 9);

			%>$("#niveles").append("Lineas Transversales  Listo <br>");<%
			for(Iterator<Pilar> iterador = pilares.iterator(); iterador.hasNext(); ) {
				Pilar pilar = iterador.next();
		        SqlHelper.insertPilares(pilar.getCodigoPilar(), pilar.getPilarNombre(), pilar.getPilarDescripcion(), pilar.getNumeroFila(), 1, 1, pilar.getCodigoPlan());
		        
			}
			%>$("#niveles").append("Estrategias(pilares) Listo <br>");<%
			
			for(Iterator<PlanEje> iterador = ejes.iterator(); iterador.hasNext(); ) {
				PlanEje eje = iterador.next();
		        SqlHelper.insertEjePorPlan(eje.getNumeroFila(), eje.getCodigoPlan(), eje.getEjeCodigo(), eje.getEjeNombre(), eje.getEjeDescripcion());
			}
			%>$("#niveles").append("Plan Ejes Listo <br>");<%
			for(Iterator<ProyectoSNIP> iterador = proyectosSnip.iterator(); iterador.hasNext(); ) {
				ProyectoSNIP poryectoSNIP = iterador.next();
		        SqlHelper.insertProyectoSnip(poryectoSNIP.getCodigoSnip(), poryectoSNIP.getNombreProyecto(), poryectoSNIP.getEstado());
			}
			%>$("#niveles").append("Proyecto SNIP Listo <br>");<%
			for(Iterator<ProyectoSNIPAutorizado> iterador = proyectosSnipAutorizados.iterator(); iterador.hasNext(); ) {
				ProyectoSNIPAutorizado poryectoSNIPAutorizado = iterador.next();
		        SqlHelper.insertProyectoSnipAutorizado(poryectoSNIPAutorizado.getNumeroFila(), poryectoSNIPAutorizado.getCodigoSnip(), poryectoSNIPAutorizado.getAnio(),  poryectoSNIPAutorizado.getNivel(), poryectoSNIPAutorizado.getEntidad(), poryectoSNIPAutorizado.getCodFuenteFinanciamiento(), poryectoSNIPAutorizado.getCodOrganismoFinanciador(), poryectoSNIPAutorizado.getMonto());
			}
			%>$("#niveles").append("Proyecto SNIP Autorizado Listo <br>");<%
			
			for(Iterator<Funcional> iterador = funcionales.iterator(); iterador.hasNext(); ) {
				Funcional funcional = iterador.next();
		        SqlHelper.insertFuncionales(funcional.getNumeroFila(), funcional.getCodigoFuncional(), funcional.getNombre(), funcional.getAbreviacion(), funcional.getEsImputable());
			}
			%>$("#niveles").append(" Funcionales Listo <br>");<%
			for(Iterator<Nivel> iterador = niveles.iterator(); iterador.hasNext(); ) {
				Nivel nivel = iterador.next();
				SqlHelper.insertNiveles(nivel.getNivel(), nivel.getNumeroFila(), nivel.getAnio(), (int)nivel.getNivel(), nivel.getNombreNivel(), nivel.getAbrevNivel(), nivel.getEsImputable(), 50);
			}
			%>$("#niveles").append("Niveles Listo <br>");<%
			for(Iterator<PrecioDNCP> iterador = catalogosDncp.iterator(); iterador.hasNext(); ) {
				PrecioDNCP catalogoDNCP = iterador.next();
		        SqlHelper.insertCatalogoDncp(catalogoDNCP.getNumeroFila(), catalogoDNCP.getAnio(), catalogoDNCP.getCodCatalogo(), catalogoDNCP.getNombreCatalogo(), catalogoDNCP.getPrecio(), catalogoDNCP.getCodObjetoGasto());
			}
			%>$("#niveles").append("Catalogo DNCP Listo <br>");<%
			for(Iterator<CatalogoProductoMeta> iterador = catalogosProductos.iterator(); iterador.hasNext(); ) {
				CatalogoProductoMeta productoMeta = iterador.next();
		        SqlHelper.insertProductosMeta(productoMeta.getCodigoCatalogo(), productoMeta.getNombreCatalogo(), productoMeta.getCodUnidadMedida(), productoMeta.getClase(), "");
			}
			%>$("#niveles").append("Catalogo ProductoMeta Listo <br>");<%
			/*for(Iterator<Entidad> iterador = entidades.iterator(); iterador.hasNext(); ) {
				Entidad entidad = iterador.next();
		        SqlHelper.insertEntidades(entidad.getNumeroFila(), entidad.getAnio(), entidad.getNivel(), entidad.getEntidad(), entidad.getNombreEntidad(), entidad.getAbrevEntidad(), entidad.getSiglaEntidad(), entidad.getBaseLegal(), entidad.getMision(), entidad.getPolitica(), entidad.getObjetivo(), entidad.getDiagnostico());
			}*/
			/*
			for(Iterator<ProyectoSNIP> iterador = ProyectoSNIP.iterator(); iterador.hasNext(); ) {
				ProyectoSNIP proyectoSnip = iterador.next();
		        SqlHelper.insertProyectoSnip(pro, nombre, estado);
			}
			
			for(Iterator<Plan> iterador = planes.iterator(); iterador.hasNext(); ) {
				Plan plan = iterador.next();
		        SqlHelper.insertPlanes((short)plan.getCodigoPlan(), plan.getEntidadResponsable(), plan.getPlanNombre(), plan.getPlanDescripcion(), plan.getPlanDetalle(), plan.getPlanDesde(), plan.getPlanHasta());
		        SqlHelper.insertPlanes(
			}
			*/
			%>
	  });
	  </script>
</div>
</body>
</html>