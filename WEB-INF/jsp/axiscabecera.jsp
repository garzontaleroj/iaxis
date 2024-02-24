<%/* Revision:# l7RORi3hGFiXkcqbiV5RfQ== # */%>
<%/*
*  Fichero: axiscabecera.jsp
*  
*  Código asociado a la cabecera del aplicativo
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
<script language="Javascript" type="text/javascript" src="scripts/general.js"></script>
<link rel="stylesheet" href="styles/axisnt.css"></link>
<link rel="stylesheet" href="styles/cabecera.css"></link>
<link rel="stylesheet" href="styles/genericosHtml.css"></link>
<script language="Javascript" type="text/javascript">
function f_onunload() {
}
function f_onload() {
    //alert("f_onload()")
}

/*** Prevenir Backspace y F5 en IE6 ***/   
            if (document.all && navigator.userAgent.indexOf("MSIE 6.0") > -1) {
                document.onkeydown = function() {                     
                    if ( window.event && ( (window.event.keyCode == 8  && window.event.srcElement.type != "password") || window.event.keyCode == 116 )  ) {

                          if((window.event.srcElement.type != "text" && window.event.srcElement.type != "textarea") || (window.event.srcElement.disabled==true || window.event.srcElement.readOnly==true )){

                            window.event.keyCode = 505; 
                          }
                    }
                    
                    if (window.event.keyCode == 505) { 
                        return false; 
                    }
                }
            }               

</script>
        
        
    </head>
    <body style="width:100%;background-color: #FFFFFF;margin:0" onunload="f_onunload()" onload="f_onload()">
<table class="base area" cellspacing="0" cellpadding="0" border="0" style="background-color:#FFFFFF; width:95%" align="center">
	<tr >
		<td>&nbsp;<img src="images/logo1.png" height="65px"></td>
		<td style="text-align:right">&nbsp;<br /><fmt:message key="9902948" />:<b>${sessionScope.__usuario.nombre}</b> <br /><fmt:message key="9903501" />:<b><fmt:formatDate value="${sessionScope.__usuario.factuallogin}" pattern="dd/MM/yyyy hh:mm"/></b><br /><fmt:message key="9903504" />:<b><fmt:formatDate value="${sessionScope.__usuario.fultimologin}" pattern="dd/MM/yyyy hh:mm"/></b>
</td>
	</tr>
</table>
    </body>
</html>
<%@ page contentType="text/html;charset=windows-1252"%>
