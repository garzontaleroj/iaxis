<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>      

<c:set var="nombrePantalla" value="tramitaciones"/>
<c:set var="nombreSeccion" value="destinatarios"/>
<script type="text/javascript">
     function f_aceptar_axissin040(NSINIES) {
                objDom.setValorPorId("NSINIES", NSINIES);
                document.miForm.subpantalla.value="tramitaciones";
                document.miForm.seccion.value="tramitaciones_prestaciones";
                objUtiles.ejecutarFormulario("axis_axissin006.do?", "cargarDatos", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
        
            function f_borrar_prestacion(CTIPDES, SPERSON, NPRESTA) {
            //alert(CTIPDES);
                    objDom.setValorPorId("CTIPDES", CTIPDES);
                    objDom.setValorPorId("SPERSON", SPERSON);
                    objDom.setValorPorId("NPRESTA", NPRESTA);
                    document.miForm.subpantalla.value="tramitaciones";
                    document.miForm.seccion.value="tramitaciones_prestaciones";
                    var answer = confirm(objJsMessages.jslit_confirma_borrar);
                    if (answer)            
                    objUtiles.ejecutarFormulario("axis_axissin006.do?", "del_prestacion", document.miForm, "_self", objJsMessages.jslit_cargando);
            }    
        
            
            function f_consultar_persona(SPERSON,NSINIES){
                    objUtiles.ejecutarFormulario("axis_axissin006.do?SPERSON_CON="+SPERSON+"&NSINIES_CON="+NSINIES, "consulta_persona", document.miForm, "_self", objJsMessages.jslit_cargando);
            }    
    
    
</script>
                                        <c:if test="${ empty __formdata.indexDestinatario }">
                                            <c:set var="numDest">0</c:set>
                                        </c:if>
                                        <c:if test="${ !empty __formdata.indexDestinatario }">
                                            <c:set var="numDest">${__formdata.indexDestinatario}</c:set>
                                        </c:if>
<form name="${nombrePantalla}" action="" method="POST">                  
    <c:if test="${!empty __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.DESTINATARIOS[numDest].OB_IAX_SIN_TRAMI_DESTINATARIO.T_PRESTAREN[0].OB_IAX_SIN_PRESTAREN.NSINIES}">
        <table>                                         
        <tr>
            <td colspan="4" align="left" class="campocaja"> 
                <div style="float:left;" >
                    <b><axis:alt c="form" f="axissin006" lit="152640" /></b>
                </div>
                <div  style="margin-left:10px;float:right"></div>
                    <table class="seccion" cellpadding="0" cellspacing="0" align="right" style="width:99%">
                        <tbody id="prestaciones" align="right">
                        <tr>
                            <td colspan="10">
                                <c:set var="title0"><axis:alt f="axissin006" c="TFORPAG" lit="100712" /></c:set> <!-- forma pago -->
                                <c:set var="title1"><axis:alt f="axissin006" c="IBRUREN" lit="9001858" /></c:set><!-- Importe renta -->
                                <axis:visible f="axissin006" c="CMONEDA">
                                <c:set var="title10"><axis:alt f="axissin006" c="CMONEDA" lit="108645" /></c:set><!-- Moneda -->
                                </axis:visible>
                                <c:set var="title2"><axis:alt f="axissin006" c="TESTADO" lit="101510" /></c:set> <!-- Estado -->
                                <c:set var="title3"><axis:alt f="axissin006" c="TTIPDUR" lit="1000376" /></c:set><!-- Tipo durecion -->
                                <c:set var="title4"><axis:alt f="axissin006" c="F1PAREN" lit="9901167" /></c:set><!-- Fecha prime per -->
                                <c:set var="title5"><axis:alt f="axissin006" c="FUPAREN" lit="9901540" /></c:set><!-- Fecha ultim per -->
                                <c:set var="title6"><axis:alt f="axissin006" c="FFINREN" lit="9001904" /></c:set><!-- Fecha fin -->
                                <c:set var="title7"><axis:alt f="axissin006" c="TBLOPAG" lit="9001326" /></c:set><!-- Estado pagos -->
                                <c:set var="title8"><axis:alt f="axissin006" c="EDITA" lit="9901356" /></c:set><!-- Editar -->
                                <c:set var="title9"><axis:alt f="axissin006" c="BORRA" lit="1000127" /></c:set><!-- Eliminar -->
                                <div class="displayspace">
                                    <display:table name="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.DESTINATARIOS[numDest].OB_IAX_SIN_TRAMI_DESTINATARIO.T_PRESTAREN}" id="T_IAX_PRESTAREN" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0" requestURI="">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="${title0}" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                            <div class="dspNumber">${T_IAX_PRESTAREN.OB_IAX_SIN_PRESTAREN.TFORPAG}</div>
                                        </display:column>
                                        <display:column title="${title1}" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                            <div class="dspNumber"><fmt:formatNumber pattern='###,#00.00' value='${T_IAX_PRESTAREN.OB_IAX_SIN_PRESTAREN.IBRUREN}' /></div>
                                        </display:column>
                                        <axis:visible f="axissin006" c="CMONEDA">
                                        <display:column title="${title10}" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                            <div class="dspNumber">USD</div>
                                        </display:column>
                                        </axis:visible>
                                        <display:column title="${title2}" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                            <div class="dspNumber">${T_IAX_PRESTAREN.OB_IAX_SIN_PRESTAREN.TESTADO}</div>
                                        </display:column>
                                        <display:column title="${title3}" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                            <div class="dspNumber">${T_IAX_PRESTAREN.OB_IAX_SIN_PRESTAREN.TTIPDUR}</div>
                                        </display:column>
                                        <display:column title="${title4}" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                            <div class="dspNumber"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_PRESTAREN.OB_IAX_SIN_PRESTAREN.F1PAREN}"/></div>
                                        </display:column>
                                        <display:column title="${title5}" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                            <div class="dspNumber"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_PRESTAREN.OB_IAX_SIN_PRESTAREN.FUPAREN}"/></div>
                                        </display:column>
                                        <display:column title="${title6}" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                            <div class="dspNumber"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_PRESTAREN.OB_IAX_SIN_PRESTAREN.FFINREN}"/></div>
                                        </display:column>
                                        <display:column title="${title7}" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                            <div class="dspNumber">${T_IAX_PRESTAREN.OB_IAX_SIN_PRESTAREN.TBLOPAG}</div>
                                        </display:column>
                                        <display:column title="${title8}" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                            <div class="dspNumber">
                                                <img border="0" alt='<axis:alt c="form" f="axissin006" lit="9000896" />' title='<axis:alt c="form" f="axissin006" lit="9000896" />' src="images/lapiz.gif" onClick="javascript:f_abrir_modal('axissin040',null,'&isNew=no&SPRODUC='+document.miForm.SPRODUC.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+document.miForm.NTRAMIT.value+'&CTRAMIT='+document.miForm.CTRAMIT.value+'&CCAUSIN='+document.miForm.CCAUSIN.value+'&CMOTSIN='+document.miForm.CMOTSIN.value+'&CTIPDES='+'${T_IAX_PRESTAREN.OB_IAX_SIN_PRESTAREN.CTIPDES}'+'&SPERSON='+'${T_IAX_PRESTAREN.OB_IAX_SIN_PRESTAREN.SPERSON}'+'&NPRESTA='+'${T_IAX_PRESTAREN.OB_IAX_SIN_PRESTAREN.NPRESTA}');" style="cursor:pointer"/>
                                            </div>
                                        </display:column>
                                        <display:column title="${title9}" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                            <div class="dspNumber">
                                            <img id="find" border="0" src="images/delete.gif" onclick="javascript:f_borrar_prestacion('${T_IAX_PRESTAREN.OB_IAX_SIN_PRESTAREN.CTIPDES}','${T_IAX_PRESTAREN.OB_IAX_SIN_PRESTAREN.SPERSON}','${T_IAX_PRESTAREN.OB_IAX_SIN_PRESTAREN.NPRESTA}');" style="cursor:pointer"/>
                                            </div>
                                        </display:column>
                                    </display:table>
                                </div>
                            </td>
                        </tr>
                    </tbody>                                            
                </table>
            </td>
        </tr>
        </table>
    </c:if>
</form>