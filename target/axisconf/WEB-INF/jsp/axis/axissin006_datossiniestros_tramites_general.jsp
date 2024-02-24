<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<c:set var="nombrePantalla" value="tramitaciones"/>
<c:set var="nombreSeccion" value="general"/>
<c:set var="formulari" value="axissin006"/>
<c:if test="${!empty param.f}">
    <c:set var="formulari">${param.f}</c:set>
</c:if>

<script type="text/javascript">
    function f_getTramite(NTRAMTE,indice,CTRAMTE){
    
    <c:choose>
    <c:when test="${!empty param.f && param.f eq 'axissin027'}">
        document.getElementById('NTRAMTE').value = NTRAMTE;
          document.getElementById('CTRAMTE').value = CTRAMTE;
        objUtiles.ejecutarFormulario ("modal_axissin027.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
        </c:when>
        <c:otherwise>
        document.getElementById('NTRAMTE').value = NTRAMTE;
        document.getElementById('indexTramite').value = indice;
          document.getElementById('CTRAMTE').value = CTRAMTE;
        objUtiles.ejecutarFormulario("axis_axissin006.do", "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
        </c:otherwise>
        </c:choose>
    }

     
</script>


                        
                        <!-- TRAMITACIONES CABECERA -->
                        <axis:ocultar f="${formulari}" c="DSP_TRAMITES_GENERAL" dejarHueco="false">
                        <c:set var="title0"></c:set><!--Num -->
                        <c:set var="title1"><axis:alt f="${formulari}" c="TIPO" lit="9901195" /></c:set>
                        <c:set var="title2"><axis:alt f="${formulari}" c="ESTADO" lit="100587" /></c:set>
                        <c:set var="title3"><axis:alt f="${formulari}" c="EDITAR" lit="100002" /></c:set>
                        <%int indexTramite = 0;%>
                        
                       <div>
                          <display:table name="${__formdata.OB_IAX_SINIESTRO.TRAMITES}" id="T_IAX_TRAMITES" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                           requestURI="" style="width:100%" >
                            <c:set var="i"><%=indexTramite%></c:set>
                            <%@ include file="../include/displaytag.jsp"%>
                            
                            <!-- bug 23643 -->                            
                            
                            <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                               <div class="dspIcons"><input  onClick="javascript:f_getTramite('${T_IAX_TRAMITES.OB_IAX_SIN_TRAMITE.NTRAMTE}','${i}','${T_IAX_TRAMITES.OB_IAX_SIN_TRAMITE.CTRAMTE}')"  
                               <c:if test="${__formdata.NTRAMTE == T_IAX_TRAMITES.OB_IAX_SIN_TRAMITE.NTRAMTE }"> checked </c:if>
                               value="${T_IAX_TRAMITES.OB_IAX_SIN_TRAMITE.NTRAMTE}##${T_IAX_TRAMITES.OB_IAX_SIN_TRAMITE.TTRAMTE}" type="radio"  id="radioNTRAMTE" name="radioNTRAMTE"/></div> 
                                
                            </display:column>
                            <display:column title="" sortable="true" sortProperty="NTRAMIT" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspNumber">${T_IAX_TRAMITES.OB_IAX_SIN_TRAMITE.NTRAMTE}</div>
                            </display:column>
                            <display:column title="${title1}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                 <div class="dspText">${T_IAX_TRAMITES.OB_IAX_SIN_TRAMITE.TTRAMTE}</div>    
                            </display:column>
                            <axis:visible f="${formulari}" c="TRAMITES_EDITAR">
                            <display:column title="${title3}" headerClass="headwidth5 sortable" media="html" style="width:15%"  autolink="false" >
                                <div class="dspIcons" id="BT_SIN_EDITAR_TRAMITE_GEN"><img border="0" alt="<axis:alt f="${formulari}" c="BT_SIN_EDITAR_TRAM_GEN" lit="100002"/>" title1="<axis:alt f="${formulari}" c="BT_SIN_EDITAR_TRAM_GEN" lit="100002"/>" src="images/lapiz.gif" width="15px" height="15px"
                                style="cursor:pointer;" onclick="javascript:f_abrir_modal('axissin042',null,'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&SPRODUC='+document.miForm.SPRODUC.value+'&NSINIES='+document.miForm.NSINIES.value+'&FSINIES='+document.miForm.FSINIES.value+'&CCAUSIN='+document.miForm.CCAUSIN.value+'&CMOTSIN='+document.miForm.CMOTSIN.value+'&NRIESGO='+document.miForm.NRIESGO.value+'&NTRAMTE='+${T_IAX_TRAMITES.OB_IAX_SIN_TRAMITE.NTRAMTE}+'&MODO=modificar');"/>
                                </div>
                            </display:column>
                            </axis:visible>
                            <axis:visible f="${formulari}" c="TRAMITES_CONSULTAR">
                            <display:column title="" headerClass="headwidth5 sortable" style="width:15%" media="html" autolink="false" >
                                <div class="dspIcons" id="BT_SIN_MAS_TRAM_GEN"><img border="0" alt="<axis:alt f="${formulari}" c="BT_SIN_MAS_TRAM_GEN" lit="1000439"/>" title1="<axis:alt f="${formulari}" c="BT_SIN_MAS_TRAM_GEN" lit="1000439"/>" src="images/mas.gif" width="11px" height="11px"
                                style="cursor:pointer;" onclick="javascript:f_abrir_modal('axissin042',null,'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&SPRODUC='+document.miForm.SPRODUC.value+'&NSINIES='+document.miForm.NSINIES.value+'&FSINIES='+document.miForm.FSINIES.value+'&CCAUSIN='+document.miForm.CCAUSIN.value+'&CMOTSIN='+document.miForm.CMOTSIN.value+'&NRIESGO='+document.miForm.NRIESGO.value+'&NTRAMTE='+${T_IAX_TRAMITES.OB_IAX_SIN_TRAMITE.NTRAMTE}+'&MODO=consulta');"/></div>
                            </display:column>
                            </axis:visible>
                            
                            <!-- bug 23643 -->                                                      
                            
                           <%indexTramite++;%>
                        </display:table>
                        
                       
                        
                        </div>
                        <!-- FIN TRAMITACIONES -->
                        
                        
                        
                        <!-- *********************************************************************************************************************************************** -->
                        <!-- ***************************************************************** MOVIMIENTOS TRAMITE ********************************************************** -->
                        <!-- *********************************************************************************************************************************************** -->
                                
                <table>
                        
                        <tr>
                            <td> 
                         
                                <table class="area" align="center">
                                <tr>
                                    <th style="height:0px"></th>
                                </tr>
                                <!-- Inicio Seccion -->
                                <axis:ocultar f="${formulari}" c="DSP_MOV_TRAMITES" dejarHueco="false">  <!-- Condición pasa siempre -->
                                <c:if test="${!empty __formdata.OB_IAX_SINIESTRO.TRAMITES[__formdata.indexTramite].OB_IAX_SIN_TRAMITE.MOVIMIENTOS || 
                            		(empty __formdata.OB_IAX_SINIESTRO.TRAMITES[__formdata.indexTramite].OB_IAX_SIN_TRAMITE.MOVIMIENTOS )}">
                                <tr>
                                    <td class="campocaja">
                                            <!-- Títulos movimientos trámite -->
                                            <div style="float:left;">
                                                <b><axis:alt f="axissin006" c="TRAMITES_MOVIMIENTOS" lit="9903647"/></b>
                                            </div>
                                    
                                            <!-- bug 0022108 -->
                                            <div style="float:right;">
                                            	      <axis:visible f="${formulari}" c="BT_SIN_NUEVO_MOVTRAMITE">  <!-- Alta nuevo movimiento tramite  -->
                                                    <div id="BT_SIN_NUEVO_MOVTRAMITE">
                                                    <!-- bug 0021196  afegir params -->
                                                   <a href="javascript:f_abrir_modal('axissin055',null,'&isNew=yes&CEMPRES='+document.miForm.CEMPRES.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMTE='+${__formdata.OB_IAX_SINIESTRO.TRAMITES[__formdata.indexTramite].OB_IAX_SIN_TRAMITE.NTRAMTE}+'&TTRAMTE='+'${__formdata.OB_IAX_SINIESTRO.TRAMITES[__formdata.indexTramite].OB_IAX_SIN_TRAMITE.TTRAMTE}&CESTTE=${__formdata.OB_IAX_SINIESTRO.TRAMITES[__formdata.indexTramite].OB_IAX_SIN_TRAMITE.MOVIMIENTOS[0].OB_IAX_SIN_TRAMITE_MOV.CESTTTE}' );">
                                                   <img border="0" alt="<axis:alt f="${formulari}" c="BT_SIN_NUEVO_TRAMITE_MOV" lit="9903646"/>" title="<axis:alt f="${formulari}" c="BT_SIN_NUEVO_TRAM_MOV" lit="9903646"/>" src="images/new.gif"/></a>
                                                    </div>
                                                    </axis:visible>
                                            </div>

                                    </td>

                                </tr>
                                <tr>
                                    <td> 
                                        <!-- TABLA SECCION  MOVIMIENTOS TRAMITE -->
                                                                             
                                            <c:set var="title0"></c:set><!--Num -->
                                            <c:set var="title1"><axis:alt f="${formulari}" c="NMOVTTE" lit="100899" /></c:set><!--Numero movimiento tramite-->
                                            <c:set var="title2"><axis:alt f="${formulari}" c="TESTTTE" lit="100587" /></c:set><!--Estado movimiento tramite-->
                                            <c:set var="title3"><axis:alt f="${formulari}" c="NSINIES" lit="800279" /></c:set><!-- Num. Siniestro tramite -->
                                              <c:set var="title4"><axis:alt f="${formulari}" c="FESTTRA" lit="100562" /></c:set><!-- Fecha -->
                                            <c:set var="title5"><axis:alt f="${formulari}" c="TUNITRA" lit="9000900" /></c:set><!-- Unidad tramitación -->
                                            <c:set var="title6"><axis:alt f="${formulari}" c="TTRAMITAD" lit="140769" /></c:set><!-- Tramitador -->
                                            
                                            <!-- ini bug 0021196 -->
                                            <axis:visible f="${formulari}" c="TCAUEST">
                                            <c:set var="title7"><axis:alt f="${formulari}" c="TCAUEST" lit="9002029" /></c:set><!-- Causa estado -->
                                            </axis:visible>
                                            <!-- fin bug 0021196 -->
                                            <c:set var="num_tramite">0</c:set>
                                            <div class="displayspace">
                                           
                                            
                                              <display:table name="${__formdata.OB_IAX_SINIESTRO.TRAMITES[__formdata.indexTramite].OB_IAX_SIN_TRAMITE.MOVIMIENTOS}" id="T_IAX_TRAMITE_MOVIMIENTO" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0" defaultsort="1" defaultorder="descending"
                                               requestURI="">
                                                <%@ include file="../include/displaytag.jsp"%> 
                                                <display:column title="${title1}" sortable="false" sortProperty="OB_IAX_SIN_TRAMI_MOVIMIENTO.NMOVTTE" style="width:10%" headerClass="sortable" media="html" autolink="false" >
                                                    <div class="dspNumber">${T_IAX_TRAMITE_MOVIMIENTO.OB_IAX_SIN_TRAMITE_MOV.NMOVTTE}</div>
                                                </display:column>
                                                <display:column title="${title2}" sortable="false"  headerClass="sortable" media="html" style="width:20%" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAMITE_MOVIMIENTO.OB_IAX_SIN_TRAMITE_MOV.TESTTTE}</div>    
                                                </display:column>
                                                <display:column title="${title4}" sortable="false"  headerClass="sortable" media="html" style="width:15%" autolink="false" >
                                                     <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAMITE_MOVIMIENTO.OB_IAX_SIN_TRAMITE_MOV.FESTTRA}"/></div>
                                                </display:column>
                                                <display:column title="${title5}" sortable="false"  headerClass="sortable" media="html" style="width:20%" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAMITE_MOVIMIENTO.OB_IAX_SIN_TRAMITE_MOV.TUNITRA}</div>    
                                                </display:column>
                                                <display:column title="${title6}" sortable="false"  headerClass="sortable" media="html" style="width:20%" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAMITE_MOVIMIENTO.OB_IAX_SIN_TRAMITE_MOV.TTRAMITAD}</div>    
                                                </display:column>
                                                <!-- ini bug 0021196 -->
                                                <axis:visible f="${formulari}" c="TCAUEST">
                                                <display:column title="${title7}" sortable="false" style="width:15%"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${T_IAX_TRAMITE_MOVIMIENTO.OB_IAX_SIN_TRAMITE_MOV.TCAUEST}</div>    
                                                </display:column>
                                                </axis:visible>
                                                <!-- fin bug 0021196 -->    
                                                     
                                                     
                                                                                                                   
                                            </display:table>
                                            </div>
                                        <!-- FIN MOVIMIENTOS TRAMITE -->
                                    </td>
                                </tr>  
                              </c:if>
                              
                              </table>
                           </td>
                        </tr>
                </table>
                              
                              
                </axis:ocultar>
                        
                        
                        

                        
                </axis:ocultar>   <!-- FIN TRAMITES -->
                        
                        
                            
                        
                        
