<%@ page import="py.gov.stp.mh.test.Client" %>
<%@ page import="py.gov.stp.mh.clasificadores.*" %>
<%@ page import="py.gov.stp.mh.tools.*" %>
<%@ page import="java.util.*" %>

<html>

<body>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script language="javascript">


</script>

</head>
<body>
<div id="entidades">

</div>

<% 
int anio=2015;
List niveles = Client.getNiveles(anio);
//List tiposPresupuesto = Client.getTiposDePresupuesto(anio);
List tiposDePrograma = Client.getTiposDeProgramas(anio);



%>    
<script>
$( document ).ready(function() {
	<%
	int codigoEntidad=0;
	for(Iterator<Nivel> iterador = niveles.iterator(); iterador.hasNext(); ) {
		Nivel nivel = iterador.next(); 
		List entidades = Client.getEntidadesPorNivel((int)nivel.getNivel());
		%>
		$("#entidades").append('<strong> - >  <%=nivel.getNombreNivel()%></strong><br>');
		<%
		for(Iterator<Entidad> iteradorEntidades = entidades.iterator(); iteradorEntidades.hasNext(); ) {
			Entidad entidad = iteradorEntidades.next(); %>
			$("#entidades").append().text(' - - > <%=codigoEntidad+","+entidad.getNombreEntidad().replaceAll("\"","&quote;").replaceAll("\'","&#39;")+","+entidad.getAbrevEntidad()+",,"+entidad.getEntidad()+","+nivel.getNivel()%><br>');
			
			<%SqlHelper.insertEntidades(entidad.getNumeroFila(), entidad.getAnio(), entidad.getNivel(), entidad.getEntidad(), entidad.getNombreEntidad(), entidad.getAbrevEntidad(), entidad.getSiglaEntidad(), entidad.getBaseLegal(), entidad.getMision(), entidad.getPolitica(), entidad.getObjetivo(), entidad.getDiagnostico());
			for(Iterator<TipoPrograma> iteradorTipoPrograma = tiposDePrograma.iterator(); iteradorTipoPrograma.hasNext(); ) {
				TipoPrograma tipoProgama = iteradorTipoPrograma.next(); %>
				$("#entidades").append().text('- - - > <%=tipoProgama.getNombreTipoPrograma().replaceAll("\"","&quote;").replaceAll("\'","&#39;")%>"+"<br>');
				<% 
				List programas = Client.getProgramas(anio, (int)nivel.getNivel(), (int)entidad.getEntidad(), (int)tipoProgama.getCodTipoPrograma());
				for(Iterator<Programa> iteradorProgramas = programas.iterator(); iteradorProgramas.hasNext(); ) {
					Programa programa = iteradorProgramas.next();
					%>
					$("#entidades").append().text("- - - - > <%=programa.getCodigoPrograma()+") "+programa.getNombrePrograma().replaceAll("\"","&quote;").replaceAll("\'","&#39;")%>");
					$("#entidades").append("<br>");
				<%
				}
				
				
			}
		
		codigoEntidad++;
		}%> 
	<%}%>  	
});
	  </script>


</body>
</html>
