<%/**
*  Fichero: axisctr031_body2.jsp
*
*  S?ptima pantalla del flujo de trabajo "Ahorros y rentas". És el cuerpo 
*
*
*  Fecha: 15/11/2010
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pantalla" value="axisctr031"/>
<c:set var="literalPantalla" value="1000197"/>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<axis:visible f="axisctr031" c="DSP_RESULTATS">   
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr031" c="DSP_RESULTATS" lit="1000345" /><axis:visible c="CMONPROD" f="axisctr031">  <c:if test="${!empty CMONPROD}"><axis:alt f="axisctr031" c="CMONPROD" lit="108645"/> :  ${CMONPRODINT} - ${requestScope.TMONPROD} </c:if> </axis:visible></div>
                <!--campos-->
                <table class="seccion">
                    <tr>
                        <td align="left">
                            <!-- DisplayTag detalle primas -->
                            <c:set var="title0"><axis:alt f="axisctr031" c="IPRITOT" lit="1000497"/></c:set>     <!-- IPRIANU / IPRITOT -->
                            <c:set var="title1"><axis:alt f="axisctr031" c="IIPS" lit="101515"/></c:set>         <!-- IIPS -->
                            <c:set var="title2"><axis:alt f="axisctr031" c="IDGS" lit="1000498"/></c:set>        <!-- IDGS -->
                            <c:set var="title3"><axis:alt f="axisctr031" c="ICONSOR" lit="103101"/></c:set>      <!-- ICONSOR -->                            
                            <c:set var="title4"><axis:alt f="axisctr031" c="IRECFRA" lit="1000341"/></c:set>     <!-- IRECFRA -->
                            <c:set var="title5"><axis:alt f="axisctr031" c="IRECARG" lit="101671"/></c:set>      <!-- PRECARG -->
                            <c:set var="title6"><axis:alt f="axisctr031" c="IEXTRAP" lit="101918"/></c:set>      <!-- IEXTRAP -->                                        
                            <c:set var="title7"><axis:alt f="axisctr031" c="ITOTDTO" lit="1000119"/></c:set>     <!-- PDTOCOM -->
                            <c:set var="title8"><axis:alt f="axisctr031" c="ITOTALR" lit="140531"/></c:set>      <!-- ITOTALR -->       
                            <c:set var="title9"><axis:alt f="axisctr031" c="IPRITAR" lit="1000496"/></c:set>     <!-- IPRITAR -->
                            <c:set var="title10"><axis:alt f="axisctr031" c="IPRIREB" lit="9000837"/></c:set>    <!-- IPRIREB -->
                            <c:set var="title11"><axis:alt f="axisctr031" c="IARBRIT" lit="101705"/></c:set>     <!-- IARBRIT -->       
                            <c:set var="title12"><axis:alt f="axisctr031" c="ICDERREG" lit="9001509"/></c:set>   <!-- ICDERREG -->       
                            <c:set var="title13"><axis:alt f="axisctr031" c="IEXTRAP" lit="101918"/></c:set>     <!-- IEXTRAP --> 
                            <div class="displayspace">
                                 <display:table name="${sessionScope.axisctr_primasTotales}" id="axisctr_primasTotales" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                  requestURI="axis_${pantalla}.do?paginar=true">
                                     <%@ include file="../include/displaytag.jsp"%>
                                    <axis:visible f="axisctr031" c="CIPRITAR">
                                         <display:column title="${title9}" sortable="false" sortProperty="IPRITAR" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IPRITAR}'/></div>
                                         </display:column>
                                     </axis:visible> 
                                     <axis:visible f="axisctr031" c="IIEXTRAP">
                                         <display:column title="${title13}" sortable="false" sortProperty="IIEXTRAP" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IIEXTRAP}'/></div>
                                         </display:column> 
                                     </axis:visible>  
                                     <axis:visible f="axisctr031" c="IRECARG">
                                         <display:column title="${title5}" sortable="false" sortProperty="IRECARG" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IRECARG}'/></div>
                                         </display:column>
                                     </axis:visible>                                    
                                     <axis:visible f="axisctr031" c="ITOTDTO">
                                         <display:column title="${title7}" sortable="false" sortProperty="ITOTDTO" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.ITOTDTO}'/></div>
                                         </display:column> 
                                     </axis:visible>
                                     <axis:visible f="axisctr031" c="IPRITOT">
                                         <display:column title="${title0}" sortable="false" sortProperty="IPRITOT" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IPRITOT}'/></div>
                                         </display:column>
                                     </axis:visible>
                                     <axis:visible f="axisctr031" c="ICONSOR">
                                        <display:column title="${title3}" sortable="false" sortProperty="ICONSOR" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                            <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.ICONSOR}'/></div>
                                        </display:column>                     
                                     </axis:visible>  
                                     <axis:visible f="axisctr031" c="IRECFRA">
                                         <display:column title="${title4}" sortable="false" sortProperty="IRECFRA" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IRECFRA}'/></div>
                                         </display:column>                                                                                                                           
                                     </axis:visible>   
                                     <axis:visible f="axisctr031" c="IIPS">
                                         <display:column title="${title1}" sortable="false" sortProperty="IIPS" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IIPS}'/></div>
                                         </display:column>  
                                     </axis:visible>   
                                     <axis:visible f="axisctr031" c="IDGS">
                                         <display:column title="${title2}" sortable="false" sortProperty="IDGS" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IDGS}'/></div>
                                         </display:column>
                                     </axis:visible>
                                     <axis:visible f="axisctr031" c="IARBITR">
                                         <display:column title="${title11}" sortable="false" sortProperty="IARBITR" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IARBITR}'/></div>
                                         </display:column> 
                                     </axis:visible>                                                               
                                     
                                     <axis:visible f="axisctr031" c="ICDERREG">
                                         <display:column title="${title12}" sortable="false" sortProperty="ICDERREG" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.ICDERREG}'/></div>
                                         </display:column> 
                                     </axis:visible>   
                                     <axis:visible f="axisctr031" c="ITOTALR">
                                         <display:column title="${title8}" sortable="false" sortProperty="ITOTALR" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.ITOTALR}'/></div>
                                         </display:column> 
                                     </axis:visible>
                                     <axis:visible f="axisctr031" c="IPRIREB">
                                         <display:column title="${title10}" sortable="false" sortProperty="IPRIREB" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IPRIREB}'/></div>
                                         </display:column> 
                                     </axis:visible>       
                                    
                                    </display:table>
                             </div>
                         </td>
                     </tr>
                     
                   
                </table>
            </td>
        </tr>
        </axis:visible>
        <tr>
            <axis:visible f="axisctr031" c="but_tarifar"> 
                <td align="center">
                    <div class="separador">&nbsp;</div>
                    <input type="button" class="boton" id="but_tarifar" value="<axis:alt f="axisctr031" c="BT_TARIFAR" lit="101688"></axis:alt>" onclick="javascript:f_tarifar()" />
                <td>
            </axis:visible>
        </tr>
        <tr>
                <td>
        
                <%-- ******************************** Sección Selección Perfil Modelo de Inversión **************************************** --%>
                
                <div class="separador">&nbsp;</div>             
                
                <!-- Bug 20995 - RSC 06/03/2012 -->
                <c:if test="${!empty requestScope.POLISSA_INI}">
                    <input type="hidden" name="POLISSA_INI" id="POLISSA_INI" value="1"/>
                </c:if>
                <c:if test="${empty requestScope.POLISSA_INI}">
                    <input type="hidden" name="POLISSA_INI" id="POLISSA_INI" value="0"/>
                </c:if>
                <!-- Bug 20995 -Fin RSC 06/03/2012 -->
                
                <axis:visible f="axisctr031" c="DSP_MODELOSINV">
                    <div class="titulo"><img src="images/flecha.gif"/>
                        <axis:alt f="axisctr031" c="DSP_MODELOSINV" lit="9001351"></axis:alt> 
                    </div>
                    <table class="seccion">
                        <tr>
                            <td align="left">
                                <table class="area" align="center">
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr031" c="NMODELO" lit="9001350"></axis:alt> </b>
                                        </td>
                                    </tr>
                                    <tr>
                                      
                                           <td class="campocaja">
                                                    <select name="NMODELO" id="NMODELO" title="<axis:alt f="axisctr031" c="NMODELO" lit="9001350"/>"                                           
                                                            <axis:atr f="axisctr031" c="NMODELO" a="obligatorio=true&modificable=true&isInputText=false"/>                                                    
                                                             <c:if test="${!empty requestScope.LST_PERFILES && fn:length(requestScope.LST_PERFILES)==1}">
                                                                                                                                disabled="true"
                                                             </c:if>                                                    
                                                            size="1" class="campowidthselect campo campotexto" style="width:40%;"
                                                    onchange="f_recargarInversion();">&nbsp;
                                                        <!-- BFP bug:0020309
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr031" c="LST_PERFILES" lit="1000348"/> - </option>
                                                        -->
                                                        <c:forEach var="element" items="${requestScope.LST_PERFILES}">
                                                            <option value="${element.CMODINV}"
                                                                        <c:if test="${__formdata.NMODELO == element.CMODINV || (!empty requestScope.LST_PERFILES && fn:length(requestScope.LST_PERFILES)==1)}"> selected="selected"</c:if>>
                                                                ${element.TMODINV}   
                                                            </option>
                                                        </c:forEach>
                                                    </select>                                            
                                            </td>   
                                    </tr>                                        
                                    <axis:visible f="axisctr031" c="DSP_MODELOSINV_DET">
                                        <tr>
                                            <td>
                                                <c:set var="title0"><axis:alt f="axisctr031" c="CODFONDO" lit="9001352"/></c:set>    <!-- Cod. Fondo -->
                                                <c:set var="title1"><axis:alt f="axisctr031" c="FONDO" lit="108263"/></c:set>     <!-- Fondo -->
                                                <c:set var="title2"><axis:alt f="axisctr031" c="100INVERSION" lit="9001353"/></c:set>    <!-- % de inversión -->
                                                
                                                <div class="displayspace" style="width:70%">
                                                    <display:table name="${requestScope.MODINVFONDO}" id="MODINVFONDO" export="false" class="dsptgtable" pagesize="-1"
                                                       defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" requestURI="axis_${pantalla}.do?paginar=true">
                                                         <%@ include file="../include/displaytag.jsp"%>
                                                        <axis:visible f="axisctr031" c="CCODFON">
                                                             <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PRODULKMODINVFONDO.CCODFON" headerClass="headwidth20 sortable"  media="html" autolink="false" >
                                                                 <div class="dspText">${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON}</div>
                                                             </display:column>
                                                         </axis:visible> 
                                                         <axis:visible f="axisctr031" c="TCODFON">
                                                             <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PRODULKMODINVFONDO.TCODFON" headerClass="sortable"  media="html" autolink="false" >
                                                                 <div class="dspText">${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.TCODFON}</div>
                                                             </display:column>
                                                         </axis:visible>                                    
                                                         <axis:visible f="axisctr031" c="PINVERS">
                                                             <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_PRODULKMODINVFONDO.PINVERS" headerClass="headwidth20 sortable"  media="html" autolink="false" >
                                                                 <div class="dspText">${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.PINVERS}</div>
                                                             </display:column>
                                                        </axis:visible>
                                                    </display:table>
                                                    
                                                    <c:choose>
                                                        <c:when test="${!empty requestScope.MODINVFONDO}">
                                                            <c:if test="${ !(fn:containsIgnoreCase(header['User-Agent'],'ipad') ) }">
                                                                <script language="javascript">objUtiles.retocarDsptagtable("MODINVFONDO");</script>
                                                            </c:if>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <script language="javascript">
                                                               objLista.esconderListaSpans();
                                                               objLista.esconderListaLinks();     
                                                            </script>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </td>
                                        </tr>
                                    </axis:visible>
                                </table>   
                            </td>
                        </tr>
                    </table>
                </axis:visible>
            </td>
        </tr>
    <tr>
    <td>
    <axis:visible f="axisctr031" c="DSP_EVOLUPROVMAT">    
    <div class="separador">&nbsp;</div>
    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr031" c="DIVELUPROV" lit="9908071"/></div>    
    <table class="seccion">
     <tr>
     <td>
     <table class="area" align="center"> 
     <tr>
     <td>
       <table class="area" align="left" cellspacing="0"  cellpadding="0" style="width:200px">
       <tr>
         <axis:visible f="axisctr031" c="CESCENA">
           <td class="titulocaja" width="10%">
             <b><axis:alt f="axisctr031" c="LESCENA" lit="9908029"></axis:alt></b>
           </td>
         </axis:visible>
           <axis:visible f="axisctr031" c="CESCENA">
           <td class="campocaja" width="90%">
           <select name = "NESCENA" id ="NESCENA" onchange="f_actualiza_evoluprov(${__formdata.SSEGURO},this.value,null);"  style="width:90%"
             class="campowidthselect campo campotexto_ob"  
             <axis:atr f="${pantalla}" c="NESCENA" a="obligatorio=false&modificable=true&isInputText=false"/>;
             <option value="__formdata.NESCENA"><axis:alt f="${pantalla}" c="SEL" lit="1000348"/></option>
             <c:forEach var="element" items="${__formdata.listValores.tipEscen}">
             <option value = "${element.CATRIBU}">${element.TATRIBU}</option>
             </c:forEach>
           </select>
           </td>
         </axis:visible>
       </tr>
       </table>
    </td>
    </tr>    
    <tr>
    <td class="campocaja" >
         <div class="fixedHeaderTable">
          <c:set var="title0"><axis:alt f="axisctr031" c="NANYO" lit="101606" /></c:set>
          <c:set var="title1"><axis:alt f="axisctr031" c="FPROVMAT" lit="100562" /></c:set>
          <c:set var="title2"><axis:alt f="axisctr031" c="IPROVMAT" lit="1000518" /></c:set>
          <c:set var="title3"><axis:alt f="axisctr031" c="PRESCATE" lit="1000522" /></c:set>
          <c:set var="title4"><axis:alt f="axisctr031" c="PINTTEC" lit="9901247" /></c:set>
          <c:set var="title5"><axis:alt f="axisctr031" c="IVALRES" lit="102731" /></c:set>
          <c:set var="title6"><axis:alt f="axisctr031" c="IPRIMA" lit="101368" /></c:set>
        
          <display:table name="${evoluprovmatseg}" id="evoluprovmatseg" export="false" class="dsptgtable" pagesize="-1" defaultorder="descending" sort="list" cellpadding="0" cellspacing="0" style="width:100%"
           requestURI="axis_${pantalla}.do?paginar=true&tabla=tomador"> 
                <%@ include file="../include/displaytag.jsp"%>
		<axis:visible f="${pantalla}" c="NANYO">
                <display:column title="${title0}" sortable="true" sortProperty="evoluprovmatseg.NANYO" headerClass="sortable fixed"  media="html" autolink="false" >
                  <div class="dspNumber"><fmt:formatNumber value='${evoluprovmatseg.NANYO}' pattern="###,##0"/></div>
                </display:column>
		</axis:visible>
		<axis:visible f="${pantalla}" c="FPROVMAT">
                <display:column title="${title1}" sortable="true" sortProperty="evoluprovmatseg.FPROVMAT" headerClass="sortable fixed"  media="html" autolink="false" >
                    <div class="dspText"><fmt:formatDate value='${evoluprovmatseg.FPROVMAT}' pattern='dd/MM/yyyy'/></div>
                </display:column>
		</axis:visible>
		<axis:visible f="${pantalla}" c="IPROVMAT">
                <display:column title="${title2}" sortable="true" sortProperty="evoluprovmatseg.IPROVMAT" headerClass="sortable fixed"  media="html" autolink="false" >
                    <div class="dspNumber"><fmt:formatNumber value="${evoluprovmatseg.IPROVMAT}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/></div>
                </display:column>
		</axis:visible> 
		<axis:visible f="${pantalla}" c="PRESCATE">
                <display:column title="${title3}" sortable="true" sortProperty="evoluprovmatseg.PRESCATE" headerClass="sortable fixed" media="html" autolink="false" >
                    <div class="dspNumber"><fmt:formatNumber value="${evoluprovmatseg.PRESCATE}" pattern="###,##0.00"/></div>
                </display:column>
		</axis:visible> 
                <axis:visible f="${pantalla}" c="PINTTEC">
                    <display:column title="${title4}" sortable="true" sortProperty="evoluprovmatseg.PINTTEC" headerClass="sortable fixed" media="html" autolink="false" >
                        <div class="dspNumber"><fmt:formatNumber value="${evoluprovmatseg.PINTTEC}" pattern="###,##0.00"/></div>
                    </display:column>
                </axis:visible>    
                <axis:visible f="${pantalla}" c="IPRIMA">
                    <display:column title="${title6}" sortable="true" sortProperty="evoluprovmatseg.IPRIMA" headerClass="sortable fixed" media="html" autolink="false" >
                        <div class="dspNumber"><fmt:formatNumber value="${evoluprovmatseg.IPRIMA}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/></div>
                    </display:column>
                </axis:visible>
                <axis:visible f="${pantalla}" c="IVALRES">
                    <display:column title="${title5}" sortable="true" sortProperty="evoluprovmatseg.IVALRES" headerClass="sortable fixed" media="html" autolink="false" >
                        <div class="dspNumber"><fmt:formatNumber value="${evoluprovmatseg.IVALRES}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/></div>
                    </display:column>
                </axis:visible>
           </display:table>
          </div>
    </td>
    </tr>
    </table>
    </td>
    </tr>
    </table>
    </axis:visible>
                <%-- ******************************* FIN Sección Selección Perfil Modelo de Inversión ************************************* --%>
