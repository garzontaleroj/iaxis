<%/**
*  Fichero: axissin003.jsp
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
*  
*  Primera pantalla del flujo de trabajo "Consulta de Siniestro". En ella:
*
* Descripción de pantalla
*
*  Fecha: 19/10/2007
*/
%>

<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><fmt:message key="1000231"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">
            
            /****************************************************************************************/
            /************************************* MODALES ******************************************/
            /****************************************************************************************/
            
            function f_abrir_axissin002() {
                objDom.setVisibilidadPorId("but_cerrar_modal_axissin002", "hidden");  
                objUtiles.abrirModal("axissin002","src","modal_axissin002.do?operation=form");
            }
            
            function f_cerrar_axissin002() {
                objUtiles.cerrarModal("axissin002");
            }  
           
            function f_aceptar_axissin002(NSINIES, SSEGURO) {
               f_cerrar_axissin002();
               objDom.setValorPorId("NSINIES", NSINIES);
               objDom.setValorPorId("SSEGURO", SSEGURO);
               objUtiles.ejecutarFormulario ("axis_axissin003.do", "cargarDatos", document.miForm, "_self", objJsMessages.jslit_cargando);     
               objDom.setDisabledPorId("but_mas_recibos", false);
            }
            
            function f_abrir_axissin004() {
                objDom.setVisibilidadPorId("but_cerrar_modal_axissin004", "hidden");  
                objUtiles.abrirModal("axissin004", "src", "modal_axissin004.do?operation=form&SSEGURO=" + objDom.getValorComponente(document.miForm.SSEGURO));
            }
            
            function f_cerrar_axissin004() {
                objUtiles.cerrarModal("axissin004");
            }  
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_but_salir() {
                //objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axissin003", "cancelar", document.miForm, "_self");
            }
            
            
            // llamada a consulta poliza '*','CONSPOLIZA','axisctr020'
            function f_but_151477() {
                objUtiles.ejecutarFormulario("axis_axissin003.do", "consultarPoliza", document.miForm, "_self", objJsMessages.jslit_cargando);
             }
            
            /* function f_but_apertura(){
             *   objUtiles.ejecutarFormulario("axis_axissin001.do", "form", document.miForm, "ftrabajo");
             * }
             */
            
            function f_onload(){
                <c:if test="${empty __formdata['NSINIES']}">
                    f_abrir_axissin002();
                    objDom.setDisabledPorId("but_mas_recibos", true);
                </c:if>
            }
            
        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="f_onload()" method="POST">
        <input type="hidden" id="operation" name="operation" value="" />
        <input type="hidden" name="SSEGURO" id ="SSEGURO" value="${__formdata.SSEGURO}"/>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><fmt:message key="1000230" /></c:param>
            <c:param name="nid" value="axissin002" />
        </c:import> 
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><fmt:message key="1000232" /></c:param>
            <c:param name="nid" value="axissin004" />
        </c:import> 

        <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad"><fmt:message key="100592" /></c:param>
                <c:param name="titulo"><fmt:message key="1000231" /></c:param>
                <c:param name="formulario"><fmt:message key="1000231" /></c:param>
                <c:param name="producto"></c:param>
                <c:param name="form">axissin003</c:param>
        </c:import>

    <!-- Area de campos  -->

    <!-- Seccion datos Póliza -->
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
        
        <tr>
          <td>
            <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="1000098" /></div>
            <!--campos-->
             <table class="seccion">
                <tr>
                    <td align="left" >
                         <table class="area" align="center">
                            <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                            </tr>
                            <tr>
                                <!-- Numero de poliza -->
                                <axis:ocultar c="NPOLIZA" f="axissin003" dejarHueco="false">                                
                                <td class="titulocaja">
                                    <b id="label_NPOLIZA"><fmt:message key="9001514" /></b>
                                </td>
                                </axis:ocultar>                                
                                
                                <!-- Certificado -->
                                <axis:ocultar c="NCERTIF" f="axissin003" dejarHueco="false">                                                                
                                <td class="titulocaja">
                                    <b id="label_NCERTIF"><fmt:message key="101300" /></b>
                                </td>
                                </axis:ocultar>                                                                
                                
                                <!-- Situación -->
                                <axis:ocultar c="TSITUAC" f="axissin003" dejarHueco="false">                                                                                                
                                <td class="titulocaja">
                                    <b id="label_TSITUAC"><fmt:message key="100874" /></b>
                                </td>
                                </axis:ocultar>                                
                                
                                  <!-- Producto -->
                                <axis:ocultar c="SPRODUC" f="axissin003" dejarHueco="false">                                                                                                
                                <td class="titulocaja" >
                                    <b id="label_SPRODUC"><fmt:message key="100829"/></b>
                                </td>
                                </axis:ocultar>                                
                             </tr>
                             <tr>
                                <!-- Numero de poliza -->
                                <axis:ocultar c="NPOLIZA" f="axissin003" dejarHueco="false">                                
                                <td class="campocaja">
                                    <input readonly="true" type="text" class="campodisabled campo campotexto" id="NPOLIZA" name="NPOLIZA" size="15"
                                    value="${__formdata.OB_IAX_DATPOLIZA.NPOLIZA}"/>
                                </td>
                                </axis:ocultar>                                
                                
                                <!-- Certificado -->
                                <axis:ocultar c="NCERTIF" f="axissin003" dejarHueco="false">                                                                                                
                                <td class="campocaja" >
                                    <input readonly="true" type="text" class="campodisabled campo campotexto" id="NCERTIF" name="NCERTIF" size="15" style="width:35%;"
                                    value="${__formdata.OB_IAX_DATPOLIZA.NCERTIF}"/>
                                </td>
                                </axis:ocultar>                                
                                
                                 <!-- Situación -->
                                <axis:ocultar c="TSITUAC" f="axissin003" dejarHueco="false">                                                                                                                                 
                                <td class="campocaja">
                                    <input readonly="true" type="text" class="campodisabled campo campotextoo" id="TSITUAC" name="TSITUAC" size="15"
                                    value="${__formdata.OB_IAX_DATPOLIZA.TSITUAC}"/>
                                </td>
                                </axis:ocultar>                                
                                
                                  <!-- Producto -->
                                <axis:ocultar c="SPRODUC" f="axissin003" dejarHueco="false">                                                                                                                                
                                <td colspan="2" class="campocaja">
                                    <input readonly="true" type="text" class="campodisabled campo campotexto" id="TPRODUC" name="TPRODUC"
                                    value="${__formdata.OB_IAX_DATPOLIZA.TPRODUC}"/>
                                </td>
                                </axis:ocultar>                                                               
                            </tr>
                            <tr>
                             <!-- fecha efecto-->
                                <axis:ocultar c="FEFECTO" f="axissin003" dejarHueco="false">                                                                                                                                                             
                                <td class="titulocaja">
                                    <b id="label_FEFECTO"><fmt:message key="100883" /></b>
                                </td>
                                </axis:ocultar>                                
                                
                                <!-- fecha vencimiento -->
                                <axis:ocultar c="FVENCIM" f="axissin003" dejarHueco="false">                                                                                                                                                                
                                <td class="titulocaja" >
                                    <b id="label_FVENCIM"><fmt:message key="100885" /></b>
                                </td>
                                </axis:ocultar>                                
                                
                                <!-- Fecha Anulación -->
                                <axis:ocultar c="FANULAC" f="axissin003" dejarHueco="false">                                                                                                                                                                
                                <td class="titulocaja" >
                                    <b id="label_FANULAC"><fmt:message key="140214"/></b>
                                </td>
                                </axis:ocultar>                                
                            </tr>
                            <tr>
                                <!-- fecha efecto-->
                                <axis:ocultar c="FEFECTO" f="axissin003" dejarHueco="false">                                                                                                                                                                                             
                                <td class="campocaja">
                                    <input readonly="true" type="text" class="campodisabled campo campotexto" id="FEFECTO" name="FEFECTO" size="15" style="width:60%"
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OB_IAX_DATPOLIZA.FEFECTO}"/>"/>
                                </td>
                                </axis:ocultar>                                
                                
                                <!-- fecha vencimiento -->
                                <axis:ocultar c="FVENCIM" f="axissin003" dejarHueco="false">                                                                                                                                                                                                                                
                                <td class="campocaja">
                                    <input readonly="true" type="text" class="campodisabled campo campotexto" id="FVENCIM" name="FEVENCIM" size="15" style="width:60%"
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OB_IAX_DATPOLIZA.FVENCIM}"/>"/>
                                </td>
                                </axis:ocultar>                                
                                
                                <!-- Fecha Anulación -->
                                <axis:ocultar c="FANULAC" f="axissin003" dejarHueco="false">                                                                                                                                                                                                
                                <td class="campocaja">
                                    <input readonly="true" type="text" class="campodisabled campo campotexto" id="FANULAC" name="FANULAC" size="15" style="width:60%"
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OB_IAX_DATPOLIZA.FANULAC}"/>"/>
                                </td>
                                </axis:ocultar>                                
                                
                                <tr><td><div class="separador">&nbsp;</div></td></tr>
                                
                                <tr >
                                <td class="campocaja" colspan="5">
                                    <!-- DisplayTag Tomadores -->
                                    <c:set var="title1"><fmt:message key="1000181" /></c:set>
                                    <div class="displayspace">
                                      <display:table name="${__formdata.T_IAX_TOMADORES}" id="miListaId" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                       requestURI="axis_axissin003.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_TOMADORES.TNOMBRE" headerClass="sortable" media="html" autolink="false" >
                                            <div class="dspText">${miListaId.OB_IAX_TOMADORES.TNOMBRE} ${miListaId.OB_IAX_TOMADORES.TAPELLI1} ${miListaId.OB_IAX_TOMADORES.TAPELLI2}</div>
                                        </display:column>
                                    </display:table>
                                    </div>
                                </td>
                            </tr>
                            </table>
            </table>
            <div class="separador">&nbsp;</div>
            <!-- Datos último recibo -->
            <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="111635" /></div>
            <!--campos-->
            <table class="seccion">
            <!--campos-->
                 <tr>
                    <td align="left" >
                      <table class="area" align="center">
                        <tr>
                            <td align="left" class="campocaja">
                                <!-- DisplayTag último recibo -->
                                <c:set var="title0"><fmt:message key="100895"/></c:set>
                                <c:set var="title1"><fmt:message key="100883"/></c:set>
                                <c:set var="title2"><fmt:message key="100885"/></c:set>
                                <c:set var="title3"><fmt:message key="100563"/></c:set>
                                <c:set var="title4"><fmt:message key="102302"/></c:set>
                                <c:set var="title5"><fmt:message key="100874"/></c:set>
                                <div class="displayspace">
                                    <display:table name="${__formdata.T_IAX_LASTRECIBO}" id="miListaId" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                    requestURI="axis_axissin003.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="${title0}" sortable="true" sortProperty="NRECIBO" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                            <div class="dspNumber">${miListaId.NRECIBO}</div>
                                        </display:column>
                                        <display:column title="${title1}" sortable="true" sortProperty="FEFECTO" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                            <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FEFECTO}"/></div>
                                        </display:column>
                                        <display:column title="${title2}" sortable="true" sortProperty="FVENCIM" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                            <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FVENCIM}"/></div>
                                        </display:column>                                            
                                        <display:column title="${title3}" sortable="true" sortProperty="ICONCEP" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                            <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.ICONCEP}"/></div>
                                        </display:column>                                                                                        
                                        <display:column title="${title4}" sortable="true" sortProperty="TTIPREC" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                            <div class="dspText">${miListaId.TTIPREC}</div>
                                        </display:column>                                                                                                                                    
                                        <display:column title="${title5}" sortable="true" sortProperty="TESTREC" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                            <div <c:if test="${miListaId['CESTREC']==0}">class="dspTextAviso"</c:if> <c:if test="${miListaId['CESTREC']!=0}">class="dspText"</c:if>>${miListaId['TESTREC']}</div>
                                        </display:column>                                                                                                                                     
                                    </display:table>
                                </div>
                             </td>
                        </tr>
                        <tr>
                            <td style="text-align:right">
                                 <div class="separador">&nbsp;</div>
                                 <input type="button" class="boton" id="but_mas_recibos" value="<fmt:message key="1000232" />" onclick="f_abrir_axissin004()" />
                            </td>
                        </tr>
                       </td>
                    </tr>
                </table>
             </table>
 
 
            <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="104929" /></div>
            <!--campos-->
             <table class="seccion">
                <tr>
                    <td align="left">
                         <table class="area" align="center">
                            <tr>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                            </tr>
                            <!-- Riesgo -->
                            <tr>
                                <!-- Siniestro -->
                                <td class="titulocaja">
                                    <b id="label_NPOLIZA"><fmt:message key="101298" /></b>
                                    <img border="0" src="images/find.gif" onclick="f_abrir_axissin002()" style="cursor:pointer"/>
                                </td>
                                
                                <!-- Situacion -->
                                <axis:ocultar c="TESTSIN" f="axissin003" dejarHueco="false">                                                                
                                 <td class="titulocaja">
                                    <b id="label_TESTSIN"><fmt:message key="100874" /></b>
                                </td>
                                </axis:ocultar>                                
                                
                                <!-- Subestado -->
                                <axis:ocultar c="TSUBESTSIN" f="axissin003" dejarHueco="false">                                                                                                
                                 <td class="titulocaja">
                                    <b id="label_TSUBESTSIN"><fmt:message key="9000852" /></b>
                                </td>
                                </axis:ocultar>                                
                                
                                <!-- F. Ocurrencia -->
                                <axis:ocultar c="FSINIES" f="axissin003" dejarHueco="false">                                                                                                
                                <td class="titulocaja">
                                    <b id="label_FSINIES"><fmt:message key="1000510" /></b>
                                </td>
                                </axis:ocultar>                                
                                
                                <!-- Hora Ocurrencia -->
                                <axis:ocultar c="HSINIES" f="axissin003" dejarHueco="false">                                                                                                
                                 <td class="titulocaja">
                                    <b id="label_HSINIES"><fmt:message key="1000242" /></b>
                                </td>
                                </axis:ocultar>                                
                                
                                <!-- F. Recepcion -->
                                <axis:ocultar c="FNOTIFI" f="axissin003" dejarHueco="false">                                                                                                
                                <td class="titulocaja">
                                    <b id="label_FNOTIFI"><fmt:message key="102913" /></b>
                                </td>
                                </axis:ocultar>                                
                                
                            </tr>
                            <tr>
                                <!-- Siniestro -->
                                <axis:ocultar c="NSINIES" f="axissin003" dejarHueco="false">                                                                                                                                
                                <td class="campocaja">
                                    <input readonly="true" type="text" class="campodisabled campo campotexto" id="NSINIES" name="NSINIES" size="15"   
                                    value="${__formdata.OB_IAX_SINIESTRO.NSINIES}"/> 
                                </td>
                                </axis:ocultar>                                                                
                                
                                <!-- Situacion -->
                                <axis:ocultar c="TESTSIN" f="axissin003" dejarHueco="false">                                                                                                                                                                
                                <td class="campocaja">
                                    <input readonly="true" type="text" class="campodisabled campo campotexto" id="TESTSIN" name="TESTSIN" size="15" value="${__formdata.OB_IAX_SINIESTRO.TESTSIN}"/>
                                </td>
                                </axis:ocultar>                                
                                 
                                 <!-- Subestado -->
                                <axis:ocultar c="TSUBESTSIN" f="axissin003" dejarHueco="false">                                                                                                                                                                 
                                <td class="campocaja">
                                    <input readonly="true" type="text" class="campodisabled campo campotexto" id="TSUBESTSIN" name="TSUBESTSIN" size="15" value="${__formdata.OB_IAX_SINIESTRO.TSUBEST}"/>
                                </td>
                                </axis:ocultar>           
                                
                                 <!-- F. Ocurrencia -->
                                <axis:ocultar c="FSINIES" f="axissin003" dejarHueco="false">                                                                                                                                                                 
                                <td class="campocaja"  >
                                    <input readonly="true" type="text" class="campodisabled campo campotexto" id="FSINIES" name="FSINIES" size="15"  
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OB_IAX_SINIESTRO.FSINIES}"/>"/>                                    
                                </td>
                                </axis:ocultar>                                                                
                                
                                <!-- Hora Ocurrencia -->
                                <axis:ocultar c="HSINIES" f="axissin003" dejarHueco="false">                                                                                                                                                                
                                <td class="campocaja">
                                    <input readonly="true" type="text" class="campodisabled campo campotexto" id="HSINIES" name="HSINIES" size="15" value="${__formdata.OB_IAX_SINIESTRO.HSINIES}"/>
                                </td>
                                </axis:ocultar>                                                                
                                
                                <!-- F. Recepcion -->
                                <axis:ocultar c="FNOTIFI" f="axissin003" dejarHueco="false">                                                                                                                                                                
                                <td class="campocaja">
                                    <input readonly="true" type="text" class="campodisabled campo campotexto" id="FNOTIFI"  style="width:97%" name="FNOTIFI"  
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OB_IAX_SINIESTRO.FNOTIFI}"/>"/>                                    
                                </td>
                                </axis:ocultar>                                                                
                                
                            </tr>
                            <tr>
                                <!-- Causas -->
                                <axis:ocultar c="TCAUSIN" f="axissin003" dejarHueco="false">                                
                                 <td class="titulocaja">
                                    <b id="label_TCAUSIN"><fmt:message key="180580" /></b>
                                </td>
                                </axis:ocultar>
                                
                                <!-- Motivo -->
                                <axis:ocultar c="TMOTSIN" f="axissin003" dejarHueco="false">                                
                                <td class="titulocaja">
                                    <b id="label_TMOTSIN"><fmt:message key="109651" /></b>
                                </td>
                                </axis:ocultar>
                                
                                <!-- Responsabilidad -->
                                <axis:ocultar c="TCULPAB" f="axissin003" dejarHueco="false">                                
                                <td class="titulocaja">
                                    <b id="label_TCULPAB"><fmt:message key="1000511" /></b>
                                </td>
                                </axis:ocultar>
                                
                                <!--  Riesgo -->
                                <axis:ocultar c="TRIESGO" f="axissin003" dejarHueco="false">                                
                                <td class="titulocaja">
                                    <b id="label_TRIESGO"><fmt:message key="100649" /></b>
                                </td>
                                </axis:ocultar>
                                
                            </tr>
                            <tr>
                                <!-- Causas -->
                                <axis:ocultar c="TCAUSIN" f="axissin003" dejarHueco="false">                                                                
                                <td class="campocaja">
                                    <input readonly="true" type="text" class="campodisabled campo campotexto" id="TCAUSIN" name="TCAUSIN" size="15" value="${__formdata.OB_IAX_SINIESTRO.TCAUSIN}"/>
                                </td>
                                </axis:ocultar>                                
                                
                                <!-- Motivo -->
                                <axis:ocultar c="TMOTSIN" f="axissin003" dejarHueco="false">                                                                
                                <td class="campocaja">
                                    <input readonly="true" type="text" class="campodisabled campo campotexto" id="TMOTSIN" name="TMOTSIN" size="15"  value="${__formdata.OB_IAX_SINIESTRO.TMOTSIN}"/>
                                </td>
                                </axis:ocultar>
                                
                                <!-- Responsabilidad -->
                                <axis:ocultar c="TCULPAB" f="axissin003" dejarHueco="false">                                                                
                                <td class="campocaja">
                                    <input readonly="true" type="text" class="campodisabled campo campotexto" id="TCULPAB" name="TCULPAB" size="15"  value="${__formdata.OB_IAX_SINIESTRO.TCULPAB}"/>
                                </td>
                                </axis:ocultar>
                                
                                <!-- Riesgo -->
                                <axis:ocultar c="TRIESGO" f="axissin003" dejarHueco="false">                                                                
                                <td class="campocaja" colspan="2">
                                    <input  readonly="true" type="text" class="campodisabled campo campotexto"  id="TRIESGO" name="TRIESGO" 
                                    value="${__formdata.OB_IAX_SINIESTRO.TRIESGO}"/>
                                </td>
                                </axis:ocultar>
                                
                            </tr>
                            <tr>
                                <!-- Zona Ocurrencia -->
                                <axis:ocultar c="TZONAOCU" f="axissin003" dejarHueco="false">                                                                                                
                                <td class="titulocaja">
                                    <b id="label_TZONAOCU"><fmt:message key="110492" /></b>
                                </td>
                                </axis:ocultar>                                
                            </tr>
                            <tr>
                                <!-- Zona Ocurrencia -->
                                <axis:ocultar c="TZONAOCU" f="axissin003" dejarHueco="false">                                                                                                                                
                                 <td colspan="5" style="width:100%;" class="campocaja">
                                      <textarea class="campodisabled campo campotexto" readonly="true" style="width:100%;" name="zocurrencia" id="zocurrencia">${__formdata.OB_IAX_SINIESTRO.TZONAOCU}</textarea>
                                 </td>
                                </axis:ocultar>                                 
                            </tr>
                            <tr>
                             <!-- Descripción del siniestro -->
                                <axis:ocultar c="TSINIES" f="axissin003" dejarHueco="false">                                                                                                                             
                                <td class="titulocaja">
                                    <b id="label_TSINIES"><fmt:message key="1000112" /></b>
                                </td>
                                </axis:ocultar>                                
                            </tr>
                            <tr>
                            <!-- Descripción del siniestro -->
                                <axis:ocultar c="TSINIES" f="axissin003" dejarHueco="false">                                                                                                                            
                                 <td colspan="5" style="width:100%;"  class="campocaja"> 
                                     <textarea class="campodisabled campo campotexto" readonly="true" style="width:100%;" name="TSINIES" id="TSINIES"> ${__formdata.OB_IAX_SINIESTRO.TSINIES}</textarea>
                                 </td>
                                </axis:ocultar>                                 
                              </tr>
                            </table>
                        </td>
                    </tr>

            </table>

            <div class="separador">&nbsp;</div>
            <!-- Sección garantías -->
            
            <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="1000183"/></div>
            <!--campos-->
            <table class="seccion">
            <!--campos-->
             <!--table class="seccion"-->
                <tr>
                    <td align="left">
                      <table class="area" align="center">
                        <tr>
                            <td align="left" class="campocaja">
                                
                                <c:set var="title0"><fmt:message key="100588"/></c:set>
                                <c:set var="title1"><fmt:message key="105957"/></c:set>
                                <c:set var="title2"><fmt:message key="1000247"/></c:set>
                                <div class="displayspace">
                                    <display:table name="${__formdata.OB_IAX_SINIESTRO.GARANTIAS}" id="miListaId" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                    requestURI="axis_axissin003.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_GARANSINI.TGARANT" headerClass="sortable" style="width:70%" media="html" autolink="false" >
                                            <div class="dspText">${miListaId.OB_IAX_GARANSINI.TGARANT}</div>
                                        </display:column>
                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_GARANSINI.FVALORA" headerClass="sortable" style="width:15%" media="html" autolink="false" >
                                            <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.OB_IAX_GARANSINI.FVALORA}"/></div>
                                        </display:column>
                                        <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_GARANSINI.IVALORA" headerClass="sortable" style="width:15%" media="html" autolink="false" >
                                            <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.OB_IAX_GARANSINI.IVALORA}"/></div>
                                        </display:column>                                                                       
                                    </display:table>
                                </div>
                            </td>
                        </tr>
                        </table>
                    </td>
                </tr>
             </table>
            
            <div class="separador">&nbsp;</div>
            <!-- Seccion Pagos realizados -->
            <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="109953" /></div>
            <!--campos-->
             <table class="seccion">
                  <tr>
                    <td align="left">
                      <table class="area" align="center">
                        <tr>
                            <td align="left" class="campocaja">
                                <!-- Sección tabla Pagos -->
                                <!-- displaytag! -->
                                <c:set var="title0"><fmt:message key="101516" /></c:set>
                                <c:set var="title1"><fmt:message key="100587" /></c:set>
                                <c:set var="title2"><fmt:message key="100563" /></c:set>
                                <div class="displayspace">
                                    <display:table name="${__formdata.OB_IAX_SINIESTRO.PAGOS}" id="listaPagos" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                    requestURI="axis_axissin003.do?paginar=true">
                                    <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PAGOSINI.TTIPPAG" headerClass="sortable" media="html" autolink="false" >
                                    <div class="dspText">${listaPagos.OB_IAX_PAGOSINI.TTIPPAG}</div>
                                    </display:column>
                                    <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PAGOSINI.TESTPAG" headerClass="sortable" media="html" autolink="false" >
                                    <div class="dspText">${listaPagos.OB_IAX_PAGOSINI.TESTPAG}</div>
                                    </display:column>
                                    <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_PAGOSINI.IPAGO" headerClass="headwidth10 sortable" media="html" autolink="false" >
                                    <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${listaPagos.OB_IAX_PAGOSINI.IPAGO}"/></div>
                                    </display:column>
                                    </display:table>
                                </div>
                            </td>
                        </tr>
                    </table>
                  </td>
               </tr>
            </table>
            <!-- Fin pagos realizados     -->
             </td>
            </tr>
                
                
            </table>
<div class="separador">&nbsp;</div>
<!-- Botonera -->
<c:import url="../include/botonera_nt.jsp">
    <c:param name="__botones">salir,151477</c:param>
</c:import>
</form>

<c:import url="../include/mensajes.jsp" />
    
</body>
</html>

