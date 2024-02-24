<%/* Revision:# PuGJU0W7sO4UVuKoUXYs5A== # */%>
<%/*
*  Fichero: axistrabajo.jsp
*  @author <a href = "mailto:echristen@csi-ti.com">elmar Christen</a> 
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavi Gallego</a>
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a> 
*  
*  Pantalla que printea el cuerpo del aplicativo. Inicialmente tendrá una pantalla de presentación.
*  Posteriormente contendrá todo el trabajo asociado con los diferentes formularios del aplicativo.
*
*  Fecha: 22/10/2007
*/%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"  import="org.apache.commons.logging.*"%>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<fmt:setLocale value="${sessionScope.__locale}"/>
<html>
<head>
</head>

<c:set var="sessionDidInvalidate" value="${requestScope.sessionDidInvalidate}"/>

<% 
logger.debug("PuissanceSuperieureGarbageCollector");
Runtime.getRuntime().gc();
Runtime.getRuntime().gc();
Runtime.getRuntime().gc();
int minFreeMemory=24;
logger.debug("Memoria antes: "+ Runtime.getRuntime().freeMemory() +" Memoria liberada : "+ Runtime.getRuntime().totalMemory()+" Memoria Actual : "+ Runtime.getRuntime().maxMemory());

if (Runtime.getRuntime().freeMemory()/1048576 <minFreeMemory ) {
    long fMB1=Runtime.getRuntime().freeMemory()/1048576;
    Runtime.getRuntime().gc();
    long fMB2=Runtime.getRuntime().freeMemory()/1048576;
    logger.debug("freeMemory debajo de "+minFreeMemory+"MB: "+(fMB1)+"MB se ejecuta el gc y se llego a: "+(fMB2)+"MB (liberados:"+(fMB2-fMB1)+"MB)");
}
%>

<frameset cols="*,95%,*" framespacing="0">
    <frame frameborder="0" src="blanco.html" marginheight="0" noresize="NORESIZE" marginwidth="0"></frame>
    <frameset cols="360px,*,200px" framespacing="0" >
        <frame name="f_menu" frameborder="0" src="main.do?operation=menu&dt=<%=new java.util.Date().getTime()%>" marginheight="0" noresize="NORESIZE" marginwidth="0"></frame>
        <frame name="f_teaser" frameborder="0" src="main.do?operation=teaser&dt=<%=new java.util.Date().getTime()%>&sessionDidInvalidate=${sessionDidInvalidate}" noresize="NORESIZE" marginwidth="0"></frame>
        <frame name="f_submenu" frameborder="0" src="main.do?operation=submenu&dt=<%=new java.util.Date().getTime()%>" noresize="NORESIZE" marginwidth="0"></frame>
    </frameset>
    <frame frameborder="0" src="blanco.html" marginheight="0" noresize="NORESIZE" marginwidth="0"></frame>
</frameset>

</html>
<%
logger.debug("PuissanceSuperieureGarbageCollector");
Runtime.getRuntime().gc();
Runtime.getRuntime().gc();
Runtime.getRuntime().gc();
Runtime.getRuntime().gc();
%>
<%! static Log logger = LogFactory.getLog("jsp.axistrabajo"); %>
