<%/*
*  Fichero: axisgfi003.jsp
*
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavier Gallego</a>
*
*  Fecha: 15/04/2008
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript">
    function f_but_cancelar() {
        parent.f_cerrar_axisgfi003()
    }
    function f_but_aceptar() {
        parent.f_aceptar_axisgfi003();
    }
    
    function f_borrar_parametro(CLAVE, PARAMETRO){
        var answer = confirm(objJsMessages.jslit_confirma_borrar);
        if (answer){
            objDom.setValorPorId("CLAVE_BORRAR", CLAVE);
            objDom.setValorPorId("PARAMETRO_BORRAR", PARAMETRO);
        
            objUtiles.ejecutarFormulario ("modal_axisgfi003.do", "eliminar_parametro_lista", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
    }
    
    function f_cambiar_params(obj){
        objUtiles.ejecutarFormulario ("modal_axisgfi003.do", "anadir_parametro_lista", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
    
    function f_onload() {
        revisarEstilos();
    }
    </script>
  </head>
  <body onload="f_onload()">
  <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
<form name="miForm" action="modal_axisgfi003.do" method="POST"> 
<input type="hidden" name="operation" value="aceptar" />
<input type="hidden" name="CLAVE_AXGF002" id="CLAVE_AXGF002" value="${__formdata.CLAVE_AXGF002}" />
<input type="hidden" name="CLAVE_BORRAR" id="CLAVE_BORRAR" value="" />
<input type="hidden" name="PARAMETRO_BORRAR" id="PARAMETRO_BORRAR" value="" />

<c:import url="../include/titulo_nt.jsp">
    <c:param name="formulario"><fmt:message key="1000204" /></c:param>
    <c:param name="form">axisgfi003</c:param>
</c:import>
<table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <!--campos-->
            <table class="seccion">
                <tr>
                    <th style="height:0px;width:50%"></th>
                </tr>
                <tr>
                    <axis:visible f="axisgfi003" c="PARAMETRO"> 
                        <td class="titulocaja">
                            <b><fmt:message key="104111" /></b>
                        </td>
                </tr>
                <tr>
                        <td class="campocaja">
                            <select style="width:100%;" name = "lista_parametros" id ="lista_parametros" size="1" onchange="f_cambiar_params(this)" 
                                class="campowidthselect campo campotexto">&nbsp;
                                <option value = "null"> - <fmt:message key="108341"/> - </option>
                                <c:forEach var="parametros" items="${requestScope.axisgfi_listaParametros}">
                                    <option value = "${parametros.TERMINO}" <c:if test="${parametros.TERMINO == axisgfi_formula.TERMINO}">selected</c:if>>${parametros.TERMINO} </option>
                                </c:forEach>
                            </select>
                        </td>
                    </axis:visible>
                </tr>
            </table>
            <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="103694" /></div>
            <table class="area" align="center" style="width:100%;">
                <tr>
                    <td>
                        <!-- DisplayTag Parametros -->
                        <c:set var="title0"><fmt:message key="1000109" /></c:set>
                        <c:set var="title1"><fmt:message key="100588" /></c:set>
                        <div class="displayspace">
                            <display:table name="${sessionScope.axisgfi_listaParams}" id="miListaId" export="false" class="dsptgtable" defaultsort="1" defaultorder="ascending" pagesize="-1" sort="list" cellpadding="0" cellspacing="0" 
                            requestURI="modal_axisgfi003.do?paginar=true">
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column title="${title0}" headerClass="sortable" sortable="true" sortProperty=""  media="html" autolink="false" >
                                    <div class="dspText">${miListaId.OB_IAX_GFIPARAM.PARAMETRO}</div>
                                </display:column>
                                <display:column title="${title1}" sortable="true" sortProperty="" headerClass="sortable" media="html" autolink="false" >
                                    <div class="dspText">${miListaId.OB_IAX_GFIPARAM.TPARAM}</div>
                                </display:column>
                                <display:column title="" headerClass="sortable headwidth5" media="html" autolink="false" >
                                    <div class="dspIcons"><a href="javascript:f_borrar_parametro('${miListaId.OB_IAX_GFIPARAM.CLAVE}', '${miListaId.OB_IAX_GFIPARAM.PARAMETRO}')"><img border="0" alt="<fmt:message key="1000127" />" title="<fmt:message key="1000127" />" src="images/delete.gif"/></a></div>
                                </display:column>
                            </display:table>
                        </div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<c:import url="../include/botonera_nt.jsp"><c:param name="__botones">cancelar,aceptar</c:param></c:import>

</form>
<c:import url="../include/mensajes.jsp" />
</body>
</html>
