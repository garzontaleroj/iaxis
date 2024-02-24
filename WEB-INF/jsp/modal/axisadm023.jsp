<%/*
*  Fichero: axisadm023.jsp
*
*  Fecha: 19/02/2009
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><fmt:message key="9000959"/></title> <%-- Resumen del fichero CODA --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp"/>
   
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() { 
            revisarEstilos();
        }
        
        function f_but_salir() {
            parent.f_cerrar_modal('axisadm023');
        }
               
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><fmt:message key="9000959"/></c:param>     <%-- Resumen del fichero CODA --%>
                <c:param name="formulario"><fmt:message key="9000959"/></c:param> <%-- Resumen del fichero CODA --%>
                <c:param name="form">axisadm023</c:param>
        </c:import>        
   
        <input type="hidden" name="operation" value=""/>   
        
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    
                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <th style="width:2%;height:0px"></th>
                            <th style="width:33%;height:0px"></th>
                            <th style="width:33%;height:0px"></th>
                            <th style="width:31%;height:0px"></th>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="titulocaja">
                                <b><fmt:message key="1000574"/></b>   <%-- Fichero --%>
                            </td>
                            <td class="titulocaja">
                                <b><fmt:message key="100562"/></b>   <%-- Fecha --%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <%-- Fichero --%>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:80%;"
                                value="${__formdata.P_TNOMFILE}" name="P_TNOMFILE" id="P_TNOMFILE"
                                alt="<fmt:message key="1000574"/>" title="<fmt:message key="1000574"/>" readonly="readonly"/>
                            </td>            
                            <%-- Fecha --%>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:80%;"
                                value="<fmt:formatDate value='${__formdata.P_FPROCES}' pattern='dd/MM/yyyy'/>" name="P_FPROCES" id="P_FPROCES"
                                alt="<fmt:message key="100562"/>" title="<fmt:message key="100562"/>" readonly="readonly"/>
                            </td>            
                        </tr>

                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="titulocaja">
                                <b><fmt:message key="9000963"/></b>   <%-- Proceso CODA --%>
                            </td>
                            <td class="titulocaja">
                                <b><fmt:message key="9000964"/></b>   <%-- Banco --%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <%-- Proceso CODA --%>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:80%;"
                                value="${__formdata.SPROCES_AXISADM023}" name="SPROCES_AXISADM023" id="SPROCES_AXISADM023"
                                alt="<fmt:message key="9000963"/>" title="<fmt:message key="9000963"/>" readonly="readonly"/>
                            </td>            
                            <%-- Banco --%>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:80%;"
                                value="${__formdata.P_TBANCO}" name="P_TBANCO" id="P_TBANCO"
                                alt="<fmt:message key="9000964"/>" title="<fmt:message key="9000964"/>" readonly="readonly"/>
                            </td>            
                        </tr>                        
                        
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="titulocaja">
                                <b><fmt:message key="9000965"/></b>   <%-- Importe cobrado aut. --%>
                            </td>
                            <td class="titulocaja">
                                <b><fmt:message key="9000966"/></b>   <%-- Importe pendiente de cobrar --%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <%-- Importe cobrado aut. --%>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:80%;"
                                value="<fmt:formatNumber value="${__formdata.P_ICOBRADO}" pattern="###,##0.00"/>" name="P_ICOBRADO" id="P_ICOBRADO"
                                alt="<fmt:message key="9000965"/>" title="<fmt:message key="9000965"/>" readonly="readonly"/>
                            </td>            
                            <%-- Importe pendiente de cobrar --%>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:80%;"
                                value="<fmt:formatNumber value="${__formdata.P_IPENDCOB}" pattern="###,##0.00"/>" name="P_IPENDCOB" id="P_IPENDCOB"
                                alt="<fmt:message key="9000966"/>" title="<fmt:message key="9000966"/>" readonly="readonly"/>
                            </td>            
                        </tr>                        
                        
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="titulocaja">
                                <b><fmt:message key="9000967"/></b>   <%-- Importe impagado aut. --%>
                            </td>
                            <td class="titulocaja">
                                <b><fmt:message key="9000972"/></b>   <%-- Importe pendiente de impagar --%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <%-- Importe impagado aut. --%>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:80%;"
                                value="<fmt:formatNumber value="${__formdata.P_IIMPAGO}" pattern="###,##0.00"/>" name="P_IIMPAGO" id="P_IIMPAGO"
                                alt="<fmt:message key="9000967"/>" title="<fmt:message key="9000967"/>" readonly="readonly"/>
                            </td>            
                            <%-- Importe pendiente de impagar --%>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:80%;"
                                value="<fmt:formatNumber value="${__formdata.P_IPENIMP}" pattern="###,##0.00"/>" name="P_IPENIMP" id="P_IPENIMP"
                                alt="<fmt:message key="9000972"/>" title="<fmt:message key="9000972"/>" readonly="readonly"/>
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
    
    <c:import url="../include/mensajes.jsp"/>

</body>
</html>