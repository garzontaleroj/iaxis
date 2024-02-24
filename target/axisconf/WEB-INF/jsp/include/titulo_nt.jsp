<%/* Revision:# PuGJU0W7sO4UVuKoUXYs5A== # */%>
<%/*
*  Fichero: titulo_nt.jsp
*  @author <a href = "mailto:echristen@csi-ti.com">elmar Christen</a> 
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavi Gallego</a>
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a> 
*  
*  Cabecera del buscador modal
*
*  Fecha: 22/10/2007
*/%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page import="axis.mvc.control.AbstractDispatchAction"%>
<% // TODO Hacerlo con UseBean y JSTL %>
<% String TTITULO = (String) AbstractDispatchAction.topPila(request, "TTITULO"); %>
<c:set var="TTITULO"><%=(TTITULO!= null ? TTITULO : "")%></c:set>
<!-- Titulo -->
<%--
<table class="baseTitulo area seccion" cellspacing="0" style="margin-top:10px" >
    <!--tr>
    </tr-->
    <tr class="cabecera" style="height:12px">
        <td align="left">
            <div style="color:white; font-size:11px">[${param.form}] <b><c:if test="${!empty param.producto}">${param.producto}</c:if></b></div>
        </td>
        <td align="right">
            <div class="txt_aplicativo" style="margin-top:0px;width:95%;">${param.formulario}</div>
        </td>
    </tr>
</table> 
<div class="separador">&nbsp;</div>
--%>
<!--table cellpadding="0" cellspacing="0" align="center" style="border:0px;width:95%" -->
<table class="basetitulo" align="center" cellpadding="0" cellspacing="0">
    <tr>
    <td>
    <table>
    <tr>
        <td style="font-size:11px;color:white">[${param.form}] <b><c:if test="${!empty param.producto}">${param.producto}</c:if>   <c:if test="${empty param.producto}"><c:if test="${!empty TTITULO}">${TTITULO} </c:if></c:if><c:if test="${!empty param.titulo}">${param.titulo}</c:if><c:if test="${!empty param.modalidad}">, ${param.modalidad}</c:if></b>
        </td>
        <td style="font-size: 14px;text-align:right;vertical-align: middle;color:white">
            <b>${param.formulario}</b>&nbsp;
        </td>
<c:if test="${__showAyuda eq 1}">  
	        <td style="height:6px;">
	         <img src="images/ayuda2.gif" onclick="JsAyud()"/>
	        </td>
        </c:if>
    </tr>
    </table>
    </td>
    </tr>
</table> 
<script type="text/javascript">			
	function JsAyud(){				
		var ayudaUrl="ayuda.do?dt="+(new Date().getTime())+"&operation=ayudaTitulo&CFORM="+'${param.form}';
        var ayudaVentana=window.open(ayudaUrl, "AYUDA", "width=10,height=10,right=5,top=5,menubar=no,resizable=yes,scrollbars=yes,status=no,toolbar=no,location=no,dependent=yes");
        ayudaVentana.focus();				
	}
</script>