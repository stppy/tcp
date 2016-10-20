<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Prueba </title>
	<!-- jQuery 2.1.3  -->
    <script src="plugins/jQuery/jQuery-2.1.3.min.js"></script>
	<!-- Leaflet -->	
	<link rel="stylesheet" href="plugins/mapa/leaflet.css" />
	<script src="plugins/mapa/leaflet.js"></script>
	<!-- Leaflet location picker -->
	<link href="plugins/mapa/leaflet-locationpicker.css" rel="stylesheet">
	<script src="plugins/mapa/leaflet-locationpicker.js"></script>	
</head>
<body>

	<label>Insertar una geolocalización:</label>
	<form action="">
		<table> 
			<tr><td><input id="geoloc" type="text" value="" size="20" /></td></tr>
			<tr><td><input id="geolat" type="text" value="" size="20" /></td></tr>
			<tr><td><input id="geolng" type="text" value="" size="20" /></td></tr>
		</table>	
	</form>

	<script type="text/javascript">
		$('#geoloc').leafletLocationPicker({
			locationSep: ' - '
			}).on('changeLocation', function(e) {
				if (e.latlng.lat != null) $('#geolat').val( e.latlng.lat );
				if (e.latlng.lng != null) $('#geolng').val( e.latlng.lng );	
		});
	</script>

</body>
</html>