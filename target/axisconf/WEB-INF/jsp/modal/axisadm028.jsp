<%/*
*  Fichero: axiadm028.jsp
*  Fecha: 09/02/2009
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
        }
                
        function f_but_aceptar() {
            if(objUtiles.estaVacio(document.miForm.seleccionaAccio))
                alert(objJsMessages.jslit_busca_primero);
            else{
                var hayChecked = objUtiles.f_GuardaCasillasChecked ("seleccionaAccio");

                if(typeof hayChecked == 'boolean') 
                    alert("<fmt:message key='9000849' />");
                else {
                    seleccionarLista(hayChecked);
                }
            }
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_axisadm028();
        }
        
        function seleccionarLista(CFORM){
            parent.f_aceptar_axisadm028(objDom.getValorPorId("NRECIBO"), CFORM);
        }
    
    </script>
  </head>
    <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }" >
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="NRECIBO" id="NRECIBO" value="${requestScope.NRECIBO}"/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><fmt:message key="1000568" /></c:param>
                <c:param name="producto"><fmt:message key="1000568" /></c:param>
                <c:param name="form">axisadm028</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="109253" />&nbsp;${requestScope.NRECIBO}</div>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:100%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <axis:visible f="axisadm021" c="TESTREC">
                                                <td class="titulocaja">
                                                    <b id="label_TESTREC"><fmt:message key="1000553" /></b>
                                                </td>
                                            </axis:visible>							
                                        </tr>
                                        <tr>
                                            <axis:visible f="axisadm028" c="TESTREC">
                                                <td class="campocaja">    
                                                    <input type="text" name="TESTREC" id="TESTREC" value="${requestScope.TESTREC}" class="campowidthinput campodisabled campotexto" style="width:75px;"
                                                    <axis:atr f="axisdm028" c="TESTREC" a="formato=entero&modificable=false&obligatorio=false"/> alt="<fmt:message key="1000553" />" title="<fmt:message key="1000553" />"/>
                                                </td>
                                            </axis:visible>
                                         </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="9000594" /></div>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                            <td align="left">
                                 <table border="0" class="area" align="left" style="width:100%;">
                                    <tr>
                                        <td>
                                            <c:set var="title1"><fmt:message key="9000844"/></c:set>
                                            <div class="displayspace">
                                            <display:table name="${requestScope.T_ACCIONES}" id="miListaId" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" requestURI="" sort="list" cellpadding="0" cellspacing="0">    
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title=" " sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                                    <div class="dspIcons"><input type="radio" id="seleccionaAccio" name="seleccionaAccio" value="${miListaId.CFORM}"></div>
                                                </display:column>
                                                <display:column title="${title1}" headerClass="sortable" sortProperty="TFORM" sortable="true" media="html" autolink="false" >
                                                    <div class="dspText">
                                                        <c:if test="${!empty miListaId.CFORM}">
                                                            <a href="javascript:seleccionarLista('${miListaId.CFORM}')">${miListaId.TFORM}</a>
                                                        </c:if>
                                                        <c:if test="${empty miListaId.CFORM}">
                                                            ${miListaId.TFORM}
                                                        </c:if>
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
                    </td>
                </tr>
            </table>						
            
            <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisadm021</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </form>
    <c:import url="../include/mensajes.jsp" />
    </body>
</html>

