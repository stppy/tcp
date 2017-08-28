
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Prueba Sistema</title>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script> 
</head>
<body>
<form class="contact_form" action="" method="post" id="formulario">

            <h2>Contáctanos</h2>
        <table>
        	<tr>
        		<td>					
            		<input type="text" name="nivel" id="nivel" placeholder="Ingrese Numero del Nivel" list="listaNiveles" />
           		</td>
           		<td id="f1c2"></td> 
           	</tr>
        	<tr>
        		<td>					
            		<input type="text" name="entidad" id="entidad" placeholder="Ingrese Numero de la Entidad" list="listaEntidades" />
           		</td>
           		<td id="f2c2"></td> 
           	</tr>
        	<tr>
        		<td>					
            		<input type="text" name="programa" id="programa" placeholder="Ingrese Numero del Programa" list="listaProgramas" />
           		</td>
           		<td id="f3c2"></td> 
           	</tr>
           	<tr>
           		<td>
				    <input type="text" id="subPrograma" placeholder="Ingrese Numero del SubPrograma" list="listaSubProgramas">
		            <!--<input type="number" name="subprograma" id="subprograma" placeholder="Ingrese Nº SubPrograma" />-->
		        </td>
		        <td id="f4c2"></td>
		    </tr>
			<tr>
				<td>
		           <input type="text" name="proyecto" id="proyecto" placeholder="Ingrese Nº Proyecto" list="listaProyectos"/>
		        </td>
		        <td id="f5c2"></td>
		    </tr>
			<tr>
				<td>
		            <input type="text" name="producto" id="producto" placeholder="Ingrese Nº Producto" list="listaProductos" />
		        </td>
		        <td id="f6c2"></td>
		    </tr>
			<tr>
				<td>
            		<button class="submit" type="submit">Enviar</button> 
            	</td>
            	<td></td>
            </tr>
        </table>

</form>


