<%/* Revision:# PuGJU0W7sO4UVuKoUXYs5A== # */%>
<%/**
*  Fichero: axisadm007.jsp
*  Simulación Contable
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo Flores</a>  
*  Fecha: 09/09/2008
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
    <head>
        <title><axis:alt f="axisctr173" c="TITULOAXISCTR173" lit="formulario.axisnombrepantalla"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
                f_cargar_propiedades_pantalla(); 
            }
            
            function f_but_aceptar(){
                var modificado = document.miForm.modificado.value;

                if (modificado == 1){
                    parent.f_cerrar_axisctr173();
                }else{
                    parent.f_solo_cerrar_axisctr173();
                }
            }
            
            function f_onclickCDOCUMCheck(input, CDOCUME, SEQDOCU,pCCLASE, pNORDEN, pNRIESGO, pSPERSON, pRECIBIDO){
                
                var recibidofinal; 
                document.miForm.modificado.value = 1;
                input.value = input.checked ? 1 : 0;
                if (!objUtiles.estaVacio(pRECIBIDO))
                   recibidofinal = pRECIBIDO.checked ? 1 : 0;
                else
                   recibidofinal = null;
                
                params="&CDOCUME=" + CDOCUME+"&checked="+input.value;
                params +="&SEQDOCU="+SEQDOCU;
                params +="&CCLASE="+pCCLASE;
                params +="&NORDEN="+pNORDEN;
                params +="&NRIESGO="+pNRIESGO; 
                params +="&SPERSON="+pSPERSON;
                params +="&CRECIBIDO="+recibidofinal;
               
                objAjax.invokeAsyncCGI("modal_axisctr173.do", f_callbackAjaxAdjuntar, 
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
                objUtiles.ejecutarFormulario ("modal_axisctr173.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
                objUtiles.cerrarModal("axisctr174");
            }
            
        </script>
    </head>
    <body  onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/> 
            <input type="hidden" name="modificado" value="${modificado}"/> 
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisctr173" c="DOCU_REQUERIDA" lit="9901998"/></c:param>
                <c:param name="formulario"><axis:alt f="axisctr173" c="DOCU_REQUERIDA" lit="9901998"/></c:param>
                <c:param name="form">axisctr173</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr173" c="DOCU_REQUERIDA" lit="9901998"/></c:param>
                <c:param name="nid" value="axisctr174" />
            </c:import> 
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
            <!-- Área de campos  -->
            <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                        <img src="images/flecha.gif"/><axis:alt f="axisctr173" c="DOCREQUERIDA" lit="103593"/>
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
                                                <div>
                                                 <c:set var="title0"><axis:alt f="axisctr173" c="DESCRIPCION" lit="100588"/></c:set>
                                                 <c:set var="title1"><axis:alt f="axisctr173" c="OBLIGATORIO" lit="112347"/></c:set>
                                                 <c:set var="title2"><axis:alt f="axisctr173" c="ADJUNTADO" lit="9901999"/></c:set>
                                                 <c:set var="title3"><axis:alt f="axisctr173" c="CRECIBIDO" lit="9905367"/></c:set>
                                                 <display:table name="${docu_requerida}" id="T_IAX_DOCREQUERIDA" export="false" class="dsptgtable" pagesize="-1" defaultsort="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                                  requestURI="modal_axisctr173.do?paginar=true"  >
                                                       <%@ include file="../include/displaytag.jsp"%>
                                                       <axis:visible c="TDESCRIP" f="axisctr173">
                                                       <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_DOCREQUERIDA.TDESCRIP" headerClass="sortable"  media="html" autolink="false" >
                                                           <div class="dspText">${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.TDESCRIP}</div>
                                                       </display:column>
                                                      </axis:visible>
                                                       <display:column title="${title1}" headerClass="sortable"  media="html" autolink="false" >
                                                           <div class="dspText">
                                                                    <input value="${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.COBLIGA}" type="checkbox" 
                                                                    id="CDOCUME_${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}" name="CDOCUME_${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}" 
                                                                    <c:if test="${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.COBLIGA == 1 }"> checked="checked" </c:if>
                                                                    onclick="f_onclickCDOCUMCheck(this, '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.SEQDOCU}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CCLASE}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.NORDEN}', null)" disabled="disabled" />
                                                                </div> 
                                                       </display:column>
                                                       <display:column title="${title2}" headerClass="sortable" media="html" autolink="false">
                                                               <div class="dspText">
                                                                    <input value="${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.ADJUNTADO}" type="checkbox" 
                                                                    id="CDOCUME_${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}" name="CDOCUME_${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}" 
                                                                    <c:if test="${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.ADJUNTADO == 1 }"> checked="checked" </c:if>
                                                                    onclick="f_onclickCDOCUMCheck(this, '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.SEQDOCU}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CCLASE}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.NORDEN}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.NRIESGO}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.SPERSON}', null)" />
                                                                </div>
                                                       </display:column>
                                                       <c:if test="${__formdata.UNDERWRITING == 'UNDERWRITING' }">
                                                       <display:column title="${title3}" headerClass="sortable" media="html" autolink="false">
                                                               <div class="dspText">
                                                                    <input value="${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CRECIBIDO}" type="checkbox" 
                                                                    id="CRECIBIDO_${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CRECIBIDO}" name="CDOCUME_${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CRECIBIDO}" 
                                                                    <c:if test="${empty T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.TFILENAME}"> disabled="disabled" </c:if>
                                                                    <c:if test="${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CRECIBIDO == 1 }"> checked="checked" </c:if>
                                                                    onclick="f_onclickCDOCUMCheck(this, '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.SEQDOCU}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CCLASE}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.NORDEN}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.NRIESGO}', '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.SPERSON}', this)" />
                                                                </div>
                                                       </display:column>
                                                       </c:if>
                                                       <display:column title="" headerClass="sortable" media="html" autolink="false">
                                                               <div class="dspText">
                                                                    <input value="<axis:alt f="axisctr173" c="ANADIRDOC" lit="9902032"/>" type="button"  class="boton"
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
 
                      <div class="separador">&nbsp;</div>
                        
             <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr173</c:param><c:param name="f">axisctr174</c:param><c:param name="__botones">aceptar</c:param></c:import> <!--quitamos cercar 9000508 -->
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>