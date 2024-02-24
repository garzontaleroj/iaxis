<p>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%><%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
</p>
<c:choose>
    <c:when test="${empty param.f}">
        <c:set var="pantalla" value="axisctr020"/>
    </c:when>
    <c:otherwise>
        <c:set var="pantalla" value="${param.f}"/>
    </c:otherwise>
</c:choose>
<axis:ocultar f="${pantalla}" c="DSP_PROVISIONES" dejarHueco="false">
<table class="area" align="center">
<tr>
<td class="campocaja" >
<img id="DSP_PROVISIONES_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_PROVISIONES', this)" style="cursor:pointer"/>
    <b><axis:alt f="${pantalla}" c="DSP_PROVISIONES" lit="102656"></axis:alt></b>
    <hr class="titulo">
</td>
</tr>
<tr id="DSP_PROVISIONES_children" style="display:none">
<td class="campocaja" >
<table class="area" align="center">
        <tr>
            <th style="width:25%;height:0px">
                &nbsp;
            </th>
            <th style="width:25%;height:0px">
                &nbsp;
            </th>
            <th style="width:25%;height:0px">
                &nbsp;
            </th>
            <th style="width:25%;height:0px">
                &nbsp;
            </th>
        </tr>
        <tr>
            <axis:ocultar f="${pantalla}" c="IMPPROVISION" dejarHueco="false">
                <td class="titulocaja" id="td_IMPPROVISION">
                 <b><axis:alt f="${pantalla}" c="LIT_IMPPROVISION" lit="1000518"/></b>
                </td>
            </axis:ocultar>
            <axis:ocultar f="${pantalla}" c="IMPCAPFALL" dejarHueco="false">
                <td class="titulocaja" id="td_IMPCAPFALL">
                    <b><axis:alt f="${pantalla}" c="IMPCAPFALL" lit="1000519"/></b>
                </td>
            </axis:ocultar>
            <axis:ocultar f="${pantalla}" c="IMPCAPGARAN" dejarHueco="false">
                <td class="titulocaja" id="td_IMPCAPGARAN">
                    <b><axis:alt f="${pantalla}" c="IMPCAPGARAN" lit="1000521"/></b>&nbsp;<c:if test="${!empty DATOSBASICOS.FVENCIMCAPGAR}" ><b>(<fmt:formatDate pattern='dd/MM/yyyy' value='${DATOSBASICOS.FVENCIMCAPGAR}'/>)</b></c:if>
                </td>
            </axis:ocultar>
            <axis:ocultar f="${pantalla}" c="IMPCAPESTIMAT" dejarHueco="false">
                <td class="titulocaja" id="td_IMPCAPESTIMAT">
                    <b><axis:alt f="${pantalla}" c="IMPCAPESTIMAT" lit="9002136"/></b>
                </td>
            </axis:ocultar>
            <axis:ocultar f="${pantalla}" c="IMPPROVRESC" dejarHueco="false">
                <td class="titulocaja" id="td_IMPPROVRESC">
                 <b><axis:alt f="${pantalla}" c="LIT_IMPPROVRESC" lit="1000518"/></b>
                </td>
            </axis:ocultar>
            <axis:ocultar f="${pantalla}" c="VALRESC" dejarHueco="false">
                <td class="titulocaja" id="td_VALRESC">
                 <b><axis:alt f="${pantalla}" c="LIT_VALRESC" lit="9902632"/></b>
                </td>
            </axis:ocultar> 
            </tr>
        <tr>
            <!-- Provisión -->
            <axis:ocultar f="${pantalla}" c="IMPPROVISION" dejarHueco="false">
                <td class="campocaja" id="td_IMPPROVISION">
                    <input type="text" class="campowidthinput campo campotexto" id="IMPPROVISION" name="IMPPROVISION" size="15"
                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${OB_IAX_RIESGOS.OB_IAX_DATOSECONOMICOS.IMPPROVISION}'/>" readonly="true"/>
                </td>
            </axis:ocultar>
                <!-- Capital fallecido -->
            <axis:ocultar f="${pantalla}" c="IMPCAPFALL" dejarHueco="false">
                <td class="campocaja" id="td_IMPCAPFALL">
                    <input type="text" class="campowidthinput campo campotexto" id="IMPCAPFALL" name="IMPCAPFALL" size="15"
                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${OB_IAX_RIESGOS.OB_IAX_DATOSECONOMICOS.IMPCAPFALL}'/>" readonly="true"/>
                </td>
            </axis:ocultar>
            <axis:ocultar f="${pantalla}" c="IMPCAPGARAN" dejarHueco="false">
                <!-- Capital Garant. -->
                <td class="campocaja" id="td_IMPCAPGARAN">
                    <input type="text" class="campowidthinput campo campotexto" id="IMPCAPGARAN" name="IMPCAPGARAN" size="15"
                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${OB_IAX_RIESGOS.OB_IAX_DATOSECONOMICOS.IMPCAPGARAN}'/>" readonly="true"/>
                </td>
            </axis:ocultar>
            <axis:ocultar f="${pantalla}" c="IMPCAPESTIMAT" dejarHueco="false">
                <!-- Capital Estimado. -->
                <td id="td_IMPCAPESTIMAT">
                <input type="text" style="width:95%" class="campowidthinput campo campotexto" id="IMPCAPESTIMAT" name="IMPCAPESTIMAT" size="15"
                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${OB_IAX_RIESGOS.OB_IAX_DATOSECONOMICOS.IMPCAPESTIMAT}'/>" readonly="true"/>
                </td>
            </axis:ocultar>
            <!-- Provisión -->
            <axis:ocultar f="${pantalla}" c="IMPPROVRESC" dejarHueco="false">
                <td class="campocaja" id="td_IMPPROVRESC">
                    <input type="text" class="campowidthinput campo campotexto" id="IMPPROVRESC" name="IMPPROVRESC" size="15"
                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${OB_IAX_RIESGOS.OB_IAX_DATOSECONOMICOS.IMPPROVRESC}'/>" readonly="true"/>
                </td>
            </axis:ocultar>
            <!-- Valor de rescate -->
             <axis:ocultar f="${pantalla}" c="VALRESC" dejarHueco="false">
                <td class="campocaja" id="td_VALRESC">
                    <input type="text" class="campowidthinput campo campotexto" id="VALRESC" name="VALRESC" size="15"
                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${OB_IAX_RIESGOS.OB_IAX_DATOSECONOMICOS.VALRESC}'/>" readonly="true"/>
                </td>
            </axis:ocultar>    
        </tr>
