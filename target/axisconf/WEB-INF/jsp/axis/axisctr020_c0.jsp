<%/* Revision:# PuGJU0W7sO4UVuKoUXYs5A== # */%>
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

        <axis:ocultar f="${pantalla}" c="DSP_PRESTAMO" dejarHueco="false">
        <c:if test="${! empty PRESTAMOS}">
                <tr>
                    <td class="campocaja" >
                        <div style="float:left;">
                        <img id="DSP_PRESTAMOS_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_PRESTAMOS', this)" style="cursor:pointer"/>
                        <b><axis:alt f="${pantalla}" c="PRESTAMOS_TIT" lit="9900870"/></b>
                        </div>
                        
                        <axis:visible  f="${pantalla}" c="LAPIZ1">
                        <div style="float:right;" id="PRESTAMOS" c="LAPIZ1"></div>
                        </axis:visible>
                        
                        <div class="seccion_suplementos" id="SECCION_PRESTAMOS"></div>
                        <div style="clear:both;">
                        <hr class="titulo">
                        </div>

                    </td>

                </tr>
                <tr id="DSP_PRESTAMOS_children" style="display:none">
                    
                    <td class="campocaja" >
                          <c:set var="title0"><axis:alt f="${pantalla}" c="FINIPREST" lit="100562"/></c:set>
                          <c:set var="title1"><axis:alt f="${pantalla}" c="FFINPREST" lit="100885"/></c:set>
                          <c:set var="title2"><axis:alt f="${pantalla}" c="ICAPINI" lit="9903121"/></c:set>
                          <c:set var="title3"><axis:alt f="${pantalla}" c="IINTERES" lit="9900882"/></c:set>
                          <c:set var="title4"><axis:alt f="${pantalla}" c="IDEMORA" lit="9903123"/></c:set>  
                          <c:set var="title5"><axis:alt f="${pantalla}" c="ICAPPENDIENTE" lit="9901248"/></c:set>
                          <c:set var="title6"><axis:alt f="${pantalla}" c="BT_DETREC" lit="1000113"/></c:set>
                          <c:set var="title7"><axis:alt f="${pantalla}" c="CTAPRES" lit="9902871"/></c:set>
                          <c:set var="title8"><axis:alt f="${pantalla}" c="TESTADO" lit="100587"/></c:set>
                          <c:set var="title9"><axis:alt f="${pantalla}" c="ITASA" lit="9904311"/></c:set>
                          
                         
                          <div class="displayspace" style="width:100%;">
                            <display:table  name="${PRESTAMOS}" id="prestamo" export="false" class="dsptgtable" pagesize="-1" defaultsort="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                            	requestURI="axis_${pantalla}.do?paginar=true&subpantalla=DSP_PRESTAMOS" >
                                <%@ include file="../include/displaytag.jsp"%>
                                
                                <display:column title="${title7}" sortable="true" sortProperty="CTAPRES" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                     <div class="dspNumber">${prestamo.CTAPRES}</div>
                                </display:column>
                                <display:column title="${title8}" sortable="true" sortProperty="CTAPRES" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                     <div class="dspText">${prestamo.TESTADO}</div>
                                </display:column>
                                <display:column title="${title0}" sortable="true" sortProperty="FINIPREST" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                     <div class="dspDate"><fmt:formatDate value="${prestamo.FINIPREST}" pattern="dd/MM/yyyy"/></div>
                                </display:column>
                                <display:column title="${title1}" sortable="true" sortProperty="FFINPREST" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                      <div class="dspDate"><fmt:formatDate value="${prestamo.FFINPREST}" pattern="dd/MM/yyyy"/></div>
                                </display:column>
                                <display:column title="${title2}" sortable="true" sortProperty="ICAPINI" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                     <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${prestamo.ICAPINI}" /></div>
                                </display:column>
                                <display:column title="${title9}" sortable="true" sortProperty="ITASA" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                     <div class="dspNumber"><fmt:formatNumber pattern="###,##0.00" value="${prestamo.ITASA}" maxFractionDigits='6'/></div>
                                </display:column>
                                <display:column title="${title3}" sortable="true" sortProperty="IINTERES" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                     <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${prestamo.IINTERES}" /></div>
                                </display:column>
                                <display:column title="${title4}" sortable="true" sortProperty="IDEMORA" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                     <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${prestamo.IDEMORA}" /></div>
                                </display:column>
                                <display:column title="${title5}" sortable="true" sortProperty="ICAPPENDIENTE" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                     <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${prestamo.ICAPPENDIENTE}" /></div>
                                </display:column>
                                <display:column title="${title6}" headerClass="headwidth5 sortable" media="html" autolink="false"  >
                                     <axis:visible f="${pantalla}" c="PRES_CTAPRES">
                                     <div class="dspIcons"><img border="0" alt="${title6}" title1="${title6}" src="images/mas.gif" width="11px" height="11px" c="PRES_CTAPRES"
                                     style="cursor:pointer;" onclick="f_abrir_axisctr184(${prestamo.CTAPRES})"/></div>
                                     </axis:visible>
                                 </display:column>
                                                                                      
                            </display:table>
                        </div>
                    </td>
                </tr>
        </c:if>
        </axis:ocultar>
        
        <axis:ocultar f="${pantalla}" c="DSP_CLAUSULAS" dejarHueco="false">
        <c:if test="${! empty clausulasprod || ! empty clausulasesp || !empty clausulasprodmult || suple_clausulas == 1}">
                <tr>
                    <td class="campocaja" >
                        <div style="float:left;">
                        <img id="DSP_CLAUSULAS_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_CLAUSULAS', this)" style="cursor:pointer"/>
                        <b><axis:alt f="${pantalla}" c="CLAUSULA_TIT" lit="101791"/></b>
                        </div>
                        <axis:visible f="${pantalla}" c="LAPIZ1">
                        <div style="float:right;" id="CLAUSULAS" c="LAPIZ1"></div>
                        </axis:visible>
                        <div class="seccion_suplementos" id="SECCION_CLAUSULAS"></div>
                        <div style="clear:both;">
                        <hr class="titulo">
                        </div>

                    </td>
                </tr>
                <tr id="DSP_CLAUSULAS_children" style="display:none">
                    <td class="campocaja" >
                      <c:if test="${!empty clausulasprod}">

                        <div class="displayspace">
                        <c:set var="title0"><axis:alt f="${pantalla}" c="CLAUSULA_TIT1" lit="800440"/></c:set>
                        <c:set var="title1"><axis:alt f="${pantalla}" c="CLAUSULA_TIT2" lit="101805"/></c:set>
                            <%--axis:tabla name="${clausulasprod}" miid="clausulasprod" objeto="OB_IAX_CLAUSULAS" campos="SCLAGEN(O)#TCLAESP(O)" estilos="dspNumber#dspText" titulos="${title0}@@${title1}"
                                columnHeaderClass="headwidth5 sortable#sortable" cellpadding="0" cellspacing="0"/--%>
							
							<display:table name="${clausulasprod}" id="clausulasprod1" export="false" class="dsptgtable" pagesize="-1" defaultsort="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0">
                                <%@ include file="../include/displaytag.jsp"%>

                                <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_CLAUSULAS.SCLAGEN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                      <div class="dspNumber">${clausulasprod1.OB_IAX_CLAUSULAS.SCLAGEN}</div>
                                </display:column>
                                 <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_CLAUSULAS.TCLAESP" headerClass="sortable"  media="html" autolink="false" >
                                      <div class="dspText">${clausulasprod1.OB_IAX_CLAUSULAS.TCLAESP}</div>
                                </display:column>
                                                                                         
                            </display:table> 
							
                         </div>
                        <br />
                        </c:if>
                       
                        <c:if test="${!empty clausulasesp}">
                        <b><axis:alt f="${pantalla}" c="CLAUSULAS_ESP" lit="1000084"/></b>
                        <!-- DisplayTag clausulasEspecificas -->
                        <c:set var="title1"><axis:alt f="${pantalla}" c="CLAUSULA_ESP_TIT1" lit="800440"/></c:set>
                        <c:set var="title2"><axis:alt f="${pantalla}" c="CLAUSULA_ESP_TIT2" lit="101805"/></c:set>
                        <div class="displayspace">

                            <%--axis:tabla name="${clausulasesp}" miid="clausulasesp" objeto="OB_IAX_CLAUSULAS" campos="CIDENTITY(O)#TCLAESP(O)" estilos="dspNumber#dspText" titulos="${title1}@@${title2}"
                                columnHeaderClass="headwidth5 sortable#sortable" cellpadding="0" cellspacing="0"/--%>
								
							<display:table name="${clausulasesp}" id="clausulasesp" export="false" class="dsptgtable" pagesize="-1" defaultsort="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0">
                                <%@ include file="../include/displaytag.jsp"%>

                                <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_CLAUSULAS.CIDENTITY" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                      <div class="dspNumber">${clausulasesp.OB_IAX_CLAUSULAS.CIDENTITY}</div>
                                </display:column>
                                 <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_CLAUSULAS.TCLAESP" headerClass="sortable"  media="html" autolink="false" >
                                      <div class="dspText">${clausulasesp.OB_IAX_CLAUSULAS.TCLAESP}</div>
                                </display:column>
                                                                                         
                            </display:table>

                        </div>
                        <br />
                        </c:if>
                        
                        <c:if test="${!empty clausulasprodmult}">
                        
                        <div class="displayspace">
                        <c:set var="title0"><axis:alt f="${pantalla}" c="CLAUSULA_TIT1" lit="800440"/></c:set>
                        <c:set var="title1"><axis:alt f="${pantalla}" c="CLAUSULA_TIT2" lit="101805"/></c:set>
                            <%--axis:tabla name="${clausulasprodmult}" miid="clausulasprodmult" objeto="OB_IAX_CLAUSULAS" campos="SCLAGEN(O)#TCLAESP(O)" estilos="dspNumber#dspText" titulos="${title0}@@${title1}"
                                columnHeaderClass="headwidth5 sortable#sortable" cellpadding="0" cellspacing="0"/--%>
							
							 <display:table name="${clausulasprodmult}" id="clausulasprodmult" export="false" class="dsptgtable" pagesize="-1" defaultsort="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0">
                                <%@ include file="../include/displaytag.jsp"%>

                                <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_CLAUSULAS.SCLAGEN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                      <div class="dspNumber">${clausulasprodmult.OB_IAX_CLAUSULAS.SCLAGEN}</div>
                                </display:column>
                                 <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_CLAUSULAS.TCLAESP" headerClass="sortable"  media="html" autolink="false" >
                                      <div class="dspText">${clausulasprodmult.OB_IAX_CLAUSULAS.TCLAESP}</div>
                                </display:column>
                                                                                         
                            </display:table>
								
                         </div>
                        </c:if>
                    </td>
                </tr>
        </c:if>
        </axis:ocultar>
        
        <!--CORRETAJE, INTERMEDIARIOS -->
        <axis:ocultar f="${pantalla}" c="DSP_CORRETAJE" dejarHueco="false">
        <c:if test="${! empty lista_corretaje}">
                
                <tr>
                    <td class="campocaja" >
                        <div style="float:left;">
                        <img id="DSP_CORRETAJE_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_CORRETAJE', this)" style="cursor:pointer"/>
                            <b><axis:alt f="${pantalla}" c="CORRETAJE_TIT" lit="9902530"/></b>
                            </div>
                           <%-- ${recibos[0].OB_IAX_DETRECIBO.IMPORTE}</c:if> --%>                            
                           
                            <axis:visible  f="${pantalla}" c="LAPIZ1">
                            <div style="float:right;" id="DATOS_CORRETAJE" c="LAPIZ1"></div>
                            </axis:visible>
                            
                            <div class="seccion_suplementos" id="SECCION_CORRETAJE"></div>
                            <div style="clear:both;">
                            <hr class="titulo">
                            </div>
                            
                    </td>                    
                </tr>
                <tr id="DSP_CORRETAJE_children" style="display:none">
                    <td class="campocaja" >
                          <c:set var="title0"><axis:alt f="${pantalla}" c="TAGENTE" lit="9902363"/></c:set>
                          <c:set var="title4"><axis:alt f="${pantalla}" c="TSUCURSAL" lit="9002202"/></c:set>
                          <c:set var="title1"><axis:alt f="${pantalla}" c="PCOMISI" lit="9001923"/></c:set>
                          <c:set var="title2"><axis:alt f="${pantalla}" c="PPARTICI" lit="104818"/></c:set>
                          <c:set var="title3"><axis:alt f="${pantalla}" c="ISLIDER" lit="9902425"/></c:set>                         
                          
                          <div class="displayspace">
                            <display:table name="${lista_corretaje}" id="corretaje" export="false" class="dsptgtable" pagesize="-1" defaultsort="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0">
                                <%@ include file="../include/displaytag.jsp"%>

                                <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_CORRETAJE.TAGENTE" headerClass="headwidth15 sortable"  media="html" autolink="false" >
                                      <div class="dspText">${corretaje.OB_IAX_CORRETAJE.CAGENTE} - ${corretaje.OB_IAX_CORRETAJE.TAGENTE}</div>
                                </display:column>
                                <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_CORRETAJE.TSUCURSAL" headerClass="headwidth15 sortable"  media="html" autolink="false" >
                                      <div class="dspText">${corretaje.OB_IAX_CORRETAJE.CSUCURSAL} - ${corretaje.OB_IAX_CORRETAJE.TSUCURSAL}</div>
                                </display:column>
                                <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_CORRETAJE.PCOMISI" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                     <div class="dspNumber"><fmt:formatNumber pattern="###,##0.00" value="${corretaje.OB_IAX_CORRETAJE.PCOMISI}" /></div>
                                </display:column>
                                <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_CORRETAJE.PPARTICI" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                     <div class="dspNumber"><fmt:formatNumber pattern="###,##0.00" value="${corretaje.OB_IAX_CORRETAJE.PPARTICI}" /></div>
                                </display:column>
                                
                                <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_CORRETAJE.NORDEN" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                   <div class="dspIcons">
                                  <input disabled type="checkbox" id="checked_ISLIDER" name="checked_ISLIDER" <c:if test="${corretaje.OB_IAX_CORRETAJE.ISLIDER == 1}">checked</c:if>                                        
                                        value=""/>
                                   </div>
                                </display:column>                                                            
                            </display:table>
                        </div>
                    </td>
                </tr>
        </c:if>
        </axis:ocultar>

        <!-- Parte de los recibos -->
        <c:import url="axisctr020_recibos.jsp"/>

         <!-- ******************** *****************  ******************   -->
        <!---************** SECCION RESUMEN COLECTIVOS *****************   -->
         <!-- ******************** *****************  ******************   -->
         <c:if test="${! empty datoscolect}">
         <axis:visible c="DSP_RESUMCOLEC" f="${pantalla}">
         <div id="seccion_resumcolectivo" name="seccion_resumcolectivo">
           <tr>
            <td class="campocaja" >
                <div style="float:left;">
                    <img id="DSP_RESUMCOLEC_parent"  src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_RESUMCOLEC', this);objSeccion.actualizarSeccionPorAbrirCookie('axisctr020','DSP_RESUMCOLEC');" style="cursor:pointer"/> 
                    <b><axis:alt f="axisctr020" c="DSP_RESUMCOLEC" lit="9904185" /></b> 
                </div>
                
                <axis:visible  f="${pantalla}" c="LAPIZ1">
                <div style="float:right;" id="DSP_RESUMCOLEC" c="LAPIZ1"></div>
                </axis:visible>
               
                <!-- ******************** *BUG 22839 Hacer  onclick del impresora PENDIENTE****************  ******************   
                 <axis:visible c="DOCCOL" f="${pantalla}">
                        <div style="float:right;">
                           <img border="0" onclick="" alt="<axis:alt f="axisctr020" c="DOCCOL" lit="9000745"/>"   title="<axis:alt f="axisctr020" c="DOCCOL" lit="9000745"/>" src="images/print.gif"/></a>
                        </div>
                  </axis:visible>
                -->
                <div style="clear:both;">
                    <hr class="titulo">
                </div>               
            </td>
        </tr>         
        
       <tr id="DSP_RESUMCOLEC_children" style="display:none">
         <td align="left" >
             <table class="area" align="center">
                     <tr>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                        
                    </tr>
                <!-- RESUMEN COLECTIVO-->
                <tr>
                   <!-- TOTAL VA ACUMULADO  -->
                    <td class="titulocaja" c="TOTVACUM">
                        <b><axis:alt f="axisctr020" c="TOTVACUM" lit="9904088" /></b>
                    </td>
                      <!-- TOTPRIMAS -->
                    <axis:ocultar f="${pantalla}" c="TOTPRIMAS">
                     <td class="titulocaja">
                        <b><axis:alt f="axisctr020" c="TOTPRIMAS" lit="9904089" /></b>
                    </td>
                    </axis:ocultar>
                 </tr>

                <tr>      
                    <!-- TOTAL VA ACUMULADO-->
                    <td class="campocaja">
                        <input type="text" class="campo campotexto" id="TOTVACUM" name="TOTVACUM" size="15" style="width:90%"
                       value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${datoscolect.VASEGURADO}'/>" readonly="true" />
                    </td>   
                   <!-- TOTPRIMAS -->
                    <axis:ocultar f="${pantalla}" c="TOTPRIMAS">
                      <td class="campocaja">
                        <!-- Numero de certificado -->
                        <input type="text" class="campo campotexto" id="TOTPRIMAS" name="TOTPRIMAS" size="3" style="width:90%"
                         value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${datoscolect.IPRIANUS}'/>" readonly="true" />
                     </td>
                    </axis:ocultar>
                 </tr>
   
                 <tr>
                    <!-- CERTIF PEND AUTO  -->
                     <axis:visible f="${pantalla}" c="CERTIFPEND">
                             <td class="titulocaja" c="CERTIFPEND">
                                <b><axis:alt f="axisctr020" c="CERTIFPEND" lit="9904090" /></b>
                            </td>
                      </axis:visible>
                      <!--CERT ATUTO-->
                        <axis:visible f="${pantalla}" c="CERTIFAUT">
                              <td class="titulocaja" c="CERTIFAUT">
                                    <b><axis:alt f="axisctr020" c="CERTIFAUT" lit="9904091" /></b>
                                </td>
                        </axis:visible>
                        <!-- CERTP Prop.Supl.Pdt.Aut  -->
                        <axis:visible f="${pantalla}" c="CERTIF_PSUPDTAUT">
                                <td class="titulocaja" c="CERTIF_PSUPDTAUT">
                                    <b><axis:alt f="axisctr020" c="CERTIF_PSUPDTAUT" lit="9904092" /></b>
                                </td>
                         </axis:visible>
                         <!-- CERTP Prop.Supl.Aut  -->
                         <axis:visible f="${pantalla}" c="CERTIF_PSUPAUT">
                            <td class="titulocaja" c="CERTIF_PSUPAUT">
                                <b><axis:alt f="axisctr020" c="CERTIF_PSUPAUT" lit="9904093" /></b>
                            </td>
                         </axis:visible>
                         <!-- CERTIF ANULADOS  -->
                         <axis:visible f="${pantalla}" c="CERTIFANUL">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr020" c="CERTIFANUL" lit="9904094" /></b>
                                </td>
                        </axis:visible>
                    </tr>
  
                 <tr>
                         <!-- CERTIF PEND AUTO  -->
                          <axis:visible f="${pantalla}" c="CERTIFPEND">
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" id="CERTIFPEND" name="CERTIFPEND" size="15"
                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${datoscolect.NCERTPROPAUT}'/>" readonly="true" />
                             </td>
                        </axis:visible>
                           <!--CERT ATUTO-->
                           <axis:visible f="${pantalla}" c="CERTIFAUT">                                                
                             <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" id="CERTIFAUT" name="CERTIFAUT" size="15"
                              value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${datoscolect.NCERTAUT}'/>" readonly="true" />
                            </td>
                          </axis:visible>
                                                                        
                         <!-- CERTP Prop.Supl.Pdt.Aut  -->
                         <axis:visible f="${pantalla}" c="CERTIF_PSUPDTAUT">
                            <td class="campocaja" >
                                <input type="text" class="campowidthinput campo campotexto" id="CERTIF_PSUPDTAUT" name="CERTIF_PSUPDTAUT" size="15"
                              value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${datoscolect.NCERTPROPAUTSUPL}'/>" readonly="true" />
                            </td>
                        </axis:visible>
                         <!-- CERTP Prop.Supl.Aut  -->
                         <axis:visible f="${pantalla}" c="CERTIF_PSUPAUT">
                             <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" id="CERTIF_PSUPAUT" name="CERTIF_PSUPAUT" size="15"
                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${datoscolect.NCERTAUTSUPL}'/>" readonly="true" />
                            </td>
                        </axis:visible>
                          <!-- CERTIF ANULADOS  -->
                         <axis:visible f="${pantalla}" c="CERTIFANUL">
                             <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" id="CERTIFANUL" name="CERTIFANUL" size="15"
                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${datoscolect.NCERTFANU}'/>" readonly="true" />
                            </td>
                        </axis:visible>
                 </tr>
        <!-- ************************************LISTA DE CERTIFICADOS*************************** -->
        <tr>
            <td class="campocaja" colspan=5>
                <b><axis:alt f="${pantalla}" c="LISTACERTF_TIT" lit="9904225"/></b>
            </td>
        </tr>
         <tr>
            <td class="campocaja"  colspan=5>
            <c:set var="title0"><axis:alt f="${pantalla}" c="NCERTIF" lit="9902911"/></c:set>
              <c:set var="title1"><axis:alt f="${pantalla}" c="FEFECTO_CERTIF" lit="100883"/></c:set>
              <c:set var="title2"><axis:alt f="${pantalla}" c="ASEGURADO" lit="101028"/></c:set>
              <c:set var="title3"><axis:alt f="${pantalla}" c="ESTADO" lit="100587"/></c:set>
              <c:set var="title4"><axis:alt f="${pantalla}" c="DETALLE" lit="1000113"/></c:set>
              <c:set var="title5"><axis:alt f="${pantalla}" c="ELIMINAR" lit="100648"/></c:set>
              
                  <div class="displayspaceGrande">
                    <display:table name="${datoscolect.LISTACERTIFS}" id="listacertif" export="false" class="dsptgtable" pagesize="10" defaultsort="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                     requestURI="axis_${pantalla}.do?paginar=true&subpantalla=DSP_LISTACERTF">
                        <%@ include file="../include/displaytag.jsp"%>         
                        <display:column title="${title0}" sortable="true" sortProperty="listacertif.OB_IAX_CERTIFICADOS.NCERTIF" headerClass="headwidth110 sortable"  media="html" autolink="false" >
                           <div class="dspText">${listacertif.OB_IAX_CERTIFICADOS.NPOLIZA}  -  ${listacertif.OB_IAX_CERTIFICADOS.NCERTIF}</div>
                        </display:column>
                       
                        <axis:visible f="${pantalla}" c="FEFECTO_CERTIF">
                            <display:column title="${title1}" sortable="true" sortProperty="listacertif.OB_IAX_CERTIFICADOS.FEFECTO" headerClass="headwidth110 sortable"  media="html" autolink="false" >
                                  <div class="dspDate"><fmt:formatDate value="${listacertif.OB_IAX_CERTIFICADOS.FEFECTO}" pattern="dd/MM/yyyy"/></div>
                            </display:column>
                        </axis:visible>
                        
                         <axis:visible f="${pantalla}" c="ASEGURADO">
                            <display:column title="${title2}" sortable="true" sortProperty="listacertif.OB_IAX_CERTIFICADOS.tomadores.tapelli1" headerClass="headwidth15 sortable"  media="html" autolink="false" >
                                 <div class="dspText">${listacertif.OB_IAX_CERTIFICADOS.TOMADORES[0].OB_IAX_TOMADORES.TAPELLI1} ${listacertif.OB_IAX_CERTIFICADOS.TOMADORES[0].OB_IAX_TOMADORES.TAPELLI2}, ${listacertif.OB_IAX_CERTIFICADOS.TOMADORES[0].OB_IAX_TOMADORES.TNOMBRE}</div>
                            </display:column>
                        </axis:visible>
                        
                         <axis:visible f="${pantalla}" c="ESTADO">
                             <display:column title="${title3}" sortable="true" sortProperty="listacertif.TSITUAC" headerClass="headwidth15 sortable"  media="html" autolink="false" >
                               <div class="dspText">${listacertif.OB_IAX_CERTIFICADOS.TSITUAC} </div>
                             </display:column>
                        </axis:visible>
                       
                       <axis:visible f="${pantalla}" c="DETALLE">
                             <display:column title="${title4}" headerClass="headwidth5 sortable" media="html" autolink="false"  >
                                 <axis:visible f="${pantalla}" c="LIT_DETALLE">
                                 <div class="dspIcons">
								 <a href="#" onclick="javascript:f_aceptar_certif_axisctr019('${listacertif.OB_IAX_CERTIFICADOS.SSEGURO}','${listacertif.OB_IAX_CERTIFICADOS.NPOLIZA}','${listacertif.OB_IAX_CERTIFICADOS.NCERTIF}')">
									<img border="0" alt="${title4}" title1="${title4}" src="images/mas.gif" width="11px" height="11px" style="cursor:pointer;" />
								   </a>
								 </div>
                                  </axis:visible>
                             </display:column>
                        </axis:visible>
          
                      <axis:visible f="${pantalla}" c="BT_ELIMINAR_CERTIF">
                            <display:column title="${title5}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                <axis:visible f="${pantalla}" c="BT_ELIMINAR" >
                                <div class="dspIcons"><img border="0" alt="<axis:alt f="${pantalla}" c="BT_ELIMINAR" lit="100648"/>" title="<axis:alt f="${pantalla}" c="BT_ELIMINAR" lit="100648"/>" src="images/delete.gif" width="14px" height="14px"
                                style="cursor:pointer;vertical-align:middle;" onclick="f_seleccionar_certif('${listacertif.OB_IAX_CERTIFICADOS.SSEGURO}' )"/></div>
                                </axis:visible>
                            </display:column>
                        </axis:visible>
                  </display:table>
                </div>
            </td>
         </tr>
         <!--fin LISTA CERTIFICADOS ---> 
     </table>
   </td>
 </tr>   
 </div>  
