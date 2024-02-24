<%/* Revision:# e5a3F/mDGv4O5plQdfSPzg== # */%>
<%/*
*  Fichero: axisctr221.jsp
*  x
*  Fecha: 14/05/2015
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axisctr221" c="TITULO" lit="9907947"/></title> <%-- Bloqueo/Pignoración de Pólizas --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    <!--********** CALENDARIO ************************* -->
    <!-- Hoja de estilo del Calendario -->
    <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
    <!-- Script principal del calendario -->
    <script type="text/javascript" src="scripts/calendar.js"></script>
    <!-- Idioma del calendario, en función del Locale -->
    <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
    <!-- Setup del calendario -->
    <script type="text/javascript" src="scripts/calendar-setup.js"></script>
    <!--*********************************** -->

    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() { 
      
            if (${requestScope.guardarOK == true})
                f_abrir_imprimir();
           
           f_cargar_propiedades_pantalla();
        }
        
         function f_cerrar_axisimprimir(){                
                objUtiles.cerrarModal("axisimprimir");
                parent.f_cerrar_axisctr221();
        } 
        
        function f_abrir_imprimir(){            
             var SSEGURO = document.miForm.SSEGURO.value;
             var TMOTMOV = document.miForm.TMOTMOV.value;
             var TIPO = "";
             var IMPRIME = false;
             if (TMOTMOV=="BOT_PIGNORAR"){
                TIPO = "PIGNORAR";
             }
             if (TMOTMOV=="BOT_DESPIGNORAR"){
                TIPO = "DESPIGNORAR";
             }
             if (TMOTMOV=="BOT_BLOQUEAR"){
                TIPO = "BLOQUEAR";
             }
             if (TMOTMOV=="BOT_DESBLOQUEAR"){
                TIPO = "DESBLOQUEAR";
             }  
             
              if (TMOTMOV=="BOT_SUSPENDER"){
                TIPO = "SUSPENDER";
             }
             if (TMOTMOV=="BOT_REINICIAR"){
                IMPRIME = true;
                TIPO = "REINICIAR";
             }  
             //var mensaje = objDom.getValorPorId("MENSAJE_A_MOSRAR");
             var mensaje = '${requestScope.MENSAJE}';  
             if (IMPRIME){
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_doc_tipo&TIPO="+ TIPO +"&MENSAJE="+ mensaje +"&SEGURO=" + SSEGURO);
             }
        }
        
        function f_but_salir() {
            var params ="&pPRIMERA="+document.getElementById("pPRIMERA").value;
        	    params +="&SSEGURO_OUT="+document.getElementById("SSEGURO_OUT").value;
        	objAjax.invokeAsyncCGI("modal_axisctr221.do", f_callbackSalir, "operation=ajax_deleteTemporales"+params, this, null);    
        }
          function f_callbackSalir(){
        	  
            parent.f_cerrar_axisctr221();
        }

        function f_but_aceptar() {
            if (objValidador.validaEntrada())
                objUtiles.ejecutarFormulario("modal_axisctr221.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);                
        }               
        
        function restrictTextAreaChars(obj) {
            var maxLength = obj.getAttribute? parseInt(obj.getAttribute("maxLength")) : ""
            if (obj.getAttribute && obj.value.length > maxLength)
                obj.value = obj.value.substring(0, maxLength);
        }

        function f_onclickCDOCUMCheck(input, CDOCUME, SEQDOCU,pCCLASE, pNORDEN, pNRIESGO, pSPERSON){

            document.miForm.modificado.value = 1;
            input.value = input.checked ? 1 : 0;
            params="&CDOCUME=" + CDOCUME+"&checked="+input.value;
            params +="&SEQDOCU="+SEQDOCU;
            params +="&CCLASE="+pCCLASE;
            params +="&NORDEN="+pNORDEN;
            params +="&NRIESGO="+pNRIESGO; 
            params +="&SPERSON="+pSPERSON;
           
            objAjax.invokeAsyncCGI("modal_axisctr221.do", f_callbackAjaxAdjuntar, 
                "operation=ajax_adjuntar"+params, this, null);
        }
    
        function f_callbackAjaxAdjuntar(ajaxResponse){
            //alert(ajaxResponse);
        }    
    
        function f_onclickbtnCDOCUMCheck(input, CDOCUME, SEQDOCU,pCCLASE, pNORDEN, pNRIESGO, pSPERSON){

            params="&CDOCUME=" + CDOCUME;
            params +="&SEQDOCU="+SEQDOCU;
            params +="&CCLASE="+pCCLASE;
            params +="&NORDEN="+pNORDEN;
            params +="&NRIESGO="+pNRIESGO; 
            params +="&SPERSON="+pSPERSON; 
            
            objUtiles.abrirModal("axisctr174", "src", "modal_axisctr174.do?operation=form"+params);
        }
        
        function f_but_salirAxisctr174(subido){
            if (subido == 1) {
                document.miForm.modificado.value = 1;
            }
            // Esto no lo tengo claro que sea necesario !!!!  (IGUAL SE PUEDE SUSTITUIR POR UN document.miForm.CDOCUME.checked = 1)
            objUtiles.ejecutarFormulario ("modal_axisctr221.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            objUtiles.cerrarModal("axisctr174");
        }        
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axisctr221" c="SUBTITULO" lit="1000205"/>|true</c:param>
    </c:import>  
   <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisctr221" c="DOCU_REQUERIDA" lit="9901998"/></c:param>
            <c:param name="nid" value="axisctr174" />
        </c:import> 
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisctr221" c="ETIQ_MOV" lit="9904516"/></c:param>     <%-- Bloqueo/Desbloqueo/Pignoración/Despignoración de Pólizas --%>
                <c:param name="formulario"><axis:alt f="axisctr221" c="ETIQ_MOV" lit="9904516"/></c:param> <%-- Bloqueo/Desbloqueo/Pignoración/Despignoración de Pólizas --%>
                <c:param name="form">axisctr221</c:param>
        </c:import>
            
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>
        <input type="hidden" id="TMOTMOV" name="TMOTMOV" value="${__formdata.TMOTMOV}"/>
         <input type="hidden" name="modificado" value="${modificado}"/> 
                 <input type="hidden" id="SSEGURO_OUT" name="SSEGURO_OUT" value="${__formdata.SSEGURO_OUT}"/>
        <input type="hidden" name="pPRIMERA" id="pPRIMERA" value="${__formdata.pPRIMERA}"/>


        
        <!-- Área de campos  -->
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    
                    <axis:visible c="DSP_DOCREQUERIDA" f="axisctr221">
                    <div class="separador">&nbsp;</div>
                    <div class="titulo">
                    <img src="images/flecha.gif"/><axis:alt f="axisctr221" c="DOCREQUERIDA" lit="9902268"/>
                     </div>
                    <!-- Sección 1 -->
                    
                    <table class="seccion">
                        <tr>
                            <td >
                                <!-- Área 1 -->
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:100%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <div class="displayspaceGrande">
                                             <c:set var="title0"><axis:alt f="axisctr221" c="DESCRIPCION" lit="100588"/></c:set>
                                             <c:set var="title1"><axis:alt f="axisctr221" c="OBLIGATORIO" lit="112347"/></c:set>
                                             <c:set var="title2"><axis:alt f="axisctr221" c="ADJUNTADO" lit="9901999"/></c:set>
                                             <display:table name="${docu_requerida}" id="T_IAX_DOCREQUERIDA" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                              requestURI="axis_axisctr009.do?paginar=true&tabla=T_IAX_PREGUNTAS">
                                                   <%@ include file="../include/displaytag.jsp"%>
                                                   <axis:visible c="TDESCRIP" f="axisctr009">
                                                   <display:column title="${title0}" sortable="true" sortProperty="T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.TDESCRIP" headerClass="sortable"  media="html" autolink="false" >
                                                       <div class="dspText">${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.TDESCRIP}</div>
                                                   </display:column>
                                                  </axis:visible>
                                                   <display:column title="${title1}" sortable="true" sortProperty="T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CCLASE" headerClass="sortable"  media="html" autolink="false" >
                                                       <div class="dspText">
                                                                <input value="${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.COBLIGA}" type="checkbox" 
                                                                id="CDOCUME_${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}" name="CDOCUME_${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}" 
                                                                <c:if test="${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.COBLIGA == 1 }"> checked="checked" </c:if>
                                                                onclick="f_onclickCDOCUMCheck(this, '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.SEQDOCU}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CCLASE}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.NORDEN}')" disabled="disabled" />
                                                            </div> 
                                                   </display:column>
                                                   <display:column title="${title2}" headerClass="sortable" media="html" autolink="false">
                                                           <div class="dspText">
                                                                <input value="${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.ADJUNTADO}" type="checkbox" 
                                                                id="CDOCUME_${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}" name="CDOCUME_${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}" 
                                                                <c:if test="${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.ADJUNTADO == 1 }"> checked="checked" </c:if>
                                                                onclick="f_onclickCDOCUMCheck(this, '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.SEQDOCU}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CCLASE}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.NORDEN}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.NRIESGO}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.SPERSON}')" />
                                                            </div>
                                                   </display:column>
                                                   <display:column title="" headerClass="sortable" media="html" autolink="false">
                                                           <div class="dspText">
                                                                <input value="<axis:alt f="axisctr221" c="ANADIRDOC" lit="9902032"/>" type="button"  class="boton"
                                                                id="CDOCUME_${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}" name="CDOCUME_${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}" 
                                                                <c:if test="${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.ADJUNTADO == 1 }"> checked="checked" </c:if>
                                                                onclick="f_onclickbtnCDOCUMCheck(this, '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.SEQDOCU}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CCLASE}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.NORDEN}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.NRIESGO}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.SPERSON}')" />
                                                            </div>
                                                   </display:column>  
                                              </display:table>
                                           </div>
                                        </td>
                                        
                                    </tr>
                                    <!-- Fin lista    -->
                                </table>
                            </td>
                        </tr>
                    </table>
                    </axis:visible>
        
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <div class="titulo" ><img src="images/flecha.gif"/><axis:alt f="axisctr221" c="DETALLE_MOV" lit="140280"/><%-- Detalle movimiento --%></div>

                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left">
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                    </tr>
                                    <axis:ocultar f="axisctr221" c="ETIQ_MOV" dejarHueco="false">
                                        <tr>
                                            <td class="titulocaja" colspan="2">
                                                <b id="label_ETIQ_MOV"><axis:alt f="axisctr221" c="CAUSA" lit="101040"/></b> <%-- Causa --%>
                                            </td>
                                        </tr>
                                        <tr>                 
                                            <td class="campocaja" colspan="2">
                                                <input type="text" class="campowidthinput campo campotexto" id="ETIQ_MOV" name="ETIQ_MOV" size="15" 
                                                <axis:atr f="axisctr221" c="ETIQ_MOV" a="modificable=false"/>
                                                value="<axis:alt f="axisctr221" c="ETIQ_MOV" lit="9907947"/>" style="width:90%"
                                                title="<axis:alt f="axisctr221" c="CAUSA_2" lit="101040"/>"/>
                                            </td>                                            
                                        </tr>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr221" c="TDESCBLOQ" dejarHueco="false">
                                        <tr>
                                            <td class="titulocaja" colspan="2">
                                                <b id="label_TDESCBLOQ"><axis:alt f="axisctr221" c="TDESCBLOQ" lit="9904551"/></b> <%-- Descripción bloqueo/pignoración --%>
                                            </td>
                                        </tr>
                                        <tr>                 
                                            <td class="campocaja" colspan="2"><!-- overflow-y:hidden; -->
                                                <textarea class="campowidthinput campo campotexto" id="TTEXTO" name="TTEXTO"
                                                onkeyup="restrictTextAreaChars(this)" maxLength="1000" rows="8"
                                                <axis:atr f="axisctr221" c="TDESCBLOQ" a="modificable=true"/> 
                                                style="width:90%;"
                                                title="<axis:alt f="axisctr221" c="TDESCBLOQ" lit="9904551"/>"
                                                >${__formdata.TTEXTO}</textarea>
                                                <%--
                                                <input type="text" class="campowidthinput campo campotexto" id="TTEXTO" name="TTEXTO" size="15" 
                                                <axis:atr f="axisctr221" c="TDESCBLOQ" a="modificable=true"/>
                                                value="${__formdata.TTEXTO}" style="width:90%"
                                                title="<axis:alt f="axisctr221" c="TDESCBLOQ" lit="9904551"/>"/>
                                                --%>
                                            </td>                                            
                                        </tr>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr221" c="TDESCDESBLOQ" dejarHueco="false">
                                        <tr>
                                            <td class="titulocaja" colspan="4">
                                                <b id="label_TDESCDESBLOQ"><axis:alt f="axisctr221" c="TDESCDESBLOQ" lit="9904551"/></b> <%-- Descripción desbloqueo/despignoración --%>
                                            </td>
                                        </tr>
                                        <tr>                 
                                            <td class="campocaja" colspan="2"><!-- overflow-y:hidden -->
                                                <textarea  class="campowidthinput campo campotexto" id="TTEXTO2" name="TTEXTO2" s
                                                onkeyup="restrictTextAreaChars(this)" maxLength="1000" rows="8"
                                                <axis:atr f="axisctr221" c="TDESCDESBLOQ" a="modificable=true"/>
                                                style="width:90%;"
                                                title="<axis:alt f="axisctr221" c="TDESCDESBLOQ" lit="9904551"/>"
                                                >${__formdata.TTEXTO2}</textarea>
                                                <%--
                                                <input type="text" class="campowidthinput campo campotexto" id="TTEXTO2" name="TTEXTO2" size="15" 
                                                <axis:atr f="axisctr221" c="TDESCDESBLOQ" a="modificable=true"/>
                                                value="${__formdata.TTEXTO2}" style="width:90%"
                                                title="<axis:alt f="axisctr221" c="TDESCDESBLOQ" lit="9904551"/>"/>
                                                --%>
                                            </td>                                            
                                        </tr>
                                    </axis:ocultar>
                                    <tr>
                                        <axis:ocultar f="axisctr221" c="FINICIO" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_FINICIO"><axis:alt f="axisctr221" c="FINICIO" lit="9000526"></axis:alt></b> <%-- Fecha inicio --%>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr221" c="FFIN" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_FFIN"><axis:alt f="axisctr221" c="FFIN" lit="9000527"></axis:alt></b> <%-- Fecha fin --%>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>                 
                                        <axis:ocultar f="axisctr221" c="FINICIO" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="FINICIO" name="FINICIO" size="15" 
                                                <axis:atr f="axisctr221" c="FINICIO" a="modificable=true&formato=fecha"/>
                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINICIO}"/>" style="width:35%"
                                                title="<axis:alt f="axisctr221" c="FINICIO" lit="9000526"></axis:alt>"/><c:if test="${__configform.axisctr221__FINICIO__modificable != 'false'}"><a style="vertical-align:middle;"><img
                                                id="icon_FINICIO" alt="<axis:alt f="axisctr221" c="SELECCIONAR" lit="108341"/>" title="<axis:alt f="axisctr221" c="SELECCIONAR" lit="108341"/>" src="images/calendar.gif"/></a></c:if>
                                            </td>                                            
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr221" c="FFIN" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="FFINAL" name="FFINAL" size="15" 
                                                <axis:atr f="axisctr221" c="FFIN" a="modificable=true&formato=fecha"/>
                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFINAL}"/>" style="width:35%"
                                                title="<axis:alt f="axisctr221" c="FFIN" lit="9000527"></axis:alt>"/><c:if test="${__configform.axisctr221__FFIN__modificable != 'false'}"><a style="vertical-align:middle;"><img
                                                id="icon_FFINAL" alt="<axis:alt f="axisctr221" c="SELECCIONAR" lit="108341"/>" title="<axis:alt f="axisctr221" c="SELECCIONAR" lit="108341"/>" src="images/calendar.gif"/></a></c:if>
                                            </td>                                            
                                        </axis:ocultar>
                                    </tr>
                                    <axis:ocultar f="axisctr221" c="IMPORTE" dejarHueco="false">
                                        <tr>
                                            <td class="titulocaja">
                                                <b id="label_IMPORTE"><axis:alt f="axisctr221" c="IMPORTE" lit="100563"></axis:alt></b> <%-- Importe --%>
                                            </td>
                                        </tr>
                                        <tr>                 
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="IIMPORTE" name="IIMPORTE" size="15" 
                                                <axis:atr f="axisctr221" c="IMPORTE" a="modificable=true&formato=decimal"/>
                                                value="<fmt:formatNumber value="${__formdata.IIMPORTE}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/>" style="width:35%"
                                                title="<axis:alt f="axisctr221" c="IMPORTE" lit="100563"></axis:alt>"/>
                                            </td>                                            
                                        </tr>
                                    </axis:ocultar>

                                    
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>     
            </tr>            
        </table>
        
        </td>
        </tr>
        </table>
        <c:import url="../include/botonera_nt.jsp">
        	<c:param name="f">axisctr221</c:param>
            <c:param name="__botones">salir<c:if test="${requestScope.guardarOK != true}">,aceptar</c:if></c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>

    <script type="text/javascript">
       <c:if test="${__configform.axisctr221__FINICIO__modificable != 'false'}">
        Calendar.setup({
            inputField     :    "FINICIO",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FINICIO", 
            singleClick    :    true,
            firstDay       :    1
        });
       </c:if>
       <c:if test="${__configform.axisctr221__FFIN__modificable != 'false'}">
        Calendar.setup({
            inputField     :    "FFINAL",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FFINAL", 
            singleClick    :    true,
            firstDay       :    1
        });
        </c:if>
    </script>


</body>
</html>