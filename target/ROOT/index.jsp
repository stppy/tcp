<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="org.jasig.cas.client.authentication.AttributePrincipalImpl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Autenticando</title>

<% AttributePrincipalImpl user = (AttributePrincipalImpl) request.getUserPrincipal();
if (user != null) { %>
	<script>
	window.location.replace("http://spr.stp.gov.py/documentacion.jsp");
	</script>
<% } else { %>
	<p>Unauthenticated / anonymous user</p>
<% } %>


</head>
<body>

</body>
</html>