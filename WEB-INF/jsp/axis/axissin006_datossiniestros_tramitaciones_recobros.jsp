<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="nombrePantalla" value="tramitaciones"/>
<c:set var="nombreSeccion" value="recobros"/>

<script type="text/javascript">
   
        function f_getRecobro(indexNou, sidepag){
           if (document.miForm.indexRecobro.value != indexNou){
              document.miForm.indexRecobro.value = indexNou;
               document.miForm.SIDEPAGRECOB.value = sidepag   
              document.miForm.subpantalla.value="tramitaciones";
              document.miForm.seccion.value="tramitaciones_recobros";
              objUtiles.ejecutarFormulario("axis_axissin006.do", "recargarPagos", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
        
        function f_getRecobro_ofi(indexNou, sidepag){
           if (document.miForm.indexRecobro_ofi.value != indexNou){
              document.miForm.indexRecobro_ofi.value = indexNou;
               document.miForm.SIDEPAGRECOB_ofi.value = sidepag   
              document.miForm.subpantalla.value="tramitaciones";
              document.miForm.seccion.value="tramitaciones_recobros";
              objUtiles.ejecutarFormulario("axis_axissin006.do", "recargarPagos", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }


 /*function f_aceptar_axissin013(NSINIES, PANTALLA, SECCION) {
            objDom.setValorPorId("NSINIES", NSINIES);
            document.miForm.subpantalla.value="tramitaciones";
            document.miForm.seccion.value="tramitaciones_recobros";
            objUtiles.ejecutarFormulario("axis_axissin006.do?", "cargarDatos", document.miForm, "_self", objJsMessages.jslit_cargando);
 }*/

 
                
    
</script>

<form name="${nombrePantalla}${nombreSeccion}" action="" method="POST"> 

        <axis:visible f="axissin006" c="DSP_RECOBROS_GEN">
            <div ID="DSP_RECOBROS_GEN">
            <!-- TABLA SECCION  RECOBROS TRAMITACION : RECOBROS CABECERA-->
                        <c:set var="title0"><axis:alt f="axissin006" c="NUMERO" lit="800440" /></c:set><!--Numero -->
                        <c:set var="title1"><axis:alt f="axissin006" c="TIPO" lit="100565" /></c:set><!--Tipo-->
                        <c:set var="title2"><axis:alt f="axissin006" c="CONCEPTO" lit="9000715" /></c:set><!--Concepto-->
                        <c:set var="title3"><axis:alt f="axissin006" c="DESTINATARIO" lit="9000909" /></c:set><!--Destinatario -->
                        <c:set var="title4"><axis:alt f="axissin006" c="FPAGO" lit="100712" /></c:set><!-- Forma Pago -->
                        <c:set var="title5"><axis:alt f="axissin006" c="FORDEN" lit="9000910" /></c:set><!-- Fecha orden -->
                        <c:set var="title6"><axis:alt f="axissin006" c="NFACTURA" lit="9000445" /></c:set><!-- num. factura -->
                        <c:set var="title7"><axis:alt f="axissin006" c="FFACTURA" lit="9000451" /></c:set><!-- fecha factura -->
                        <c:set var="title8"><axis:alt f="axissin006" c="IBRUTO" lit="9000938" /></c:set><!--Importe Bruto-->
                        <c:set var="title9"><axis:alt f="axissin006" c="MASINFO" lit="1000113" /></c:set><!--  más informacion-->
                        <c:set var="title10"><axis:alt f="axissin006" c="EDITAR" lit="100002" /></c:set><!--  Editar-->
                        <c:set var="num_tramitacion">0</c:set>
                        <c:set var="num_tram_recob">0</c:set>
                        <div class="displayspace">
                        <%int i = 0;%>
                          <display:table name="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.RECOBROS}" id="T_IAX_TRAM_PAGOS" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                           requestURI="">
                           <c:set var="i"><%=i%></c:set>
                            <%@ include file="../include/displaytag.jsp"%>
                            
                            <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                               <div class="dspIcons"><input  onClick="javascript:f_getRecobro('${i}','${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.SIDEPAG}')" 
                               <c:if test="${__formdata.SIDEPAGRECOB == T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.SIDEPAG }"> checked </c:if>
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
                                 <div class="dspText">${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.DESTINATARI.PERSONA.TNOMBRE}
                                 ${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.DESTINATARI.PERSONA.TAPELLI1}
                                 ${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.DESTINATARI.PERSONA.TAPELLI2}</div>    
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
                                 <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.ISINRET}"/></div>    
                            </display:column>
                            <axis:visible f="axissin006" c="BT_SIN_EDITAR_CAB_RECOB">
                                <display:column title="${title10}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                    <c:if test="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.MOVPAGOS[fn:length(T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.MOVPAGOS)-1].OB_IAX_SIN_TRAMI_MOVPAGO.CESTPAG==0}">
                                        <div class="dspIcons" id="BT_SIN_EDITAR_CAB_RECOB"><img border="0" alt="<axis:alt f="axissin006" c="DETALLE" lit="1000113"/>" title1="<axis:alt f="axissin006" c="DETALLE2" lit="1000113"/>" src="images/lapiz.gif" width="16px" height="16px"
                                        style="cursor:pointer;" onClick="javascript:f_abrir_modal('axissin012',null,'&SPRODUC='+document.miForm.SPRODUC.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+document.miForm.NTRAMIT.value+'&CTIPPAG=2&isNew=no'+'&SIDEPAG='+${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.SIDEPAG}+'&CTRAMIT='+document.miForm.CTRAMIT.value+'&CCAUSIN='+document.miForm.CCAUSIN.value+'&CMOTSIN='+document.miForm.CMOTSIN.value+'&CAGENTESINI='+document.miForm.CAGENTESINI.value+'&TAGENTESINI='+document.miForm.TAGENTESINI.value+'&NTRAMIT9999='+document.miForm.NTRAMIT9999.value);" /></div>
                                    </c:if>
                                </display:column>
                            </axis:visible>
                            <display:column title="${title9}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                <div class="dspIcons"><img border="0" alt="<axis:alt f="axissin006" c="DETALLE3" lit="1000113"/>" title1="<axis:alt f="axissin006" c="DETALLE4" lit="1000113"/>" src="images/mas.gif" width="11px" height="11px"
                                style="cursor:pointer;" onmouseout="javascript:ocultar('SECCION_C${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.SIDEPAG}')" onmouseover="javascript:mostrar('SECCION_C${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.SIDEPAG}')" /></div>
                            </display:column>
                            
                            
                            
                            <!-- *************************** SECCION MÁS DATOS ********************************* -->     
                            <display:column class="seccion_informacion">
                            		<!-- Changes for IAXIS-4663 PK-02/07/2019 Start -->
                                    <div id="SECCION_C${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.SIDEPAG}" style="height:335px" class="seccion_informacion">
                                    <!-- Changes for IAXIS-4663 PK-02/07/2019 End -->
                                         <!-- INICIO SECCION -->
                                         <table class="area" align="center">
                                               <tr>
                                                   <th style="width:25%;height:0px"></th>
                                                   <th style="width:25%;height:0px"></th>
                                                   <th style="width:25%;height:0px"></th>
                                                   <th style="width:25%;height:0px"></th>
                                               </tr>
                                               <tr>
                                                   <%-- Tipo destinatario --%>
                                                   <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                       <b><axis:alt f="axissin006" c="TDESTINATARIO" lit="9001213"/></b>
                                                   </td>
                                                   <%-- Nombre destinatario --%>
                                                    <td class="titulocaja" colspan="2" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >
                                                       <b><axis:alt f="axissin006" c="NDESTINATARIO" lit="9001214"/></b>
                                                   </td>                                                  
                                                    <%-- Causa indemnizacion --%>
                                                    <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                       <b><axis:alt f="axissin006" c="CAUSA_TRAMRECOB" lit="9001199"/></b>
                                                   </td> 

                                               </tr>
                                               <tr>
                                                    <%-- Tipo destinatario --%>
                                                   <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                       <input type="text" class="campo campotexto" id="CAMPO1" name="CAMPO1" size="15" style="width:90%"
                                                       value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.TTIPDES}"   
                                                       readonly="readonly"/>
                                                   </td>
                                                    <%-- Nombre destinatario --%>
                                                   <td colspan="2" class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                       <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:100%"
                                                       value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.DESTINATARI.TNOMBRE} ${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.DESTINATARI.TAPELLI1} ${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.DESTINATARI.TAPELLI2}"
                                                       readonly="readonly"/>
                                                   </td>
                                                   <%-- Causa indemnizacion --%>
                                                   <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                       <input type="text" class="campo campotexto" id="CAMPO3" name="CAMPO3" size="15" style="width:90%"
                                                       value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.TCAUIND}" readonly="readonly"/>
                                                   </td>
     
                                               </tr>
                                               <tr>
                                                   <%-- Tipo Cuenta --%>
                                                   <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                       <b><axis:alt f="axissin006" c="TIPCUENTA_TRAMRECOB" lit="9001200"/></b>
                                                   </td>
                                               
                                                   <%-- Nº Cuenta bancaria --%>
                                                   <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                       <b><axis:alt f="axissin006" c="CUENTABANCO_TRAMRECOB" lit="100878"/></b>
                                                   </td>
                                                   <%-- % Retencion --%>
                                                    <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >
                                                       <b><axis:alt f="axissin006" c="PRETENC_TRAMRECOB" lit="101714"/></b>
                                                   </td>                                                  
                                                    <%-- Imp. Retenció --%>
                                                    <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                       <b><axis:alt f="axissin006" c="IRETENC_TRAMRECOB" lit="9001030"/></b>
                                                   </td> 

                                               </tr>
                                               <tr>
                                                   <%-- Tipo Cuenta --%>
                                                   <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                       <input type="text" class="campo campotexto" id="CAMPO4" name="CAMPO4" size="15" style="width:90%"
                                                       value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.TTIPBAN}" readonly="readonly"/>
                                                   </td>
                                                    <%-- Nº Cuenta bancaria --%>
                                                   <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                       <input type="text" class="campo campotexto" id="CAMPO1" name="CAMPO1" size="15" style="width:90%"
                                                       value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.CBANCAR}" readonly="readonly"/>
                                                   </td>
                                                    <%-- % Retencion --%>
                                                   <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                       <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"
                                                       value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.PRETENC}" readonly="readonly"/>
                                                   </td>
                                                   <%-- Imp. Retenció --%>
                                                   <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                       <input type="text" class="campo campotexto" id="CAMPO3" name="CAMPO3" size="15" style="width:90%"
                                                       value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.IRETENC}"/>" readonly="readonly"/>
                                                   </td>
                                                                                    
                                               </tr>
                                                <tr>
                                                   <%-- I. IVA --%>
                                                   <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                       <b><axis:alt f="axissin006" c="IIVA" lit="101340"/></b>
                                                   </td>
                                                   <%-- Imp. SUplit --%>
                                                   <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                       <b><axis:alt f="axissin006" c="ISUPLIT" lit="9001201"/></b>
                                                   </td>
                                                   <%-- Imp. Franquicia --%>
                                                    <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >
                                                       <b><axis:alt f="axissin006" c="IFRANQUICIA" lit="9001215"/></b>
                                                   </td>                                                  
                                                   
                                               </tr>
                                               <tr>
                                               		<%-- I. IVA --%>
                                                   <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                       <input type="text" class="campo campotexto" id="CAMPO4" name="CAMPO4" size="15" style="width:90%"
                                                       value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.IIVA}"/>" readonly="readonly"/>
                                                   </td>  
                                                    <%-- Imp. SUplit --%>
                                                   <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                       <input type="text" class="campo campotexto" id="CAMPO1" name="CAMPO1" size="15" style="width:90%"
                                                       value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.ISUPLID}"/>" readonly="readonly"/>
                                                   </td>
                                                    <%-- Imp. Franquicia --%>
                                                   <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                       <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"
                                                       value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.IFRANQ}"/>" readonly="readonly"/>
                                                   </td>
                                                                                 
                                               </tr>
                                               <tr>
                                                	<%-- Rend, Capital Mobiliario --%>
                                                   <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                       <b><axis:alt f="axissin006" c="IRESRCM_TRAMRECOB" lit="9001202"/></b>
                                                   </td> 
                                                   <%-- Rendimiento Reducido --%>
                                                   <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                       <b><axis:alt f="axissin006" c="IRESRED_TRAMRECOB" lit="9001203"/></b>
                                                   </td>
                                                   <!-- Changes for IAXIS-4663 PK-02/07/2019 Start -->
                                                   <%-- ISINRETPAG --%>
                                                   <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                       <b><axis:alt f="axissin006" c="IRESRED_ISINRETPAG" lit="89906337"/></b>
                                                   </td>
                                                   <!-- Changes for IAXIS-4663 PK-02/07/2019 End -->
                                               </tr>
                                               <tr>
                                                	<%-- I Rendimiento capital mobiliario --%>
                                                   <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                       <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"
                                                       value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.IRESRCM}"/>" readonly="readonly"/>
                                                   </td>
                                                    <%-- I. Rendimiento reducido --%>
                                                   <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                       <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"
                                                       value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.IRESRED}"/>" readonly="readonly"/>
                                                   </td>
                                                   <!-- Changes for IAXIS-4663 PK-02/07/2019 Start -->
                                                   <%-- ISINRETPAG --%>
                                                   <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                       <input type="text" class="campo campotexto" id="CAMPO5" name="CAMPO5" size="15" style="width:90%"
                                                       value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" 
                                                       value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.ISINRETPAG}"/>" readonly="readonly"/>
                                                   </td>
                                                   <!-- Changes for IAXIS-4663 PK-02/07/2019 End -->
                                               </tr>
                                               <!-- Changes for IAXIS-4663 PK-02/07/2019 Start -->
                                               <tr>
                                                	<%-- TOBSERVA --%>
                                                    <td colspan="4" class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                        <b><axis:alt f="axissin006" c="IRESRED_TOBSERVA" lit="101162"/></b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                	<%-- TOBSERVA --%>
                                                   <td colspan="4" class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                       <%-- <input type="text" class="campo campotexto" id="CAMPO5" name="CAMPO5" size="15" style="width:99%;height:10px;"
                                                       value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.TOBSERVA}" readonly="readonly"/> --%>
                                                       <textarea name="CAMPO5" id="CAMPO5" class="campo campotexto" rows="3" cols="90"
								readonly="readonly">${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.TOBSERVA}</textarea>
                                                   </td>
                                                </tr>
                                                <!-- Changes for IAXIS-4663 PK-02/07/2019 End -->
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
                                <!-- Inicio Seccion -->
                                <tr>
                                    <td class="campocaja">
                                    <div style="float:left;">
                                        <b><axis:alt f="axissin006" c="MOVIMIENTOS" lit="100913"/></b>
                                    </div>
                                    <div style="float:right;">
                                    <c:if test="${!empty __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.RECOBROS}">
                                       <axis:visible f="axissin006" c="BT_SIN_NUEVO_MOV_PAGO"> <!-- IAXIS-4887 -->
                                        <div style="float:right;" id="BT_SIN_NUEVO_MOV_PAGO"> <!-- IAXIS-4887 -->
                                           <a href="javascript:f_abrir_modal('axissin013',null,'&&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+document.miForm.NTRAMIT.value+'&CTIPPAG=7&SIDEPAGRECOB='+document.miForm.SIDEPAGRECOB.value+'&indexPago='+'${__formdata.indexRecobro}'+'&CCAUSIN=${__formdata.OB_IAX_SINIESTRO.CCAUSIN}'+'&CMOTSIN=${__formdata.OB_IAX_SINIESTRO.CMOTSIN}');">
                                        <img border="0" alt="<axis:alt f="axissin006" c="TTITULO" lit="9000984"/>" title="<axis:alt f="axissin006" c="TTITULO2" lit="9000984"/>" src="images/new.gif"/></a>
                                    </div>
                                    </axis:visible>
                                    </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                       <!-- TABLA SECCION  RECOBROS TRAMITACION : MOVIMIENTOS RECOBROS-->
                                                                             
                                            
                                            <c:set var="title1"><axis:alt f="axissin006" c="NUMERO2" lit="100899" /></c:set><!--Numero-->
                                            <c:set var="title2"><axis:alt f="axissin006" c="ESTADO2" lit="100587" /></c:set><!--Estado-->
                                            <c:set var="title3"><axis:alt f="axissin006" c="FFECTO2" lit="9906065" /></c:set><!--F Efecto -->
                                            <c:set var="title4"><axis:alt f="axissin006" c="ESTVALIDACION" lit="9000948" /></c:set><!-- Estado Validacion -->
                                            <c:set var="title5"><axis:alt f="axissin006" c="FCONTAB" lit="1000575" /></c:set><!-- F Contabilidad -->
                                            <c:set var="title6"><axis:alt f="axissin006" c="FALTA_RECOBRO" lit="101006" /></c:set><!-- F Movimiento -->
                                            <c:set var="title8"><axis:alt f="axissin006" c="CUSUALT" lit="100894" /></c:set><!-- Usuario -->
                                            <c:set var="num_tramitacion">0</c:set>
                                            <c:set var="num_tram_recob">0</c:set>
                                            
                                            <div class="displayspace">
                                               <display:table name="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.RECOBROS[__formdata.indexRecobro].OB_IAX_SIN_TRAMI_PAGO.MOVPAGOS}" id="T_IAX_TRAM_MOVRECOB" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="">
                                               <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title1}" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspNumber">${T_IAX_TRAM_MOVRECOB.OB_IAX_SIN_TRAMI_MOVPAGO.NMOVPAG}</div>
                                                </display:column>
                                                <display:column title="${title2}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"> ${T_IAX_TRAM_MOVRECOB.OB_IAX_SIN_TRAMI_MOVPAGO.TESTPAG}</div>    
                                                </display:column>
                                                <display:column title="${title3}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_MOVRECOB.OB_IAX_SIN_TRAMI_MOVPAGO.FEFEPAG}"/></div>    
                                                </display:column>
                                                <display:column title="${title4}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_MOVRECOB.OB_IAX_SIN_TRAMI_MOVPAGO.TESTVAL}</div>    
                                                </display:column>
                                                <display:column title="${title5}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_MOVRECOB.OB_IAX_SIN_TRAMI_MOVPAGO.FCONTAB}"/></div>    
                                                </display:column>
                                                <axis:visible f="axissin006" c="FALTA_RECOBRO">
                                                    <display:column title="${title6}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                         <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_MOVRECOB.OB_IAX_SIN_TRAMI_MOVPAGO.FALTA}"/></div>    
                                                    </display:column>
                                                </axis:visible>  
                                                <axis:visible f="axissin006" c="CUSUALT_MOVPAGO">
                                                    <display:column title="${title8}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                         <div class="dspText">${T_IAX_TRAM_MOVRECOB.OB_IAX_SIN_TRAMI_MOVPAGO.CUSUALT}</div>   
                                                    </display:column>
                                                </axis:visible>   
                                            </display:table>
                                            </div>
                                        <!-- FIN MOVIMIENTOS TRAMITACION -->
                                    </td>
                                </tr>            
                                <tr>
                                    <td class="campocaja">
                                    <div style="float:left;">
                                        <b><axis:alt f="axissin006" c="DETALLERECOB" lit="9000949"/></b>
                                    </div>
                                    <c:set var="numeroRegistros" value="${fn:length(__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.RECOBROS[__formdata.indexRecobro].OB_IAX_SIN_TRAMI_PAGO.MOVPAGOS)}" />
                                    <c:set var="estadorecobro" value="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.RECOBROS[__formdata.indexRecobro].OB_IAX_SIN_TRAMI_PAGO.MOVPAGOS[numeroRegistros-1].OB_IAX_SIN_TRAMI_MOVPAGO.CESTPAG}" />
                                    
                                    <div style="float:right;">
                                    <c:if test="${!empty __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.RECOBROS}">
                                    <c:if test="${estadorecobro==0}">
                                    <axis:visible f="axissin006" c="BT_SIN_NUEVO_RECO"> <!-- IAXIS-4887 -->                                    
                                    <div id="BT_SIN_NUEVO_RECO"><!-- IAXIS-4887 -->    
                                        <a href="javascript:f_abrir_modal('axissin014',null,'&isNew=yes&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+document.miForm.NTRAMIT.value+'&CTIPPAG=7&SIDEPAGRECOB='+document.miForm.SIDEPAGRECOB.value+'&indexPago='+'${__formdata.indexPago}'+'&SECCION=recobros'+'&CTIPGAS='+'${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.RESERVA.CTIPGAS}');">
                                            <img border="0" alt="<axis:alt f="axissin006" c="TITULO8" lit="9000985"/>" title="<axis:alt f="axissin006" c="TITULO9" lit="9000985"/>" src="images/new.gif"/></a>
                                    </div>
                                    </axis:visible>
                                    </c:if>
                                    </c:if>
                                    </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <!-- TABLA SECCION  RECOBROS TRAMITACION : DETALLE POR RESERVA-->
                                                                             
                                            <c:set var="title0"><axis:alt f="axissin006" c="TIPO_DETALLE" lit="100565" /></c:set><!--Tipo -->
                                            <c:set var="title1"><axis:alt f="axissin006" c="GAR_DETALLE" lit="110994" /></c:set><!--Garantia-->
                                            <c:set var="title2"><axis:alt f="axissin006" c="FINICIO_DETALLE" lit="9000526" /></c:set><!--Finicio-->
                                            <c:set var="title3"><axis:alt f="axissin006" c="FFINF_DETALLE" lit="9000527" /></c:set><!--FFin -->
                                            <c:set var="title4"><axis:alt f="axissin006" c="IBRUTO_DETALLE" lit="9000939" /></c:set><!-- Importe Bruto -->
                                            <c:set var="title5"><axis:alt f="axissin006" c="IIVA_DETALLE" lit="101340" /></c:set><!-- Importe IVA -->
                                            <c:set var="title6"><axis:alt f="axissin006" c="IRETENC_DETALLE" lit="9001030" /></c:set><!-- Retencion -->
                                            <c:set var="title7"><axis:alt f="axissin006" c="IFRAN_DETALLE" lit="9000940" /></c:set><!-- Franquicia -->
                                            <c:set var="title8"><axis:alt f="axissin006" c="EDITAR_DETALLE" lit="100002" /></c:set><!--Editar-->
                                            <c:set var="title9"><axis:alt f="axissin006" c="ELIMINAR_DETALLE" lit="1000127"/></c:set><!--Eliminar-->
                                            <c:set var="title11"><axis:alt f="axissin006" c="CONCEPTO_DETALLE" lit="100896"/></c:set><!--Concepto-->
                                            <c:set var="title12"><axis:alt f="axissin006" c="ORDEN_DETALLE" lit="500102"/></c:set><!--Orden-->
                                            <c:set var="num_tramitacion">0</c:set>
                                            <c:set var="num_tram_recob">0</c:set>
                                            
                                            <div class="displayspace">
                                              <display:table name="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.RECOBROS[__formdata.indexRecobro].OB_IAX_SIN_TRAMI_PAGO.PAGOGAR}" id="T_IAX_TRAM_PAGOGAR" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
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
                                                <display:column title="${title2}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.FPERINI}"/></div>    
                                                </display:column>
                                                <display:column title="${title3}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.FPERFIN}"/></div>    
                                                </display:column>
                                                <display:column title="${title4}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.ISINRET}"/></div> 
                                                </display:column>
                                                <display:column title="${title5}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.IIVA}"/></div> 
                                                </display:column>
                                                <display:column title="${title6}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.IRETENC}"/></div> 
                                                </display:column>
                                                <display:column title="${title7}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.IFRANQ}"/></div> 
                                                </display:column>
                                                <axis:visible f="axissin006" c="CCONPAG">
                                                    <display:column title="${title11}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                         <div class="dspText">${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.TCONPAG}</div>    
                                                    </display:column>
                                                </axis:visible>
                                                <c:if test="${1==2}">
                                                <axis:visible f="axissin006" c="BT_SIN_EDITAR_TRAM_REC_DET"> 
                                                <display:column title="${title8}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                    <c:if test="${estadorecobro==0}">
                                                    <div class="dspIcons" id="BT_SIN_EDITAR_TRAM_REC_DET"><img border="0" alt="<axis:alt f="axissin006" c="EDITAR_DETALLE" lit="100002"/>" title1="<axis:alt f="axissin006" c="EDITAR2_DETALLE" lit="100002"/>" src="images/lapiz.gif" width="15px" height="15px"
                                                    style="cursor:pointer;" onclick="javascript:f_abrir_modal('axissin014',null,'&isNew=no&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+document.miForm.NTRAMIT.value+'&CTIPPAG=7&SIDEPAG='+document.miForm.SIDEPAG.value+'&indexPago='+'${__formdata.indexPago}'+'&NMOVRES='+'${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.RESERVA.NMOVRES}'+'&CTIPRES='+'${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.RESERVA.CTIPRES}'+'&SECCION=recobros'+'&CTIPGAS='+'${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.RESERVA.CTIPGAS}');">
                                                    </div>
                                                    </c:if>
                                                
                                                </display:column>
                                                </axis:visible> 
                                                </c:if>
                                                <axis:visible f="axissin006" c="BT_SIN_DELETE_TRAM_REC_DET"> 
                                                <display:column title="${title9}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                    <c:if test="${estadorecobro==0}">
                                                    <div class="dspIcons" id="BT_SIN_DELETE_TRAM_REC_DET"><img border="0" alt="<axis:alt f="axissin006" c="ELIMINAR_DETALLE" lit="1000127"/>" title1="<axis:alt f="axissin006" c="ELIMINAR2_DETALLE" lit="1000127"/>" src="images/delete.gif" width="15px" height="15px"
                                                    style="cursor:pointer;" onclick="f_borrar_detallepago('7','${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.RESERVA.CTIPRES}','${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.RESERVA.CGARANT}','${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.RESERVA.NMOVRES}','${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.SIDEPAG}');"/></div>
                                                    </c:if>
                                                </display:column>   
                                                </axis:visible>
                                                
                                              </display:table>
                                            </div>
                                        <!-- FIN  -->
                                    </td>
                                </tr>                
                                             
                            
                                <!-- Fin seccion -->
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </axis:visible>
                        
            
            <axis:visible f="axissin006" c="DSP_RECOBROS_OFI">    
                <div ID="DSP_RECOBROS_OFI">
            <!-- TABLA SECCION  RECOBROS TRAMITACION : RECOBROS CABECERA-->
                        <c:set var="title0"><axis:alt f="axissin006" c="NUMERO_RECOBRO" lit="800440" /></c:set><!--Numero -->
                        <c:set var="title1"><axis:alt f="axissin006" c="TIPO_RECOBRO" lit="100565" /></c:set><!--Tipo-->
                        <c:set var="title2"><axis:alt f="axissin006" c="CONCEPTO_RECOBRO" lit="9000715" /></c:set><!--Concepto-->
                        <c:set var="title3"><axis:alt f="axissin006" c="DESTINA_RECOBRO" lit="9000909" /></c:set><!--Destinatario -->
                        <c:set var="title4"><axis:alt f="axissin006" c="FPAGO_RECOBRO" lit="100712" /></c:set><!-- Forma Pago -->
                        <c:set var="title5"><axis:alt f="axissin006" c="FORDEN_RECOBRO" lit="9000910" /></c:set><!-- Fecha orden -->
                        <c:set var="title6"><axis:alt f="axissin006" c="NFACTURA_RECOBRO" lit="9000445" /></c:set><!-- num. factura -->
                        <c:set var="title7"><axis:alt f="axissin006" c="FFACTURA_RECOBRO" lit="9000451" /></c:set><!-- fecha factura -->
                        <c:set var="title8"><axis:alt f="axissin006" c="IBRUTO_RECOBRO" lit="9000938" /></c:set><!--Importe Bruto-->
                        <c:set var="title9"><axis:alt f="axissin006" c="MINFO_RECOBRO" lit="1000113" /></c:set><!--  más informacion-->
                        <c:set var="title10"><axis:alt f="axissin006" c="EDITAR_RECOBRO" lit="100002" /></c:set><!--  Editar-->
                        <c:set var="num_tramitacion">0</c:set>
                        <c:set var="num_tram_recob">0</c:set>
                        <div class="displayspace">
                        <%int i = 0;%>
                          <display:table name="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.RECOBROS_OFI}" id="T_IAX_TRAM_PAGOS" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                           requestURI="">
                           <c:set var="i"><%=i%></c:set>
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                               <div class="dspIcons"><input  onClick="javascript:f_getRecobro_ofi('${i}','${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.SIDEPAG}')" 
                               <c:if test="${__formdata.indexRecobro_ofi == i }"> checked </c:if>
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
                                 <div class="dspText">${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.TTIPDES}</div>    
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
                                 <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.ISINRET}"/></div>    
                            </display:column>
                            <axis:visible f="axissin006" c="BT_SIN_EDITAR_CAB_RECOB">
                                <display:column title="${title10}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                    <c:if test="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.MOVPAGOS[fn:length(T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.MOVPAGOS)-1].OB_IAX_SIN_TRAMI_MOVPAGO.CESTPAG==0}">
                                        <div class="dspIcons" id="BT_SIN_EDITAR_CAB_RECOB"><img border="0" alt="<axis:alt f="axissin006" c="DETALLE2_RECOBRO" lit="1000113"/>" title1="<axis:alt f="axissin006" c="EDITAR2_RECOBRO" lit="1000113"/>" src="images/lapiz.gif" width="16px" height="16px"
                                        style="cursor:pointer;" onClick="javascript:f_abrir_modal('axissin012',null,'&SPRODUC='+document.miForm.SPRODUC.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+document.miForm.NTRAMIT.value+'&CTIPPAG=2&isNew=no'+'&SIDEPAG='+${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.SIDEPAG}+'&CTRAMIT='+document.miForm.CTRAMIT.value+'&CCAUSIN='+document.miForm.CCAUSIN.value+'&CMOTSIN='+document.miForm.CMOTSIN.value );" /></div>
                                    </c:if>
                                </display:column>
                            </axis:visible>
                            <display:column title="${title9}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                <div class="dspIcons"><img border="0" alt="<axis:alt f="axissin006" c="EDITAR3_RECOBRO" lit="1000113"/>" title1="<axis:alt f="axissin006" c="EDITAR4_RECOBRO" lit="1000113"/>" src="images/mas.gif" width="11px" height="11px"
                                style="cursor:pointer;" onmouseout="javascript:ocultar('SECCION_C${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.SIDEPAG}')" onmouseover="javascript:mostrar('SECCION_C${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.SIDEPAG}')" /></div>
                            </display:column>
                            
                            
                            
                            <!-- *************************** SECCION M�?S DATOS ********************************* -->     
                            <display:column class="seccion_informacion">
                            		<!-- Changes for IAXIS-4663 PK-02/07/2019 Start -->
	                               <div id="SECCION_C${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.SIDEPAG}" style="height:335px" class="seccion_informacion">
                                    <!-- Changes for IAXIS-4663 PK-02/07/2019 End -->
                                            <!-- INICIO SECCION -->
                                            <table class="area" align="center">
                                                <tr>
                                                   <th style="width:25%;height:0px"></th>
                                                   <th style="width:25%;height:0px"></th>
                                                   <th style="width:25%;height:0px"></th>
                                                   <th style="width:25%;height:0px"></th>
                                                </tr>
                                                <tr>
                                                    <%-- Tipo destinatario --%>
                                                    <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                        <b><axis:alt f="axissin006" c="TDESTIN_MASDATOS" lit="9001213"/></b>
                                                    </td>
                                                    <%-- Nombre destinatario --%>
                                                     <td class="titulocaja" colspan="2" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >
                                                        <b><axis:alt f="axissin006" c="NOMBRE_MASDATOS" lit="9001214"/></b>
                                                    </td>                   
                                                     <%-- Causa indemnizacion --%>
                                                     <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                        <b><axis:alt f="axissin006" c="CAUSA_MASDATOS" lit="9001199"/></b>
                                                    </td> 

                                                </tr>
                                                <tr>
                                                     <%-- Tipo destinatario --%>
                                                   <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                        <input type="text" class="campo campotexto" id="CAMPO1" name="CAMPO1" size="15" style="width:90%"
                                                        value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.TTIPDES}"   
                                                        readonly="readonly"/>
                                                    </td>
                                                     <%-- Nombre destinatario --%>
                                                    <td colspan="2" class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                        <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:100%"
                                                        value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.DESTINATARI.TNOMBRE} ${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.DESTINATARI.TAPELLI1} ${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.DESTINATARI.TAPELLI2}"
                                                        readonly="readonly"/>
                                                    </td>
                                                    <%-- Causa indemnizacion --%>
                                                    <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                        <input type="text" class="campo campotexto" id="CAMPO3" name="CAMPO3" size="15" style="width:90%"
                                                        value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.TCAUIND}" readonly="readonly"/>
                                                    </td>
      
                                                </tr>
                                                <tr>
                                                    <%-- Tipo Cuenta --%>
                                                    <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                        <b><axis:alt f="axissin006" c="TIPO_CUENTA_MASDATOS" lit="9001200"/></b>
                                                    </td>
                                                
                                                    <%-- Nº Cuenta bancaria --%>
                                                    <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                        <b><axis:alt f="axissin006" c="NCUENTA_MASDATOS" lit="100878"/></b>
                                                    </td>
                                                    <%-- % Retencion --%>
                                                     <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >
                                                        <b><axis:alt f="axissin006" c="PRETENC_MASDATOS" lit="101714"/></b>
                                                    </td>                                                  
                                                     <%-- Imp. Retenció --%>
                                                     <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                        <b><axis:alt f="axissin006" c="IRETENC_MASDATOS" lit="9001030"/></b>
                                                    </td> 

                                                </tr>
                                                <tr>
                                                    <%-- Tipo Cuenta --%>
                                                    <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                        <input type="text" class="campo campotexto" id="CAMPO4" name="CAMPO4" size="15" style="width:90%"
                                                        value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.TTIPBAN}" readonly="readonly"/>
                                                    </td>
                                                     <%-- Nº Cuenta bancaria --%>
                                                    <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                        <input type="text" class="campo campotexto" id="CAMPO1" name="CAMPO1" size="15" style="width:90%"
                                                        value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.CBANCAR}" readonly="readonly"/>
                                                    </td>
                                                     <%-- % Retencion --%>
                                                    <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                        <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"
                                                        value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.PRETENC}" readonly="readonly"/>
                                                    </td>
                                                    <%-- Imp. Retenció --%>
                                                    <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                        <input type="text" class="campo campotexto" id="CAMPO3" name="CAMPO3" size="15" style="width:90%"
                                                        value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.IRETENC}"/>" readonly="readonly"/>
                                                    </td>
                                                                                     
                                                </tr>
                                                 <tr>
                                                    <%-- I. IVA --%>
                                                    <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                        <b><axis:alt f="axissin006" c="IIVA_MASDATOS" lit="101340"/></b>
                                                    </td>
                                                    <%-- Imp. SUplit --%>
                                                    <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                        <b><axis:alt f="axissin006" c="ISUPLIT_MASDATOS" lit="9001201"/></b>
                                                    </td>
                                                    <%-- Imp. Franquicia --%>
                                                     <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >
                                                        <b><axis:alt f="axissin006" c="IFRANQ_MASDATOS" lit="9001215"/></b>
                                                    </td>                                                  
                                                    
                                                </tr>
                                                <tr>
                                                	<%-- I. IVA --%>
                                                    <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                        <input type="text" class="campo campotexto" id="CAMPO4" name="CAMPO4" size="15" style="width:90%"
                                                        value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.IIVA}"/>" readonly="readonly"/>
                                                    </td>  
                                                     <%-- Imp. SUplit --%>
                                                    <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                        <input type="text" class="campo campotexto" id="CAMPO1" name="CAMPO1" size="15" style="width:90%"
                                                        value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.ISUPLID}"/>" readonly="readonly"/>
                                                    </td>
                                                     <%-- Imp. Franquicia --%>
                                                    <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                        <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"
                                                        value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.IFRANQ}"/>" readonly="readonly"/>
                                                    </td>
                                                                                  
                                                </tr>
                                                <tr>
                                                 	<%-- Rend, Capital Mobiliario --%>
                                                    <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                        <b><axis:alt f="axissin006" c="IRESRCM_MASDATOS" lit="9001202"/></b>
                                                    </td> 
                                                    <%-- Rendimiento Reducido --%>
                                                    <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                        <b><axis:alt f="axissin006" c="IRESRED_MASDATOS" lit="9001203"/></b>
                                                    </td>
                                                    <!-- Changes for IAXIS-4663 PK-02/07/2019 Start -->
                                                    <%-- ISINRETPAG --%>
                                                    <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                        <b><axis:alt f="axissin006" c="IRESRED_ISINRETPAG" lit="89906337"/></b>
                                                    </td>
                                                    <!-- Changes for IAXIS-4663 PK-02/07/2019 End -->
                                                </tr>
                                                <tr>
                                                 	<%-- I Rendimiento capital mobiliario --%>
                                                    <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                        <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"
                                                        value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.IRESRCM}"/>" readonly="readonly"/>
                                                    </td>
                                                     <%-- I. Rendimiento reducido --%>
                                                    <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                        <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"
                                                        value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.IRESRED}"/>" readonly="readonly"/>
                                                    </td> 
                                                    <!-- Changes for IAXIS-4663 PK-02/07/2019 Start -->
                                                    <%-- ISINRETPAG --%>
                                                   <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                       <input type="text" class="campo campotexto" id="CAMPO5" name="CAMPO5" size="15" style="width:90%"
                                                       value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" 
                                                       value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.ISINRETPAG}"/>" readonly="readonly"/>
                                                   </td>  
                                                   <!-- Changes for IAXIS-4663 PK-02/07/2019 End -->
                                                </tr>
                                                <!-- Changes for IAXIS-4663 PK-02/07/2019 Start -->
                                                <tr>
                                                	<%-- TOBSERVA --%>
                                                    <td colspan="4" class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                        <b><axis:alt f="axissin006" c="IRESRED_TOBSERVA" lit="101162"/></b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                	<%-- TOBSERVA --%>
                                                   <td colspan="4" class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                       <%-- <input type="text" class="campo campotexto" id="CAMPO5" name="CAMPO5" size="15" style="width:99%;height:10px;"
                                                       value="${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.TOBSERVA}" readonly="readonly"/> --%>
                                                       <textarea name="CAMPO5" id="CAMPO5" class="campo campotexto" rows="3" cols="90"
															readonly="readonly">${T_IAX_TRAM_PAGOS.OB_IAX_SIN_TRAMI_PAGO.TOBSERVA}</textarea>
                                                   </td>
                                                </tr>
                                                <!-- Changes for IAXIS-4663 PK-02/07/2019 End -->
                                            </table>
                                        </div>
	                           </display:column>
	               
	                       <!-- *************************** SECCION M�?S DATOS ********************************* -->   
                            
                            
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
                                <!-- Inicio Seccion -->
                                <tr>
                                    <td>
                                    <div style="float:left;">
                                        <b><axis:alt f="axissin006" c="MOVIMENTS_MASDATOS" lit="100913"/></b>
                                    </div>
                                    <div style="float:right;">
                                    <c:if test="${!empty __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.RECOBROS_OFI}">
                                       <axis:visible f="axissin006" c="BT_SIN_NUEVO"> 
                                        <div style="float:right;" id="BT_SIN_NUEVO">
                                           <a href="javascript:f_abrir_modal('axissin013',null,'&&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+document.miForm.NTRAMIT.value+'&CTIPPAG=7&SIDEPAGRECOB='+document.miForm.SIDEPAGRECOB_OFI.value+'&indexPago='+'${__formdata.indexRecobro_ofi}');">
                                        <img border="0" alt="<axis:alt f="axissin006" c="TTITULO_MADATOS" lit="9000984"/>" title="<axis:alt f="axissin006" c="TTITULO2_MASDATOS" lit="9000984"/>" src="images/new.gif"/></a>
                                    </div>
                                    </axis:visible>
                                    </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                       <!-- TABLA SECCION  RECOBROS TRAMITACION : MOVIMIENTOS RECOBROS-->
                                                                             
                                            
                                            <c:set var="title1"><axis:alt f="axissin006" c="NUMERO_RECOB" lit="100899" /></c:set><!--Numero-->
                                            <c:set var="title2"><axis:alt f="axissin006" c="ESTADO_RECOB" lit="100587" /></c:set><!--Estado-->
                                            <c:set var="title3"><axis:alt f="axissin006" c="FEFECTO_RECOB" lit="100883" /></c:set><!--F Efecto -->
                                            <c:set var="title4"><axis:alt f="axissin006" c="ESTADOVAL_RECOB" lit="9000948" /></c:set><!-- Estado Validacion -->
                                            <c:set var="title5"><axis:alt f="axissin006" c="FCONTA_RECOB" lit="1000575" /></c:set><!-- F Contabilidad -->
                                            <c:set var="num_tramitacion">0</c:set>
                                            <c:set var="num_tram_recob">0</c:set>
                                            
                                            <div class="displayspace">
                                               <display:table name="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.RECOBROS_OFI[__formdata.indexRecobro_ofi].OB_IAX_SIN_TRAMI_PAGO.MOVPAGOS}" id="T_IAX_TRAM_MOVRECOB" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="">
                                               <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title1}" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspNumber">${T_IAX_TRAM_MOVRECOB.OB_IAX_SIN_TRAMI_MOVPAGO.NMOVPAG}</div>
                                                </display:column>
                                                <display:column title="${title2}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"> ${T_IAX_TRAM_MOVRECOB.OB_IAX_SIN_TRAMI_MOVPAGO.TESTPAG}</div>    
                                                </display:column>
                                                <display:column title="${title3}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_MOVRECOB.OB_IAX_SIN_TRAMI_MOVPAGO.FEFEPAG}"/></div>    
                                                </display:column>
                                                <display:column title="${title4}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_MOVRECOB.OB_IAX_SIN_TRAMI_MOVPAGO.TESTVAL}</div>    
                                                </display:column>
                                                <display:column title="${title5}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_MOVRECOB.OB_IAX_SIN_TRAMI_MOVPAGO.FCONTAB}"/></div>    
                                                </display:column>
                                                     
                                            </display:table>
                                            </div>
                                        <!-- FIN MOVIMIENTOS TRAMITACION -->
                                    </td>
                                </tr>            
                                <tr>
                                    <td>
                                    <div style="float:left;">
                                        <b><axis:alt f="axissin006" c="DETALLE_RESERVA_RECOB" lit="9000949"/></b>
                                    </div>
                                    
                                    <div style="float:right;">
                                    <c:if test="${!empty __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.RECOBROS_OFI}">
                                    <axis:visible f="axissin006" c="BT_SIN_NUEVO"> 
                                    <div id="BT_SIN_NUEVO">
                                          <a href="javascript:f_abrir_modal('axissin014',null,'&isNew=yes&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+document.miForm.NTRAMIT.value+'&CTIPPAG=7&SIDEPAGRECOB='+document.miForm.SIDEPAGRECOB_OFI.value+'&indexPago='+'${__formdata.indexPago}'+'&SECCION=recobros'+'&CTIPGAS='+'${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.RESERVA.CTIPGAS}');">
                                            <img border="0" alt="<axis:alt f="axissin006" c="TITULO1_RECOB" lit="9000985"/>" title="<axis:alt f="axissin006" c="TITULO2_RECOB" lit="9000985"/>" src="images/new.gif"/></a>
                                    </div>
                                    </axis:visible>
                                    </c:if>
                                    </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <!-- TABLA SECCION  RECOBROS TRAMITACION : DETALLE POR RESERVA-->
                                                                             
                                            <c:set var="title0"><axis:alt f="axissin006" c="TIPO_DETALLE_RESERVA" lit="100565" /></c:set><!--Tipo -->
                                            <c:set var="title1"><axis:alt f="axissin006" c="GAR_DETALLE_RESERVA" lit="110994" /></c:set><!--Garantia-->
                                            <c:set var="title2"><axis:alt f="axissin006" c="FINICIO_DETALLE_RESERVA" lit="9000526" /></c:set><!--Finicio-->
                                            <c:set var="title3"><axis:alt f="axissin006" c="FFIN_DETALLE_RESERVA" lit="9000527" /></c:set><!--FFin -->
                                            <c:set var="title4"><axis:alt f="axissin006" c="IBRUTO_DETALLE_RESERVA" lit="9000939" /></c:set><!-- Importe Bruto -->
                                            <c:set var="title5"><axis:alt f="axissin006" c="IIVA_DETALLE_RESERVA" lit="101340" /></c:set><!-- Importe IVA -->
                                            <c:set var="title6"><axis:alt f="axissin006" c="IRETENC_DETALLE_RESERVA" lit="9001030" /></c:set><!-- Retencion -->
                                            <c:set var="title7"><axis:alt f="axissin006" c="IFRANQ_DETALLE_RESERVA" lit="9000940" /></c:set><!-- Franquicia -->
                                            <c:set var="title8"><axis:alt f="axissin006" c="EDITAR_DETALLE_RESERVA" lit="100002" /></c:set><!--Editar-->
                                            <c:set var="title9"><axis:alt f="axissin006" c="ELIMINAR_DETALLE_RESERVA" lit="1000127"/></c:set><!--Eliminar-->
                                            <c:set var="num_tramitacion">0</c:set>
                                            <c:set var="num_tram_recob">0</c:set>
                                            
                                            <div class="displayspace">
                                              <display:table name="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.RECOBROS_OFI[__formdata.indexRecobro_ofi].OB_IAX_SIN_TRAMI_PAGO.PAGOGAR}" id="T_IAX_TRAM_PAGOGAR" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title0}" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspNumber">${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.RESERVA.TTIPRES}</div>
                                                </display:column>
                                                <display:column title="${title1}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.RESERVA.TGARANT}</div>    
                                                </display:column>
                                                <display:column title="${title2}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.FPERINI}"/></div>    
                                                </display:column>
                                                <display:column title="${title3}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.FPERFIN}"/></div>    
                                                </display:column>
                                                <display:column title="${title4}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.ISINRET}"/></div> 
                                                </display:column>
                                                <display:column title="${title5}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.IIVA}"/></div> 
                                                </display:column>
                                                <display:column title="${title6}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.IRETENC}"/></div> 
                                                </display:column>
                                                <display:column title="${title7}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.IFRANQ}"/></div> 
                                                </display:column>
                                                <c:if test="${1==2}">
                                                <axis:visible f="axissin006" c="BT_SIN_EDITAR_TRAM_REC_DET"> 
                                                <display:column title="${title8}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                
                                                    <div class="dspIcons" id="BT_SIN_EDITAR_TRAM_REC_DET"><img border="0" alt="<axis:alt f="axissin006" c="EDITAR_DETALLE_RESERVA" lit="100002"/>" title1="<axis:alt f="axissin006" c="EDITAR2_DETALLE_RESERVA" lit="100002"/>" src="images/lapiz.gif" width="15px" height="15px"
                                                    style="cursor:pointer;" onclick="javascript:f_abrir_modal('axissin014',null,'&isNew=no&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NRAMIT='+'${__formdata.indexTramitacio}'+'&CTIPPAG=7&SIDEPAG='+document.miForm.SIDEPAG.value+'&indexPago='+'${__formdata.indexPago}'+'&NMOVRES='+'${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.RESERVA.NMOVRES}'+'&CTIPRES='+'${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.RESERVA.CTIPRES}'+'&SECCION=recobros'+'&NORDEN='+'${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.NORDEN}'+'&CTIPGAS='+'${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.RESERVA.CTIPGAS}');">
                                                    </div>
                                                
                                                </display:column>
                                                </axis:visible> 
                                                <axis:visible f="axissin006" c="BT_SIN_DELETE_TRAM_REC_DET"> 
                                                <display:column title="${title9}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                    <div class="dspIcons" id="BT_SIN_DELETE_TRAM_REC_DET"><img border="0" alt="<axis:alt f="axissin006" c="ELIMINAR_DETALLE_RESERVA" lit="1000127"/>" title1="<axis:alt f="axissin006" c="ELIMINAR2_DETALLE_RESERVA" lit="1000127"/>" src="images/delete.gif" width="15px" height="15px"
                                                    style="cursor:pointer;" onclick="f_borrar_detallepago('7','${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.RESERVA.CTIPRES}','${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.RESERVA.CGARANT}','${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.RESERVA.NMOVRES}','${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.SIDEPAG}','${T_IAX_TRAM_PAGOGAR.OB_IAX_SIN_TRAMI_PAGO_GAR.NORDEN}');"/></div>
                                                </display:column>   
                                                </axis:visible>
                                                </c:if>
                                              </display:table>
                                            </div>
                                        <!-- FIN  -->
                                    </td>
                                </tr>                
                                             
                            
                                <!-- Fin seccion -->
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </axis:visible>
</form>