<%/**
*  Fichero: axisimp002.jsp
*  Pantalla de alta de impuestos por empresa.
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>  
*
*  Fecha: 30/12/2008
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
        <title><fmt:message key="1000233"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          

        <c:import url="../include/carga_framework_js.jsp" />
        
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
                var grabarOK = ${requestScope.grabarOK == 0};
                if (grabarOK)
                    parent.f_aceptar_modal("axisimp002");
            }
            
            function f_but_cancelar() {
                parent.f_cerrar_modal("axisimp002");
            }           
            
            function f_but_aceptar() {
                if (objValidador.validaEntrada())
                    objUtiles.ejecutarFormulario ("modal_axisimp002.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
        </script>
    </head>
    
    <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>             
            <input type="hidden" name="CEMPRES" id="CEMPRES" value="${__formdata.CEMPRES}"/>             
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><fmt:message key="9000693"/></c:param> <%-- Alta de impuestos por empresa --%>
                <c:param name="titulo"><fmt:message key="9000693"/></c:param>     <%-- Alta de impuestos por empresa --%>
                <c:param name="form">axisimp002</c:param>
            </c:import>
            
            <!-- Área de campos  -->
            <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp; </div>                                        
                        <!-- Sección 1 -->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja">
                                                <b><fmt:message key="101619"/></b>   <%-- Empresa --%>
                                            </td>
                                            <td class="titulocaja">
                                                &nbsp;
                                            </td>                    
                                        </tr>
                                        <tr>
                                            <%-- Empresa --%>
                                            <td class="campocaja">
                                                ${__formdata.TEMPRES}
                                            </td>
                                        <tr>
                                        <tr>
                                            <td class="titulocaja">
                                                <b><fmt:message key="9000715"/></b>   <%-- Concepto --%>
                                            </td>
                                            <td class="titulocaja">
                                                &nbsp;
                                            </td>                    
                                        </tr>
                                        <tr>
                                            <%-- Concepto --%>
                                            <td class="campocaja">
                                                <select name="CCONCEP" id="CCONCEP" size="1" class="campo campotexto_ob" style="width:90%" obligatorio="true"
                                                title="<fmt:message key="101619"/>">
                                                    <option value="null"> - <fmt:message key="1000348"/> - </option>
                                                    <c:forEach items="${__formdata.LSTCONCEPTOS}" var="item">
                                                        <option value = "${item.CATRIBU}" <c:if test="${__formdata.CCONCEP != 'null' && __formdata.CCONCEP == item.CATRIBU}"> selected </c:if>>${item.TATRIBU}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                    </table>           
                                </td>
                            </tr>
                        </table>
                        <div class="separador">&nbsp; </div>                                        
                        <c:import url="../include/botonera_nt.jsp">
                            <c:param name="f">axisimp002</c:param>
                            <c:param name="__botones">cancelar,aceptar</c:param>
                        </c:import>
                    </td>
                </tr>
            </table>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>
