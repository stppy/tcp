<%@page import="py.gov.stp.mh.tools.SqlSelects"%>
<%@page import="py.gov.stp.mh.test.ClientExport"%>
<%@ page import="py.gov.stp.mh.test.Client" %>
<%@ page import="py.gov.stp.mh.clasificadores.*" %>
<%@ page import="py.gov.stp.mh.test.*" %>

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
	
	ClientExport.insertProyecto(anio);
	
	%>  	



</body>
</html>
