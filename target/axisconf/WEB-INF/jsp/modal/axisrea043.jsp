<%/**
*  Fichero: axisrea043.jsp 
*
*  Fecha: 08/04/2014
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
        <title><axis:alt f="axisrea043" c="TITULO" lit="9906725"/></title>
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
            
            function f_but_cancelar() {
                parent.f_cerrar_modal("axisrea043");      
            }
            
            function f_but_9906722() {
                objUtiles.ejecutarFormulario("modal_axisrea043.do", "replicar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_nuevo_axisrea044(MODO) {
                var IDCABECERA = document.miForm.IDCABECERA.value;
                objUtiles.abrirModal("axisrea044", "src", "modal_axisrea044.do?operation=form&MODO="+MODO+"&IDCABECERA="+IDCABECERA);  
            }   
            
            function f_cerrar_modal(modal, IDCABECERA) {            
               objUtiles.cerrarModal(modal);
               objUtiles.ejecutarFormulario("modal_axisrea043.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_modif_axisrea044(ID,IDCABECERA) {
                var MODO = "MODIFICAR";
                objUtiles.abrirModal("axisrea044", "src", "modal_axisrea044.do?operation=form&ID="+ID+"&IDCABECERA="+IDCABECERA+"&MODO="+MODO);  
            }
            
            function f_borrar_porcen(ID) {
                objUtiles.ejecutarFormulario("modal_axisrea043.do?ID="+ID, "eliminar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/
            
            // TODO Implementar CallBack Ajax
            
        </script>
    </head>
    <body  onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="modal_axisrea043.do" method="POST">
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisrea043" c="TITULO" lit="9906725"/></c:param>
                <c:param name="titulo"><axis:alt f="axisrea043" c="TITULO" lit="9906725"/></c:param> 
                <c:param name="form">axisrea043</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisrea044|<axis:alt f="axisrea044" c="LIT_MODAL_AXISREA044" lit="9906725" /></c:param>
            </c:import>
            
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="IDCABECERA" name="IDCABECERA" value="${__formdata.IDCABECERA}"/>
            <input type="hidden" id="SCONTRA" name="SCONTRA" value="${__formdata.SCONTRA}"/>
            <input type="hidden" id="CTRAMO" name="CTRAMO" value="${__formdata.CTRAMO}"/>
            <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
            <input type="hidden" id="SPRODUC" name="SPRODUC" value="${__formdata.SPRODUC}"/>
            
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="seccion">
                            <tr>
                              <td>
                                  <div class="separador">&nbsp;</div>
                              </td>
                            </tr>
                            <tr>
                            <axis:visible f="axisrea043" c="SCONTRA">
                                <td class="titulocaja" colspan="4">
                                  <b><axis:alt f="axisrea043" c="LIT_LIST_CTTO" lit="9000745"/></b>
                                </td>
                                
                                <td>
                                    <axis:visible f="axisrea043" c="ALTA_FORMULA">
                                        <a href="javascript:f_nuevo_axisrea044('ALTA')">
                                        <img style="float:right;" border="0" 
                                             alt="<axis:alt f="axisrea043" c="ALT_IMG_NUEVO" lit="9001816"/>" 
                                             title="<axis:alt f="axisrea043" c="ALT_IMG_NUEVO_OS" lit="9001816"/>" 
                                             src="images/new.gif"/>
                                        </a>
                                    </axis:visible>
                                </td>
                            </axis:visible>
                            </tr>
                            <tr>
                                <td>
                                   <c:set var="title0"><axis:alt f="axisrea043" c="PORCEN" lit="101467"/></c:set>
                                   <c:set var="title3"><axis:alt f="axisrea043" c="FPAGO" lit="101573"/></c:set>
                                   <c:set var="title1"><axis:alt f="axisrea043" c="ALT_MODIFICAR" lit="9000552"/></c:set> 
                                   <c:set var="title2"><axis:alt f="axisrea043" c="ALT_BORRAR" lit="9001333"/></c:set> 
                                   <div class="seccion displayspaceGrande">
                                     <display:table name="${__formdata.T_IAX_PORCEN_TRAMO_CTTO}" id="cttoTramoProdId" 
                                        export="false" class="dsptgtable" pagesize="-1"  sort="list" 
                                        cellpadding="0" cellspacing="0" requestURI="" >
                                        <%@ include file="../include/displaytag.jsp"%>
                                             <axis:visible f="axisrea043" c="PORCEN">
                                                <display:column title="${title0}" sortable="true" 
                                                                headerClass="sortable" media="html" autolink="false" 
                                                                sortProperty="OB_IAX_PORCEN_TRAMO_CTTO.PORCEN"
                                                                style="width:25%">
                                                    <div class="dspText">${cttoTramoProdId.OB_IAX_PORCEN_TRAMO_CTTO.PORCEN}</div>
                                                </display:column>
                                            </axis:visible>
                                            <axis:visible f="axisrea043" c="FPAGO">
                                                <display:column title="${title3}" sortable="true" 
                                                                headerClass="sortable" media="html" autolink="false" 
                                                                sortProperty="OB_IAX_PORCEN_TRAMO_CTTO.FPAGO"
                                                                style="width:75%">
                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${cttoTramoProdId.OB_IAX_PORCEN_TRAMO_CTTO.FPAGO}"/></div>
                                                </display:column>
                                            </axis:visible>
                                            <axis:visible f="axisrea043" c="BT_EDIT">
                                                <display:column title="${title1}" sortable="true" 
                                                                sortProperty="OB_IAX_TRAMOS_REA.CCAMPO" 
                                                                headerClass="headwidth5 sortable fixed"  
                                                                media="html" autolink="false" 
                                                                style="width:15px">                                    
                                                    <div class="dspIcon"><a href="javascript:f_modif_axisrea044('${cttoTramoProdId.OB_IAX_PORCEN_TRAMO_CTTO.ID}',
                                                                                                                '${cttoTramoProdId.OB_IAX_PORCEN_TRAMO_CTTO.IDCABECERA}');">
                                                        <img border="0" alt="<axis:alt f="axisrea003" c="ALT_IMG_ISCONTA_DOS" lit="9000552"/>" title="<axis:alt f="axisrea043" c="ALT_ISONTA_LIT_DP" lit="9000552"/>" src="images/lapiz.gif"/></a> 
                                                    </div>
                                                </display:column>
                                            </axis:visible>
                                            <axis:visible f="axisrea043" c="BT_BORRAR">
                                                <display:column title="${title2}" sortable="true" 
                                                                sortProperty="OB_IAX_TRAMOS_REA.CCAMPO" 
                                                                headerClass="headwidth5 sortable fixed"  
                                                                media="html" autolink="false" 
                                                                style="width:100%">                                    
                                                    <div class="dspIcon"><a href="javascript:f_borrar_porcen('${cttoTramoProdId.OB_IAX_PORCEN_TRAMO_CTTO.ID}');">
                                                        <img border="0" alt="<axis:alt f="axisrea043" c="ALT_IMG_ISCONTA_REL" lit="9001333"/>" title="<axis:alt f="axisrea043" c="ALT_ISONTA_LIT_DR" lit="9001333"/>" src="images/delete.gif"/></a> 
                                                    </div>
                                                </display:column>
                                            </axis:visible>
                                     </display:table>
                                   </div>
                                </td>
                            </tr>
                        </table>
                        <div class="separador">&nbsp;</div>
                                                                         
                    </td>
                </tr>
            </table>
            
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisrea043</c:param>
                <c:param name="__botones">cancelar,9906722</c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>