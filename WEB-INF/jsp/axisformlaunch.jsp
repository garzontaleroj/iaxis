<%/**
*  Fichero: axisformlaunch.jsp
*  Espacio para el Oracle FORM
*  Incluye nuevo formato con títulos en la parte superior
*  @author <a href = "mailto:echristen@csi-ti.com">Elmar Christen</a>  
*  Fecha: 08/05/2008
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
    <head>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <c:import url="./include/carga_framework_js.jsp" />
        <script type="text/javascript">        
            window.resizeTo(screen.availWidth, screen.availHeight);
            window.moveTo(0,0); 
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            function f_onload() {
                document.miForm.submit()
            }
            function f_but_cancelar() {
                window.close()
            }           
            
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/
            
            // TODO Implementar CallBack Ajax

            
        </script>
    </head>
    <body  onload="f_onload()" >
        <c:import url="./include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
<%
String stringUrl=(String)request.getAttribute("stringUrl");
String preCGI=(stringUrl.indexOf("?")>0)?stringUrl:stringUrl.substring(0, stringUrl.indexOf("?"));
String queyString=(new java.net.URL(stringUrl)).getQuery(); if (queyString==null) queyString="";
String[] cgiParamPairs=queyString.split("&");
%>
<form name="miForm" action="<%=preCGI%>" method="POST" > 
<%
String pKey=null;
String pValue=null;
String[] cgiPair=null;
for (int i=0;i<cgiParamPairs.length;i++) {
    cgiPair=cgiParamPairs[i].split("=");
    pKey=cgiPair[0];
    if (cgiPair.length>1) {
        pValue=cgiPair[1];
    }
    else {
        pValue="";
    }
    %>
<input type="hidden" name="<%=pKey%>" value="<%=pValue%>" />
<%
}
%>
        
            <c:import url="./include/titulo_nt.jsp">
                <c:param name="formulario">ORACLE FORM LAUNCHER</c:param>
                <c:param name="form">axisformlaunch</c:param>
            </c:import>
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/>${__formdata.FORM_ACT}</div>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 2 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <tr>
                                            <th style="width:100%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <td class="campocaja" style="text-align:center">
                                                <img src="images/oracleformssplash.png" alt="Orcale FORM" title="Orcacle FORM" />
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
            <c:import url="./include/botonera_nt.jsp"><c:param name="__botones">cancelar</c:param></c:import>
        </form>
        <c:import url="./include/mensajes.jsp" />
    </body>
</html>