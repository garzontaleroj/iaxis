<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setBundle basename="axis.bundle.Mensajes"/>
<head>
    <title>
        <fmt:message key="aplicacion.nombre.corto"/>
    </title>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="styles/genericosHtml.css"/>
    <link rel="stylesheet" href="styles/cabecera.css"/>
    <link rel="stylesheet" href="styles/axisnt.css"/>
    <c:import url="./include/carga_framework_js.jsp"/>
    <script language="Javascript">
    function f_onload() {
        revisarEstilos();
    }
</script>
</head>
<body onload="f_onload()"><form name="miForm" method="POST" action="">
        <input type="hidden" name="operation" value=""/>
        <table class="basetitulo" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table>
                        <tr>
                            <td style="font-size:11px;color:white">
                                [axishghlndr]
                                <b> </b>
                            </td>
                            <td style="font-size: 14px;text-align:right;vertical-align: middle;color:white">
                                <b><fmt:message key="aplicacion.nombre"/></b>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <div class="separador">&nbsp;</div>
    </form><c:import url="./include/mensajes.jsp"/></body>