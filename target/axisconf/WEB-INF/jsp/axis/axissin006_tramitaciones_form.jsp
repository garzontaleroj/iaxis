<%/* Revision:# OCcSp9fO4AFLvAi9QNX8xw== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<table class="area" align="center">
    <!-- Espacio cabecera -->
    <!--tr>
        <th style="height:0px">
            &nbsp;                    
        </th>
    </tr-->
    <axis:visible f="axissin006" c="TRAMITES">
    <tr>
        <td class="campocaja">
                <table>
                   
                    
                    <tr>
                        <td class="campocaja">
                                <div style="float:left;">
                                    <b><axis:alt f="axissin006" c="TRAMITES" lit="9901991"/></b>
                                </div>
                                 <div style="float:right;" id="BT_SIN_NUEVO_TRAMITE">  <!-- LCF Bug22108 cambio BT_SIN_NUEVO_TRAMITE por BT_SIN_NUEVO_TRAMIT-->
                                    <axis:visible f="axissin006" c="BT_SIN_NUEVO_TRAMITE">
                                        <a href="javascript:f_abrir_modal('axissin042',null,'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&SPRODUC='+document.miForm.SPRODUC.value+'&NSINIES='+document.miForm.NSINIES.value+'&FSINIES='+document.miForm.FSINIES.value+'&CCAUSIN='+document.miForm.CCAUSIN.value+'&CMOTSIN='+document.miForm.CMOTSIN.value+'&NRIESGO='+document.miForm.NRIESGO.value+'&MODO=nuevo'+'&CTRAMTE=${__formdata.CTRAMTE}');">
                                        <img border="0" alt="<axis:alt f="axissin006" c="TRAMITES" lit="9901991"/>" title="<axis:alt f="axissin006" c="TRAMITES" lit="9901991"/>" src="images/new.gif"/>
                                        </a>
                                    </axis:visible>
                                </div>
                        </td>

                    </tr>
                    <tr>
                        <td align="left" style="width:40%">
                            <div style="float:left;width:100%">
                            <jsp:include page="axissin006_datossiniestros_tramites_general.jsp"/>
                            </div>
                        </td>
                    </tr>
                </table>

    
    </axis:visible>
    <axis:visible f="axissin006" c="TRAMITACION">
    <axis:visible f="axissin006" c="DSP_TRAMIT_GENERAL">

    <!-- Tramitaciones General -->
    <tr>
        <td class="campocaja">
            <div style="float:left;">
                <b><axis:alt f="axissin006" c="TRAMITACION_GENERAL" lit="103593"/></b>
            </div>
             <div style="float:right;" id="BT_SIN_NUEVO_TRAM">  <!-- LCF Bug22108 cambio BT_SIN_NUEVO_TRAMITE por BT_SIN_NUEVO_TRAMIT-->
                <axis:visible f="axissin006" c="BT_SIN_NUEVO_TRAM">
                    <a href="javascript:f_abrir_modal('axissin007',null,'&SPRODUC='+document.miForm.SPRODUC.value+'&CESTSIN='+document.miForm.CESTSIN.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&NSINIES='+document.miForm.NSINIES.value+'&CCAUSIN='+document.miForm.CCAUSIN.value+'&CMOTSIN='+document.miForm.CMOTSIN.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NRIESGO='+document.miForm.NRIESGO.value+'&NTRAMTE='+document.miForm.NTRAMTE.value+'&CTRAMTE=${__formdata.CTRAMTE}');"><img border="0" alt="<axis:alt f="axissin006" c="LIT_IMG_ADDMOV" lit="9001519"/>" title="<axis:alt f="axissin006" c="LIT_IMG_ADDMOV" lit="9001519"/>" src="images/new.gif"/></a>
                </axis:visible>
            </div>
        </td>
    </tr>
    </axis:visible>

    <tr>
        <td align="left">
            <jsp:include page="axissin006_datossiniestros_tramitaciones_general.jsp"/>
        </td>
    </tr>
  </axis:visible>
    <!-- Tramitaciones gestión -->
    <axis:visible f="axissin006" c="DSP_TRAM_GESTION">
    <tr>
        <td class="campocaja">
            <div style="float:left;">
                <img id="tramitaciones_gestion_parent" src="images/mes.gif"
                     onclick="objEstilos.toggleDisplay('tramitaciones_gestion', this)"
                     style="cursor:pointer"/>
                <b><axis:alt f="axissin006" c="GESTIONES" lit="9902550"/></b> 
            </div>
            <div style="float:right;" id="BT_NUEVA_GESTION">
                <axis:visible f="axissin006" c="BT_NUEVA_GESTION">
                        <img border="0" alt='<axis:alt f="axissin006" c="BT_NUEVA_GESTION" lit="9902550"/>'
                             title='<axis:alt f="axissin006" c="NUEVA_GESTION" lit="9902550"/>'
                             src="images/new.gif" onClick="javascript:f_abrir_modal('axissin045',null,'&NTRAMIT='+document.miForm.NTRAMIT.value+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&SPRODUC='+document.miForm.SPRODUC.value+'&NSINIES='+document.miForm.NSINIES.value+'&FSINIES='+document.miForm.FSINIES.value+'&CCAUSIN='+document.miForm.CCAUSIN.value+'&CMOTSIN='+document.miForm.CMOTSIN.value+'&NRIESGO='+document.miForm.NRIESGO.value+'&SPRODUC='+document.miForm.SPRODUC.value+'&CACTIVI='+document.miForm.CACTIVI.value);"
                             />
                </axis:visible>
            </div>
            <div style="clear:both;">
                 <hr class="titulo">
            </div>
        </td>
    </tr>
    <tr id="tramitaciones_gestion_children" style="display:none">
        <td align="left">
            <jsp:include page="axissin006_datossiniestros_tramitaciones_gestiones.jsp"/>
        </td>
    </tr>

   </axis:visible>
   <!-- Tramitaciones Amparos-->
    <axis:visible f="axissin006" c="DSP_RESEVAS">
    <c:if test="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.CINFORM != 1 && (!empty __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.AMPAROS  || 
                            		(empty __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.AMPAROS && !(sessionScope.CMODO eq 'CONSULTA_SINIESTROS') )) 
                            		&& __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.CTRAMIT == 0 }">                                 	

    <tr>
        <td class="campocaja">
            <div style="float:left;">
                <img id="tramitacionfes_reservas_parent" src="images/mes.gif"
                     onclick="objEstilos.toggleDisplay('tramitaciones_amparos', this)"
                     style="cursor:pointer"/>

                 <c:set var="temp2" value="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.AMPAROS}" />
                                   


                 <c:forEach items="${temp2}" var="item" varStatus="status">
                 
                    <c:set var="AcumuladoPreten" value="${AcumuladoPreten + temp2[status.count-1].OB_IAX_SIN_TRAMI_AMPARO.ITOTRET}"/>
                    <c:set var="AcumuladoAsegurado" value="${AcumuladoAsegurado + temp2[status.count-1].OB_IAX_SIN_TRAMI_AMPARO.ICAPRIE}"/>
                   
                 </c:forEach>                    

               

                <b><axis:alt f="axissin006" c="AMPAROS" lit="9901156"/> </b><axis:alt f="axissin006" c="ITOTRET" lit="9903367" />:&nbsp;&nbsp;<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${AcumuladoPreten}"/>&nbsp;-&nbsp;<axis:alt f="axissin006" c="ICAPRIE" lit="9909990" />:&nbsp;<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${AcumuladoAsegurado}"/>&nbsp;&nbsp;
                
            </div>
            <!-- INI IAXIS-4887 -->
            <div style="float:right;" id="BT_NEW_AMPARO">
            
                <axis:visible f="axissin006" c="BT_NEW_AMPARO">
            <!-- FIN IAXIS-4887 -->
                   <%--<a href="javascript:f_abrir_modal('axissin08880',null,'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&NSINIES='+document.miForm.NSINIES.value);">--%>
                        <img border="0" alt='<axis:alt f="axissin006" c="NUEVA_RESERVA" lit="9000615"/>'
                             title='<axis:alt f="axissin006" c="NUEVA_RESERVA" lit="9901156"/>'
                             src="images/new.gif" onClick="javascript:f_abrir_modal('axissin084',null,'&CTRAMIT='+document.miForm.CTRAMIT.value+'&NTRAMIT='+document.miForm.NTRAMIT.value+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&SPRODUC='+document.miForm.SPRODUC.value+'&NSINIES='+document.miForm.NSINIES.value+'&FSINIES='+document.miForm.FSINIES.value+'&CCAUSIN='+document.miForm.CCAUSIN.value+'&CMOTSIN='+document.miForm.CMOTSIN.value+'&NRIESGO='+document.miForm.NRIESGO.value+'&SPRODUC='+document.miForm.SPRODUC.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&NMOVIMI='+$('#NMOVIMI').val());"
                             />
                <%--    </a>--%> 
                </axis:visible>
                <axis:visible f="axissin006" c="BT_SIN_MASS_RESERVA"><!-- ***lcf123*** -->
                             <img border="0" alt='<axis:alt f="axissin006" c="MASIVA_RESERVA" lit="9903342"/>'
                             title='<axis:alt f="axissin006" c="NUEVA_RESERVA" lit="9903342"/>'
                             src="images/copiar.gif" onClick="javascript:f_abrir_modal('axissin050',null,'&CTRAMIT='+document.miForm.CTRAMIT.value+'&NTRAMIT='+document.miForm.NTRAMIT.value+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&SPRODUC='+document.miForm.SPRODUC.value+'&NSINIES='+document.miForm.NSINIES.value+'&FSINIES='+document.miForm.FSINIES.value+'&CCAUSIN='+document.miForm.CCAUSIN.value+'&CMOTSIN='+document.miForm.CMOTSIN.value+'&NRIESGO='+document.miForm.NRIESGO.value+'&SPRODUC='+document.miForm.SPRODUC.value+'&CACTIVI='+document.miForm.CACTIVI.value);"
                             />
                </axis:visible>
            </div>
            <div style="clear:both;">
                 <hr class="titulo">
            </div>
        </td>
    </tr>
    <tr id="tramitaciones_amparos_children" style="display:none">
        <td align="left">
            <jsp:include page="axissin006_datossiniestros_tramitaciones_amparos.jsp"/>
        </td>
    </tr>
  </c:if>
   </axis:visible>
    <!-- Tramitaciones Reservas-->
    <axis:visible f="axissin006" c="DSP_RESERVAS">
    <c:if test="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.CINFORM != 1 && (!empty __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.RESERVAS  || 
                            		(empty __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.RESERVAS && !(sessionScope.CMODO eq 'CONSULTA_SINIESTROS') )) 
                            		&& __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.CTRAMIT == 0 }">                                 	

    <tr>
        <td class="campocaja">
            <div style="float:left;">
                <img id="tramitacionfes_reservas_parent" src="images/mes.gif"
                     onclick="objEstilos.toggleDisplay('tramitaciones_reservas', this)"
                     style="cursor:pointer"/>

                 <c:set var="temp1" value="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.RESERVAS}" />
                 <c:forEach items="${temp1}" var="item" varStatus="status">
                    <c:set var="AcumuladoDias" value="${AcumuladoDias + temp1[status.count-1].OB_IAX_SIN_TRAMI_RESERVA.NDIAS}"/>
                    <axis:visible c="IRESERVA" f="axissin006">
                     <c:set var="AcumuladoCoste" value="${AcumuladoCoste}"/>

                      <c:set var="AcumuladoReserva" value="${AcumuladoReserva}"/>
                      <c:set var="AcumuladoPago" value="${AcumuladoPago}"/>
                      <c:set var="AcumuladoRecobro" value="${AcumuladoRecobro}"/>                       
                      </axis:visible>   
					  
                      <axis:visible c="IRESERVA_MONCIA" f="axissin006">
                      <c:set var="AcumuladoCoste" value="${AcumuladoCoste + ((temp1[status.count-1].OB_IAX_SIN_TRAMI_RESERVA.IRESERVA_MONCIA + temp1[status.count-1].OB_IAX_SIN_TRAMI_RESERVA.IPAGO_MONCIA + temp1[status.count-1].OB_IAX_SIN_TRAMI_RESERVA.ITOTIMP_MONCIA) - (temp1[status.count-1].OB_IAX_SIN_TRAMI_RESERVA.IINGRESO_MONCIA + temp1[status.count-1].OB_IAX_SIN_TRAMI_RESERVA.IRECOBRO_MONCIA ))}"/>

                      <c:set var="AcumuladoReserva" value="${AcumuladoReserva + temp1[status.count-1].OB_IAX_SIN_TRAMI_RESERVA.IRESERVA_MONCIA}"/>
                      <c:set var="AcumuladoPago" value="${AcumuladoPago + temp1[status.count-1].OB_IAX_SIN_TRAMI_RESERVA.IPAGO_MONCIA}"/>
                      <c:set var="AcumuladoRecobro" value="${AcumuladoRecobro + temp1[status.count-1].OB_IAX_SIN_TRAMI_RESERVA.IRECOBRO_MONCIA}"/>                      
                      </axis:visible>
                 </c:forEach>                    

                <b><axis:alt f="axissin006" c="RESERVAS" lit="9000615"/></b> <axis:alt f="axissin006" c="ICOSTE" lit="9001024" />:&nbsp;&nbsp;<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${AcumuladoCoste}"/>&nbsp;-&nbsp;<axis:alt f="axissin006" c="IRESERVA" lit="9001156" />:&nbsp;<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${AcumuladoReserva}"/>&nbsp;-&nbsp;<axis:alt f="axissin006" c="IPAGO" lit="9000463" />:&nbsp;<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${AcumuladoPago}"/>&nbsp;-&nbsp;<axis:alt f="axissin006" c="IRECOBRO" lit="9900792" />:&nbsp;<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${AcumuladoRecobro}"/><axis:visible f="axissin006" c="N_DIAS_ACUM_PAGO">-&nbsp;<axis:alt f="axissin006" c="NDIAS" lit="9906429" />:&nbsp;<fmt:formatNumber pattern="###,##0" value="${AcumuladoDias}"/></axis:visible>
                
            </div>
            <div style="float:right;" id="BT_SIN_NUEVO_TRAM_RESERVA">
            
                <axis:visible f="axissin006" c="BT_SIN_NUEVO_TRAM_RESERVA">
                   <%--<a href="javascript:f_abrir_modal('axissin010',null,'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&NSINIES='+document.miForm.NSINIES.value);">--%>
                        <img border="0" alt='<axis:alt f="axissin006" c="NUEVA_RESERVA" lit="9000615"/>'
                             title='<axis:alt f="axissin006" c="NUEVA_RESERVA" lit="9000615"/>'
                             src="images/new.gif" onClick="javascript:f_abrir_modal('axissin010',null,'&CTRAMIT='+document.miForm.CTRAMIT.value+'&NTRAMIT='+document.miForm.NTRAMIT.value+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&SPRODUC='+document.miForm.SPRODUC.value+'&NSINIES='+document.miForm.NSINIES.value+'&FSINIES='+document.miForm.FSINIES.value+'&CCAUSIN='+document.miForm.CCAUSIN.value+'&CMOTSIN='+document.miForm.CMOTSIN.value+'&NRIESGO='+document.miForm.NRIESGO.value+'&SPRODUC='+document.miForm.SPRODUC.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&NMOVIMI='+$('#NMOVIMI').val());"
                             />
                <%--    </a>--%>
                </axis:visible>
                <axis:visible f="axissin006" c="BT_SIN_MASS_RESERVA"><!-- ***lcf123*** -->
                             <img border="0" alt='<axis:alt f="axissin006" c="MASIVA_RESERVA" lit="9903342"/>'
                             title='<axis:alt f="axissin006" c="NUEVA_RESERVA" lit="9903342"/>'
                             src="images/copiar.gif" onClick="javascript:f_abrir_modal('axissin050',null,'&CTRAMIT='+document.miForm.CTRAMIT.value+'&NTRAMIT='+document.miForm.NTRAMIT.value+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&SPRODUC='+document.miForm.SPRODUC.value+'&NSINIES='+document.miForm.NSINIES.value+'&FSINIES='+document.miForm.FSINIES.value+'&CCAUSIN='+document.miForm.CCAUSIN.value+'&CMOTSIN='+document.miForm.CMOTSIN.value+'&NRIESGO='+document.miForm.NRIESGO.value+'&SPRODUC='+document.miForm.SPRODUC.value+'&CACTIVI='+document.miForm.CACTIVI.value);"
                             />
                </axis:visible>
            </div>
            <div style="clear:both;">
                 <hr class="titulo">
            </div>
        </td>
    </tr>
    <tr id="tramitaciones_reservas_children" style="display:none">
        <td align="left">
            <jsp:include page="axissin006_datossiniestros_tramitaciones_reservas.jsp"/>
        </td>
    </tr>
  </c:if>
   </axis:visible>
   <axis:visible f="axissin006" c="DSP_DESTINATARIOS">
    <!-- Tramitaciones Destinatarios-->
    <c:if test="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.CINFORM != 1 && (!empty __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.DESTINATARIOS || 
                            		(empty __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.DESTINATARIOS && !(sessionScope.CMODO eq 'CONSULTA_SINIESTROS')) )
                            		&& __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.CTRAMIT == 0}">                                 	
    
    <tr>
        <td class="campocaja">
            <div style="float:left;">
                <img id="tramitaciones_destinatarios_parent"
                     src="images/mes.gif"
                     onclick="objEstilos.toggleDisplay('tramitaciones_destinatarios', this)"
                     style="cursor:pointer"/>


                <!-- <c:set var="temp2" value="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.DESTINATARIOS}" />-->

                <b><axis:alt f="axissin006" c="DESTINATARIOS" lit="9000896"/></b>&nbsp;&nbsp;${temp2[0].OB_IAX_SIN_TRAMI_DESTINATARIO.PERSONA.NNUMIDE} -&nbsp; ${temp2[0].OB_IAX_SIN_TRAMI_DESTINATARIO.PERSONA.TNOMBRE}  ${temp2[0].OB_IAX_SIN_TRAMI_DESTINATARIO.PERSONA.TAPELLI1} ${temp2[0].OB_IAX_SIN_TRAMI_DESTINATARIO.PERSONA.TAPELLI2 }&nbsp;-&nbsp;<axis:alt f="axissin006" c="CTIPDES" lit="100565" />:&nbsp;${temp2[0].OB_IAX_SIN_TRAMI_DESTINATARIO.TTIPDES}

            </div>
            <div style="float:right;" id="BT_SIN_NUEVO_TRAM_DEST">
                <axis:visible f="axissin006" c="BT_SIN_NUEVO_TRAM_DEST">
                    <%--<a href="javascript:f_abrir_modal('axissin011',null,'&isNew=yes&SPRODUC='+document.miForm.SPRODUC.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NRAMIT='+'${__formdata.indexTramitacio}');">--%>
                        <img border="0" alt='<axis:alt f="axissin006" c="NUEVO_DESTINATARIO" lit="9000896"/>'
                             title='<axis:alt f="axissin006" c="NUEVO_DESTINATARIO" lit="9000896"/>'
                             src="images/new.gif" 
                            onClick="javascript:f_abrir_modal('axissin011',null,'&isNew=yes&SPRODUC='+document.miForm.SPRODUC.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+document.miForm.NTRAMIT.value+'&CTRAMIT='+document.miForm.CTRAMIT.value+'&CCAUSIN='+document.miForm.CCAUSIN.value+'&CMOTSIN='+document.miForm.CMOTSIN.value+'&NTRAMIT9999='+document.miForm.NTRAMIT9999.value+'&FSINIES='+document.miForm.FSINIES.value);"
                             /> 
                  <%--  </a>--%>
                </axis:visible>
            </div>
            <div style="clear:both;">
                 <hr class="titulo">
            </div>
        </td>
    </tr>
    <tr id="tramitaciones_destinatarios_children" style="display:none">
        <td align="left">
            <jsp:include page="axissin006_datossiniestros_tramitaciones_destinatarios.jsp"/>
        </td>
    </tr>
  </c:if>
     </axis:visible>
   <axis:visible f="axissin006" c="DSP_PAGOS">
   <%-- <c:if test="${!empty __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.PAGOS}">--%>
        <!-- Tramitaciones Pagos-->
<c:if test="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.CINFORM != 1 && (!empty __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.PAGOS || 
                     		(empty __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.PAGOS && !(sessionScope.CMODO eq 'CONSULTA_SINIESTROS') ))
                     		&& __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.CTRAMIT == 0}">                                 	        
        <tr>
            <td class="campocaja">
                <div style="float:left;">
                    <img id="tramitaciones_pagos_parent" src="images/mes.gif"
                         onclick="objEstilos.toggleDisplay('tramitaciones_pagos', this)"
                         style="cursor:pointer"/>


                 <c:set var="temp3" value="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.PAGOS}" />
                 
                 
             
                 
                 <c:forEach items="${temp3}" var="item" varStatus="status">
                      <c:set var="prueba" value="${temp3[status.count-1].OB_IAX_SIN_TRAMI_PAGO.MOVPAGOS}" />   
                      <c:forEach items="${prueba}" var="item" varStatus="stat">
                         <c:set var="estadoPago" value="${prueba[stat.count-1].OB_IAX_SIN_TRAMI_MOVPAGO.CESTPAG}" />
                      </c:forEach>  
                      <c:if test="${estadoPago != 8}">
                        <c:set var="AcumuladoPagos" value="${AcumuladoPagos + temp3[status.count-1].OB_IAX_SIN_TRAMI_PAGO.ISINRET}"/>  
                         <c:set var="AcumuladoPagosOtros" value="${AcumuladoPagosOtros + temp3[status.count-1].OB_IAX_SIN_TRAMI_PAGO.IOTROSGAS}"/>                       
                        <c:set var="AcumuladoRetencion" value="${AcumuladoRetencion + temp3[status.count-1].OB_IAX_SIN_TRAMI_PAGO.IRETENC}"/>
                        <c:set var="AcumuladoIVA" value="${AcumuladoIVA + temp3[status.count-1].OB_IAX_SIN_TRAMI_PAGO.IIVA}"/>
                      </c:if>                        

                 </c:forEach>                    
                    
                    <b><axis:alt f="axissin006" c="PAGOS" lit="109479"/></b>&nbsp;&nbsp;<axis:alt f="axissin006" c="IBRUTO" lit="9905680"/>&nbsp;<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${AcumuladoPagos}"/> -&nbsp;
<axis:alt f="axissin006" c="IOTROS" lit="9909357" />:&nbsp;
<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${AcumuladoPagosOtros}"/>-&nbsp; <axis:alt f="axissin006" c="IRETEN" lit="101714" />:&nbsp;<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${AcumuladoRetencion}"/> &nbsp;-&nbsp;<axis:alt f="axissin006" c="IIVA" lit="9001321" />:&nbsp;<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${AcumuladoIVA}"/>
                    
                </div>
                <div style="float:right;" id="BT_SIN_NUEVO_TRAM_PAGOS">
                   <axis:visible f="axissin006" c="BT_SIN_NUEVO_TRAM_PAGOS">
                       <%--  <a href="javascript:void(0)">--%>
                   
                            <img border="0" alt='<axis:alt f="axissin006" c="NUEVO_PAGO" lit="9000983"/>'
                                 title='<axis:alt f="axissin006" c="NUEVO_PAGO" lit="9000983"/>'
                                 src="images/new.gif" 
                                 onClick="javascript:f_abrir_modal('axissin012',null,'&SPRODUC='+document.miForm.SPRODUC.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+document.miForm.NTRAMIT.value+'&CTIPPAG=2&isNew=yes&SECCION=pagos'+'&CTRAMIT='+document.miForm.CTRAMIT.value+'&CCAUSIN='+document.miForm.CCAUSIN.value+'&CMOTSIN='+document.miForm.CMOTSIN.value+'&CAGENTESINI='+document.miForm.CAGENTESINI.value+'&TAGENTESINI='+document.miForm.TAGENTESINI.value+'&NTRAMIT9999='+document.miForm.NTRAMIT9999.value);"
                                 />
                  <%-- </a>--%>
                    </axis:visible>
                </div>
                <div style="clear:both;">
                      <hr class="titulo">
                </div>
            </td>
        </tr>
        <tr id="tramitaciones_pagos_children" style="display:none">
            <td align="left">
                <jsp:include page="axissin006_datossiniestros_tramitaciones_pagos.jsp"/>
            </td>
        </tr>
      </c:if>
      </axis:visible>
      <%--  </c:if>
      </axis:visible>
      <axis:visible f="axissin006" c="DSP_RECOBROS">
      <c:if test="${!empty __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.RECOBROS}">--%>


      <!-- Tramitaciones Recobros ************************************************************************************************************************ -->
      <c:choose>
         <c:when test="${__configform.axissin006__DSP_RECOBROS_OFI__visible == 'true'}">
            <c:set var="componenteDSP" value='DSP_RECOBROS_OFI' />
            <c:set var="oRecobros" value="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.RECOBROS_OFI}" />
         </c:when>
         <c:otherwise>
            <c:set var="componenteDSP" value='DSP_RECOBROS_GEN' />
            <c:set var="oRecobros" value="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.RECOBROS}" />
         </c:otherwise>
      </c:choose>

      <axis:visible f="axissin006" c="${componenteDSP}">
   
         <c:if test="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.CINFORM != 1 
                     && (!empty __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.RECOBROS 
                     || (empty __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.RECOBROS 
                     && !(sessionScope.CMODO eq 'CONSULTA_SINIESTROS') ))
                     && __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.CTRAMIT == 0}">
            <tr>
               <td class="campocaja"> 
                  <div style="float:left;">
                     <img id="tramitaciones_recobros_parent" src="images/mes.gif"
                          onclick="objEstilos.toggleDisplay('tramitaciones_recobros', this)"
                          style="cursor:pointer"/>

                     <c:forEach items="${oRecobros}" var="item" varStatus="status">

                        <c:set var="oMovPagos" value="${oRecobros[status.count-1].OB_IAX_SIN_TRAMI_PAGO.MOVPAGOS}" />   
                        <c:forEach items="${oMovPagos}" var="item" varStatus="stat">
                           <c:set var="estadoRecobro" value="${oMovPagos[stat.count-1].OB_IAX_SIN_TRAMI_MOVPAGO.CESTPAG}" />
                        </c:forEach>  
                      
                        <c:if test="${estadoRecobro != 8}">
                           <c:set var="AcumuladoRecobros"      value="${AcumuladoRecobros      + oRecobros[status.count-1].OB_IAX_SIN_TRAMI_PAGO.ISINRET}"/>
                           <c:set var="AcumuladoRetencionReco" value="${AcumuladoRetencionReco + oRecobros[status.count-1].OB_IAX_SIN_TRAMI_PAGO.IRETENC}"/>
                           <c:set var="AcumuladoIVAReco"       value="${AcumuladoIVAReco       + oRecobros[status.count-1].OB_IAX_SIN_TRAMI_PAGO.IIVA}"/>
                        </c:if>  
                     </c:forEach>                    

                     <b><axis:alt f="axissin006" c="RECOBROS" lit="9000897"/>/<axis:alt f="axissin006" c="RECOBROS" lit="9904530"/></b>&nbsp;&nbsp;<axis:alt f="axissin006" c="IBRUTO" lit="9905680"/>&nbsp;<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${AcumuladoRecobros}"/> -&nbsp; <axis:alt f="axissin006" c="IRETEN" lit="101714" />:&nbsp;<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${AcumuladoRetencionReco}"/> &nbsp;-&nbsp;<axis:alt f="axissin006" c="IIVA" lit="9001321" />:&nbsp;<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${AcumuladoIVAReco}"/>
                     
                  </div>
                  <div style="float:right;" id="BT_SIN_NUEVO_TRAM_REC">
                     <axis:visible f="axissin006" c="BT_SIN_NUEVO_TRAM_REC">
                        <%-- <a href="javascript:f_abrir_modal('axissin012',null,'&SPRODUC='+document.miForm.SPRODUC.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NRAMIT='+'${__formdata.indexTramitacio}'+'&CTIPPAG=7');">
                        --%>
                        <img border="0" alt='<axis:alt f="axissin006" c="NUEVO_PAGO" lit="9000983"/>'
                             title='<axis:alt f="axissin006" c="NUEVO_PAGO" lit="9000983"/>'
                             src="images/new.gif" 
                             onClick="javascript:f_abrir_modal('axissin012',null,'&SPRODUC='+document.miForm.SPRODUC.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+document.miForm.NTRAMIT.value+'&CTIPPAG=7&isNew=yes&SECCION=recobros'+'&CTRAMIT='+document.miForm.CTRAMIT.value+'&CCAUSIN='+document.miForm.CCAUSIN.value+'&CMOTSIN='+document.miForm.CMOTSIN.value+'&CAGENTESINI='+document.miForm.CAGENTESINI.value+'&TAGENTESINI='+document.miForm.TAGENTESINI.value+'&NTRAMIT9999='+document.miForm.NTRAMIT9999.value);"
                        />
                        <%--</a>--%>
                     </axis:visible>
                  </div>
                  <div style="clear:both;">
                     <hr class="titulo">
                  </div>
               </td>
            </tr>
            <tr id="tramitaciones_recobros_children" style="display:none">
                <td align="left">
                   <jsp:include page="axissin006_datossiniestros_tramitaciones_recobros.jsp"/>
                </td>
            </tr>
         </c:if>
      </axis:visible>


   <axis:visible f="axissin006" c="DSP_PERREL">  
   <%-- </c:if>--%>
   
   <!-- ************  Personas relacionadas con el siniestro *********** --> 
   <%--c:if test="${0 != 0}"  --%>
    <%--c:if test="${!empty __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.AGENDA || 
                     		(empty __formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.AGENDA && !(sessionScope.CMODO eq 'CONSULTA_SINIESTROS') )}" --%>                                 	            	
        <tr>
            <td class="campocaja">
                <div style="float:left;">
                    <img id="tramitaciones_personasrel_parent" src="images/mes.gif"
                         onclick="objEstilos.toggleDisplay('tramitaciones_personasrel', this)"
                         style="cursor:pointer"/>
                     
                    <b><axis:alt f="axissin006" c="PER_REL" lit="9901054"/></b><!-- Personas relacionadas -->
                </div>
                <div style="float:right;" id="BT_SIN_NUEVO_TRAM_PER">
                    <axis:visible f="axissin006" c="BT_SIN_NUEVO_TRAM_PER">
                            <img border="0" alt='<axis:alt f="axissin006" c="NUEVO_PER_REL" lit="9901054"/>'
                                 title='<axis:alt f="axissin006" c="NUEVO_PRE_REL" lit="9901054"/>'
                                 src="images/new.gif" onClick="javascript:f_abrir_modal('axissin039',null,'&NTRAMIT='+document.miForm.NTRAMIT.value+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&subpantalla_base=tramitaciones&seccion=tramitaciones_personasrel&LSTPERSONASRE='+document.miForm.PERRELACIONADAS.value+'&NTRAMIT9999='+document.miForm.NTRAMIT9999.value);"
                                 />
                    </axis:visible>
                </div>
                <div style="clear:both;">
                    <hr class="titulo"></hr>
                </div>
            </td>
        </tr>
        <tr id="tramitaciones_personasrel_children" style="display:none">
            <td align="left">
                <jsp:include page="axissin006_datossiniestros_tramitaciones_personas.jsp"/>
            </td>
        </tr>
    <%-- /c:if --%>
    <%-- /c:if --%>
    </axis:visible>
   
   <!-- ************  FIN      relacionadas con el siniestro *********** --> 
   <!-- ********************* Tramitaciones Agenda ********************* -->
    
   <axis:visible f="axissin006" c="DSP_AGENDA_TRAMITACION">
        <tr>
            <td class="campocaja">
                <div style="float:left;">
                    <img id="tramitaciones_agenda_parent" src="images/mes.gif"
                         onclick="objEstilos.toggleDisplay('tramitaciones_agenda', this)"
                         style="cursor:pointer"/>
                     
                    <b><axis:alt f="axissin006" c="AGENDA" lit="9000898"/></b><!-- Agenda -->
                </div>

                <div style="float:right;" id="BT_SIN_NUEVO_TRAM_AGE">
                    <axis:visible f="axissin006" c="BT_SIN_NUEVO_TRAM_AGE">
                   <%--     <a href="javascript:f_abrir_modal('axissin015',null,'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&subpantalla=tramitaciones&seccion=tramitaciones_agenda');">--%>
                            <img border="0" alt='<axis:alt f="axissin006" c="BT_SIN_NUEVO_TRAM_AGE" lit="9000898"/>'
                                 title='<axis:alt f="axissin006" c="BT_SIN_NUEVO_TRAM_AGE" lit="9000898"/>'
                                 src="images/agenda.gif" onClick="javascript:f_abrir_modal_agenda('axisagd002',null,'&CMODO=${sessionScope.CMODO}&NTRAMIT='+document.miForm.NTRAMIT.value+'&CTIPAGD=5&NSINIES='+document.miForm.NSINIES.value+'&subpantalla_base=tramitaciones_agenda');"
                                 />
                   <%--     </a>--%>
                    </axis:visible>
                </div>
                
                <div style="float:right;" id="BT_RES_AGD_TAREAS_TRAM">
                   <axis:visible f="axissin006" c="BT_RES_AGD_TAREAS_SIN">
                       <a href="javascript:f_abrir_modal_agenda('axissin076',null,'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+document.miForm.NTRAMIT.value);">
                       <img border="0" alt="<axis:alt f="axissin006" c="RES_AGD_TAREAS_TRAM" lit="9909675"/>" title="<axis:alt f="axissin006" c="RES_AGD_TAREAS_TRAM" lit="9909675"/>" src="images/nolines_plus.gif"/></a>
                   </axis:visible>
                </div>
                
                <div style="clear:both;">
                    <hr class="titulo"></hr>
                </div>
            </td>
        </tr>
        <tr id="tramitaciones_agenda_children" style="display:none">
            <td align="left">
                <jsp:include page="axissin006_datossiniestros_tramitaciones_agenda.jsp"/>
            </td>
        </tr>
    </axis:visible>
   <!-- ********************* Fin Tramitaciones Agenda ********************* -->
	
</table>
