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
<p>
    <%@ page import="java.util.ArrayList"%>
    <%@ page import="java.util.HashMap"%>
    <%  // Recuperamos parámetros de búsqueda si se ha efectuado alguna
    
        ArrayList garantias_salida = null;
        if (request.getSession().getAttribute("garantiasSortida") != null){
            garantias_salida= (ArrayList)request.getSession().getAttribute("garantiasSortida");
        }
        
        ArrayList garantias_entrada = null;
        if (request.getSession().getAttribute("garantiasEntrada") != null){
            garantias_entrada= (ArrayList)request.getSession().getAttribute("garantiasEntrada");
        }
    %>
</p>
<axis:ocultar f="${pantalla}" c="DSP_PROVISIONES_DET" dejarHueco="false">
    <table class="area" align="center">
         <tr>
                <td class="campocaja" >
                       <img id="DSP_PROVGAR_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_PROVISIONES_DET', this);f_actualizar_provisiones()" style="cursor:pointer"/>
                            <b><axis:alt f="${pantalla}" c="LIT_DSP_PROVGAR" lit="102656"></axis:alt></b>
                            <hr class="titulo">
                </td>
        </tr>
        <tr id="DSP_PROVGAR1_children" style="display:none">
            <td class="campocaja">
                <table class="area" align="center">
                    <tr>
                        <axis:ocultar f="${pantalla}" c="PROVPOL" dejarHueco="false">
                        <td class="titulocaja">
                          <b><axis:alt f="${pantalla}" c="PROVPOL" lit="9900857"></axis:alt></b>
                        </td>
                        <td class="campocaja" width="75%">
                            &nbsp;
                        </td>
                        </axis:ocultar>
                    </tr>
                    <tr>
                        <!-- Provisión -->
                        <axis:ocultar f="${pantalla}" c="PROVPOL" dejarHueco="false">
                        <td class="campocaja">
                            <input type="text" class="campowidthinput campo campotexto" id="PROVPOL" name="PROVPOL" size="15"
                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.GARANDEF.PROVPOL.impprovision}'/>" readonly="true"/>
                        </td>
                        <td class="campocaja" width="75%">
                            &nbsp;
                        </td>
                        </axis:ocultar>
                    </tr>
                </table>
            </td>
        </tr>
        <axis:visible c="PROVGAR_LIT" f="axisctr020">
        <tr id="DSP_PROVGAR2_children" style="display:none">
            <td class="titulocaja">
              <b><axis:alt f="${pantalla}" c="LIT_PROVPOL" lit="9900858"></axis:alt></b>
            </td>
        </tr>
        </axis:visible>
		<jsp:useBean id="today" class="java.util.Date" /> 
        <tr id="DSP_PROVGAR3_children" style="display:none">
            <td class="titulocaja" colspan = "3">
                <div class="separador">&nbsp; </div>                                                                                                                            
                <%-- DisplayTag Red Comercial --%>
                <c:set var="title0"><axis:alt f="axisctr020" c="LITERA1" lit="1000109"/></c:set>   <%-- Garantía  --%>
                <c:set var="title1"><axis:alt f="axisctr020" c="LITERA2" lit="100561"/></c:set>   <%-- Garantía  --%>
                <c:set var="title2"><axis:alt f="axisctr020" c="LITERA3" lit="1000073" /></c:set>
                <c:set var="title3"><axis:alt f="axisctr020" c="LITERA4" lit="1000497" /></c:set>
                <c:set var="title4"><axis:alt f="axisctr020" c="LITERA5" lit="9001755" /></c:set>
                <c:set var="title5"><axis:alt f="axisctr020" c="LITERA6" lit="1000518"/></c:set>  <%-- Provisión --%>
                <c:set var="title6"><axis:alt f="axisctr020" c="LITERA7" lit="9900891"/></c:set>  <%-- Valor de reducción --%>
                <c:set var="title7"><axis:alt f="axisctr020" c="LITERA8" lit="1000113"/></c:set>  <%-- Detalle --%>
                <c:set var="title8"><axis:alt f="axisctr020" c="LITERA9" lit="9902632"/></c:set>  <%-- Valor de rescate --%>
                
                <div class="displayspaceGrande">
                    <display:table name="${__formdata.GARANDEF}" id="GARANDEF" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                         requestURI="axis_${pantalla}.do?paginar=true">
                        <%@ include file="../include/displaytag.jsp"%>
                        <axis:visible c="GARANPROV_CGARANT" f="axisctr020">
                            <display:column title="${title0}" sortable="true" sortProperty="GARANDEF.GARANPROV.OB_IAX_GARANTIAS.CGARANT" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                   ${GARANDEF.GARANPROV.OB_IAX_GARANTIAS.CGARANT}
                                </div>
                            </display:column>
                        </axis:visible>
                        <axis:visible c="GARANPROV_TGARANT" f="axisctr020">
                            <display:column title="${title1}" sortable="true" sortProperty="GARANDEF.GARANPROV.OB_IAX_GARANTIAS.TGARANT" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                   ${GARANDEF.GARANPROV.OB_IAX_GARANTIAS.TGARANT}
                                </div>
                            </display:column>
                        </axis:visible> 
                        <axis:visible c="GARANPROV_ICAPITAL" f="axisctr020">
                            <display:column title="${title2}" sortable="true" sortProperty="GARANDEF.GARANPROV.OB_IAX_GARANTIAS.ICAPITAL" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                    ${GARANDEF.GARANPROV.OB_IAX_GARANTIAS.ICAPITAL}
                                </div>
                            </display:column>
                        </axis:visible>         
                        <axis:visible c="GARANPROV_IPRIANU" f="axisctr020">
                            <display:column title="${title3}" sortable="true" sortProperty="GARANDEF.GARANPROV.OB_IAX_GARANTIAS.PRIMAS.IPRIANU" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                    ${GARANDEF.GARANPROV.OB_IAX_GARANTIAS.PRIMAS.IPRIANU}
                                </div>
                            </display:column>
                        </axis:visible>                 
                        <axis:visible c="GARANPROV_NDETGAR" f="axisctr020">
                            <display:column title="${title4}" sortable="true" sortProperty="GARANDEF.GARANPROV.OB_IAX_GARANTIAS.MASDATOS.NDETGAR" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                    ${GARANDEF.GARANPROV.OB_IAX_GARANTIAS.MASDATOS.NDETGAR}
                                </div>
                            </display:column>
                        </axis:visible>     
                        <axis:visible c="GARANPROV_PROVMAT" f="axisctr020">
                            <display:column title="${title5}" sortable="true" sortProperty="GARANDEF.GARANPROV.OB_IAX_GARANTIAS.MASDATOS.PROVMAT" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                    ${GARANDEF.GARANPROV.OB_IAX_GARANTIAS.MASDATOS.PROVMAT}
                                </div>
                            </display:column>
                        </axis:visible>
                        <axis:visible c="GARANPROV_IREDUCC" f="axisctr020">
                            <display:column title="${title6}" sortable="true" sortProperty="GARANDEF.GARANPROV.OB_IAX_GARANTIAS.MASDATOS.IREDUCC" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                    ${GARANDEF.GARANPROV.OB_IAX_GARANTIAS.MASDATOS.IREDUCC}
                                </div>
                            </display:column>
                        </axis:visible>
                        <axis:visible c="GARANPROV_VALRESC" f="axisctr020">
                            <display:column title="${title8}" sortable="true" sortProperty="GARANDEF.GARANPROV.OB_IAX_GARANTIAS.MASDATOS.VALRESC" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                    ${GARANDEF.GARANPROV.OB_IAX_GARANTIAS.MASDATOS.VALRESC}
                                </div>
                            </display:column>
                        </axis:visible>
                        
                         <axis:visible f="axisctr020" c="GARANPROV_DETPROV">
                         <display:column title="${title7}" sortable="true" headerClass="sortable" media="html" autolink="false">
                             <div class="dspText"><img border="0" alt="${title7}" title1="${title7}" src="images/mas.gif"
                             style="cursor:pointer;" onclick="f_abrir_axisctr215('${datos_poliza.SSEGURO}','${GARANDEF.GARANPROV.OB_IAX_GARANTIAS.NMOVIMI}', '${GARANDEF.GARANPROV.OB_IAX_GARANTIAS.MASDATOS.CGARANT}','<fmt:formatDate pattern="dd/MM/yyyy" value="${today}"/>')"/></div>
                         </display:column>
                        </axis:visible>
                        
                    </display:table>                                                        
                </div>
            </td> 
        </tr>        
    </table>
</axis:ocultar>



