<%/*
*  Fichero: axiserror.jsp
*  @author <a href = "mailto:echristen@csi-ti.com">elmar Christen</a> 
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavi Gallego</a>
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a> 
*  
*  Pantalla que printea la aparición de campos ocultos en una página jsp
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
        <c:import url="include/carga_framework_js.jsp" />
        <script language="Javascript" type="text/javascript">
            function f_onunload() {
            }
            
            function f_onload() {                                           
            }
            
            /*function f_onload() {                                           
                var maxInactiveInterval = <%= session.getMaxInactiveInterval() %>;                
                setInterval("f_check_session(maxInactiveInterval)", 1000);
            }
            
            function f_check_session(maxInactiveInterval) {
            // getLastAccessedTime
                
            }*/
            
        </script>
    </head>
    <body onload="f_onload()" onunload="f_onunload()">
        <form name="miFormOculto" method="POST" action="axis.do" >
            <input type="hidden" name="operation" value="aceptar" />
            <input type="hidden" name="USUARIO" id="USUARIO" value="${sessionScope.__usuario.usuario}"/>
            <input type="hidden" name="PWD" id="PWD" value="${sessionScope.__usuario.pwd}"/>
        </form>
    </body>
</html>