</table>
<table class="area" align="center">
    <tr>
        <axis:ocultar f="${pantalla}" c="VALORESREV" dejarHueco="false">
            <th style="width:25%;height:0px">
                <b><axis:alt f="${pantalla}" c="VALORESREV" lit="9901256"/></b>
                <fmt:formatDate value="${datos_poliza.FREVISIO}" pattern="dd/MM/yyyy"/>
                <hr class="titulo">
            </th>
        </axis:ocultar>
        <th style="width:25%;height:0px">
            &nbsp;
        </th>
        <th style="width:25%;height:0px">
            &nbsp;
        </th>
        <th style="width:25%;height:0px">
            &nbsp;
        </th>
    </tr>
    <tr>
        <axis:ocultar f="${pantalla}" c="IMPPROVREVI" dejarHueco="false">
        <td class="titulocaja">
            <b>
                <axis:alt f="${pantalla}" c="IMPPROVREVI" lit="9901252">
                </axis:alt>
            </b>
        </td>
        </axis:ocultar>
        <axis:ocultar f="${pantalla}" c="IMPCAPFALLREVI" dejarHueco="false">
        <td class="titulocaja">
            <b><axis:alt f="${pantalla}" c="IMPCAPFALLREVI" lit="9901253"/></b>
        </td>
        </axis:ocultar>
        <axis:ocultar f="${pantalla}" c="IMPCAPGARREVI" dejarHueco="false">
        <td class="titulocaja">
            <b><axis:alt f="${pantalla}" c="IMPCAPGARREVI" lit="9901254"/>
            </b>&nbsp;
                <c:if test="${!empty DATOSBASICOS.FVENCIMCAPGAR}">
                <b>(<fmt:formatDate pattern='dd/MM/yyyy' value='${DATOSBASICOS.FVENCIMCAPGAR}'/>)</b>
                </c:if>
        </td>
        </axis:ocultar>
        <axis:ocultar f="${pantalla}" c="IMPCAPESTREVI" dejarHueco="false">
        <td class="titulocaja">
            <b><axis:alt f="${pantalla}" c="IMPCAPESTREVI" lit="9901255"/></b>
        </td>
        </axis:ocultar>
    </tr>
    <tr>
        <!-- Provisión -->
        <axis:ocultar f="${pantalla}" c="IMPPROVREVI" dejarHueco="false">
        <td class="campocaja">
            <input type="text" class="campowidthinput campo campotexto" id="IMPPROVREVI" name="IMPPROVREVI" size="15"
            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${OB_IAX_RIESGOS.OB_IAX_DATOSECONOMICOS.IMPPROVREVI}'/>" readonly="true"/>
        </td>
        </axis:ocultar>
        <!-- Capital fallecido -->
        <axis:ocultar f="${pantalla}" c="IMPCAPFALLREVI" dejarHueco="false">
        <td class="campocaja">
            <input type="text" class="campowidthinput campo campotexto" id="IMPCAPFALLREVI" name="IMPCAPFALLREVI" size="15"
            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${OB_IAX_RIESGOS.OB_IAX_DATOSECONOMICOS.IMPCAPFALLREVI}'/>" readonly="true"/>
    
        </td>
        </axis:ocultar>
        <!-- Capital Garant. -->
         <axis:ocultar f="${pantalla}" c="IMPCAPGARREVI" dejarHueco="false">
        <td class="campocaja">
            <input type="text" class="campowidthinput campo campotexto" id="IMPCAPGARREVI" name="IMPCAPGARREVI" size="15"
            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${OB_IAX_RIESGOS.OB_IAX_DATOSECONOMICOS.IMPCAPGARREVI}'/>" readonly="true"/>
        </td>
        </axis:ocultar>
        <!-- Capital Estimado. -->
        <axis:ocultar f="${pantalla}" c="IMPCAPESTREVI" dejarHueco="false">
        <td> 
            <input type="text" class="campowidthinput campo campotexto" id="IMPCAPESTREVI" name="IMPCAPESTREVI" size="15"
            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${OB_IAX_RIESGOS.OB_IAX_DATOSECONOMICOS.IMPCAPESTREVI}'/>" readonly="true"/>
        </td>
        </axis:ocultar>
    </tr>
