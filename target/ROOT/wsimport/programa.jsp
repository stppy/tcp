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
<title>Fuente Financiamiento</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>
<div id="niveles">
<% 
    int anio=2015;
    int pais=1;

	List lista = Client.todosLosProgramasPorAnio(anio);

	for(Iterator<Programa> iterador = lista.iterator(); iterador.hasNext(); ) {
		Programa item = iterador.next();
        SqlHelper.insertProgramas(item.getNumeroFila(), item.getAnio(), item.getNivel(), item.getEntidad(), item.getTipoPrograma(), item.getCodigoPrograma(), item.getNombrePrograma(), item.getAbrevPrograma(), item.getDescripcionPrograma(), item.getObjetivo(), item.getDiagnostico(), item.getBaseLegal(), item.getResultado(), item.getCodigoDepartamento());
	}
	%>
	Progrmas<br> 

</div>
</body>
</html>