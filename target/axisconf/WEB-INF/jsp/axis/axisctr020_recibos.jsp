<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<c:choose>
    <c:when test="${empty param.f}">
        <c:set var="pantalla" value="axisctr020"/>
    </c:when>
    <c:otherwise>
        <c:set var="pantalla" value="${param.f}"/>
    </c:otherwise>
</c:choose>

    <!--tercera parte a partir de recibos -->
    <c:if test="${! empty recibos}">
    <axis:visible f="${pantalla}" c="DSP_RECIBOS" >
        <tr>
            <td class="campocaja" >
                <img id="DSP_RECIBOS_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_RECIBOS', this)" style="cursor:pointer"/>
                    <b><axis:alt f="${pantalla}" c="RECIBOS_TIT" lit="1000343"/></b>&nbsp;&nbsp; ${recibos[0].OB_IAX_DETRECIBO.NRECIBO} <c:if test="${recibos[0].OB_IAX_DETRECIBO.FEFECTO!=null}">&nbsp;-&nbsp;<axis:alt f="${pantalla}" c="FECHA_TIT" lit="100883"/>&nbsp;<fmt:formatDate value="${recibos[0].OB_IAX_DETRECIBO.FEFECTO}" pattern="dd/MM/yyyy"/></c:if><c:if test="${recibos[0].OB_IAX_DETRECIBO.FEFECTO!=null}">&nbsp;-&nbsp;<axis:alt f="${pantalla}" c="FECHA1_TIT" lit="100885"/>&nbsp;<fmt:formatDate value="${recibos[0].OB_IAX_DETRECIBO.FVENCIM}" pattern="dd/MM/yyyy"/></c:if> <c:if test="${recibos[0].OB_IAX_DETRECIBO.IMPORTE!=null}" > &nbsp;-&nbsp;<axis:alt f="${pantalla}" c="IMPORTE" lit="100563"/>&nbsp;<fmt:formatNumber value="${recibos[0].OB_IAX_DETRECIBO.IMPORTE}" pattern="${__formatNumberPatterns[CMONEDAPROD]}"/> </c:if>
                   <%-- ${recibos[0].OB_IAX_DETRECIBO.IMPORTE}</c:if> --%>
                    <hr class="titulo">
            </td>
        </tr>
        <tr id="DSP_RECIBOS_children" style="display:none">
            <td class="campocaja" >
                  <c:set var="title0"><axis:alt f="${pantalla}" c="NRECIBO" lit="800636"/></c:set>
                  <c:set var="title1"><axis:alt f="${pantalla}" c="FEFECTO_REB" lit="100883"/></c:set>
                  <c:set var="title2"><axis:alt f="${pantalla}" c="FVENCIM_REB" lit="100885"/></c:set>
                  <c:set var="title3"><axis:alt f="${pantalla}" c="IMPORTE" lit="100563"/></c:set>
                  <c:set var="title4"><axis:alt f="${pantalla}" c="TTIPREC" lit="102302"/></c:set>
                  <c:set var="title5"><axis:alt f="${pantalla}" c="TESTREC" lit="100587"/></c:set>
                  <c:set var="title6"><axis:alt f="${pantalla}" c="LIT_COBRAR" lit="1000086"/></c:set>
                  <c:set var="title7"><axis:alt f="${pantalla}" c="BT_DETREC" lit="1000113"/></c:set>
                  <c:set var="title8"><axis:alt f="${pantalla}" c="LIT_RECIBOS" lit="100581"/></c:set>
                  <c:set var="title9"><axis:alt f="${pantalla}" c="LIT_GEST_COBRO" lit="1000568"/></c:set>
                  <c:set var="title10"><axis:alt f="${pantalla}" c="BT_ACCION" lit="101109"/></c:set>
                  <c:set var="title55"><axis:alt f="${pantalla}" c="IMPPENDIENTE" lit="9002152"/></c:set>
                  <c:set var="title11"><axis:alt f="${pantalla}" c="CRECCIA" lit="9001763"/></c:set>
                  <c:set var="title12"><axis:alt f="${pantalla}" c="TDESTIPREC" lit="9904013"/></c:set>
                  <c:set var="title13"><axis:alt f="${pantalla}" c="MONEDAORIGEN" lit="9901972"/></c:set> 
                  <c:set var="title14"><axis:alt f="${pantalla}" c="TSUBTIPREC" lit="9907142"/></c:set> 
                  <c:if test="${ADMITECERTIFICADOS == '1'}">
                      <c:set var="title11"><axis:alt f="${pantalla}" c="ADMITE_CERT_TIT" lit="9001134"/></c:set>
                  </c:if>
                  <div class="displayspace">
                    <display:table name="${recibos}" id="recibos" export="false" class="dsptgtable" pagesize="-1" defaultsort="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                     requestURI="axis_${pantalla}.do?paginar=true&subpantalla=DSP_RECIBOS">
                        <%@ include file="../include/displaytag.jsp"%>
                        
                        <display:column title="" sortable="true" sortProperty="OB_IAX_DETRECIBO.NRECIBO" headerClass="headwidth110 sortable"  media="html" autolink="false" >
                           <div class="dspIcons">
                          <input type="radio" id="checked_NREC" name="checked_NREC" <c:if test="${recibos.OB_IAX_DETRECIBO.NRECIBO == __formdata.NRECIBO_sel}">checked</c:if>
                                onclick = "f_ajax_obtener_impagados('${recibos.OB_IAX_DETRECIBO.NRECIBO}')"
                                value=""/>
                           </div>
                        </display:column>
                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_DETRECIBO.NRECIBO" headerClass="headwidth110 sortable"  media="html" autolink="false" >
                           <div class="dspText">${recibos.OB_IAX_DETRECIBO.NRECIBO}</div>
                        </display:column>
                        <axis:visible f="${pantalla}" c="CRECCIA">
                            <display:column title="${title11}" sortable="true" sortProperty="OB_IAX_DETRECIBO.CRECCIA" headerClass="headwidth110 sortable"  media="html" autolink="false" >
                               <div class="dspText">${recibos.OB_IAX_DETRECIBO.CRECCIA}</div>
                            </display:column>
                        </axis:visible>
                         <axis:visible f="${pantalla}" c="FEFECTO_REB">
                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_DETRECIBO.FEFECTO" headerClass="headwidth15 sortable"  media="html" autolink="false" >
                            <div class="dspDate"><fmt:formatDate value="${recibos.OB_IAX_DETRECIBO.FEFECTO}" pattern="dd/MM/yyyy"/></div>
                        </display:column>
                        </axis:visible>
                         <axis:visible f="${pantalla}" c="FVENCIM_REB">
                        <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_DETRECIBO.FVENCIM" headerClass="headwidth15 sortable"  media="html" autolink="false" >
                            <div class="dspDate"><fmt:formatDate value="${recibos.OB_IAX_DETRECIBO.FVENCIM}" pattern="dd/MM/yyyy"/></div>
                        </display:column>
                        </axis:visible>
                        <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_DETRECIBO.IMPORTE" headerClass="headwidth15 sortable"  media="html" autolink="false" >
                           <div class="dspNumber"><fmt:formatNumber value="${recibos.OB_IAX_DETRECIBO.IMPORTE}" pattern="${__formatNumberPatterns[CMONEDAPROD]}"/></div>
                        </display:column>
                        <display:column title="${title4}" sortable="true" sortProperty="TTIPREC" headerClass="headwidth20 sortable"  media="html" autolink="false" >
                            <div class="dspText">${recibos.OB_IAX_DETRECIBO.TTIPREC}</div>
                        </display:column>
                        <axis:visible c="TSUBTIPREC" f="${pantalla}">
                        <display:column title="${title14}" sortable="true" sortProperty="TSUBTIPREC" headerClass="headwidth20 sortable"  media="html" autolink="false" >
                            <div class="dspText">${recibos.OB_IAX_DETRECIBO.TSUBTIPREC}</div>
                        </display:column>
                        </axis:visible>
                        <display:column title="${title5}" sortable="true" sortProperty="TESTREC" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                            <div class="dspText">${recibos.OB_IAX_DETRECIBO.TESTREC}</div>
                        </display:column>
                        <axis:visible c="IMPPENDIENTE" f="${pantalla}">
                        <display:column title="${title55}" sortable="true" sortProperty="IMPPENDIENTE" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                             <div class="dspNumber"><fmt:formatNumber value="${recibos.OB_IAX_DETRECIBO.IMPPENDIENTE}" pattern="${__formatNumberPatterns[CMONEDAPROD]}"/></div>
                        </display:column>
                        </axis:visible>
                        <axis:visible c="TDESCPAG" f="${pantalla}">
                        <c:if test="${ADMITECERTIFICADOS == '1'}">
                            <display:column title="${title11}" headerClass="sortable" sortable="true" sortProperty="OB_IAX_DETRECIBO.ESCCERO" media="html" autolink="false">
                                <c:set var="literalEsCcero">
                                        ${recibos.OB_IAX_DETRECIBO.TDESCPAG}
                                </c:set>
                                <%-- Si ESCCERO == 1 -> Tomador del colectivo; si ESCERO == 0 -> Titular certificado --%>
                                <div class="dspText"><axis:alt f="${pantalla}" c="ESCCERO_REB" lit="${literalEsCcero}"/></div>
                            </display:column>
                        </c:if>
                        </axis:visible>
                        <axis:visible c="TDESTIPREC" f="${pantalla}">
                            <display:column title="${title12}" sortable="true" sortProperty="TDESTIPREC" headerClass="headwidth20 sortable"  media="html" autolink="false" >
                                <div class="dspText">${recibos.OB_IAX_DETRECIBO.TDESTIPREC}</div>
                            </display:column>
                        </axis:visible>
                        <axis:visible c="MONORIG" f="${pantalla}">
                            <display:column title="${title13}" sortable="true" sortProperty="MONEDAORIGEN" headerClass="headwidth20 sortable"  media="html" autolink="false" >
                                <div class="dspText">${recibos.OB_IAX_DETRECIBO.IMPORTE_MON}</div>
                            </display:column>
                        </axis:visible>
                    
                        <axis:visible f="${pantalla}" c="BT_DETREC">
                         <display:column title="${title7}" headerClass="headwidth5 sortable" media="html" autolink="false"  >
                             <div class="dspIcons"><img border="0" alt="${title7}&nbsp;${title8}" title1="${title7}&nbsp;${title8}" src="images/mas.gif" width="11px" height="11px"
                             style="cursor:pointer;" onclick="f_detrecibos(${recibos.OB_IAX_DETRECIBO.NRECIBO})"/></div>
                         </display:column>
                        </axis:visible>
                        <axis:visible f="${pantalla}" c="BT_ACCION">
                            <display:column title="${title10}" headerClass="headwidth5 sortable" media="html" autolink="false"  >
                                <c:if test="${!empty recibos.OB_IAX_DETRECIBO.PSALTAR && recibos.OB_IAX_DETRECIBO.PSALTAR != '0'}">
                                    <axis:visible f="${pantalla}" c="DETALLE_RECIBOS1">
                                    <div class="dspIcons" c="DETALLE_RECIBOS1"><img border="0" alt="${title9}" title="${title9}" src="images/find.gif" width="11px" height="11px" 
                                    style="cursor:pointer;" onclick="f_gestionar_recibos('${recibos.OB_IAX_DETRECIBO.NRECIBO}', '${recibos.OB_IAX_DETRECIBO.TESTREC}')"/></div>
                                    </axis:visible>
                                </c:if>
                            </display:column>
                        </axis:visible>
                   </display:table>
                </div>

                <!-- ******************** *****************  ******************   -->
                <!-- ******************** SECCION IMPAGADOS  ******************   -->
                <!-- ******************** *****************  ******************   -->
                <%-- c:if test="${!empty OB_IAX_IMPAGOS}" --%>
                <div id="seccion_impagados" name="seccion_impagados">
                            <table>
                            <tr>
                                 <td>
                                        <div class="separador">&nbsp;</div>
                                        <div class="titulocaja">
                                        <b>&nbsp;<axis:alt f="${pantalla}" c="IMPAGOS_LIT" lit="110804"/></b>
                                        </div>
                                        <table class="area" align="center">
                                        <tr>
                                            <th style="width:100%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja">
                                                <%-- DisplayTag Movimientos recibo --%>
                                                <c:set var="title0"><axis:alt f="${pantalla}" c="CTRACTAT" lit="100587"/></c:set> <%-- Estado --%>
                                                <c:set var="title1"><axis:alt f="${pantalla}" c="FFEJECU" lit="9001207"/></c:set> <%-- Data execució --%>
                                                <c:set var="title2"><axis:alt f="${pantalla}" c="CACTIMP" lit="9000844"/></c:set> <%-- Accio --%>
                                                <c:set var="title3"><axis:alt f="${pantalla}" c="CCARTA" lit="9001210"/></c:set>  <%-- Carta --%>
                                                <c:set var="title4"><axis:alt f="${pantalla}" c="FIMPRES" lit="9001211"/></c:set>  <%-- Data impressio --%>
                                                <div class="seccion displayspace">
                                                    <display:table name="${OB_IAX_IMPAGOS}" id="IMPAGOS" export="false" class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                         requestURI="axis_${pantalla}.do?paginar=true&subseccion=movimientos_recibo">
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                        <display:column title="${title0}" sortable="true" sortProperty="IMPAGOS.CTRACTAT" headerClass="sortable"  media="html" autolink="false">
                                                            <div class="dspText">${IMPAGOS.CTRACTAT}</div>
                                                        </display:column>
                                                        <display:column title="${title1}" sortable="true" sortProperty="IMPAGOS.FFEJECU" headerClass="sortable"  media="html" autolink="false">
                                                            <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${IMPAGOS.FFEJECU}"/></div>
                                                        </display:column>
                                                        <display:column title="${title2}" sortable="true" sortProperty="IMPAGOS.CACTIMP" headerClass="sortable"  media="html" autolink="false">
                                                            <div class="dspText">${IMPAGOS.CACTIMP}</div>
                                                        </display:column>
                                                        <display:column title="${title3}" sortable="true" sortProperty="IMPAGOS.CCARTA" headerClass="sortable"  media="html" autolink="false">
                                                            <div class="dspText">${IMPAGOS.CCARTA}</div>
                                                        </display:column>
                                                        <display:column title="${title4}" sortable="true" sortProperty="IMPAGOS.FIMPRES" headerClass="sortable"  media="html" autolink="false">
                                                            <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${IMPAGOS.FIMPRES}"/></div>
                                                        </display:column>

                                                    </display:table>
                                                </div>
                                            </td>
                                        </tr>
                                        </table>
                                   </td>
                            </tr>
                            </table>
                            <%-- /c:if --%>
                </div>
                <!-- ******************** SECCION IMPAGADOS  ******************   -->
            </td>
        </tr>
    </axis:visible>
    </c:if>
