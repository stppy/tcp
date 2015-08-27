<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="org.jasig.cas.client.authentication.AttributePrincipalImpl"%>
<%@ page import="org.jasig.cas.client.authentication.AttributePrincipal"%>

	<script type="text/javascript">		
	$("body").on("click", "#password_modal_save",function(event){		
		var todojunto = new Object();
		var passviejo= $.md5($("#pass-viejo").val());
		var passnuevo= $.md5($("#pass-nuevo").val());
		var passnuevo1= $.md5($("#pass-nuevo1").val());		
		todojunto.passviejo=passviejo;
		todojunto.passnuevo=passnuevo;
		todojunto.passnuevo1=passnuevo1;
		
		alert(todojunto.passnuevo);
		
	<!--	$.ajax({
	        url: 'ajaxUpdate?accion='+actPass,
	        type: 'POST',
	        dataType: 'json',
	        data: JSON.stringify(todojunto),
	        contentType: 'application/json',
	        mimeType: 'application/json',
	        success: function (data) {alert("Guardado!"); },
	        //error: function(data,status,er) {alert("error: "+data+" status: "+status+" er:"+er);}
	        error: function(data,status,er) {alert("Producto Guardado");}
	 }); -->
	</script>



	<!-- MODAL PASSWORD -->
	<div id="pass_modal" class="modal fade" role="dialog">
	  <div class="pass_mod">
	
	    <!-- Modal content-->
	    <div class="modal-content">						      
	      <div class="modal-body">
	         <div class="control-group">						            
	            <div class="controls">
	                <input id="pass-viejo" name="current_password" class="feedback-input" placeholder="Clave Actual" type="password" required pattern="\w+">
	            </div>
	        </div>
	        <div class="control-group">						            
	            <div class="controls">
	                <input id="pass-nuevo" name="new_password" class="feedback-input"
	                 title="Password must contain at least 6 characters, including UPPER/lowercase and numbers."
	                 placeholder="Clave Nueva" type="password"
	                 required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" onchange="
	  					this.setCustomValidity(this.validity.patternMismatch ? this.title : '');
	  					if(this.checkValidity()) confirm_password.pattern = this.value;
						">
	            </div>
	        </div>
	        <div class="control-group">						            
	            <div class="controls">
	                <input id="pass-nuevo1" name="confirm_password" class="feedback-input" 
	                title="Please enter the same Password as above." placeholder="Confirmar Clave"
	                type="password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" onchange="
	 					this.setCustomValidity(this.validity.patternMismatch ? this.title : '');
					" >
	            </div>
	        </div> 
	      </div>						      
	      <div class="modal-footer">
	        <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
	        <button type="submit" class="btn btn-primary" id="password_modal_save">Guardar </button>						      
	      </div>
	    </div>
	
	  </div>
	</div>