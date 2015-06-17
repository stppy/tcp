Number.prototype.round = function(p) {
  p = p || 10;
  return parseFloat( this.toFixed(p) );
};

function Combo(){

    this.nivelFocus = function(){
	
   	  var listaDatalist=document.getElementsByTagName('datalist');
      var datosNiveles = $.ajax({
          url:'http://spr.stp.gov.py/ajaxSelects?accion=getNiveles',
          type:'get',
          dataType:'json',
          async:false       
        }).responseText;  
  
        
        datosNiveles = JSON.parse(datosNiveles);
		
        if(listaDatalist.length === 0 )
        {
	        var datalistNiveles = document.createElement('datalist');
	        datalistNiveles.setAttribute('id','listaf1c2');
	        datalistNiveles.setAttribute('size','5'); 
	        var ubicacionDatalistNiveles = document.getElementById('formulario');
	        ubicacionDatalistNiveles.appendChild(datalistNiveles);
	
	        for(var i = 0; i < datosNiveles.niveles.length ; i++) 
	        {    
	        	var option = document.createElement('option');
	          	option.setAttribute('value',datosNiveles.niveles[i].nivel);
	          	option.setAttribute('label',datosNiveles.niveles[i].nombreNivel);
	          	datalistNiveles.appendChild(option);      
	      	} 
        }
    } 

    this.nivel = function(){
    	//var rutaNivel = document.getElementById('nivel-formulario').value;
    	var rutaNivel = nivel_id_jsp;
    	var datosNiveles = $.ajax({
        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getNiveles',
          	type:'get',
          	dataType:'json',
          	async:false       
        }).responseText;

        
        datosNiveles = JSON.parse(datosNiveles);
      	for(var x = 0; x < datosNiveles.niveles.length; x++)
      	{
        	if(datosNiveles.niveles[x].nivel === parseInt(rutaNivel))
        	{
	        	var mostrarNivel = datosNiveles.niveles[x].nombreNivel;
	          	var nt=document.createTextNode(mostrarNivel+" >");
	          	var nparrafo=document.getElementById('f1c2');
	          	nparrafo.innerHTML="";
	          	nparrafo.appendChild(nt);
	        }
      	}
    }  


    this.entidadFocus = function(){ 
      	//var linkEntidad = document.getElementById('nivel-formulario').value;
    	var linkEntidad = nivel_id_jsp;
    	var datosEntidades = $.ajax({
         	 url:'http://spr.stp.gov.py/ajaxSelects?accion=getEntidades&nivel='+linkEntidad,
          	type:'get',
          	dataType:'json',
          	async:false       
        }).responseText;

        datosEntidades = JSON.parse(datosEntidades);
 
        var datalistEntidades = document.createElement('datalist'); 
        datalistEntidades.setAttribute('id','listaf2c2'); 
        var ubicacionDatalistEntidades = document.getElementById('formulario');
        ubicacionDatalistEntidades.appendChild(datalistEntidades);

        for(var i = 0; i < datosEntidades.entidades.length ; i++) 
        {       
        	var option = document.createElement('option');
          	option.setAttribute('value',datosEntidades.entidades[i].entidad);
          	option.setAttribute('label',datosEntidades.entidades[i].nombreEntidad);
          	datalistEntidades.appendChild(option);      
      	}   
    } 


    this.entidad = function(){ 
    	//var linkEntidad = document.getElementById('nivel-formulario').value;
      	//var rutaEntidad2 = document.getElementById('entidad-formulario').value;
    	var linkEntidad = nivel_id_jsp;
      	var rutaEntidad2 = entidad_id_jsp;
      	

      	var datosEntidades = $.ajax({
        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getEntidades&nivel='+linkEntidad,
          	type:'get',
          	dataType:'json',
          	async:false       
        }).responseText;

        datosEntidades = JSON.parse(datosEntidades);
 
    	for(var x = 0; x < datosEntidades.entidades.length; x++)
      	{
        	if(datosEntidades.entidades[x].entidad === parseInt(rutaEntidad2)) 
        	{
        		document.getElementById('entidad-formulario').setAttribute("entidad",rutaEntidad2 );
        		var mostrarEntidad = datosEntidades.entidades[x].nombreEntidad;
          		var nt=document.createTextNode(mostrarEntidad);
          		var nparrafo=document.getElementById('f2c2');
          		nparrafo.innerHTML="";
          		nparrafo.appendChild(nt);
        	} 
      	} 
    }  

    this.tipoProgramaFocus = function(){

    	var rutaNivel = nivel_id_jsp;
    	var datosNiveles = $.ajax({
        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getNiveles',
          	type:'get',
          	dataType:'json',
          	async:false       
        }).responseText;

        
        datosNiveles = JSON.parse(datosNiveles);
      	for(var y = 0; y < datosNiveles.niveles.length; y++)
      	{
        	if(datosNiveles.niveles[y].nivel === parseInt(rutaNivel))
        	{
	        	var mostrarNivel = datosNiveles.niveles[y].nombreNivel;
	          	var nt=document.createTextNode(mostrarNivel+" >");
	          	var nparrafo=document.getElementById('f1c2');
	          	nparrafo.innerHTML="";
	          	nparrafo.appendChild(nt);
	        }
      	}
    	
    	var linkEntidad = nivel_id_jsp;
      	var rutaEntidad2 = entidad_id_jsp;
      	

      	var datosEntidades = $.ajax({
        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getEntidades&nivel='+linkEntidad,
          	type:'get',
          	dataType:'json',
          	async:false       
        }).responseText;

        datosEntidades = JSON.parse(datosEntidades);
 
    	for(var x = 0; x < datosEntidades.entidades.length; x++)
      	{
        	if(datosEntidades.entidades[x].entidad === parseInt(rutaEntidad2)) 
        	{
        		document.getElementById('entidad-formulario').setAttribute("entidad",rutaEntidad2 );
        		var mostrarEntidad = datosEntidades.entidades[x].nombreEntidad;
          		var nt=document.createTextNode(mostrarEntidad);
          		var nparrafo=document.getElementById('f2c2');
          		nparrafo.innerHTML="";
          		nparrafo.appendChild(nt);
        	} 
      	} 
    	   	
    	
      	var datosTipoPrograma = $.ajax({
        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getTiposPrograma',
          	type:'get',
          	dataType:'json',
          	async:false       
        }).responseText;

        datosTipoPrograma = JSON.parse(datosTipoPrograma);
        var datalistEntidades = document.createElement('datalist'); 
        datalistEntidades.setAttribute('id','listaf3c2'); 
        var ubicacionDatalistEntidades = document.getElementById('formulario');
        ubicacionDatalistEntidades.appendChild(datalistEntidades);

        for(var i = 0; i < datosTipoPrograma.tiposPrograma.length ; i++) 
        {       
        	var option = document.createElement('option');
          	option.setAttribute('value',datosTipoPrograma.tiposPrograma[i].numeroFila);
          	option.setAttribute('label',datosTipoPrograma.tiposPrograma[i].nombreTipoPrograma);
          	datalistEntidades.appendChild(option);      
      	}      
    }
    this.tipoPrograma = function(){
    	var linkTipoPrograma = document.getElementById('tipoPrograma-formulario').value;

      	var datosTipoPrograma = $.ajax({
        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getTiposPrograma',
          	type:'get',
          	dataType:'json',
          	async:false       
        }).responseText;

        datosTipoPrograma = JSON.parse(datosTipoPrograma);
 
    	for(var x = 0; x < datosTipoPrograma.tiposPrograma.length; x++)
      	{
        	if(datosTipoPrograma.tiposPrograma[x].numeroFila === parseInt(linkTipoPrograma)) 
        	{
        		var mostrarTipoPrograma = datosTipoPrograma.tiposPrograma[x].nombreTipoPrograma;
          		var nt=document.createTextNode(mostrarTipoPrograma);
          		var nparrafo=document.getElementById('f3c2');
          		nparrafo.innerHTML="";
          		nparrafo.appendChild(nt);
        	} 
      	}
    }

    this.programasFocus = function(){
      	//var linkNivel = document.getElementById('nivel-formulario').value;
      	//var linkEntidad = document.getElementById("entidad-formulario").value;
    	var linkNivel = nivel_id_jsp;
      	var linkEntidad = entidad_id_jsp;
      	var linkTipoPrograma = parseInt(document.getElementById("tipoPrograma-formulario").value)
      	;

    	var datosProgramas = $.ajax({
        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getProgramas&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPrograma,
          	type:'get',
          	dataType:'json',
          	async:false       
        }).responseText;
        
        datosProgramas = JSON.parse(datosProgramas);
        $("#listaf4c2").remove();
        var datalistProgramas = document.createElement('datalist');
        datalistProgramas.setAttribute('id','listaf4c2'); 
        var ubicacionDatalistProgramas = document.getElementById('formulario');
        ubicacionDatalistProgramas.appendChild(datalistProgramas);

        for(var i = 0; i < datosProgramas.programas.length ; i++) 
        {       
	        var option = document.createElement('option');
    	    option.setAttribute('value',datosProgramas.programas[i].codigoPrograma);
    	    option.setAttribute('label',datosProgramas.programas[i].nombrePrograma);
        	datalistProgramas.appendChild(option);       
      	} 
    }
    this.programas = function(){
      	//var linkNivel = document.getElementById('nivel-formulario').value;
      	//var linkEntidad = document.getElementById("entidad-formulario").value;
    	var linkNivel = nivel_id_jsp;
      	var linkEntidad = entidad_id_jsp;
      	var linkTipoPrograma = document.getElementById("tipoPrograma-formulario").value;
      	var numeroProgramaIngresado = document.getElementById("programa-formulario").value;

    	var datosProgramas = $.ajax({
        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getProgramas&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPrograma,
          	type:'get',
          	dataType:'json',
          	async:false       
        }).responseText;

        datosProgramas = JSON.parse(datosProgramas);
	    for(var x = 0; x < datosProgramas.programas.length; x++)
    	{
        	if(datosProgramas.programas[x].codigoPrograma === parseInt(numeroProgramaIngresado))
        	{
        		var mostrarNombrePrograma = datosProgramas.programas[x].nombrePrograma;
		        var nt=document.createTextNode(mostrarNombrePrograma);
		        var nparrafo=document.getElementById('f4c2');
		        nparrafo.innerHTML="";
		        nparrafo.appendChild(nt);
		    }
      	}
    } 

    this.subProgramasFocus = function(){
	    //var linkNivel = document.getElementById('nivel-formulario').value;
	    //var linkEntidad = document.getElementById('entidad-formulario').value;
    	var linkNivel = nivel_id_jsp;
      	var linkEntidad = entidad_id_jsp;    	
	    var linkTipoPrograma = document.getElementById("tipoPrograma-formulario").value;
	    var linkPrograma = document.getElementById("programa-formulario").value;

    	var datosSubProgramas = $.ajax({
        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getSubprogramas&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPrograma+'&programa='+linkPrograma,
          	type:'get',
          	dataType:'json',
          	async:false       
        }).responseText;

        datosSubProgramas = JSON.parse(datosSubProgramas);

        var datalistSubProgramas = document.createElement('datalist');
        datalistSubProgramas.setAttribute('id','listaf5c2'); 
        var ubicacionDatalistProgramas = document.getElementById('formulario');
        ubicacionDatalistProgramas.appendChild(datalistSubProgramas);

          for(var i = 0; i < datosSubProgramas.subprogramas.length ; i++) 
          {       
          var option = document.createElement('option');
          option.setAttribute('value', datosSubProgramas.subprogramas[i].id);
          option.setAttribute('label', datosSubProgramas.subprogramas[i].nombre);
          datalistSubProgramas.appendChild(option);     
      } 
    } 
    this.subProgramas = function(){
	    //var linkNivel = document.getElementById('nivel-formulario').value;
	    //var linkEntidad = document.getElementById('entidad-formulario').value;
    	var linkNivel = nivel_id_jsp;
      	var linkEntidad = entidad_id_jsp;
	    var linkTipoPrograma = document.getElementById("tipoPrograma-formulario").value;
	    var linkPrograma = document.getElementById("programa-formulario").value;
	    var numeroSubProgramaIngresado = document.getElementById("subPrograma-formulario").value;

    	var datosSubProgramas = $.ajax({
        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getSubprogramas&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPrograma+'&programa='+linkPrograma,
          	type:'get',
          	dataType:'json',
          	async:false       
        }).responseText;

        datosSubProgramas = JSON.parse(datosSubProgramas);

      	for(var x = 0; x < datosSubProgramas.subprogramas.length; x++)
      	{
        	if(datosSubProgramas.subprogramas[x].id === parseInt(numeroSubProgramaIngresado))
        	{
	        	var mostrarNombrePrograma = datosSubProgramas.subprogramas[x].nombre;
	          	var nt=document.createTextNode(mostrarNombrePrograma);
	          	var nparrafo=document.getElementById('f5c2');
	          	nparrafo.innerHTML="";
	          	nparrafo.appendChild(nt);
	        }
      	}
    } 

    this.proyectoFocus = function(){
	    //var linkNivel = document.getElementById("nivel-formulario").value;
	    //var linkEntidad = document.getElementById("entidad-formulario").value;
    	var linkNivel = nivel_id_jsp;
      	var linkEntidad = entidad_id_jsp;
	    var linkTipoPrograma = document.getElementById("tipoPrograma-formulario").value;
	    var linkPrograma = document.getElementById('programa-formulario').value;
	    var linkSubPrograma = document.getElementById('subPrograma-formulario').value;

    	var datosProyectos = $.ajax({
          url:'http://spr.stp.gov.py/ajaxSelects?accion=getProyectos&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPrograma+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma,
          type:'get',
          dataType:'json',
          async:false       
        }).responseText;

        
        datosProyectos = JSON.parse(datosProyectos);

        var datalistProyectos = document.createElement('datalist');
        datalistProyectos.setAttribute('id','listaf6c2'); 
        var ubicacionDatalistProyectos = document.getElementById('formulario');
        ubicacionDatalistProyectos.appendChild(datalistProyectos);

          for(var i = 0; i < datosProyectos.proyectos.length ; i++) 
          {       
          var option = document.createElement('option');
          option.setAttribute('value', datosProyectos.proyectos[i].codigoProyecto);
          option.setAttribute('label', datosProyectos.proyectos[i].nombreProyecto);
          datalistProyectos.appendChild(option);      
      } 
    }
    this.proyecto = function(){
	    //var linkNivel = document.getElementById("nivel-formulario").value;
	    //var linkEntidad = document.getElementById("entidad-formulario").value;
    	var linkNivel = nivel_id_jsp;
      	var linkEntidad = entidad_id_jsp;
	    var linkTipoPrograma = document.getElementById("tipoPrograma-formulario").value;
	    var linkPrograma = document.getElementById('programa-formulario').value;
	    var linkSubPrograma = document.getElementById('subPrograma-formulario').value;
	    var numeroProyectoIngresado = document.getElementById("proyecto-formulario").value;

    	var datosProyectos = $.ajax({
          url:'http://spr.stp.gov.py/ajaxSelects?accion=getProyectos&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPrograma+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma,
          type:'get',
          dataType:'json',
          async:false  
        }).responseText;

        datosProyectos = JSON.parse(datosProyectos);

	    for(var x = 0; x < datosProyectos.proyectos.length; x++)
      	{
        	if(datosProyectos.proyectos[x].codigoProyecto === parseInt(numeroProyectoIngresado))
        	{
        		var mostrarNombreProyecto = datosProyectos.proyectos[x].nombreProyecto;
          		var nt=document.createTextNode(mostrarNombreProyecto);
          		var nparrafo=document.getElementById('f6c2');
          		nparrafo.innerHTML="";
          		nparrafo.appendChild(nt);
        	}
      	}
    }

    this.dibujar = function(){
     	//var linkNivel = document.getElementById("nivel-formulario").value;
      	//var linkEntidad = document.getElementById("entidad-formulario").value;
    	var linkNivel = nivel_id_jsp;
      	var linkEntidad = entidad_id_jsp;
      	var linkTipoPresupuesto = document.getElementById("tipoPrograma-formulario").value;
      	var linkPrograma = document.getElementById("programa-formulario").value;
      	var linkSubPrograma = document.getElementById("subPrograma-formulario").value;
      	var linkProyecto = document.getElementById("proyecto-formulario").value;
      	var anho=2015;
      //crear nuevo producto
    	$("#anho-crear-producto").attr("value",2015);
    	$("#nivel-crear-producto").attr("value",linkNivel);
    	$("#entidad-crear-producto").attr("value",linkEntidad);
    	$("#tipo-crear-producto").attr("value",linkTipoPresupuesto);
    	$("#programa-crear-producto").attr("value",linkPrograma);
    	$("#subprograma-crear-producto").attr("value",linkSubPrograma);
    	$("#proyecto-crear-producto").attr("value",linkProyecto);
    	$("#crear-producto").toggle();
    	
    	var optionProducto="";
    	var productos = $.ajax({
	    	url:'http://spr.stp.gov.py/ajaxSelects?accion=getProductos',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
    	productos = JSON.parse(productos);
    	productos = productos.productos;
		for(i = 0;i<productos.length; i++){
			optionProducto+='<option value="'+productos[i].codigoCatalogo+'">'+productos[i].codigoCatalogo+") "+productos[i].nombreCatalogo+'</option>';
		}
		
		$("#producto_id-crear-producto").append(optionProducto);
		
		var optionTiposDestinatarios="";
    	var  tiposDestinatarios= $.ajax({
	    	url:'http://spr.stp.gov.py/ajaxSelects?accion=getTiposDestinatarios',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
    	tiposDestinatarios = JSON.parse(tiposDestinatarios);
    	tiposDestinatarios = tiposDestinatarios.tiposDestinatarios;
		for(i = 0;i<tiposDestinatarios.length; i++){
			optionTiposDestinatarios+='<option value="'+tiposDestinatarios[i].id+'">'+tiposDestinatarios[i].nombre+'</option>';
		}
		//$("#producto_id-crear-producto").append(optionProducto);
		
		

     	var datosMeses = $.ajax({
          url:'http://spr.stp.gov.py/ajaxSelects?accion=getMeses',
          type:'get',
          dataType:'json',
          async:false       
        }).responseText;
        datosMeses = JSON.parse(datosMeses);

        var datosDepartamentos = $.ajax({
          url:'http://spr.stp.gov.py/ajaxSelects?accion=getDepartamentos',
          type:'get',
          dataType:'json',
          async:false       
        }).responseText;
        datosDepartamentos = JSON.parse(datosDepartamentos);


      var datosProductos = $.ajax({
          url:'http://spr.stp.gov.py/ajaxSelects?accion=getProductosPresupuesto&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPresupuesto+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma+'&proyecto='+linkProyecto,
          type:'get',
          dataType:'json',
          async:false       
        }).responseText;
        datosProductos = JSON.parse(datosProductos);

        for(var i = 0; i < datosProductos.producto.length ; i++) 
        {       
                   
       		var contenedorDeProducto = document.createElement('div');
       		contenedorDeProducto.setAttribute('nivel',linkNivel);
   			contenedorDeProducto.setAttribute('entidad',linkEntidad);
			contenedorDeProducto.setAttribute('tipoPresupuesto',linkTipoPresupuesto);
			contenedorDeProducto.setAttribute('programa',linkPrograma);
			contenedorDeProducto.setAttribute('subprograma',linkSubPrograma);
			contenedorDeProducto.setAttribute('proyecto',linkProyecto);
			contenedorDeProducto.setAttribute('id',"producto-"+datosProductos.producto[i].id);
			contenedorDeProducto.setAttribute('producto',datosProductos.producto[i].id);
			contenedorDeProducto.setAttribute('class',"col-md-12");


			var producto = datosProductos.producto[i].id
			var cajaProducto=' <!-- PRODUCTO -->'+
		                  '<div class="box box-warning direct-chat direct-chat-warning">'+
		                  '<form class="form-horizontal" id="form-producto-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'" >'+
		                  	'<input type="hidden" name="accion" value="updateProductoMeta">'+
		                  	''+
		                    '<div class="box-header with-border">'+
		                      '<h3 class="box-title">  Nombre Producto</h3>'+
		                      '<div class="box-tools pull-right">'+
		                       '     <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>'+
		                      '</div>'+
		                    '</div><!-- /.box-header -->'+
		                    '<div class="box-body" style="display:block;">'+
		                      '<table class="table table-striped table-bordered  table-hover">'+
		                     ' 	<tr>'+
		                      '		<th>Depto</th>'+
		                      '		<th>Ene</th>'+
		                      '		<th>Feb</th>'+
		                      '		<th>Mar</th>'+
		                      '		<th>Abr</th>'+
		                      '		<th>May</th>'+
		                      '		<th>Jun</th>'+
		                      '		<th>Jul</th>'+
		                      '		<th>Ago</th>'+
		                      '		<th>Set</th>'+
		                      '		<th>Oct</th>'+
		                      '		<th>Nov</th>'+
		                      '		<th>Dic</th>'+
		                      '		<th>Tot</th>'+
		                    //  '		<th>Accion</th>'+
		                      '	</tr>'+
		                      '<tbody class="table-body-producto" producto='+producto+'>'+
		                      '</tbody>'+
		                      '</table>'+
		                      '<br>'+
		                    '</div>'+
		                    '<div class="box-footer">'+
		                    '<div class="form-group">'+
		                    	'<input style="float:right;margin-left:50px" type="text" name="anho3" id="anho3-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'"'+' placeholder="Total para 2018">'+
		                    	'<input style="float:right;margin-left:50px" type="text" name="anho2" id="anho2-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'"'+' placeholder="Total para 2017">'+
		                    '</div>'+
		                    '<div class="form-group">'+
	                    		'<button type="submit" style="margin-right:50px" class="btn btn-primary" id="guardar-producto-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'" >Guardar</button>'+
	                    	'</div>'+	
		                    '<div class="form-group">'+
		                    	'<label style="float:left;margin-right:50px">Desagregacion de Destinatarios según:  </label><select style="float:left;margin-right:50px" name="tipo_destinatario" id="tipo_destinatario-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'"'+'>'+optionTiposDestinatarios+'</select>'+
		                    	'<button class="btn btn-warning" data-toggle="modal" data-target="#destinatario-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'" id="asignar-destinatario-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'" owner="" >Asignar Destinatario</button>'+
		                    '</div>'+
		                   '</div>'+
		                   '<input type="hidden" name="unidad_medida_id" value="" id="unidad_medida-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'">'+
		                  '</form></div>';
		    contenedorDeProducto.innerHTML=cajaProducto;
		    
		    


          	
    		var codigoProducto = datosProductos.producto[i].id;
		    var productos = $.ajax({
		        url:'http://spr.stp.gov.py/ajaxSelects?accion=getProductos&producto='+codigoProducto,
		        type:'get',
		        dataType:'json',
		        async:false       
		    }).responseText;
        	productos = JSON.parse(productos);
        	
		    var productos2 = $.ajax({
		        url:'http://spr.stp.gov.py/ajaxSelects?accion=getProductos',
		        type:'get',
		        dataType:'json',
		        async:false       
		    }).responseText;
        	productos2 = JSON.parse(productos2);
        	//var mostrarTituloProducto = codigoProducto+") "+productos.productos[0].nombreCatalogo;
      		//var nt=document.createTextNode(mostrarTituloProducto);
      		var linkProducto = datosProductos.producto[i].id;
      		//$('div [nivel="'+linkNivel+'"][entidad="'+linkEntidad+'"][tipopresupuesto="'+linkTipoPresupuesto+'"][programa="'+linkPrograma+'"][subprograma="'+linkSubPrograma+'"][proyecto="'+linkProyecto+'"][id="producto-'+linkProducto+'"]').find('h3').html(nt);
      		

        	var codigoUnidadMedida = datosProductos.producto[i].unidad_medida_id;
		    var unidadMedida = $.ajax({
		        url:'http://spr.stp.gov.py/ajaxSelects?accion=getUnidadesMedida&unidadMedida='+codigoUnidadMedida,
		        type:'get',
		        dataType:'json',
		        async:false       
		    }).responseText;
        	unidadMedida = JSON.parse(unidadMedida);
        	var unidadMedida=unidadMedida.unidadesMedida[0];
        	

////////////generar tabla de mentas
        	var depto =0;
		    var deptoN ="";
		    var filaProduct="";
		    var mes=0;
		    var mesN="";
		    var mPDeptoMes="0.0";
		    var metaProducto = $.ajax({
		        url:'ajaxSelects?accion=getProductosPresupuestoMeta&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPresupuesto+'&programa='+linkPrograma+'&subprograma='+linkSubPrograma+'&proyecto='+linkProyecto+'&producto='+linkProducto,
		        type:'get',
		        dataType:'json',
		        async:false       
		    }).responseText;
		    metaProducto = JSON.parse(metaProducto);
		    metaProducto=metaProducto.productoPresupuestoMeta;
		    metaProducto.getCantidadPorMesDepto = function( mesB, deptoB ) {
		    	var depto;
		        for( var mes in this ) {
		            if( this.hasOwnProperty( mes ) ) {
		            	depto=this[mes][ 'departamento' ];
		                 if( this[mes][ 'mes' ] == mesB && this[mes][ 'departamento' ] == deptoB)
		                     return  this[mes][ 'cantidad' ];
		            }
		        }
		    }
		    metaProducto.getMaxDepto = function(deptoB ) {
		    	var depto;
		    	var max =0;
		        for( var mes in this ) {
		            if( this.hasOwnProperty( mes ) ) {
		            	depto=this[mes][ 'departamento' ];
		                 if(this[mes][ 'departamento' ] == deptoB)
		                     if (this[mes][ 'cantidad' ]>max) max =this[mes][ 'cantidad' ];
		            }
		        }
		        return max;
		    }
		    var cant=0.0;
		    var sumaMes=[0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0];
		    var max= 0.0;
		    var sumaTotal=0.0;
			for(var j = 0; j < datosDepartamentos.departamentos.length; j++  )
			{
				var suma=0.0;
				var max=.00;
				depto = datosDepartamentos.departamentos[j].deptoPais;
				deptoN = datosDepartamentos.departamentos[j].abrevDepartamento;
				filaProduct+="<tr departamento=\""+depto+"\"><td>"+deptoN+"</td>";
				for (var k = 0; k < datosMeses.meses.length; k++)
				{	
					mes = datosMeses.meses[k].id;
					var flag=0;
					
					cant = metaProducto.getCantidadPorMesDepto(mes,depto);
					if (cant>0){
						filaProduct+='<td><input type="text"  class= "cantidad-depto-mes" size="5px" name="cantidad-'+linkProducto+'-'+depto+'-'+mes+'" id="cantidad-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-'+depto+'-'+mes+'" value="'+cant+'"></td>';
						flag=1;
						suma += cant;
						sumaMes[mes]+=cant;
						sumaTotal+=cant;
						
					}
						
					if (flag==0) 
						filaProduct+='<td><input type="text" class= "cantidad-depto-mes" size="5px" name="cantidad-'+linkProducto+'-'+depto+'-'+mes+'" id="cantidad-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-'+depto+'-'+mes+'" value=""></td>';				    
				}
				for(var z = 0; z < productos2.productos.length; z++)
			    {
					if(productos2.productos[z].codigoCatalogo == parseInt(producto) && productos2.productos[z].clase == "C")
					{
						filaProduct+='<td id="suma-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-'+depto+'" suma="">'+metaProducto.getMaxDepto(depto).round(2)+'</td></tr>';
					}else{
						if(productos2.productos[z].codigoCatalogo == parseInt(producto) && productos2.productos[z].clase == "N"){
							filaProduct+='<td id="suma-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-'+depto+'" suma="">'+suma.round(2)+'</td></tr>';	
						}
						
					}
			    }
				
			   
			}
			
		
			
		    var destinatarioModal="";
		    destinatarioModal+='<div class="modal fade" id="destinatario-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'+
		  '<div class="modal-dialog">'+
		    '<div class="modal-content">'+
		      '<div class="modal-header">'+
		      '</div>'+
		      '<div class="modal-body">';
			//formulario de nuevo resultado
		    destinatarioModal+=
		        '  <div class="box" height="1000px" style="overflow-y: initial !important;overflow-x: initial !important">'+
		         '   <div class="box-header with-border" height="1000px">'+
		          '    <h3 class="box-title" id="tituloTipoPrograma">'+
		           '     Destinatarios'+
		            '  </h3>'+
		              '</div>'+
		            '</div>'+
		            
		            '<div class="box-body scroll-y scroll-x" >'+
		              '<ul  class="col-md-12">'+
		              '<form id="form-guardar-destinatario-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'">'+
                      '<table class="table table-striped table-bordered  table-hover">'+
	                     ' 	<tr>'+
                      '<th>Destinatario</th>';
		    				for (var iDep=0;iDep<20;iDep++){
		    					destinatarioModal+= '<th>'+datosDepartamentos.departamentos[iDep].abrevDepartamento+'</th>';
		    				}
		    				
		    				
		    				destinatarioModal+='	</tr>'+
	                      '<tbody class="table-body-producto-destinatario" id="tabla-destinatarios-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'">'+
	                      '</tbody>'+
	                      '</table>'+
	                      '<br>'+
		                    '<div class="box-footer">'+
		                    	'<button type="submit" class="btn btn-warning" id="guardar-destinatarios-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'">Guardar</button>'+
		                    '</div>'+
						'</form>'+
					'</ul>'+
				'</div>'+
		'</div>';
			var nparrafo=document.getElementById('row-body-programacionfisica');
          	nparrafo.appendChild(contenedorDeProducto);
          	//destinatarioModal+=filaProduct;
          	$('.content-wrapper').append(destinatarioModal);

          	$("#producto-"+linkProducto).find('h3').html(codigoProducto+") "+productos.productos[0].nombreCatalogo );
        	$("#producto-"+linkProducto).find('h3').append(" ("+unidadMedida.nombre+")"+" TIPO: "+productos.productos[0].clase);
        	$('#unidad_medida-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto).attr("value",unidadMedida.codigoUnidadMedida);
			filaProduct+=
			'<tr>'+
				'<td>Total Mes</td>'+
				'<td id="sumaMes-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-1">'+parseFloat(sumaMes[1]).round(2)+'</td>'+
				'<td id="sumaMes-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-2">'+parseFloat(sumaMes[2]).round(2)+'</td>'+
				'<td id="sumaMes-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-3">'+parseFloat(sumaMes[3]).round(2)+'</td>'+
				'<td id="sumaMes-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-4">'+parseFloat(sumaMes[4]).round(2)+'</td>'+
				'<td id="sumaMes-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-5">'+parseFloat(sumaMes[5]).round(2)+'</td>'+
				'<td id="sumaMes-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-6">'+parseFloat(sumaMes[6]).round(2)+'</td>'+
				'<td id="sumaMes-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-7">'+parseFloat(sumaMes[7]).round(2)+'</td>'+
				'<td id="sumaMes-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-8">'+parseFloat(sumaMes[8]).round(2)+'</td>'+
				'<td id="sumaMes-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-9">'+parseFloat(sumaMes[9]).round(2)+'</td>'+
				'<td id="sumaMes-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-10">'+parseFloat(sumaMes[10]).round(2)+'</td>'+
				'<td id="sumaMes-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-11">'+parseFloat(sumaMes[11]).round(2)+'</td>'+
				'<td id="sumaMes-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-12">'+parseFloat(sumaMes[12]).round(2)+'</td>';
			for(var z = 0; z < productos2.productos.length; z++)
		    {
				if(productos2.productos[z].codigoCatalogo == parseInt(linkProducto) && productos2.productos[z].clase == "C")
				{
					filaProduct+='<td id="sumaMes-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-13"></td>';
				}else{
					if(productos2.productos[z].codigoCatalogo == parseInt(linkProducto) && productos2.productos[z].clase == "N"){
						filaProduct+='<td id="sumaMes-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-13">'+sumaTotal.round(2)+'</td>';	
					}
					
				}
		    }
			
			filaProduct+='</tr>';
				
			$("div [nivel='"+linkNivel+"'][entidad='"+linkEntidad+"'][tipopresupuesto='"+linkTipoPresupuesto+"'][programa='"+linkPrograma+"'][subprograma='"+linkSubPrograma+"'][proyecto='"+linkProyecto+"'][id='producto-"+datosProductos.producto[i].id+"']").find("[producto="+datosProductos.producto[i].id+"]").html(filaProduct);

			$('#anho2'+'-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto).val(metaProducto[240].cantidad);
			$('#anho3'+'-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto).val(metaProducto[241].cantidad);
		}
            
        
    }
    $( ".cantidad-depto-mes" ).each(function() {
	 	$(this).change();
	 });
  }
  
  var eje1 = new Combo();
  document.getElementById('nivel-formulario').addEventListener('focus',eje1.nivelFocus,false);
  document.getElementById('nivel-formulario').addEventListener('change',eje1.nivel,false);
  document.getElementById('entidad-formulario').addEventListener('focus',eje1.entidadFocus,false);
  document.getElementById('entidad-formulario').addEventListener('change',eje1.entidad,false);
  document.getElementById('tipoPrograma-formulario').addEventListener('focus',eje1.tipoProgramaFocus,false); 
  document.getElementById('tipoPrograma-formulario').addEventListener('change',eje1.tipoPrograma,false);
  document.getElementById('programa-formulario').addEventListener('focus',eje1.programasFocus,false); 
  document.getElementById('programa-formulario').addEventListener('change',eje1.programas,false); 
  document.getElementById('subPrograma-formulario').addEventListener('focus',eje1.subProgramasFocus,false); 
  document.getElementById('subPrograma-formulario').addEventListener('change',eje1.subProgramas,false);  
  document.getElementById('proyecto-formulario').addEventListener('focus',eje1.proyectoFocus,false); 
  document.getElementById('proyecto-formulario').addEventListener('change',eje1.proyecto,false);
  
  document.getElementById('proyecto-formulario').addEventListener('change',eje1.dibujar,false);

$( document ).ready(function() {
	//cargar producto
	/*
	$("nivel-formulario").val(nivel_id);
	$("nivel-formulario").change();
	$("entidad-formulario").val(entidad_id);
	$("entidad-formulario").change();
	*/
	
	$("body").on("change", "#producto_id-crear-producto",function(event){
		var productos = $.ajax({
	    	url:'http://spr.stp.gov.py/ajaxSelects?accion=getProductos&producto='+$("#producto_id-crear-producto").val(),
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
    	productos = JSON.parse(productos);
    	productos = productos.productos;
    	
		var unidadesMedida = $.ajax({
			url:'http://spr.stp.gov.py/ajaxSelects?accion=getUnidadesMedida&unidadMedida='+productos[0].codUnidadMedida,
		  	type:'get',
		  	dataType:'json',
		  	async:false       
		}).responseText;
		unidadesMedida = JSON.parse(unidadesMedida);
		unidadesMedida = unidadesMedida.unidadesMedida;
		$("#producto_unidad_medida_id-crear-producto").val(unidadesMedida[0].codigoUnidadMedida);
		$("#producto_unidad_medida_nombre-crear-producto").val(unidadesMedida[0].nombre);
		$("#producto_unidad_medida_nombre-crear-producto").attr("disabled","");
		$("#producto_clase-crear-producto").attr("disabled","");
		event.stopPropagation();
	});
	$("body").on("click", "#crear-producto-boton",function(event){
		var productoPresupuesto= new Object();
		var accion = "insProductoPresupuesto";
		productoPresupuesto.anho=$("#anho-crear-producto").val();
		productoPresupuesto.nivel_id=$("#nivel-crear-producto").val();
		productoPresupuesto.entidad_id=$("#entidad-crear-producto").val();
		productoPresupuesto.tipo_presupuesto_id=$("#tipo-crear-producto").val();
		productoPresupuesto.programa_id=$("#programa-crear-producto").val();
		productoPresupuesto.subprograma_id=$("#subprograma-crear-producto").val();
		productoPresupuesto.proyecto_id=$("#proyecto-crear-producto").val();
		productoPresupuesto.id=$("#producto_id-crear-producto").val();
		productoPresupuesto.producto_id=$("#producto_id-crear-producto").val();
		productoPresupuesto.unidad_medida_id=$("#producto_unidad_medida_id-crear-producto").val();		
		 $.ajax({
		        url: "ajaxInserts?accion="+accion,
		        type: 'POST',
		        dataType: 'json',
		        data: JSON.stringify(productoPresupuesto),
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        success: function (data) {alert("Guardado!"); $("#row-body-programacionfisica").html("");eje1.dibujar();$("#crear-producto").toggle();},
		        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
		        error: function(data,status,er) {alert("Producto Guardado");$("#row-body-programacionfisica").html("");eje1.dibujar();$("#crear-producto").toggle();}
		 });
		
		
		event.stopPropagation();
	});
	
	$("body").on("submit", "#formulario-crear-producto",function(event){
		 event.preventDefault();
		 return false;
	});
	
	
	
	
//edicion de producto meta
	
	$("body").on("change", ".cantidad-depto-mes",function(event){
		$(this).val($(this).val().replace(",","."));
	      var id = $(this).attr("id");
	      var idParsed = id.split("-");
	      var nivel=idParsed[1];
	      var entidad=idParsed[2];
	      var tipo=idParsed[3];
	      var programa=idParsed[4];
	      var subprograma=idParsed[5];
	      var proyecto=idParsed[6];
	      var producto=idParsed[7];
	      var departamento=idParsed[8];
	      var mes=idParsed[9];
	      var datos;
	      var suma =parseFloat(0);
	      var sumaMes =parseFloat(0);
	      var sumaTotal =parseFloat(0);
	      var mayor=parseFloat(0);
	      var productos = $.ajax({
		    	url:'http://spr.stp.gov.py/ajaxSelects?accion=getProductos',
		      	type:'get',
		      	dataType:'json',
		      	async:false       
		    }).responseText;
	    	productos = JSON.parse(productos);
	    	productos = productos.productos;
           
	      $("#suma-"+id).html("");
	     
	     //En este if comprueba si el producto tiene como valor "N" en su clase si es N suma de lo contrario no suma nada
	      for (var k = 0; k <productos.length; k++)
	      {
		    if(productos[k].codigoCatalogo == parseInt(producto) && productos[k].clase == "N")
		     {
		    	 //suma= parseInt($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+departamento+"-1").val());
		    	 for (var i=0;i<13;i++)
			     {
		    		 if ($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+departamento+"-"+i).val()>0)
			    	 {
		    			 //suma= parseInt($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+departamento+"-"+i).val());
		    			// if(suma < parseInt($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+departamento+"-"+i).val()))
		    			 //{
		    				 suma += parseFloat($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+departamento+"-"+i).val());
		    			// }
			    	 }
			      }
		    	 $("#suma-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+departamento).html(suma.round(2));
		         
		    	 for (var x=0;x<19;x++){
		    		 if ($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+x+"-"+mes).val()>0)
		    			 sumaMes+= parseFloat($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+x+"-"+mes).val());
			      }
		    	 
		    	  if ($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+88+"-"+mes).val()>0)
			    	   sumaMes+= parseFloat($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+88+"-"+mes).val());
			      if ($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+99+"-"+mes).val()>0)
			    	   sumaMes+= parseFloat($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+99+"-"+mes).val());
			      
		    	 
		      }
		    if(productos[k].codigoCatalogo == parseInt(producto) && productos[k].clase == "C")
		     {
		    	 //suma= parseInt($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+departamento+"-1").val());
		    	 var max=0;
		    	 for (var i=0;i<13;i++)
			     {	
		    		
		    		 if ($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+departamento+"-"+i).val()>0)
			    	 {
		    			 //suma= parseInt($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+departamento+"-"+i).val());
		    			// if(suma < parseInt($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+departamento+"-"+i).val()))
		    			 //{
		    				 if (max < parseFloat($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+departamento+"-"+i).val()))
		    					 	max =parseFloat($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+departamento+"-"+i).val());
		    			// }
			    	 }
			      }
		    	 $("#suma-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+departamento).html(max.round(2));
		         
		    	 for (var x=0;x<19;x++){
		    		 if ($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+x+"-"+mes).val()>0)
		    			 sumaMes+= parseFloat($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+x+"-"+mes).val()).round(2);
			      }
		    	 
		    	  if ($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+88+"-"+mes).val()>0)
			    	   sumaMes+= parseFloat($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+88+"-"+mes).val()).round(2);
			      if ($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+99+"-"+mes).val()>0)
			    	   sumaMes+= parseFloat($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+99+"-"+mes).val()).round(2);
			      
		    	 
		      }
	      }
	    
	     
	     /* if (parseInt($("#sumaMes-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+88).text())>0)
	    	   sumaTotal+= parseInt($("#sumaMes-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+88).text());
	      if (parseInt($("#sumaMes-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+99).text())>0)
	    	   sumaTotal+= parseInt($("#sumaMes-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+99).text());
	      */
	      
	        
	      $("#sumaMes-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+mes).html(sumaMes.round(2));
	      
	      //sumaTotal = parseInt($("#sumaMes-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-1').text());
	      for (var i=0;i<13;i++)
	      {
	    	  if (parseFloat($("#sumaMes-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+i).text())>0)
	    	  {
	    		  //sumaTotal+= parseInt($("#sumaMes-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+i).text());
	    		 // if(sumaTotal < parseInt($("#sumaMes-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+i).text()))
	    		//  {
	    			  sumaTotal += parseFloat($("#sumaMes-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+i).text());
	    		//  }
	    	  }
		  }
	      if(productos[k].codigoCatalogo == parseInt(producto) && productos[k].clase == "N")
		     {
	    	  	$("#sumaMes-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-13').html(sumaTotal.round(2));
		     }
	    });
	
	$("body").on("click", ".btn-primary",function(event){
		
	      var id = $(this).attr("id");
	      var idParsed = id.split("-");
	      var nivel=idParsed[2];
	      var entidad=idParsed[3];
	      var tipo=idParsed[4];
	      var programa=idParsed[5];
	      var subprograma=idParsed[6];
	      var proyecto=idParsed[7];
	      var producto=idParsed[8];
	      var accion=idParsed[0];
	      var elemento=idParsed[1];
	      var formulario="#form-producto-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto;
	      
	      if (accion==="guardar" && elemento==="producto"){
	    	  var metas= new Object();
	    	  metas.nivel_id=nivel;
	    	  metas.catalogo_destianatario_id="1";
	    	  metas.entidad_id=entidad;
	    	  metas.tipo_presupuesto_id=tipo;
	    	  metas.programa_id=programa;
	    	  metas.subprograma_id=subprograma;
	    	  metas.proyecto_id=proyecto;
	    	  metas.producto_id=producto;
	    	  metas.unidad_medida_id="";
	    	  metas.unidad_medida_id=$("#unidad_medida-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto).val();
	    	  metas.cantidades= new Array(); //tiene los meses
	    	  var detalleMes = new Array(); //tiene los departamentos
	    	  var frm = $(formulario);
	    	  
	    	  for (var iDepto=0;iDepto<19;iDepto++){
	    		  detalleMes=new Array();
	    		  for (var iMes=1;iMes<13;iMes++){
	    			  var inputVal= "input[name='cantidad-"+producto+"-"+iDepto+"-"+iMes+"']";
	    			  detalleMes[iMes]=$(formulario).find(inputVal).val();
	    			  if (detalleMes[iMes]=="") detalleMes[iMes]=0;
	    			  
	    		  }
	    		  metas.cantidades[iDepto]=detalleMes;
	    	  }
	    	  
	    	  for (var iMes=1;iMes<13;iMes++){
    			  var inputVal= "input[name='cantidad-"+producto+"-88-"+iMes+"']";
    			  detalleMes[iMes]=$(formulario).find(inputVal).val();
    			  if (detalleMes[iMes]=="") detalleMes[iMes]=0;
    			  
    		  }
	    	  metas.cantidades[19]=detalleMes;
	    	  var detalleMes2 = new Array(); //tiene los departamentos
	    	  for (var iMes=1;iMes<13;iMes++){
    			  var inputVal= "input[name='cantidad-"+producto+"-99-"+iMes+"']";
    			  detalleMes2[iMes]=$(formulario).find(inputVal).val();
    			  if (detalleMes2[iMes]=="") detalleMes2[iMes]=0;
    			  
    		  }
	    	  metas.cantidades[20]=detalleMes2;
	    	  
	    	   metas.tipoDestinatario=$(formulario).find('select[name="tipo_destinatario"]  option:selected').val();
	    	   metas.anho2 = $(formulario).find('input[name="anho2"]').val();
	    	   if ( metas.anho2=="")  metas.anho2=0;
	    	   metas.anho3 = $(formulario).find('input[name="anho3"]').val();
	    	   if ( metas.anho3=="")  metas.anho3=0;
		      // var dat = JSON.stringify(frm.serializeArray());
	
		       //alert("Prueba de guardado de productos:\n\n" + metas);
		       var dat = JSON.stringify(metas);
		       $.ajax({
			        url: "ajaxUpdate?accion=actProductoPresupuestoDetalle",
			        type: 'POST',
			        dataType: 'json',
			        data: dat,
			        contentType: 'application/json',
			        mimeType: 'application/json',
			        success: function (data) {alert("Guardado!");},
			        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
			        error: function(data,status,er) {alert("Guardado");}
			 });
		       event.stopPropagation();
				 event.preventDefault();
				 return false;
	      }
	      
	     
	    });
	
	$("body").on("click", ".btn-warning",function(event){
		
	      var id = $(this).attr("id");
	      var idParsed = id.split("-");
	      var nivel=idParsed[2];
	      var entidad=idParsed[3];
	      var tipo=idParsed[4];
	      var programa=idParsed[5];
	      var subprograma=idParsed[6];
	      var proyecto=idParsed[7];
	      var producto=idParsed[8];
	      var accion=idParsed[0];
	      var elemento=idParsed[1];
	      
	      
	      if (accion==="asignar" && elemento==="destinatario"){
	    	  
	    	  var formulario="#form-producto-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto;
		      var tabla='#tabla-destinatarios-'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto;
		      var tipoDestinatario=$(formulario).find('select[name="tipo_destinatario"]  option:selected').val();
		      $(tabla).html("");
              
				var destinatarios = $.ajax({
					url:'http://spr.stp.gov.py/ajaxSelects?accion=getDestinatarios&tipoDestinatario='+tipoDestinatario,
				  	type:'get',
				  	dataType:'json',
				  	async:false       
				}).responseText;
				destinatarios = JSON.parse(destinatarios);
				destinatarios = destinatarios.destinatarios;
				var productoDestinatarios = new Array(); 
				for (iDest = 0 ; iDest< destinatarios.length;iDest++){
					var productoDestinatariosTemp = $.ajax({
						url:'http://spr.stp.gov.py/ajaxSelects?accion=getProductoDestinatario&nivel='+nivel+'&entidad='+entidad+'&tipoPresupuesto='+tipo+'&programa='+programa+'&subprograma='+subprograma+'&proyecto='+proyecto+'&producto='+producto+'&catalogoDestinatario='+destinatarios[iDest].id,
					  	type:'get',
					  	dataType:'json',
					  	async:false       
					}).responseText;
					productoDestinatariosTemp = JSON.parse(productoDestinatariosTemp);
					productoDestinatariosTemp = productoDestinatariosTemp.productoDestinatarios;
					productoDestinatarios[iDest] = productoDestinatariosTemp;
				}
				
				
				
				//falta el select para traer los ya guardados
				
	    	  var cuerpoTablaDestinatario="";
	    	  var destinatarioGrupo= new Array(); //tiene los meses
	    	  var destinatarioDepto = new Array(); //tiene los departamentos
	    	  var frm = $(formulario);
	    	  for (var iDest=0;iDest<destinatarios.length;iDest++){
	    		  cuerpoTablaDestinatario+="<tr><td>"+destinatarios[iDest].nombre+"</td>";
	    		  detalleMes=new Array();
		    	  if (productoDestinatarios[iDest].length>0){  
		    		  for (var iDepto=0;iDepto<18;iDepto++){
		    			  cuerpoTablaDestinatario+='<td><input type="text" class= "destinatario-dest-dept" size="5px" name="destinatarios-'+producto+'-'+iDest+'-'+iDepto+'" id="dest-'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+iDest+'-'+iDepto+'" value="'+productoDestinatarios[iDest][iDepto].cantidad+'"></td>';
		    			  
		    		  }
		    		  iDepto=88; cuerpoTablaDestinatario+='<td><input type="text" class= "destinatario-dest-dept" size="5px" name="destinatarios-'+producto+'-'+iDest+'-'+iDepto+'" id="dest-'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+iDest+'-'+iDepto+'" value="'+productoDestinatarios[iDest][18].cantidad+'"></td>';
		    		  iDepto=99; cuerpoTablaDestinatario+='<td><input type="text" class= "destinatario-dest-dept" size="5px" name="destinatarios-'+producto+'-'+iDest+'-'+iDepto+'" id="dest-'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+iDest+'-'+iDepto+'" value="'+productoDestinatarios[iDest][19].cantidad+'"></td>';
		    	  }else{
		    		  for (var iDepto=0;iDepto<18;iDepto++){
		    			  cuerpoTablaDestinatario+='<td><input type="text" class= "destinatario-dest-dept" size="5px" name="destinatarios-'+producto+'-'+iDest+'-'+iDepto+'" id="dest-'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+iDest+'-'+iDepto+'" value=""></td>';
		    			  
		    		  }
		    		  iDepto=88; cuerpoTablaDestinatario+='<td><input type="text" class= "destinatario-dest-dept" size="5px" name="destinatarios-'+producto+'-'+iDest+'-'+iDepto+'" id="dest-'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+iDest+'-'+iDepto+'" value=""></td>';
		    		  iDepto=99; cuerpoTablaDestinatario+='<td><input type="text" class= "destinatario-dest-dept" size="5px" name="destinatarios-'+producto+'-'+iDest+'-'+iDepto+'" id="dest-'+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+iDest+'-'+iDepto+'" value=""></td>';
		    	  }
	    		  cuerpoTablaDestinatario+='<input type="hidden" name="catalogo_destinatario[]" value="'+destinatarios[iDest].id+'">'
	    		  cuerpoTablaDestinatario+='</tr>';
	    		  
	    	  }
	    	  $(tabla).append(cuerpoTablaDestinatario);
	      }
	      
	      if (accion==="guardar" && elemento==="destinatarios"){
	    	  var i=0;
	    	  var formulario="#form-guardar-destinatario-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto;
	    	  var destinatarios = new Object();
	    	  destinatarios.nivel=nivel;
	    	  destinatarios.entidad=entidad;
	    	  destinatarios.tipo_presupuesto=tipo;
	    	  destinatarios.programa=programa;
	    	  destinatarios.subprograma=subprograma;
	    	  destinatarios.proyecto=proyecto;
	    	  destinatarios.producto=producto;
	    	  destinatarios.departamento=99;
	    	  destinatarios.catalogo_destinatario= new Array();
	    	  destinatarios.cantidades=new Array();
	    	  $(formulario).find('input[name="catalogo_destinatario[]"]').each(function() {
	    		  destinatarios.catalogo_destinatario[i]=$(this).val();
	    		  i++;
	    		});
	    	  for(var j=0;j<destinatarios.catalogo_destinatario.length;j++){
	    		  destinatarios.cantidades[j]=new Array();
	    	  }
	    	  
	    	  $(formulario).find('.destinatario-dest-dept').each(function() {
	    		 var celId= $(this).attr("id");
	    		 var celIdParsed = celId.split("-");
	    		 destinatarios.cantidades[celIdParsed[8]][celIdParsed[9]]= $(this).val();
	    		 
	    	  });
	    	  
	    	  var dat = JSON.stringify(destinatarios);
		       $.ajax({
			        url: "ajaxUpdate?accion=actProductoDestinatarios",
			        type: 'POST',
			        dataType: 'json',
			        data: dat,
			        contentType: 'application/json',
			        mimeType: 'application/json',
			        success: function (data) {alert("Guardado!");},
			        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
			        error: function(data,status,er) {alert("Guardado");}
			 });
	      }
	      
	     
	    });
	
	$("body").on("submit", "form",function(event){
		event.stopPropagation();
		 event.preventDefault();
		 return false;
	});
	
//	document ready 
//	  for each $(.cantidad-depto-mes)
//		this.change();

	
});

  
 
