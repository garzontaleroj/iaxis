<%/**
*  Fichero: axispro014.jsp
*  @author <a href="mailto:rkirchner@csi-ti.com">Roger Kirchner Villas</a>
*   
*  Modal - Mantenimiento prodctos: Sección FÓRMULAS PRODUCCIÓN.
*
*  Fecha: 18/04/2007
*/
%>

<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
<head>
<link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
<link rel="stylesheet" href="styles/axisnt.css" type="text/css">
<link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
<c:import url="../include/carga_framework_js.jsp" />

<script language="Javascript" type="text/javascript">
    function f_onload() {
        revisarEstilos();
    }

    function f_modificar_formula(PCCAMPO, PCLAVE) {
        objUtiles.ejecutarFormulario("modal_axispro014.do?operation=modificarFormula&PCCAMPO=" + PCCAMPO + "&PCLAVE=" + PCLAVE, "", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
    
    function f_but_salir() {                                   
        parent.parent.reabrir_modal_garantias("modal_axispro001_garantias.do?operation=form&SPRODUC=${__formdata.SPRODUC}&CACTIVI=${param.PCACTIVI}&CGARANT=${__formdata.PCGARANT}&dt="+(new Date().getTime()) + "&subpantalla=garantias_formulas");
    }
    
    function f_editar_clave(CLAVE) {
        <% request.setAttribute("subpantalla", "garantias_formulas"); %>
        parent.parent.f_abrir_gfi(CLAVE, '${__formdata.SPRODUC}', '${__formdata.PCGARANT}', '${param.PCACTIVI}');
    }
    
    function f_but_aceptar(){
        objUtiles.ejecutarFormulario("modal_axispro014.do?operation=modificarFormula&PCCAMPO=" + document.miForm.selectCodigos.value + "&PCLAVE=" + document.miForm.selectFormulas.value, "", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
    
    function f_borrar_clave(CCAMPO,CLAVE) {
        var answer = confirm(objJsMessages.jslit_confirma_borrar);
        if(answer){
            objUtiles.ejecutarFormulario("modal_axispro014.do?operation=borrarFormula&PCCAMPO=" + CCAMPO + "&PCLAVE=" + CLAVE, "", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
    }
        
</script>
</head>
<body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
<form name="miForm" action="" method="POST">
    <input type="hidden" name="operation" value=""/>
    <input type="hidden" name="SPRODUC" value="${__formdata.SPRODUC}"/>
    <input type="hidden" name="PCACTIVI" value="${__formdata.PCACTIVI}"/>
    <input type="hidden" name="PCGARANT" value="${__formdata.PCGARANT}"/>
    <input type="hidden" name="CUTILI" value="${__formdata.CUTILI}"/>
    <input type="hidden" name="operation" value=""/>
    
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="formulario"><fmt:message key="1000224"/></c:param>
        <c:param name="producto"><fmt:message key="1000224"/></c:param>
        <c:param name="form">axispro014</c:param>
    </c:import>

    <!-- Área de campos  -->
    
    <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <div class="separador">&nbsp;</div>
                <table class="seccion" align="center" style="width:100%;">
                    <tr>
                        <th style="width:2%;height:0px"></th>
                        <th style="width:30%;height:0px"></th>
                        <th style="width:40%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:8%;height:0px"></th>
                    </tr>
                    <tr>
                        <td></td>
                        <td class="titulocaja">
                            <b><fmt:message key="1000109" /></b>
                        </td>
                        <td class="titulocaja">
                            <b><fmt:message key="108347" /></b>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td class="campocaja">
                            <select name="selectCodigos" id ="selectCodigos" size="1" class="campowidthselect campo campotexto" style="width:100%">
                                <option value="-912448"> - <fmt:message key="1000348"/> - </option>
                                <c:forEach var="codigo" items="${__formdata.LSTCODIGOS}">
                                    <option value="${codigo.CCAMPO}" 
                                        <c:if test='${codigo.CCAMPO == __formdata.selectCodigos}'> selected </c:if> >
                                        ${codigo.TCAMPO}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                        <td class="campocaja">
                            <select name="selectFormulas" id ="selectFormulas" size="1" class="campowidthselect campo campotexto" style="width:80%">
                                <option value="-912448"> - <fmt:message key="1000348"/> - </option>
                                <c:forEach var="FORMULA" items="${__formdata.LSTFORMULAS}">
                                    <option value="${FORMULA.CLAVE}" 
                                        <c:if test='${FORMULA.CLAVE == T_IAX_PRODGARFORMULAS.OB_IAX_PRODGARFORMULAS.CLAVE}'> selected </c:if> >
                                        ${FORMULA.CLAVE_CODIGO}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                        <td>
                            <input type="button" class="boton" id="but_anadir_campo" value="<axis:alt f="axispro014" c="BT_NOU_CAMPO" lit="104825"/>" onclick="f_but_aceptar()" />  
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        
        <tr>
            <td>
                <div class="separador">&nbsp;</div>
                <table class="seccion"  style="width:80%;">
                    <%-- cutili = 0 (VALOR FIJO = 203, CATRIBU = 0) --%>
                    <tr>
                        <c:if test="${__formdata.CUTILI == 0}">
                        <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="108987" /></div>
                        </c:if>
                        <c:if test="${__formdata.CUTILI == 8}">
                        <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="102656" /></div>
                        </c:if>
                        <td>     
                            <c:set var="title0"><fmt:message key="1000109" /></c:set>
                            <c:set var="title1"><fmt:message key="109373" /></c:set>
                            <c:set var="title2"><fmt:message key="108347" /></c:set>
                                 
                            <div class="displayspaceMaximo">
                                <display:table name="${__formdata.T_IAX_PRODGARFORMULAS}" id="xfuenteDatos" export="false" class="dsptgtable" defaultsort="1" defaultorder="ascending" pagesize="15" sort="list" cellpadding="0" cellspacing="0" 
                                    requestURI="modal_axispro014.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                    <display:column title="${title0}" headerClass="headwith5 sortable" sortable="true" sortProperty="OB_IAX_PRODGARFORMULAS.CCAMPO"  media="html" autolink="false" >
                                        <div class="dspText">${xfuenteDatos.CCAMPO}</div>
                                    </display:column>
                                    
                                    
                                    <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PRODGARFORMULAS.TCAMPO" headerClass="sortable" media="html" autolink="false" >                                            
                                        <div class="dspText">${xfuenteDatos.TCAMPO}</div>
                                    </display:column>
                                    <display:column title="${title2}" headerClass="headwith5 sortable" sortable="true" sortProperty="OB_IAX_PRODGARFORMULAS.CLAVE"  media="html" autolink="false" >
                                        <div class="dspText">
                                            ${xfuenteDatos.FORMULA}    
                                        </div>
                                    </display:column>
                                    <display:column title="" headerClass="sortable headwidth5" media="html" autolink="false" >
                                        <div class="dspIcons">
                                            <a href="javascript:f_editar_clave('${xfuenteDatos.CLAVE}')"><img border="0" alt="<fmt:message key="100002" />" title="<fmt:message key="100002" />" style="vertical-align:middle;" src="images/mas.gif"/></a>
                                        </div>
                                    </display:column>
                                    <display:column title="" headerClass="sortable headwidth5" media="html" autolink="false" >
                                        <div class="dspIcons">
                                            <a href="javascript:f_borrar_clave('${xfuenteDatos.CCAMPO}','${xfuenteDatos.CLAVE}')"><img border="0" alt="<fmt:message key="9001333" />" title="<fmt:message key="9001333" />" style="vertical-align:middle;" src="images/delete.gif"/></a>
                                        </div>
                                    </display:column>
                                   
                                </display:table>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
        
    <c:import url="../include/botonera_nt.jsp">
        <c:param name="__botones">salir</c:param> 
    </c:import>
</form>
    
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>