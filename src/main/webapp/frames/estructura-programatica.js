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
    	var rutaNivel = document.getElementById('nivel-formulario').value;
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
      	var linkEntidad = document.getElementById('nivel-formulario').value;

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
    	var linkEntidad = document.getElementById('nivel-formulario').value;
      	var rutaEntidad2 = document.getElementById('entidad-formulario').value;

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
      	var linkNivel = document.getElementById('nivel-formulario').value;
      	var linkEntidad = document.getElementById("entidad-formulario").value;
      	var linkTipoPrograma = document.getElementById("tipoPrograma-formulario").value;

    	var datosProgramas = $.ajax({
        	url:'http://spr.stp.gov.py/ajaxSelects?accion=getProgramas&nivel='+linkNivel+'&entidad='+linkEntidad+'&tipoPresupuesto='+linkTipoPrograma,
          	type:'get',
          	dataType:'json',
          	async:false       
        }).responseText;
        
        datosProgramas = JSON.parse(datosProgramas);

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
      	var linkNivel = document.getElementById('nivel-formulario').value;
      	var linkEntidad = document.getElementById("entidad-formulario").value;
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
	    var linkNivel = document.getElementById('nivel-formulario').value;
	    var linkEntidad = document.getElementById('entidad-formulario').value;
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
          option.setAttribute('value', datosSubProgramas.subprogramas[i].codigoSubprograma);
          option.setAttribute('label', datosSubProgramas.subprogramas[i].nombreSubprograma);
          datalistSubProgramas.appendChild(option);     
      } 
    } 
    this.subProgramas = function(){
	    var linkNivel = document.getElementById('nivel-formulario').value;
	    var linkEntidad = document.getElementById('entidad-formulario').value;
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
        	if(datosSubProgramas.subprogramas[x].codigoSubprograma === parseInt(numeroSubProgramaIngresado))
        	{
	        	var mostrarNombrePrograma = datosSubProgramas.subprogramas[x].nombreSubprograma;
	          	var nt=document.createTextNode(mostrarNombrePrograma);
	          	var nparrafo=document.getElementById('f5c2');
	          	nparrafo.innerHTML="";
	          	nparrafo.appendChild(nt);
	        }
      	}
    } 

    this.proyectoFocus = function(){
	    var linkNivel = document.getElementById("nivel-formulario").value;
	    var linkEntidad = document.getElementById("entidad-formulario").value;
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
	    var linkNivel = document.getElementById("nivel-formulario").value;
	    var linkEntidad = document.getElementById("entidad-formulario").value;
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
     	var linkNivel = document.getElementById("nivel-formulario").value;
      	var linkEntidad = document.getElementById("entidad-formulario").value;
      	var linkTipoPresupuesto = document.getElementById("tipoPrograma-formulario").value;
      	var linkPrograma = document.getElementById("programa-formulario").value;
      	var linkSubPrograma = document.getElementById("subPrograma-formulario").value;
      	var linkProyecto = document.getElementById("proyecto-formulario").value;
      	var anho=2015;
      //crear nueva estructra programatica
    	$("#anho-crear-estructura-programatica").attr("value",2015);
    	$("#nivel-crear-estructura-programatica").attr("value",linkNivel);
    	$("#entidad-crear-estructura-programatica").attr("value",linkEntidad);
    	$("#tipo-crear-estructura-programatica").attr("value",linkTipoPresupuesto);
    	$("#programa-crear-estructura-programatica").attr("value",linkPrograma);
    	$("#subprograma-crear-estructura-programatica").attr("value",linkSubPrograma);
    	$("#proyecto-crear-estructura-programatica").attr("value",linkProyecto);
    	$("#crear-estructura-programatica").toggle();
    	
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
			//contenedorDeProducto.setAttribute('producto',linkProducto);
			contenedorDeProducto.setAttribute('class',"col-md-12");


			var producto = datosProductos.producto[i].id
			var cajaProducto=' <!-- PRODUCTO -->'+
		                  '<div class="box box-warning direct-chat direct-chat-warning"><form id="form-producto-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'" ><input type="hidden" name="accion" value="updateProductoMeta">'+
		                    '<div class="box-header with-border">'+
		                      '<h3 class="box-title">Nombre Producto</h3>'+
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
		                    	'<button class="btn btn-warning"  id="asignar-beneficiario-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+producto+'" owner="" disabled="">Asignar Destinatario</button>'+
		                    	'</div>'+
		                    '</div>'+
		                    '</form></div>';
		    contenedorDeProducto.innerHTML=cajaProducto;

			var nparrafo=document.getElementById('row-body-programacionfisica');
          	nparrafo.appendChild(contenedorDeProducto);

    		var codigoProducto = datosProductos.producto[i].id;
		    var productos = $.ajax({
		        url:'http://spr.stp.gov.py/ajaxSelects?accion=getProductos&producto='+codigoProducto,
		        type:'get',
		        dataType:'json',
		        async:false       
		    }).responseText;
        	productos = JSON.parse(productos);
        	var mostrarTituloProducto = productos.productos[0].nombreCatalogo;
      		var nt=document.createTextNode(mostrarTituloProducto);
      		var linkProducto = datosProductos.producto[i].id
      		$("div [nivel='"+linkNivel+"'][entidad='"+linkEntidad+"'][tipopresupuesto='"+linkTipoPresupuesto+"'][programa='"+linkPrograma+"'][subprograma='"+linkSubPrograma+"'][proyecto='"+linkProyecto+"'][id='producto-"+linkProducto+"']").find('h3').html(nt);

        	var codigoUnidadMedida = datosProductos.producto[i].unidad_medida_id;
		    var unidadMedida = $.ajax({
		        url:'http://spr.stp.gov.py/ajaxSelects?accion=getUnidadesMedida&unidadMedida='+codigoUnidadMedida,
		        type:'get',
		        dataType:'json',
		        async:false       
		    }).responseText;
        	unidadMedida = JSON.parse(unidadMedida);
        	var unidadMedida=unidadMedida.unidadesMedida[0];

        	$("div [nivel='"+linkNivel+"'][entidad='"+linkEntidad+"'][tipopresupuesto='"+linkTipoPresupuesto+"'][programa='"+linkPrograma+"'][subprograma='"+linkSubPrograma+"'][proyecto='"+linkProyecto+"'][id='producto-"+linkProducto+"']").find('h3').append(" ("+unidadMedida.nombre+")");

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
		                 if( this[mes][ 'mes' ] == mesB && this[mes][ 'departamento' ] == deptoB )
		                     return  this[mes][ 'cantidad' ];
		            }
		        }
		    }
		  
		    var cant;
		    var sumaMes=[0,0,0,0,0,0,0,0,0,0,0,0,0];
		    var sumaTotal=0;
			for(var j = 0; j < datosDepartamentos.departamentos.length; j++  )
			{
				depto = datosDepartamentos.departamentos[j].deptoPais;
				deptoN = datosDepartamentos.departamentos[j].abrevDepartamento;
				filaProduct+="<tr departamento=\""+depto+"\"><td>"+deptoN+"</td>";
				for (var k = 0; k < datosMeses.meses.length; k++)
				{	
					mes = datosMeses.meses[k].id;
					var flag=0;
					var suma=0;
					cant = metaProducto.getCantidadPorMesDepto(mes,depto)
					if (cant>0){
						filaProduct+='<td><input type="text"  class= "cantidad-depto-mes" size="5px" name="cantidad-'+depto+'-'+mes+' id="cantidad-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-'+depto+'-'+mes+'" value="'+cant+'"></td>';
						flag=1;
						suma+=cant;
						sumaMes[mes]+=cant;
						sumaTotal+=cant;
					}
						
					if (flag==0) 
						filaProduct+='<td><input type="text" class= "cantidad-depto-mes" size="5px" name="cantidad-'+depto+'-'+mes+'" id="cantidad-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-'+depto+'-'+mes+'" value=""></td>';				    
				}
				filaProduct+='<td id="suma-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-'+depto+'" suma="">'+suma+'</td></tr>';

			}
			filaProduct+=
			'<tr>'+
				'<td>Total Mes</td>'+
				'<td id="sumaMes-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-1">'+sumaMes[1]+'</td>'+
				'<td id="sumaMes-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-2">'+sumaMes[2]+'</td>'+
				'<td id="sumaMes-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-3">'+sumaMes[3]+'</td>'+
				'<td id="sumaMes-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-4">'+sumaMes[4]+'</td>'+
				'<td id="sumaMes-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-5">'+sumaMes[5]+'</td>'+
				'<td id="sumaMes-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-6">'+sumaMes[6]+'</td>'+
				'<td id="sumaMes-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-7">'+sumaMes[7]+'</td>'+
				'<td id="sumaMes-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-8">'+sumaMes[8]+'</td>'+
				'<td id="sumaMes-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-9">'+sumaMes[9]+'</td>'+
				'<td id="sumaMes-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-10">'+sumaMes[10]+'</td>'+
				'<td id="sumaMes-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-11">'+sumaMes[11]+'</td>'+
				'<td id="sumaMes-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-12">'+sumaMes[12]+'</td>'+
				'<td id="sumaMes-'+linkNivel+'-'+linkEntidad+'-'+linkTipoPresupuesto+'-'+linkPrograma+'-'+linkSubPrograma+'-'+linkProyecto+'-'+linkProducto+'-13">'+sumaTotal+'</td>'+
			'</tr>';
				
			$("div [nivel='"+linkNivel+"'][entidad='"+linkEntidad+"'][tipopresupuesto='"+linkTipoPresupuesto+"'][programa='"+linkPrograma+"'][subprograma='"+linkSubPrograma+"'][proyecto='"+linkProyecto+"'][id='producto-"+datosProductos.producto[i].id+"']").find("[producto="+datosProductos.producto[i].id+"]").html(filaProduct);

		}
            
	// /frames/codigocomentado.html
    }

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
		        success: function (data) {alert("Guardado!")},
		        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
		        error: function(data,status,er) {alert("Guardado");}
		 });
		
		event.stopPropagation();
	});
	
	
	
	
