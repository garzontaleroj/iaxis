<%/**
*  Fichero: axisctr184.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a>
*  
*  Pantalla de CONSULTA DE CUADROS DE COMISION
*
*  Fecha: 09/07/2010
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
        
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        
       
        
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">
        
            function f_but_salir() {
            
                parent.f_cerrar_axisctr184();
            }
            
            function f_onload(){
                objEstilos.toggleDisplay("DSP_CUADRO", document.getElementById("DSP_CUADRO_parent"));
                objEstilos.toggleDisplay("DSP_CUOTAS", document.getElementById("DSP_CUOTAS_parent"));
                objEstilos.toggleDisplay("DSP_PAGOS", document.getElementById("DSP_PAGOS_parent"));
            
                f_cargar_propiedades_pantalla();
            }
            
            
           
        </script>
        
    </head>
    
    <body onload="f_onload()">
    <form name="miForm" action="" method="POST">
        
        <input type="hidden" id="operation" name="operation" value="" />
        <input type="hidden" id="NRIESGO" name="NRIESGO" value="${__formdata.NRIESGO}"/>
        <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}" />
        <input type="hidden" id="CTAPRES" name="CTAPRES" value="${__formdata.CTAPRES}" />
        
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisctr184" c="formulario" lit="9903133" /></c:param>
                <c:param name="producto"><axis:alt f="axisctr184" c="producto" lit="9904169" /></c:param>
                <c:param name="form">axisctr184</c:param>
        </c:import>

    <table class="mainModalDimensions base"  align="center" cellpadding="0" cellspacing="0"> 
       <tr>
            <td>
  
                    <table class="seccion">
                        <tr>
                            <td align="left" >
                                <div class="titulo" style="float:left">
                                        <img src="images/flecha.gif"/>
                                        <b><axis:alt f="${pantalla}" c="CORRETAJE_TIT" lit="9903132"/></b>
                                </div>
                                <div class="separador">&nbsp;</div>
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:15%;height:0%;"/>
                                        <th style="width:15%;height:0%;"/>
                                        <th style="width:15%;height:0%;"/>
                                        <th style="width:15%;height:0%;"/>
                                        <th style="width:15%;height:0%;"/>
                                        <th style="width:15%;height:0%;"/>
                                        <th style="width:10%;height:0%;"/>
                                    </tr>
                                    <tr>
                                    
                                        <td class="campocaja" colspan="7">
                                            <div style="float:left;">
                                            <img id="DSP_CUADRO_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_CUADRO', this)" style="cursor:pointer"/>
                                                <b><axis:alt f="${pantalla}" c="RECIBOS_TIT" lit="100885"/></b>&nbsp;&nbsp; ${__formdata.fvencim} &nbsp;&nbsp;<b><axis:alt f="${pantalla}" c="RECIBOS_TIT2" lit="9903121"/></b>&nbsp;&nbsp; <fmt:formatNumber value="${__formdata.icapini}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/>
                                            </div>
                                            <div style="float:right;" id="CUADRO"></div>
                                            <div class="seccion_suplementos" id="SECCION_CUADRO"></div>
                                            <div style="clear:both;">
                                            <hr class="titulo">
                                            </div>
                                        </td>
                                    </tr>   
                                    <tr id="DSP_CUADRO_children" style="display:none">
                                        <td colspan="7">
                                            <!-- DisplayTag ListaPersonas -->
                                            <c:set var="title1"><axis:alt f="axisctr184" c="FALTA" lit="9901248"/></c:set>
                                            <c:set var="title2"><axis:alt f="axisctr184" c="FVENCIM" lit="100883"/></c:set>
                                            <c:set var="title3"><axis:alt f="axisctr184" c="ICAPITAL" lit="100885"/></c:set>
                                            <c:set var="title4"><axis:alt f="axisctr184" c="IINTERES" lit="1000073"/></c:set>
                                            <c:set var="title5"><axis:alt f="axisctr184" c="ICAPPEND" lit="9900882"/></c:set>
                                            <c:set var="title6"><axis:alt f="axisctr184" c="CUOTA" lit="9901245"/></c:set>
                                            <c:set var="title7"><axis:alt f="axisctr184" c="TOTAL" lit="101093"/></c:set>
                                            <c:set var="title8"><axis:alt f="axisctr184" c="IMORA" lit="9903123"/></c:set>
                                            <div class="seccion displayspacePersonas">
                                                <display:table name="${__formdata.lstcuadros}" id="miListaId" export="false" class="dsptgtable" pagesize="15"  requestURI="modal_axisctr184.do?paginar=true"  sort="list" cellpadding="0" cellspacing="0">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                    <%--display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                                        <div class="dspIcons"><input <c:if test="${miListaId['listaProcesos']}">checked</c:if> type="radio" id="seleccionacomi" name="seleccionacomi" value="${miListaId['comi']}"/></div>
                                                    </display:column--%>
                                                    <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_PRESTCUADRO.FALTA" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspNumber">${miListaId.OB_IAX_PRESTCUADRO.NCUOTA}</div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_PRESTCUADRO.FALTA" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.OB_IAX_PRESTCUADRO.FALTA}"/></div>
                                                    </display:column>
                                                    <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_PRESTCUADRO.FVENCIM" headerClass="sortable"  media="html" autolink="false" >
                                                       <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.OB_IAX_PRESTCUADRO.FVENCIM}"/></div>
                                                    </display:column>
                                                    <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_PRESTCUADRO.ICAPITAL" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.OB_IAX_PRESTCUADRO.ICAPITAL}" /></div>
                                                    </display:column>
                                                    <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_PRESTCUADRO.IINTERES" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.OB_IAX_PRESTCUADRO.IINTERES}" /></div>
                                                    </display:column>
                                                     <display:column title="${title8}" sortable="true" sortProperty="OB_IAX_PRESTCUADRO.IDEMORA" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.OB_IAX_PRESTCUADRO.IDEMORA}" /></div>
                                                    </display:column>
                                                    <display:column title="${title7}" sortable="true" sortProperty="OB_IAX_PRESTCUADRO.ITOTAL_1" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.OB_IAX_PRESTCUADRO.TOTAL_1}" /></div>
                                                    </display:column>
                                                    <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PRESTCUADRO.ICAPPEND" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.OB_IAX_PRESTCUADRO.ICAPPEND}" /></div> 
                                                    </display:column>
                                                    
                                                </display:table>
                                            </div>	
                                        </td>
                                    </tr>    
                                    <tr>
                                        <td>
                                            <div class="separador">&nbsp;</div>
                                            <div class="separador">&nbsp;</div>
                                        </td>
                                    </tr>
                                    <tr>
                                    
                                        <td class="campocaja" colspan="7">
                                            <div style="float:left;">
                                            <img id="DSP_CUOTAS_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_CUOTAS', this)" style="cursor:pointer"/>
                                            <b><axis:alt f="${pantalla}" c="CUOTAS_TIT" lit="9903128"/></b>&nbsp;&nbsp;<b><axis:alt f="${pantalla}" c="CUOTAS_TIT2" lit="9903129"/></b>&nbsp;&nbsp;<fmt:formatNumber value="${__formdata.ticapitalcuota}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/>&nbsp;&nbsp;<b><axis:alt f="${pantalla}" c="CUOTAS_TIT3" lit="9903130"/></b>&nbsp;&nbsp;<fmt:formatNumber value="${__formdata.tiinterescuota}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/>&nbsp;&nbsp;<b><axis:alt f="${pantalla}" c="CUOTAS_TIT4" lit="9903131"/></b>&nbsp;&nbsp;<fmt:formatNumber value="${__formdata.tidemoracuota}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/>
                                            </div>
                                            <div style="float:right;" id="CUADRO"></div>
                                            <div class="seccion_suplementos" id="SECCION_CUOTAS"></div>
                                            <div style="clear:both;">
                                            <hr class="titulo">
                                            </div>
                                        </td>
                                    </tr>   
                                    <tr id="DSP_CUOTAS_children" style="display:none">
                                        <td colspan="7">
                                            
                                            <!-- DisplayTag ListaPersonas -->
                                            <c:set var="title1"><axis:alt f="axisctr184" c="ICUOTA" lit="9901245"/></c:set>
                                            <c:set var="title2"><axis:alt f="axisctr184" c="FPAGO" lit="101573"/></c:set>
                                            <c:set var="title3"><axis:alt f="axisctr184" c="ICAPITAL" lit="1000073"/></c:set>
                                            <c:set var="title4"><axis:alt f="axisctr184" c="IINTERES" lit="9900882"/></c:set>
                                            <c:set var="title5"><axis:alt f="axisctr184" c="IDEMORA" lit="9903123"/></c:set>
                                            <c:set var="title6"><axis:alt f="axisctr184" c="ICAPPEND" lit="9901248"/></c:set>
                                            <c:set var="title7"><axis:alt f="axisctr184" c="FVENCIM" lit="100885"/></c:set>
                                            <c:set var="title8"><axis:alt f="axisctr184" c="TOTAL" lit="101093"/></c:set>
                                            <c:set var="title9"><axis:alt f="axisctr184" c="NRECIBO" lit="800636"/></c:set>
                                            
                                            <div class="seccion displayspacePersonas">
                                                <display:table name="${__formdata.lstcuotas}" id="miListaId" export="false" class="dsptgtable" pagesize="15"  requestURI="modal_axisctr184.do?operation=form&paginar=true" excludedParams="*" sort="list" cellpadding="0" cellspacing="0">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                    <%--display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                                        <div class="dspIcons"><input <c:if test="${miListaId['listaProcesos']}">checked</c:if> type="radio" id="seleccionacomi" name="seleccionacomi" value="${miListaId['comi']}"/></div>
                                                    </display:column--%>
                                                    <display:column title="${title9}" sortable="true" sortProperty="OB_IAX_PRESTAMOCUOTAS.NRECIBO" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspNumber">${miListaId.OB_IAX_PRESTAMOCUOTAS.IDPAGO}</div>
                                                    </display:column>
                                                    <%--display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PRESTAMOCUOTAS.ICUOTA" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.OB_IAX_PRESTAMOCUOTAS.ICUOTA}" /></div>
                                                    </display:column--%>
                                                    
                                                    <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_PRESTAMOCUOTAS.FPAGO" headerClass="sortable"  media="html" autolink="false" >
                                                       <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.OB_IAX_PRESTAMOCUOTAS.FPAGO}"/></div>
                                                    </display:column>
                                                    <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_PRESTAMOCUOTAS.ICAPITAL" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.OB_IAX_PRESTAMOCUOTAS.ICAPITAL}" /></div>
                                                    </display:column>
                                                    <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_PRESTAMOCUOTAS.IINTERES" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.OB_IAX_PRESTAMOCUOTAS.IINTERES}" /></div> 
                                                    </display:column>
                                                    <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_PRESTAMOCUOTAS.IDEMORA" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.OB_IAX_PRESTAMOCUOTAS.IDEMORA}" /></div> 
                                                    </display:column>
                                                    <display:column title="${title8}" sortable="true" sortProperty="OB_IAX_PRESTAMOCUOTAS.ITOTAL_2" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.OB_IAX_PRESTAMOCUOTAS.TOTAL_2}" /></div> 
                                                    </display:column>
                                                    <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_PRESTAMOCUOTAS.ICAPPEND" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.OB_IAX_PRESTAMOCUOTAS.ICAPPEND}" /></div> 
                                                    </display:column>
                                                    
                                                    <display:column title="${title7}" sortable="true" sortProperty="OB_IAX_PRESTAMOCUOTAS.FVENCIM" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.OB_IAX_PRESTAMOCUOTAS.FVENCIM}"/></div>
                                                    </display:column>
                                                    
                                                </display:table>
                                            </div>	
                                        </td>
                                    </tr> 
                                    
                                    <!--  ************************************************************************************************************************************************************** -->
                                    
                                    <tr>
                                        <td>
                                            <div class="separador">&nbsp;</div>
                                            <div class="separador">&nbsp;</div>
                                        </td>
                                    </tr>
                                    <tr>
                                    
                                        <td class="campocaja" colspan="3">
                                            <div style="float:left;">
                                            <img id="DSP_PAGOS_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_PAGOS', this)" style="cursor:pointer"/>
                                            <b><axis:alt f="${pantalla}" c="PAGOS_TIT" lit="9904357"/></b>
                                            </div>
                                            <div style="float:right;" id="PAGO"></div>
                                            <div class="seccion_suplementos" id="SECCION_PAGOS"></div>
                                            <div style="clear:both;">
                                            <hr class="titulo">
                                            </div>
                                        </td>
                                    </tr>   
                                    <tr id="DSP_PAGOS_children" style="display:none">
                                        <td colspan="3">
                                            
                                            <!-- DisplayTag ListaPersonas -->
                                            <c:set var="title1"><axis:alt f="axisctr184" c="NPAGO" lit="103463"/></c:set>
                                            <c:set var="title2"><axis:alt f="axisctr184" c="FEFECTO" lit="100883"/></c:set>
                                            <c:set var="title3"><axis:alt f="axisctr184" c="ICAPITAL" lit="1000073"/></c:set>
                                                                                        
                                            <div class="seccion displayspacePersonas">
                                                <display:table name="${__formdata.lstprestpagos}" id="miListaId" export="false" class="dsptgtable" pagesize="15"  requestURI="modal_axisctr184.do?operation=form&paginar=true" excludedParams="*" sort="list" cellpadding="0" cellspacing="0">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                    <%--display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                                        <div class="dspIcons"><input <c:if test="${miListaId['listaProcesos']}">checked</c:if> type="radio" id="seleccionacomi" name="seleccionacomi" value="${miListaId['comi']}"/></div>
                                                    </display:column--%>
                                                    <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PRESTAMOCUOTAS.ICUOTA" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspNumber">${miListaId.OB_IAX_PRESTAMOPAGO.NPAGO}</div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_PRESTAMOCUOTAS.FPAGO" headerClass="sortable"  media="html" autolink="false" >
                                                       <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.OB_IAX_PRESTAMOPAGO.FEFECTO}"/></div>
                                                    </display:column>
                                                    <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_PRESTAMOCUOTAS.ICUOTA" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.OB_IAX_PRESTAMOPAGO.ICAPITAL}" /></div>
                                                    </display:column>
                                                    
                                                    
                                                    
                                                </display:table>
                                            </div>	
                                        </td>
                                    </tr> 
                                    
                                    <!-- ************************************************************************************************************************************************************** -->
                                    
                                </table>
                            </td>
                        </tr>
                    </table>
            </td>
        </tr>    
    </table>
            
        
<div class="separador">&nbsp;</div>
<!-- Botonera -->
<c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr184</c:param><c:param name="f">axisctr184</c:param>
    <c:param name="__botones">salir</c:param>
</c:import>

</form>

<c:import url="../include/mensajes.jsp" />
    
</body>
</html>

