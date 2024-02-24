<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<c:choose>
    <c:when test="${param.multiPantalla == 'true'}">
        <c:set var="pantalla" value="axisctr027"/>        
        <c:set var="literalPantalla" value="1000194"/>
    </c:when>
    <c:otherwise>
        <c:set var="pantalla" value="axisctr008"/>
        <c:set var="literalPantalla" value="101791"/>
    </c:otherwise>
</c:choose>

<c:import url="../include/precargador_ajax.jsp">
    <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
</c:import>
    
    <c:if test="${param.multiPantalla != 'true'}">        
        <form name="${pantalla}Form" action="" method="POST">
        <input type="hidden" name="operation" value=""/>
    </c:if>
    <input type="hidden" id="listaSelectedClausulasDefinidas" name="listaSelectedClausulasDefinidas" value="0"/>
    <input type="hidden" id="listaSelectedClausulasEspecificas" name="listaSelectedClausulasEspecificas" value="0"/>
    <input type="hidden" id="listaSelectedClausulasAutomaticas" name="listaSelectedClausulasAutomaticas" value="0"/>
    <input type="hidden" id="MultipleTouched" name="MultipleTouched" value="0"/>
    <input type="hidden" id="MultipleTocando" name="MultipleTocando" value="0"/>
    <input type="hidden" id="MultipleSelected" name="MultipleSelected" value="${__formdata.MultipleSelected}"/>
    <input type="hidden" id="clausulaEspecificaAnadida" name="clausulaEspecificaAnadida" value=""/>
    <input type="hidden" id="clausulaEspecificaBorrada" name="clausulaEspecificaBorrada" value=""/>
    <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata['SSEGURO']}" />
    
    <input type="hidden" id="idclauesp" name="idclauesp" value=""/>
	<input type="hidden" id="tclauesp" name="tclauesp" value=""/>
    
    <input type="hidden" id="CLAUSULA" name="CLAUSULA" value=""/>
	<input type="hidden" id="OK" name="OK" value="${__formdata.OK}"/>
	

    <c:if test="${param.multiPantalla != 'true'}">
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="modalidad"><axis:alt f="axisctr008" c="MODALIDAD" lit="101110"/>
            <axis:visible f="axisctr008" c="NPOLIZA"> 
            <axis:alt f="axisctr008" c="TITULO_FORM" lit="101779"/> 
            <axis:alt f="axisctr008" c="TITULO_FORM" lit="102707"/> ${__formdata.NPOLIZA}
            </axis:visible>
            <axis:visible f="axisctr008" c="PTMOTMOV"> ${__formdata.PTMOTMOV}
            </axis:visible>
            </c:param>
            <c:param name="titulo"></c:param>
            <c:param name="formulario"><axis:alt f="axisctr008" c="FORMULARIO" lit="${literalPantalla}"/></c:param>
            <c:param name="form">${pantalla}</c:param>
        </c:import>
    </c:if>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisctr164|<axis:alt f="axisctr008" c="MODALIDAD1" lit="9901671"/>#axisctr164|<axis:alt f="axisctr008" c="MODALIDAD2" lit="9901671"/>|true</c:param>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr004" c="LIT_1000573" lit="1000573" /></c:param>
        <c:param name="nid" value="axisediciontexto" />
    </c:import>
    
    <!-- Area de campos  -->
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0" <c:if test="${param.multiPantalla == 'true'}">style="height:280px;"</c:if>>
        <tr>
            <td>            
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr008" c="DSP_SECC_CLAUS" lit="101791"/></div>
                <!--campos-->
                
                <table class="seccion">
                <tr>
                    <td >
                                    <!-- Area 1 -->
                    <table class="area" align="center">
                    <c:if test="${!empty __formdata.axisctr_clausulasAutomaticas}">
                    <axis:visible f="axisctr008" c="DSP_CLAUSUAUT">
                    <tr>
                        <td colspan="2" align="left">
                            <div class="titulo" style="margin-left:10px;font-size: 11px;"><img src="images/flecha.gif"/><axis:alt f="axisctr008" c="DSP_CLAUSUAUT" lit="9902049"/></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        <%int contadorA = 0;%>
                            <!-- DisplayTag clausulasDefinidas -->
                            <!-- INICIO MODIFICACION BORDUCHI 08/07/19 - TAREA 4199 -->
                            <c:set var="title1"><axis:alt f="axisctr008" c="SCLAGEN" lit="105940"/></c:set>
                            <!-- FIN MODIFICACION BORDUCHI 08/07/19 - TAREA 4199 -->
                            <c:set var="title2"><axis:alt f="axisctr008" c="TCLATIT" lit="101805"/></c:set>
                            <div class="separador">&nbsp;</div>
                            
                             <div id="DSP_CLAUSUDEF" class="displayspaceOver" style="visibility:hidden;height:0px">&nbsp;</div>
                                <div id="Dt_CLAUSUDEF" class="displayspace">
                                
                                <display:table name="${__formdata.axisctr_clausulasAutomaticas}" id="dspTagClausulasAutomaticas" export="false" class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                 requestURI="axis_${pantalla}.do?paginar=true">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <display:column title="${title0}" sortable="false" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                        <!-- INICIO MODIFICACION BORDUCHI 08/07/19 - TAREA 4199 -->
                                        <div class="dspIcons"><input checked="checked" 
                                        type="checkbox" 
                                        id="selectedClausulaAutomatica" contador="<%= contadorA %>" name="selectedClausulaAutomatica" value="${dspTagClausulasAutomaticas.OB_IAXPAR_CLAUSULAS.SCLAGEN}"
                                        </div>
                                        <!-- FIN MODIFICACION BORDUCHI 08/07/19 - TAREA 4199 -->
                                    </display:column>
                                    <!-- INICIO MODIFICACION BORDUCHI 08/07/19 - TAREA 4199 -->
                                    <display:column title="${title1}" sortable="true" sortProperty="OB_IAXPAR_CLAUSULAS.TCLATIT" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                        <div class="dspNumber">${dspTagClausulasAutomaticas.OB_IAXPAR_CLAUSULAS.TCLATIT}</div>
                                    <!-- FIN MODIFICACION BORDUCHI 08/07/19 - TAREA 4199 -->
                                    </display:column>
                                    <display:column title="${title2}" sortable="true" sortProperty="OB_IAXPAR_CLAUSULAS.TCLATIT" headerClass="sortable"  media="html" autolink="false" >
                                        <axis:visible f="axisctr008" c="CLAU_TIT">
										<div class="dspText" id="TCLAGEN_${dspTagClausulasAutomaticas.OB_IAXPAR_CLAUSULAS.SCLAGEN}" >${dspTagClausulasAutomaticas.OB_IAXPAR_CLAUSULAS.TCLATIT} - ${dspTagClausulasAutomaticas.OB_IAXPAR_CLAUSULAS.TCLATEX}</div>
										</axis:visible>
                                        <axis:visible f="axisctr008" c="CLAU_NO_TIT">
										<div class="dspText" id="TCLAGEN_${dspTagClausulasAutomaticas.OB_IAXPAR_CLAUSULAS.SCLAGEN}" >- ${dspTagClausulasAutomaticas.OB_IAXPAR_CLAUSULAS.TCLATEX}</div>
										</axis:visible>
                                    </display:column>
                                    
                                    <display:column title="" sortable="false"  headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspIcons">
                                            <c:if test="${dspTagClausulasAutomaticas.OB_IAXPAR_CLAUSULAS.CPARAMS != 0}">
                                            <img border="0" alt="<axis:alt f="axisctr008" c="PARAMETROS" lit="103694"/>" title="<axis:alt f="axisctr008" c="MODIF" lit="100002"/>" src="images/lapiz.gif" width="15px" height="15px"
                                                style="cursor:pointer;vertical-align:middle;"
                                                onclick="f_onclickselectedClausulaDefinida('<%= contadorA %>', ${dspTagClausulasAutomaticas.OB_IAXPAR_CLAUSULAS.CPARAMS},'NO', false)"/>
                                            </c:if>
                                        </div>
                                    </display:column>
                                    
                                    <%contadorA++;%>
                                    
                                </display:table>
                               </div> 
                           
                            
                            <div class="separador">&nbsp;</div>
                        </td>
                    </tr>
                    </axis:visible>
                    </c:if>
                    <axis:visible f="axisctr008" c="DSP_CLAUSUDEF">
                    <tr>
                        <td colspan="2" align="left">
                            <div class="titulo" style="margin-left:10px;font-size: 11px;"><img src="images/flecha.gif"/><axis:alt f="axisctr008" c="DSP_CLAUSUDEF" lit="1000083"/></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%int contador = 0;%>
                            <!-- DisplayTag clausulasDefinidas -->
                            <!-- INICIO MODIFICACION BORDUCHI 08/07/19 - TAREA 4199 -->
                            <c:set var="title1"><axis:alt f="axisctr008" c="SCLAGEN" lit="105940"/></c:set>
                            <!-- FIN MODIFICACION BORDUCHI 08/07/19 - TAREA 4199 -->
                            <c:set var="title2"><axis:alt f="axisctr008" c="TCLATIT" lit="101805"/></c:set>
                            <div class="separador">&nbsp;</div>

                             <div id="DSP_CLAUSUDEF" class="displayspaceOver" style="visibility:hidden;height:0px">&nbsp;</div>
                                <div id="Dt_CLAUSUDEF" class="displayspace">
                                <display:table name="${__formdata.axisctr_clausulasDefinidas}" id="dspTagClausulasDefinidas" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                 requestURI="axis_${pantalla}.do?paginar=true">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <display:column title="${title0}" sortable="false" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" ><!--INI BUG 16674 AMC 21/04/2022-->
                                        <div class="dspIcons"><input <c:if test="${dspTagClausulasDefinidas.OB_IAXPAR_CLAUSULAS.SELECTEDCLAUSULA == true}">checked</c:if>
                                        <c:if test="${dspTagClausulasDefinidas.OB_IAXPAR_CLAUSULAS.SCLAGEN==4527}">checked</c:if>
                                        <c:if test="${dspTagClausulasDefinidas.OB_IAXPAR_CLAUSULAS.COBLIGA==1 && dspTagClausulasDefinidas.OB_IAXPAR_CLAUSULAS.SCLAGEN!=4527}">checked disabled="true"</c:if>
                                        type="checkbox" onclick="f_onclickselectedClausulaDefinida('<%= contador %>', ${dspTagClausulasDefinidas.OB_IAXPAR_CLAUSULAS.CPARAMS},'SI', true)" 
                                        id="selectedClausulaDefinida" contador="<%= contador %>" name="selectedClausulaDefinida" value="${dspTagClausulasDefinidas.OB_IAXPAR_CLAUSULAS.SCLAGEN}"
                                        </div>
                                    </display:column>
                                    <!-- INICIO MODIFICACION BORDUCHI 08/07/19 - TAREA 4199 -->
                                    <display:column title="${title1}" sortable="true" sortProperty="OB_IAXPAR_CLAUSULAS.TCLATIT" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                        <div class="dspNumber">${dspTagClausulasDefinidas.OB_IAXPAR_CLAUSULAS.TCLATIT}</div>
                                        <!-- FIN MODIFICACION BORDUCHI 08/07/19 - TAREA 4199 -->
                                    </display:column>
                                    <display:column title="${title2}" sortable="true" sortProperty="OB_IAXPAR_CLAUSULAS.TCLATIT" headerClass="sortable"  media="html" autolink="false" >
                                        <axis:visible f="axisctr008" c="CLAU_TIT">
                                        <div class="dspText" id="TCLAGEN_${dspTagClausulasDefinidas.OB_IAXPAR_CLAUSULAS.SCLAGEN}" >${dspTagClausulasDefinidas.OB_IAXPAR_CLAUSULAS.TCLATIT} - ${dspTagClausulasDefinidas.OB_IAXPAR_CLAUSULAS.TCLATEX}</div>
										</axis:visible>
                                        <axis:visible f="axisctr008" c="CLAU_NO_TIT">
                                        <div class="dspText" id="TCLAGEN_${dspTagClausulasDefinidas.OB_IAXPAR_CLAUSULAS.SCLAGEN}" >- ${dspTagClausulasDefinidas.OB_IAXPAR_CLAUSULAS.TCLATEX}</div>
										</axis:visible>
                                    </display:column>
                                    <c:if test="${dspTagClausulasDefinidas.OB_IAXPAR_CLAUSULAS.CPARAMS != 0}">
                                    <axis:visible f="axisctr008" c="BTN_EDITCLAUSUDEF">
                                    <display:column title="" sortable="false"  headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspIcons">
                                            <img border="0" alt="<axis:alt f="axisctr008" c="MODIF" lit="100002"/>" title="<axis:alt f="axisctr008" c="PARAMETROS" lit="103694"/>" src="images/lapiz.gif" width="15px" height="15px"
                                                style="cursor:pointer;vertical-align:middle;"
                                                onclick="f_onclickselectedClausulaDefinida('<%= contador %>', ${dspTagClausulasDefinidas.OB_IAXPAR_CLAUSULAS.CPARAMS},'NO', true)"/>
                                        </div>
                                    </display:column>
                                    </axis:visible>
                                    </c:if>
                                    <%contador++;%>
                                    
                                </display:table>
                                </div>
                            
                            <div class="separador">&nbsp;</div>
                        </td>
                    </tr>
                    </axis:visible>
                    </table>
                    </td>
                    </tr>
                </table> 
                
                <!--campos-->
                <axis:visible f="axisctr008" c="DSP_CLAUSUESP">
                <table class="seccion">
                <tr>
                    <td >
                                    <!-- A?rea 1 -->
                    <table class="area" align="center">
                    <tr>
                        <td colspan="2" align="left">
                            <div class="titulo" style="margin-left:10px;font-size: 11px;"><img src="images/flecha.gif"/><axis:alt f="axisctr008" c="DSP_CLAUSUESP" lit="1000084"/></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <!-- DisplayTag clausulasEspecificas -->
                            <!-- INICIO MODIFICACION BORDUCHI 08/07/19 - TAREA 4199 -->
                            <c:set var="title1"><axis:alt f="axisctr008" c="CIDENTITY" lit="105940"/></c:set>
                            <!-- FIN MODIFICACION BORDUCHI 08/07/19 - TAREA 4199 -->
                            <c:set var="title2"><axis:alt f="axisctr008" c="TCLAESP" lit="101805"/></c:set>
                            <div class="separador">&nbsp;</div>
                            <div class="displayspace">
                                <display:table name="${__formdata.axisctr_clausulasEspecificas}" id="dspTagClausulasEspecificas" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                 requestURI="axis_${pantalla}.do?paginar=true">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <!-- INICIO MODIFICACION BORDUCHI 08/07/19 - TAREA 4199 -->
                                    <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_CLAUSULAS.TCLATIT" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                        <div class="dspNumber">${dspTagClausulasEspecificas.OB_IAX_CLAUSULAS.TCLATIT}</div>
                                    <!-- FIN MODIFICACION BORDUCHI 08/07/19 - TAREA 4199 -->
                                    </display:column>
                                    <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_CLAUSULAS.TCLAESP" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText">${dspTagClausulasEspecificas.OB_IAX_CLAUSULAS.TCLAESP}</div>
                                    </display:column>
                                    <axis:visible f="axisctr008" c="BTN_EDITCLAUSUESP">
                                    <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                        <div class="dspIcons"><a href="javascript:f_but_anadir('${dspTagClausulasEspecificas.OB_IAX_CLAUSULAS.TCLAESP}','${dspTagClausulasEspecificas.OB_IAX_CLAUSULAS.CIDENTITY}')"><img border="0" alt="<axis:alt f="axisctr008" c="EDIT_CLAUS" lit="1000127"/>" title="<axis:alt f="axisctr008" c="LIT_EDIT_CLAUS" lit="1000127"/>" src="images/lapiz.gif"/></a></div>
                                    </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisctr008" c="BTN_DELCLAUSUESP">
                                    <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                        <div class="dspIcons"><a href="javascript:f_borrar_clausula('${dspTagClausulasEspecificas.OB_IAX_CLAUSULAS.CIDENTITY}', this)"><img border="0" alt="<axis:alt f="axisctr008" c="BORRAR_CLAUS" lit="1000127"/>" title="<axis:alt f="axisctr008" c="LIT_BORRAR_CLAUS" lit="1000127"/>" src="images/delete.gif"/></a></div>
                                    </display:column>
                                    </axis:visible>
                                </display:table>
                               
                            </div>
                            <div class="separador">&nbsp;</div>
                        </td>
                    <tr>
                    <td>
                    <axis:visible f="axisctr008" c="DSP_EXCLUSIONES">
                    <tr>
                      <td colspan="3" align="left">
                        <div class="titulo" style="margin-left:10px;font-size: 11px;"><img src="images/flecha.gif"/><axis:alt f="axisctr008" c="DSP_EXCLUSIONES" lit="9908278"/></div>
                      </td>
                    </tr>
                    <tr>
                    <td>
                      <c:set var="title1"><axis:alt f="axisctr008" c="LABEL" lit="9908281"/></c:set>
                      <c:set var="title2"><axis:alt f="axisctr008" c="CODEXCLUS" lit="9908282"/></c:set>
                      <c:set var="title3"><axis:alt f="axisctr008" c="TEXCLUS" lit="100566"/></c:set>
		      <c:set var="title4"><axis:alt f="axisctr008" c="CODEGAR" lit="100561"/></c:set>
                      <div class="separador">&nbsp;</div>
                      <div class="displayspace">
                         <display:table name="${__formdata.exclusionesundw}" id="dspTagExclusiones" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                         requestURI="axis_${pantalla}.do?paginar=true">
                           <%@ include file="../include/displaytag.jsp"%>
                              <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_EXCLUSIONES.LABEL" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                              <div class="dspText">${dspTagExclusiones.OB_IAX_EXCLUSIONES.LABEL}</div>
                              </display:column>
                              <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_EXCLUSIONES.CODEGAR" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                              <div class="dspText">${dspTagExclusiones.OB_IAX_EXCLUSIONES.CODEGAR}</div>
                              </display:column>
                              <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_EXCLUSIONES.CODEXCLUS" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                              <div class="dspText">${dspTagExclusiones.OB_IAX_EXCLUSIONES.CODEXCLUS}</div>
                              </display:column>
                              <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_EXCLUSIONES.TEXCLUS" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                              <div class="dspText">${dspTagExclusiones.OB_IAX_EXCLUSIONES.TEXCLUS}</div>
                              </display:column>                              
                         </display:table>
                      </div>
                    </td>
                    </tr>
                    </axis:visible>                    
                    </td>
                    </tr> 						
                    <tr>
                        <axis:visible f="axisctr008" c="but_anadir"> <!-- TODO: C:but_anadir -->
                            <td align="left" style="padding-right:35px;" >
                                <div class="separador">&nbsp;</div>
                                <input type="button" class="boton" id="but_anadir" value="<axis:alt f="axisctr008" c="BUT_ANADIR" lit="1000066"/>" onclick="f_but_anadir()" />
                                <div class="separador">&nbsp;</div>
                                
                            </td>
                        </axis:visible>
                    </tr>
                </table>
                </td>
                </tr>
                </table>
                </axis:visible>
                <axis:visible f="axisctr008" c="DSP_CLAUSUMULT">
        <table class="seccion">
                <tr>
                    <td >
                                    <!-- A?rea 1 -->
                    <table class="area" align="center">
                    <tr>
                        <td colspan="2" align="left">
                            <div class="titulo" style="margin-left:10px;font-size: 11px;"><img src="images/flecha.gif"/><axis:alt f="axisctr008" c="DSP_CLAUSUMULT" lit="9903845"/></div>
                        </td>
                    </tr>
                <tr>
                    <td>
                        <%int contadorM = 0;%>
                            <!-- DisplayTag clausulasDefinidas -->
                            <!-- INICIO MODIFICACION BORDUCHI 08/07/19 - TAREA 4199 -->
                            <c:set var="title1"><axis:alt f="axisctr008" c="SCLAGEN" lit="105940"/></c:set>
                            <!-- FIN MODIFICACION BORDUCHI 08/07/19 - TAREA 4199 -->
                            <c:set var="title2"><axis:alt f="axisctr008" c="TCLATIT" lit="101805"/></c:set>
                            <div class="separador">&nbsp;</div>
                            
                             <div id="DSP_CLAUSUMULTPROD" class="displayspaceOver" style="visibility:hidden;height:0px">&nbsp;</div>
                                <div id="Dt_CLAUSUMULTPROD" class="displayspace">
                                <display:table name="${__formdata.clausulasProdMult}" id="dspTagClausulasMultiplesProd" export="false" class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                 requestURI="axis_${pantalla}.do?paginar=true">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <display:column title="${title0}" sortable="false" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                        <div class="dspIcons">
                                        <input <c:if test="${__formdata.MultipleSelected == dspTagClausulasMultiplesProd.OB_IAXPAR_CLAUSULAS.SCLAGEN}">checked="checked"</c:if>
                                        type="radio" onclick="f_onclickRadioMult(${dspTagClausulasMultiplesProd.OB_IAXPAR_CLAUSULAS.SCLAGEN})"
                                        id="selectedClausulaMultiple" contador="<%= contadorM %>" name="selectedClausulaMultiple" value="${dspTagClausulasMultiplesProd.OB_IAXPAR_CLAUSULAS.SCLAGEN}">
                                        </div>
                                        <input type="hidden" id="NORDEN_${dspTagClausulasMultiplesProd.OB_IAXPAR_CLAUSULAS.SCLAGEN}" 
                                        name="NORDEN_${dspTagClausulasMultiplesProd.OB_IAXPAR_CLAUSULAS.SCLAGEN}" value="0"/>
                                    </display:column>
                                    <!-- INICIO MODIFICACION BORDUCHI 08/07/19 - TAREA 4199 -->
                                    <display:column title="${title1}" sortable="true" sortProperty="OB_IAXPAR_CLAUSULAS.TCLATIT" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                        <div class="dspNumber">${dspTagClausulasMultiplesProd.OB_IAXPAR_CLAUSULAS.TCLATIT}</div>
                                    <!-- FIN MODIFICACION BORDUCHI 08/07/19 - TAREA 4199 -->
                                    </display:column>
                                    <display:column title="${title2}" sortable="true" sortProperty="OB_IAXPAR_CLAUSULAS.TCLATIT" headerClass="sortable"  media="html" autolink="false" >
                                        <axis:visible f="axisctr008" c="CLAU_TIT">
                                        <div class="dspText" id="TCLAGEN_${dspTagClausulasMultiplesProd.OB_IAXPAR_CLAUSULAS.SCLAGEN}" >${dspTagClausulasMultiplesProd.OB_IAXPAR_CLAUSULAS.TCLATIT} - ${dspTagClausulasMultiplesProd.OB_IAXPAR_CLAUSULAS.TCLATEX}</div>
										</axis:visible>
										<axis:visible f="axisctr008" c="CLAU_NO_TIT">
                                        <div class="dspText" id="TCLAGEN_${dspTagClausulasMultiplesProd.OB_IAXPAR_CLAUSULAS.SCLAGEN}" >- ${dspTagClausulasMultiplesProd.OB_IAXPAR_CLAUSULAS.TCLATEX}</div>
										</axis:visible>
                                    </display:column>
                                    
                                    <display:column title="" sortable="false"  headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                        <div class="dspIcons">
                                            <c:if test="${dspTagClausulasMultiplesProd.OB_IAXPAR_CLAUSULAS.CPARAMS != 0}">
                                            <img border="0" alt="<axis:alt f="axisctr008" c="PARAMETROS" lit="103694"/>" title="<axis:alt f="axisctr008" c="MODIF" lit="100002"/>" src="images/lapiz.gif" width="15px" height="15px"
                                                style="cursor:pointer;vertical-align:middle;"
                                                onclick="f_onclickselectedClausulaDefinida('<%= contadorM %>', ${dspTagClausulasMultiplesProd.OB_IAXPAR_CLAUSULAS.CPARAMS},'NO', 'MULT')"/>
                                            </c:if>
                                        </div>
                                    </display:column>
                                    
                                    <%contadorM++;%>
                                    
                                </display:table>
                               </div> 
                           
                            
                            <div class="separador">&nbsp;</div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        	<!-- INICIO MODIFICACION BORDUCHI 08/07/19 - TAREA 4199 -->
                            <c:set var="title1"><axis:alt f="axisctr008" c="SCLAGEN" lit="105940"/></c:set>
                            <!-- INICIO MODIFICACION BORDUCHI 08/07/19 - TAREA 4199 -->
                            <c:set var="title2"><axis:alt f="axisctr008" c="TCLATIT" lit="101805"/></c:set>
                            <div class="separador">&nbsp;</div>      
                             <div id="DSP_CLAUSUMULT" class="displayspaceOver" style="visibility:hidden;height:0px">&nbsp;</div>
                                <div id="Dt_CLAUSUMULT" class="displayspace">
                                <display:table name="${__formdata.axisctr_clausulasMultiples}" id="dspTagClausulasMultiples" export="false" class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                 requestURI="axis_${pantalla}.do?paginar=true">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <!-- INICIO MODIFICACION BORDUCHI 08/07/19 - TAREA 4199 -->
                                    <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_CLAUSULAS.TCLATIT" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                        <div class="dspNumber">${dspTagClausulasMultiples.OB_IAX_CLAUSULAS.TCLATIT}</div>
                                    <!-- FIN MODIFICACION BORDUCHI 08/07/19 - TAREA 4199 -->
                                    </display:column>
                                    <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_CLAUSULAS.TCLAGEN" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText" id="TCLAGEN_${dspTagClausulasMultiples.OB_IAX_CLAUSULAS.SCLAGEN}" >${dspTagClausulasMultiples.OB_IAX_CLAUSULAS.TCLAGEN}</div>
                                    </display:column>
									 <axis:visible f="axisctr008" c="BORRAR_CLAUSUMULT"> 
                                    <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                        <div class="dspIcons">
                                            <a href="javascript:f_borrar_clausuMult(${dspTagClausulasMultiples.OB_IAX_CLAUSULAS.SCLAGEN},${dspTagClausulasMultiples.OB_IAX_CLAUSULAS.CIDENTITY}, this)">
                                                <img border="0" alt="<axis:alt f="axisctr008" c="BORRAR_CLAUS" lit="1000127"/>" title="<axis:alt f="axisctr008" c="LIT_BORRAR_CLAUS" lit="1000127"/>" src="images/delete.gif"/>
                                            </a>
                                        </div>
                                    </display:column>
								  </axis:visible> 
                                </display:table>
                               </div> 
                           
                            
                            <div class="separador">&nbsp;</div>
                        </td>
                    </tr>
    </table>
    </td>
    </tr>
    </table>
    </axis:visible>
                
            </td>
            
        </tr>

    </table>

    <!-- Botonera -->
    <c:import url="../include/botonera_nt.jsp">
        <c:param name="f">axisctr008</c:param>
        <c:param name="__botones">cancelar<axis:visible f="axisctr008" c="BT_ANT">,anterior</axis:visible>,siguiente</c:param>
    </c:import>
    </form>
