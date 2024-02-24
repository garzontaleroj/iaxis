<p>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"
                                                                              prefix="fmt"%><%@ taglib uri="/WEB-INF/tld/displaytag-11.tld"
                                                                                                       prefix="display"%><%@ taglib uri="http://java.sun.com/jsp/jstl/functions"
                                                                                                                                    prefix="fn"%><%@ taglib uri="/WEB-INF/tld/axis-1.tld"
                                                                                                                                                            prefix="axis"%>
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
    <%@ page import="java.util.ArrayList"%><%@ page import="java.util.HashMap"%><%  // Recuperamos parámetros de búsqueda si se ha efectuado alguna

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

<c:if test="${ !empty OB_IAX_BASESTECNICAS}">
    <axis:ocultar f="${pantalla}" c="DSP_DATOSTECNICOS" dejarHueco="false">
        <tr>
            <td class="campocaja" >
                <img id="DSP_BASESTECNICAS_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_BASESTECNICAS', this)" style="cursor:pointer"/>
                <b><axis:alt f="axisctr020" c="LIT" lit="9900879" /></b>&nbsp;&nbsp;
                <hr class="titulo">
            </td>
        </tr>
        <tr id="DSP_BASESTECNICAS_children" style="display:none">
            <td>
                <table class="area" align="center">
                    <tr>
                        <td>
                            <table class="area" align="center">
                                <tr>
                                    <td class="campocaja" >
                                        <img id="DSP_FECHAS_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_FECHAS', this)" style="cursor:pointer"/>
                                        <b><axis:alt f="axisctr020" c="LIT" lit="109307" /></b>
                                        <hr class="titulo">
                                    </td>
                                </tr>
                                <tr id="DSP_FECHAS_children" style="display:none">
                                    <td> 
                                        <table>
                                            <tr>
                                                <th style="width:3%"></th>
                                                <th style="width:20%"></th>
                                                <th style="width:20%"></th>
                                                <th style="width:57%"></th>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <axis:ocultar f="${pantalla}" c="FECREVI" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr020" c="LIT" lit="105403" /></b>
                                                </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="${pantalla}" c="FECREVIANT" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr020" c="LIT" lit="9900884" /></b>
                                                </td>
                                                </axis:ocultar>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <!-- FECREVI -->
                                                <axis:ocultar f="${pantalla}" c="FECREVI" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="FECREVI" name="FECREVI" size="15"
                                                        value="<fmt:formatDate value="${OB_IAX_BASESTECNICAS.FECREVI}" pattern="dd/MM/yyyy" />" readonly="true" />
                                                </td>
                                                </axis:ocultar>
                                                <!-- FECREVIANT -->
                                                <axis:ocultar f="${pantalla}" c="FECREVIANT" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="FECREVIANT" name="FECREVIANT" size="15"
                                                        value="<fmt:formatDate value="${OB_IAX_BASESTECNICAS.FECREVIANT}" pattern="dd/MM/yyyy" />" readonly="true" />
                                                </td>
                                                </axis:ocultar>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <axis:ocultar f="${pantalla}" c="DSP_INTERESES" dejarHueco="false">
                <table class="area" align="center">
                    <tr>
                        <td>
                            <table class="area" align="center">
                                <tr>
                                    <td class="campocaja" >
                                        <img id="DSP_INTERESES_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_INTERESES', this)" style="cursor:pointer"/>
                                        <b><axis:alt f="axisctr020" c="LIT" lit="9900882" /></b>&nbsp;&nbsp;
                                        <hr class="titulo">
                                    </td>
                                </tr>
                                <tr id="DSP_INTERESES_children" style="display:none">
                                    <td> 
                                        <table>
                                            <tr>
                                                <th style="width:3%"></th>
                                                <th style="width:20%"></th>
                                                <th style="width:20%"></th>
                                                <th style="width:32%"></th>
                                                <th style="width:25%"></th>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <c:if test="${ empty OB_IAX_BASESTECNICAS.INTGARANTIAS}">
                                                    <axis:ocultar f="${pantalla}" c="INTPOL" dejarHueco="false">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="${pantalla}" c="INTPOL" lit="107049"></axis:alt></b>
                                                    </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="${pantalla}" c="INTPOLINI" dejarHueco="false">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="${pantalla}" c="INTPOLINI" lit="1000251"></axis:alt></b>
                                                    </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="${pantalla}" c="INTPOLMIN" dejarHueco="false">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="${pantalla}" c="INTPOLMIN" lit="9901395"></axis:alt></b>
                                                    </td>
                                                    </axis:ocultar>
                                                </c:if>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <c:choose>
                                                <c:when test="${ empty OB_IAX_BASESTECNICAS.INTGARANTIAS}">
                                                    <!-- Interes de la poliza -->
                                                    <axis:ocultar f="${pantalla}" c="INTPOL" dejarHueco="false">
                                                    <td class="campocaja">
                                                        <input type="text" class="campowidthinput campo campotexto" id="INTPOL" name="INTPOL" size="15"
                                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${OB_IAX_BASESTECNICAS.INTPOL}'/>" readonly="true"/>
                                                    </td>
                                                    </axis:ocultar>
                                                    <!-- Interes inicial de la poliza -->
                                                    <axis:ocultar f="${pantalla}" c="INTPOLINI" dejarHueco="false">
                                                    <td class="campocaja">
                                                        <input type="text" class="campowidthinput campo campotexto" id="INTPOLINI" name="INTPOLINI" size="15"
                                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${OB_IAX_BASESTECNICAS.INTPOLINI}'/>" readonly="true"/>
                                                    </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="${pantalla}" c="INTPOLMIN" dejarHueco="false">
                                                    <td class="campocaja">
                                                        <input style="width:51%" type="text" class="campowidthinput campo campotexto" id="INTPOLMIN" name="INTPOLMIN" size="15"
                                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${OB_IAX_BASESTECNICAS.INTPOLMIN}'/>" readonly="true"/>
                                                    </td>
                                                    </axis:ocultar>
                                                    
                                                    <tr>
                                                        <td></td>
                                                        <td class="campocaja" colspan="5">
                                                            <img id="DSP_HISINTERESES_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_HISINTERESES', this)" style="cursor:pointer"/>
                                                            <b><axis:alt f="axisctr020" c="LIT" lit="9900896" /></b>&nbsp;&nbsp;
                                                            <hr class="titulo">
                                                        </td>
                                                    </tr>
                                                    <tr id="DSP_HISINTERESES_children" style="display:none">
                                                        <td></td>
                                                        <axis:ocultar f="${pantalla}" c="DSP_INTSEGURO" dejarHueco="false">
                                                        <td class="campocaja" colspan="5">
                                                            <div class="displayspace" >
                                                                <c:set var="title0"><axis:alt f="axisctr020" c="LIT" lit="9900898" /></c:set>
                                                                <c:set var="title1"><axis:alt f="axisctr020" c="LIT" lit="9900897" /></c:set>
                                                                <c:set var="title2"><axis:alt f="axisctr020" c="LIT" lit="9900895" /></c:set>
                                                                <c:set var="title3"><axis:alt f="axisctr020" c="LIT" lit="1000251" /></c:set>
                                                       
                                                                <display:table name="${OB_IAX_BASESTECNICAS.INTSEGURO}" id="INTSEGURO" export="false" class="dsptgtable" pagesize="-1" 
                                                                            defaultorder="descending" sort="list" cellpadding="0" cellspacing="0" > 
                                                                    <%@ include file="../include/displaytag.jsp"%>
                                                                    <display:column title="${title0}" sortable="true" sortProperty="FEFEMOV" headerClass="sortable"  media="html" autolink="false" >
                                                                        <div class="dspText"><fmt:formatDate value="${INTSEGURO.OB_IAX_INTERTECSEG.FEFEMOV}" pattern="dd/MM/yyyy" /></div>
                                                                    </display:column>
                                                                    <display:column title="${title1}" sortable="true" sortProperty="FMOVDIA" headerClass="sortable"  media="html" autolink="false" >
                                                                        <div class="dspText"><fmt:formatDate value="${INTSEGURO.OB_IAX_INTERTECSEG.FMOVDIA}" pattern="dd/MM/yyyy" /></div>
                                                                    </display:column>
                                                                    <display:column title="${title2}" sortable="true" sortProperty="PINTTEC" headerClass="sortable"  media="html" autolink="false" >
                                                                        <div class="dspNumber"><fmt:formatNumber value="${INTSEGURO.OB_IAX_INTERTECSEG.PINTTEC}" pattern="###,##0.00"/></div>
                                                                    </display:column>
                                                                    <display:column title="${title3}" sortable="true" sortProperty="NINTTEC" headerClass="sortable"  media="html" autolink="false" >
                                                                        <div class="dspNumber"><fmt:formatNumber value="${INTSEGURO.OB_IAX_INTERTECSEG.NINTTEC}" pattern="###,##0.00"/></div>
                                                                    </display:column>
                                                                </display:table>
                                                            </div>
                                                        </td>
                                                        </axis:ocultar>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                    <axis:ocultar f="${pantalla}" c="DSP_INTGARANTIAS" dejarHueco="false">
                                                    <td class="campocaja" >
                                                        <div class="displayspace">
                                                            <c:set var="title0"><axis:alt f="axisctr020" c="LIT" lit="100649" /></c:set>
                                                            <c:set var="title1"><axis:alt f="axisctr020" c="LIT" lit="100561" /></c:set>
                                                            <c:set var="title2"><axis:alt f="axisctr020" c="LIT" lit="1000591" /></c:set>
                                                            <c:set var="title3"><axis:alt f="axisctr020" c="LIT" lit="9900895" /></c:set>
                                                            <c:set var="title4"><axis:alt f="axisctr020" c="LIT" lit="1000251" /></c:set>
                                                           
                                                            <display:table name="${OB_IAX_BASESTECNICAS.INTGARANTIAS}" id="INTGARANTIAS" export="false" class="dsptgtable" pagesize="-1" defaultorder="descending" sort="list" cellpadding="0" cellspacing="0">
                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                <display:column title="${title0}" sortable="true" sortProperty="NRIESGO" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                                    <div class="dspText">${INTGARANTIAS.OB_IAX_INTTECGARANTIAS.NRIESGO}</div>
                                                                </display:column>
                                                                <display:column title="${title1}" sortable="true" sortProperty="CGARANT" headerClass="sortable"  media="html" autolink="false" >
                                                                    <div class="dspText">${INTGARANTIAS.OB_IAX_INTTECGARANTIAS.CGARANT}</div>
                                                                </display:column>
                                                                <display:column title="${title2}" sortable="true" sortProperty="DESCTIPO" headerClass="sortable"  media="html" autolink="false" >
                                                                    <div class="dspText">${INTGARANTIAS.OB_IAX_INTTECGARANTIAS.DESCTIPO}</div>
                                                                </display:column>
                                                                <display:column title="${title3}" sortable="true" sortProperty="PINTTEC" headerClass="sortable"  media="html" autolink="false" >
                                                                    <div class="dspNumber"><fmt:formatNumber value="${INTGARANTIAS.OB_IAX_INTTECGARANTIAS.PINTTEC}" pattern="###,##0.00"/></div>
                                                                </display:column>
                                                                <display:column title="${title4}" sortable="true" sortProperty="NINTTEC" headerClass="sortable"  media="html" autolink="false" >
                                                                    <div class="dspText"><fmt:formatNumber value="${INTGARANTIAS.OB_IAX_INTTECGARANTIAS.NINTTEC}" pattern="###,##0.00"/></div>
                                                                </display:column>
                                                            </display:table>
                                                        </div>
                                                    </td>
                                                     </axis:ocultar>
                                                </c:otherwise>
                                                </c:choose>
                                            </tr>
                                            
                                            
                                       
                                        </table>
                                        
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                </axis:ocultar>
                <c:if test="${ !empty OB_IAX_BASESTECNICAS.TABMORTGAR}"> 
                    <table class="area" align="center">
                        <tr> 
                        <axis:ocultar f="${pantalla}" c="DSP_MORTALIDAD" dejarHueco="false">
                            <td>
                                <table class="area" align="center">
                                    <tr>
                                        <td class="campocaja" >
                                            <img id="DSP_MORTALIDAD_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_MORTALIDAD', this)" style="cursor:pointer"/>
                                                <b><axis:alt f="axisctr020" c="LIT" lit="102112" /></b>&nbsp;&nbsp;
                                                <hr class="titulo">
                                        </td>
                                    </tr>
                                    <tr id="DSP_MORTALIDAD_children" style="display:none">
                                        <td class="campocaja" >
                                            <div class="displayspace" style="width:100%">
                                                <c:set var="title0"><axis:alt f="axisctr020" c="LIT" lit="100561" /></c:set>
                                                <c:set var="title1"><axis:alt f="axisctr020" c="LIT" lit="1000504" /></c:set>
                                                <c:set var="title2"><axis:alt f="axisctr020" c="LIT" lit="100588" /></c:set>
                                               
                                                <display:table name="${OB_IAX_BASESTECNICAS.TABMORTGAR}" id="TABMORTGAR" export="false" class="dsptgtable" pagesize="-1" 
                                                            defaultorder="descending" sort="list" cellpadding="0" cellspacing="0" > 
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="${title0}" sortable="true" sortProperty="CGARANT" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${TABMORTGAR.OB_IAX_TABMORTGAR.CGARANT}</div>
                                                    </display:column>
                                                    <display:column title="${title1}" sortable="true" sortProperty="CTABLA" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                        <div class="dspNumber">${TABMORTGAR.OB_IAX_TABMORTGAR.CTABLA}</div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="DESCTABLA" headerClass="headwidth60 sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${TABMORTGAR.OB_IAX_TABMORTGAR.DESCTABLA}</div>
                                                    </display:column>
                                                </display:table>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            </axis:ocultar>
                        </tr>
                    </table>
                </c:if>
                <c:if test="${ !empty OB_IAX_BASESTECNICAS.GASTOS}"> 
                    <table class="area" align="center">
                        <tr>
                            <axis:ocultar f="${pantalla}" c="DSP_GASTOS" dejarHueco="false">
                            <td>
                                <table class="area" align="center">
                                    <tr>
                                        <td class="campocaja" >
                                            <img id="DSP_GASTOS_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_GASTOS', this)" style="cursor:pointer"/>
                                            <b><axis:alt f="axisctr020" c="LIT" lit="9001509" /></b>&nbsp;&nbsp;
                                            <hr class="titulo">
                                        </td>
                                    </tr>
                                    <tr id="DSP_GASTOS_children" style="display:none">
                                        <td class="campocaja" >
                                            <div class="displayspace" style="width:100%">
                                                <c:set var="title0"><axis:alt f="axisctr020" c="LIT" lit="9900892" /></c:set>
                                                <c:set var="title1"><axis:alt f="axisctr020" c="LIT" lit="101159" /></c:set>
                                                <c:set var="title2"><axis:alt f="axisctr020" c="LIT" lit="9900893" /></c:set>
                                               
                                                                                  
                                                <display:table name="${OB_IAX_BASESTECNICAS.GASTOS}" id="GASTOS" export="false" class="dsptgtable" pagesize="-1" 
                                                            defaultorder="descending" sort="list" cellpadding="0" cellspacing="0" > 
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="${title0}" sortable="true" sortProperty="TIPOGASTO" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${GASTOS.OB_IAX_GASTOS.TIPOGASTO}</div>
                                                    </display:column>
                                                    <display:column title="${title1}" sortable="true" sortProperty="VALOR" headerClass="sortable"  media="html" autolink="false" >
                                                         <div class="dspNumber"><fmt:formatNumber value="${GASTOS.OB_IAX_GASTOS.VALOR}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/></div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="DESCNIVEL" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${GASTOS.OB_IAX_GASTOS.DESCNIVEL}</div>
                                                    </display:column>
                                                </display:table>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            </axis:ocultar>
                        </tr>
                    </table>
                </c:if> 
            </td>
        </tr>
    </axis:ocultar>
</c:if>


  


