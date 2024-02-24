<%-- 
*  Fichero: axisper046.jsp
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes" %>
<%@ page import="java.util.*" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="stylesheet" href="styles/displaytag.css">
     <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp" />
        <!--********** CALENDARIO ************************* -->
        <!-- Hoja de estilo del Calendario -->
        <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
        <!-- Script principal del calendario -->
        <script type="text/javascript" src="scripts/calendar.js"></script>
        <!-- Idioma del calendario, en función del Locale -->
        <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
        <!-- Setup del calendario -->
        <script type="text/javascript" src="scripts/calendar-setup.js"></script>
        <!--*********************************** -->
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
        	  <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisper044');
					</c:if>
            f_cargar_propiedades_pantalla();
            var OK = "${requestScope.OK}"; 
            
            PSPERSONOUT = "${__formdata.SPERSON}";
            PCAGENTEOUT = "${__formdata.CAGENTE}";
            if (!objUtiles.estaVacio(OK))
                parent.f_aceptar_axisper044(PSPERSONOUT,PCAGENTEOUT);
        }
                
        function f_but_salir() {          
           parent.f_salir_axisper046();        
        }
        
        function f_ondblclick(ths) {       
        }
        
    </script>
  </head>
<body onload="f_onload()">
	<div id="wrapper" class="wrapper">
<c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
<form name="miForm" action="" method="POST">
    <input type="hidden" name="operation"/>
    <input type="hidden" name="SPERSON" value="${__formdata.SPERSON}" />
    
    <c:import url="../include/titulo_nt.jsp">
           <%-- <c:param name="modalidad">null</c:param>--%>
            <c:param name="titulo"><axis:alt f="axisper044" c="TITULO" lit="9909288"/></c:param>
            <c:param name="formulario"><axis:alt f="axisper044" c="FORMULARIO" lit="9909288"/></c:param>
            <c:param name="form">axisper046</c:param>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axiscom002|axiscom002</c:param>
    </c:import>

<!-- Area de campos de parametros -->

