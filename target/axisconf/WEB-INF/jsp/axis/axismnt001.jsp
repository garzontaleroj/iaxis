<%/**
*  Fichero: axismnt001.jsp
*  @author <a href = "mailto:echristen@csi-ti.com">Elmar Christen</a>
*  
*	Lista de tablas
El ref cursor nos devolverá la 
descripción del nombre de la tabla (ttabla), 
identificativo de la tabla (ctabla), 
el tipo de tabla (ctipo), 
tabla maestro (tabmaestro), 
tabla detalle (tabdetalle). 
Deberíamos mostrar exclusivamente el campo (ttabla). 
Los campos ctabla, tabmaestro, tabdetalle y ctipo los deberemos usar posteriormente para recuperar la información
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><fmt:message key="formulario.axismnt001"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
            }
            function f_but_aceptar() {
                if (document.miForm.radioCTABLA!=undefined && document.miForm.radioCTABLA.value!=null) {
                    f_seleccioname(document.miForm.radioCTABLA.value)
                }
                else {
                    alert("<fmt:message key="40350" />");
                }
            }

            function f_seleccioname(cttc) {
                var cttcArray=cttc.split("_");
                document.miForm.CTABLA.value=cttcArray[0]
                document.miForm.TABMAESTRO.value=cttcArray[0]
                document.miForm.TABDETALLE.value=cttcArray[0]
                document.miForm.CTIPO.value=cttcArray[0]
                
                objUtiles.ejecutarFormulario ("axis_axismnt002.do", "trabajo", document.miForm, "_self");
                
            }
            
            function f_onload(){
            }
        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation"/>

        <input type="hidden" name="CTABLA"/>
        <input type="hidden" name="TABMAESTRO"/>
        <input type="hidden" name="TABDETALLE"/>
        <input type="hidden" name="CTIPO"/>
        
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad">MODALIDAD</c:param>
                <c:param name="titulo">TITULO</c:param>
                <c:param name="formulario">FORMULARIO</c:param>
                <c:param name="form">axismnt001</c:param>
        </c:import>

    <!-- Area de campos  -->
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>

            <div class="displayspace">
                <c:set var="title0"></c:set>
                <c:set var="title1"><fmt:message key="105940" /></c:set>
                <display:table name="${sessionScope.axismnt001_lista}" id="miListaId" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" requestURI="axis_axismnt001.do?paginar=true">
                <%@ include file="../include/displaytag.jsp"%>
                <display:column headerClass="headwidth5 sortable" title="${title0}" media="html" autolink="false" sortable="false">
                    <div class="dspIcons"><input value="${miListaId['CTABLA']}_${miListaId['TABMAESTRO']}_${miListaId['TABDETALLE']}_${miListaId['CTIPO']}" type="radio" id="radioCTABLA" name="radioCTABLA"/></div>
                </display:column>
                <display:column title="${title1}" sortable="true" sortProperty="" headerClass="sortable"  media="html" autolink="false" >
                    <div class="dspText"><a href="javascript:f_seleccioname('${miListaId['CTABLA']}_${miListaId['TABMAESTRO']}_${miListaId['TABDETALLE']}_${miListaId['CTIPO']}');">${miListaId['TTABLA']}</a></div>
                </display:column>
                </display:table>
            </div>
            </td>
        </tr>
    </table>

    <c:import url="../include/botonera_nt.jsp"><c:param name="__botones">salir,aceptar</c:param></c:import>
    
    </form>
<c:import url="../include/mensajes.jsp" />
    </body>
</html>