</axis:visible>
</c:if>   

         <axis:visible c="DSP_AGENDA" f="${pantalla}">
        
         <%-- Bug 11177.NMM.Fer que sempre surti l'apartat de l'agenda en la consulta de pòlisses
         en el Service s'amaguen els apunts que estàn anul·lats ( cestado = 2).
         Afegim el "! empty datos_poliza && ", perquè si entrem a consultar però sortim sense
         consultar, queda l'apartat de l'agenda a dalt de tot de la pantalla.
         c:if test="${! empty lstagenda && (empty sessionScope.${pantalla}_suplementosPendientes || !sessionScope.${pantalla}_suplementosPendientes)}"--%>
         <c:if test="${ ! empty datos_poliza && (empty sessionScope.axisctr020_suplementosPendientes || !sessionScope.axisctr020_suplementosPendientes)}">
                <tr>
                    <td class="campocaja" >
                        <div style="float:left;">
                        <img id="DSP_AGENDA_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_AGENDA', this)" style="cursor:pointer"/>
                        <b><axis:alt f="${pantalla}" c="DSP_AGENDA_LIT" lit="9001769"/></b>
                        </div>
                        <axis:visible c="AGENDA_LIT_TWO" f="${pantalla}">
                        <div style="float:right;">
                            <a href="javascript:f_gestioagenda(null,'${LISTAAPUNTESAGENDA['NPOLIZA']}','0')"><img onclick = "javascript:f_gestioagenda(null,'${LISTAAPUNTESAGENDA['NPOLIZA']}','0')" border="0" alt="<axis:alt f="${pantalla}" c="AGENDA_LIT_TWO" lit="104825"/>" title="<axis:alt f="${pantalla}" c="AGENDA_LIT_TWO" lit="104825"/>" src="images/agenda.gif"/></a>
                        </div>
                        </axis:visible>
                        <div style="clear:both;">
                        <hr class="titulo">
                        </div>

                    </td>

                </tr>
                <tr id="DSP_AGENDA_children" style="display:none">
                    <td class="campocaja" >
                    <c:set var="title0"><axis:alt f="${pantalla}" c="NPOLIZA" lit="100624"/></c:set> <!-- póliza -->
                    <c:set var="title1"><axis:alt f="${pantalla}" c="NLINEA" lit="9001189"/></c:set> <!-- Nº apunte -->
                    <c:set var="title2"><axis:alt f="${pantalla}" c="TTIPREG" lit="9000715"/></c:set> <!-- Concepto -->
                    <c:set var="title3"><axis:alt f="${pantalla}" c="TTIPLIN" lit="9001195"/></c:set> <!-- Tipo apunte -->
                    <c:set var="title4"><axis:alt f="${pantalla}" c="FALTA" lit="9001192"/></c:set> <!-- Fecha alta -->
                    <c:set var="title5"><axis:alt f="${pantalla}" c="TTITULO" lit="9001196"/></c:set> <!-- Título apunte -->
                    <c:set var="title6"><axis:alt f="${pantalla}" c="TTEXTLIN" lit="9001197"/></c:set> <!-- Texto apunte -->
                    <c:set var="title7"><axis:alt f="${pantalla}" c="CUSUALT" lit="100894"/></c:set> <!-- Usuario -->
                    <c:set var="title8"><axis:alt f="${pantalla}" c="TESTADO" lit="100587"/></c:set> <!-- Estado -->
                    <c:set var="title9"><axis:alt f="${pantalla}" c="FFINALI" lit="9001198"/></c:set> <!-- Fecha finalización -->
                    <c:set var="title10"><axis:alt f="${pantalla}" c="BT_EDIT_AGENDA" lit="9000552"/></c:set> <!-- Modificar -->
                    <c:set var="title11"><axis:alt f="${pantalla}" c="BT_MASDATOS_AGENDA" lit="1000113"/></c:set> <!-- Detall 11177.NMM. -->

                     <div class="displayspace">

                        <display:table name="${lstagenda}" id="LISTAAPUNTESAGENDA" export="false" class="dsptgtable"  pagesize="-1"
                        requestURI="axis_${pantalla}.do?paginar=true&subseccion=DSP_AGENDA" sort="list" cellpadding="0" cellspacing="0">
                        <%@ include file="../include/displaytag.jsp"%>

                        <%--  --%>
                        <display:column title="${title1}" sortable="true" sortProperty="NLINEA" style="width:8%;" headerClass="sortable fixed"  media="html" autolink="false" >
                            <div class="dspText">${LISTAAPUNTESAGENDA['NLINEA']}</div>
                        </display:column>
                        <display:column title="${title2}" sortable="true" sortProperty="TTIPREG" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                            <div class="dspText">${LISTAAPUNTESAGENDA['TTIPREG']}</div>
                        </display:column>
                        <display:column title="${title5}" sortable="true" sortProperty="TTITULO" style="width:18%;" headerClass="sortable fixed"  media="html" autolink="false" >
                            <div class="dspText">${LISTAAPUNTESAGENDA['TTITULO']}</div>
                        </display:column>
                        <display:column title="${title4}" sortable="true" sortProperty="FALTA" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                            <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${LISTAAPUNTESAGENDA['FALTA']}"/></div>
                        </display:column>
                        <display:column title="${title7}" sortable="true" sortProperty="CUSUALT" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                            <div class="dspText">${LISTAAPUNTESAGENDA['CUSUALT']}</div>
                        </display:column>
                         <axis:visible f="${pantalla}" c="CESTADO_OBS">
                        <display:column title="${title8}" sortable="true" sortProperty="TESTADO" style="width:15%;" headerClass="sortable fixed"  media="html" autolink="false" >
                            <div class="dspText">${LISTAAPUNTESAGENDA['TESTADO']}</div>
                        </display:column>
                      </axis:visible>
                        <display:column title="${title9}" sortable="true" sortProperty="FFINALI" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                            <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${LISTAAPUNTESAGENDA['FFINALI']}"/></div>
                        </display:column>
                       <!----------------------------------------------------------------------------------------------------------------------------------------------------->
                       <axis:visible f="${pantalla}" c="BT_EDIT_AGENDA">
                         <display:column title="${title10}" headerClass="sortable fixed" media="html" style="width:7%;" autolink="false"  >
                         <c:if test="${LISTAAPUNTESAGENDA['CESTADO'] != 1 || __configform.axisctr020__AGENDACESTADOFINALIZADO__visible == 'true'}">
                            <axis:visible f= "${pantalla}" c="AGENDACESTADOFINALIZADO_LIT">
                            <div class="dspIcons" id="BT_MODIF_AGENDA" align="left"><img border="0" alt="<axis:alt f="${pantalla}" c="AGENDACESTADOFINALIZADO_LIT" lit="9001330"/>" title1="<axis:alt f="${pantalla}" c="AGENDACESTADOFINALIZADO_LIT" lit="9001330"/>" src="images/lapiz.gif"
                             style="cursor:pointer;" onclick="f_gestioagenda('${LISTAAPUNTESAGENDA['NLINEA']}','${LISTAAPUNTESAGENDA['NPOLIZA']}','1')"/></div>
                             </axis:visible>
                         </c:if>
                         </display:column>
                        </axis:visible>
                        
                       <!------------------------------------------------------------------------------------------------------------------------------------------------------>
                        <!-- Ara no és el botó de més dades, és Detall. -->
                        <!-- <div class="dspIcons"><img border="0" alt="" title1="" src="images/mes.gif" width="11px" height="11px"
                             style="cursor:pointer;"   onmouseover="javascript:mostrar('SECCION_A${LISTAAPUNTESAGENDA['NLINEA']}')"  />
                        -->
                        <axis:visible f="${pantalla}" c="BT_MASDATOS_AGENDA">
                             <display:column title="${title11}" headerClass="sortable fixed" media="html" style="width:7%;" autolink="false" >
                                <div class="dspIcons"><img border="0" alt="<axis:alt f="${pantalla}" c="BT_MASDATOS_AGENDA" lit="1000113"/>" title1="<axis:alt f="${pantalla}" c="BT_MASDATOS_AGENDA" lit="1000113"/>" src="images/mes.gif" width="11px" height="11px"
                                style="cursor:pointer;"   onclick="f_ConsultaAgenda('${LISTAAPUNTESAGENDA['NLINEA']}','${LISTAAPUNTESAGENDA['NPOLIZA']}','1')"  />
                                </div>
                            </display:column>   <%--onmouseout="javascript:ocultar('SECCION_A${LISTAAPUNTESAGENDA['NLINEA']}')"--%>
                        </axis:visible>
                        
                        <axis:visible f="${pantalla}" c="BT_LISTA_APUNTES_AGENDA">
                            <!-- *************************** SECCION MÁS DATOS ********************************* -->
                            <display:column class="seccion_informacion">
                                <div id="SECCION_A${LISTAAPUNTESAGENDA['NLINEA']}" class="seccion_informacion">
                                    <!-- INICIO SECCION -->
                                    <div align="right">
                                    <img  src="images/but_cerrar.gif" alt="<axis:alt f="${pantalla}" c="APUNTES_AGENDA_LIT" lit="1000430"/>" onclick="javascript:ocultar('SECCION_A${LISTAAPUNTESAGENDA['NLINEA']}')" style="cursor:pointer"/>
                                    </div>

                                    <table class="area" align="center">
                                         <tr>
                                            <th style="width:50%;height:0px"></th>
                                            <th style="width:50%;height:0px"></th>
                                         </tr>
                                         <tr>
                                            <%-- Campo 1 --%>
                                            <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                <b>${title3}</b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <%-- Campo 1 --%>
                                              <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                <input type="text" class="campo campotexto" id="TMANUAL" name="TMANUAL" size="15" style="width:90%"
                                                value="${LISTAAPUNTESAGENDA['TMANUAL']}" readonly="readonly"/>

                                            </td>
                                        </tr>
                                        <tr>
                                            <%-- Campo 1 --%>
                                            <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                <b>${title6}</b>
                                            </td>
                                        </tr>
                                        <tr>
                                             <%-- CAMPO 1 --%>
                                            <td class="campocaja" style="background-color:white;border-right-width: 0px;" colspan="2">
                                           <textarea name="TTEXTOS" rows="5" cols="50" class="campo campotexto" readonly>${LISTAAPUNTESAGENDA['TTEXTOS']}</textarea>
                                            </td>

                                        </tr>

                                        </table>
                                </div>
                            </display:column>
                         </axis:visible>
                            <!-- *************************** SECCION MÁS DATOS ********************************* -->
                        <%--  --%>
                        </display:table>
                    </div>

                    </td>
                </tr>
         </c:if>
         </axis:visible>
        
         <axis:visible c="DSP_TAREAS_USUARIO" f="${pantalla}">
         <%-- Bug 11177.NMM.Fer que sempre surti l'apartat de l'agenda en la consulta de pòlisses
         en el Service s'amaguen els apunts que estàn anul·lats ( cestado = 2).
         Afegim el "! empty datos_poliza && ", perquè si entrem a consultar però sortim sense
         consultar, queda l'apartat de l'agenda a dalt de tot de la pantalla.
         c:if test="${! empty lstagenda && (empty sessionScope.${pantalla}_suplementosPendientes || !sessionScope.${pantalla}_suplementosPendientes)}"--%>
         <c:if test="${ ! empty datos_poliza && (empty sessionScope.axisctr020_suplementosPendientes || !sessionScope.axisctr020_suplementosPendientes)}">
                <tr>
                    <td class="campocaja" >
                        <div style="float:left;">
                        <img id="DSP_TAREAS_USUARIO_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_TAREAS_USUARIO', this)" style="cursor:pointer"/>
                        <b><axis:alt f="${pantalla}" c="DSP_TAREAS_USUARIO_LIT" lit="9901963"/></b>
                        </div>
                        
                        <axis:visible c="BT_ALTA_AGD_AGENDA" f="${pantalla}">
                        <div style="float:right;">
                            <a href="javascript:f_agd_gestioagenda_alta(null,'${miListaId['IDAGENDA']}','${datos_poliza.NPOLIZA}','${datos_poliza.NCERTIF}','ALTA_CONS')"><img onclick="javascript:f_agd_gestioagenda_alta(null,'${miListaId['IDAGENDA']}','${datos_poliza.NPOLIZA}','${datos_poliza.NCERTIF}','ALTA_CONS')" border="0" alt="<axis:alt f="${pantalla}" c="BT_ALTA_AGD_AGENDA" lit="104825"/>" title="<axis:alt f="${pantalla}" c="BT_ALTA_AGD_AGENDA" lit="104825"/>" src="images/agenda.gif"/></a>
                        </div>
                        </axis:visible>
                        
                        <div style="clear:both;">
                        <hr class="titulo">
                        </div>

                    </td>
                </tr>
                
                <tr id="DSP_TAREAS_USUARIO_children" style="display:none">
                    <td class="campocaja" >
                    <c:set var="title1"><axis:alt f="${pantalla}" c="IDAPUNTE" lit="9001189"/></c:set> <!-- Nº apunte -->
                    <c:set var="title2"><axis:alt f="${pantalla}" c="TCONAPU" lit="9000715"/></c:set> <!-- Concepto -->
                    <c:set var="title3"><axis:alt f="${pantalla}" c="TTITAPU" lit="9001196"/></c:set> <!-- Tipo apunte -->
                    <c:set var="title4"><axis:alt f="${pantalla}" c="FALTA" lit="9001192"/></c:set> <!-- Fecha alta -->
                    <c:set var="title6"><axis:alt f="${pantalla}" c="CUSUARI" lit="100894"/></c:set> <!-- Usuario -->
                    <c:set var="title7"><axis:alt f="${pantalla}" c="TESTAPU" lit="100587"/></c:set> <!-- Estado -->
                    <c:set var="title8"><axis:alt f="${pantalla}" c="FESTAPU" lit="9901964"/></c:set> <!-- Fecha Apunte -->
                    <c:set var="title9"><axis:alt f="${pantalla}" c="BT_EDIT_AGENDA" lit="9000552"/></c:set> <!-- Modificar -->
                    <c:set var="title10"><axis:alt f="${pantalla}" c="BT_MASDATOS_AGENDA" lit="1000113"/></c:set> <!-- Detall 11177.NMM. -->

                     <div class="displayspace">
                        <display:table name="${lstagdagenda}" id="miListaId" export="false" class="dsptgtable"  pagesize="-1"
                        requestURI="axis_${pantalla}.do?paginar=true&subseccion=DSP_TAREAS_USUARIO" sort="list" cellpadding="0" cellspacing="0">
                        <%@ include file="../include/displaytag.jsp"%>

                        <%--  --%>
                        <axis:visible c="IDAPUNTE" f="${pantalla}">
                            <display:column title="${title1}" sortable="true" sortProperty="IDAPUNTE" style="width:8%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText">${miListaId['IDAPUNTE']}</div>
                            </display:column>
                        </axis:visible>
                        <axis:visible c="TCONAPU" f="${pantalla}">
                            <display:column title="${title2}" sortable="true" sortProperty="TCONAPU" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText">${miListaId['TCONAPU']}</div>
                            </display:column>
                        </axis:visible>    
                        <axis:visible c="TTITAPU" f="${pantalla}">
                            <display:column title="${title3}" sortable="true" sortProperty="TTITAPU" style="width:18%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText">${miListaId['TTITAPU']}</div>
                            </display:column>
                        </axis:visible>    
                        <axis:visible c="FALTA" f="${pantalla}">
                            <display:column title="${title4}" sortable="true" sortProperty="FALTA" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId['FALTA']}"/></div>
                            </display:column>
                        </axis:visible>
                        <axis:visible c="CUSUARI" f="${pantalla}">
                            <display:column title="${title6}" sortable="true" sortProperty="CUSUARI" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText">${miListaId['CUSUARI']}</div>
                            </display:column>
                        </axis:visible>
                        <axis:visible c="TESTAPU" f="${pantalla}">
                            <display:column title="${title7}" sortable="true" sortProperty="TESTAPU" style="width:15%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText">${miListaId['TESTAPU']}</div>
                            </display:column>
                        </axis:visible>    
                        <axis:visible c="FESTAPU" f="${pantalla}">
                            <display:column title="${title8}" sortable="true" sortProperty="FESTAPU" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId['FESTAPU']}"/></div>
                            </display:column>
                        </axis:visible>    
                       <!----------------------------------------------------------------------------------------------------------------------------------------------------->
                       <axis:visible f="${pantalla}" c="BT_EDIT_AGD_AGENDA">
                         <display:column title="${title9}" headerClass="sortable fixed" media="html" style="width:7%;" autolink="false"  >
                         <c:if test="${miListaId['CESTAPU'] != 1 || __configform.axisctr020__AGENDACESTADOFINALIZADO__visible == 'true'}">
                             <axis:visible f= "${pantalla}" c="AGENDACESTADOFINALIZADO_LIT">
                             <div class="dspIcons" align="left"><img border="0" alt="<axis:alt f="${pantalla}" c="AGENDACESTADOFINALIZADO_LIT" lit="9001330"/>" title1="<axis:alt f="${pantalla}" c="AGENDACESTADOFINALIZADO_LIT" lit="9001330"/>" src="images/lapiz.gif"
                             style="cursor:pointer;" onclick="f_agd_gestioagenda('${miListaId['IDAPUNTE']}','${miListaId['IDAGENDA']}','MODIF_AGEN')"/></div>
                             </axis:visible>
                         </c:if>
                         </display:column>
                        </axis:visible>
                        
                       <!------------------------------------------------------------------------------------------------------------------------------------------------------>
                        <!-- Ara no és el botó de més dades, és Detall. -->
                        <!-- <div class="dspIcons"><img border="0" alt="" title1="" src="images/mes.gif" width="11px" height="11px"
                             style="cursor:pointer;"   onmouseover="javascript:mostrar('SECCION_A${LISTAAPUNTESAGENDA['NLINEA']}')"  />
                        -->
                        <axis:visible f="${pantalla}" c="BT_MASDATOS_AGD_AGENDA">
                             <display:column title="${title10}" headerClass="sortable fixed" media="html" style="width:7%;" autolink="false" >
                                <div class="dspIcons"><img border="0" alt="<axis:alt f="${pantalla}" c="BT_MASDATOS_AGD_AGENDA" lit="1000113"/>" title1="<axis:alt f="${pantalla}" c="BT_MASDATOS_AGD_AGENDA" lit="1000113"/>" src="images/mes.gif" width="11px" height="11px"
                                style="cursor:pointer;"   onclick="f_agd_gestioagenda('${miListaId['IDAPUNTE']}','${miListaId['IDAGENDA']}','CONSULTA')"  />
                                </div>
                            </display:column>   <%--onmouseout="javascript:ocultar('SECCION_A${LISTAAPUNTESAGENDA['NLINEA']}')"--%>
                        </axis:visible>
                           
                        </display:table>
                    </div>
                    </td>
                </tr>
        </c:if>
        </axis:visible> 