
<script>
	var entidadCas = "";
	entidadCas ="<%=attributes.get("entidad") %>";
	
	var usuarios = $.ajax({
		url:'/ajaxSelects?accion=getUsuarios&usuario=<%=user.getName()%>',
	  	type:'get',
	  	dataType:'json',
	  	async:false       
	}).responseText;
	usuarios = JSON.parse(usuarios);
	usuarios = usuarios.usuarios;
	
	var i=parseInt(0);
	
	var datosNiveles = $.ajax({
        url:'/ajaxSelects?accion=getNiveles&nivel='+usuarios[0].nivel_id,
        type:'get',
        dataType:'json',
        async:false       
      }).responseText;
      datosNiveles = JSON.parse(datosNiveles);
      datosNiveles = datosNiveles.niveles;
      
     var datosEntidad = $.ajax({
          url:'/ajaxSelects?accion=getEntidad&nivel='+usuarios[0].nivel_id+'&entidad='+usuarios[0].entidad_id,
          type:'get',
          dataType:'json',
          async:false       
        }).responseText;
        datosEntidad = JSON.parse(datosEntidad);
        datosEntidad=datosEntidad.entidades;
	
	var rolDesc = "";
	switch(usuarios[0].rol_id) {
	case 0:
	    rolDesc = "SuperAdmin";
	    break;
	case 1:
		rolDesc = "Administrador";
	    break;
	case 2:
		rolDesc = "Usuario de Carga";
	    break;
	case 3:
		rolDesc = "Usuario de Consulta";
	    break;
	}

	$(document).ready(function(){
		
		$("#nombreUsuario").append(usuarios[0].correo+" ("+usuarios[0].nivel_id+", "+usuarios[0].entidad_id+")");
		$("#PerfilUsuario").append(usuarios[0].nombre+" ("+usuarios[0].nivel_id+", "+usuarios[0].entidad_id+", "+entidadCas+")");
		$("#PerfilUsuario2").html(usuarios[0].nombre+" <small>"+usuarios[0].entidad+"<br>"+rolDesc+"</small>");
		
		for (i=0;i<datosEntidad.length;i++){
	    	 if (datosEntidad[i].nivel==usuarios[0].nivel_id && datosEntidad[i].entidad==usuarios[0].entidad_id)
	    		 break;
	     }
	});
</script>