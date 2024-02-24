<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%--
Fichero: botonera_nt.jsp
@author <a href = "mailto:echristen@csi-ti.com">Elmar Christen</a> 
Fecha: 29/11/2007
botonera
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>


<div class="separador">&nbsp;</div>
<table class="baseboton" align="center" cellpadding="0" cellspacing="0" >
        <tr>
        <td style="text-align:left">
            <c:forTokens delims="," items="${param.__botones}" var="but">
            <c:set var="item" value="${fn:substring(but,0, fn:indexOf(but,':')<0 ? fn:length(but): fn:indexOf(but,':'))}" />
            <c:set var="widthitem" value="${fn:substring(but, fn:indexOf(but,':')<0 ? fn:length(but): fn:indexOf(but,':')+1, fn:length(but) )}" />
            <c:set var="keyitem" value="${item}" />
            <c:set var="itemLiteral">
                <c:if test="${item == 'salir'}">100000</c:if>
                <c:if test="${item == 'cancelar'}">108211</c:if>                
                <c:if test="${item == 'cerrar'}">1000430</c:if>                 
            </c:set>
            <%try {%><c:set var="keyitem" value="${item+1-1}" /><%} catch(Exception e) {%><c:set var="keyitem" value="${itemLiteral}" /><%}%><c:if test="${item=='cancelar' || item=='salir' || item=='cerrar' }"><axis:ocultar c="BT_${keyitem}" f="${param.f}" dejarHueco="false" ><input type="button" class="boton" style="width:${widthitem}px;" id="but_${item}" value="<axis:alt f='${param.f}' c='BT_${keyitem}' lit='${keyitem}'></axis:alt>" onclick="f_but_test_auto_deshabilitar('${item}');f_but_alertCancelar(this.id)" /></axis:ocultar></c:if> 
            </c:forTokens>
        </td>
        <td style="text-align:right">
            <c:forTokens delims="," items="${param.__botones}" var="but">
            <c:set var="item" value="${fn:substring(but,0, fn:indexOf(but,':')<0 ? fn:length(but): fn:indexOf(but,':'))}" />
            <c:set var="widthitem" value="${fn:substring(but, fn:indexOf(but,':')<0 ? fn:length(but): fn:indexOf(but,':')+1, fn:length(but) )}" />
            <c:set var="itemLiteral">
                <c:if test="${item == 'buscar'}">9000508</c:if>
                <c:if test="${item == 'aceptar'}">100009</c:if>                
                <c:if test="${item == 'siguiente'}">112452</c:if>
                <c:if test="${item == 'anterior'}">112463</c:if>
                <c:if test="${item == 'anadir'}">104825</c:if>
                <c:if test="${item == 'guardar'}">1000081</c:if> 
                <c:if test="${item == 'editar'}">100002</c:if>     
                <c:if test="${item == 'imprimir'}">100001</c:if>    
                <c:if test="${item == 'nuevo'}">1000428</c:if>    
                <c:if test="${item == 'contratar'}">1000429</c:if>                       
                <c:if test="${item == 'documentacion'}">1000431</c:if>    
                <c:if test="${item == 'consultar_siniestros'}">1000432</c:if>    
                <c:if test="${item == 'apertura'}">1000433</c:if>    
                <c:if test="${item == 'continuar'}">1000434</c:if>
                <c:if test="${item == 'emitir'}">1000435</c:if>
                <c:if test="${item == 'diferir'}">9001507</c:if>
                <c:if test="${item == 'nueva_persona'}">1000436</c:if>
                <c:if test="${item == 'anadir_direccion'}">1000437</c:if>
                <c:if test="${item == 'anadir_CCC'}">1000438</c:if>
                <c:if test="${item == 'anular'}">100648</c:if>
                <c:if test="${item == 'consultar'}">1000439</c:if>
                <c:if test="${item == 'gravar'}">141075</c:if>
                <c:if test="${item == 'host'}">89905807</c:if>
                <c:if test="${item == 'duplicar'}">103669</c:if> <%-- IAXIS-3287 02/04/2019 --%>
                <c:if test="${item == 'confirmar'}">9900785</c:if> <%-- IAXIS-3287 02/04/2019 --%>
                
            </c:set>
            <%try {%><c:set var="keyitem" value="${item+1-1}" /><%} catch(Exception e) {%><c:set var="keyitem" value="${itemLiteral}" /><%}%><c:if test="${item!='cancelar' && item!='salir' && item!='cerrar'}"><axis:ocultar c="BT_${keyitem}" f="${param.f}" dejarHueco="false" ><input type="button" style="width:${widthitem}px;" <c:if test="${!empty param.tabindex && item == 'aceptar'}">tabindex="${param.tabindex}"</c:if> class="boton" id="but_${item}" value="<axis:alt f='${param.f}' c='BT_${item}' lit='${keyitem}'></axis:alt>" onclick="f_but_${item}()" /></axis:ocultar></c:if>

            </c:forTokens>
        </td>
        </tr>
</table>

<script language="Javascript">
<%-- ecg20131216 ver http://mantis.srvcsi.com/view.php?id=29402 ver --%>
var but_auto_deshabilitar_array=new Array();
<c:forTokens delims="," items="${param.__auto_deshabilitar_botones}" var="auto_deshabilitar_but" varStatus="status"><c:set var="item" value="${fn:substring(auto_deshabilitar_but,0, fn:indexOf(auto_deshabilitar_but,':')<0 ? fn:length(auto_deshabilitar_but): fn:indexOf(auto_deshabilitar_but,':'))}" />
but_auto_deshabilitar_array[${status.count}]="${item}";</c:forTokens>
function f_but_test_auto_deshabilitar(miItem) {
	//mira si boton "but_"+miItem se ha de auto-deshabilitar
	for (var i=0;i<but_auto_deshabilitar_array.length;i++) {
		if (but_auto_deshabilitar_array[i]==miItem) {
			f_but_deshabilitar(document.getElementById("but_"+miItem));
			break;
		}
	}
}
function f_but_deshabilitar(miItemObject) {
	try {
    	miItemObject.disabled=true;
	}
	catch(Excep) {
			//alert("deshabilitado "+Excep)
	}
}
function f_but_habilitar(miItemObject) {
	try {
    	miItemObject.disabled=false;
	}
	catch(Excep) {
			//alert("habilitado "+Excep)
	}
}

function f_but_alertCancelar(id) {
	try {
	<% 
	
	if (axis.mvc.view.VisibleTag.esComponenteVisibleDefectoNoVer(request, request.getParameter("f") , "ALERT_CANCELAR")) {%>
		var resultado = confirm('<axis:alt f="${param.f}" c="ALERT_CANCELAR" lit="9907782"/>'); 
            if(resultado){
                eval("f_"+id+"()");
            }
    <%}else{%>
   	eval("f_"+id+"()");
        <%}%>
	}
	catch(Excep) {
			//alert("habilitado "+Excep)
	}
}
</script>