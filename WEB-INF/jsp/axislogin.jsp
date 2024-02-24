<%
request.getSession(true);
String miJSESSION=session.getId(); 
%>
<%/*
*  Fichero: index.jsp
*  @author <a href = "mailto:echristen@csi-ti.com">elmar Christen</a> 
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavi Gallego</a>
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a> 
*  
*  Primera pantalla generada por el flujo de struts.
*
*  Fecha: 22/10/2007
*/%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" import="axis.cache.ConfigCache, axis.daemon.AxisPlugIn, 
java.math.BigDecimal, org.apache.commons.logging.Log, org.apache.commons.logging.LogFactory"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- System.out.println( request.getHeader("ACCEPT-LANGUAGE") );--%>
<%!
static Log logger = LogFactory.getLog("index.jsp");
%>

<%
//Comprobamos si la aplicacin requiere de SingleSignOn o no. Metodologa:
//1-Si jcifsso.activo existe y no est vaco -> jcifsso.activo nos dice si la app requiere autologin o no.
//2-Si jcifsso.activo no existe o est vaco -> Miramos el valor de AxisPlugIn.AUTOLOGINGRANTED para saber si la app permite autologin.
//     2.1-AxisPlugIn.AUTOLOGINGRANTED=true -> Permite.
//     2.2-AxisPlugIn..AUTOLOGINGRANTED=false -> No Permite.
//3-Si 1- o 2- no existen -> No se permite autologin
boolean jcifssoActivo;
try{
    String sJcifssoActivo = ConfigCache.getConfig().getProperty("jcifsso.activo");

    if(!"".equals(sJcifssoActivo) && sJcifssoActivo != null){
        jcifssoActivo = Boolean.valueOf(sJcifssoActivo);
    }else{
        throw new Exception();
    }
}catch(Exception e){
    try{
        jcifssoActivo = AxisPlugIn.AUTOLOGINGRANTED;
    }catch (Exception ex){
        jcifssoActivo = false;
    }
}

logger.debug("La aplicacin requiere validacin por autologin? " + ((jcifssoActivo)? "SI" : "NO"));
%>
<c:set var="isDebugAjaxEnabled" value="false" scope="application"/>
<% if (jcifssoActivo){
    logger.debug("Llamamos a /indexsso.jsp para validacin por autologin.");
%>
    <c:redirect url="/indexsso.jsp"/>
<%}else{
    logger.debug("Llamamos a /axis.do para validacin por login.");
%> 
    <c:redirect url="/axis.do"/>
<%}%>