</table>     
</td>
</tr>
</table>
</axis:ocultar>

<c:import url="axisctr020_garantias_provision.jsp"/>

<axis:visible f="${pantalla}" c="DSP_EVOLUPROVMAT">
<table class="area" align="center">
    <tr>
    <td class="campocaja">
       <img id="DSP_EVOLUPROVMAT_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_EVOLUPROVMAT', this)" style="cursor:pointer"/>
       <b><axis:alt f="${pantalla}" c="DSP_EVOLUPROVMAT" lit="9901259"></axis:alt></b>
       <hr class="titulo">
    </td>        
    </tr>
    <tr  id="DSP_EVOLUPROVMAT_children" style="display:none">
     <td>
     <table class="area" align="left">
     <tr>
     <td>
       <table class="area" align="left" cellspacing="0"  cellpadding="0" style="width:200px">
       <tr>
         <axis:visible f="${pantalla}" c="CESCENA">
           <td class="titulocaja"  width="10%">
             <b><axis:alt f="${pantalla}" c="CESCENA" lit="9908029"></axis:alt></b>
           </td>
         </axis:visible>
         <axis:visible f="${pantalla}" c="CESCENA">
           <td class="campocaja" width="90%">
           <select name = "NESCENA" id ="NESCENA" onchange="f_actualiza_evoluprov(${__formdata.SSEGURO},this.value,null);"  style="width:90%"
             class="campowidthselect campo campotexto_ob"  
             <axis:atr f="${pantalla}" c="NESCENA" a="obligatorio=false&modificable=true&isInputText=false"/>;
             <option value="null"><axis:alt f="${pantalla}" c="SEL" lit="1000348"/></option>
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
          <c:set var="title0"><axis:alt f="${pantalla}" c="NANYO" lit="101606" /></c:set>
          <c:set var="title1"><axis:alt f="${pantalla}" c="FPROVMAT" lit="100562" /></c:set>
          <c:set var="title2"><axis:alt f="${pantalla}" c="IPROVMAT" lit="1000518" /></c:set>
          <c:set var="title3"><axis:alt f="${pantalla}" c="PRESCATE" lit="1000522" /></c:set>
          <c:set var="title4"><axis:alt f="${pantalla}" c="PINTTEC" lit="9901247" /></c:set>
          <c:set var="title5"><axis:alt f="${pantalla}" c="IVALRES" lit="102731" /></c:set>
          <c:set var="title6"><axis:alt f="${pantalla}" c="IPRIMA" lit="101368" /></c:set>
        
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