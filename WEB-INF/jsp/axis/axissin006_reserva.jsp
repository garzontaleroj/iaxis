<%/* Revision:# b2ekmpSyk4Camdu8HARH2g== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%> 
<c:set var="nombrePantalla" value="reserva"/>

<script type="text/javascript">
   
    
</script>

<form name="${nombrePantalla}" action="" method="POST">  
<table>
                        <tr>
                            <td>
                        
                                <table class="area" align="center">
                                <tr>
                                    <th style="height:0px"></th>
                                </tr>
                                <!-- Inicio Seccion -->
                                <tr>
                                    <td class="campocaja">
                                    <div style="float:left;">
                                        <b><axis:alt f="axissin006" c="tit_reservassini" lit="107702"/></b>
                                    </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <!-- TABLA SECCION  RESERVAS SINIESTRO -->
                                                                             
                                            <c:set var="title0"><axis:alt f="axissin006" c="t_tipo" lit="100565" /></c:set><!--Tipo-->
                                            <c:set var="title1"><axis:alt f="axissin006" c="t_tramitacion" lit="9000908" /></c:set><!--TRamitacion-->
                                            <c:set var="title2"><axis:alt f="axissin006" c="t_garantia" lit="110994" /></c:set> <!--Garantia-->
                                            <c:set var="title3"><axis:alt f="axissin006" c="t_costetotal" lit="9001024" /></c:set><!--Importw Coste Total  -->
                                            <c:set var="title4"><axis:alt f="axissin006" c="t_pagobrugo" lit="9000911" /></c:set><!-- Importe Pago Bruto  -->
                                            <c:set var="title5"><axis:alt f="axissin006" c="t_recobrobruto" lit="9000912" /></c:set><!-- Importe Recobro Bruto  -->
                                            <c:set var="title6"><axis:alt f="axissin006" c="t_reservapte" lit="9000913" /></c:set><!-- Importe Reserva Pte  -->
                                            <!--bug 0022790 -->
                                            <c:set var="title7"><axis:alt f="axissin006" c="t_tramite" lit="9903442" /></c:set><!--Tramite-->
                                            <c:set var="title8"><axis:alt f="axissin006" c="CMONRES" lit="9907718" /></c:set><!--  Moneda-->
                                            <c:set var="title9"><axis:alt f="axissin006" c="CSOLIDARIDAD" lit="9910049"/></c:set><!-- Solidaridad -->
	
                                            <div class="displayspace">
                                              <display:table name="${__formdata.OB_IAX_SINIESTRO.RESUMEN.RESERVAS}" id="T_IAX_RESERVAS" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <axis:visible f="axissin006" c="RESRES_TTRAMITE">
                                                <display:column title="${title7}" sortable="false"  headerClass="sortable" media="html" autolink="false" style="width:13%;" >
                                                     <div class="dspText">${T_IAX_RESERVAS.TTRAMITE}</div>    
                                                </display:column>
                                                </axis:visible>
                                                <display:column title="${title1}" sortable="false"  headerClass="sortable" media="html" autolink="false" style="width:17%;" >
                                                     <div class="dspText">${T_IAX_RESERVAS.TTRAMIT}</div>    
                                                </display:column>
                                                <display:column title="${title0}" sortable="false" headerClass="sortable" media="html" autolink="false" style="width:9%;" >
                                                    <div class="dspNumber">${T_IAX_RESERVAS.TTIPRES}</div>
                                                </display:column>
                                                <axis:visible c="CSOLIDARIDAD" f="axissin006">
                                                <display:column title="${title9}" sortable="false" headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >
                                                    <div class="dspIcons"><a name="check_solidaridad_${T_IAX_RESERVAS.TTRAMITE}_${T_IAX_RESERVAS.TTIPRES}"/>
                                                        <input type="checkbox" id="check_solidaridad_${T_IAX_RESERVAS.TTRAMITE}_${T_IAX_RESERVAS.TTIPRES}"  <c:if test="${T_IAX_RESERVAS.CSOLIDARIDAD == 1}"> checked </c:if>  value="" disabled="disabled" />
                                                    </div>
                                                </display:column>
                                                </axis:visible>
                                                <display:column title="${title2}" sortable="false"  headerClass="sortable" media="html" autolink="false" style="width:17%;" >
                                                     <div class="dspText">${T_IAX_RESERVAS.TGARANT}</div>    
                                                </display:column>
                                                
                                                    <axis:visible f="axissin006" c="CMONRES">
                                                    <display:column title="${title8}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                         <div class="dspText">${T_IAX_RESERVAS.CMONRES}</div>    
                                                    </display:column>
                                                    </axis:visible> 
                                                
                                                <display:column title="${title3}" sortable="false"  headerClass="sortable" media="html" autolink="false" style="width:9%;" >
                                                     <c:set var="import">${(T_IAX_RESERVAS.IRESERVA  +  T_IAX_RESERVAS.IPAGO +  T_IAX_RESERVAS.ITOTIMP) - (T_IAX_RESERVAS.IINGRESO + T_IAX_RESERVAS.IRECOBRO)}</c:set>
                                                     <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[T_IAX_RESERVAS.CMONRES]}" value="${(T_IAX_RESERVAS.IRESERVA  +  T_IAX_RESERVAS.IPAGO +  T_IAX_RESERVAS.ITOTIMP) - (T_IAX_RESERVAS.IINGRESO + T_IAX_RESERVAS.IRECOBRO)}"/></div>      
                                                </display:column>
                                                <display:column title="${title4}" sortable="false"  headerClass="sortable" media="html" autolink="false" style="width:12%;" >
                                                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[T_IAX_RESERVAS.CMONRES]}" value="${T_IAX_RESERVAS.IPAGO}"/></div>   
                                                </display:column>
                                                <display:column title="${title5}" sortable="false"  headerClass="sortable" media="html" autolink="false" style="width:12%;" >
                                                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[T_IAX_RESERVAS.CMONRES]}" value="${T_IAX_RESERVAS.IRECOBRO}"/></div>
                                                </display:column>
                                                <display:column title="${title6}" sortable="false"  headerClass="sortable" media="html" autolink="false" style="width:12%;" >
                                                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[T_IAX_RESERVAS.CMONRES]}" value="${T_IAX_RESERVAS.IRESERVA}"/></div>
                                                </display:column>
                                                                                                                   
                                            </display:table>
                                            </div>
                                        <!-- FIN  -->
                                    </td>
                                </tr>   
                                <c:if test="${!empty __formdata.OB_IAX_SINIESTRO.RESUMEN.PAGOS}">
                                <tr>
                                    <td class="campocaja">
                                    <div style="float:left;">
                                        <b><axis:alt f="axissin006" c="tit_resumenpagos" lit="102198"/></b>
                                    </div>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td>
                                        <!-- TABLA SECCION  PAGOS SINIESTROS -->
                                                                             
                                            <c:set var="title0"><axis:alt f="axissin006" c="t2_tipo" lit="100565" /></c:set><!--Tipo-->
                                            <c:set var="title1"><axis:alt f="axissin006" c="t2_tramitacion" lit="9000908" /></c:set><!--TRamitacion-->
                                            <c:set var="title2"><axis:alt f="axissin006" c="t2_formapago" lit="100712" /></c:set><!--Forma Pago -->
                                            <c:set var="title3"><axis:alt f="axissin006" c="t2_estado" lit="100587" /></c:set><!--Estado -->
                                            <c:set var="title4"><axis:alt f="axissin006" c="t2_destinatario" lit="9000909" /></c:set><!-- Destinatario -->
                                            <c:set var="title5"><axis:alt f="axissin006" c="t2_forden" lit="9000910" /></c:set><!-- F Orden-->
                                            <c:set var="title6"><axis:alt f="axissin006" c="t2_pagobruto" lit="9000911" /></c:set><!-- Importe Pago Bruto -->
                                            <!--bug 0022790 -->
                                            <c:set var="title7"><axis:alt f="axissin006" c="t2_tramite" lit="9903442" /></c:set><!--Tramite-->
                                            <c:set var="title8"><axis:alt f="axissin006" c="CMONRES" lit="9907718" /></c:set><!--  Moneda-->
                                            
                                            <div class="displayspace">
                                              <display:table name="${__formdata.OB_IAX_SINIESTRO.RESUMEN.PAGOS}" id="T_IAX_PAGOS" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0" 
                                               requestURI="">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <axis:visible f="axissin006" c="RESPAG_TTRAMITE">
                                                <display:column title="${title7}" sortable="false"  headerClass="sortable" media="html" autolink="false" style="width:13%;" > 
                                                     <div class="dspText">${T_IAX_PAGOS.TTRAMITE}</div>    
                                                </display:column>
                                                </axis:visible>
                                                <display:column title="${title1}" sortable="false"  headerClass="sortable" media="html" autolink="false" style="width:17%;" >
                                                     <div class="dspText">${T_IAX_PAGOS.TTRAMIT}</div>    
                                                </display:column>
                                                <display:column title="${title3}" sortable="false"  headerClass="sortable" media="html" autolink="false" style="width:10%;" >
                                                     <div class="dspText">${T_IAX_PAGOS.TESTPAG}</div>    
                                                </display:column>
                                                <display:column title="${title4}" sortable="false"  headerClass="sortable" media="html" autolink="false" style="width:30%;" >
                                                     <div class="dspText">${T_IAX_PAGOS.TDESTINATARIO}</div>    
                                                </display:column>
                                                <display:column title="${title5}" sortable="false"  headerClass="sortable" media="html" autolink="false" style="width:15%;" >
                                                     <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_PAGOS.FORDPAG}"/></div>    
                                                </display:column>
                                                 <axis:visible f="axissin006" c="CMONRES">
                                                <display:column title="${title8}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_PAGOS.CMONRES}</div>    
                                                </display:column>
                                                </axis:visible> 
                                                <display:column title="${title6}" sortable="false" sortProperty="ISINRET" headerClass="sortable" media="html" autolink="false" style="width:15%;" >
                                                     <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_PAGOS.ISINRET}"/></div>
                                                </display:column>
                                                
                                               
                                            </display:table>
                                            </div>
                                        <!-- FIN   -->
                                    </td>
                                </tr>  
                                </c:if>
                                
                                  <c:if test="${!empty __formdata.OB_IAX_SINIESTRO.RESUMEN.RECOBROS}">
                                <tr>
                                    <td class="campocaja">
                                    <div style="float:left;">
                                      
                                       <c:if test="${__formdata.P_RAMO!=802}">
                                       <b><axis:alt f="axissin006" c="tit_resumenrecobro" lit="9000897"/>/<axis:alt f="axissin006" c="RECOBROS" lit="9904530"/></b>
                                        </c:if>  
                                        
                                        <c:if test="${__formdata.P_RAMO==802}">
                                        <b><axis:alt f="axissin006" c="tit_resumenrecobro" lit="9904530"/></b>
                                        </c:if>  
                                    </div>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td>
                                        <!-- TABLA SECCION  RECOBROS SINIESTROS -->
                                                                             
                                            <c:set var="title0"><axis:alt f="axissin006" c="t3_tipo" lit="100565" /></c:set><!--Tipo-->
                                            <c:set var="title1"><axis:alt f="axissin006" c="t3_tramitacion" lit="9000908" /></c:set><!--TRamitacion-->
                                            <c:set var="title2"><axis:alt f="axissin006" c="t3_formapago" lit="100712" /></c:set><!--Forma Pago -->
                                            <c:set var="title3"><axis:alt f="axissin006" c="t3_estado" lit="100587" /></c:set><!--Estado -->
                                            <c:set var="title4"><axis:alt f="axissin006" c="t3_destinatario" lit="9000909" /></c:set><!-- Destinatario -->
                                            <c:set var="title5"><axis:alt f="axissin006" c="t3_forden" lit="9000910" /></c:set><!-- F Orden-->
                                            <c:set var="title6"><axis:alt f="axissin006" c="t3_recobrobruto" lit="9000912" /></c:set><!-- Importe RECOBRO Bruto -->
                                            <!--bug 0022790 -->
                                            <c:set var="title7"><axis:alt f="axissin006" c="t3_tramite" lit="9903442" /></c:set><!--Tramite-->
                                            <c:set var="title8"><axis:alt f="axissin006" c="CMONRES" lit="9907718" /></c:set><!--  Moneda-->

                                            <div class="displayspace">
                                               <display:table name="${__formdata.OB_IAX_SINIESTRO.RESUMEN.RECOBROS}" id="T_IAX_PAGOS" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="">
                                                <%@ include file="../include/displaytag.jsp"%>     
                                                <axis:visible f="axissin006" c="RESREC_TTRAMITE">
                                                <display:column title="${title7}" sortable="false"  headerClass="sortable" media="html" autolink="false" style="width:13%;" >
                                                     <div class="dspText">${T_IAX_PAGOS.TTRAMITE}</div>    
                                                </display:column>
                                                </axis:visible>
                                                <display:column title="${title1}" sortable="false"  headerClass="sortable" media="html" autolink="false" style="width:17%;" >
                                                     <div class="dspText">${T_IAX_PAGOS.TTRAMIT}</div>    
                                                </display:column>
                                                <display:column title="${title3}" sortable="false"  headerClass="sortable" media="html" autolink="false" style="width:10%;" >
                                                     <div class="dspText">${T_IAX_PAGOS.TESTPAG}</div>    
                                                </display:column>
                                                <display:column title="${title4}" sortable="false"  headerClass="sortable" media="html" autolink="false" style="width:30%;" >
                                                     <div class="dspText">${T_IAX_PAGOS.TDESTINATARIO}</div>    
                                                </display:column>
                                                <display:column title="${title5}" sortable="false"  headerClass="sortable" media="html" autolink="false" style="width:15%;" >
                                                     <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_PAGOS.FORDPAG}"/></div>    
                                                </display:column>
                                                 <axis:visible f="axissin006" c="CMONRES">
                                                <display:column title="${title8}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_PAGOS.CMONRES}</div>    
                                                </display:column>
                                                </axis:visible>                                                
                                                <display:column title="${title6}" sortable="false" sortProperty="ISINRET" headerClass="sortable" media="html" autolink="false" style="width:15%;" >
                                                     <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_PAGOS.ISINRET}"/></div>
                                                </display:column>
                                            </display:table>
                                            </div>
                                        <!-- FIN   -->
                                    </td>
                                </tr>  
                                </c:if>

                                <!-- bug 0021662 -->
                                <tr>
                                <td>
                                    <axis:visible f="axissin006" c="TFILE">
                                    <div class="separador">&nbsp;</div>
                                    <table class="area" align="center">  
                                             <tr>
                                                    <th style="width:50%;height:0px"></th>        
                                                    <th style="width:50%;height:0px"></th>
                                             </tr>       
                                             <c:if test="${!empty __formdata.V_RUTA}">
                                                <tr>
                                                    <axis:ocultar f="axissin006" c="TFILE" dejarHueco="false">
                                                        <td class="titulocaja">
                                                            <b id="label_TFILE"><axis:alt f="axissin006" c="label_TFILE" lit="107913"/></b> <%-- Links fitxers generats --%>
                                                        </td>
                                                    </axis:ocultar>
                                                </tr>
                                            </c:if>                                       
                                            <c:if test="${!empty __formdata.V_RUTA}">                                   
                                                <tr>
                                                    <axis:ocultar f="axissin006" c="TFILE" dejarHueco="false">
                                                        <td class="campocaja" id="fichero">
                                                              <input type="text" readonly 
                                                           style="text-decoration:underline;background-color:transparent;border:0;cursor:pointer" 
                                                           onclick="javascript:f_imprimir_fitxer(this.value)" class="campowidthinput campo campotexto_ob" size="15"  name="TFILE" id="TFILE"
                                                           title="<axis:alt f="axissin006" c="TFILE" lit="107913"/>" value="${__formdata.V_RUTA}"/>                                                                                                        
                                                        </td>                                          
                                                    </axis:ocultar>
                                                    <td>                                            
                                                </tr>
                                               </c:if>                                                   
                                        </table>                                            
                                    <div class="separador">&nbsp;</div>
                                    </axis:visible>
                                </td>
                                </tr>
                                
                            </table>
                        </td>
                    </tr>
</table>
</form>
