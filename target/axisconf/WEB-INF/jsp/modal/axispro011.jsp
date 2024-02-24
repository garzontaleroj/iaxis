<%--/**
*  Fichero: axispro011.jsp
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavier Gallego</a>
*  
*  T?tulo: Modal Duraciónes permitidas
*
*  Fecha: 25/04/2008
*/
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><fmt:message key="1000182"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    <script type="text/javascript">
        function f_onload(){
            if(!objUtiles.estaVacio(objDom.getValorPorId("hay_cambios_en_duraciones")) 
                    && objUtiles.utilEquals(objDom.getValorPorId("hay_cambios_en_duraciones"), "true")){
                objDom.setVisibilidadPorId("but_cancelar", "hidden");
                
                if(parent.document.getElementById("but_cerrar_modal_axispro011"))
                    parent.document.getElementById("but_cerrar_modal_axispro011").style.visibility="hidden";
                        
                if(parent.parent.document.getElementById("but_cerrar_modal_axispro005"))
                    parent.parent.document.getElementById("but_cerrar_modal_axispro005").style.visibility="hidden";
                
            }
        }
        
        function f_but_aceptar(){
            if(parent.document.miForm.hay_cambios_en_duraciones) 
                parent.document.miForm.hay_cambios_en_duraciones.value = "true";
            parent.f_aceptar_axispro005("axispro011");
        }
        
        function f_aceptar_axispro012(){
            f_cerrar_modal_axispro012();
            objUtiles.ejecutarFormulario ("modal_axispro011.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_cancelar(){
            parent.f_cerrar_modal("axispro011");
        }
        
        function f_but_nuevo() {
            var SPRODUC = objDom.getValorPorId("SPRODUC");
            //Abrimos modal de introducción de duraciones
            objUtiles.abrirModal("axispro012", "src", "modal_axispro012.do?operation=form&SPRODUC=" + SPRODUC);    
        }
        
        function f_modificar_duracion (FINICIO, NDURPER){
            var SPRODUC = objDom.getValorPorId("SPRODUC");
            objDom.setValorPorId("FINICIO", FINICIO);
            objDom.setValorPorId("NDURPER", NDURPER);
            
            //Abrimos modal de modificacion de duraciones
            objUtiles.abrirModal("axispro012", "src", "modal_axispro012.do?operation=form&SPRODUC=" + SPRODUC + 
                                "&FINICIO=" + objDom.getValorPorId("FINICIO") +
                                "&NDURPER=" + objDom.getValorPorId("NDURPER"));    
        }
        
        function f_borrar_duracion (FINICIO, NDURPER){
            var answer = confirm(objJsMessages.jslit_confirma_borrar);
            if (answer){
                var SPRODUC = objDom.getValorPorId("SPRODUC");
                objDom.setValorPorId("FINICIO", FINICIO);
                objDom.setValorPorId("NDURPER", NDURPER);
                objUtiles.ejecutarFormulario ("modal_axispro011.do", "eliminar_duracion_lista", document.miForm, "_self", objJsMessages.jslit_borrando_registro);
            }
        }
        
        function f_cerrar_modal_axispro012(){
            objUtiles.cerrarModal("axispro012");
        }
    </script>
</head>
<body onload="javascript:f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="" method="POST">
    <input type="hidden" name="operation" value="" />
    <input type="hidden" id="SPRODUC" name="SPRODUC" value="${param.SPRODUC}" />
    <input type="hidden" id="FINICIO" name="FINICIO" value="" />
    <input type="hidden" id="NDURPER" name="NDURPER" value="" />
    <input type="hidden" id="hay_cambios_en_duraciones" name="hay_cambios_en_duraciones" value="${requestScope.hay_cambios_en_duraciones}" />
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><fmt:message key="9000667"/></c:param>
        <c:param name="formulario"><fmt:message key="9000667"/></c:param>
        <c:param name="form">axispro011</c:param>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axispro012|<fmt:message key="9000667"/></c:param>
    </c:import>
    
    <div class="separador">&nbsp;</div>
    <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <div class="titulo">
                    <img src="images/flecha.gif"/><c:if test="${!empty DESCPRODUCTO}">${DESCPRODUCTO}</c:if>                
                </div>
                <table class="seccion" align="center" cellpadding="0" cellspacing="5">
                    <tr>
                        <td align="left">
                            <tr>
                                <th style="width:100%;height:0px"></th>
                            </tr>
                            <tr>
                                <td>
                                    <!-- DisplayTag Duraciones -->
                                    <c:set var="title1"><fmt:message key="100890" /></c:set>
                                    <c:set var="title2"><fmt:message key="101422" /></c:set>
                                    <c:set var="title3"><fmt:message key="180324" /></c:set>
                                    <div class="displayspace">
                                      <display:table name="${sessionScope.T_IAX_PRODDURPERIODO}" id="T_IAX_PRODDURPERIODO" export="false" class="dsptgtable" pagesize="6" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                       requestURI="modal_axispro011.do?ordenar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PRODDURPERIODO.FINICIO" headerClass="headwidth10 sortable" media="html" autolink="false" >
                                            <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_PRODDURPERIODO.OB_IAX_PRODDURPERIODO.FINICIO}"/></div>
                                        </display:column>
                                        <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_PRODDURPERIODO.FFIN" headerClass="headwidth10 sortable" media="html" autolink="false" >
                                            <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_PRODDURPERIODO.OB_IAX_PRODDURPERIODO.FFIN}"/></div>
                                        </display:column>
                                        <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_PRODDURPERIODO.NDURPER" headerClass="sortable" media="html" autolink="false" >
                                            <div class="dspNumber">${T_IAX_PRODDURPERIODO.OB_IAX_PRODDURPERIODO.NDURPER}</div>
                                        </display:column>
                                        <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                            <div class="dspIcons"><a href="javascript:f_modificar_duracion('<fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_PRODDURPERIODO.OB_IAX_PRODDURPERIODO.FINICIO}"/>', '${T_IAX_PRODDURPERIODO.OB_IAX_PRODDURPERIODO.NDURPER}')"><img border="0" alt="<fmt:message key="9000666"/>" title="<fmt:message key="9000666"/>" src="images/new.gif"/></a></div>
                                        </display:column>
                                        <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                            <div class="dspIcons"><a href="javascript:f_borrar_duracion('<fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_PRODDURPERIODO.OB_IAX_PRODDURPERIODO.FINICIO}"/>', '${T_IAX_PRODDURPERIODO.OB_IAX_PRODDURPERIODO.NDURPER}')"><img border="0" alt="<fmt:message key="1000127" />" title="<fmt:message key="1000127" />" src="images/delete.gif"/></a></div>
                                        </display:column>
                                    </display:table>
                                    </div>
                                </td>
                            </tr>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div class="separador">&nbsp;</div>
    <c:import url="../include/botonera_nt.jsp"><c:param name="__botones">cancelar,nuevo,aceptar</c:param></c:import>
    </form>
    <c:import url="../include/mensajes.jsp" />
</body>
</html>