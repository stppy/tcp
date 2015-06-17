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

	List lista = Client.getFuncionales(anio);

	for(Iterator<Funcional> iterador = lista.iterator(); iterador.hasNext(); ) {
		Funcional item = iterador.next();
        SqlHelper.insertFuncionales(item.getNumeroFila(), item.getCodigoFuncional(), item.getNombre(), item.getAbreviacion(), item.getEsImputable());
	}
	%>
	Funcionales Listo<br> 

</div>
</body>
</html>