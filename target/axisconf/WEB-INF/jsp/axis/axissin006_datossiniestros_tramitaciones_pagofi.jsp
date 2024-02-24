<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="nombrePantalla" value="tramitaciones"/>
<c:set var="nombreSeccion" value="pagofi"/>

<form name="${nombrePantalla}${nombreSeccion}" action="axis_axissin006.do" method="POST">
        <input type="hidden" id="operation" name="operation" value="" />


<axis:visible f="axissin006" c="DSP_PAGOS_OFI">
                <div ID="DSP_PAGOS_OFI">
                        <c:set var="title0"><axis:alt f="axissin006" c="SIDEPAG" lit="800440" /></c:set><!--Numero -->
                        <c:set var="title1"><axis:alt f="axissin006" c="TTIPPAG" lit="100565" /></c:set><!--Tipo-->
                        <c:set var="title2"><axis:alt f="axissin006" c="TCONPAG" lit="9000715" /></c:set><!--Concepto-->
                        <c:set var="title3"><axis:alt f="axissin006" c="TNOMBRED" lit="9000909" /></c:set><!--Destinatario -->
                        <c:set var="title4"><axis:alt f="axissin006" c="TFORPAG" lit="100712" /></c:set><!-- Forma Pago -->
                        <c:set var="title5"><axis:alt f="axissin006" c="FORDPAG" lit="9000910" /></c:set><!-- Fecha orden -->
                        <c:set var="title6"><axis:alt f="axissin006" c="NFACREF" lit="9000445" /></c:set><!-- num. factura -->
                        <c:set var="title7"><axis:alt f="axissin006" c="FFACREF" lit="9000451" /></c:set><!-- fecha factura -->
                        <c:set var="title8"><axis:alt f="axissin006" c="ISINRET" lit="9000938" /></c:set><!--Importe Bruto-->
                        <c:set var="title9"><axis:alt f="axissin006" c="DSP_MAS_INFFO" lit="1000113" /></c:set><!--  más informacion-->
                        <c:set var="title10"><axis:alt f="axissin006" c="BT_SIN_EDITAR_CAB_PAGO" lit="100002" /></c:set><!--  Editar-->                      
                        <c:set var="num_tramitacion">0</c:set>
                        <div class="displayspace">
                       <%int i = 0;%>
                           <display:table name="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.PAGOS_OFI}" id="T_IAX_TRAM_PAGOS" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                           requestURI="">
                           <c:set var="i"><%=i%></c:set>
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                               <div class="dspIcons"><input  onClick="javascript:f_getPago_ofi('${i}','${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.SIDEPAG}')" 
                               <c:if test="${__formdata.SIDEPAG_OFI == T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.SIDEPAG }"> checked </c:if>
                               value="" type="radio" id="radioNTRAM" name="radioNTRAM"/></div>
                            </display:column>
                            <display:column title="${title0}" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspNumber">${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.SIDEPAG}</div>
                            </display:column>
                            <display:column title="${title1}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText">${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.TTIPPAG}</div>    
                            </display:column>
                            <display:column title="${title2}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText">${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.TCONPAG}</div>    
                            </display:column>
                            <display:column title="${title3}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText"> ${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.DESTINATARI.PERSONA.TNOMBRE}
                                 ${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.DESTINATARI.PERSONA.TAPELLI1}
                                 ${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.DESTINATARI.PERSONA.TAPELLI2}
                                 </div>    
                            </display:column>
                            <display:column title="${title4}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText">${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.TFORPAG}</div>    
                            </display:column>
                            <display:column title="${title5}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.FORDPAG}"/></div>    
                            </display:column>                            
                            <display:column title="${title6}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText">${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.NFACREF}</div>    
                            </display:column>
                            <display:column title="${title7}" sortable="false" sortProperty="OB_IAX_SIN_TRAMI_PAGO.FFACREF" headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.FFACREF}"/></div>    
                            </display:column>
                            <display:column title="${title8}" sortable="false" sortProperty="OB_IAX_SIN_TRAMI_PAGO.ISINRET" headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.ISINRET}"/>
                                 </div>    
                            </display:column>
                            <axis:visible f="axissin006" c="BT_SIN_EDITAR_CAB_PAGO">
                                <display:column title="${title10}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                    <div class="dspIcons" id="BT_SIN_EDITAR_CAB_PAGO"><img border="0" alt="<axis:alt f="axissin006" c="BT_SIN_EDITAR_CAB_PAGO" lit="100002"/>" title1="<axis:alt f="axissin006" c="BT_SIN_EDITAR_CAB_PAGO" lit="100002"/>" src="images/lapiz.gif" width="16px" height="16px"
                                    style="cursor:pointer;" onClick="javascript:f_abrir_modal('axissin012',null,'&SPRODUC='+document.miForm.SPRODUC.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+document.miForm.NTRAMIT.value+'&CTIPPAG=2&isNew=no'+'&SIDEPAG='+${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.SIDEPAG}+'&CTRAMIT='+document.miForm.CTRAMIT.value+'&CCAUSIN='+document.miForm.CCAUSIN.value+'&CMOTSIN='+document.miForm.CMOTSIN.value);" /></div>
                                </display:column>
                            </axis:visible>
                            <display:column title="${title9}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                <div class="dspIcons"><img border="0" alt="<axis:alt f="axissin006" c="DSP_MAS_DATOS" lit="1000113"/>" title1="<axis:alt f="axissin006" c="DSP_MAS_DATOS" lit="1000113"/>" src="images/mas.gif" width="11px" height="11px"
                                style="cursor:pointer;" onmouseout="javascript:ocultar('SECCION_D${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.SIDEPAG}')" onmouseover="javascript:mostrar('SECCION_D${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.SIDEPAG}')" /></div>
                            </display:column>                           
                             <!-- *************************** SECCION MÁS DATOS ********************************* -->     
                            <display:column class="seccion_informacion">
                                            <div id="SECCION_D${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.SIDEPAG}" class="seccion_informacion">
                                                                        <table class="area" align="center">
                                                                             <tr>
                                                                                <th style="width:25%;height:0px"></th>
                                                                                <th style="width:25%;height:0px"></th>
                                                                                <th style="width:25%;height:0px"></th>
                                                                                <th style="width:25%;height:0px"></th>
                                                                             </tr>
                                                                            <tr>
                                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axissin006" c="TTIPDES" lit="9001213"/></b>
                                                                                </td>
                                                                                 <td class="titulocaja" colspan="2" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >
                                                                                    <b><axis:alt f="axissin006" c="TNOMBRE" lit="9001214"/></b>
                                                                                </td>                                                  
                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axissin006" c="TCAUIND" lit="9001199"/></b>
                                                                                </td> 
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="CAMPO1" name="CAMPO1" size="15" style="width:90%"
                                                                                    value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.TTIPDES}"   
                                                                                    readonly="readonly"/>
                                                                                </td>
                                                                                <td colspan="2" class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:100%"
                                                                                    value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.DESTINATARI.TNOMBRE} ${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.DESTINATARI.TAPELLI1} ${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.DESTINATARI.TAPELLI2}"
                                                                                    readonly="readonly"/>
                                                                                </td>
                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="CAMPO3" name="CAMPO3" size="15" style="width:90%"
                                                                                    value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.TCAUIND}" readonly="readonly"/>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axissin006" c="TTIPBAN" lit="9001200"/></b>
                                                                                </td>                                                                            
                                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axissin006" c="CBANCAR" lit="100878"/></b>
                                                                                </td>
                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >
                                                                                    <b><axis:alt f="axissin006" c="PRETENC" lit="101714"/></b>
                                                                                </td>                                                  
                                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axissin006" c="IRETENC" lit="9001030"/></b>
                                                                                </td> 

                                                                            </tr>
                                                                            <tr>
                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="CAMPO4" name="CAMPO4" size="15" style="width:90%"
                                                                                    value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.TTIPBAN}" readonly="readonly"/>
                                                                                </td>
                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="CAMPO1" name="CAMPO1" size="15" style="width:90%"
                                                                                    value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.CBANCAR}" readonly="readonly"/>
                                                                                </td>
                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"
                                                                                    value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.PRETENC}" readonly="readonly"/>
                                                                                </td>
                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="CAMPO3" name="CAMPO3" size="15" style="width:90%"
                                                                                    value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.IRETENC}"/>" readonly="readonly"/>
                                                                                </td>
                                                                                                                 
                                                                            </tr>
                                                                             <tr>
                                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axissin006" c="IIVA" lit="101340"/></b>
                                                                                </td>
                                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axissin006" c="ISUPLID" lit="9001201"/></b>
                                                                                </td>
                                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >
                                                                                    <b><axis:alt f="axissin006" c="IFRANQ" lit="9001215"/></b>
                                                                                </td>                                                  
                                                                                
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="CAMPO4" name="CAMPO4" size="15" style="width:90%"
                                                                                    value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.IIVA}"/>" readonly="readonly"/>
                                                                                </td>  
                                                                                 <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="CAMPO1" name="CAMPO1" size="15" style="width:90%"
                                                                                    value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.ISUPLID}"/>" readonly="readonly"/>
                                                                                </td>
                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"
                                                                                    value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.IFRANQ}"/>" readonly="readonly"/>
                                                                                </td>
                                                                                                             
                                                                            </tr>
                                                                            <tr>
                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axissin006" c="IRESRCM" lit="9001202"/></b>
                                                                                </td> 
                                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axissin006" c="IRESRED" lit="9001203"/></b>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                               <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"
                                                                                    value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.IRESRCM}"/>" readonly="readonly"/>
                                                                                </td>                                                                                
                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"
                                                                                    value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.IRESRED}"/>" readonly="readonly"/>
                                                                                </td>   
                                                                            </tr>                                   
                                                                            </table>
                                                                    </div>
                                        </display:column>                            
                                    <!-- *************************** SECCION MÁS DATOS ********************************* -->                       
                           <%i++;%>
                        </display:table>
                        </div>    
                        
                        <table>
                        <tr>
                            <td>                        
                                <table class="area" align="center">
                                <tr>
                                    <th style="height:0px"></th>
                                </tr>                               
                                <tr>
                                    <td>
                                    <div style="float:left;">
                                        <b><axis:alt f="axissin006" c="BT_SIN_NUEVO_TRAM_PAG_MOV" lit="100913"/></b>
                                    </div>
                                    <div style="float:right;" id="BT_SIN_NUEVO_TRAM_PAG_MOV">
                                        <c:if test="${!empty __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.PAGOS_OFI}">
                                            <axis:visible f="axissin006" c="BT_SIN_NUEVO_TRAM_PAG_MOV"> 
                                            <a href="javascript:f_abrir_modal('axissin013',null,'&&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+document.miForm.NTRAMIT.value+'&CTIPPAG=2&SIDEPAG='+document.miForm.SIDEPAG_OFI.value+'&indexPago='+'${__formdata.indexPago_ofi}'+'&CCAUSIN=${__formdata.OB_IAX_SINIESTRO.CCAUSIN}'+'&CMOTSIN=${__formdata.OB_IAX_SINIESTRO.CMOTSIN}');">
                                            <img border="0" alt="<axis:alt f="axissin006" c="BT_SIN_NUEVO_TRAM_PAG_MOV" lit="100913"/>" title="<axis:alt f="axissin006" c="BT_SIN_NUEVO_TRAM_PAG_MOV" lit="100913"/>" src="images/new.gif"/></a>
                                            </axis:visible>
                                        </c:if>
                                    </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>                                    
                                            <c:set var="title1"><axis:alt f="axissin006" c="NMOVPAG" lit="100899" /></c:set><!--Numero-->
                                            <c:set var="title2"><axis:alt f="axissin006" c="TESTPAG" lit="100587" /></c:set><!--Estado-->
                                            <c:set var="title3"><axis:alt f="axissin006" c="FEFEPAG" lit="100883" /></c:set><!--F Efecto -->
                                            <c:set var="title4"><axis:alt f="axissin006" c="TESTVAL" lit="9000948" /></c:set><!-- Estado Validacion -->
                                            <c:set var="title5"><axis:alt f="axissin006" c="FCONTAB" lit="1000575" /></c:set><!-- F Contabilidad -->
                                           <c:set var="title6"><axis:alt f="axissin006" c="TSUBPAG" lit="9000852" /></c:set><!-- F Contabilidad -->
                                           
                                           
                                            <c:set var="num_tramitacion">0</c:set>
                                            <c:set var="num_tram_pago">0</c:set>
                                            <div class="displayspace">
                                              <display:table name="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.PAGOS_OFI[__formdata.indexPago_ofi].OB_IAX_SIN_TRAMI_PAGO.MOVPAGOS}" id="T_IAX_TRAM_MOVPAGOS" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title1}" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspNumber">${T_IAX_TRAM_MOVPAGOS.OB_IAX_SIN_TRAMI_MOVPAGO.NMOVPAG}</div>
                                                </display:column>
                                                <display:column title="${title2}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_MOVPAGOS.OB_IAX_SIN_TRAMI_MOVPAGO.TESTPAG}</div>    
                                                </display:column>
                                                <axis:visible c="TSUBPAG" f="axissin006">
                                                <display:column title="${title6}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_MOVPAGOS.OB_IAX_SIN_TRAMI_MOVPAGO.TSUBPAG}</div>    
                                                </display:column>
                                                </axis:visible>
                                                <display:column title="${title3}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_MOVPAGOS.OB_IAX_SIN_TRAMI_MOVPAGO.FEFEPAG}"/></div>    
                                                </display:column>
                                                <display:column title="${title4}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_MOVPAGOS.OB_IAX_SIN_TRAMI_MOVPAGO.TESTVAL}</div>    
                                                </display:column>
                                                <display:column title="${title5}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_MOVPAGOS.OB_IAX_SIN_TRAMI_MOVPAGO.FCONTAB}"/></div>    
                                                </display:column>                                                     
                                            </display:table>
                                            </div>                                       
                                    </td>
                                </tr>      
                                 <axis:visible f="axissin006" c="DSP_PAGOS_GAR_OFI">
                                <tr>
                                    <td>
                                    <div style="float:left;">
                                        <b><axis:alt f="axissin006" c="BT_SIN_NUEVO_TRAM_PAG_DET" lit="9000937"/></b>
                                    </div>
                                    
                                    <div style="float:right;" id="BT_SIN_NUEVO_TRAM_PAG_DET">
                                    <c:if test="${!empty  __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.PAGOS_OFI}">
                                    <axis:visible f="axissin006" c="BT_SIN_NUEVO_TRAM_PAG_DET"> 
                                            <a href="javascript:f_abrir_modal('axissin014',null,'&isNew=yes&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+document.miForm.NTRAMIT.value+'&CTIPPAG=2&SIDEPAG='+document.miForm.SIDEPAG_OFI.value+'&indexPago='+'${__formdata.indexPago_ofi}'+'&SECCION=pagos');">
                                            <img border="0" alt="<axis:alt f="axissin006" c="BT_SIN_NUEVO_TRAM_PAG_DET" lit="9000937"/>" title="<axis:alt f="axissin006" c="BT_SIN_NUEVO_TRAM_PAG_DET" lit="9000937"/>" src="images/new.gif"/></a>
                                    </axis:visible>
                                    </c:if>
                                    </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>                                       
                                            <c:set var="title0"><axis:alt f="axissin006" c="TTIPRES" lit="100565" /></c:set><!--Tipo -->
                                            <c:set var="title1"><axis:alt f="axissin006" c="TGARANT" lit="110994" /></c:set><!--Garantia-->
                                            <c:set var="title2"><axis:alt f="axissin006" c="FPERINI" lit="9000526" /></c:set><!--Finicio-->
                                            <c:set var="title3"><axis:alt f="axissin006" c="FPERFIN" lit="9000527" /></c:set><!--FFin -->
                                            <c:set var="title4"><axis:alt f="axissin006" c="ISINRET2" lit="9000939" /></c:set><!-- Importe Bruto -->
                                            <c:set var="title5"><axis:alt f="axissin006" c="IIVA" lit="101340" /></c:set><!-- Importe IVA -->
                                            <c:set var="title6"><axis:alt f="axissin006" c="IRETENC" lit="9001030" /></c:set><!-- Retencion -->
                                            <c:set var="title7"><axis:alt f="axissin006" c="IFRANQ2" lit="9000940" /></c:set><!-- Franquicia -->
                                            <c:set var="title8"><axis:alt f="axissin006" c="BT_SIN_EDITAR_TRAM_PAG_DET" lit="100002" /></c:set><!--Editar-->
                                            <c:set var="title9"><axis:alt f="axissin006" c="BT_SIN_DELETE_TRAM_PAG_DET" lit="1000127"/></c:set><!--Eliminar-->
                                            <c:set var="title11"><axis:alt f="axissin006" c="CCONPAG" lit="100896"/></c:set><!--Eliminar-->
                                             <c:set var="title12"><axis:alt f="axissin006" c="NORDEN" lit="500102"/></c:set><!--Orden-->
                                            <c:set var="num_tramitacion">0</c:set>
                                            <c:set var="num_tram_pago">0</c:set>
                                            <div class="displayspace">
                                            <display:table name="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.PAGOS_OFI[__formdata.indexPago_ofi].OB_IAX_SIN_TRAMI_PAGO.PAGOGAR}" id="T_IAX_TRAM_PAGOGAR" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="">
                                                <%@ include file="../include/displaytag.jsp"%>                                                                                                
                                                <display:column title="${title0}" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspNumber">${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.RESERVA.TTIPRES}</div>
                                                </display:column>
                                                <display:column title="${title1}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.RESERVA.TGARANT}</div>    
                                                </display:column>
                                                <axis:visible f="axissin006" c="NORDEN">
                                                <display:column title="${title12}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.NORDEN}</div>    
                                                </display:column>
                                                </axis:visible>
                                               <axis:visible f="axissin006" c="FPERINI">
                                                <display:column title="${title2}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.FPERINI}"/></div>    
                                                </display:column>
                                                </axis:visible>
                                                <axis:visible f="axissin006" c="FPERFIN">
                                                <display:column title="${title3}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.FPERFIN}"/></div>    
                                                </display:column>
                                                </axis:visible>
                                                <axis:visible f="axissin006" c="ISINRET">
                                                <display:column title="${title4}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.ISINRET}"/></div> 
                                                </display:column>
                                               </axis:visible>
                                                <axis:visible f="axissin006" c="IIVA">
                                                <display:column title="${title5}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.IIVA}"/></div> 
                                                </display:column>
                                                  </axis:visible>
                                                <axis:visible f="axissin006" c="IRETENC">
                                                <display:column title="${title6}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.IRETENC}"/></div> 
                                                </display:column>
                                              </axis:visible>
                                                <axis:visible f="axissin006" c="IFRANQ">
                                                <display:column title="${title7}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.IFRANQ}"/></div> 
                                                </display:column>
                                              </axis:visible>
                                                <axis:visible f="axissin006" c="CCONPAG">
                                                    <display:column title="${title11}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                         <div class="dspText">${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.TCONPAG}</div>    
                                                    </display:column>
                                                </axis:visible>
                                                 <axis:visible f="axissin006" c="BT_SIN_EDITAR_TRAM_PAG_DET">
                                                    <display:column title="${title10}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                        <c:if test="${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.ESMODIF==1}">
                                                        <div class="dspIcons" id="BT_SIN_EDITAR_TRAM_PAG_DET"><img border="0" alt="<axis:alt f="axissin006" c="BT_SIN_EDITAR_TRAM_PAG_DET" lit="100002"/>" title1="<axis:alt f="axissin006" c="BT_SIN_EDITAR_TRAM_PAG_DET" lit="100002"/>" src="images/lapiz.gif" width="16px" height="16px"
                                                        style="cursor:pointer;" onclick="javascript:f_abrir_modal('axissin014',null,'&isNew=no&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+document.miForm.NTRAMIT.value+'&CTIPPAG=2&SIDEPAG='+document.miForm.SIDEPAG.value+'&indexPago='+'${__formdata.indexPago}'+'&NMOVRES='+'${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.RESERVA.NMOVRES}'+'&CTIPRES='+'${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.RESERVA.CTIPRES}'+'&CTIPGAS='+'${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.RESERVA.CTIPGAS}'+'&NORDEN='+'${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.NORDEN}');">
                                                        </c:if>
                                                    </display:column>
                                                </axis:visible>
                                              <axis:visible f="axissin006" c="BT_SIN_DELETE_TRAM_PAG_DET"> 
                                                <display:column title="${title9}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                    <div class="dspIcons" id="BT_SIN_DELETE_TRAM_PAG_DET"><img border="0" alt="<axis:alt f="axissin006" c="BT_SIN_DELETE_TRAM_PAG_DET" lit="1000127"/>" title1="<axis:alt f="axissin006" c="BT_SIN_DELETE_TRAM_PAG_DET" lit="1000127"/>" src="images/delete.gif" width="15px" height="15px"
                                                    style="cursor:pointer;" onclick="f_borrar_detallepago('2','${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.RESERVA.CTIPRES}','${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.RESERVA.CGARANT}','${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.RESERVA.NMOVRES}','${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.SIDEPAG}','${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.NORDEN}');"/></div>
                                                </display:column> 
                                                </axis:visible>                               
                                         </display:table>
                                            </div>
                                        <!-- FIN  -->
                                    </td>
                                </tr>                  
                                </axis:visible>
                                <!-- Fin seccion -->
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </axis:visible> 
           
             
</form>