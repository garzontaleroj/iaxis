<%/*
*  Fichero: axisautologin.jsp
*  @author <a href = "mailto:echristen@csi-ti.com">elmar Christen</a> 
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavier Gallego</a> 
*
*  Pantalla que printea la primera pantalla del aplicativo en el caso de un autologin: petición de login (automatica) - pendiente de implementar en cada caso
*
*  Fecha: 16/11/2007
*/%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle basename="axis.bundle.Mensajes"/>
<html>
<head>
    <title><fmt:message key="aplicacion.nombre.corto"/></title>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="styles/genericosHtml.css" />
    <link rel="stylesheet" href="styles/cabecera.css" />
    <link rel="stylesheet" href="styles/axisnt.css" />
    <c:import url="./include/carga_framework_js.jsp" />
    <script language="Javascript">
    function medianoche() {
        var ahora = new Date();
        ahora.setHours       (23);
        ahora.setMinutes     (59);
        ahora.setSeconds     (59);
        ahora.setMilliseconds(999);
        return ahora;
    }   
    function f_but_aceptar() {
        setCookie ('iaxis_CMENU', null, medianoche());
        objUtiles.ejecutarFormulario("axis.do","aceptar",document.miForm, "_self");
    }
    function f_onload() {
    
       <c:if test="${!empty __formdata.listValores.lstempresas && fn:length(__formdata.listValores.lstempresas) == 1}">
            setCookie ('iaxis_CMENU', null, medianoche());
            objUtiles.ejecutarFormulario("axis.do","aceptar",document.miForm, "_self");
        </c:if>
    }
    function setCookie(name, value, expires, path, domain, secure) {
            document.cookie = name + "=" + escape(value) +
            ((expires == null) ? "" : "; expires=" + expires.toGMTString()) +
            ((path == null) ? "" : "; path=" + path) +
            ((domain == null) ? "" : "; domain=" + domain) +
            ((window.location.protocol == "https:") ? "; secure" : "") +
            "; HttpOnly";
    }
    </script>
</head>
<body style="margin-top:10px" onload="f_onload()">
    <form name="miForm" method="POST" action="" >
        <input type="hidden" name="operation" value="" />
        <input type="hidden" name="USUARIO" value="${__formdata.USUARIO}" />
        <input type="hidden" name="PWD" value="${__formdata.PWD}" />
        <c:if test="${!empty __formdata.listValores.lstempresas && fn:length(__formdata.listValores.lstempresas) == 1  }">
            <input type="hidden" name="CEMPRES" value="${__formdata.listValores.lstempresas[0].CEMPRES}" />
        </c:if>
        <input type="hidden" name="PUESTO" value="${__formdata.PUESTO}" />
        <input type="hidden" name="AUTOLOGIN" value="AUTOLOGIN" />
        <input type="hidden" name="OFICINA" value="${__formdata.OFICINA}" />
        <table class="basetitulo" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table>
                        <tr>
                            <td style="font-size:11px;color:white">
                                [axisautologin] <b>
                            </td>
                            <td style="font-size: 14px;text-align:right;vertical-align: middle;color:white">
                                <b><fmt:message key="aplicacion.nombre" /></b>&nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <div class="separador">&nbsp;</div>
        <!-- Area de campos  -->
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <!-- Titulo seccion -->
                    <div class="titulo"> 
                        <img  src="images/flecha.gif"/>
                        <fmt:message key="aplicacion.nombre" /> - AUTOLOGIN...
                    </div>    
                   <!-- Campos -->
                    <c:choose>
                        <c:when test="${!empty __formdata.listValores.lstempresas && fn:length(__formdata.listValores.lstempresas) > 1 }">
                            <table class="seccion">
                                <tr> 
                                    <th style="width:50%; height:0px"></th>
                                </tr>
                                <tr>
                                    <td class="titulocaja">
                                        <b><fmt:message key="101619"/></b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="campocaja">
                                        <select name="CEMPRES" id="CEMPRES" size="1" class="campowidthselect campo campotexto" style="width:30%;">
                                            <c:forEach var="element" items="${__formdata.listValores.lstempresas}">
                                                <option value = "${element.CEMPRES}" 
                                                    <c:if test="${element.CEMPRES == __formdata.CEMPRES}"> selected </c:if> />
                                                        ${element.TEMPRES} 
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                        </c:when>
                        <c:otherwise>
                            <table class="seccion">
                                <tr>
                                    <th style="width:100%; height:0px"></th>
                                </tr>
                                <tr>
                                    <td align="center" class="campocaja">
                                        <span style="color: #FF9900;font-size:12px;font-weight: bold;"><fmt:message key="9000705"/>&nbsp;&nbsp;&nbsp;<img border="0" height="16px" width="16px" src="images/anibusy.gif"></span>
                                    </td>
                                </tr>
                            </table>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr> 
        </table>
        <!--Botonera -->
        <c:if test="${!empty __formdata.listValores.lstempresas && fn:length(__formdata.listValores.lstempresas) > 1 }">
            <c:import url="./include/botonera_nt.jsp"><c:param name="__botones">aceptar</c:param></c:import>
        </c:if>
    </form>
    <div id="reloj" align="center" class="reloj"></div>
    <c:import url="./include/mensajes.jsp" />
</body>
</html>
