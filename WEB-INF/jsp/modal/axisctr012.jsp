<%/* Revision:# FIzdjeRF8L15d0qaf02IXA== # */%>
<%/*
*  Fichero: axisctr012.jsp
*/
%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.Map"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">    
        <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"></style>
        <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">
    
        function f_onload() {
        	 <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
							retocarPAGE_CSS('axisctr012');
					</c:if>
            var pantallaasaltar = "${__formdata.saltarpantalla}";
             if (!objUtiles.estaVacio(pantallaasaltar) ){
                    cpregun = "${__formdata.CPREGUN}";
                    tpregun = "${__formdata.TPREGUN}";
                    objUtiles.abrirModal("axisctr188", "src", "modal_axisctr188.do?operation=init&CPREGUN=" + cpregun+"&TPREGUN="+tpregun+"&TIPO_PREGUNTA=G&CGARANT="+document.miForm.selectedGarantia.value);
            }
              if (objUtiles.estaVacio(pantallaasaltar) ){
		            <c:if test="${guardarCambios_sin_errores}"><%-- 9284?20090227?ecg --%>
		                try { parent.f_disabled_but_siguiente(true); } catch(err) {}
		                parent.f_cerrar_axisctr012();
		            </c:if>
          }

            objDom.setDisplayPorId("but_buscar", "none");
            // Retocar tabla en IE
            if (document.all) // ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";
                
            f_cargar_propiedades_pantalla();   
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_axisctr012();
        }
        
         function f_cerrar_modal (pform) {
            objUtiles.cerrarModal(pform);
            objUtiles.ejecutarFormulario("modal_axisctr012.do", "form", document.miForm, "_self", objJsMessages.jslit_actualizando_garantias);
          }
        
        function f_onblur_respuestas (obj, title) {
            //alert("Valor****"+obj.value+"***");
            if (objUtiles.estaVacio(obj.value) && obj.value!=null && obj.value!='') {
                alert("- " + objJsMessages.jslit_campo_validador + " '" + title + "' : " + objJsMessages.jslit_campo_obligatorio + ".");
                // obj.focus();
            }
        }
        
        function f_onblur_respuestas_numericas (obj, title, obligatorio) {
            //alert("Valor****"+obj.value+"***");
			
			var SPRODUC = "${__formdata.SPRODUC}";//bartolo
			
            if ((objUtiles.estaVacio(obj.value) && obj.value!=null && obj.value!='' ) && obligatorio){
                alert("- " + objJsMessages.jslit_campo_validador + " '" + title + "' : " + objJsMessages.jslit_campo_obligatorio + ".");
            }else{
/*
     BUG9496-20052009-XVM: Es posa aquesta part per saber si la resposta de la pregunta num�rica �s realment un n?mero. Tamb�, es treu 
                           la validaci? que es fa pel formateig ja que no ens interesa fer aquesta validaci? i aixi permetre l'introducci?
                           de n?meros amb m�s de 2 decimals i sense redondeig.
            
*/            if( !objUtiles.estaVacio(obj.value) && obj.value!=null && obj.value!='' ){   //lcf validaciones numericas
                var isnumerico=objNumero.validaNumero(obj.value,true);
				
			
				// INI AMANTIUM 20/05/2022 - IAXIS-16639
				//if (!isnumerico && (SPRODUC != "8062" && SPRODUC != "8063" && SPRODUC != "80004" && SPRODUC != "80005" && SPRODUC != "80006" && SPRODUC != "80008" && SPRODUC != "80010" && SPRODUC != "80041" && SPRODUC != "80042" && SPRODUC != "80043" && SPRODUC != "80038")){//bartolo
                // INI AMANTIUM 09/02/2023 - DDYA-11
                //if (!isnumerico && (SPRODUC != "8062" && SPRODUC != "8063" && SPRODUC != "80004" && SPRODUC != "80005" && SPRODUC != "80006" && SPRODUC != "80008" && SPRODUC != "80010" && SPRODUC != "80041" && SPRODUC != "80042" && SPRODUC != "80043" && SPRODUC != "80038" && SPRODUC != "80049" && SPRODUC != "80050")){
                if (!isnumerico && (SPRODUC != "8062" && SPRODUC != "8063" && SPRODUC != "80004" && SPRODUC != "80005" && SPRODUC != "80006" && SPRODUC != "80008" && SPRODUC != "80010" && SPRODUC != "80041" && SPRODUC != "80042" && SPRODUC != "80043" && SPRODUC != "80038" && SPRODUC != "80049" && SPRODUC != "80050" && SPRODUC != "80051" && SPRODUC != "80052")){
                // FIN AMANTIUM 09/02/2023 - DDYA-11
				// FIN AMANTIUM 20/05/2022 - IAXIS-16639
                   alert("- " + objJsMessages.jslit_campo_validador + " '" + title + "' : " + objJsMessages.jslit_formato_numero_incorrecto_validador + ". " 
                              + objJsMessages.jslit_se_esperaba + " " +  objJsMessages.jslit_un_numero_decimal + ".");        

                   var id = obj.name;
                   eval("document.miForm."+id).blur();
                   }                      
                }
              }
        }
        
        function f_but_aceptar() {
            // Llamada para actualizar los valores de la pantalla
            if (objValidador.validaEntrada()) {
                f_habilitar_campos()
                objUtiles.ejecutarFormulario("modal_axisctr012.do", "guardarCambios", document.miForm, "_self");
            }
        }
        function f_abrir_188(cpregun,tpregun,ctabla) {
            if (!objUtiles.estaVacio(ctabla) && ctabla == 1){ 
             var SSEGURO = "${SSEGURO}";
             var NMOVIMI = "${NMOVIMI}";
             var NRIESGO = "${NRIESGO}";  
            objUtiles.abrirModal("axisctr218", "src", "modal_axisctr218.do?operation=init&CPREGUN=" + cpregun+"&TPREGUN="+tpregun+"&TIPO_PREGUNTA=G&CTABLA=EST&SSEGURO="+SSEGURO+"&NRIESGO="+NRIESGO+"&NMOVIMI="+NMOVIMI+"&CGARANT="+document.miForm.selectedGarantia.value);
        }else
             objUtiles.ejecutarFormulario("modal_axisctr012.do?saltarpantalla=axisctr188&CPREGUN=" + cpregun+"&TPREGUN="+tpregun+"&TIPO_PREGUNTA=G&CGARANT="+document.miForm.selectedGarantia.value, "guardarCambios", document.miForm, "_self");
        }
        
        function f_aceptar_axisctr218(){
            objUtiles.cerrarModal("axisctr218");
            objUtiles.ejecutarFormulario("modal_axisctr012.do", "form", document.miForm, "_self", objJsMessages.jslit_actualizando_garantias);
        }
        
        function f_sincarga(cpregun,tpregun){
            objUtiles.cerrarModal("axisctr218");
            objUtiles.ejecutarFormulario("modal_axisctr012.do?saltarpantalla=axisctr188&CPREGUN=" + cpregun+"&TPREGUN="+tpregun+"&TIPO_PREGUNTA=G&CGARANT="+document.miForm.selectedGarantia.value, "guardarCambios", document.miForm, "_self");
       
        }
        
        function f_habilitar_campos(){
            var checkboxs = document.getElementsByTagName("input");//mirem els checkbox
            var selects = document.getElementsByTagName("select");
           // var checkboxs = document.getElementsByTagName("checkbox");
            for(var i=0;i<selects.length;i++){
                if(selects[i].attributes.length>0) {
                   var selectId = selects[i].getAttribute("id");
                     try{
                         if (document.getElementById(selectId).style.visibility != 'hidden' ){
                             if(selects[i].getAttribute("type") != "button"  &&
                                objDom.estaDisabled(selectId))
                                    objDom.setDisabledPorId(selectId,false);
                         }
                     }catch(e){}
                }
            }
             for(var i=0;i<checkboxs.length;i++){
                if(checkboxs[i].attributes.length>0) {
                   var checkboxsId = checkboxs[i].getAttribute("id");
                    if(document.getElementsByTagName("input")[i].type == "checkbox"){
                    
                     try{
                         if (document.getElementById(checkboxsId).style.visibility != 'hidden' ){
                             if(checkboxs[i].getAttribute("type") != "button"  &&
                                objDom.estaDisabled(checkboxsId))
                                    objDom.setDisabledPorId(checkboxsId,false);
                         }
                     }catch(e){}
                     }
                }
            }
        }
    
    </script>
  </head>
    <body class=" " onload="f_onload()">
    	<div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisctr012" c="LIT_1000573" lit="1000573" /></c:param>
            <c:param name="nid" value="axisediciontexto" />
        </c:import>      
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisctr188" c="TITULO_DET" lit="9901369" /></c:param>
            <c:param name="nid" value="axisctr188" />
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisctr218" c="TITULO_DET" lit="9901369" /></c:param>
            <c:param name="nid" value="axisctr218" />
        </c:import>
           
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" id="respuestas" name="respuestas" value=""/>          
            <input type="hidden" id="selectedGarantia" name="selectedGarantia" value="${__formdata.selectedGarantia}"/>
            <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>
            <input type="hidden" id="NRIESGO" name="NRIESGO" value="${__formdata.NRIESGO}"/>
            <input type="hidden" id="NMOVIMI" name="NMOVIMI" value="${__formdata.NMOVIMI}"/>
            <input type="hidden" id="MODPREGINNO" name="MODPREGINNO" value="${__formdata.modpreginno}"/>
			
			<input type="hidden" id="SPRODUC" name="SPRODUC" value="${__formdata.SPRODUC}"/>
			
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisctr012" c="LIT_1000186" lit="1000186" /></c:param>
                <c:param name="producto"><axis:alt f="axisctr012" c="LIT_1000186" lit="1000186" /></c:param>
                <c:param name="form">axisctr012</c:param>
            </c:import>
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr012" c="LIT_110994" lit="110994"/> ${sessionScope.axisctr_garantia.CGARANT}: ${sessionScope.axisctr_garantia.DESCRIPCION}</div>
                         <% int contador = 0; %>  
                           <c:if test="${!empty sessionScope.axisctr_preguntasGarantia}">
                           
                        <b><axis:alt c="LIT_PREGGARANT" f="axisctr012" lit="102299"/></b>
                         <axis:ocultar f="axisctr012" c="DSP_PREGUNTASGAR" dejarHueco="false"> 
                          <table class="seccion">
                            <tr>
                                <td>        
                                    <!-- DisplayTag preguntas -->
                                    <c:set var="title0"><axis:alt f="axisctr012" c="LIT_800440" lit="800440"/></c:set>
                                    <c:set var="title1"><axis:alt f="axisctr012" c="LIT_102738" lit="102738"/></c:set>
                                    <c:set var="title2"><axis:alt f="axisctr012" c="LIT_103712" lit="103712"/></c:set>
                          
                                    <div id="DSP_PREGUNTASGARANTIAS" class="displayspaceGrandeOver" style="visibility:hidden;height=400px;">&nbsp;</div>
                                    <div id="Dt_PREGUNTASGARANTIAS" >
                                    
                                    <div class="displayspaceGrande">  
                                        <display:table name="${sessionScope.axisctr_preguntasGarantia}" id="miListaIdPreguntas" export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="modal_axisctr012.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAXPAR_PREGUNTAS.CPREGUN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspNumber" >
                                            ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}</div>
                                        </display:column>
                                        <display:column title="${title1}" sortable="true" sortProperty="" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText" id="cpreguntexto_<%= contador %>">
                                                ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}
                                            </div>
                                           </display:column>
                                        <display:column title="${title2}" media="html" autolink="false" headerClass="headwidth20 sortable">
                                            <div class="dspIcons">
                                            <c:choose>
                                                <c:when test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP == '1'}"> 
                                              
                                                    <select  class="campowidthinput campo campotexto"   name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}" size="1" style="width:100%" title="<axis:alt f="axisctr012" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}"
													<axis:atr f="axisctr012" c="CRESPUEGAR" a="modificable=true&isInputText=false"/>													
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __formdata.modpreginno || __formdata.modpreginno == 0) && (empty __configform.axisctr012__DSP_PREGUNTASGAR__visible || __configform.axisctr012__DSP_PREGUNTASGAR__visible == 'true'))}"> disabled </c:if>
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __formdata.modpreginno || __formdata.modpreginno == 0))}"> obligatorio='true'</c:if></c:if>>
                                                    	<%--c:if test="${empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF}"--%> 
                                                       <option value="null"> - <axis:alt f="axisctr012" c="COMBO_SNV" lit="108341"/> - </option> 
                                                       <%--/c:if--%>
                                                        
                                                        <c:forEach items="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.RESPUESTAS}" var="respuesta">
                                                            <option value = "${respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE}" <c:if test="${(empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF==respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE ) ||respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE == miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}">selected</c:if>>  ${respuesta.OB_IAXPAR_RESPUESTAS.TRESPUE} </option>
                                                        </c:forEach>
                                                    </select>
                                                    <c:if test="${!empty __configform.axisctr012__CRESPUE__modificable && __configform.axisctr012__CRESPUE__modificable == 'false'}">
                                                     <c:forEach items="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.RESPUESTAS}" var="respuesta">
                                                        <c:if test="${(empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF==respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE ) ||respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE == miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}">
                                                            <input type="hidden" value="${respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE}" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}">
                                                         </c:if>
                                                    </c:forEach>
                                                    </c:if>
                                                </c:when>
                                                <c:when test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP == '2'}"> 
                                                    <input  xformato="decimal" type="text" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>"   pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                    <c:if test="${(empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && !empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF)}">value="<fmt:formatNumber pattern='###.#####' value='${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF}'/>"</c:if>

                                                        <c:if test="${!empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}">value="<fmt:formatNumber pattern='###.#####' value='${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}'/>"</c:if>                                                        
                                                        class="campowidthinput campo campotexto" title="<axis:alt f="axisctr012" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __formdata.modpreginno || __formdata.modpreginno == 0) && (empty __configform.axisctr012__DSP_PREGUNTASGAR__visible || __configform.axisctr012__DSP_PREGUNTASGAR__visible == 'true'))}"> obligatorio='true'  onblur="f_onblur_respuestas_numericas(this, '<axis:alt f="axisctr012" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}', true)"</c:if></c:if>
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL != '1'}"> <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __formdata.modpreginno || __formdata.modpreginno == 0) && (empty __configform.axisctr012__DSP_PREGUNTASGAR__visible || __configform.axisctr012__DSP_PREGUNTASGAR__visible == 'true'))}"> onblur="f_onblur_respuestas_numericas(this, '<axis:alt f="axisctr012" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}', false)"</c:if></c:if>
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __formdata.modpreginno || __formdata.modpreginno == 0) && (empty __configform.axisctr012__DSP_PREGUNTASGAR__visible || __configform.axisctr012__DSP_PREGUNTASGAR__visible == 'true'))}"> readonly="readonly" </c:if>>
                                                </c:when>
                                                <c:when test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP == '3'}"> 
                                                   <a href="javascript:f_abrir_188('${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}','${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}','${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CTABLA}');"> 
                                                       <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.PREGTABLA == 0}"> 
                                                            <%--img border="0" alt="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" title="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" src="images/lapiz.gif"/--%>
                                                            <b><axis:alt f="axisctr012" c="INFORMAR" lit="9903703"/></b>
                                                       </c:if>
                                                       <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.PREGTABLA == 1}"> 
                                                            <%--img border="0" alt="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" title="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" src="images/lapiz.gif"/--%>
                                                            <b style="color:red"><axis:alt f="axisctr012" c="INFORMAR" lit="9903703"/></b>
                                                       </c:if>
                                                   </a>
                                                  </c:when>
                                                <c:otherwise>
                                                    <input  type="text" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                    value="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TRESPUE}"  class="campowidthinput campo campotexto" title="<axis:alt f="axisctr012" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __formdata.modpreginno || __formdata.modpreginno == 0) && (empty __configform.axisctr012__DSP_PREGUNTASGAR__visible || __configform.axisctr012__DSP_PREGUNTASGAR__visible == 'true'))}"> obligatorio='true' onblur="f_onblur_respuestas(this, '<axis:alt f="axisctr012" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}')"</c:if></c:if>
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __formdata.modpreginno || __formdata.modpreginno == 0) && (empty __configform.axisctr012__DSP_PREGUNTASGAR__visible || __configform.axisctr012__DSP_PREGUNTASGAR__visible == 'true'))}"> readonly="readonly" </c:if>>
                                                </c:otherwise>
                                            </c:choose>
                                            </div>
                                        </display:column>
                                      <c:if test="${__configform.axisctr012__DSP_PREGUNTASGAR__modificable != 'false'}">
                                        <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable" media="html" autolink="false">    
                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __formdata.modpreginno || __formdata.modpreginno == 0) && (empty __configform.axisctr012__DSP_PREGUNTASGAR__visible || __configform.axisctr012__DSP_PREGUNTASGAR__visible == 'true'))}">
                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP != '1' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP != '3'}"> <%-- Mostrar icono de l?piz si no es combo --%>
                                                <div class="dspIcons">
                                                    <c:set var="atributos" value=""/>
                                                    <c:choose>
                                                        <c:when test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP == '2'}"> <%-- Formato: decimal --%>
                                                            <c:set var="atributos" value="formato=-decimal-"/>        
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}">
                                                                <c:set var="atributos" value="obligatorio=-true- formato=-decimal-"/>        
                                                            </c:if>
                                                        </c:when>
                                                        <c:otherwise> <%-- Formato: alfanum�rico --%>
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}">
                                                                <c:set var="atributos" value="obligatorio=-true-"/>
                                                            </c:if>
                                                        </c:otherwise>                                    
                                                    </c:choose>
                                                    <a href="javascript:void(0)" onClick="objEdicionTexto.abrirEditorTexto('respuesta_<%= contador %>', document.getElementById('respuesta_<%= contador %>'), document.getElementById('cpreguntexto_<%= contador %>').innerText, '${atributos}');"> <img border="0" alt="<axis:alt f="axisctr012" c="EDITAR" lit="1000577"/>" title="<axis:alt f="axisctr012" c="EDITAR" lit="1000577"/>" src="images/lapiz.gif"/>
                                                    </a>
                                                </div>
                                            </c:if>
                                            </c:if>
                                        </display:column>
                                        </c:if>
                                    <% contador++; %>
                                    </display:table>
                                    
                                    </div>
                                </td>
                            </tr>
                        </table>
                        
                        </axis:ocultar>
                </c:if>
                <c:if test="${!empty sessionScope.axisctr_pregGarQuestSalut}">
                      <axis:ocultar f="axisctr012" c="DSP_PREGUNTASQUEST" dejarHueco="false"> 
                          <div>
                        <div class="separador">&nbsp;</div>
                        <b><axis:alt c="LIT_PREG_QUESTSALUT" f="axisctr012" lit="103672"/></b>
                           <table class="seccion">
                            <tr>
                                <td>                                
                                    <!-- DisplayTag preguntas -->
                                    <c:set var="title0"><axis:alt f="axisctr012" c="LIT_800440" lit="800440"/></c:set>
                                    <c:set var="title1"><axis:alt f="axisctr012" c="LIT_102738" lit="102738"/></c:set>
                                    <c:set var="title2"><axis:alt f="axisctr012" c="LIT_103712" lit="103712"/></c:set>
                                    
                                    <div id="DSP_PREGUNTASQUEST" class="displayspaceGrandeOver" style="visibility:hidden;height=400px;">&nbsp;</div>
                                    <div id="Dt_PREGUNTASQUEST" >
                                    
                                    <div class="displayspaceGrande">  
                                    
                                        <display:table name="${sessionScope.axisctr_pregGarQuestSalut}" id="miListaIdPreguntas" export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="modal_axisctr012.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAXPAR_PREGUNTAS.CPREGUN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspNumber" >
                                            ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}</div>
                                        </display:column>
                                        <display:column title="${title1}" sortable="true" sortProperty="" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText" id="cpreguntexto_<%= contador %>">
                                                ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}
                                            </div>
                                           </display:column>
                                        <display:column title="${title2}" media="html" autolink="false" headerClass="headwidth20 sortable">
                                            <div class="dspIcons">
                                            <c:choose>
                                                <c:when test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP == '1'}"> 
                                                    <select  class="campowidthinput campo campotexto"   name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}" size="1" style="width:100%" title="<axis:alt f="axisctr012" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                    <axis:atr f="axisctr012" c="CRESPUEQUEST" a="modificable=true&isInputText=false"/>
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr012__DSP_PREGUNTASQUEST__visible || __configform.axisctr012__DSP_PREGUNTASQUEST__visible == 'true'))}"> disabled </c:if>
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1')}"> obligatorio='true'</c:if></c:if>>
                                                    	<%--c:if test="${empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF}"--%> 
                                                       <option value="null"> - <axis:alt f="axisctr012" c="COMBO_SNV" lit="108341"/> - </option> 
                                                       <%--/c:if--%>
                                                        <c:forEach items="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.RESPUESTAS}" var="respuesta">
                                                            <option value = "${respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE}" <c:if test="${(empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF==respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE ) ||respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE == miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}">selected</c:if>>  ${respuesta.OB_IAXPAR_RESPUESTAS.TRESPUE} </option>
                                                        </c:forEach>
                                                    </select>
                                                    <c:if test="${!empty __configform.axisctr012__CRESPUEQUEST__modificable && __configform.axisctr012__CRESPUEQUEST__modificable == 'false'}">
                                                     <c:forEach items="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.RESPUESTAS}" var="respuesta">
                                                        <c:if test="${(empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF==respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE ) ||respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE == miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}">
                                                            <input type="hidden" value="${respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE}" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}">
                                                         </c:if>
                                                    </c:forEach>
                                                    </c:if>
                                                </c:when>
                                                <c:when test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP == '2'}"> 
                                                    <input  xformato="decimal" type="text" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                    <axis:atr f="axisctr012" c="CRESPUEQUEST" a="modificable=true&isInputText=true"/>
                                                    <c:if test="${(empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && !empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF)}">value="<fmt:formatNumber pattern='###.#####' value='${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF}'/>"</c:if>
                                                        <c:if test="${!empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}">value="<fmt:formatNumber pattern='###.#####' value='${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}'/>"</c:if>
                                                        class="campowidthinput campo campotexto" title="<axis:alt f="axisctr012" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr012__DSP_PREGUNTASQUEST__visible || __configform.axisctr012__DSP_PREGUNTASQUEST__visible == 'true'))}"> obligatorio='true' onblur="f_onblur_respuestas_numericas(this, '<axis:alt f="axisctr012" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}', true)"</c:if></c:if>
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL != '1'}"> <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr012__DSP_PREGUNTASQUEST__visible || __configform.axisctr012__DSP_PREGUNTASQUEST__visible == 'true'))}"> onblur="f_onblur_respuestas_numericas(this, '<axis:alt f="axisctr012" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}', false)"</c:if></c:if>
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr012__DSP_PREGUNTASQUEST__visible || __configform.axisctr012__DSP_PREGUNTASQUEST__visible == 'true'))}"> readonly="readonly" </c:if>>
                                                </c:when>
                                                <c:when test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP == '3'}"> 
                                                   <a href="javascript:f_abrir_188('${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}','${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}','${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CTABLA}'));"> 
                                                       <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.PREGTABLA == 0}"> 
                                                            <%--img border="0" alt="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" title="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" src="images/lapiz.gif"/--%>
                                                            <b><axis:alt f="axisctr012" c="INFORMAR" lit="9903703"/></b>
                                                       </c:if>
                                                       <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.PREGTABLA == 1}"> 
                                                            <%--img border="0" alt="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" title="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" src="images/lapiz.gif"/--%>
                                                            <b style="color:red"><axis:alt f="axisctr012" c="INFORMAR" lit="9903703"/></b>
                                                       </c:if>
                                                   </a>
                                                  </c:when>
                                                <c:otherwise>
                                                    <input  type="text" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                    <axis:atr f="axisctr012" c="CRESPUEQUEST" a="modificable=true&isInputText=true"/>
                                                    value="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TRESPUE}"  class="campowidthinput campo campotexto" title="<axis:alt f="axisctr012" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr012__DSP_PREGUNTASQUEST__visible || __configform.axisctr012__DSP_PREGUNTASQUEST__visible == 'true'))}"> obligatorio='true' onblur="f_onblur_respuestas(this, '<axis:alt f="axisctr012" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}')"</c:if></c:if>
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr012__DSP_PREGUNTASQUEST__visible || __configform.axisctr012__DSP_PREGUNTASQUEST__visible == 'true'))}"> readonly="readonly" </c:if>>
                                                </c:otherwise>
                                            </c:choose>
                                            </div>
                                        </display:column>
                                      <c:if test="${__configform.axisctr012__DSP_PREGUNTASQUEST__modificable != 'false'}">
                                        <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable" media="html" autolink="false">    
                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr012__DSP_PREGUNTASQUEST__visible || __configform.axisctr012__DSP_PREGUNTASQUEST__visible == 'true'))}">
                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP != '1'}"> <%-- Mostrar icono de l?piz si no es combo --%>
                                                <div class="dspIcons">
                                                    <c:set var="atributos" value=""/>
                                                    <c:choose>
                                                        <c:when test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP == '2'}"> <%-- Formato: decimal --%>
                                                            <c:set var="atributos" value="formato=-decimal-"/>        
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}">
                                                                <c:set var="atributos" value="obligatorio=-true- formato=-decimal-"/>        
                                                            </c:if>
                                                        </c:when>
                                                        <c:otherwise> <%-- Formato: alfanum�rico --%>
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}">
                                                                <c:set var="atributos" value="obligatorio=-true-"/>
                                                            </c:if>
                                                        </c:otherwise>                                    
                                                    </c:choose>
                                                    <a href="javascript:void(0)" onClick="objEdicionTexto.abrirEditorTexto('respuesta_<%= contador %>', document.getElementById('respuesta_<%= contador %>'), document.getElementById('cpreguntexto_<%= contador %>').innerText, '${atributos}');"> <img border="0" alt="<axis:alt f="axisctr012" c="EDITAR" lit="1000577"/>" title="<axis:alt f="axisctr012" c="EDITAR" lit="1000577"/>" src="images/lapiz.gif"/>
                                                    </a>
                                                </div>
                                            </c:if>
                                            </c:if>
                                        </display:column>
                                        </c:if>
                                    <% contador++; %>
                                    </display:table>
                                    </div>
                                </td>
                            </tr>
                        </table>
						</div>
                    </axis:ocultar>
                </c:if>

                <c:if test="${!empty sessionScope.axisctr_pregGarDespeses}">
                    <!--campos-->
                    <axis:ocultar f="axisctr012" c="DSP_PREGUNTASDESPESES" dejarHueco="false"> 
                     
                    <div class="separador">&nbsp;</div>
                    <b><axis:alt c="LIT_PREG_DESPESES" f="axisctr012" lit="9001509"/></b>
                          <table class="seccion">
                            <tr>
                                <td>                                
                                    <!-- DisplayTag preguntas -->
                                    <c:set var="title0"><axis:alt f="axisctr012" c="LIT_800440" lit="800440"/></c:set>
                                    <c:set var="title1"><axis:alt f="axisctr012" c="LIT_102738" lit="102738"/></c:set>
                                    <c:set var="title2"><axis:alt f="axisctr012" c="LIT_103712" lit="103712"/></c:set>
                                    
                                    <div id="DSP_PREGUNTASDESPESES" class="displayspaceGrandeOver" style="visibility:hidden;height=400px;">&nbsp;</div>
                                    <div id="Dt_PREGUNTASDESPESES" >

                                    <div class="displayspaceGrande">   
                                 
                                        <display:table name="${sessionScope.axisctr_pregGarDespeses}" id="miListaIdPreguntas" export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="modal_axisctr012.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAXPAR_PREGUNTAS.CPREGUN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspNumber" >
                                            ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}</div>
                                        </display:column>
                                        <display:column title="${title1}" sortable="true" sortProperty="" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText" id="cpreguntexto_<%= contador %>">
                                                ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}
                                            </div>
                                           </display:column>

                                        <display:column title="${title2}" media="html" autolink="false" headerClass="headwidth20 sortable">
                                            <div class="dspIcons">
                                            <c:choose>
                                                <c:when test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP == '1'}"> 
                                              
                                                    <select  class="campowidthinput campo campotexto"   name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}" size="1" style="width:100%" title="<axis:alt f="axisctr012" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                    <axis:atr f="axisctr012" c="CRESPUEDESP" a="modificable=true&isInputText=false"/>
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr012__DSP_PREGUNTASDESPESES__visible || __configform.axisctr012__DSP_PREGUNTASDESPESES__visible == 'true'))}"> disabled </c:if>
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1')}"> obligatorio='true'</c:if></c:if>>
                                                    	<%--c:if test="${empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF}"--%> 
                                                       <option value="null"> - <axis:alt f="axisctr012" c="COMBO_SNV" lit="108341"/> - </option> 
                                                       <%--/c:if--%>
                                                        
                                                        <c:forEach items="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.RESPUESTAS}" var="respuesta">
                                                            <option value = "${respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE}" <c:if test="${(empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF==respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE ) ||respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE == miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}">selected</c:if>>  ${respuesta.OB_IAXPAR_RESPUESTAS.TRESPUE} </option>
                                                        </c:forEach>
                                                    </select>
                                                    <c:if test="${!empty __configform.axisctr012__CRESPUEDESP__modificable && __configform.axisctr012__CRESPUEDESP__modificable == 'false'}">
                                                     <c:forEach items="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.RESPUESTAS}" var="respuesta">
                                                        <c:if test="${(empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF==respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE ) ||respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE == miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}">
                                                            <input type="hidden" value="${respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE}" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}">
                                                         </c:if>
                                                    </c:forEach>
                                                    </c:if>
                                                </c:when>
                                                <c:when test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP == '2'}"> 
                                                    <input  xformato="decimal" type="text" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                    <axis:atr f="axisctr012" c="CRESPUEDESP" a="modificable=true&isInputText=true"/>
                                                    <c:if test="${(empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && !empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF)}">value="<fmt:formatNumber pattern='###.#####' value='${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF}'/>"</c:if>
                                                        <c:if test="${!empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}">value="<fmt:formatNumber pattern='###.#####' value='${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}'/>"</c:if>
                                                        class="campowidthinput campo campotexto" title="<axis:alt f="axisctr012" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                    <%--INI SV1 20180312 TasaManual -- JLTS Se excluye la pregunta 2701 en la siguiente linea y luego m?s abajo se coloca readonly (debe ser pregunta autom?tica pero como no carga el valor se puso semiautom?tica--%>
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${ miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN != '2701' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr012__DSP_PREGUNTASDESPESES__visible || __configform.axisctr012__DSP_PREGUNTASDESPESES__visible == 'true'))}"> obligatorio='true' onblur="f_onblur_respuestas_numericas(this, '<axis:alt f="axisctr012" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}', true)"</c:if></c:if>
                                                    <c:if test="${ (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN == '2701') }"> readonly="readonly" </c:if>
													
													<c:if test="${ (sessionScope.existeConvenio != '0' && !empty sessionScope.existeConvenio ) }"> readonly="readonly" </c:if>
                                                    
                                                    <c:if test="${ (sessionScope.existeTasaMigrada != '0' && !empty sessionScope.existeTasaMigrada &&  miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN != '6622') }"> readonly="readonly" </c:if>
                                                    
                                                    <c:if test="${ ((sessionScope.existeTasaMigrada == '0' || empty sessionScope.existeTasaMigrada) &&  miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN == '6622') }"> readonly="readonly" </c:if>
													
                                                    <%--INI SV1 20180312 TasaManual -- JLTS--%>
                                                   <%-- <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL != '1'}"> <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr012__DSP_PREGUNTASDESPESES__visible || __configform.axisctr012__DSP_PREGUNTASDESPESES__visible == 'true'))}"> onblur="f_onblur_respuestas_numericas(this, '<axis:alt f="axisctr012" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}', false)"</c:if></c:if>
                                                    <%-- INI CONF-1291_QT1577 -- 23/02/2018 -- JLTS -- Se adiciona condici?n para la pregunta Tasa Manual (6624) --%>
                                                    <%--<c:if test="${ (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN == '6624' && NMOVIMI > 1 && (empty __configform.axisctr012__DSP_PREGUNTASDESPESES__visible || __configform.axisctr012__DSP_PREGUNTASDESPESES__visible == 'true') && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '0' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE > 0  ) || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr012__DSP_PREGUNTASDESPESES__visible || __configform.axisctr012__DSP_PREGUNTASDESPESES__visible == 'true')))}"> readonly="readonly" </c:if>>
                                                    <%-- FIN CONF-1291_QT1577 -- 23/02/2018 -- JLTS--%>
  
                                                </c:when>
                                                <c:when test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP == '3'}"> 
                                                   <a href="javascript:f_abrir_188('${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}','${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}','${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CTABLA}'));"> 
                                                       <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.PREGTABLA == 0}"> 
                                                            <%--img border="0" alt="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" title="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" src="images/lapiz.gif"/--%>
                                                            <b><axis:alt f="axisctr012" c="INFORMAR" lit="9903703"/></b>
                                                       </c:if>
                                                       <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.PREGTABLA == 1}"> 
                                                            <%--img border="0" alt="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" title="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" src="images/lapiz.gif"/--%>
                                                            <b style="color:red"><axis:alt f="axisctr012" c="INFORMAR" lit="9903703"/></b>
                                                       </c:if>
                                                   </a>
                                                   </c:when>
                                                <c:otherwise>
                                                    <input  type="text" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                    <axis:atr f="axisctr012" c="CRESPUEDESP" a="modificable=true&isInputText=true"/>
                                                    value="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TRESPUE}"  class="campowidthinput campo campotexto" title="<axis:alt f="axisctr012" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr012__DSP_PREGUNTASDESPESES__visible || __configform.axisctr012__DSP_PREGUNTASDESPESES__visible == 'true'))}"> obligatorio='true' onblur="f_onblur_respuestas(this, '<axis:alt f="axisctr012" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}')"</c:if></c:if>
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr012__DSP_PREGUNTASDESPESES__visible || __configform.axisctr012__DSP_PREGUNTASDESPESES__visible == 'true'))}"> readonly="readonly" </c:if>>
                                                </c:otherwise>
                                            </c:choose>
                                            </div>
                                        </display:column>

                                      <c:if test="${__configform.axisctr012__DSP_PREGUNTASDESPESES__modificable != 'false'}">
                                        <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable" media="html" autolink="false">    
                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr012__DSP_PREGUNTASDESPESES__visible || __configform.axisctr012__DSP_PREGUNTASDESPESES__visible == 'true'))}">
                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP != '1'}"> <%-- Mostrar icono de l?piz si no es combo --%>
                                                <div class="dspIcons">
                                                    <c:set var="atributos" value=""/>
                                                    <c:choose>
                                                        <c:when test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP == '2'}"> <%-- Formato: decimal --%>
                                                            <c:set var="atributos" value="formato=-decimal-"/>        
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}">
                                                                <c:set var="atributos" value="obligatorio=-true- formato=-decimal-"/>        
                                                            </c:if>
                                                        </c:when>
                                                        <c:otherwise> <%-- Formato: alfanum�rico --%>
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}">
                                                                <c:set var="atributos" value="obligatorio=-true-"/>
                                                            </c:if>
                                                        </c:otherwise>                                    
                                                    </c:choose>
                                                    <a href="javascript:void(0)" onClick="objEdicionTexto.abrirEditorTexto('respuesta_<%= contador %>', document.getElementById('respuesta_<%= contador %>'), document.getElementById('cpreguntexto_<%= contador %>').innerText, '${atributos}');"> <img border="0" alt="<axis:alt f="axisctr012" c="EDITAR" lit="1000577"/>" title="<axis:alt f="axisctr012" c="EDITAR" lit="1000577"/>" src="images/lapiz.gif"/>
                                                    </a>
                                                </div>
                                            </c:if>
                                            </c:if>
                                        </display:column>
                                        </c:if>
                                    <% contador++; %>
                                    </display:table>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </axis:ocultar>
                </c:if>
                    </td>
                </tr>
            </table>
            
            <!-- Botonera -->
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr012</c:param>
                <c:param name="__botones">cancelar,buscar<axis:visible f="axisctr012" c="BUT_ACEPTAR">,aceptar</axis:visible></c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </div>
    </body>
</html>
