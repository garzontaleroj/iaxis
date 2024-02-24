<%/*Revision:# PuGJU0W7sO4UVuKoUXYs5A== #*/%>
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
    function f_but_reconectar() {
        document.miForm.action="index.jsp";
        //Comentado Cchaverra : Bug: 40559/226587
        //document.miForm.target="_self";
        document.miForm.target = "_top";
        document.miForm.submit();
    }
    </script>
</head>
<body style="margin-top:10px">
    <form name="miForm" method="POST" action="" >
        <table class="basetitulo" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table>
                        <tr>
                            <td style="font-size:11px;color:white">
                                [axisexit] <b>
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
                        <fmt:message key="aplicacion.nombre" />
                    </div>    
                   <!-- Campos -->
                    <table class="seccion">
                        <tr>
                            <th style="width:100%; height:0px"></th>
                        </tr>
                        <tr>
                            <td align="center" class="campocaja">
                                <span style="color: #FF9900;font-size:12px;font-weight: bold;"><fmt:message key="9000706" /></span>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr> 
        </table>
        <table class="base area">
            <tr>
                <td align="right">           
                    <input type="button" id="but_reconectar" name="but_reconectar" onclick="f_but_reconectar()" class="boton" style="margin-right:20px;<c:if test="${param.sin_but_reconectar=='1'}">visibility:hidden;</c:if>" value="<fmt:message key='9000557'/>"/>
                </td>
            </tr>
        </table>
    </form>
    <div id="reloj" align="center" class="reloj"></div>
    <c:import url="./include/mensajes.jsp" />
</body>
</html>