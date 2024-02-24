<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%/**
*  Fichero: axisusu003.jsp
*  Pantalla de cambio de datos de usuario y de alta usuario.
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>  
*
*  Fecha: 07/11/2008
*/
%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
 
<html>
    <head>
        <title><axis:alt f="axisusu003" c="NOMBREPANTALLA" lit="formulario.axisnombrepantalla"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {                
                if (${requestScope.grabarOK == true}) {
                    parent.f_aceptar_modal("axisusu003");
                } else {
                    if (${__formdata.isNewUser != "true"}) {
                        document.getElementById("CUSUARI").readOnly = "readonly";
                        document.getElementById("CUSUARI").setAttribute("obligatorio", false);
                    } else 
                        document.getElementById("CUSUARI").focus();                
                }
                f_cargar_propiedades_pantalla();
                revisarEstilos();
            }
                        
            function f_but_aceptar() {
                var NEWPWD               = objDom.getValorPorId("NEWPWD");
                var NEWPWD_CONFIRMACION  = objDom.getValorPorId("NEWPWD_CONFIRMACION");
                // INI IAXIS-4994
                obtener_marcados();
                // FIN IAXIS-4994
                // INI IAXIS-15078
                obtener_marcados_infEsp();
                // FIN IAXIS-15078
                if (objValidador.validaEntrada()) {                
/*                    if (${__formdata.isNewUser == 'true'} && objUtiles.estaVacio(NEWPWD))
                        alert(objJsMessages.jslit_debe_informar_nuevo_password); 
                    else if (!objUtiles.estaVacio(NEWPWD) && objUtiles.estaVacio(NEWPWD_CONFIRMACION))                        
                        alert(objJsMessages.jslit_debe_confirmar_nuevo_password);                               
                     */
                 /*   if (objUtiles.stringTrim(NEWPWD_CONFIRMACION) != objUtiles.stringTrim(NEWPWD)) 
                        alert(objJsMessages.jslit_111210);
                    else*/
                    objDom.setValorPorId("CAUTLOG_CHECK", ((document.miForm.CAUTLOG.checked)? "1" : null));
                    objUtiles.ejecutarFormulario("modal_axisusu003.do", "aceptar", document.miForm, "_self");                                      
                }
            }            

            function f_but_cancelar() {
                parent.f_aceptar_modal("axisusu003");
                
            }
            
            //INI IAXIS-4994
            //Antes de llamar a unificar revisamos los que están marcados y no para obtener los valores de los campos que nos interesan
	        function obtener_marcados(){
	            var j=0;
	            var cadena_areas ="";
	            for (var i=0;i < document.forms["miForm"].elements.length;i++){ 
	                  var elemento = document.forms[0].elements[i]; 
	                      if (elemento.name.indexOf('checkArea_') == 0){ 
	                      
	                         if( elemento.checked ){
	                             var valor = eval("document.miForm.CMARCA_"+j+".value");
	                             cadena_areas = cadena_areas + valor + ",";
	                         }
	                         
	                        //alert(cadena_areas); 
	                        j =j+1;
	                    } 
	            }  
	            
	            document.miForm.CAD_AREAS.value = cadena_areas;
	        }    
            //FIN IAXIS-4994
            
            function f_but_9000657() {
                if (confirm("<axis:alt f='axisusu003' c='BORRAR' lit='9000660'/>"))
                    objUtiles.ejecutarFormulario ("modal_axisusu003.do", "borrar", document.miForm, "_self");
            }  

            function f_but_9000656() {
                if (confirm("<axis:alt f='axisusu003' c='ACTIVAR' lit='9000661'/>"))
                    objUtiles.ejecutarFormulario ("modal_axisusu003.do", "activar", document.miForm, "_self");
            }                  
            
            function f_seleccionar_autologin(){
            }
            
            function f_seleccionar_cvispubli(){
                objDom.setValorPorId("CVISPUBLI_CHECK", ((document.miForm.CVISPUBLI.checked)? "1" : "0"));
            }            
            
            function f_cerrar_axisctr014() {
                objUtiles.cerrarModal("axisctr014")
            } 
            
            function f_abrir_axisctr014() {
                //if (objValidador.validaEntrada()) {
                    objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
                //}
            }
            
            function f_aceptar_axisctr014 (CAGENTE){
                f_cerrar_axisctr014();
                objAjax.invokeAsyncCGI("axis_axisage031.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            }
            
            function callbackAjaxCambiarAgente(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                    var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                    objDom.setValorPorId("CDELEGA", CAGENTEformateado);                      
                }
            }
            
            function f_abrir_axisper021 () {
            	
             	var SSEGURO = "${__formdata.SSEGURO}";
             	var CAGENTE = "${__formdata.CAGENTE}";
                objUtiles.abrirModal("axisper021", "src", "modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PUBPRIV&CAGENTE="+CAGENTE+"&SSEGURO="+SSEGURO);
            }
              
            function f_cerrar_axisper021(){
            	f_cerrar_modalespersona("axisper021");
            }   
            
            function f_cerrar_modalespersona(modal){
                objUtiles.cerrarModal(modal);
            } 
            
            function f_aceptar_persona(SPERSON, CAGENTE, SNIP, modal){
            	
                f_cerrar_modalespersona(modal);

                objDom.setValorPorId("SPERSON", SPERSON);
                objDom.setValorPorId("CAGENTE", CAGENTE);

                if (!objUtiles.estaVacio(SPERSON)){
                	objAjax.invokeAsyncCGI("modal_axisusu003.do", callbackAjaxActualizarPersona, "operation=actualizar_persona&SPERSON="+SPERSON+"&CAGENTE="+CAGENTE, this, objJsMessages.jslit_actualizando_registro);
                }
            }
            
            function callbackAjaxActualizarPersona(ajaxResponseText){
            	
                var doc=objAjax.domParse(ajaxResponseText);
                
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var NNUMIDE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0);
                    var NOMBRECompleto = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                    var SPERSON = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0);
                    objDom.setValorPorId("NNUMIDE", NNUMIDE);
                    objDom.setValorPorId("NOMBRE", NOMBRECompleto);   
                    objDom.setValorPorId("SPERSON", SPERSON);
                }
            }
            
          //INI IAXIS-15078
            //Antes de llamar a unificar revisamos los que están marcados y no para obtener los valores de los campos que nos interesan
	        function obtener_marcados_infEsp(){
	            var j=0;
	            var cadena_infesp ="";
	            for (var i=0;i < document.forms["miForm"].elements.length;i++){ 
	                  var elemento = document.forms[0].elements[i];
	                      if (elemento.name.indexOf('checkInfEsp_') == 0){ 
	                    	  if( elemento.checked ){
	                             var valor = eval("document.miForm.CINFESP_"+j+".value");
	                             cadena_infesp = cadena_infesp + valor + ",";
	                         }
	                        j =j+1;
	                    } 
	            }  
	            
	            document.miForm.CAD_INFESP.value = cadena_infesp;
	        }    
            //FIN IAXIS-15078
            
        </script>
    </head>
    <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>        
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/> 
            <input type="hidden" name="isNewUser" id="isNewUser" value="${__formdata.isNewUser}"/>
            <input type="hidden" name="CAUTLOG_CHECK" id="CAUTLOG_CHECK" value="${__formdata.CAUTLOG}"/>
            <input type="hidden" name="CVISPUBLI_CHECK" id="CVISPUBLI_CHECK" value="${__formdata.CVISPUBLI}"/>
            <!-- INI IAXIS-4994 -->
            <input type="hidden" name="CAD_AREAS" id="CAD_AREAS" value=""/>
            <!-- FIN IAXIS-4994 -->
		<!-- INI IAXIS-15078 -->
		<input type="hidden" name="CAD_INFESP" id="CAD_INFESP" value="" />
		<!-- FIN IAXIS-15078 -->
            <input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.SPERSON}"/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisusu003" c="CAUTLOG_CHECK" lit="${__formdata.isNewUser == 'true' ? '9000598' : 1000233}"/></c:param>
                <c:param name="titulo"><axis:alt f="axisusu003" c="CAUTLOG_CHECK_TIT" lit="${__formdata.isNewUser == 'true' ? '9000598' : 1000233}"/></c:param>
                <c:param name="form">axisusu003</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisusu003" c="TIT_AXISCTR014" lit="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
	            <c:param name="titulo"><axis:alt c="TITULO_021" f="axissin071" lit="1000235"/></c:param>
	            <c:param name="nid" value="axisper021"/>
	        </c:import>    
            
            <!-- Área de campos  -->
            <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisusu003" c="CAMPOS" lit="1000104"/></div>
                        <!-- Sección Datos Usuario -->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área Datos Usuario -->
                                    <table class="area">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisusu003" c="USUARIO_TIT" lit="100894"/></b> <%-- Usuario --%>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisusu003" c="NOMBRE_USUARIO_TIT" lit="101995"/></b> <%-- Usuario --%>
                                            </td>
                                            <axis:visible c="CIDIOMA" f="axisusu003">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisusu003" c="IDIOMA_TIT" lit="1000246"/></b> <%-- Idioma --%>
                                            </td>
                                               </axis:visible>
                                        </tr>
                                        <tr>
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="CUSUARI" name="CUSUARI" size="15"
                                                style="width:80%" <c:if test="${!empty __formdata.FBAJA}">readonly="true"</c:if> <c:if test="${empty __formdata.FBAJA}">obligatorio="true"</c:if> value="${__formdata.CUSUARI}" title="<axis:alt f="axisusu003" c="USUARIO" lit="100894"/>"
                                                maxlength="20"/>
                                            </td>
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="TUSUNOM" name="TUSUNOM" size="15"
                                                style="width:85.3%" <c:if test="${!empty __formdata.FBAJA}">readonly="true"</c:if> <c:if test="${empty __formdata.FBAJA}">obligatorio="true"</c:if> value="${__formdata.TUSUNOM}" title="<axis:alt f="axisusu003" c="NOMBRE_USUARIO" lit="101995"/>"
                                                maxlength="70"/>
                                            </td>
                                            <axis:visible c="CIDIOMA" f="axisusu003">
                                            <td class="campocaja" colspan="2">
                                                <select class="campowidthselect campo campotexto" id="CIDIOMA" name="CIDIOMA" size="1"
                                                style="width:90%"  <c:if test="${!empty __formdata.FBAJA}">disabled</c:if>  obligatorio="true" title="<axis:alt f="axisusu003" c="IDIOMA" lit="1000246"/>"/>
                                                    <option value="null"> - <axis:alt f="axisusu003" c="IDIOMA_VALOR" lit="1000348"/> - </option>
                                                    <c:forEach items="${__formdata.LSTVALORES.LSTIDIOMAS}" var="item">
                                                        <option value="${item.CIDIOMA}" <c:if test="${item.CIDIOMA  == __formdata.CIDIOMA}">selected</c:if>>${item.TIDIOMA}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                             </axis:visible>
                                        </tr>                                        
                                        <tr>
                                            <td class="titulocaja" colspan="2">
                                                <b><axis:alt f="axisusu003" c="DELEGACION_TIT" lit="1000561"/></b> <%-- Delegación --%>
                                            </td>                                            
                                            <axis:ocultar f="axisusu003" c="CVISPUBLI" dejarHueco="false">
                                                <td class="titulocaja">
                                                     <b><axis:alt f="axisusu003" c="CVISPUBLI_TIT" lit="9903433"/></b>   <%-- CVISPUBLI --%>
                                                </td>
                                            </axis:ocultar>
                                            <axis:visible c="CEMPLEADO" f="axisusu003">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisusu003" c="EMPLEADO_TIT" lit="9000588"/></b>   <%-- Empleado --%>
                                            </td>
                                          </axis:visible>
                                            <c:if test="${!empty __formdata.FBAJA}">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisusu003" c="FBAJA_TIT" lit="102853"/></b>   <%-- F.BAja --%>
                                            </td>  
                                            </c:if>
                                        </tr>
                                        <tr>
                                            <td class="campocaja" colspan=2">
                                                <select class="campowidthselect campo campotexto" id="CDELEGA" name="CDELEGA" size="1"
                                                style="width:91.2%"  <c:if test="${!empty __formdata.FBAJA}">disabled</c:if>  obligatorio="true" title="<axis:alt f="axisusu003" c="DELEGACION" lit="1000561"/>"/>
                                                    <option  value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisusu003" c="DELEGACION_VALOR" lit="1000348"/> - </option>
                                                    <c:forEach items="${__formdata.LSTVALORES.LSTAGENTES}" var="item">
                                                        <option value="${item.CODI}" <c:if test="${item.CODI  == __formdata.CDELEGA}">selected</c:if>>${item.NOMBRE}</option>
                                                    </c:forEach>                                                
                                                </select>
                                                <axis:visible f="axisage031" c="IAGENTE">
                                            		
                                        			<img border="0" id="IAGENTE" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>	                                        	
                                        		</axis:visible>
                                            </td>
                                            
                                            <axis:ocultar f="axisusu003" c="CVISPUBLI" dejarHueco="false">
                                                <td>
                                                    <input <c:if test="${__formdata.CVISPUBLI == 1}">checked</c:if> onclick="f_seleccionar_cvispubli()" <axis:atr f="axisusu003" c="CVISPUBLI" a="modificable=true&isInputText=false"/>
                                                    type="checkbox" name="CVISPUBLI" id="CVISPUBLI"  />
                                                </td>
                                            </axis:ocultar>
                                            <axis:visible c="CEMPLEADO" f="axisusu003">
                                            <td class="campocaja">
                                                <input type="text"  <c:if test="${!empty __formdata.FBAJA}">readonly</c:if>  class="campowidthinput campo campotexto" id="CEMPLEADO" name="CEMPLEADO" size="15"
                                                style="width:90%" value="${__formdata.CEMPLEADO}"/>
                                            </td>
                                            </axis:visible>
                                            <c:if test="${!empty __formdata.FBAJA}">
                                            <td class="campocaja">
                                                <input type="text"  <c:if test="${!empty __formdata.FBAJA}">readonly</c:if>  class="campowidthinput campo campotexto" id="FBAJA" name="FBAJA" size="15"
                                                style="width:90%" value="<fmt:formatDate value="${__formdata.FBAJA}" pattern="dd/MM/yyyy"/>"/>
                                            </td>                                   
                                            </c:if>
                                            </tr>
                                        
                                        <tr>
                                            <axis:ocultar f="axisusu003" c="MAIL_USU" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisusu003" c="MAIL_USU" lit="9905728"/></b> <%-- Delegación --%>
                                            </td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axisusu003" c="TELFUSU" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisusu003" c="TELFUSU" lit="9000992"/></b>
                                            </td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axisusu003" c="NNUMIDE" dejarHueco="false">
			                        		<td class="titulocaja">
			                                	<b><axis:alt f="axisusu003" c="LIT_SPERSON" lit="9901375"/></b><!-- Document -->                                
			                        		</td>
			                        		<td></td>
			                    			</axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:visible c="MAIL_USU" f="axisusu003">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="MAIL_USU" name="MAIL_USU" size="15"
                                                style="width:85.3%"  value="${__formdata.MAIL_USU}" title="<axis:alt f="axisusu003" c="MAIL_USU" lit="9905728"/>"/>
                                            </td>
                                            </axis:visible>
                                            
                                            <axis:visible c="TELFUSU" f="axisusu003">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="TELFUSU" name="TELFUSU" size="15"
                                                       style="width:85.3%"  value="${__formdata.TELFUSU}" title="<axis:alt f="axisusu003" c="TELFUSU" lit="9000992"/>"/>
                                            </td>
                                            </axis:visible>
                                            
                                             <axis:ocultar f="axisusu003" c="NNUMIDE" dejarHueco="false">
						                        <td class="campocaja">
						                            <input type="text" name="NNUMIDE" id="NNUMIDE" value="${__formdata.NNUMIDE}" class="campowidthinput campo campotexto_ob" style="width:85.3%" title="<axis:alt f="axisusu003" c="NNUMIDE_ALT" lit="9901375"/>"
						                            <axis:atr f="axisusu003" c="NNUMIDE" a="modificable=false&obligatorio=false"/> /> 
						                            
						                            <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisper021()" style="cursor:pointer"/>  
						                           
						                        </td>
						                    </axis:ocultar>
						                    <axis:ocultar f="axisusu003" c="NOMBRE" dejarHueco="false">
						                        <td class="campocaja" colspan="3">
						                            <input type="text" name="NOMBRE" id="NOMBRE" value="${__formdata.NOMBRE}" class="campowidthinput campo campotexto_ob" style="width:90%" title="<axis:alt f="axisusu003" c="NOMBRE_ALT" lit="9901375"/>"
						                            <axis:atr f="axisusu003" c="NOMBRE" a="modificable=false&obligatorio=false"/> /> 
						                        </td>                        
						                    </axis:ocultar> 
                                            
                                        </tr> 
                                        <axis:visible c="UNIDEPT" f="axisusu003">
                                        <tr>
                                        	<td class="titulocaja" colspan="2">
                                                <b><axis:alt f="axisusu003" c="DELEGACION_TIT" lit="9902610"/></b> <%-- Delegación --%>
                                            </td>   
                                            <td class="titulocaja" colspan="2">
                                                <b><axis:alt f="axisusu003" c="DELEGACION_TIT" lit="9908901"/></b> <%-- Delegación --%>
                                            </td>   
                                        </tr>
                                        <tr>
                                        
	                                        <td class="campocaja" colspan=2">
	                                            <select class="campowidthselect campo campotexto" id="LSTDEPART" name="LSTDEPART" size="1"
	                                            style="width:91.2%"  <c:if test="${!empty __formdata.FBAJA}">disabled</c:if>  obligatorio="true" title="<axis:alt f="axisusu003" c="UNIDEPT" lit="9902610"/>"/>
	                                                <option  value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisusu003" c="DELEGACION_VALOR" lit="1000348"/> - </option>
	                                                <c:forEach items="${__formdata.LSTVALORES.LSTDEPART}" var="item">
	                                                    <option value="${item.CATRIBU}" <c:if test="${item.CATRIBU  == __formdata.UNIDEPT}">selected</c:if>>${item.TATRIBU}</option>
	                                                </c:forEach>                                                
	                                            </select>
	                                        </td>
	                                        <td class="campocaja" colspan=2">
	                                             <select class="campowidthselect campo campotexto" id="LSTJOBT" name="LSTJOBT" size="1"
	                                             style="width:91.2%"  <c:if test="${!empty __formdata.FBAJA}">disabled</c:if>  obligatorio="true" title="<axis:alt f="axisusu003" c="CATEGPROF" lit="9908901"/>"/>
	                                                 <option  value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisusu003" c="DELEGACION_VALOR" lit="1000348"/> - </option>
	                                                 <c:forEach items="${__formdata.LSTVALORES.LSTJOBT}" var="item">
	                                                     <option value="${item.CATRIBU}" <c:if test="${item.CATRIBU  == __formdata.CATEGPROF}">selected</c:if>>${item.TATRIBU}</option>
	                                                 </c:forEach>                                                
	                                             </select>
	                                         </td>
	                                     </axis:visible>    
                                         </tr>

                                    </table>
                                </td>
                            </tr>
                        </table>
                        <div class="separador">&nbsp;</div>                        
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisusu003" c="DATOS_CONEXION_TIT" lit="1000094"/></div>
                        <!-- Sección Datos Conexión -->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área Datos Conexión -->
                                    <table class="area">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>

                                            <td class="titulocaja">
                                                <b><axis:alt f="axisusu003" c="NUEVA_PALABRA_CLAVE_TIT" lit="1000308"/></b>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisusu003" c="CONFIRMAR_PALABRA_CLAVE_TIT" lit="1000089"/></b>
                                            </td>
                                            <axis:ocultar f="axisusu003" c="CAUTLOG" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisusu003" c="AUTOLOGIN_TIT" lit="9900797"/></b> <!-- Autologin -->
                                            </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <td class="campocaja">
                                                <input type="hidden" class="campowidthinput campo campotexto" id="TPWD" name="TPWD" size="15"
                                                style="width:80%"  <c:if test="${!empty __formdata.FBAJA}">readonly</c:if>  value="${__formdata.TPWD}"/>
                                            
                                                <input type="password"  <c:if test="${!empty __formdata.FBAJA}">readonly</c:if>  class="campowidthinput campo campotexto" id="NEWPWD" name="NEWPWD" size="15"
                                                style="width:80%" value="${__formdata.NEWPWD}"/>
                                            </td>
                                            <td class="campocaja">
                                                <input type="password"  <c:if test="${!empty __formdata.FBAJA}">readonly</c:if>  class="campowidthinput campo campotexto" id="NEWPWD_CONFIRMACION" name="NEWPWD_CONFIRMACION" size="15"
                                                style="width:80%" value="${__formdata.NEWPWD_CONFIRMACION}"/>
                                            </td>
                                            <axis:ocultar f="axisusu003" c="CAUTLOG" dejarHueco="false">
                                            <td>
                                                <input <c:if test="${__formdata.CAUTLOG == 1}">checked</c:if> onclick="f_seleccionar_autologin()" <axis:atr f="axisusu003" c="CAUTLOG" a="modificable=true&isInputText=false"/>
                                                type="checkbox" name="CAUTLOG" id="CAUTLOG"  />
                                            </td>
                                            </axis:ocultar>
                                        </tr> 
                                        
                                        <axis:visible c="CROL" f="axisusu003">    
                                            <tr>
                                                <td class="titulocaja" colspan="2">
                                                    <b><axis:alt f="axisusu003" c="CROL" lit="9901939"/></b> 
                                                </td>                                            
                                            </tr>
                                            <tr>
                                                <td class="campocaja" colspan="2">
                                                    <select class="campowidthselect campo campotexto"   <c:if test="${!empty __formdata.FBAJA}">disabled</c:if>  id="CROL" name="CROL" size="1"
                                                    style="width:91.4%" obligatorio="true" title="<axis:alt f="axisusu003" c="CROL" lit="9901939"/>"/>
                                                        <option value="null"> - <axis:alt f="axisusu003" c="MIN_VALUE" lit="1000348"/> - </option>
                                                        <c:forEach items="${__formdata.LSTVALORES.LSTROL}" var="item">
                                                            <option value="${item.CROL}" <c:if test="${item.CROL  == __formdata.CROL}">selected</c:if>>${item.TROL}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>                                                 
                                            </tr>
                                        </axis:visible>
                                        
                                        <axis:visible c="NOCROL" f="axisusu003">    
                                            <tr>
                                                <td class="titulocaja" colspan="2">
                                                    <b><axis:alt f="axisusu003" c="NAVEGACION_TIT" lit="9000593"/></b> <%-- Navegación --%>
                                                </td>
                                                
                                                <td class="titulocaja" colspan="2">
                                                    <b><axis:alt f="axisusu003" c="PANTALLAS_TIT" lit="9000592"/></b> <%-- Pantalles --%>
                                                </td>                                                
                                            </tr>
                                            <tr>
                                                <td class="campocaja" colspan="2">
                                                    <select class="campowidthselect campo campotexto"   <c:if test="${!empty __formdata.FBAJA}">disabled</c:if>  id="CCFGFORM" name="CCFGFORM" size="1"
                                                    style="width:91.4%" obligatorio="true" title="<axis:alt f="axisusu003" c="PANTALLAS" lit="9000593"/>"/>
                                                        <option value="null"> - <axis:alt f="axisusu003" c="PANTALLAS_VALOR" lit="1000348"/> - </option>
                                                        <c:forEach items="${__formdata.LSTVALORES.LSTFORM}" var="item">
                                                            <option value="${item.CODIGO}" <c:if test="${item.CODIGO  == __formdata.CCFGFORM}">selected</c:if>>${item.VALOR}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>                                                 
    
                                                <td class="campocaja" colspan="2">
                                                    <select class="campowidthselect campo campotexto" id="CCFGWIZ" name="CCFGWIZ" size="1"
                                                    style="width:91.4%"  <c:if test="${!empty __formdata.FBAJA}">disabled</c:if>  obligatorio="true" title="<axis:alt f="axisusu003" c="NAVEGACION" lit="9000592"/>"/>
                                                        <option value="null"> - <axis:alt f="axisusu003" c="NAVEGACION_VALOR" lit="1000348"/> - </option>
                                                        <c:forEach items="${__formdata.LSTVALORES.LSTWIZARD}" var="item">
                                                            <option value="${item.CODIGO}" <c:if test="${item.CODIGO  == __formdata.CCFGWIZ}">selected</c:if>>${item.VALOR}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
    
                                            </tr>
                                            <tr>
                                                <td class="titulocaja" colspan="2">
                                                    <b><axis:alt f="axisusu003" c="MENU_TIT" lit="9000595"/></b> <%-- Menú --%>
                                                </td>                                                
                                                
                                                <td class="titulocaja" colspan="2">
                                                    <b><axis:alt f="axisusu003" c="ACCIONES_TIT" lit="9000594"/></b> <%-- Accions --%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="campocaja" colspan="2"> 
                                                    <select class="campowidthselect campo campotexto" id="CROLMEN" name="CROLMEN" size="1"
                                                    style="width:91.4%"  <c:if test="${!empty __formdata.FBAJA}">disabled</c:if>  obligatorio="true" title="<axis:alt f="axisusu003" c="MENU" lit="9000595"/>"/>
                                                        <option value="null"> - <axis:alt f="axisusu003" c="MENU_VALOR" lit="1000348"/> - </option>
                                                        <c:forEach items="${__formdata.LSTVALORES.LSTMENU}" var="item">
                                                            <option value="${item.CODIGO}" <c:if test="${item.CODIGO  == __formdata.CROLMEN}">selected</c:if>>${item.VALOR}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>                                                
                                                
                                                <td class="campocaja" colspan="2">
                                                    <select class="campowidthselect campo campotexto" id="CCFGACC" name="CCFGACC" size="1"
                                                    style="width:91.4%"  <c:if test="${!empty __formdata.FBAJA}">disabled</c:if>  obligatorio="true" title="<axis:alt f="axisusu003" c="ACCIONES" lit="9000594"/>"/>
                                                        <option value="null"> - <axis:alt f="axisusu003" c="ACCIONES_VALOR" lit="1000348"/> - </option>
                                                        <c:forEach items="${__formdata.LSTVALORES.LSTACCION}" var="item">
                                                            <option value="${item.CODIGO}" <c:if test="${item.CODIGO  == __formdata.CCFGACC}">selected</c:if>>${item.VALOR}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </tr>                                        
                                            
                                            <tr>
                                                <td class="titulocaja" colspan="2">
                                                    <b><axis:alt f="axisusu003" c="SUPLEMENTOS_TIT" lit="104752"/></b> <%-- Suplements --%>
                                                </td>                                            
                                                
                                                <axis:visible c="CCFGDOC" f="axisusu003">                                            
                                                <td class="titulocaja" colspan="2">
                                                    <b><axis:alt f="axisusu003" c="DOCUMENTACION_TIT" lit="1000431"/></b> <%-- Documentació --%>
                                                </td>                                                                          
                                                </axis:visible>
                                            </tr>
                                            <tr>                                        
                                                <td class="campocaja" colspan="2">
                                                    <select class="campowidthselect campo campotexto" id="CCONSUPL" name="CCONSUPL" size="1"
                                                    style="width:91.4%"  <c:if test="${!empty __formdata.FBAJA}">disabled</c:if> title="<axis:alt f="axisusu003" c="SUPLEMENTOS" lit="104752"/>"/>
                                                        <option value="null"> - <axis:alt f="axisusu003" c="SUPLEMENTOS_VALOR" lit="1000348"/> - </option>
                                                        <c:forEach items="${__formdata.LSTVALORES.LSTSUPL}" var="item">
                                                            <option value="${item.CCONSUPL}" <c:if test="${item.CCONSUPL  == __formdata.CCONSUPL}">selected</c:if>>${item.TCONSUPL}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>        
    
                                                <axis:visible c="CCFGDOC" f="axisusu003">
                                                <td class="campocaja" colspan="2">
                                                    <select class="campowidthselect campo campotexto" id="CCFGDOC" name="CCFGDOC" size="1"
                                                    style="width:91.4%"  <c:if test="${!empty __formdata.FBAJA}">disabled</c:if> title="<axis:alt f="axisusu003" c="DOCUMENTACION" lit="1000431"/>"/>
                                                        <option value="null"> - <axis:alt f="axisusu003" c="DOCUMENTACION_VALOR" lit="1000348"/> - </option>
                                                        <c:forEach items="${__formdata.LSTVALORES.LSTDOC}" var="item">
                                                            <option value="${item.CODIGO}" <c:if test="${item.CODIGO  == __formdata.CCFGDOC}">selected</c:if>>${item.VALOR}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>                                                 
                                                </axis:visible>
                                            </tr>
                                            
                                            <tr>
                                                <axis:visible c="CACCPROD" f="axisusu003">                                            
                                                <td class="titulocaja" colspan="2">
                                                    <b><axis:alt f="axisusu003" c="ACCESO_PRODUCTOS_TIT" lit="9901611"/></b> <%-- Acceso Productos --%>
                                                </td>                                                                          
                                                </axis:visible>
                                                 <axis:visible c="CACCPSU" f="axisusu003">                                            
                                                <td class="titulocaja" colspan="2">
                                                    <b><axis:alt f="axisusu003" c="ACCESO_PSU_TIT" lit="9906151"/></b> <%-- Acceso Psu --%>
                                                </td>                                                                          
                                                </axis:visible>
                                            </tr>
                                            <tr>                                        
                                                <axis:visible c="CACCPROD" f="axisusu003">
                                                <td class="campocaja" colspan="2">
                                                    <select class="campowidthselect campo campotexto" id="CACCPROD" name="CACCPROD" size="1"
                                                    style="width:91.4%"  <c:if test="${!empty __formdata.FBAJA}">disabled</c:if> title="<axis:alt f="axisusu003" c="ACCESO_PRODUCTOS" lit="9901611"/>"/>
                                                        <option value="null"> - <axis:alt f="axisusu003" c="ACCESO_PRODUCTOS_VALOR" lit="1000348"/> - </option>
                                                        <c:forEach items="${__formdata.LSTVALORES.LSTACCPROD}" var="item">
                                                            <option value="${item.CODIGO}" <c:if test="${item.CODIGO  == __formdata.CACCPROD}">selected</c:if>>${item.VALOR}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                                </axis:visible>
                                                <axis:visible c="CACCPSU" f="axisusu003">
                                                <td class="campocaja" colspan="2">
                                                    <select class="campowidthselect campo campotexto" id="CACCPSU" name="CACCPSU" size="1"
                                                    style="width:91.4%"  <c:if test="${!empty __formdata.FBAJA}">disabled</c:if> title="<axis:alt f="axisusu003" c="PSU" lit="9906151"/>"/>
                                                        <option value="null"> - <axis:alt f="axisusu003" c="PSU" lit="1000348"/> - </option>
                                                        <c:forEach items="${__formdata.LSTVALORES.LSTPSU}" var="item">
                                                            <option value="${item.CUSUAGRU}" <c:if test="${item.CUSUAGRU  == __formdata.CUSUAGRU}">selected</c:if>>${item.TUSUAGRU}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>                                                 
                                                </axis:visible>
                                            </tr>
                                        </axis:visible>
                                               
                                            </tr>
                                             <tr>
                                               <axis:visible c="CCFGMAP" f="axisusu003">                                            
                                                <td class="titulocaja" colspan="2">
                                                    <b><axis:alt f="axisusu003" c="MAP_TIT" lit="108525"/></b> <%-- Informes --%>
                                                </td>                                                                          
                                                </axis:visible>
                                            </tr>
                                            <tr> 
                                                
                                         <axis:visible c="CCFGMAP" f="axisusu003">
                                                <td class="campocaja" colspan="2">
                                                    <select class="campowidthselect campo campotexto" id="CCFGMAP" name="CCFGMAP" size="1"
                                                    style="width:91.4%"  <c:if test="${!empty __formdata.FBAJA}">disabled</c:if> title="<axis:alt f="axisusu003" c="MAP" lit="108525"/>"/>
                                                        <option value="null"> - <axis:alt f="axisusu003" c="MAP_VALOR" lit="1000348"/> - </option>
                                                        <c:forEach items="${__formdata.LSTVALORES.LSTMAP}" var="item">
                                                            <option value="${item.CODIGO}" <c:if test="${item.CODIGO  == __formdata.CCFGMAP}">selected</c:if>>${item.VALOR}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>                                                 
                                                </axis:visible>
                                    </table>
                                </td>
                            </tr>
                        </table>            
                        <!-- INI IAXIS-4994 -->
                        <div class="separador">&nbsp;</div>                        
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisusu003" c="DATOS_MARCAS" lit="89908084"/></div>
                        <!-- Sección Configuración Marcas -->
                        <table class="seccion">
                        	<tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>
                             <!-- ***  lista areas ***-->
                             <td>
                                 <axis:visible c="SPROD_LISTA" f="axisusu003">
                                     <input type="hidden" name="CATRIBU" id="CATRIBU"/>
                                     <input type="hidden" name="LISTAPR" id="LISTAPR"/>
                                     <c:set var="title0"><axis:alt f="axisusu003" c="SPROD_LISTA" lit="89908000"/></c:set>
                                     <div id="dt_productos" class="seccion displayspace">
                                      
                                       <%int contador = 0;%>
                                         <display:table name="${sessionScope.LST_AREAS}" id="miLstAreas"  export="false" class="dsptgtable" pagesize="-1" defaultsort="-1" defaultorder="ascending"  sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="modal_axisusu003.do?paginar=true">
                                          
                                                                        
                                             <%@ include file="../include/displaytag.jsp"%>
                                             <display:column headerClass="headwidth5 sortable fixed" title="" media="html" autolink="false" sortable="false">
                                             <div class="dspIcons">
                                                 <input <c:if test="${!empty sessionScope.CCFGMARCA && sessionScope.CCFGMARCA.contains(''.concat(miLstAreas['CMARCA']))}">checked</c:if> 
                                                 onclick=""
                                                      type="checkbox" name="checkArea_<%=contador%>" <c:if test="${!empty __formdata.FBAJA}">disabled</c:if> id="checkArea_<%=contador%>"/>
                                                 </div>                                                 
                                             </display:column>                                            
                                             <display:column title="${title0}" sortable="true" sortProperty="TITULO" headerClass="sortable fixed"  media="html" autolink="false" >
                                                 <div class="dspText">${miLstAreas['DESCRIPCION']}</div>
                                                 <input type="hidden" id="CMARCA_<%=contador%>" name="CATRIBU_<%=contador%>" value="${miLstAreas['CMARCA']}"/>
                                             </display:column>
                                             <%contador++;%>
                                         </display:table>                                    
                                     </div>                                                        
                                   </axis:visible>                                                  
                                 </td>
                             </tr>
                        </table>  
                        <!-- FIN IAXIS-4994 -->
			<!-- INI IAXIS-15078 -->
					<div class="separador">&nbsp;</div>
					<div class="titulo">
						<img src="images/flecha.gif" />
						<axis:alt f="axisusu003" c="INF_ESPECIALES" lit="89908104" />
					</div> <!-- Sección Configuración Marcas -->
					<table class="seccion">
						<tr>
							<th style="width: 25%; height: 0px"></th>
							<th style="width: 25%; height: 0px"></th>
							<th style="width: 25%; height: 0px"></th>
							<th style="width: 25%; height: 0px"></th>
						</tr>
						<tr>
							<!-- ***  lista Informes especiales ***-->
							<td><axis:visible c="SPROD_LISTA" f="axisusu003">
									<input type="hidden" name="CATRIBU" id="CATRIBU" />
									<input type="hidden" name="LISTAPR" id="LISTAPR" />
									<c:set var="title0">
										<axis:alt f="axisusu003" c="SPROD_LISTA" lit="9000569" />
									</c:set>
									<div id="dt_productos" class="seccion displayspace">
										<% int contador2 = 0; %>
										<display:table name="${__formdata.LSTVALORES.LSTINF}" id="miLstInfEsp"
											export="false" class="dsptgtable" pagesize="-1"
											defaultsort="-1" defaultorder="ascending" sort="list"
											cellpadding="0" cellspacing="0"
											requestURI="modal_axisusu003.do?paginar=true">


											<%@ include file="../include/displaytag.jsp"%>
											<display:column headerClass="headwidth5 sortable fixed"
												title="" media="html" autolink="false" sortable="false">
												<div class="dspIcons">
													<input <c:if test="${!empty sessionScope.CCFGINFESP && sessionScope.CCFGINFESP.contains(''.concat(miLstInfEsp['CODIGO']))}">checked</c:if>
														onclick="" type="checkbox" name="checkInfEsp_<%=contador2%>"
														id="checkInfEsp_<%=contador2%>" />
												</div>
											</display:column>
											<display:column title="${title0}" sortable="true"
												sortProperty="TITULO" headerClass="sortable fixed"
												media="html" autolink="false">
												<div class="dspText">${miLstInfEsp['VALOR']}</div>
												<input type="hidden" id="CINFESP_<%=contador2%>"
													name="CINFESP_<%=contador2%>"
													value="${miLstInfEsp['CODIGO']}" />
											</display:column>
											<%
												contador2++;
											%>
										</display:table>
									</div>
								</axis:visible></td>
						</tr>
					</table> <!-- FIN IAXIS-15078 -->
                    </td>
                </tr>
            </table>
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisusu003</c:param>
                <c:param name="__botones">cancelar<c:if test="${empty __formdata.FBAJA}">,aceptar</c:if><c:if test="${empty __formdata.FBAJA && !empty __formdata.CUSUARI && empty __formdata.isNewUser}">,9000657</c:if><c:if test="${!empty __formdata.FBAJA}">,9000656</c:if>  </c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>
