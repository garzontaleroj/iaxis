<%/**
*  Fichero: axisctr055.jsp
*  Pantalla de mantenimiento de cuenta de cargo.
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>  
*
*  Fecha: 19/01/2009
*/
%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
 
<html>
    <head>
        <title><fmt:message key="9000769"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          

        <style type="text/css">
            .displayspaceMaximo {
                width:99.8%;
                height: expression( this.scrollHeight > 349 ? "350px" : "auto" );
                max-height:350px;
                overflow-x: hidden;
                overflow-y: auto;
                border: 1px solid #DDDDDD;
            }
        </style>

        <c:import url="../include/carga_framework_js.jsp" />
        
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
            revisarEstilos();
                if (${empty requestScope.buscarOK})
                    f_abrir_axisctr019();
            }
            
            function f_but_aceptar() {
                if (objValidador.validaEntrada())
                    objUtiles.ejecutarFormulario ("axis_axisctr055.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr055", "cancelar", document.miForm, "_self");
            }           
            
            function f_but_buscar() {
                f_abrir_axisctr019();
            }
            
            /****************************************************************************************/
            /********************************* MODAL AXISCTR019 *************************************/
            /****************************************************************************************/
           
            function f_aceptar_axisctr019(SSEGURO) {
                f_cerrar_axisctr019();
                objDom.setValorPorId("SSEGURO", SSEGURO);
                objUtiles.ejecutarFormulario ("axis_axisctr055.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_cerrar_axisctr019(SSEGURO) {
                objUtiles.cerrarModal("axisctr019");
            }
            
            function f_abrir_axisctr019() {
                objUtiles.abrirModal
                        ("axisctr019", "src", "modal_axisctr019.do?operation=form");
            }
            
        </script>
    </head>
   
    <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
        
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>                        
            <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>   
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><fmt:message key="9000769"/></c:param> <%-- Mantenimiento de cuenta de cargo --%>
                <c:param name="titulo"><fmt:message key="9000769"/></c:param>     <%-- Mantenimiento de cuenta de cargo --%>
                <c:param name="form">axisctr055</c:param>
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisctr019|<fmt:message key="101908"/></c:param> <%-- Consulta de Pólizas --%>
            </c:import>
          
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp; </div>      
                        <div class="separador">&nbsp; </div>      
                        <!-- Área 1 -->
                        <table class="area" align="center">
                            <tr>
                                <th style="width:30%;height:0px"></th>
                                <th style="width:5%;height:0px"></th>
                                <th style="width:30%;height:0px"></th>
                                <th style="width:30%;height:0px"></th>
                            </tr>
                            <tr>
                                <td class="titulocaja">
                                    <b><fmt:message key="100836"/></b>   <%-- Póliza --%>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="titulocaja">
                                    <b><fmt:message key="101300"/></b>  <%-- Certificado --%>
                                </td>            
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <%-- Póliza --%>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:34%;" 
                                    value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA" readonly="readonly"
                                    alt="<fmt:message key="100836"/>" title="<fmt:message key="100836"/>"/>
                                    <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisctr019()" style="cursor:pointer" alt="<fmt:message key="9000508"/>" title="<fmt:message key="9000508"/>"/>                                
                                </td>           
                                <td>
                                    &nbsp;
                                </td>
                                <%-- Certificado --%>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:30%;" 
                                    value="${__formdata.NCERTIF}" name="NCERTIF" id="NCERTIF" readonly="readonly"
                                    alt="<fmt:message key="101300"/>" title="<fmt:message key="101300"/>"/>
                                </td>            
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="titulocaja">
                                    <b><fmt:message key="100965"/></b>   <%-- Cuenta bancaria --%>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="titulocaja">
                                    <b><fmt:message key="112211"/></b>   <%-- Cuenta de cargo --%>
                                </td>                    
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <%-- Cuenta bancaria --%>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:90%;" 
                                    value="${__formdata.CBANCAR}" name="CBANCAR" id="CBANCAR" readonly="readonly"
                                    alt="<fmt:message key="100965"/>" title="<fmt:message key="100965"/>"/>
                                </td>            
                                <td>
                                    &nbsp;
                                </td>
                                <%-- Cuenta de cargo --%>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:90%;" 
                                    value="${__formdata.CBANCOB}" name="CBANCOB" id="CBANCOB" obligatorio="true"
                                    alt="<fmt:message key="112211"/>" title="<fmt:message key="112211"/>"/>
                                </td>            
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="titulocaja" colspan = "4">
                                    <div class="separador">&nbsp; </div>                                        
                                    <b><fmt:message key="9000770"/></b>   <%-- Histórico de cuentas de cargo --%>
                                </td>                    
                            <tr>
                                <td colspan="4">
                                    <div class="separador">&nbsp; </div>                                        
                                    <%-- DisplayTag cuentas de cargo --%>
                                    <c:set var="title0"><fmt:message key="9000716"/></c:set>  <%-- F. ini. vigencia --%>
                                    <c:set var="title1"><fmt:message key="100965"/></c:set>   <%-- Cuenta bancaria --%>
                                    <c:set var="title2"><fmt:message key="112211"/></c:set>   <%-- Cuenta de cargo --%>
                                    <c:set var="title3"><fmt:message key="9000717"/></c:set>  <%-- F. fin vigencia --%>
        
                                    <div class="displayspaceMaximo">
                                        <display:table name="${requestScope.LSTHISTORICO}" id="LSTHISTORICO" export="false" class="dsptgtable" pagesize="-1" cellpadding="0" cellspacing="0"
                                             requestURI="axis_axisctr055.do?paginar=true">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="${title0}" sortable="true" sortProperty="FINIEFE" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                <div class="dspText">
                                                    <fmt:formatDate value="${LSTHISTORICO.FINIEFE}" pattern="dd/MM/yyyy"/>
                                                </div>
                                            </display:column>
                                            <display:column title="${title1}" sortable="true" sortProperty="TCBANCAR" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText">
                                                    ${LSTHISTORICO.TCBANCAR}
                                                </div>
                                            </display:column>
                                            <display:column title="${title2}" sortable="true" sortProperty="TCBANCOB" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText">
                                                    ${LSTHISTORICO.TCBANCOB}
                                                </div>
                                            </display:column>
                                            <display:column title="${title3}" sortable="true" sortProperty="FFINEFE" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                <div class="dspText">
                                                    <fmt:formatDate value="${LSTHISTORICO.FFINEFE}" pattern="dd/MM/yyyy"/>
                                                </div>
                                            </display:column>
                                        </display:table>                                                        
                                    </div>
                                </td>                               
                            </tr>
                        </table>           
                        
                        <div class="separador">&nbsp; </div>      
                        <c:import url="../include/botonera_nt.jsp">
                            <c:param name="f">axisctr055</c:param>
                            <c:param name="__botones">salir,aceptar</c:param>
                        </c:import>
                        
                    </td>
                </tr>
            </table>
            
        </form>
        <c:import url="../include/mensajes.jsp" />
        
    </body>
</html>
