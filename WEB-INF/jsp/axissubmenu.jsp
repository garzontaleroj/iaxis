<%/*
*  Fichero: axissubmenu.jsp
*  @author <a href = "mailto:echristen@csi-ti.com">elmar Christen</a> 
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavi Gallego</a>
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a> 
*  
*  Pantalla que printea el submenú asociado al menú principal (axismenu.jsp)
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
        <link rel="stylesheet" href="styles/genericosHtml.css"></link>
        <link rel="stylesheet" href="styles/menu.css" />
        <c:import url="./include/carga_framework_js.jsp" />
        <script language="Javascript" type="text/javascript">
            function iniciarFlujo(PRODUCTO, MODO, FORM_ACT) {
                document.miFormMenu.PRODUCTO.value=PRODUCTO;
                document.miFormMenu.MODO.value=MODO;
                document.miFormMenu.FORM_ACT.value=FORM_ACT;
                
                objUtiles.ejecutarFormulario("flujodetrabajo.do", "init", document.miFormMenu, "ftrabajo");
            }
            /*
            function f_activar_submenu_inicial(childInicial){
                document.getElementById(childInicial).style.display="";
            } 
            */
        </script>
    </head>
    <!-- <body onLoad="f_activar_submenu_inicial('8_titulo')"> -->
    <body>
    <form name="miFormMenu" method="POST" action="" >    
        <input type="hidden" name="operation" value="" />
        <input type="hidden" name="PRODUCTO" value="" />
        <input type="hidden" name="MODO" value="" />
        <input type="hidden" name="FORM_ACT" value="" />
        
        <%-- <xsl:apply xml="/WEB-INF/xsl/menu.xml" xsl="/WEB-INF/xsl/menu2.xslt"/> --%>
        <c:import url="./include/mensajes.jsp" />
    </form>
    </body> 
</html>
