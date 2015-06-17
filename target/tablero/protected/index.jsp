<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="org.jasig.cas.client.authentication.AttributePrincipalImpl"%>
<!DOCTYPE html>
<html>
<head>
	<title>java-jasig-cas-client-demo</title>
	<meta charset="UTF-8" />
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<ul class="nav nav-tabs">
			<li><a href="/entidad.jsp">Call the /index.jsp page</a></li>
			<li class="active"><a href="/protected/index.jsp">You are on the /protected/index.jsp page</a></li>
			<!-- #### change with your own CAS server and your host name #### -->
			<li><a href="https://login.stp.gov.py:8443/cas/logout?service=http://app01.stp.gov.py:8080/clasificadores/protected/index.jsp">Call the CAS logout</a></li>
		</ul>
		<h3>
			<% AttributePrincipalImpl user = (AttributePrincipalImpl) request.getUserPrincipal();%>
			<p>User: <%=user.getName()%></p>
			<p>Attributes: <%=user.getAttributes()%></p>
		</h3>
	</div>
</body>
</html>
