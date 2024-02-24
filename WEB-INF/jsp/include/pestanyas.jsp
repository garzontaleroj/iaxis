<%/*
* Pestaña parametrizable, requiere como parametros de entrada el texto y el destino de las pestañas
*/%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<style type="text/css">
.pestanya_div {
    background-color:transparent;border-bottom:3px solid rgb(0,96,0)
}
.pestanya_item {
    height:20px;
    text-align:center;
}
.pestanya_activa_fondo {
    background-color:rgb(0,96,0);
}
.pestanya_pasiva_fondo {
    background-color:rgb(255,165,0);
}
.pestanya_activa_border {
    border:1px solid silver;
    border-bottom:1px solid rgb(0,96,0);
}
.pestanya_pasiva_border {
    border:1px solid silver;
}
.pestanya_activa_texto {
    color:white;
    font-size:11px;
    font-family: Arial;
}
.pestanya_pasiva_texto {
    color:black;
    font-size:11px;
    font-family: Arial;
}
</style>
<div class="pestanya_div">
<br />
<%
String tabwidth=request.getParameter("tabwidth");
if (tabwidth==null) {
    tabwidth="180px";
}
String yosoy=request.getParameter("yosoy"); 
if (yosoy==null) {
    yosoy="";
}
String pitems=request.getParameter("pitems"); 
if (pitems==null) { 
    pitems="";
}
String[] items=StringUtils.split(pitems.trim(),"|");

for (int i=0;i<items.length;i++) {
    String[] fracciones=StringUtils.split(items[i].trim(),"@");
    String id=fracciones[0];
    String texto=fracciones[1];
    if (yosoy.equals(id)) {
%><input type="button" class="pestanya_item pestanya_activa_fondo pestanya_activa_border pestanya_activa_texto" style="padding:0;margin:0px;width:<%=tabwidth%>; " value="<%=fracciones[1]%>" onclick="f_pestanya_click('<%=fracciones[0]%>')"/><%
    }
    else {
%><input type="button" class="pestanya_item pestanya_pasiva_fondo pestanya_pasiva_border pestanya_pasiva_texto" style="padding:0;margin:0px;width:<%=tabwidth%>; " value="<%=fracciones[1]%>" onclick="f_pestanya_click('<%=fracciones[0]%>')" /><%
    }
}
%>
</div>
<%@page import="org.apache.commons.lang.*"%>