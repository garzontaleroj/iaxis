<%/*
*  Fichero: axisblanc.jsp
*  @author <a href = "mailto:echristen@csi-ti.com">elmar Christen</a> 
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavi Gallego</a> 
*  
* 
*
*  Fecha: 22/10/2007
*/%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle basename="axis.bundle.Mensajes"/>
<html>
    <head>
        <c:import url="../include/carga_framework_js.jsp" />
        <script language="Javascript" type="text/javascript">
            function f_onunload() {
            }
            function f_onload() {
            }
        </script>
    </head>
    <body onunload="f_onunload()" onload="f_onload()">
        <form name="miFormOculto">
        </form>
    </body>
</html>
<%@ page import=""%>