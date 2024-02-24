<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<% String pantalla = "axisctr020"; %>

<script type="text/javascript">
 function GuardarDatos() {
     
     var Mail;
     var nMail;
    
     var Tel;
     var nTel;
     
     var Npoliza;
     var Ncertif;
     var Spersona;
     var Tpersona;
     Mail = document.getElementsByName("checkMail");
     Tel = document.getElementsByName("checkTel");
     Npoliza = document.getElementsByName("npoliza");
     Ncertif = document.getElementsByName("ncertif");
     Tpersona = document.getElementsByName("tpersona");
     Spersona = document.getElementsByName("spersona");
     

     for (var i=0;i < Mail.length; i++){
          //alert( "npoliza:"+ Npoliza[i].value + " ncertif:" +Ncertif[i].value+ " tpersona:"+Tpersona[i].value+ " spersona:"+Spersona[i].value+" mail:" +Mail[i].checked + " telefono:" +Tel[i].checked );
          if(Mail[i].checked){
        	  nMail=1;
          }else{
        	  nMail=0;
          }
          if(Tel[i].checked){
        	  nTel=1;
          }else{
        	  nTel=0;
          }
         
        	 // alert('update');
              f_actualiza_datos_bd(Npoliza[i].value, Ncertif[i].value, Spersona[i].value, Tpersona[i].value, nMail, nTel);
             
          
        	          	                   	
      }
 }
 function callbackAjaxUpdateDatosContacto(ajaxResponseText,obj) {
	    //alert(ajaxResponseText);
	        try{
	            var doc=objAjax.domParse(ajaxResponseText);
	           
	           if ( !objAppMensajes.existenErroresEnAplicacion(doc) ){
	           
	            <% if ("axisctr020".equals(pantalla) ) { %>
	             	objUtiles.ejecutarFormulario("axis_<%=pantalla%>.do", "form", document.axisctr020Form, "_self", objJsMessages.jslit_borrando_registro);
	            <%}%>
	            }else{
	            
	            obj.checked = false;
	            }
	    
	        
	     } catch (e) {
	            if (isDebugAjaxEnabled == "true")
	                alert (e.name + " " + e.message);
	        }
	        //$.reinitialiseScroll(); 
	    }

 function f_actualiza_datos_bd(poliza, certif, persona, tipoper, mail, tel){
     try {
           
          
           
           //alert("1- Update persona:"+persona);
          // alert("operation=ajax_update_datos_contacto&POLIZA=" +poliza + "&CERTIF=" + certif +"&PERSONA="+persona +"&TIPOPER="+tipoper +"&MAIL="+mail +"&TEL="+tel);
           
           objAjax.invokeAsyncCGI("axis_axisctr020.do", callbackAjaxUpdateDatosContacto, 
               "operation=ajax_update_datos_contacto&POLIZA=" +poliza + 
               "&CERTIF=" + certif +"&PERSONA="+persona +"&TIPOPER="+tipoper +"&MAIL="+mail +"&TEL="+tel , this, objJsMessages.jslit_actualizando_registro); 
               
               //&POLIZA=" +poliza + 
               //"&CERTIF=" + certif +"&PERSONA="+persona +"&TIPOPER="+tipoper +"&MAIL="+mail +"&TEL="+tel , this, objJsMessages.jslit_actualizando_registro,obj);  
          // alert("2 - Updated persona:"+persona);
       } catch (e) {
           if (isDebugAjaxEnabled == "true")
               alert (e.name + " " + e.message);
       }
   
   }
</script>

<c:choose>
	<c:when test="${empty param.f}">
		<c:set var="pantalla" value="axisctr020" />
	</c:when>
	<c:otherwise>
		<c:set var="pantalla" value="${param.f}" />
	</c:otherwise>
</c:choose>


