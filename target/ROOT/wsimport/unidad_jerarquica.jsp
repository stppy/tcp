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


	
	for(Iterator<Nivel> iteradorNivel = niveles.iterator(); iteradorNivel.hasNext(); ) {
		Nivel nivel = iteradorNivel.next(); 
		List entidades = Client.getEntidadesPorNivel((int)nivel.getNivel(), anio);
		for(Iterator<Entidad> iteradorEntidades = entidades.iterator(); iteradorEntidades.hasNext(); ) {
			Entidad entidad = iteradorEntidades.next(); 
			List lista = Client.getUnidadesJerarquicas(anio, (int)nivel.getNivel(), (int)entidad.getEntidad());
			for(Iterator<UnidadJerarquica> iterador = lista.iterator(); iterador.hasNext(); ) {
				UnidadJerarquica item = iterador.next();
				SqlHelper.insertUnidadJerarquica(item.getUjeCodigo(), item.getUjeNombre(),"", entidad.getEntidad(), entidad.getNivel(), anio, item.getNumeroFila());
			}
		} 
	}%>  	



</body>
</html>