//edicion de producto meta
	
	$("body").on("change", ".cantidad-depto-mes",function(event){
		
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
	      var suma =parseInt(0);
	      var sumaMes =parseInt(0);
	      var sumaTotal =parseInt(0);
	      
	      $("#suma-"+id).html("");
	     
	      for (var i=0;i<13;i++){
	       if ($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+departamento+"-"+i).val()>0)
	    	   suma+= parseInt($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+departamento+"-"+i).val());
	      }
	      for (var i=0;i<19;i++){
		       if ($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+i+"-"+mes).val()>0)
		    	   sumaMes+= parseInt($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+i+"-"+mes).val());
		      }
	      if ($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+88+"-"+mes).val()>0)
	    	   sumaMes+= parseInt($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+88+"-"+mes).val());
	      if ($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+99+"-"+mes).val()>0)
	    	   sumaMes+= parseInt($("#cantidad-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+99+"-"+mes).val());
	      
	      for (var i=0;i<13;i++){
		       if (parseInt($("#sumaMes-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+i).text())>0)
		    	   sumaTotal+= parseInt($("#sumaMes-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+i).text());
		  }
	     /* if (parseInt($("#sumaMes-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+88).text())>0)
	    	   sumaTotal+= parseInt($("#sumaMes-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+88).text());
	      if (parseInt($("#sumaMes-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+99).text())>0)
	    	   sumaTotal+= parseInt($("#sumaMes-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+99).text());
	      */
	      
	      $("#suma-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto+"-"+departamento).html(suma);
	      $("#sumaMes-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-'+mes).html(sumaMes);
	      $("#sumaMes-"+nivel+'-'+entidad+'-'+tipo+'-'+programa+'-'+subprograma+'-'+proyecto+'-'+producto+'-13').html(sumaTotal);
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
	      var fromulario="#form-producto-"+nivel+"-"+entidad+"-"+tipo+"-"+programa+"-"+subprograma+"-"+proyecto+"-"+producto;
	      
	      if (accion==="guardar" && elemento==="producto"){

		       var frm = $(fromulario);
		       var dat = JSON.stringify(frm.serializeArray());
	
		       alert("I am about to POST this:\n\n" + dat);
		       
		      $.post("http://localhost:8080/clasificadores/ajaxUpdate?accion=actProductoPresupuestoMeta", dat, function(result){
		          alert(result);
		      });
	      }
	      
	     
	    });


	
	
	
	
	
	
	$(document).ready(function(){

		var optionDepartamentos="";
		var optionFuncionales="";
		var optionUnidadResponsable="";
		var optionPnd='<optgroup label="DESARROLLO SOCIAL EQUITATIVO">'+
			'<option value="1">Universalizar el acceso a la identidad de las personas en el paós.</option>'+
			'<option value="2">Erradicar la pobreza extrema de hombres y mujeres.</option>'+
			'<option value="3">Reducir en 90% la desnutrición crónica infantil, con ónfasis en grupos vulnerables.</option>'+
			'<option value="4">Reducir en 75% la mortalidad materna.</option>'+
			'<option value="5">Reducir en 70% la mortalidad infantil.</option>'+
			'<option value="6">Aumentar a 70% la cobertura de educación inicial.</option>'+
			'<option value="7">Universalizar la educación preescolar.</option>'+
			'<option value="8">Aumentar 5 veces la escolaridad promedio de la población indógena.</option>'+
			'<option value="9">Universalizar el alfabetismo en la población indógena.</option>'+
			'<option value="10">Universalizar la cobertura de la educación escolar bósica.</option>'+
			'<option value="11">"Aumentar la cobertura de educación media al 92% (tasa bruta de matriculación en educación media), con ónfasis en poblaciones vulnerables.</option>'+
			'<option value="12">Universalizar la alfabetización en adolescentes y adultos.</option>'+
			'<option value="13">Aumentar en 75% la participación de las mujeres en el mundo laboral formal en igualdad de condiciones.</option>'+
		'</optgroup>'+

		'<optgroup label="SERVICIOS SOCIALES DE CALIDAD">'+
			'<option value="14">Alcanzar los estóndares internacionales de calidad educativa (universalización del nivel 2 en prueba PISA y promedio en nivel 3 o mós).</option>'+
			'<option value="15">Aumentar la esperanza de vida al nacer a 79 aóos.</option>'+
			'<option value="16">Disminuir en 50% las muertes por enfermedades no contagiosas.</option>'+
			'<option value="17">Disminuir en 50% la tasa de obesidad de la población.</option>'+
			'<option value="18">Reducir en 75% la tasa de homicidios dolosos.</option>'+
			'<option value="19">Reducir en 50% la tasa de muertes por accidentes de trónsito.</option>'+
			'<option value="20">Disminuir en 50% la tasa de suicidios.</option>'+
			'<option value="21">Aumentar la proporción de funcionarios póblicos incorporados o promocionados con criterio de móritos y aptitudes.</option>'+
			'<option value="22">Aumentar el acceso a información póblica y trómites por medio de redes electrónicas.</option>'+
			'<option value="23">Mejora del sistema estadóstico nacional por encima de 85 puntos en el óndice internacional de capacidad estadóstica.</option>'+
		'</optgroup>'+

		'<optgroup label="DESARROLLO LOCAL PARTICIPATIVO">'+
			'<option value="24">Mejorar condiciones de los asentamientos precarios a travós de un proceso de ordenamiento y mejora urbanóstica adecuada.</option>'+
			'<option value="25">Descentralización de la gestión de las polóticas póblicas.</option>'+
			'<option value="26">Ordenamiento territorial a nivel municipal que determine el uso del suelo rural y urbano considerando los efectos económicos, sociales, culturales y ambientales, de forma a contar con una densidad poblacional adecuada que facilite la provisión de servicios póblicos con eficiencia.</option>'+
			'<option value="27">Rendición de cuentas periódicas de todos los niveles de gobierno.</option>'+
		'</optgroup>'+

		'<optgroup label="HóBITAT ADECUADO Y SOSTENIBLE">'+
			'<option value="28">Reducir en 70% el dóficit habitacional.</option>'+
			'<option value="29">Universalizar el acceso a agua potable (agua corriente segura domiciliaria).</option>'+
			'<option value="30">Universalizar el acceso a saneamiento mejorado.</option>'+
			'<option value="31">Universalizar el acceso a energóa elóctrica de calidad.</option>'+
			'<option value="32">Reducir en 95% las muertes atribuibles a la contaminación del aire.</option>'+
			'<option value="33">Universalizar la disposición y manejo de residuos urbanos e industriales.</option>'+
		'</optgroup>'+

		'<optgroup label="EMPLEO Y PROTECCIóN SOCIAL">'+
			'<option value="34">Mantener la tasa de crecimiento del ingreso del 40% de la población de menores ingresos por encima de la tasa promedio de crecimiento de la economóa.</option>'+
			'<option value="35">Aumentar en 7 veces el promedio nacional de población con estudios terciarios, con ónfasis en poblaciones vulnerables.</option>'+
			'<option value="36">Universalizar la cobertura de la seguridad social.</option>'+
			'<option value="37">Alcanzar la inclusión financiera del 100% de los hogares.</option>'+
			'<option value="38">85% de jóvenes de 20-32 aóos de los quintiles mós pobres incluidos en programas de capacitación laboral.</option>'+
		'</optgroup>'+

		'<optgroup label="COMPETITIVIDAD E INNOVACIóN">'+
			'<option value="39">Tasa de crecimiento promedio del PIB de 6,8%.</option>'+
			'<option value="40">Consolidar una red de transporte multimodal eficiente (fluvial, aóreo, terrestre, ferroviario) que disminuya los costos logósticos promedios a niveles competitivos internacionalmente.</option>'+
			'<option value="41">Mantener bajas tasas de inflación (de acuerdo al objetivo definido) y con reducida volatilidad.</option>'+
			'<option value="42">"Alcanzar el 90% de formalización de la actividad económica en los principales sectores, logrando asimismo un incremento en recaudaciones fiscales que permita una presión tributaria de aproximadamente el 18% del PIB.</option>'+
			'<option value="43">Contar con al menos 1 universidad paraguaya ubicada entre las primeras 400 a nivel mundial (en cualquiera de los 3 rankings mós utilizados).</option>'+
			'<option value="44">Aumentar al 80% el uso de internet de banda ancha - o tecnologóa equivalente -.</option>'+
			'<option value="45">Regularizar la tenencia de la tierra por medio de un catastro fiable que incluya tambión a todos los beneficiarios de la reforma agraria en las óltimas dócadas, ceóido a un estricto cumplimiento de la Ley.</option>'+
			'<option value="46">Quintuplicar el nómero de patentes de invenciones nacionales.</option>'+
			'<option value="47">Asegurar la transparencia del gasto póblico en los tres niveles de gobierno y en los tres Poderes del Estado.</option>'+
		'</optgroup>'+

		'<optgroup label="REGIONALIZACIóN Y DIVERSIFICACIóN PRODUCTIVA">'+
			'<option value="48">Reducir a menos de 3% el rezago potencial de la productividad por hectórea de la agricultura familiar con respecto a la agricultura empresarial</option>'+
			'<option value="49">Reducir a menos de 7% el rezago potencial de los ingresos laborales promedios en la región centro-norte del paós (San Pedro, Concepción, Canindeyó, Caazapó y Caaguazó) con respecto al resto de la región oriental.</option>'+
			'<option value="50">Incrementar el consumo de electricidad para uso industrial.</option>'+
			'<option value="51">Fomentar la creación de MiPyMEs en industrias de servicios y tecnologóas.</option>'+
		'</optgroup>'+

		'<optgroup label="VALORIZACIóN DEL CAPITAL AMBIENTAL">'+
			'<option value="52">Aumentar en 60% el consumo de energóas renovables.</option>'+
			'<option value="53">Reducir en 20% el consumo de combustible fósil.</option>'+
		'</optgroup>'+

		'<optgroup label="IGUALDAD DE OPORTUNIDADES EN UN MUNDO GLOBALIZADO">'+
			'<option value="54">Asegurar servicios consulares ótiles, eficientes a paraguayos migrantes y propiciar los vónculos culturales paraguayos con sus familiares.</option>'+
			'<option value="55">Ampliar la cobertura territorial y la presencia del paós en el mundo, en particular en los paóses donde existen comunidades crecientes de paraguayos y donde deben promocionarse los productos nacionales y el turismo.</option>'+
			'<option value="56">Gestión efectiva de la dióspora paraguaya en el exterior.</option>'+
			'<option value="57">Propiciar la re-incorporación de paraguayos destacados en el exterior, al servicio póblico, al sector empresarial o cientófico.</option>'+
			'<option value="58">Potenciar la contribución al desarrollo paraguayo de la comunidad de inmigrantes en Paraguay en forma armónica e integrada.</option>'+
		'</optgroup>'+


		'<optgroup label="ATRACCIóN DE INVERSIONES, COMERCIO EXTERIOR E IMAGEN PAIS.">'+
			'<option value="59">Ubicar a Paraguay entre los primeros exportadores mundiales de alimentos, en rubros tales como sósamo, almidón de mandioca, stevia, frutas y hortalizas, soja, carne, etc.</option>'+
			'<option value="60">Aumentar la exportación de productos y servicios culturales y tecnológicos.</option>'+
			'<option value="61">Incrementar a al menos 2 millones el nómero de turistas por aóo.</option>'+
			'<option value="62">Disminuir sustancialmente las vulnerabilidades y amenazas de lavado de activos, financiamiento del terrorismo y proliferación de armas de destrucción masiva.</option>'+
			'<option value="63">Aumentar los ingresos por venta de energóa elóctrica.</option>'+
		'</optgroup>'+

		'<optgroup label="INTEGRACIóN ECONóMICA REGIONAL">'+
			'<option value="64">Hacer del Paraguay el eje de una integración energótica regional, aprovechando las potenciales complementariedades energóticas en la región, garantizando asó el uso sostenible y eficiente de los recursos energóticos de cada paós.</option>'+
			'<option value="65">Aumentar la capacidad de movimiento portuario.</option>'+
			'<option value="66">Incrementar el tiempo disponible de uso de las hidrovóas a 365 dóas al aóo.</option>'+
			'<option value="67">Aumentar la transitabilidad de transporte de cargas a todas las cabeceras distritales.</option>'+
			'<option value="68">Restaurar al menos el 20% de los ecosistemas degradados.</option>'+
			'<option value="69">Aumentar los ingresos nacionales por la venta de servicios ambientales.</option>'+
		'</optgroup>'+

		'<optgroup label="SOSTENIBILIDAD DEL HóBITAT GLOBAL">'+
			'<option value="70">Reducir los costos de recuperación ante eventos de desastres causados por efectos climóticos.</option>'+
			'<option value="71">Explotar los acuóferos en base a planes ambientales debidamente monitoreados.</option>'+
			'<option value="72">Aumentar la cobertura de óreas forestales y biomasa protegida.</option>'+
		'</optgroup>';
		
		var departamentos = $.ajax({
	    	url:'http://spr.stp.gov.py/ajaxSelects?accion=getDepartamentos',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		departamentos = JSON.parse(departamentos);
		departamentos = departamentos.departamentos;
		for(i = 0;i<departamentos.length; i++){
			optionDepartamentos+='<option value="'+departamentos[i].deptoPais+'">'+departamentos[i].abrevDepartamento+'</option>';
		}
		
		var funcionales = $.ajax({
	    	url:'http://spr.stp.gov.py/ajaxSelects?accion=getFuncionales&anio=2015',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		funcionales = JSON.parse(funcionales);
		funcionales = funcionales.funcionales;
		for(i = 0;i<funcionales.length; i++){
			optionFuncionales+='<option value="'+funcionales[i].codigoFuncional+'">'+funcionales[i].nombre+'</option>';
		}
		
		
		
		var unidadesResponsables = $.ajax({
	    	url:'http://spr.stp.gov.py/ajaxSelects?accion=getUnidadesResponsables&anio=2015',
	      	type:'get',
	      	dataType:'json',
	      	async:false       
	    }).responseText;
		unidadesResponsables = JSON.parse(unidadesResponsables);
		unidadesResponsables = unidadesResponsables.unidadesResponsables;
		for(i = 0;i<unidadesResponsables.length; i++){
			optionUnidadResponsable+='<option value="'+unidadesResponsables[i].unrCodigo+'">'+unidadesResponsables[i].unrNombre+'</option>';
		}
	
	
	});

});

  