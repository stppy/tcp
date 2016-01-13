<%@ page import="py.gov.stp.mh.test.Client" %>
<%@ page import="py.gov.stp.mh.clasificadores.*" %>
<%@ page import="java.util.*" %>

<html>

<body>
<head>
<style type="text/css">
/*
.nivel {
	background-color:red;
}
.entidad {
	background-color:yellow;
}
.programa {
	background-color:blue;
}

.contenedor-entidades{
	background-color:silver;
}
.contenedor-programas{
	background-color:pink;
}
*/
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script language="javascript">


</script>

</head>
<body>
<div id="niveles">
	<h2>Niveles 2015</h2>
</div>
<div id="entidades">
	<h2>Entidades Por nivel</h2>
</div>
<div id="tiposPresupuesto">
	<h2>Tipos de presupuesto</h2>
</div>
<div id="Programas">
	<h2>Programas</h2>
</div>

<% 
int anio=2015;
List niveles = Client.getNiveles(anio);

%>    
<script>

	$( document ).ready(function() {
		    <%for(Iterator<Nivel> iterador = niveles.iterator(); iterador.hasNext(); ) {
				Nivel nivel = iterador.next(); %>
				$("#niveles").append("<h2 class=\"nivel\" id=\"<%= nivel.getNivel() %>\"> <%=nivel.getNombreNivel()%> </h2>");
			<%}%>
			$(".nivel").click(function(event){
			      var nivel = $(this).attr('id');
			      
			      if ($(this).next().attr('id')=="entidades-"+nivel)
			    	  $(this).next().toggle();
			      else{
			    	  var datos = $.ajax({
				    		url:'http://appintranet01.stp.gov.py:8080/clasificadores/ajaxHelper?accion=getEntidades&nivel='+nivel,
				    		type:'get',
				    		dataType:'json',
				    		async:false    		
				    	}).responseText;
				      datos = JSON.parse(datos); 
				      $(this).after("<div class=\"contenedor-entidades\" id=\"entidades-"+nivel+"\"></div>");
				      var i=0;
				      for (i=0;i<datos.entidades.length;i++){
				    	  $("#entidades-"+nivel).append("<h3 class=\"entidad\" id=\""+datos.entidades[i].entidad+"\">"+datos.entidades[i].nombreEntidad+"</h3>");
				      }
			      }
			      event.stopPropagation();
			      
			      
			});
			$(document).on('click', '.entidad', function() {
			      var entidad = $(this).attr('id');
			      var nivel = $(this).parent().prev('.nivel').attr('id');
			      if ($(this).next().attr('id')=="programas-"+entidad)
			    	  $(this).next().toggle();
			      else{
				      var datos = $.ajax({
				    		url:'http://appintranet01.stp.gov.py:8080/clasificadores/ajaxHelper?accion=getProgramas&nivel='+nivel+'&entidad='+entidad+'&tipoPresupuesto=1',
				    		type:'get',
				    		dataType:'json',
				    		async:false    		
				    	}).responseText;
				      datos = JSON.parse(datos); 
				      $(this).after("<div class=\"contenedor-programas\" id=\"programas-"+entidad+"\"></div>");
				      var i=0;
				      for (i=0;i<datos.programas.length;i++){
				    	  $("#programas-"+entidad).append("<h4 class=\"programa\" id=\""+datos.programas[i].programa+"\">"+datos.programas[i].nombrePrograma+'</h3>');
				      }
			      }
			      event.stopPropagation();
			});

	  });
	  
	  </script>



</body>
</html>