<script>
 
	
	
	function Combo(){

		this.nivel = function(){
			var rutaNivel = document.getElementById('nivel').value;

			var datosNiveles = $.ajax({
    			url:'/ajaxHelper?accion=getNiveles',
    			type:'get',
    			dataType:'json',
    			async:false    		
    		}).responseText;

	    	
    		datosNiveles = JSON.parse(datosNiveles);

    		var datalistNiveles = document.createElement('datalist');
    		datalistNiveles.setAttribute('id','listaNiveles'); 
    		var ubicacionDatalistNiveles = document.getElementById('formulario');
  			ubicacionDatalistNiveles.appendChild(datalistNiveles);

  	  		for(var i = 0; i < datosNiveles.niveles.length ; i++) 
  	  		{  			
    			var option = document.createElement('option');
    			option.setAttribute('value',datosNiveles.niveles[i].nivel + ' - ' + datosNiveles.niveles[i].abrevNivel);
    			datalistNiveles.appendChild(option);			
			}	

			for(var x = 0; x < datosNiveles.niveles.length; x++)
			{
				if(datosNiveles.niveles[x].nivel === parseInt(rutaNivel))
				{
					var mostrarNivel = datosNiveles.niveles[x].nombreNivel;
					var nt=document.createTextNode(mostrarNivel);
					var nparrafo=document.getElementById('f1c2');
					nparrafo.appendChild(nt);
				}
			}
		}  

		this.entidad = function(){ 
			this.linkEntidad = document.getElementById('nivel').value;
			this.rutaEntidad2 = document.getElementById('entidad').value;

			this.datosEntidades = $.ajax({
    			url:'/ajaxHelper?accion=getEntidadesPorNivel&nivel='+this.linkEntidad,
    			type:'get',
    			dataType:'json',
    			async:false    		
    		}).responseText;

	    	
    		datosEntidades = JSON.parse(this.datosEntidades);

    		var datalistEntidades = document.createElement('datalist');
    		datalistEntidades.setAttribute('id','listaEntidades'); 
    		var ubicacionDatalistEntidades = document.getElementById('formulario');
  			ubicacionDatalistEntidades.appendChild(datalistEntidades);

  	  		for(var i = 0; i < datosEntidades.entidades.length ; i++) 
  	  		{  			
    			var option = document.createElement('option');
    			option.setAttribute('value',datosEntidades.entidades[i].entidad + ' ) ' + datosEntidades.entidades[i].abrevEntidad);
    			datalistEntidades.appendChild(option);			
			}	

			for(var x = 0; x < datosEntidades.entidades.length; x++)
			{
				if(datosEntidades.entidades[x].entidad === parseInt(this.rutaEntidad2))
				{
					var mostrarEntidad = datosEntidades.entidades[x].nombreEntidad;
					var nt=document.createTextNode(mostrarEntidad);
					var nparrafo=document.getElementById('f2c2');
					nparrafo.appendChild(nt);
				}
			}
		} 

		this.programas = function(){
			this.rutaPrograma = document.getElementById('programa').value;
			this.linkNivel = document.getElementById("nivel").value;
			this.linkEntidad = document.getElementById("entidad").value;

			this.datosProgramas = $.ajax({
    			url:'/ajaxHelper?accion=getProgramas&anio=2015&nivel='+this.linkNivel+'&entidad='+this.linkEntidad+'&tipoPresupuesto=3&programa='+this.rutaPrograma,
    			type:'get',
    			dataType:'json',
    			async:false    		
    		}).responseText;

	    	
    		datosProgramas = JSON.parse(this.datosProgramas);

    		var datalistProgramas = document.createElement('datalist');
    		datalistProgramas.setAttribute('id','listaProgramas'); 
    		var ubicacionDatalistProgramas = document.getElementById('formulario');
  			ubicacionDatalistProgramas.appendChild(datalistProgramas);

  	  		for(var i = 0; i < datosProgramas.programas.length ; i++) 
  	  		{  			
    			var option = document.createElement('option');
    			option.setAttribute('value',datosProgramas.programas[i].codigoPrograma + ' ) ' + datosProgramas.programas[i].abrevPrograma);
    			datalistProgramas.appendChild(option);			
			}	

			for(var x = 0; x < datosProgramas.programas.length; x++)
			{
				if(datosProgramas.programas[x].codigoPrograma === parseInt(this.rutaPrograma))
				{
					var mostrarNombrePrograma = datosProgramas.programas[x].nombrePrograma;
					var nt=document.createTextNode(mostrarNombrePrograma);
					var nparrafo=document.getElementById('f3c2');
					nparrafo.appendChild(nt);
				}
			}
		} 
		this.subProgramas = function(){
			this.rutaSubPrograma = document.getElementById('subPrograma').value;
			this.rutaProgramas = document.getElementById('programa').value;
			this.linkNivel = document.getElementById("nivel").value;
			this.linkEntidad = document.getElementById("entidad").value;

			this.datosSubProgramas = $.ajax({
    			url:'/ajaxHelper?accion=getSubprogramas&anio=2015&nivel='+this.linkNivel+'&entidad='+this.linkEntidad+'&tipoPresupuesto=1&programa='+this.rutaProgramas,
    			type:'get',
    			dataType:'json',
    			async:false    		
    		}).responseText;

	    	
    		datosSubProgramas = JSON.parse(this.datosSubProgramas);

    		var datalistSubProgramas = document.createElement('datalist');
    		datalistSubProgramas.setAttribute('id','listaSubProgramas'); 
    		var ubicacionDatalistProgramas = document.getElementById('formulario');
  			ubicacionDatalistProgramas.appendChild(datalistSubProgramas);

  	  		for(var i = 0; i < datosSubProgramas.subprogramas.length ; i++) 
  	  		{  			
    			var option = document.createElement('option');
    			option.setAttribute('value', datosSubProgramas.subprogramas[i].codigoSubprograma + ' ) ' + datosSubProgramas.subprogramas[i].abrevSubprograma);
    			datalistSubProgramas.appendChild(option);			
			}	

			for(var x = 0; x < datosSubProgramas.subprogramas.length; x++)
			{
				if(datosSubProgramas.subprogramas[x].codigoSubprograma === parseInt(this.rutaSubPrograma))
				{
					var mostrarNombrePrograma = datosSubProgramas.subprogramas[x].nombreSubprograma;
					var nt=document.createTextNode(mostrarNombrePrograma);
					var nparrafo=document.getElementById('f4c2');
					nparrafo.appendChild(nt);
				}
			}
		} 

		this.proyecto = function(){
			this.linkNivel = document.getElementById("nivel").value;
			this.linkEntidad = document.getElementById("entidad").value;
			this.linkPrograma = document.getElementById("programa").value;
			this.codigoSubprograma = document.getElementById('subPrograma').value;
			this.rutaProyecto = document.getElementById('proyecto').value;
			
			
			
			

			this.datosProyectos = $.ajax({
    			url:'/ajaxHelper?accion=getProyectos&anio=2015&nivel='+this.linkNivel+'&entidad='+this.linkEntidad+'&tipoPresupuesto=3&programa='+this.linkPrograma+'&subprograma='+this.codigoSubprograma,
    			type:'get',
    			dataType:'json',
    			async:false    		
    		}).responseText;

	    	
    		datosProyectos = JSON.parse(this.datosProyectos);

    		var datalistProyectos = document.createElement('datalist');
    		datalistProyectos.setAttribute('id','listaProyectos'); 
    		var ubicacionDatalistProyectos = document.getElementById('formulario');
  			ubicacionDatalistProyectos.appendChild(datalistProyectos);

  	  		for(var i = 0; i < datosProyectos.proyectos.length ; i++) 
  	  		{  			
    			var option = document.createElement('option');
    			option.setAttribute('value', datosProyectos.proyectos[i].codigoProyecto + ' ) ' + datosProyectos.proyectos[i].abrevProyecto);
    			datalistProyectos.appendChild(option);			
			}	

			for(var x = 0; x < datosProyectos.proyectos.length; x++)
			{
				if(datosProyectos.proyectos[x].codigoProyecto === parseInt(this.rutaProyecto))
				{
					var mostrarNombreProyecto = datosProyectos.proyectos[x].nombreProyecto;
					var nt=document.createTextNode(mostrarNombreProyecto);
					var nparrafo=document.getElementById('f5c2');
					nparrafo.appendChild(nt);
				}
			}
		}
		this.producto = function(){
			this.linkNivel = document.getElementById("nivel").value;
			this.linkEntidad = document.getElementById("entidad").value;
			this.linkPrograma = document.getElementById("programa").value;
			this.linkSubPrograma = document.getElementById("subPrograma").value;
			this.linkProyecto = document.getElementById("proyecto").value;
			this.linkProducto = document.getElementById("producto").value;


			this.datosProductos = $.ajax({
    			url:'/ajaxHelper?accion=todosLosProductosPorAnio',
    			type:'get',
    			dataType:'json',
    			async:false    		
    		}).responseText;

	    	
    		datosProductos = JSON.parse(this.datosProductos);

    		var datalistProductos = document.createElement('datalist');
    		datalistProductos.setAttribute('id','listaProductos'); 
    		var ubicacionDatalistProductos = document.getElementById('formulario');
  			ubicacionDatalistProductos.appendChild(datalistProductos);

  	  		for(var i = 0; i < datosProductos.todosLosProductosPorAnio.length ; i++) 
  	  		{  			
  	  			if( (datosProductos.todosLosProductosPorAnio[i].nivel === parseInt(this.linkNivel)) && (datosProductos.todosLosProductosPorAnio[i].entidad === parseInt(this.linkEntidad)) && (datosProductos.todosLosProductosPorAnio[i].codigoPrograma === parseInt(this.linkPrograma)) && (datosProductos.todosLosProductosPorAnio[i].codigoSubprograma === parseInt(this.linkSubPrograma)) && (datosProductos.todosLosProductosPorAnio[i].codigoProyecto === parseInt(this.linkProyecto)) && (datosProductos.todosLosProductosPorAnio[i].codigoProducto === parseInt(this.linkProducto)) )
  	  			{
	    			var option = document.createElement('option');
	    			option.setAttribute('value', datosProductos.todosLosProductosPorAnio[i].codigoProducto + ' ) ' + datosProductos.todosLosProductosPorAnio[i].clase);
	    			datalistProductos.appendChild(option);	
    			}		
			}	

			for(var x = 0; x < datosProductos.todosLosProductosPorAnio.length; x++)
			{
				if( (datosProductos.todosLosProductosPorAnio[x].nivel === parseInt(this.linkNivel)) && (datosProductos.todosLosProductosPorAnio[x].entidad === parseInt(this.linkEntidad)) && (datosProductos.todosLosProductosPorAnio[x].codigoPrograma === parseInt(this.linkPrograma)) && (datosProductos.todosLosProductosPorAnio[x].codigoSubprograma === parseInt(this.linkSubPrograma)) && (datosProductos.todosLosProductosPorAnio[x].codigoProyecto === parseInt(this.linkProyecto)) && (datosProductos.todosLosProductosPorAnio[x].codigoProducto === parseInt(this.linkProducto)) )
				{
					var mostrarNombreProducto = datosProductos.todosLosProductosPorAnio[x].descripcion;
					var nt=document.createTextNode(mostrarNombreProducto);
					var nparrafo=document.getElementById('f6c2');
					nparrafo.appendChild(nt);
				}
			}
		} 



	}

	var eje1 = new Combo();
	document.getElementById('programa').addEventListener('change',eje1.programas,false);
	document.getElementById('subPrograma').addEventListener('change',eje1.subProgramas,false);
	document.getElementById('proyecto').addEventListener('change',eje1.proyecto,false);
	document.getElementById('nivel').addEventListener('change',eje1.nivel,false);
	document.getElementById('entidad').addEventListener('change',eje1.entidad,false);
	document.getElementById('producto').addEventListener('change',eje1.producto,false);




</script>
</body>
</html> 