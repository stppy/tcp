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
List lista = Client.getUnidadesResponsables(anio);


	
	for(Iterator<UnidadResponsable> iterador = lista.iterator(); iterador.hasNext(); ) {
		UnidadResponsable item = iterador.next();
		SqlHelper.insertUnidadResponsable(item.getUnrCodigo(), item.getUjeCodigo(), item.getUnrNombre(), "", item.getUnrAbrev(), item.getNumeroFila(), item.getEntidad(), item.getNivel(), anio);
		
		
	}%>  	



</body>
</html>
