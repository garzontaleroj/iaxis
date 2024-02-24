<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page import="axis.util.Constantes" %>
<%@ page import="java.util.*" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

                                               <!-- tabla seccion inquilinos -->
                                               <c:if test="${!empty dades_persona.PINQUIL}">
                                                <axis:visible c="PINQUIL" f="axisper009">  
                                                <div class="titulo"><a name="posicionPorColorcar__T_IAX_PINQUIL" id="posicionPorColorcar__T_IAX_PINQUIL"></a>
                                                 <b><axis:alt f="axisper009" c="PINQUIL" lit="9903773" /></b>
                                                </div>
                                                
                                                <table class="seccion" onClick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','T_IAX_PINQUIL');return true;">
                                                    <tr>
                                                        <td>
                                                            <!-- DisplayTag  -->
                                                            <c:set var="title1"><axis:alt f="axisper009" c="CTIPFIG" lit="9903929"/></c:set>
                                                            <c:set var="title2"><axis:alt f="axisper009" c="POLIZA" lit="9903659"/></c:set>
                                                            <c:set var="title3"><axis:alt f="axisper009" c="PRODUCTO" lit="9902909"/></c:set>
                                                            <c:set var="title4"><axis:alt f="axisper009" c="FANULAC" lit="9903939"/></c:set>
                                                            <c:set var="title5"><axis:alt f="axisper009" c="TAGENTE" lit="100584"/></c:set>
                                                            <c:set var="title6"><axis:alt f="axisper009" c="INNGRMEN" lit="9903781"/></c:set>
                                                            <c:set var="title7"><axis:alt f="axisper009" c="INNGRANUAL" lit="9903782"/></c:set>          
                                                            <c:set var="title8"><axis:alt f="axisper009" c="TSITLABORAL" lit="9903783"/></c:set> 
                                                            <c:set var="title9"><axis:alt f="axisper009" c="CTIPCONTRATO" lit="9902261"/></c:set> 
                                                            <c:set var="title10"><axis:alt f="axisper009" c="CSUPFILTRO" lit="9903931"/></c:set> 
                                                            <div class="displayspace">
                                                              <display:table name="${dades_persona.PINQUIL}" id="T_IAX_PINQUIL" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                                               requestURI="axis_axisper009.do?operation=form&paginar=true&subpantalla=datospoltom">
                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                <display:column title="${title1}" sortable="true" sortProperty="CTIPFIG" headerClass="headwidth5 sortable" media="html" style="width:10%" autolink="false" >
                                                                    <div class="dspText">${T_IAX_PINQUIL.TCIPFIG}</div>
                                                                </display:column>
                                                                <display:column title="${title2}" sortable="true" sortProperty="POLIZA" headerClass="sortable" media="html" style="width:7%" autolink="false" >
                                                                    <div class="dspText">${T_IAX_PINQUIL.POLIZA}</div>
                                                                </display:column>
                                                                <display:column title="${title3}" sortable="true" sortProperty="PRODUCTO" headerClass="sortable" media="html" style="width:auto" autolink="false" >
                                                                    <div class="dspText">${T_IAX_PINQUIL.TPRODUCTO}</div>
                                                                </display:column>
                                                                <display:column title="${title4}" sortable="true" sortProperty="FANULAC" headerClass="sortable" media="html" style="width:8%" autolink="false" >
                                                                     <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_PINQUIL.FANULAC}"/></div>
                                                                </display:column>
                                                                <display:column title="${title5}" sortable="true" sortProperty="TAGENTE" headerClass="sortable" media="html" style="width:auto" autolink="false" >
                                                                    <div class="dspText">${T_IAX_PINQUIL.CAGENTE} - ${T_IAX_PINQUIL.TAGENTE}</div>
                                                                </display:column>
                                                                <display:column title="${title6}" sortable="true" sortProperty="INNGRMEN" headerClass="sortable" media="html" style="width:8%" autolink="false" >
                                                                    <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_PINQUIL.IINGRMEN}"/></div>
                                                                </display:column>
                                                                <display:column title="${title7}" sortable="true" sortProperty="INNGRANUAL" headerClass="sortable" media="html" style="width:10%" autolink="false" >
                                                                    <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_PINQUIL.IINGRANUAL}"/></div>
                                                                </display:column>
                                                                <display:column title="${title8}" sortable="true" sortProperty="TSITLABORAL" headerClass="sortable" media="html" style="width:10%" autolink="false" >
                                                                    <div class="dspText">${T_IAX_PINQUIL.TSITLABORAL}</div>
                                                                </display:column>
                                                                <display:column title="${title9}" sortable="true" sortProperty="CTIPCONTRATO" headerClass="sortable" media="html" style="width:10%" autolink="false" >
                                                                    <div class="dspText">${T_IAX_PINQUIL.TTIPCONTRATO}</div>
                                                                </display:column>
                                                                <display:column title="${title10}" sortable="true" sortProperty="CSUPFILTRO" headerClass="sortable" media="html" style="width:5%" autolink="false" >
                                                                    <div class="dspText">${T_IAX_PINQUIL.TSUPFILTRO}</div>
                                                                </display:column>  
                                                                <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                                    <div class="dspIcons"><a href="javascript:f_but_polissa('${T_IAX_PINQUIL.SSEGURO}')"><img border="0" alt="<axis:alt f="axisper009" c="LIT_CONS_POL" lit="151477"/>" title="<axis:alt f="axisper009" c="LIT_CONS_POL" lit="151477"/>" src="images/find.gif"/></a></div>
                                                                </display:column>                                                                                   
                                                            </display:table>
                                                            </div>
                                                        </td>
                                                    <tr>
                                                </table>  
                                                </axis:visible>
                                                </c:if>
                                                <c:if test="${!empty dades_persona.PAVALIST}">
                                                <axis:visible c="PAVALIST" f="axisper009">  
                                            <!-- tabla seccion avalistas -->
                                                <div class="titulo"><a name="posicionPorColorcar__T_IAX_PAVALIST" id="posicionPorColorcar__T_IAX_PAVALIST"></a>
                                                 <b><axis:alt f="axisper009" c="PAVALIST" lit="9903778" /></b>
                                                </div>
                                                
                                                <table class="seccion" onClick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','T_IAX_PAVALIST');return true;">
                                                    <tr>
                                                        <td>
                                                            <!-- DisplayTag  -->
                                                            <c:set var="title1"><axis:alt f="axisper009" c="CTIPFIG" lit="9903929"/></c:set>
                                                            <c:set var="title2"><axis:alt f="axisper009" c="POLIZA" lit="9903659"/></c:set>
                                                            <c:set var="title3"><axis:alt f="axisper009" c="PRODUCTO" lit="9902909"/></c:set>
                                                            <c:set var="title4"><axis:alt f="axisper009" c="FANULAC" lit="9903939"/></c:set>
                                                            <c:set var="title5"><axis:alt f="axisper009" c="TAGENTE" lit="100584"/></c:set>
                                                            <c:set var="title6"><axis:alt f="axisper009" c="INNGRMEN" lit="9903781"/></c:set>
                                                            <c:set var="title7"><axis:alt f="axisper009" c="INNGRANUAL" lit="9903782"/></c:set>          
                                                            <c:set var="title8"><axis:alt f="axisper009" c="TSITLABORAL" lit="9903783"/></c:set> 
                                                            <c:set var="title9"><axis:alt f="axisper009" c="CTIPCONTRATO" lit="9902261"/></c:set> 
                                                            <c:set var="title10"><axis:alt f="axisper009" c="CSUPFILTRO" lit="9903931"/></c:set> 
                                                            <div class="displayspace">  
                                                              <display:table name="${dades_persona.PAVALIST}" id="T_IAX_PAVALIST" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                                               requestURI="axis_axisper009.do?operation=form&paginar=true&subpantalla=datospoltom">
                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                <display:column title="${title1}" sortable="true" sortProperty="CTIPFIG" headerClass="headwidth5 sortable" media="html" style="width:10%" autolink="false" >
                                                                       <div class="dspText">${T_IAX_PAVALIST.TCIPFIG}</div>
                                                                </display:column>
                                                                <display:column title="${title2}" sortable="true" sortProperty="POLIZA" headerClass="sortable" media="html" style="width:7%" autolink="false" >
                                                                       <div class="dspText">${T_IAX_PAVALIST.POLIZA}</div>
                                                                </display:column>
                                                                <display:column title="${title3}" sortable="true" sortProperty="PRODUCTO" headerClass="sortable" media="html" style="width:auto" autolink="false" >
                                                                       <div class="dspText">${T_IAX_PAVALIST.TPRODUCTO}</div>
                                                                </display:column>
                                                                <display:column title="${title4}" sortable="true" sortProperty="FANULAC" headerClass="sortable" media="html" style="width:8%" autolink="false" >
                                                                        <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_PAVALIST.FANULAC}"/></div>
                                                                </display:column>
                                                                <display:column title="${title5}" sortable="true" sortProperty="TAGENTE" headerClass="sortable" media="html" style="width:auto" autolink="false" >
                                                                        <div class="dspText">${T_IAX_PAVALIST.CAGENTE} - ${T_IAX_PAVALIST.TAGENTE}</div>
                                                                </display:column>
                                                                <display:column title="${title6}" sortable="true" sortProperty="INNGRMEN" headerClass="sortable" media="html" style="width:8%" autolink="false" >
                                                                   <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_PAVALIST.IINGRMEN}"/></div>
                                                                </display:column>
                                                                <display:column title="${title7}" sortable="true" sortProperty="INNGRANUAL" headerClass="sortable" media="html" style="width:10%" autolink="false" >
                                                                    <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_PAVALIST.IINGRANUAL}"/></div>
                                                                </display:column>
                                                                <display:column title="${title8}" sortable="true" sortProperty="TSITLABORAL" headerClass="sortable" media="html" style="width:10%" autolink="false" >
                                                                    <div class="dspText">${T_IAX_PAVALIST.TSITLABORAL}</div>
                                                                </display:column>
                                                                <display:column title="${title9}" sortable="true" sortProperty="CTIPCONTRATO" headerClass="sortable" media="html" style="width:10%" autolink="false" >
                                                                    <div class="dspText">${T_IAX_PAVALIST.TTIPCONTRATO}</div>
                                                                </display:column>
                                                                <display:column title="${title10}" sortable="true" sortProperty="CSUPFILTRO" headerClass="sortable" media="html" style="width:5%" autolink="false" >
                                                                    <div class="dspText">${T_IAX_PAVALIST.TSUPFILTRO}</div>
                                                                </display:column>   
                                                                <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                                    <div class="dspIcons"><a href="javascript:f_but_polissa('${T_IAX_PAVALIST.SSEGURO}')"><img border="0" alt="<axis:alt f="axisper009" c="LIT_CONS_POL" lit="151477"/>" title="<axis:alt f="axisper009" c="LIT_CONS_POL" lit="151477"/>" src="images/find.gif"/></a></div>
                                                                </display:column>                                                                                                                                                   
                                                            </display:table>
                                                            </div>
                                                        </td>
                                                    <tr>
                                                </table>  
                                                </axis:visible>
                                                </c:if>
                                                <c:if test="${!empty dades_persona.PGESCOBRO}">                                                
                                                <axis:visible c="PGESCOBRO" f="axisper009">  
                                               <!-- tabla seccion gestor cobros -->         
                                                <div class="titulo"><a name="posicionPorColorcar__T_IAX_PGESCOBRO" id="posicionPorColorcar__T_IAX_PGESCOBRO"></a>
                                                 <b><axis:alt f="axisper009" c="PGESCOBRO" lit="9903385" /></b>
                                                </div>
                                                
                                                <table class="seccion" onClick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','T_IAX_PGESCOBRO');return true;">
                                                    <tr>
                                                        <td>
                                                            <!-- DisplayTag  -->
                                                            <c:set var="title1"><axis:alt f="axisper009" c="POLIZA" lit="9903659"/></c:set>
                                                            <c:set var="title2"><axis:alt f="axisper009" c="PRODUCTO" lit="9902909"/></c:set>
                                                            <c:set var="title3"><axis:alt f="axisper009" c="FANULAC" lit="9903939"/></c:set>
                                                            <c:set var="title4"><axis:alt f="axisper009" c="TAGENTE" lit="100584"/></c:set>
                                                              <div class="displayspace">                                               
                                                              <display:table name="${dades_persona.PGESCOBRO}" id="T_IAX_PGESCOBRO" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                                               requestURI="axis_axisper009.do?operation=form&paginar=true&subpantalla=datospoltom">
                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                <display:column title="${title1}" sortable="true" sortProperty="POLIZA" headerClass="headwidth5 sortable" media="html" style="width:25%" autolink="false" >
                                                                     <div class="dspText">${T_IAX_PGESCOBRO.POLIZA}</div>
                                                                </display:column>
                                                                <display:column title="${title2}" sortable="true" sortProperty="PRODUCTO" headerClass="sortable" media="html" style="width:25%" autolink="false" >
                                                                     <div class="dspText">${T_IAX_PGESCOBRO.TPRODUCTO}</div>
                                                                </display:column>
                                                                <display:column title="${title3}" sortable="true" sortProperty="FANULAC" headerClass="sortable" media="html" style="width:25%" autolink="false" >
                                                                     <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_PGESCOBRO.FANULAC}"/></div>
                                                                </display:column>
                                                                <display:column title="${title4}" sortable="true" sortProperty="TAGENTE" headerClass="sortable" media="html" style="width:25%" autolink="false" >
                                                                  <div class="dspText">${T_IAX_PGESCOBRO.CAGENTE} - ${T_IAX_PGESCOBRO.TAGENTE}</div>
                                                                </display:column>
                                                                 <axis:visible c="BT_CONS_POL" f="axisper009">
                                                                <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                                    <div class="dspIcons"><a href="javascript:f_but_polissa('${T_IAX_PGESCOBRO.SSEGURO}')"><img border="0" alt="<axis:alt f="axisper009" c="LIT_CONS_POL" lit="151477"/>" title="<axis:alt f="axisper009" c="LIT_CONS_POL" lit="151477"/>" src="images/find.gif"/></a></div>
                                                                </display:column>  
                                                                </axis:visible>
                                                            </display:table>
                                                            </div>
                                                        </td>
                                                     </tr>
                                                </table>
                                                </axis:visible>
                                                </c:if>