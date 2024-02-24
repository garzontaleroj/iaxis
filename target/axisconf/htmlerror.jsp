<%-- Página a la cual se accede si ocurre cualquier error de retorno del servidor web (Ex:400, 500, etc)--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" isErrorPage="true" import="axis.cache.ConfigCache, axis.mvc.control.AbstractDispatchAction,
org.apache.commons.logging.Log, org.apache.commons.logging.LogFactory"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle basename="axis.bundle.Mensajes"/>
<% 
Log logger = LogFactory.getLog("axiserror.jsp");
String propertySesionActivarReconexion = ConfigCache.getConfig().getProperty("sesion.activar.reconexion"); 
boolean sesionActivarReconexion = !"false".equals(propertySesionActivarReconexion);
%>
<c:set var="sesionActivarReconexion">
    <%= sesionActivarReconexion %>
</c:set>
<html>
    <head>
        <link rel="stylesheet" href="styles/genericosHtml.css"/>
        <link rel="stylesheet" href="styles/axisnt.css"/>
        <script language="Javascript">
        
        var sesionActivarReconexion = <%= sesionActivarReconexion %>;
        var myLocation = sesionActivarReconexion ? "main.do?operation=trabajo" : "axis.do?operation=forceUserLogout";
        
        function f_reconectar(obj, nivel) {
            try {
                                
                if(obj){
                    if (nivel==1 && sesionActivarReconexion){                                            
                        document.miForm.USUARIO.value = obj.document.getElementById("USUARIO").value;
                        document.miForm.PWD.value = obj.document.getElementById("PWD").value;
                        document.miForm.submit();                                       
                    }else if(nivel==2){
                        parent.document.location = myLocation;                        
                    }else if(nivel==3){
                        parent.parent.document.location = myLocation;
                    }else if(nivel==4){
                        parent.parent.parent.document.location = myLocation;
                    }else if(nivel==5){
                        parent.parent.parent.parent.document.location = myLocation;
                    }else if(nivel==6){
                        parent.parent.parent.parent.parent.document.location = myLocation;
                    }
                }else{
                    
                    if(nivel==1)
                        f_reconectar(window.parent.parent.frames['foculto'], 2);
                    else if(nivel==2)
                        f_reconectar(window.parent.parent.parent.frames['foculto'], 3);
                    else if(nivel==3)
                        f_reconectar(window.parent.parent.parent.parent.frames['foculto'], 4);
                    else if(nivel==4)
                        f_reconectar(window.parent.parent.parent.parent.parent.frames['foculto'], 5);
                    else if(nivel==5)
                        f_reconectar(window.parent.parent.parent.parent.parent.parent.frames['foculto'], 6);
                    else if(nivel==6)
                        f_reconectar(window.parent.parent.parent.parent.parent.parent.parent.frames['foculto'], 7);
                }
            } catch (e) {            
            }
        }
        
        function f_but_reconectar() {            
            if (!window.parent.frames['foculto']) {    
                if (document.getElementById("USUARIO") && document.getElementById("USUARIO").value != "" && sesionActivarReconexion) {
                    document.miForm.USUARIO.value = document.getElementById("USUARIO").value;
                    document.miForm.PWD.value = document.getElementById("PWD").value;
                    document.miForm.submit();                                       
                } else {                    
                    // Si no podemos recuperar el usuario porque no existe, tenemos que ir al login
                    setTimeout("f_redirect()", 1000);
                }
            } else {            
                f_reconectar(window.parent.frames['foculto'], sesionActivarReconexion ? 1 : 2);            
            }
        }
        
        function f_onload() {            
            f_but_reconectar();
            document.getElementById("cuerpo").visibility = "visible";
        }
        
        function f_redirect() {
            document.location = "<%=request.getContextPath()%>/axis.do?operation=forceUserLogout";
        }
        
    </script>
    </head>
    <body style="margin-top:10px" onload="f_onload()"><form name="miForm" method="POST" action="axis.do">
            <input type="hidden" name="operation" value="reconectar"/>
            <input type="hidden" name="USUARIO" value=""/>
            <input type="hidden" name="PWD" value=""/>
            <div id="cuerpo" style="visibility:hidden;display:none">
                <%-- <c:if test="${!sesionActivarReconexion}">--%>
                 
                <table class="base area seccion">
                    <tr class="cabecera" style="height:15px; background-color:red">
                        <td align="right">
                            <div class="txt_aplicativo" style="margin-top:0px;width:95%">
                                <fmt:message key="aplicacion.nombre"/>
                            </div>
                        </td>
                    </tr>
                </table>
                 
                <div class="separador">&nbsp;</div>
                 
                <!-- Area de campos  -->
                 
                <table class="base area campos">
                    <tr>
                        <td>
                            <!-- Titulo seccion -->
                            <div class="titulo">
                                <img src="images/flecha.gif"/>
                                 
                                <fmt:message key="1000140"/>
                                 
                                <c:if test="${! empty param.code}">
                                    , 
                                    <fmt:message key="1000109"/>
                                    ${param.code}
                                </c:if>
                            </div>
                            <!-- Campos -->
                            <table class="seccion">
                                <tr>
                                    <th style="width:25%; height:0px">
                                        &nbsp;
                                    </th>
                                    <th style="width:75%; height:0px">
                                        &nbsp;
                                    </th>
                                </tr>
                                <tr>
                                    <td class="campocaja" colspan="2">
                                        <c:if test="${param.code==400}">
                                            <fmt:message key="1000128"/>
                                        </c:if>
                                        <c:if test="${param.code==402}">
                                            <fmt:message key="1000129"/>
                                        </c:if>
                                        <c:if test="${param.code==403}">
                                            <fmt:message key="1000130"/>
                                        </c:if>
                                        <c:if test="${param.code==404}">
                                            <fmt:message key="1000131"/>
                                        </c:if>
                                        <c:if test="${param.code==500}">
                                            <fmt:message key="1000132"/>
                                        </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="campocaja">
                                        <fmt:message key="103694"/>
                                    </td>
                                    <td class="campocaja">
                                        <%= request.getParameterMap() %>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="campocaja">
                                        <fmt:message key="1000143"/>
                                    </td>
                                    <td class="campocaja">
                                        <script language="Javascript">document.write(location.href)</script>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="campocaja">
                                        <fmt:message key="1000142"/>
                                    </td>
                                    <td class="campocaja">
                                        <%= request.getRequestURL() %>
                                    </td>
                                </tr>
                            <%  if (exception != null) {  %>
                                <tr>
                                    <td class="campocaja">
                                        <fmt:message key="1000137"/>
                                    </td>
                                    <td class="campocaja">
                                        <% logger.error("Error", exception);  %>
                                    </td>
                                </tr>
                                <% } %>
                            </table>
                        </td>
                    </tr>
                </table>
                 
                <div class="separador">&nbsp;</div>
                 
                <table class="base area">
                    <tr>
                        <td align="left">
                            <c:set var="mensajeBoton">
                                ${sesionActivarReconexion ? 9000557 : 9000561}
                            </c:set>
                            <input type="button" onclick="f_but_reconectar()" id="but_reconectar" class="boton" value="<fmt:message key='${mensajeBoton}'/>"/>
                        </td>
                    </tr>
                </table>
                 
                <c:import url="./WEB-INF/jsp/include/mensajes.jsp"/>
            </div>
        </form></body>
</html>