<table class="mainTableDimensions base"  align="center" cellpadding="0" cellspacing="0" onclick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','PERMARCAS');return true;">
<tr>
<td class="campocaja">

    <c:set var="title0"><axis:alt f="${pantalla}" c="CMARCA" lit="1000109"></axis:alt></c:set>
    <c:set var="title1"><axis:alt f="${pantalla}" c="CMARCA" lit="101761"></axis:alt></c:set>                            
    <c:set var="title2"><axis:alt f="${pantalla}" c="CTOMADOR" lit="101027"></axis:alt></c:set>       
    <c:set var="title3"><axis:alt f="${pantalla}" c="CASEGURADO" lit="9904824"></axis:alt></c:set>       
    <c:set var="title4"><axis:alt f="${pantalla}" c="CINTERMED" lit="9902363"></axis:alt></c:set>       
    <c:set var="title5"><axis:alt f="${pantalla}" c="CCONSORCIO" lit="100916"></axis:alt></c:set>       
    <c:set var="title6"><axis:alt f="${pantalla}" c="CCODEUDOR" lit="9909291"></axis:alt></c:set>       
    <c:set var="title7"><axis:alt f="${pantalla}" c="CBENEF" lit="9001911"></axis:alt></c:set>       
    <c:set var="title8"><axis:alt f="${pantalla}" c="CACCIONISTA" lit="9909292"></axis:alt></c:set>       
    <c:set var="title9"><axis:alt f="${pantalla}" c="CREPRESEN" lit="9909293"></axis:alt></c:set>       
    <c:set var="title10"><axis:alt f="${pantalla}" c="CAPODERADO" lit="9909294"></axis:alt></c:set>   
    <c:set var="title11"><axis:alt f="${pantalla}" c="CPAGADOR" lit="9903385"></axis:alt></c:set>  
    <c:set var="title12"><axis:alt f="${pantalla}" c="NMOVIMI" lit="9001868"></axis:alt></c:set>  
    <c:set var="title13"><axis:alt f="${pantalla}" c="CUSER" lit="100894"></axis:alt></c:set>  
    <c:set var="title14"><axis:alt f="${pantalla}" c="FALTA" lit="105887"></axis:alt></c:set>  
    <c:set var="title15"><axis:alt f="${pantalla}" c="CPROVEEDOR" lit="9909834"></axis:alt></c:set>
    <c:set var="title17"><axis:alt f="${pantalla}" c="CGRUPOECON" lit="89908089"></axis:alt></c:set>
    <c:set var="title16"><axis:alt f="${pantalla}" c="COBSERVA" lit="101162"></axis:alt></c:set>       
    
                        
   <display:table name="${HISTORICO_MARCAS}" id="documento" export="false" class="dsptgtable" pagesize="25" defaultsort="1" sort="list" cellpadding="0" cellspacing="0"
     requestURI="modal_axisper046.do?paginar=true">
        <%@ include file="../include/displaytag.jsp"%>
         
     <%--<display:column title="${title0}" sortable="true" sortProperty="CMARCA" headerClass="sortable"  media="html" autolink="false" >
                    <div id = "MMARCA" name = "MMARCA" class="dspText">${documento.CMARCA}</div>
        </display:column>
        
        <display:column title="${title1}" sortable="true" sortProperty="DESCRIPCION" headerClass="sortable"  media="html" autolink="false" >
                    <div class="dspText">${documento.DESCRIPCION}</div>
        </display:column>  --%>     
        <display:column title="${title12}" sortable="true" sortProperty="DESCRIPCION" headerClass="sortable"  media="html" autolink="false" >
                    <div class="dspText">${documento.NMOVIMI}</div>
        </display:column>       
        
        <display:column title="${title2}" sortable="true" style="width:10%;" sortProperty="MTOMADOR" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspText" align="center">
                                            <input type="checkbox" id="TOMADOR" name="${documento.CMARCA}" onchange="f_onchange(this)" disabled <c:if test="${documento.MTOMADOR == 1}">checked</c:if> /></div>         
        </display:column>            
        
        <display:column title="${title3}" sortable="true" style="width:10%;" sortProperty="MASEGURADO" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspText" align="center">
                                            <input type="checkbox" id="ASEGURADO" name="${documento.CMARCA}" onchange="f_onchange(this)" disabled <c:if test="${documento.MASEGURADO == 1}">checked</c:if> /></div>                                                                                 
        </display:column>            
        
        <display:column title="${title4}" sortable="true" style="width:10%;" sortProperty="MINTERMEDIARIO" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspText" align="center">
                                            <input type="checkbox" id="INTERMEDIARIO" name="${documento.CMARCA}" onchange="f_onchange(this)" disabled <c:if test="${documento.MINTERMEDIARIO == 1}">checked</c:if> /></div>                                                                                 
        </display:column>            
        
        <display:column title="${title5}" sortable="true" style="width:10%;" sortProperty="MCONSORCIO" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspText" align="center">
                                            <input type="checkbox" id="CONSORCIO" name="${documento.CMARCA}" onchange="f_onchange(this)" disabled <c:if test="${documento.MCONSORCIO == 1}">checked</c:if> /></div>                                                                                 
        </display:column>            
        
        <display:column title="${title6}" sortable="true" style="width:10%;" sortProperty="MCODEUDOR" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspText" align="center">
                                            <input type="checkbox" id="CODEUDOR" name="${documento.CMARCA}" onchange="f_onchange(this)" disabled <c:if test="${documento.MCODEUDOR == 1}">checked</c:if> /></div>                                                                                 
        </display:column>            
        
        <display:column title="${title7}" sortable="true" style="width:10%;" sortProperty="MBENEF" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspText" align="center">
                                            <input type="checkbox" id="BENEFICIARIO" name="${documento.CMARCA}" onchange="f_onchange(this)" disabled <c:if test="${documento.MBENEF == 1}">checked</c:if> /></div>                                                                                 
        </display:column>            
        
        <display:column title="${title8}" sortable="true" style="width:10%;" sortProperty="MACCIONISTA" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspText" align="center">
                                            <input type="checkbox" id="ACCIONISTA" name="${documento.CMARCA}" onchange="f_onchange(this)" disabled <c:if test="${documento.MACCIONISTA == 1}">checked</c:if> /></div>                                                                                 
        </display:column>            
        
        <display:column title="${title9}" sortable="true" style="width:10%;" sortProperty="MREPRESEN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspText" align="center">
                                            <input type="checkbox" id="REPRESENTANTE" name="${documento.CMARCA}" onchange="f_onchange(this)" disabled <c:if test="${documento.MREPRESEN == 1}">checked</c:if> /></div>                                                                                 
        </display:column>            
        
        <display:column title="${title10}" sortable="true" style="width:10%;" sortProperty="MAPODERADO" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspText" align="center">
                                            <input type="checkbox" id="APODERADO" name="${documento.CMARCA}" onchange="f_onchange(this)" disabled <c:if test="${documento.MAPODERADO == 1}">checked</c:if> /></div>                                                                                 
       </display:column>            
        
        <display:column title="${title11}" sortable="true" style="width:10%;" sortProperty="MPAGADOR" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspText" align="center">
                                            <input type="checkbox" id="PAGADOR" name="${documento.CMARCA}" onchange="f_onchange(this)" disabled <c:if test="${documento.MPAGADOR == 1}">checked</c:if> /></div>                                                                                 
        </display:column>            
        
        <display:column title="${title15}" sortable="true" style="width:10%;" sortProperty="MPROVEEDOR" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspText" align="center">
                                            <input type="checkbox" id="PROVEEDOR" name="${documento.CMARCA}" onchange="f_onchange(this)" disabled <c:if test="${documento.MPROVEEDOR == 1}">checked</c:if> /></div>                                                                                 
        </display:column>            
        <display:column title="${title17}" sortable="true" style="width:10%;" sortProperty="MGRUPOECON" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspText" align="center">
                                            <input type="checkbox" id="GRUPOECON" name="${documento.CMARCA}" onchange="f_onchange(this)" disabled <c:if test="${documento.MGRUPOECON == 1}">checked</c:if> /></div>                                                                                 
        </display:column>            
        
        <display:column title="${title16}" sortable="true" sortProperty="OBSERVACION" headerClass="sortable"  media="html" autolink="false" >
                    <div class="dspText" style="width:200px;">${documento.OBSERVACION}</div>
        </display:column>       

        <display:column title="${title13}" sortable="true" sortProperty="CUSER" headerClass="sortable"  media="html" autolink="false" >
                    <div class="dspText">${documento.CUSER}</div>
        </display:column>
        
        
        <display:column title="${title14}" sortable="true" sortProperty="FALTA" headerClass="sortable"  media="html" autolink="false" >
                    <div class="dspText" style="width:67px;" >${documento.FALTA}</div>
        </display:column>
        
    </display:table>   
                                                                            
</td>
</tr>
</table>

</form>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<!-- Area de campos  -->
 <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisper044</c:param>
                <c:param name="__botones">salir</c:param>
            </c:import>

    </form>
<c:import url="../include/mensajes.jsp" />



</div>
</body>
</html>