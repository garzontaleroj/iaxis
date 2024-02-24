<%--
/**
*  Fichero: axissin042.jsp
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavi Pastor</a>
*  
*  T?tulo: Siniestros ALTA MOV. PAGO/RECOBRO 
*
*  Fecha: 20/02/2009
*/
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*" %>
    <c:set var="linea_trami" value="${__formdata.indexTramitacio}"/> <!-- ${LINEATRAM} -->
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axissin042" c="lit_100913" lit="100913"/> <axis:alt f="axissin042" c="lit_109479" lit="109479"/>/<axis:alt f="axissin042" c="lit_9000897" lit="9000897"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
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
    <c:import url="../include/carga_framework_js.jsp"/>
    <script type="text/javascript">
        function f_onload() { 
            var hayErrores    = ${!empty requestScope.__mensajes.m__clave};
            var hayguardar    = ${!empty __formdata.guardat};
            var haymodo       = ${!empty __formdata.MODO};
            
            if ((hayguardar)&&(!hayErrores)){
                parent.f_guardarAxissin042(objDom.getValorPorId("NTRAMTE"));
            }else if ((haymodo)&&(document.getElementById('MODO').value =="consulta")){
                objDom.setDisabledPorId("CTRAMTE",true);
                if (document.getElementById('FPRESCRIP')!=null)
                objDom.setDisabledPorId("FPRESCRIP",true);
                if (document.getElementById('IRECLAMT')!=null)
                objDom.setDisabledPorId("IRECLAMT",true);
                if (document.getElementById('IRECOBT')!=null)
                objDom.setDisabledPorId("IRECOBT",true);
                if (document.getElementById('ICONCURR')!=null)
                objDom.setDisabledPorId("ICONCURR",true);
                if (document.getElementById('IRCIVIL')!=null)
                objDom.setDisabledPorId("IRCIVIL",true);
                if (document.getElementById('IASSEGUR')!=null)
                objDom.setDisabledPorId("IASSEGUR",true);
                if (document.getElementById('CRESRECOB')!=null)
                objDom.setDisabledPorId("CRESRECOB",true);
                if (document.getElementById('CDESTIM')!=null)
                objDom.setDisabledPorId("CDESTIM",true);
                if (document.getElementById('NREFGES')!=null)
                objDom.setDisabledPorId("NREFGES",true);
                if (document.getElementById('CTIPREC')!=null)
                objDom.setDisabledPorId("CTIPREC",true);
                if (document.getElementById('NLESIONES')!=null)
                objDom.setDisabledPorId("NLESIONES",true);
                if (document.getElementById('NMUERTOS')!=null)
                objDom.setDisabledPorId("NMUERTOS",true);
                if (document.getElementById('AGRAVANTES')!=null)
                objDom.setDisabledPorId("AGRAVANTES",true);
                if (document.getElementById('CGRADORESP')!=null)
                objDom.setDisabledPorId("CGRADORESP",true);
                if (document.getElementById('CTIPLESIONES')!=null)
                objDom.setDisabledPorId("CTIPLESIONES",true);
                if (document.getElementById('CTIPHOS')!=null)
                objDom.setDisabledPorId("CTIPHOS",true);
                <!-- Bug 0022099 -->
                if (document.getElementById('TREFEXT')!=null)
                objDom.setDisabledPorId("TREFEXT",true);
                <!-- Bug 0022099 -->
                if (document.getElementById('CCIAASIS')!=null)
                objDom.setDisabledPorId("CCIAASIS",true);
                }
            f_cargar_propiedades_pantalla();
        }
        function f_but_cancelar(){
            parent.f_cerrar_modal("axissin042");
        }
        function f_but_aceptar(){
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axissin042.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
        
        function f_onchange_CTRAMTE(){
            objUtiles.ejecutarFormulario("modal_axissin042.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_onchange_Recargar(){
            objUtiles.ejecutarFormulario("modal_axissin042.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
    </script>
</head>
<body onload="javascript:f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="modal_axissin012.do" method="POST">
    <input type="hidden" name="operation" value="aceptar" />
    <input type="hidden" name="NTRAMTE" id="NTRAMTE" value="${__formdata.NTRAMTE}" />
    <input type="hidden" name="NSINIES" value="${__formdata.NSINIES}" />
    <input type="hidden" name="SPRODUC" value="${__formdata.SPRODUC}" />
    <input type="hidden" name="CACTIVI" value="${__formdata.CACTIVI}" />
    <input type="hidden" name="MODO" id="MODO" value="${__formdata.MODO}" />

    <c:import url="../include/modal_estandar.jsp">
                    <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axissin042" c="lit_1000205" lit="1000205" /></c:param>
    </c:import>
    
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt f="axissin042" c="ALTATRAMITE" lit="9901988"/></c:param>
        <c:param name="formulario"><axis:alt f="axissin042" c="ALTATRAMITE" lit="9901988"/></c:param>
        <c:param name="form">axissin042</c:param>
    </c:import>
    <div class="separador">&nbsp;</div>
    <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table class="seccion">
                    <tr>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                    </tr>
                    <tr>
                        <axis:ocultar c="CTRAMTE" f="axissin042">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin042" c="CTRAMTE" lit="9901989"/></b><!-- Tipus tramite -->
                            </td>
                        </axis:ocultar>
                    </tr>
                    
                    <tr>
                    <axis:ocultar c="CTRAMTE" f="axissin042">
                        <td class="campocaja">
                             <select name="CTRAMTE" id="CTRAMTE" size="1" class="campowidthselect campo campotexto" title="<axis:alt f="axissin042" c="CTRAMTE" lit="9901989"/>"
                                onchange="f_onchange_CTRAMTE(this.value);"
                             <axis:atr f="axissin042" c="CTRAMTE" a="modificable=true&obligatorio=true&isInputText=false"/> >
                                <option value="null"><axis:alt f="axissin042" c="SELECCIONE" lit="1000348"/></option>
                                <c:forEach var="element" items="${__formdata.tramits_axissin042}">
                                    <option value = "${element.CTRAMTE}" 
                                        <c:if test="${element.CTRAMTE == __formdata.CTRAMTE}"> selected </c:if> />
                                            ${element.TTRAMITE} 
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                    </axis:ocultar>
                    </tr>
                    <c:if test="${__formdata.CTRAMTE==3}"> 
                    <axis:ocultar c="BLOQUE_RECOBRO" f="axissin042">
                    <tr>
                        <axis:ocultar c="FPRESCRIP" f="axissin042">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin042" c="FPRESCRIP" lit="9902218"/></b>
                        </td>
                        </axis:ocultar>
                        <axis:ocultar c="IRECLAMT" f="axissin042">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin042" c="IRECLAMT" lit="9902219"/></b>
                        </td>
                        </axis:ocultar>
                        <axis:ocultar c="IRECOBT" f="axissin042">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin042" c="IRECOBT" lit="9902220"/></b>
                        </td>
                        </axis:ocultar>
                        <axis:ocultar c="ICONCURR" f="axissin042">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin042" c="ICONCURR" lit="9902221"/></b>
                        </td>
                        </axis:ocultar>
                    </tr>
                    <tr>
                        <axis:ocultar c="FPRESCRIP" f="axissin042">
                        <td class="campocaja">
                            <input   type="text"  class="campowidthinput campo campotexto" id="FPRESCRIP"  name="FPRESCRIP"  style="width:40%" 
                                    <axis:atr f="axissin042" c="FPRESCRIP" a="modificable=true&formato=fecha"/> value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OB_SIN_TRAMITE.RECOBRO.FPRESCRIP}"/>"/>                                    
                                    <a style="vertical-align:middle;"><img id="popup_calendario_FPRESCRIP" alt="<axis:alt f="axissin042" c="FPRESCRIP" lit="9902218"/>" title="<axis:alt f="axissin042" c="FPRESCRIP" lit="9902218" />" src="images/calendar.gif"/></a>
                        </td>
                        </axis:ocultar>
                        <axis:ocultar c="IRECLAMT" f="axissin042">
                        <td class="campocaja">
                              <input type="text" name="IRECLAMT" id="IRECLAMT" formato="decimal" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.OB_SIN_TRAMITE.RECOBRO.IRECLAMT}"/>" class="campowidthinput campo campotexto" style="width:90%" 
                                <axis:atr f="axissin042" c="IRECLAMT" a="modificable=true&obligatorio=false"/> title="<axis:alt f="axissin042" c="IRECLAMT" lit="9902219"/>" />
                        </td>
                        </axis:ocultar>
                        <axis:ocultar c="IRECOBT" f="axissin042">
                        <td class="campocaja">
                             <input type="text" name="IRECOBT" id="IRECOBT" formato="decimal" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.OB_SIN_TRAMITE.RECOBRO.IRECOBT}"/>" class="campowidthinput campo campotexto" style="width:90%" 
                                <axis:atr f="axissin042" c="IRECOBT" a="modificable=true&obligatorio=false"/> title="<axis:alt f="axissin042" c="IRECOBT" lit="9902220"/>" />
                        </td>
                        </axis:ocultar>
                        <axis:ocultar c="ICONCURR" f="axissin042">
                        <td class="campocaja">
                             <input type="text" name="ICONCURR" id="ICONCURR" formato="decimal" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.OB_SIN_TRAMITE.RECOBRO.ICONCURR}"/>" class="campowidthinput campo campotexto" style="width:90%" 
                                <axis:atr f="axissin042" c="ICONCURR" a="modificable=true&obligatorio=false"/> title="<axis:alt f="axissin042" c="ICONCURR" lit="9902221"/>" />
                        </td>
                        </axis:ocultar>
                    </tr>
                    <tr>
                        <axis:ocultar c="IRCIVIL" f="axissin042">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin042" c="IRCIVIL" lit="9902222"/></b>
                        </td>
                        </axis:ocultar>
                        <axis:ocultar c="IASSEGUR" f="axissin042">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin042" c="IASSEGUR" lit="9902227"/></b>
                        </td>
                        </axis:ocultar>
                        <axis:ocultar c="CRESRECOB" f="axissin042">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin042" c="CRESRECOB" lit="9902223"/></b>
                        </td>
                        </axis:ocultar>
                        <axis:ocultar c="CDESTIM" f="axissin042">
                        <td class="titulocaja" id="CDESTIM_TIT">
                            <b><axis:alt f="axissin042" c="CDESTIM" lit="9902224"/></b>
                        </td>
                        </axis:ocultar>
                    </tr>
                    <tr>
                        <axis:ocultar c="IRCIVIL" f="axissin042">
                        <td class="campocaja">
                             <input type="text" name="IRCIVIL" id="IRCIVIL" formato="decimal" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.OB_SIN_TRAMITE.RECOBRO.IRCIVIL}"/>" class="campowidthinput campo campotexto" style="width:90%" 
                                <axis:atr f="axissin042" c="IRCIVIL" a="modificable=true&obligatorio=false"/> title="<axis:alt f="axissin042" c="IRCIVIL" lit="9902222"/>" />
                        </td>
                        </axis:ocultar>
                        <axis:ocultar c="IASSEGUR" f="axissin042">
                        <td class="campocaja">
                             <input type="text" name="IASSEGUR" id="IASSEGUR" formato="decimal" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.OB_SIN_TRAMITE.RECOBRO.IASSEGUR}"/>" class="campowidthinput campo campotexto" style="width:90%" 
                                <axis:atr f="axissin042" c="IASSEGUR" a="modificable=true&obligatorio=false"/> title="<axis:alt f="axissin042" c="IASSEGUR" lit="9902227"/>" />
                        </td>
                        </axis:ocultar>
                        <axis:ocultar c="CRESRECOB" f="axissin042">
                        <td class="campocaja" >
                             <select name="CRESRECOB" id="CRESRECOB" size="1" <axis:atr f="axissin042" c="CRESRECOB" a="modificable=true&isInputText=false&obligatorio=false"/> 
                             onchange="f_onchange_Recargar();" class="campowidthselect campo campotexto" style="width:90%;"> 
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin042" c="SNV_COMBO" lit="1000348"/> - </option>
                                <c:forEach var="lsCRESRECOB" items="${listValores.lsCRESRECOB}">
                                    <option value = "${lsCRESRECOB.CATRIBU}" 
                                    <c:if test="${lsCRESRECOB.CATRIBU == __formdata.OB_SIN_TRAMITE.RECOBRO.CRESRECOB}"> selected </c:if> />
                                        ${lsCRESRECOB.TATRIBU} 
                                    </option>
                                </c:forEach>
                            </select>  
                        </td>
                        </axis:ocultar>
                        <axis:ocultar c="CDESTIM" f="axissin042">
                        <td class="campocaja" id="CDESTIM_CAMP">
                             <select name="CDESTIM" id="CDESTIM" size="1" <axis:atr f="axissin042" c="CDESTIM" a="modificable=true&isInputText=false&obligatorio=false"/> class="campowidthselect campo campotexto" style="width:90%;"> 
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin042" c="SNV_COMBO" lit="1000348"/> - </option>
                                <c:forEach var="lsCDESTIM" items="${listValores.lsCDESTIM}">
                                    <option value = "${lsCDESTIM.CATRIBU}" 
                                    <c:if test="${lsCDESTIM.CATRIBU == __formdata.OB_SIN_TRAMITE.RECOBRO.CDESTIM}"> selected </c:if> />
                                        ${lsCDESTIM.TATRIBU} 
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                        </axis:ocultar>
                    </tr>
                    <tr>
                        <axis:ocultar c="NREFGES" f="axissin042">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin042" c="NREFGES" lit="9902225"/></b>
                        </td>
                        </axis:ocultar>
                        <axis:ocultar c="CTIPREC" f="axissin042">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin042" c="CTIPREC" lit="9902226"/></b>
                        </td>
                        </axis:ocultar>
                    </tr>
                    
                    <tr>
                        <axis:ocultar c="NREFGES" f="axissin042">
                        <td class="campocaja">
                             <input type="text" name="NREFGES" id="NREFGES" value="${__formdata.OB_SIN_TRAMITE.RECOBRO.NREFGES}" class="campowidthinput campo campotexto" style="width:90%" 
                                <axis:atr f="axissin042" c="ICONCURR" a="modificable=true&obligatorio=false"/>  title="<axis:alt f="axissin042" c="NREFGES" lit="9902225"/>" />
                        </td>
                        </axis:ocultar>
                        <axis:ocultar c="CTIPREC" f="axissin042">
                        <td class="campocaja">
                             <select name="CTIPREC" id="CTIPREC" size="1" <axis:atr f="axissin042" c="CTIPREC" a="modificable=true&isInputText=false&obligatorio=false"/> class="campowidthselect campo campotexto" style="width:90%;"> 
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin042" c="SNV_COMBO" lit="1000348"/> - </option>
                                <c:forEach var="lsCTIPREC" items="${listValores.lsCTIPREC}">
                                    <option value = "${lsCTIPREC.CATRIBU}" 
                                    <c:if test="${lsCTIPREC.CATRIBU == __formdata.OB_SIN_TRAMITE.RECOBRO.CTIPREC}"> selected </c:if> />
                                        ${lsCTIPREC.TATRIBU} 
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                        </axis:ocultar>
                    </tr>
                    </axis:ocultar>
                    </c:if>
                    <c:if test="${__formdata.CTRAMTE==2}"> 
                    <axis:ocultar c="BLOQUE_LESIONES" f="axissin042">
                    <tr>
                        <axis:ocultar c="NLESIONES" f="axissin042">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin042" c="NLESIONES" lit="9902228"/></b>
                        </td>
                        </axis:ocultar>
                        <axis:ocultar c="NMUERTOS" f="axissin042">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin042" c="NMUERTOS" lit="9902229"/></b>
                        </td>
                        </axis:ocultar>
                        <axis:ocultar c="AGRAVANTES" f="axissin042">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin042" c="AGRAVANTES" lit="9902230"/></b>
                        </td>
                        </axis:ocultar>
                    </tr>
                    <tr>
                        <axis:ocultar c="NLESIONES" f="axissin042">
                        <td class="campocaja">
                            <input type="text" name="NLESIONES" formato="entero" id="NLESIONES" value="${__formdata.OB_SIN_TRAMITE.LESIONES.NLESIONES}" class="campowidthinput campo campotexto" style="width:90%" 
                                <axis:atr f="axissin042" c="NLESIONES" a="modificable=true&obligatorio=false"/>  title="<axis:alt f="axissin042" c="NLESIONES" lit="9902228"/>"/>
                        </td>
                        </axis:ocultar>
                        <axis:ocultar c="NMUERTOS" f="axissin042">
                        <td class="campocaja">
                              <input type="text" name="NMUERTOS" formato="entero" id="NMUERTOS" value="${__formdata.OB_SIN_TRAMITE.LESIONES.NMUERTOS}" class="campowidthinput campo campotexto" style="width:90%" 
                                <axis:atr f="axissin042" c="NMUERTOS" a="modificable=true&obligatorio=false"/>  title="<axis:alt f="axissin042" c="NMUERTOS" lit="9902229"/>"/>
                        </td>
                        </axis:ocultar>
                        <axis:ocultar c="AGRAVANTES" f="axissin042">
                        <td class="campocaja">
                             <input type="text" name="AGRAVANTES" id="AGRAVANTES" value="${__formdata.OB_SIN_TRAMITE.LESIONES.AGRAVANTES}" class="campowidthinput campo campotexto" style="width:90%" 
                                <axis:atr f="axissin042" c="AGRAVANTES" a="modificable=true&obligatorio=false"/> title="<axis:alt f="axissin042" c="AGRAVANTES" lit="9902230"/>" />
                        </td>
                        </axis:ocultar>
                    </tr>
                    <tr>
                        <axis:ocultar c="CGRADORESP" f="axissin042">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin042" c="CGRADORESP" lit="9902231"/></b>
                        </td>
                        </axis:ocultar>
                        <axis:ocultar c="CTIPLESIONES" f="axissin042">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin042" c="CTIPLESIONES" lit="9902232"/></b>
                        </td>
                        </axis:ocultar>
                        <axis:ocultar c="CTIPHOS" f="axissin042">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin042" c="CTIPHOS" lit="9902233"/></b>
                        </td>
                        </axis:ocultar>
                    </tr>
                    <tr>
                        <axis:ocultar c="CGRADORESP" f="axissin042">
                        <td class="campocaja">
                             <select name="CGRADORESP" id="CGRADORESP" size="1" <axis:atr f="axissin042" c="CGRADORESP" a="modificable=true&isInputText=false&obligatorio=false"/> class="campowidthselect campo campotexto" style="width:90%;"> 
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin042" c="SNV_COMBO" lit="1000348"/> - </option>
                                <c:forEach var="lsCGRADORESP" items="${listValores.lsCGRADORESP}">
                                    <option value = "${lsCGRADORESP.CATRIBU}" 
                                    <c:if test="${lsCGRADORESP.CATRIBU == __formdata.OB_SIN_TRAMITE.LESIONES.CGRADORESP}"> selected </c:if> />
                                        ${lsCGRADORESP.TATRIBU} 
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                        </axis:ocultar>
                        <axis:ocultar c="CTIPLESIONES" f="axissin042">
                        <td class="campocaja">
                             <select name="CTIPLESIONES" id="CTIPLESIONES" size="1" <axis:atr f="axissin042" c="CTIPLESIONES" a="modificable=true&isInputText=false&obligatorio=false"/> class="campowidthselect campo campotexto" style="width:90%;"> 
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin042" c="SNV_COMBO" lit="1000348"/> - </option>
                                <c:forEach var="lsCTIPLESIONES" items="${listValores.lsCTIPLESIONES}">
                                    <option value = "${lsCTIPLESIONES.CATRIBU}" 
                                    <c:if test="${lsCTIPLESIONES.CATRIBU == __formdata.OB_SIN_TRAMITE.LESIONES.CTIPLESIONES}"> selected </c:if> />
                                        ${lsCTIPLESIONES.TATRIBU} 
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                        </axis:ocultar>
                        <axis:ocultar c="CTIPHOS" f="axissin042">
                        <td class="campocaja">
                             <select name="CTIPHOS" id="CTIPHOS" size="1" <axis:atr f="axissin042" c="CTIPHOS" a="modificable=true&isInputText=false&obligatorio=false"/> class="campowidthselect campo campotexto" style="width:90%;"> 
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin042" c="SNV_COMBO" lit="1000348"/> - </option>
                                <c:forEach var="lsCTIPHOS" items="${listValores.lsCTIPHOS}">
                                    <option value = "${lsCTIPHOS.CATRIBU}" 
                                    <c:if test="${lsCTIPHOS.CATRIBU == __formdata.OB_SIN_TRAMITE.LESIONES.CTIPHOS}"> selected </c:if> />
                                        ${lsCTIPHOS.TATRIBU} 
                                    </option>
                                </c:forEach>
                            </select>  
                        </td>
                        </axis:ocultar>
                    </tr>
                    </axis:ocultar>
                    </c:if>
                    
                    <!-- ini Bug 0022099 -->
                    <c:if test="${__formdata.CTRAMTE==5}"> 
                    <axis:ocultar c="BLOQUE_ASISTENCIA" f="axissin042">
                    <tr>
                        <axis:ocultar c="TREFEXT" f="axissin042">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin042" c="TREFEXT" lit="9902448"/></b>
                        </td>
                        </axis:ocultar>
                        <axis:ocultar c="CCIAASIS" f="axissin042">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin042" c="CCIAASIS" lit="9901223"/></b>
                        </td>
                        </axis:ocultar>
                    </tr>
                    <tr>
                        <axis:ocultar c="TREFEXT" f="axissin042">
                        <td class="campocaja">
                             <input type="text" name="TREFEXT" id="TREFEXT" value="${__formdata.OB_SIN_TRAMITE.ASISTENCIA.TREFEXT}" class="campowidthinput campo campotexto" style="width:90%" 
                                <axis:atr f="axissin042" c="TREFEXT" a="modificable=true&obligatorio=false"/> title="<axis:alt f="axissin042" c="TREFEXT" lit="9902448"/>" />
                        </td>
                        </axis:ocultar>
                        <axis:ocultar c="CCIAASIS" f="axissin042">
                        <td class="campocaja">
                             <select name="CCIAASIS" id="CCIAASIS" size="1" <axis:atr f="axissin042" c="CCIAASIS" a="modificable=true&isInputText=false&obligatorio=false"/> class="campowidthselect campo campotexto" style="width:90%;"> 
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin042" c="SNV_COMBO" lit="9901223"/> - </option>
                                <c:forEach var="lsCCIAASIS" items="${listValores.lsCCIAASIS}">
                                    <option value = "${lsCCIAASIS.CATRIBU}" 
                                    <c:if test="${lsCCIAASIS.CATRIBU == __formdata.OB_SIN_TRAMITE.ASISTENCIA.CCIAASIS}"> selected </c:if> />
                                        ${lsCCIAASIS.TATRIBU} 
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                        </axis:ocultar>
                    </tr>
                    </axis:ocultar>
                    </c:if>
                    <!-- fin Bug 0022099 -->
                    
                </table>
            </td>
        </tr>
    </table>
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin042</c:param><c:param name="__botones">cancelar<c:if test="${__formdata.MODO ne 'consulta'}"><axis:visible f="axissin042" c="BUT_ACEPTAR">,aceptar</axis:visible></c:if></c:param></c:import>
    </form>
    <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FPRESCRIP",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FPRESCRIP", 
                singleClick    :    true,
                firstDay       :    1
            });
     </script>
  <c:import url="../include/mensajes.jsp" />
</body>
</html>