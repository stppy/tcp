<%@ page import="py.gov.stp.mh.test.Client" %>
<%@ page import="py.gov.stp.mh.clasificadores.*" %>
<%@ page import="py.gov.stp.mh.clasificadores.Entidad" %>
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


	
	for(Iterator<Nivel> iterador = niveles.iterator(); iterador.hasNext(); ) {
		Nivel nivel = iterador.next(); 
		List entidades = Client.getEntidadesPorNivel((int)nivel.getNivel(), anio);
		for(Iterator<Entidad> iteradorEntidades = entidades.iterator(); iteradorEntidades.hasNext(); ) {
			Entidad entidad = iteradorEntidades.next();
			if (entidad.getNivel()==12){
				if (entidad.getEntidad()==1||entidad.getEntidad()==4||entidad.getEntidad()==6||entidad.getEntidad()==7||entidad.getEntidad()==8||entidad.getEntidad()==10||entidad.getEntidad()==11||entidad.getEntidad()==13||entidad.getEntidad()==16){
					SqlHelper.insertEntidades(entidad.getNumeroFila(), entidad.getAnio(), entidad.getNivel(), entidad.getEntidad(), entidad.getNombreEntidad(), entidad.getAbrevEntidad(), entidad.getSiglaEntidad(), entidad.getBaseLegal(), entidad.getMision(), entidad.getPolitica(), entidad.getObjetivo(), entidad.getDiagnostico(), entidad.getRuc());
				}
			}
			 if (entidad.getNivel()==23){
				 if (entidad.getEntidad()==3||entidad.getEntidad()==4||entidad.getEntidad()==23){
					 SqlHelper.insertEntidades(entidad.getNumeroFila(), entidad.getAnio(), entidad.getNivel(), entidad.getEntidad(), entidad.getNombreEntidad(), entidad.getAbrevEntidad(), entidad.getSiglaEntidad(), entidad.getBaseLegal(), entidad.getMision(), entidad.getPolitica(), entidad.getObjetivo(), entidad.getDiagnostico(), entidad.getRuc());		 
				 }
			 }
		} 
	}%>  	



</body>
</html>
