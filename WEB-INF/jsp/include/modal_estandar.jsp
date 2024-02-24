<%/* Revision:# ZId1SPmhGCZOn0vttK6GjA== # */%>

<%@ page contentType="text/html;charset=windows-1252"%>
<%
/*
*  Fichero: modal_estandard.jsp
*  @author <a href = "mailto:echristen@csi-ti.com">Elmar Christen</a>
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavi Gallego</a> 
*  
*  Código que genera la ventana modal que mostrará el formulario para búsqueda de personas.
*
*  Fecha: 16/10/2007
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- ${param.nid} -->
<c:if test="${! empty param.nid}">
    <c:set var="visibilityButCerrar">
        ${param.botonCerrar == "true" || param.botonCerrar == true ? "visible" : "hidden" }
    </c:set>
    <input type="hidden" id="visiblity_but_cerrar_modal_${param.nid}" value="${visibilityButCerrar}"/>
    
    <iframe id="modal4ie" src="" class="positionFixed" style="z-index:19;visibility:hidden;display:none;width:100%;height:100%;filter:progid:DXImageTransform.Microsoft.Chroma(Color='#ffffff');border-color=red;border-width: 1px;" frameborder="0" marginwidth="0" ></iframe>
    <span id="mw_${param.nid}_b" class="positionFixed positionFixedScroll fixedProperties" style="z-index:20;margin:0px;height:100%;width:100%;visibility:hidden;display:none;background-image:url('images/modalback.gif');background-repeat:repeat;filter:alpha(opacity=70);border=2;border-color:red"></span> <!--filter:alpha(opacity=75);opacity:.25; -->
    <span id="mw_${param.nid}_s" class="positionFixed fixedProperties" style="z-index:30;height:1px;width:1px;visibility:hidden;display:none;">
        <c:choose>
            <c:when test="${param.modalModo=='SOLOX'}">
        <table width="100%" style="background-color:transparent; border:0" cellspacing="0" cellpadding="0">
            <tr><td style="text-align:right"><img id="but_cerrar_modal_${param_nid}" name="but_cerrar_modal_${param_nid}" src="images/but_cerrar.gif" border="0" style="cursor:pointer" onclick="objUtiles.cerrarModal('${param.nid}')" /></td></tr>
        </table>
            </c:when>
            <c:otherwise>
        <table width="100%" style="background-color:darkblue; border:2px solid silver" cellspacing="0" cellpadding="0">
            <tr><td style="width:1%;text-align:left"><img src="images/but_modal.gif" border="0" align="middle" style="margin-left:5px;margin-right:5px" /></td>
            <td style="width:90%;color:white;font-size:10px;text-align:left">${param.titulo}</td>
            <td style="width:9%;text-align:right"><img id="but_cerrar_modal_${param.nid}" name="but_cerrar_modal_${param.nid}" src="images/but_cerrar.gif" border="0" style="cursor:pointer" onclick="objUtiles.cerrarModal('${param.nid}')" /></td></tr>
        </table>
            </c:otherwise>
        </c:choose>
        <iframe id="mw_${param.nid}_f" name="mw_${param.nid}_fn" scrolling="yes"  style="height:100%; width:100%;background-color:white;z-index:1;SCROLLING:YES;border:1px solid silver" src="blanco.html" ></iframe>
    </span>
</c:if>
<c:forTokens delims="#" items="${param.nid_y_titulo}" var="item">
    <c:forTokens delims="|" items="${item}" var="item2" varStatus="status2">
        <c:if test="${status2.count==1}"><c:set var="param_nid" value="${item2}" /></c:if>
        <c:if test="${status2.count==2}"><c:set var="param_titulo" value="${item2}" /></c:if>
        <c:set var="param_botonCerrar" value="false"/>
        <c:if test="${status2.count==3}"><c:set var="param_botonCerrar" value="${item2}" /></c:if>
        <c:set var="visibilityButCerrar">
            ${param_botonCerrar == "true" || param_botonCerrar == true ? "visible" : "hidden" }
        </c:set>
    </c:forTokens>
    
    <input type="hidden" id="visiblity_but_cerrar_modal_${param_nid}" value="${visibilityButCerrar}"/>

    <iframe  id="modal4ie" src="" class="positionFixed fixedProperties" style="z-index:19;visibility:hidden;display:none;width:100%;height:100%;filter:progid:DXImageTransform.Microsoft.Chroma(Color='#ffffff');border-color=red;border-width: 1px;"  frameborder="0" ></iframe>
    <span id="mw_${param_nid}_b" class="positionFixed positionFixedScroll fixedProperties" style="z-index:20;margin:0px;width:100%;height:100%;visibility:hidden;display:none;background-image:url('images/modalback.gif');background-repeat:repeat;filter:alpha(opacity=70);border=2;border-color:red"></span><!--filter:alpha(opacity=25)-->
    <span id="mw_${param_nid}_s" class="positionFixed" style="z-index:30;height:1px;width:1px;visibility:hidden;display:none;">
        <c:choose>
            <c:when test="${param.modalModo=='SOLOX'}">
        <table width="100%" style="background-color:transparent; border:0" cellspacing="0" cellpadding="0">
            <tr><td style="text-align:right"><img id="but_cerrar_modal_${param_nid}" name="but_cerrar_modal_${param_nid}" src="images/but_cerrar.gif" border="0" style="cursor:pointer" onclick="objUtiles.cerrarModal('${param.nid}')" /></td></tr>
        </table>
            </c:when>
            <c:otherwise>
        <table width="100%" style="background-color:darkblue; border:2px solid silver" cellspacing="0" cellpadding="0">
            <tr><td style="width:1%;text-align:left"><img src="images/but_modal.gif" border="0" align="middle" style="margin-left:5px;margin-right:5px" /></td>
            <td style="width:90%;color:white;font-size:10px;text-align:left">${param_titulo}</td>
            <td style="width:9%;text-align:right"><img id="but_cerrar_modal_${param_nid}" name="but_cerrar_modal_${param_nid}" src="images/but_cerrar.gif" border="0" style="cursor:pointer" onclick="objUtiles.cerrarModal('${param_nid}')" /></td></tr>
        </table>
            </c:otherwise>
        </c:choose>
        <iframe id="mw_${param_nid}_f" name="mw_${param_nid}_fn" scrolling="yes" style="height:100%;width:100%;background-color:white;z-index:1;SCROLLING:YES; border:1px solid silver" src="blanco.html" ></iframe>
    </span>
</c:forTokens>
