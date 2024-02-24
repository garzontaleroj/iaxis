<%/**
*  Fichero: precargador_ajax.jsp
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavier Gallego</a>
*
*  Método que carga las capas referentes al cargador ajax: cuadro translúcido + cuadro para visualizar texto
*
*  Fecha: 29/10/2007
*/
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<link rel="StyleSheet" href="styles/axisloader.css" type="text/css"></link>

<iframe id="ajax4ie" class="precarga_fija" src="" style="top:0px;left:0px;z-index:100;display:none;width:100%;height:100%;position:fixed;filter:progid:DXImageTransform.Microsoft.Chroma(Color='#ffffff');" frameborder="0"></iframe>
<div id="ajaxLoader"  class="ajaxLoaderStyle">&nbsp;</div>

<div id="ajaxContent" class="ajaxContentStyle">
    <div class="ajaxImageStyle">
        <img border="0" src="${param.imagen}"/>
    </div>
    <div class="ajaxContentEspacio">&nbsp;</div>
    <div class="ajaxDivText">
        <span id="ajaxText" class="ajaxTextStyle"></span>
    </div>
</div>