<axis:ocultar c="DSP_DATOS_CONTACTO" f="${pantalla}" dejarHueco="false">   
<tr>
	<td>
					 <table class="area" align="center"> 
						<tr>
							<th style="height: 0px"></th>
						</tr>
						<c:if test="${! empty datos_poliza}">
							<tr>
								<td class="campocaja">
									<div style="float: left;">
										<img id="DSP_DATOS_CONTACTO_parent" src="images/mes.gif"
											onclick="objEstilos.toggleDisplay('DSP_DATOS_CONTACTO', this)"
											style="cursor: pointer" />
											<b><axis:alt f="axisctr020"
												c="DATOS_CONTACTO" lit="9908971" /> 
											
									</div>
									
									<div style="clear: both;">
										<hr class="titulo">
									</div>
									
								</td>
							</tr>
							<tr id="DSP_DATOS_CONTACTO_children" style="display:none">           
                				<td class="campocaja" > 
                    				<axis:ocultar c="DSP_DATOS_CONTACTOCAB" f="${pantalla}" dejarHueco="false">                    
                    					<div class="displayspace">
                    					</div>
                    				</axis:ocultar>
                    				<c:set var="title0"><axis:alt f="${pantalla}" c="ENDERCOMAIL" lit="109792"></axis:alt></c:set> 
		    						<c:set var="title5"><axis:alt f="${pantalla}" c="TELEF" lit="9000992"> </axis:alt></c:set>  
		    						<c:set var="title1"><b id="label_TPESSOA"><axis:alt f="${pantalla}" c="TPESSOA" lit="102844"></b> </axis:alt></c:set>   
                    				<c:set var="title2"><axis:alt f="${pantalla}" c="PESSOA" lit="111523"></axis:alt></c:set>                    
                    				<c:set var="title3"><axis:alt f="${pantalla}" c="CHKMAIL" lit="9903325"></axis:alt></c:set>
                    				<c:set var="title4"><axis:alt f="${pantalla}" c="CHKTEL" lit="9000992"></axis:alt></c:set>
 									<display:table name= "${T_IAX_DATOS_CONTACTO}"
 									id="T_IAX_DATOS_CONTACTO" export="false"
		    						 	class="dsptgtable" pagesize="-1" defaultsort="1" 
		    						 	defaultorder="ascending" sort="list" 
		    						 	cellpadding="0" cellspacing="0"
		    						 	requestURI="axis_${pantalla}.do?paginar=true">          
 									 	
		          					<%@ include file="../include/displaytag.jsp"%>
                           			<display:column title="${title3}" sortable="false" sortProperty="" 
			   						 	headerClass="headwidth5 sortable"  
			   						 	media="html" autolink="false" >
			   							<div name="div1" class="dspIcons">
			   							    <input type="hidden" name="antMail" value="<c:if test="${T_IAX_DATOS_CONTACTO.OB_IAX_DATOS_CONTACTO.ENVIO == 3}"> 1 </c:if><c:if test="${T_IAX_DATOS_CONTACTO.OB_IAX_DATOS_CONTACTO.ENVIO == 1}"> 1 </c:if>">
			   							    <input type="hidden" name="antTel" value="<c:if test="${T_IAX_DATOS_CONTACTO.OB_IAX_DATOS_CONTACTO.ENVIO == 3}"> 1 </c:if><c:if test="${T_IAX_DATOS_CONTACTO.OB_IAX_DATOS_CONTACTO.ENVIO == 2}"> 1 </c:if>">
			   								<input type="hidden" name="npoliza" value="${T_IAX_DATOS_CONTACTO.OB_IAX_DATOS_CONTACTO.NPOLIZA}">
			   								<input type="hidden" name="ncertif" value="${T_IAX_DATOS_CONTACTO.OB_IAX_DATOS_CONTACTO.NCERTIF}">
			   								<input type="hidden" name="spersona" value="${T_IAX_DATOS_CONTACTO.OB_IAX_DATOS_CONTACTO.SPERSON}">
			   								<input type="hidden" name="tpersona" value="${T_IAX_DATOS_CONTACTO.OB_IAX_DATOS_CONTACTO.TIPOPERS}">
			   								<input   
			   						 			onClick="" 
                           						value="<c:if test="${T_IAX_DATOS_CONTACTO.OB_IAX_DATOS_CONTACTO.ENVIO == 3}"> checked </c:if><c:if test="${T_IAX_DATOS_CONTACTO.OB_IAX_DATOS_CONTACTO.ENVIO == 1}"> checked </c:if>" 
			   									type="checkbox" id="chkMail"	 
			   									name="checkMail"
			   									<c:if test="${T_IAX_DATOS_CONTACTO.OB_IAX_DATOS_CONTACTO.ENVIO == 3}"> checked </c:if><c:if test="${T_IAX_DATOS_CONTACTO.OB_IAX_DATOS_CONTACTO.ENVIO == 1}"> checked </c:if>/>
			   							</div>
                           			</display:column>
                           			<display:column title="${title4}" sortable="false" sortProperty="" 
			   						 	headerClass="headwidth5 sortable"  
			   						 	media="html" autolink="false" >
			   							<div name="div2" class="dspIcons">
			   								<input   
			   						 			onClick="" 
                           						value="<c:if test="${T_IAX_DATOS_CONTACTO.OB_IAX_DATOS_CONTACTO.ENVIO == 3}"> checked </c:if><c:if test="${T_IAX_DATOS_CONTACTO.OB_IAX_DATOS_CONTACTO.ENVIO == 2}"> checked </c:if>" 
			   									type="checkbox" id="chkTel"	 
			   									name="checkTel"
			   									<c:if test="${T_IAX_DATOS_CONTACTO.OB_IAX_DATOS_CONTACTO.ENVIO == 3}"> checked </c:if><c:if test="${T_IAX_DATOS_CONTACTO.OB_IAX_DATOS_CONTACTO.ENVIO == 2}"> checked </c:if> />
			   							</div>
                           			</display:column>
                           			<display:column title="${title0}" sortable="true" 
			   							 sortProperty="EMAIL"
			   							 headerClass="headwidth5 sortable"  
			   							media="html" autolink="false" >
			   						
									   	
			   							<div class="dspText">
			   								    ${T_IAX_DATOS_CONTACTO.OB_IAX_DATOS_CONTACTO.EMAIL}  
			   								
			    						</div>
                    </display:column>
                    
                    <display:column title="${title5}" sortable="true" 
			   							 sortProperty="TELEFONO"
			   							 headerClass="headwidth5 sortable"  
			   							media="html" autolink="false" >
			   						
									   	
			   							<div class="dspText">
			   								    ${T_IAX_DATOS_CONTACTO.OB_IAX_DATOS_CONTACTO.TELEFONO}  
			   								
			    						</div>
                    </display:column>
                           <display:column title="${title2}" sortable="true" 
			    sortProperty="PERSONA" 
			     
			   headerClass="sortable"  media="html" 
			   autolink="false" >
			   <div class="dspText">
			   ${T_IAX_DATOS_CONTACTO.OB_IAX_DATOS_CONTACTO.TNOMBRE}
                                     ${T_IAX_DATOS_CONTACTO.OB_IAX_DATOS_CONTACTO.TAPELLI1}
                                     ${T_IAX_DATOS_CONTACTO.OB_IAX_DATOS_CONTACTO.TAPELLI2}
			   
			   </div> 
                           </display:column>
                          <axis:visible f="${pantalla}" c="RIE_FEFECTO">
                             <display:column title="${title2}" sortable="true" 
                                 sortProperty="TIPOPERS"  
                               
                                headerClass="headwidth10 sortable"
                                media="html"
                                autolink="false">
                                <div class="dspText">
                                    <axis:alt f="${pantalla}" c="TIPOPERS" lit="${T_IAX_DATOS_CONTACTO.OB_IAX_DATOS_CONTACTO.TIPOPERS}"/>
                                </div>
	                           </display:column>  
	                           </axis:visible>                    
                          
                    </display:table>
                    <div align="right">
                    <br>
                    <input type="button" onclick="GuardarDatos()" class="boton" value="<axis:alt f="axisctr020" c="Guardar" lit="9908972" />"/>  <!-- JMT: Cambiar literal por el correcto -->
                    </div>
                    			</td>
                    		</tr>
						</c:if>
											 
					 </table> 
	</td>
</tr>
</axis:ocultar>