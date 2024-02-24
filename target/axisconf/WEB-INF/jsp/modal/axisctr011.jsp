<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%/*
*  Fichero: axisctr011.jsp
*
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*
*  Fecha: 19/11/2007
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    
    <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"></style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">

        //*************** Captura de eventos ***********************//
        if (document.all) { // IE
            document.onkeydown = function(e) {  
                if(window.event){	  
                    if (!e) var e = window.event;
                    var elemName = e.srcElement.name;
                    var elemVal = eval ("document.miForm."+elemName+".readOnly");
                    var elemVal2 = eval ("document.miForm."+elemName+".disabled");
                    if ( (window.event && window.event.keyCode == 8) && (elemVal==true || elemVal2==true)) {
                        return false;  //Sólo lo anulará si está disabled el campo que lo lanza
                    }
                }
            }
        }else{           
            document.onkeydown = function(e) { 
                var preventKeyPress;
                if (e.keyCode == 8) {
                    var d = e.srcElement || e.target;
                    if (d.tagName.toUpperCase() == 'INPUT' || d.tagName.toUpperCase() == 'TEXTAREA') {
                        var preventPressBasedOnType = false;
                        if (d.attributes["type"]) {
                            var type = d.attributes["type"].value.toLowerCase();
                            preventPressBasedOnType = (type == "radio" || type == "checkbox" || type == "submit");
                        }
                        preventKeyPress = d.readOnly || d.disabled || preventPressBasedOnType;
                    }
                    else
                        preventKeyPress = true;
                }
                else
                    preventKeyPress = false;
            
                if (preventKeyPress)
                    e.preventDefault();
                 
            }
        }
        
        function f_onload() {
        	 <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisctr011');
					</c:if>
            objDom.setDisplayPorId("but_buscar", "none");
          //  f_actualizaVisibilidadValorRevalorizacion();
            <c:if test="${sessionScope.valida_reval=='0'}">
                document.miForm.CREVALI.disabled="true";
            </c:if>
           f_disable_button_aceptar();
           f_cargar_propiedades_pantalla();
           revisarEstilos();
                  
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_axisctr011();
        }
        
        function myCallback (ajaxResponseText) {
            //Si hay cambios, desabilitamos el botón siguiente de la pantalla axisctr007
           var doc=objAjax.domParse(ajaxResponseText);
           
           if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                parent.f_disabled_but_siguiente(true);
                parent.f_cerrar_axisctr011();
          }
        }
        
        function f_disable_button_aceptar(){
            objDom.setVisibilidadPorId("but_aceptar", "hidden");
        }
        
        function f_but_aceptar() {
        
            // Llamada para actualizar los valores de la pantalla
            if (objValidador.validaEntrada()) {
                var tipoRevalorizacion = objDom.getValorComponente(document.miForm.CREVALI);
                var valorRevalorizacion = "";
                // El valor sólo nos interesa si está visible

//BUG9413-10032009-XVM                
                if (objDom.esVisible("PREVALI") || !objUtiles.estaVacio(objDom.getValorPorId("PREVALI"))) 
                    valorRevalorizacion = objDom.getValorComponente(document.miForm.PREVALI);

// mds 28012016 Bug 0038936
                var sobreprima = "";
                if (objDom.esVisible("PRECARG") || !objUtiles.estaVacio(document.miForm.sobreprima))
                    sobreprima = objDom.getValorComponente(document.miForm.sobreprima);

// mds 28012016 Bug 0038936
                var dto = "";
                if (objDom.esVisible("PDTOCOM") || !objUtiles.estaVacio(document.miForm.dto))
                    dto = objDom.getValorComponente(document.miForm.dto);

// mds 28012016 Bug 0038936
                var extraprima = ""; 
                if (objDom.esVisible("IEXTRAP") || !objUtiles.estaVacio(document.miForm.extraprima))
                    extraprima = objDom.getValorComponente(document.miForm.extraprima);
               
                //etm ini
// mds 28012016 Bug 0038936
                var dto_tecnico = "";
                if (objDom.esVisible("PDTOTEC") || !objUtiles.estaVacio(document.miForm.dto_tecnico))
                    dto_tecnico = objDom.getValorComponente(document.miForm.dto_tecnico);
                
// mds 28012016 Bug 0038936
                var por_recargocomercial= "";
                if (objDom.esVisible("PRECCOM") || !objUtiles.estaVacio(document.miForm.por_recargocomercial))
                    por_recargocomercial= objDom.getValorComponente(document.miForm.por_recargocomercial);
                
                objAjax.invokeAsyncCGI ("modal_axisctr011.do", myCallback, "operation=guardarCambios&tipoRevalorizacion=" + tipoRevalorizacion + 
                                        "&valorRevalorizacion=" + valorRevalorizacion + "&sobreprima=" + sobreprima + 
                                        "&dto=" + dto + "&extraprima=" + extraprima + "&dto_tecnico=" + dto_tecnico + "&por_recargocomercial=" + por_recargocomercial, this, objJsMessages.jslit_actualizando_registro);
            }
        }
        
        function f_actualizaVisibilidadValorRevalorizacion () {
            objDom.setValorPorId("PREVALI", "");
            f_carga_dependencias();
            <!--  Bug 0027305: POSS518 (POSSF200) - MMS - 20131010 Este código no debería estar aqui. Gestión por dependencias
            if (objDom.esVisible("CREVALI")) {
                var tipoRevalorizacion = objDom.getValorComponente(document.miForm.CREVALI);
                var visibility = 'hidden';
                if (esValorRevalorizacionObligatorio ()) 
                    visibility = 'visible';
                objDom.setVisibilidadPorId("PREVALILabel", visibility);
                objDom.setVisibilidadPorId("PREVALI", visibility);      
            }
            -->
        }
        <!--  Bug 0027305: POSS518 (POSSF200) - MMS - 20131010 Este código no debería estar aqui. Gestión por dependencias
        function esValorRevalorizacionObligatorio (){
            var tipoRevalorizacion = objDom.getValorComponente(document.miForm.CREVALI);
            return objUtiles.utilEquals(tipoRevalorizacion, '2');
        }
        -->
    </script>
  </head>
    <body onload="f_onload()" onunload="try { f_clear_resources(document.body) } catch (e) {}">
    	<div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
                                                   
            <%--input type="hidden" class="campowidthinput campo campotexto" id="extraprima" name="extraprima" size="15"
            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${sessionScope.axisctr_garantia.IEXTRAP}'/>" formato="decimal" title="<axis:alt f="axisctr011" c="LIT_DRT" lit="101918"/>"/--%>
                                                   
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisctr011" c="LIT_FORMULARIO" lit="1000185" /></c:param>
                <c:param name="producto"><axis:alt f="axisctr011" c="LIT_PARAM_PROD" lit="1000185" /></c:param>
                <c:param name="form">axisctr011</c:param>
            </c:import>
            <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr011" c="IMG_TITULO_GO" lit="110994"/> ${sessionScope.axisctr_garantia.DESCRIPCION} - <axis:alt f="axisctr011" c="LIT_TIT_BUSC" lit="1000073"/> : <fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${sessionScope.axisctr_garantia.ICAPITAL}'/><axis:visible c="CMONPROD" f="axisctr011"><c:if test="${!empty CMONPROD}"> - <b class="titulocaja" style="color:black"> <axis:alt f="axisctr011" c="CMONPROD" lit="108645"/> : <b> ${CMONPRODINT} - ${requestScope.TMONPROD}</b> </c:if> </axis:visible></div>
                        <!--campos-->
                        <table class="seccion">
                           <tr>
                                                        <th style="width:20%;height:0px"></th>
                                                        <th style="width:20%;height:0px"></th>
                                                        <th style="width:20%;height:0px"></th>
                                                        <th style="width:20%;height:0px"></th>  
                                                        <th style="width:20%;height:0px"></th> 
                            </tr>
                            <tr>
                                <td align="left" colspan="5">
                                    <table class="area" align="center">
                                         <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisctr011" c="CREVALI" dejarHueco="false">
                                                <td class="campocaja titulocampo">
                                                    <b id="label_CREVALI"><axis:alt f="axisctr011" c="CREVALI" lit="101432"></axis:alt></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr011" c="PREVALI" dejarHueco="false">
                                                <td class="campocaja titulocampo">
                                                    <b id="label_PREVALI"><axis:alt f="axisctr011" c="PREVALI" lit="1000382"></axis:alt></b>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisctr011" c="CREVALI" dejarHueco="false">
                                                <td class="campocaja">
                                                    <select name = "CREVALI" id ="CREVALI" size="1" onchange="f_actualizaVisibilidadValorRevalorizacion ()"  <axis:atr f="axisctr011" c="CREVALI" a="modificable=false&isInputText=false"/>
                                                    class="campowidthselect campo campotexto_ob">&nbsp;
                                                        <c:forEach items="${sessionScope.axisctr_parametrosGarantias.tipoRevalorizacion}" var="tipoReval">
                                                            <option value = "${tipoReval.CATRIBU}" <c:if test="${tipoReval.CATRIBU == axisctr_garantia.CREVALI}">selected</c:if>>${tipoReval.TATRIBU} </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr011" c="PREVALI" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="PREVALI" name="PREVALI" <axis:atr f="axisctr011" c="PREVALI" a="modificable=false"/>
                                                    size="15" value="<fmt:formatNumber pattern='###,##0.00' value='${axisctr_garantia.PREVALI}'/>" formato="decimal" title="<axis:alt f="axisctr011" c="LIT_PREVALI" lit="1000382"/>"/>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                    </table>
                                    
                                    <table class="seccion">
                                 
                                    <!-- Campos -->
                                    <div class="separador">&nbsp;</div>        
                                        <tr>
                                            <td align="left">
                                                <table class="area" align="center">
                                                     <tr>
                                                        <th style="width:20%;height:0px"></th>
                                                        <th style="width:20%;height:0px"></th>
                                                        <th style="width:20%;height:0px"></th>
                                                        <th style="width:20%;height:0px"></th>  
                                                        <th style="width:20%;height:0px"></th>  
                                                    </tr>
                                                    <tr>
                                                    <axis:visible f="axisctr011" c="IPRITAR">
                                                        <td class="campocaja titulocampo"> 
                                                            <b><axis:alt f="axisctr011" c="LIT_IPRITAR" lit="1000496" /></b> <!-- Prima Tarifa -->
                                                        </td>
                                                    </axis:visible>
                                                    <axis:ocultar f="axisctr011" c="IEXTRAP" dejarHueco="false">
                                                         <td id="td_IEXTRAP" class="campocaja titulocampo">
                                                            <b><axis:alt f="axisctr011" c="LIT_IEXTRAP" lit="101918" /></b> <!-- IEXTRAP -->
                                                        </td>   
                                                    </axis:ocultar>
                                                    <axis:visible f="axisctr011" c="PRECARG">
                                                         <td class="campocaja titulocampo">
                                                            <b><axis:alt f="axisctr011" c="LIT_PRECARG" lit="101671" />&nbsp;<axis:alt f="axisctr011" c="ALT_PRECARG" lit="101502" /></b> <!-- Sobreprima = PRECARG -->
                                                        </td>   
                                                    </axis:visible>
                                                    <axis:visible f="axisctr011" c="PDTOCOM">
                                                        <td class="campocaja titulocampo">
                                                            <b><axis:alt f="axisctr011" c="LIT_PDTOCOM" lit="1000119" />&nbsp;<axis:alt f="axisctr011" c="ALT_PDTOCOM" lit="101502" /></b> <!-- Dto = PDTOCOM -->
                                                        </td>
                                                    </axis:visible>
                                                    <axis:visible f="axisctr011" c="IPRITOT">
                                                        <td class="campocaja titulocampo">
                                                            <b><axis:alt f="axisctr011" c="LIT_IPRITOT" lit="1000497" /></b>  <!-- Prima Neta = IPRITOT -->
                                                        </td>
                                                    </axis:visible>
                                                    </tr>
                                                    <tr>
                                                    <axis:visible f="axisctr011" c="IPRITAR">
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto campodisabled" id="prima_tarifa" name="prima_neta" size="15"
                                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${sessionScope.axisctr_garantia.IPRITAR}'/>" readonly="true"/>
                                                        </td>
                                                    </axis:visible>
                                                    <axis:ocultar f="axisctr011" c="IEXTRAP" dejarHueco="false">
                                                        <td id="td_IEXTRAP" class="campocaja">
                                                           <input type="text" class="campowidthinput campo campotexto" id="extraprima" name="extraprima" size="15"
                                                            <axis:atr f="axisctr011" c="IEXTRAP" a="modificable=true&obligatorio=false"/>
                                                            value="<fmt:formatNumber minFractionDigits="3" pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${sessionScope.axisctr_garantia.IEXTRAP}'/>"  title="<axis:alt f="axisctr011" c="LIT_IEXTRAP" lit="101918"/>"/>
                                                        </td>   
                                                    </axis:ocultar>
                                                    <axis:visible f="axisctr011" c="PRECARG">
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="sobreprima" name="sobreprima" size="15"
                                                            <axis:atr f="axisctr011" c="PRECARG" a="modificable=true&obligatorio=false&formato=decimal"/>
                                                            value="<fmt:formatNumber pattern='###,##0.00' value='${sessionScope.axisctr_garantia.PRECARG}'/>" formato="decimal" title="<axis:alt f="axisctr011" c="LIT_PRECARG" lit="101671"/>"/>
                                                        </td>   
                                                    </axis:visible>
                                                    <axis:visible f="axisctr011" c="PDTOCOM">
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="dto" name="dto" size="15"
                                                            <axis:atr f="axisctr011" c="PDTOCOM" a="modificable=true&obligatorio=false&formato=decimal"/>
                                                            value="<fmt:formatNumber pattern='###,##0.00' value='${sessionScope.axisctr_garantia.PDTOCOM}'/>" formato="decimal" title="<axis:alt f="axisctr011" c="LIT_PDTOCOM" lit="1000119"/>"/>
                                                        </td>
                                                    </axis:visible>
                                                    <axis:visible f="axisctr011" c="IPRITOT">
                                                         <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto campodisabled" id="prima_neta" name="prima_neta" size="15"
                                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${sessionScope.axisctr_garantia.IPRITOT}'/>" readonly="true"/>
                                                        </td>
                                                     </axis:visible>
                                                   
                                                    </tr>
                                                    <axis:ocultar f="axisctr011" c="IARBITR" dejarHueco="false">
                                                        <td class="campocaja titulocampo" id="td_IARBITR">
                                                            <b><axis:alt f="axisctr011" c="LIT_IARBRIT" lit="101705" /></b>  <!-- IARBRIT -->
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisctr011" c="ICDERREG" dejarHueco="false">
                                                        <td class="campocaja titulocampo" id="td_ICDERREG">
                                                            <b><axis:alt f="axisctr011" c="LIT_ICDERREG" lit="9001509" /></b>  <!-- ICDERREG-->
                                                        </td>
                                                    </axis:ocultar>
                                                    <tr>
                                                     <axis:ocultar f="axisctr011" c="IARBITR" dejarHueco="false">
                                                         <td class="campocaja" id="td_IARBITR">
                                                            <input type="text" class="campowidthinput campo campotexto campodisabled" id="IARBITR" name="IARBITR" size="15"
                                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${sessionScope.axisctr_garantia.IARBITR}'/>" readonly="true"/>
                                                        </td>
                                                     </axis:ocultar>
                                                     <axis:ocultar f="axisctr011" c="ICDERREG" dejarHueco="false">
                                                         <td class="campocaja" id="td_ICDERREG">
                                                            <input type="text" class="campowidthinput campo campotexto campodisabled" id="ICDERREG" name="ICDERREG" size="15"
                                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${sessionScope.axisctr_garantia.ICDERREG}'/>" readonly="true"/>
                                                        </td>
                                                     </axis:ocultar>
                                                     
                                                    </tr>
                                                    <tr>
                                                    <axis:visible f="axisctr011" c="IRECFRA">
                                                        <td class="campocaja titulocampo">
                                                            <b><axis:alt f="axisctr011" c="LIT_IRECFRA" lit="1000341" /></b>   <!-- Rec = IRECFRA  -->
                                                        </td>
                                                    </axis:visible>
                                                    <axis:visible f="axisctr011" c="ICONSOR">
                                                         <td class="campocaja titulocampo">
                                                            <b><axis:alt f="axisctr011" c="LIT_ICONSOR" lit="103101" /></b> <!-- Cons = ICONSOR -->
                                                        </td>
                                                    </axis:visible>
                                                    <axis:visible f="axisctr011" c="IDGS">
                                                        <td class="campocaja titulocampo">
                                                            <b><axis:alt f="axisctr011" c="LIT_IDGS" lit="1000498" /></b> <!-- Imp.clea = IDGS -->
                                                        </td>
                                                    </axis:visible>
                                                    <axis:visible f="axisctr011" c="IIPS">
                                                         <td class="campocaja titulocampo">
                                                            <b><axis:alt f="axisctr011" c="LIT_IIPS" lit="101515" /></b>  <!-- IPS = IIPS -->
                                                        </td>
                                                    </axis:visible>
                                                    <axis:visible f="axisctr011" c="ITOTALR">
                                                        <td class="campocaja titulocampo">
                                                            <b><axis:alt f="axisctr011" c="LIT_ITOTALR" lit="140531" /></b> <!-- Prima total = ITOTALR -->
                                                        </td>
                                                    </axis:visible>  
                                                    </tr>
      
                                                    <tr>
                                                    <axis:visible f="axisctr011" c="IRECFRA">
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto campodisabled" id="rec" name="rec" size="15"
                                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${sessionScope.axisctr_garantia.IRECFRA}'/>" readonly="true"/>
                                                        </td>
                                                    </axis:visible>
                                                    <axis:visible f="axisctr011" c="ICONSOR">
                                                         <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto campodisabled" id="cons" name="cons" size="15"
                                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${sessionScope.axisctr_garantia.ICONSOR}'/>" readonly="true"/>
                                                        </td>
                                                    </axis:visible>
                                                    <axis:visible f="axisctr011" c="IDGS">
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto campodisabled" id="clea" name="clea" size="15"
                                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${sessionScope.axisctr_garantia.IDGS}'/>" readonly="true"/>
                                                        </td>
                                                    </axis:visible>
                                                    <axis:visible f="axisctr011" c="IIPS">
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto campodisabled" id="ips" name="ips" size="15"
                                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${sessionScope.axisctr_garantia.IIPS}'/>" readonly="true"/>
                                                        </td>
                                                    </axis:visible>
                                                    <axis:visible f="axisctr011" c="ITOTALR">
                                                         <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto campodisabled" id="prima_total" name="prima_total" size="15"
                                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${sessionScope.axisctr_garantia.ITOTALR}'/>" readonly="true"/>
                                                        </td>
                                                    </axis:visible>                                                        
                                                    </tr>
                                                    <!--etm ini 21657-->
                                                         <tr>
                                                     <axis:visible f="axisctr011" c="PDTOTEC" >
                                                        <td class="titulocaja">
                                                            <b id="label_PDTOTEC"><axis:alt f="axisctr011" c="LIT_9903609" lit="9903609" /></b>
                                                        </td>
                                                    </axis:visible> 
                                                   
                                                         <axis:visible f="axisctr011" c="IDTOTEC" >
                                                        <td class="titulocaja">
                                                            <b id="label_IDTOTEC"><axis:alt f="axisctr011" c="LIT_9903664" lit="9903664" /></b>
                                                        </td>
                                                    </axis:visible> 
                                                        <axis:visible f="axisctr011" c="PRECCOM" >
                                                            <td class="titulocaja">
                                                                <b id="label_PRECCOM"><axis:alt f="axisctr011" c="LIT_9903608" lit="9903608" /></b>
                                                            </td>
                                                        </axis:visible>
                                                        
                                                         <axis:visible f="axisctr011" c="IRECCOM" >
                                                        <td class="titulocaja">
                                                            <b id="label_IRECCOM"><axis:alt f="axisctr011" c="LIT_9903665" lit="9903665" /></b>
                                                        </td>
                                                    </axis:visible> 
                                                     </tr>   
                                                     
                                                    <tr>
                                                    <axis:visible f="axisctr011" c="PDTOTEC" >
                                                        <td class="campocaja">
                                                            <input type="text" style="width:85%"  class="campowidth campo campotexto" id="dto_tecnico" name="dto_tecnico" 
                                                            title="<axis:alt f="axisctr011" c="PDTOTEC" lit="9903609"/>" size="15" value ="<fmt:formatNumber pattern="###,##0.00" value= '${sessionScope.axisctr_garantia.PDTOTEC}'/>"
                                                            <axis:atr f="axisctr011" c="PDTOTEC" a="modificable=true&formato=decimal"/>/>&nbsp;
                                                        </td>
                                                     
                                                    </axis:visible>
                                                       <axis:visible f="axisctr011" c="IDTOTEC" >
                                                        <td class="campocaja">
                                                            <input type="text" style="width:85%"  class="campowidth campo campotexto" id="IDTOTEC" name="IDTOTEC" onchange=""
                                                            title="<axis:alt f="axisctr011" c="LIT_9903664" lit="9903664"/>" size="15" value ="<fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value='${sessionScope.axisctr_garantia.IDTOTEC}'/>" readonly="true"
                                                            <axis:atr f="axisctr011" c="IDTOTEC" a="modificable=false&formato=decimal"/>/>&nbsp;
                                                           
                                                        </td>
                                                    </axis:visible>
                                                    
                                                      <axis:visible f="axisctr011" c="PRECCOM" >
                                                        <td class="campocaja">
                                                                 <input type="text" style="width:85%"  class="campowidth campo campotexto" id="por_recargocomercial" name="por_recargocomercial" onchange=""
                                                            title="<axis:alt f="axisctr011" c="LIT_9903608" lit="9903608"/>" size="15" value ="<fmt:formatNumber pattern="###,##0.00" value='${sessionScope.axisctr_garantia.PRECCOM}'/>"
                                                            <axis:atr f="axisctr011" c="PRECCOM" a="modificable=true&formato=decimal"/>/>&nbsp;
                                                       </td>
                                                    </axis:visible>
                                                     <axis:visible f="axisctr011" c="IRECCOM" >
                                                        <td class="campocaja">
                                                                 <input type="text" style="width:85%"  class="campowidth campo campotexto" id="IRECCOM" name="IRECCOM" onchange=""
                                                            title="<axis:alt f="axisctr011" c="LIT_9903665" lit="9903665"/>" size="15" value ="<fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value='${sessionScope.axisctr_garantia.IRECCOM}'/>" readonly="true"
                                                            <axis:atr f="axisctr011" c="IRECCOM" a="modificable=false&formato=decimal"/>/>&nbsp;
                                                       </td>
                                                    </axis:visible>
                                                    </tr>
                                                     <!--etm fin-->
                                                </table>
                                            </td>
                                        </tr>
                                        
                                       
                                    </table>
                                </td>
                            </tr>
                            
                             <!-- **************************************** Table desglose tarifa *************************************  -->
                            <axis:visible  f="axisctr011" c="DSP_DETPRIMAS">
                                <tr>
                                    <td class="campocaja titulocampo"> 
                                        <b><axis:alt f="axisctr011" c="LIT_IPRITAR" lit="9903544" /></b> <!-- Tabla Corr. -->
                                    </td>
                                </tr>
                                <tr>
                                      <td colspan="3">
                                          <!--div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr011" c="IMG_TITULO_DESPLEGA" lit="9903544"/></div-->
                            
                                            <c:set var="title1"><axis:alt f="axisctr011" c="CORRTARIFA" lit="9000715" /></c:set><!-- Corrector de tarifa -->
                                            <c:set var="title2"><axis:alt f="axisctr011" c="VALOR" lit="101159" /></c:set><!-- valor -->
                                            
                                            <div class="displayspace">
                                              <display:table name="${DETPRIMAS}" id="DETPRIMAS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                               requestURI="axis_axisctr011.do?paginar=true">
                                                <%@ include file="../include/displaytag.jsp"%>  
                                                
                                                               
                                                <display:column title="${title1}" sortable="true" sortProperty="npoliza" headerClass="sortable fixed" media="html" autolink="false" >
                                                    <div class="dspText">${DETPRIMAS.OB_IAX_DETPRIMAS.TCONCEP}</div>
                                                </display:column>  
                                               
                                                <display:column title="${title2}" sortable="true" sortProperty="titpro" headerClass="sortable fixed" media="html" autolink="false" >
                                                    <div class="dspText">
                                                    <input type="text" class="campowidthinput campo campotexto campodisabled" id="valorcorr" name="valorcorr" size="15"
                                                    value="<fmt:formatNumber pattern='${DETPRIMAS.OB_IAX_DETPRIMAS.PDECVIS}' value='${DETPRIMAS.OB_IAX_DETPRIMAS.ICONCEP}'/>" readonly="true"/>
                                                </display:column> 
                                                               
                                            </display:table>
                                            </div>
                                          
                                          </td>
                                    </tr>
                                </axis:visible>
                                <!-- **************************************** Fin tabla desg. tarifa ************************************  -->
                        </table>
                    </td>
                </tr>
            </table>

            <!-- Botonera -->
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr011</c:param><c:param name="f">axisctr011</c:param>
                <c:param name="__botones">cancelar,buscar,aceptar</c:param>
            </c:import>
            <c:import url="../include/mensajes.jsp" />
        </form>
    </div>
    </body>
</html>
