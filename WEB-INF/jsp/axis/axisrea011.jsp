<%/*
*  Fichero: axisrea011.jsp
*
*  Fecha: 29/06/2009
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axisrea011" c="AXISREA011_TIT" lit="9001860"/></title> <%-- Consulta de cesiones --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
   
    <style type="text/css">
        .displayspace {
            width:99.8%;
            height: expression( this.scrollHeight > 349 ? "350px" : "auto" );
            max-height:350px;
            overflow-x: hidden;
            overflow-y: auto;
            border: 1px solid #DDDDDD;
        }
    </style>

    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() { 
            revisarEstilos();
            f_cargar_propiedades_pantalla();//BFP bug 20747 2/02/2012
            var hayErrores    = ${!empty requestScope.__mensajes.m__clave};
            
            if (${empty requestScope.T_IAX_CESIONESREA} && !hayErrores)
                f_but_buscar();
        }
        
        function f_but_salir() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisrea011", "cancelar", document.miForm, "_self");
        }
        
        function f_but_buscar() {
            f_abrir_modal("axisrea010");
        }
        
        
        function f_detallRebut(NMOVIMI){
            var SSEGURO = objDom.getValorPorId("SSEGURO");            
            f_abrir_modal("axisrea012", false, "&SSEGURO=" + SSEGURO + "&NMOVIMI=" + NMOVIMI + "&primeraCarrega=0"); 
        }
        
        
        function f_muestra_detalle(NMOVIMI, TCGENERA, CGENERA, FEFECTO, FVENCIM, FANULAC, NRIESGO, NOM, SCONTRA, NVERSIO, TCONTRA, TCTRAMO, SFACULT, CGARANT, TGARANT, NSINIES, SIDEPAG, PFACCED, ICAPCES, PRIMARET, ICOMEXT, ICESION, PCESION) {                    
            //   si es explorer
            if(document.all){
               document.getElementById("detalle").style.display = 'inline';        
            }
        //    si no es explorer    
            else{
                document.getElementById("detalle").style.display = 'table';            
            }            
            
            document.getElementById("resumen_detalle").innerHTML = SCONTRA + "/" + NVERSIO + " &nbsp; " + TCTRAMO +" &nbsp; <b><axis:alt f='axisrea011' c='AXISREA011_DET' lit='100883'/>:</b> " + FEFECTO;
            objDom.setValorPorId("NMOVIMI", NMOVIMI);
            objDom.setValorPorId("TCGENERA", TCGENERA);
            objDom.setValorPorId("FEFECTO", FEFECTO);
            objDom.setValorPorId("FVENCIM", FVENCIM);
            objDom.setValorPorId("FANULAC", FANULAC);
            objDom.setValorPorId("NRIESGO", NRIESGO);
            objDom.setValorPorId("NMOVIMI", NMOVIMI);
            objDom.setValorPorId("NOM", NOM);
            objDom.setValorPorId("SCONTRA", SCONTRA);
            objDom.setValorPorId("NVERSIO", NVERSIO);
            objDom.setValorPorId("TCONTRA", TCONTRA);
            objDom.setValorPorId("TCTRAMO", TCTRAMO);
            objDom.setValorPorId("SFACULT", SFACULT);
            objDom.setValorPorId("CGARANT", CGARANT);
            objDom.setValorPorId("TGARANT", TGARANT);
            objDom.setValorPorId("PRIMARET", PRIMARET);
            objDom.setValorPorId("ICOMEXT", ICOMEXT);
            if(CGENERA == 2 && (NSINIES == '' || NSINIES == null)){
                objDom.setValorPorId("NSINIES", "Reemb. " + SIDEPAG);
            }
            else{            
                objDom.setValorPorId("NSINIES", NSINIES + (!objUtiles.estaVacio(NSINIES) ? "/" : "") + SIDEPAG);
                }
            objDom.setValorPorId("PFACCED", PCESION);
            objDom.setValorPorId("ICAPCES", ICAPCES);
            objDom.setValorPorId("ICESION", ICESION);
        }

        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/

        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }

        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        function f_cerrar_axisrea010() {
            objUtiles.cerrarModal("axisrea010");
        }
        
        function f_aceptar_axisrea010(SSEGURO, NPOLIZA, TIPO_REA, NCERTIF) {
            objUtiles.cerrarModal("axisrea010");
            objDom.setValorPorId("SSEGURO", SSEGURO);
            objDom.setValorPorId("NPOLIZA", NPOLIZA);
            objDom.setValorPorId("TIPO_REA", TIPO_REA);
            objDom.setValorPorId("NCERTIF", NCERTIF);
            objUtiles.ejecutarFormulario("axis_axisrea011.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_cerrar_axisctr069() {
            objUtiles.cerrarModal("axisctr069");
            objUtiles.ejecutarFormulario("axis_axisrea011.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisrea011" c="TITULO_NT1" lit="9001860"/></c:param>     <%-- Consulta de cesiones --%>
                <c:param name="formulario"><axis:alt f="axisrea011" c="TITULO_NT2" lit="9001860"/></c:param> <%-- Consulta de cesiones --%>
                <c:param name="form">axisrea011</c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">
                axisrea010|<axis:alt f="axisrea011" c="CERCADOR_TIT" lit="9001862"/><%-- Buscador de cesiones --%>#axisrea012|<axis:alt f="axisrea011" c="CES_X_RECIBO" lit="9001863"/><%-- Consulta datos de cesión por recibo --%>
            </c:param>
        </c:import>
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>
        <input type="hidden" id="NPOLIZA" name="NPOLIZA" value="${__formdata.NPOLIZA}"/>
        <input type="hidden" id="TIPO_REA" name="TIPO_REA" value="${__formdata.TIPO_REA}"/>                
        <input type="hidden" id="NCERTIF" name="NCERTIF" value="${__formdata.NCERTIF}"/>                
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <c:if test="${!empty requestScope.T_IAX_CESIONESREA && empty requestScope.__mensajes.m__clave}">
                        <c:set var="resumen">
                            <span class="titulocaja" style="color:black;font-weight:normal;padding-bottom:2px;.vertical-align:bottom">
                                <b><axis:alt f="axisrea011" c="N_POLIZA" lit="9001875"/>:</b> ${__formdata.NPOLIZA}   
                                <b>   <axis:alt f="axisrea011" c="N_CERTIF" lit="101096"/></b> ${__formdata.NCERTIF}   
                            </span>
                        </c:set>
                    </c:if>
                    <div class="separador">&nbsp;</div>
                    <div class="titulo" ><img src="images/flecha.gif"/><axis:alt f="axisrea011" c="FLETXA_DET" lit="1000113"/><%-- Detalle --%> &nbsp; ${resumen} &nbsp; <img border="0" src="images/find.gif" onclick="f_but_buscar()" style="cursor:pointer" alt="<axis:alt f="axisrea011" c="CERCA_DET" lit="9000508"/>" title="<axis:alt f="axisrea011" c="CERCADET2" lit="9000508"/>"/></div>
                    
                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left">
                                <div class="separador">&nbsp;</div>
                                <table class="area" align="center">
                                    <tr>
                                        <td>
                                        <%-- DisplayTag Cesiones --%>
                                            <c:set var="title0"><axis:alt f="axisrea011" c="MOVECES" lit="9001868"/></c:set> <%-- Movimiento --%> 
                                            <c:set var="title1"><axis:alt f="axisrea011" c="GARANCES" lit="110994"/></c:set>  <%-- Garantía --%>
                                            <c:set var="title2"><axis:alt f="axisrea011" c="CONTRATOCES" lit="9001894"/></c:set> <%-- Contrato --%>                                           
                                            <c:set var="title4"><axis:alt f="axisrea011" c="FEFECTCES" lit="100883"/></c:set>  <%-- Fecha efecto --%>
                                            <c:set var="title5"><axis:alt f="axisrea011" c="FVENCCES" lit="100885"/></c:set>  <%-- Fecha vencimiento --%>
                                            <c:set var="title6"><axis:alt f="axisrea011" c="VERSCES" lit="9001146"/></c:set> <%-- Versión --%>
                                            <c:set var="title7"><axis:alt f="axisrea011" c="CEDIDOCES" lit="9000618"/></c:set> <%-- % Cedido --%>
                                            <c:set var="title8"><axis:alt f="axisrea011" c="ICAPITCES" lit="9001933"/></c:set> <%-- Imp.capital --%>
                                            <c:set var="title9"><axis:alt f="axisrea011" c="ICESIONCES" lit="9001919"/></c:set> <%-- Imp.cesión --%>
                                            <c:set var="title10"><axis:alt f="axisrea011" c="PRIMARET" lit="9906654"/></c:set> <%-- Prima retencion --%>
                                            <c:set var="title11"><axis:alt f="axisrea011" c="ICOMEXT" lit="9906742"/></c:set> <%-- Comisión extra prima --%>
                                            <c:set var="search" value="\'"/>
                                            <c:set var="change" value="\&acute;"/>
              
                                            <div class="displayspaceGrande">
                                                <display:table name="${requestScope.T_IAX_CESIONESREA}" id="T_IAX_CESIONESREA" export="false" class="dsptgtable" pagesize="-1" cellpadding="0" cellspacing="0"
                                                     requestURI="axis_axisrea011.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                                                                       
                                                    <display:column title="" sortable="false" headerClass="sortable headwidth5 fixed"  media="html" autolink="false">
                                                        <div class="dspIcons">
                                                            <input type="radio" 
																   name="selCesiones" 
																   id="${T_IAX_CESIONESREA.SSEGURO}" 
																   value="${T_IAX_CESIONESREA.SSEGURO}" 
																   onclick="f_muestra_detalle('${T_IAX_CESIONESREA.NMOVIMI}', '${T_IAX_CESIONESREA.TCGENERA}','${T_IAX_CESIONESREA.CGENERA}', '<fmt:formatDate value="${T_IAX_CESIONESREA.FEFECTO}" pattern="dd/MM/yyyy"/>', '<fmt:formatDate value="${T_IAX_CESIONESREA.FVENCIM}" pattern="dd/MM/yyyy"/>', '<fmt:formatDate value="${T_IAX_CESIONESREA.FANULAC}" pattern="dd/MM/yyyy"/>', '${T_IAX_CESIONESREA.NRIESGO}', '${fn:replace(T_IAX_CESIONESREA.NOM,search,change)}', '${T_IAX_CESIONESREA.SCONTRA}', '${T_IAX_CESIONESREA.NVERSIO}', '${fn:replace(T_IAX_CESIONESREA.TCONTRA,search,change)}', '${fn:replace(T_IAX_CESIONESREA.TCTRAMO,search,change)}', '${T_IAX_CESIONESREA.SFACULT}', '${T_IAX_CESIONESREA.CGARANT}', '${fn:replace(T_IAX_CESIONESREA.TGARANT,search,change)}', '${T_IAX_CESIONESREA.NSINIES}', '${T_IAX_CESIONESREA.SIDEPAG}', '<fmt:formatNumber value="${T_IAX_CESIONESREA.PFACCED}" pattern="${__formatNumberPorcentajeDefault}"/>', '<fmt:formatNumber value="${T_IAX_CESIONESREA.ICAPCES}" pattern="${__formatNumberPatterns[CMONEDAPROD]}"/>', '<fmt:formatNumber value="${T_IAX_CESIONESREA.PRIMARET}" pattern="${__formatNumberPatterns[CMONEDAPROD]}"/>' ,  '<fmt:formatNumber value="${T_IAX_CESIONESREA.ICOMEXT}" pattern="${__formatNumberPatterns[CMONEDAPROD]}"/>' ,<axis:visible f='axisrea011' c='ICESION_1' > '<fmt:formatNumber value="${fn:replace(T_IAX_CESIONESREA.ICESION,__locale_formato_separadorDecimales,__locale_formato_separadorMiles)}" pattern="${__formatNumberPatterns[CMONEDAPROD]}"/>' </axis:visible><axis:visible f='axisrea011' c='ICESION_CP' > '<fmt:formatNumber value="${T_IAX_CESIONESREA.ICESION_CP}" pattern="${__formatNumberPatterns[CMONEDAPROD]}"/>' </axis:visible> , <axis:visible f='axisrea011' c='PCESION_1' >'<fmt:formatNumber value="${T_IAX_CESIONESREA.PCESION}" pattern="${__formatNumberPorcentajeDefault}"/>' </axis:visible><axis:visible f='axisrea011' c='PCESION_CP' >'<fmt:formatNumber value="${T_IAX_CESIONESREA.PCESION_CP}" pattern="${__formatNumberPorcentajeDefault}"/>' </axis:visible>);"
															/>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title0}" sortable="true" sortProperty="NUM" headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            ${T_IAX_CESIONESREA.NMOVIMI}${!empty T_IAX_CESIONESREA.NMOVIMI && !empty T_IAX_CESIONESREA.TCGENERA ? ' - ' : ''}${T_IAX_CESIONESREA.TCGENERA}
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title1}" sortable="true" sortProperty="CGARANT" headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            ${T_IAX_CESIONESREA.CGARANT}${!empty T_IAX_CESIONESREA.CGARANT && !empty T_IAX_CESIONESREA.TGARANT ? ' - ' : ''}${T_IAX_CESIONESREA.TGARANT}
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="SCONTRA" headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            ${T_IAX_CESIONESREA.SCONTRA}${!empty T_IAX_CESIONESREA.SCONTRA && !empty T_IAX_CESIONESREA.TCONTRA ? ' - ' : ''}${T_IAX_CESIONESREA.TCONTRA}
                                                        </div>
                                                    </display:column>
                                                     <display:column title="${title6}" sortable="true" sortProperty="NVERSIO" headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            ${T_IAX_CESIONESREA.NVERSIO}
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title4}" sortable="true" sortProperty="FEFECTO" headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            <fmt:formatDate value="${T_IAX_CESIONESREA.FEFECTO}" pattern="dd/MM/yyyy"/>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title5}" sortable="true" sortProperty="FVENCIM" headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            <fmt:formatDate value="${T_IAX_CESIONESREA.FVENCIM}" pattern="dd/MM/yyyy"/>
                                                        </div>
                                                    </display:column>  
                                                    <axis:visible f="axisrea011" c="PCESION_1" >
                                                        <display:column title="${title7}" sortable="true" sortProperty="PCESION" headerClass="sortable fixed"  media="html" autolink="false">
                                                            <div class="dspText">
																<fmt:formatNumber value="${T_IAX_CESIONESREA.PCESION}" pattern="${__formatNumberPatterns[CMONEDAPROD]}"/>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                     <axis:visible f="axisrea011" c="PCESION_CP" >
                                                        <display:column title="${title7}" sortable="true" sortProperty="PCESION_CP" headerClass="sortable fixed"  media="html" autolink="false">
                                                            <div class="dspText">
																<fmt:formatNumber value="${T_IAX_CESIONESREA.PCESION_CP}" pattern="${__formatNumberPatterns[CMONEDAPROD]}"/>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <display:column title="${title8}" sortable="true" sortProperty="ICAPCES" headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            <fmt:formatNumber value="${T_IAX_CESIONESREA.ICAPCES}" pattern="${__formatNumberPatterns[CMONEDAPROD]}"/>                                                            
                                                        </div>
                                                    </display:column> 
                                                     <axis:visible f="axisrea011" c="ICESION_1" >
                                                        <display:column title="${title9}" sortable="true" sortProperty="ICESION" headerClass="sortable fixed"  media="html" autolink="false">
                                                            <div class="dspText">
																<fmt:formatNumber value="${fn:replace(T_IAX_CESIONESREA.ICESION,__locale_formato_separadorDecimales,__locale_formato_separadorMiles)}" pattern="${__formatNumberPatterns[CMONEDAPROD]}"/>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                     <axis:visible f="axisrea011" c="ICESION_CP" >
                                                        <display:column title="${title9}" sortable="true" sortProperty="ICESION_CP" headerClass="sortable fixed"  media="html" autolink="false">
                                                            <div class="dspText">
                                                                <fmt:formatNumber value="${T_IAX_CESIONESREA.ICESION_CP}" pattern="${__formatNumberPatterns[CMONEDAPROD]}"/>                                                            
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisrea011" c="PRIMARET" >
                                                        <display:column title="${title10}" sortable="true" sortProperty="PRIMARET" headerClass="sortable fixed"  media="html" autolink="false">
                                                            <div class="dspText">
                                                                <fmt:formatNumber value="${T_IAX_CESIONESREA.PRIMARET}" pattern="${__formatNumberPatterns[CMONEDAPROD]}"/>                                                            
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisrea011" c="ICOMEXT" >
                                                        <display:column title="${title11}" sortable="true" sortProperty="ICOMEXT" headerClass="sortable fixed"  media="html" autolink="false">
                                                            <div class="dspText">
                                                                <fmt:formatNumber value="${T_IAX_CESIONESREA.ICOMEXT}" pattern="${__formatNumberPatterns[CMONEDAPROD]}"/>                                                            
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <display:column headerClass="headwidth5 sortable" media="html" autolink="false" >                                                            
                                                            <div class="dspIcons">
                                                                <c:if test="${T_IAX_CESIONESREA.TIPO_REA == 1 && T_IAX_CESIONESREA.CGENERA != 2}">
                                                                    <a href="javascript:f_detallRebut('${T_IAX_CESIONESREA.NMOVIMI}')">                                                                 
                                                                        <img border="0" align = "center" alt="<axis:alt f="axisrea011" c="DESGAMP1" lit="9001863"/>"  title="<axis:alt f="axisrea011" c="DESGAMP2" lit="9001863"/>" src="images/mas.gif"/>
                                                                    </a>
                                                                </c:if>   
                                                            </div>
                                                    </display:column>
                                                </display:table>                                                        
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <div class="separador">&nbsp;</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                            <div class="separador">&nbsp;</div>
                                <table class="area" align="center" id="detalle" style="display:none">
                                    <tr>
                                        <td>
                                            <c:set var="resumen_detalle">
                                                <span id="resumen_detalle" class="titulocaja" style="color:black;font-weight:normal;padding-bottom:2px;.vertical-align:bottom">
                                                    ${__formdata.SCONTRA}/${__formdata.NVERSIO} &nbsp; ${__formdata.TCTRAMO} &nbsp; <b><axis:alt f="axisrea011" c="FEFECTOCES" lit="100883"/>:</b> <fmt:formatDate value="${__formdata.FEFECTO}" pattern="dd/MM/yyyy"/>                        
                                                </span>
                                            </c:set>
                                            <div class="titulo" ><img src="images/flecha.gif"/><axis:alt f="axisrea011" c="RESDETCES" lit="9001866"/> <%-- Detalle cesión --%> &nbsp; ${resumen_detalle} </div>

                                            <table class="area" align="center">
                                                <tr>
                                                    <th style="width:35%;height:0px"></th>
                                                    <th style="width:30%;height:0px"></th>
                                                    <th style="width:20%;height:0px"></th>
                                                    <th style="width:15%;height:0px"></th>
                                                </tr>
                                                
                                                <tr>
                                                    <axis:ocultar f="axisrea011" c="NMOVIMI" dejarHueco="false">
                                                        <td class="titulocaja">
                                                            <b id="label_NMOVIMI"><axis:alt f="axisrea011" c="LMOVCES" lit="9001868"/></b> <%-- Movimiento --%>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisrea011" c="FEFECTO" dejarHueco="false">
                                                        <td class="titulocaja">
                                                            <b id="label_FEFECTO"><axis:alt f="axisrea011" c="LFEFECTCES" lit="100883"/></b> <%-- Fecha efecto --%>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisrea011" c="FVENCIM" dejarHueco="false">
                                                        <td class="titulocaja">
                                                            <b id="label_FVENCIM"><axis:alt f="axisrea011" c="LFVENCCES" lit="100885"/></b> <%-- Fecha vencimiento --%>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisrea011" c="FANULAC" dejarHueco="false">
                                                        <td class="titulocaja">
                                                            <b id="label_FANULAC"><axis:alt f="axisrea011" c="LFANULCES" lit="140214"/></b> <%-- Fecha anulación --%>
                                                        </td>
                                                    </axis:ocultar>
                                                </tr>
                                                <tr>                 
                                                    <axis:ocultar f="axisrea011" c="NMOVIMI" dejarHueco="false">
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="NMOVIMI" name="NMOVIMI" size="15" 
                                                            <axis:atr f="axisrea011" c="NMOVIMI" a="modificable=false"/>
                                                            value="${__formdata.NMOVIMI}" style="width:10%"
                                                            title="<axis:alt f="axisrea011" c="CNMOVIMICES" lit="9001868"/>"/>
                                                            &nbsp;&nbsp;
                                                            <input type="text" class="campowidthinput campo campotexto" id="TCGENERA" name="TCGENERA" size="15" 
                                                            <axis:atr f="axisrea011" c="TCGENERA" a="modificable=false"/>
                                                            value="${__formdata.TCGENERA}" style="width:80%"
                                                            title="<axis:alt f="axisrea011" c="CTCGENERACES" lit="9001868"/>"/>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisrea011" c="FEFECTO" dejarHueco="false">
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="FEFECTO" name="FEFECTO" size="15" 
                                                            <axis:atr f="axisrea011" c="FEFECTO" a="modificable=false"/>
                                                            value="<fmt:formatDate value="${__formdata.FEFECTO}" pattern="dd/MM/yyyy"/>"
                                                            style="width:40%" title="<axis:alt f="axisrea011" c="CFEFECTOCES" lit="100883"/>"/>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisrea011" c="FVENCIM" dejarHueco="false">
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="FVENCIM" name="FVENCIM" size="15" 
                                                            <axis:atr f="axisrea011" c="FVENCIM" a="modificable=false"/>
                                                            value="<fmt:formatDate value="${__formdata.FVENCIM}" pattern="dd/MM/yyyy"/>"
                                                            style="width:60%" title="<axis:alt f="axisrea011" c="CFVENCIMCES" lit="100885"/>"/>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisrea011" c="FANULAC" dejarHueco="false">
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="FANULAC" name="FANULAC" size="15" 
                                                            <axis:atr f="axisrea011" c="FANULAC" a="modificable=false"/>
                                                            value="<fmt:formatDate value="${__formdata.FANULAC}" pattern="dd/MM/yyyy"/>"
                                                            style="width:85%" title="<axis:alt f="axisrea011" c="CFANULACCES" lit="140214"/>"/>
                                                        </td>
                                                    </axis:ocultar>
                                                </tr>
                                                <tr>
                                                    <axis:ocultar f="axisrea011" c="NRIESGO" dejarHueco="false">
                                                        <td class="titulocaja">
                                                            <b id="label_NRIESGO"><axis:alt f="axisrea011" c="LRIESGOCES" lit="100649"/></b> <%-- Riesgo --%>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisrea011" c="SCONTRA" dejarHueco="false">
                                                        <td class="titulocaja">
                                                            <b id="label_SCONTRA"><axis:alt f="axisrea011" c="LCONTRCES" lit="9001594"/></b> <%-- Contrato QP/núm.versión --%>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisrea011" c="TCTRAMO" dejarHueco="false">
                                                        <td class="titulocaja">
                                                            <b id="label_TCTRAMO"><axis:alt f="axisrea011" c="LTRAMOCES" lit="9000609"/></b> <%-- Tramo --%>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisrea011" c="SFACULT" dejarHueco="false">
                                                        <td class="titulocaja">
                                                            <b id="label_SFACULT"><axis:alt f="axisrea011" c="LNFACULTACES" lit="9001918"/></b> <%-- Nº facultativo --%>
                                                        </td>
                                                    </axis:ocultar>
                                                </tr>
                                                <tr>
                                                    <axis:ocultar f="axisrea011" c="NRIESGO" dejarHueco="false">
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="NRIESGO" name="NRIESGO" size="15" 
                                                            <axis:atr f="axisrea011" c="NRIESGO" a="modificable=false"/>
                                                            value="${__formdata.NRIESGO}" style="width:10%"
                                                            title="<axis:alt f="axisrea011" c="CNGRIESGOCES" lit="100649"/>"/>
                                                            &nbsp;&nbsp;
                                                            <input type="text" class="campowidthinput campo campotexto" id="NOM" name="NOM" size="15" 
                                                            <axis:atr f="axisrea011" c="NOM" a="modificable=false"/>
                                                            value="${__formdata.NOM}" style="width:80%"
                                                            title="<axis:alt f="axisrea011" c="CNOMCES" lit="100649"/>"/>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisrea011" c="SCONTRA" dejarHueco="false">
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="SCONTRA" name="SCONTRA" size="15" 
                                                            <axis:atr f="axisrea011" c="SCONTRA" a="modificable=false"/>
                                                            value="${__formdata.SCONTRA}" style="width:10%"
                                                            title="<axis:alt f="axisrea011" c="CSCONTRACES" lit="9001594"/>"/>
                                                            &nbsp;&nbsp;
                                                            <input type="text" class="campowidthinput campo campotexto" id="NVERSIO" name="NVERSIO" size="15" 
                                                            <axis:atr f="axisrea011" c="NVERSIO" a="modificable=false"/>
                                                            value="${__formdata.NVERSIO}" style="width:10%"
                                                            title="<axis:alt f="axisrea011" c="CNVERSIOCES" lit="9001594"/>"/>
                                                            &nbsp;&nbsp;
                                                            <input type="text" class="campowidthinput campo campotexto" id="TCONTRA" name="TCONTRA" size="15" 
                                                            <axis:atr f="axisrea011" c="TCONTRA" a="modificable=false"/>
                                                            value="${__formdata.TCONTRA}"
                                                            style="width:60%" title="<axis:alt f="axisrea011" c="CTCONTRACES" lit="9001594"/>"/>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisrea011" c="TCTRAMO" dejarHueco="false">
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="TCTRAMO" name="TCTRAMO" size="15" 
                                                            <axis:atr f="axisrea011" c="TCTRAMO" a="modificable=false"/>
                                                            value="${__formdata.TCTRAMO}"
                                                            style="width:85%" title="<axis:alt f="axisrea011" c="CTCTRAMOCES" lit="9000609"/>"/>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisrea011" c="SFACULT" dejarHueco="false">
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="SFACULT" name="SFACULT" size="15" 
                                                            <axis:atr f="axisrea011" c="SFACULT" a="modificable=false"/>
                                                            value="${__formdata.SFACULT}"
                                                            style="width:85%" title="<axis:alt f="axisrea011" c="CSFACULTCES" lit="9001918"/>"/>
                                                        </td>
                                                    </axis:ocultar>
                                                </tr>
                                                <tr>
                                                    <axis:ocultar f="axisrea011" c="CGARANT" dejarHueco="false">
                                                        <td class="titulocaja">
                                                            <b id="label_CGARANT"><axis:alt f="axisrea011" c="LGARANTICES" lit="110994"/></b> <%-- Garantía --%>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisrea011" c="NSINIES" dejarHueco="false">
                                                        <td class="titulocaja">
                                                            <b id="label_NSINIES"><axis:alt f="axisrea011" c="LSINIPAGCES" lit="9001869"/></b> <%-- Siniestro / pago --%>
                                                        </td>
                                                    </axis:ocultar>
                                                    <td class="titulocaja">
                                                        <axis:ocultar f="axisrea011" c="PFACCED" dejarHueco="false">
                                                            <b id="label_PFACCED"><axis:alt f="axisrea011" c="LREASCES" lit="9000608"/></b> <%-- % Reas. --%>
                                                            &nbsp;&nbsp;
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea011" c="ICAPCES" dejarHueco="false">
                                                            <b id="label_ICAPCES"><axis:alt f="axisrea011" c="LCAPACITCES" lit="9000602"/></b> <%-- Capacitat --%>
                                                        </axis:ocultar>
                                                    </td>
                                                    <axis:ocultar f="axisrea011" c="ICESION" dejarHueco="false">
                                                        <td class="titulocaja">
                                                            <b id="label_ICESION"><axis:alt f="axisrea011" c="LCESION" lit="9001870"/></b> <%-- Cesión --%>
                                                        </td>
                                                    </axis:ocultar>
                                                     <axis:ocultar f="axisrea011" c="PRIMARET" dejarHueco="false">
                                                        <td class="titulocaja">
                                                            <b id="label_PRIMARET"><axis:alt f="axisrea011" c="PRIMARET" lit="9906654"/></b> <%-- Prima retencion --%>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisrea011" c="ICOMEXT" dejarHueco="false">
                                                        <td class="titulocaja">
                                                            <b id="label_ICOMEXT"><axis:alt f="axisrea011" c="ICOMEXT" lit="9906742"/></b> <%-- Comisión extra prima --%>
                                                        </td>
                                                    </axis:ocultar>
                                                </tr>
                                                <tr>
                                                    <axis:ocultar f="axisrea011" c="CGARANT" dejarHueco="false">
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="CGARANT" name="CGARANT" size="15" 
                                                            <axis:atr f="axisrea011" c="CGARANT" a="modificable=false"/>
                                                            value="${__formdata.CGARANT}" style="width:10%"
                                                            title="<axis:alt f="axisrea011" c="CCGARANTCES" lit="110994"/>"/>
                                                            &nbsp;&nbsp;
                                                            <input type="text" class="campowidthinput campo campotexto" id="TGARANT" name="TGARANT" size="15" 
                                                            <axis:atr f="axisrea011" c="TGARANT" a="modificable=false"/>
                                                            value="${__formdata.TGARANT}" style="width:80%"
                                                            title="<axis:alt f="axisrea011" c="CTGARANTCES" lit="110994"/>"/>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisrea011" c="NSINIES" dejarHueco="false">
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="NSINIES" name="NSINIES" size="15" 
                                                            <axis:atr f="axisrea011" c="NSINIES" a="modificable=false"/>
                                                            value="${__formdata.NSINIES}" style="width:40%"
                                                            title="<axis:alt f="axisrea011" c="CNSINIESCES" lit="9001869"/>"/>
                                                        </td>
                                                    </axis:ocultar>
                                                    <td class="campocaja">
                                                        <axis:ocultar f="axisrea011" c="PFACCED" dejarHueco="false">
                                                            <input type="text" class="campowidthinput campo campotexto" id="PFACCED" name="PFACCED" size="15" 
                                                                <axis:atr f="axisrea011" c="PFACCED" a="modificable=false"/>
                                                                value='${__formdata.PCESION}' style="width:20%"
                                                                title="<axis:alt f="axisrea011" c="CPFACCEDCES" lit="9000608"/>" />
                                                                &nbsp;&nbsp;
                                                            <input type="text" class="campowidthinput campo campotexto" id="ICAPCES" name="ICAPCES" size="15"                                                                                                                        
                                                                <axis:atr f="axisrea011" c="ICAPCES" a="modificable=false"/>                            
                                                                style="width:55%"
                                                                value='${__formdata.ICAPCES}'
                                                                title="<axis:alt f="axisrea011" c="CICAPCESCES" lit="9000602"/>"/>                                                            
                                                        </axis:ocultar>
                                                    </td>
                                                    <axis:ocultar f="axisrea011" c="ICESION" dejarHueco="false">
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="ICESION" name="ICESION" size="15" 
                                                            <axis:atr f="axisrea011" c="ICESION" a="modificable=false"/>                                                            
                                                            value='${__formdata.ICESION}'
                                                            style="width:85%" title="<axis:alt f="axisrea011" c="CICESIONCES" lit="9001870"/>"/>
                                                        </td>
                                                    </axis:ocultar>
                                                   <axis:ocultar f="axisrea011" c="PRIMARET" dejarHueco="false">
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="PRIMARET" name="PRIMARET" size="15" 
                                                            <axis:atr f="axisrea011" c="PRIMARET" a="modificable=false"/>
                                                            value="${__formdata.PRIMARET}"
                                                            style="width:100px" title="<axis:alt f="axisrea011" c="PRIMARET" lit="9906654"/>"/>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisrea011" c="ICOMEXT" dejarHueco="false">
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="ICOMEXT" name="ICOMEXT" size="15" 
                                                            <axis:atr f="axisrea011" c="ICOMEXT" a="modificable=false"/>
                                                            value="${__formdata.ICOMEXT}"
                                                            style="width:100px" title="<axis:alt f="axisrea011" c="ICOMEXT" lit="9906742"/>"/>
                                                        </td>
                                                    </axis:ocultar>
                                                    
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisrea011</c:param><c:param name="f">axisrea011</c:param>
            <c:param name="__botones">salir</c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>

</body>
</html>