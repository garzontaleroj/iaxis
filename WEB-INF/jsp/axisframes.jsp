<%/*Revision:# z7Hw9PJZg1SCADG894XXuA== #*/%>
<%/*
*  Fichero: axisframes.jsp
*  @author <a href = "mailto:echristen@csi-ti.com">elmar Christen</a> 
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavi Gallego</a>
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a> 
*  
*  Pantalla principal que contiene el esqueleto del aplicativo (cabecera, cuerpo, pie y oculto)
*
*  Fecha: 22/10/2007
*/%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<html>
<head>
  <title><fmt:message key="aplicacion.nombre.corto"/></title>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
  <script type="text/javascript" src="scripts/jsClose.js"></script>
  <script language="Javascript">
    window.resizeTo(screen.availWidth, screen.availHeight);
    // Lo siguiente es para testear la resolución habitual
    // window.resizeTo(1024, 768);
    window.moveTo(0,0); 
    window.onunload = f_cerrar_app;
  </script>
</head>
 <frameset rows="75px,*,25px,1px" framespacing="0"  >
  <frame name="fcabecera" frameborder="0" src="main.do?operation=cabecera&dt=<%=new java.util.Date().getTime()%>" marginheight="0" noresize="NORESIZE"></frame>
  <frame name="ftrabajo" frameborder="0" src="main.do?operation=trabajo&dt=<%=new java.util.Date().getTime()%>" marginheight="0"  noresize="NORESIZE"></frame>
  <frame name="fpie" frameborder="0" src="main.do?operation=pie&dt=<%=new java.util.Date().getTime()%>" noresize="NORESIZE"></frame>
  <frame name="foculto" frameborder="0" src="main.do?operation=oculto&dt=<%=new java.util.Date().getTime()%>" noresize="NORESIZE"></frame>
</frameset>
</html>
