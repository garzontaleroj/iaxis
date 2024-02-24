<%/* Revision:# y9OKfKiebvBhmvFG+agYrQ== # */%>
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
<%--SINIESTROS--%>
 <axis:visible c="DSP_SINIESTROS" f="${pantalla}">

 <%-- Bug 11177.NMM.Fer que sempre surti l'apartat de l'agenda en la consulta de pÃ²lisses
 en el Service s'amaguen els apunts que estÃ n anulÂ·lats ( cestado = 2).
 Afegim el "! empty datos_poliza && ", perquÃ¨ si entrem a consultar perÃ² sortim sense
 consultar, queda l'apartat de l'agenda a dalt de tot de la pantalla.
 c:if test="${! empty lstagenda && (empty sessionScope.${pantalla}_suplementosPendientes || !sessionScope.${pantalla}_suplementosPendientes)}"--%>

 <c:if test="${ ! empty lstsiniestros }">
                <tr>
                    <td class="campocaja" >
                        <div style="float:left;">
                        <img id="DSP_SINIESTROS_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_SINIESTROS', this)" style="cursor:pointer"/>
                        <b><axis:alt f="${pantalla}" c="DSP_SINIESTROS_parent" lit="100592" /></b>
                        </div>                        
                        <div style="clear:both;">
                        <hr class="titulo">
                        </div>

                    </td>

                </tr>
                <tr id="DSP_SINIESTROS_children" style="display:none">
                    <td class="campocaja" >
                    <%--INICIO IAXIS 19/03/2019 AABC Cambio de consulta del siniestro. --%>
                    <c:set var="title0"><axis:alt f="${pantalla}" c="NPOLIZA" lit="100624"/></c:set> <!-- pÃÂ³liza -->
                    <c:set var="title1"><axis:alt f="${pantalla}" c="NSINIES" lit="800279"/></c:set> <!-- NÃÂº siniestro -->
                    <c:set var="title2"><axis:alt f="${pantalla}" c="FALTA"   lit="9910210"/></c:set> <!-- Fecha de Apertura -->
                    <c:set var="title6"><axis:alt f="${pantalla}" c="NSINREC" lit="9000974"/></c:set> <!-- IAXIS_15211 numero de reclamo -->
                    <c:set var="title3"><axis:alt f="${pantalla}" c="TTIPSIN" lit="89906253"/></c:set> <!-- TIPO SINIESTRO BUG7413 -->
                    <c:set var="title4"><axis:alt f="${pantalla}" c="TNOMUSU" lit="9910018"/></c:set> <!-- Abogado tramitador -->                    
                    <c:set var="title5"><axis:alt f="${pantalla}" c="CONSULTAR" lit="103101"/></c:set> <!-- Consultar -->
                    <%--FIN IAXIS 19/03/2019 AABC Cambio de consulta del siniestro --%> 
                     <div class="displayspace">

                        <display:table name="${lstsiniestros}" id="LISTASINIESTROS" export="false" class="dsptgtable"  pagesize="-1"
                        requestURI="axis_${pantalla}.do?paginar=true&subseccion=DSP_SINIESTROS" sort="list" cellpadding="0" cellspacing="0">
                        <%@ include file="../include/displaytag.jsp"%>

                        <%--  --%>
                        <%--INICIO IAXIS 19/03/2019 AABC Cambio de consulta del siniestro. --%>
                        <display:column title="${title0}" sortable="true" sortProperty="NPOLIZA" style="width:8%;" headerClass="sortable fixed"  media="html" autolink="false" >
                            <div class="dspText">${LISTASINIESTROS['NPOLIZA']}</div>
                        </display:column>
                        <display:column title="${title1}" sortable="true" sortProperty="NSINIES" style="width:8%;" headerClass="sortable fixed"  media="html" autolink="false" >
                            <div class="dspText">${LISTASINIESTROS['NSINIES']}</div>
                        </display:column>
                        <display:column title="${title2}" sortable="true" sortProperty="FALTA" style="width:20%;" headerClass="sortable fixed"  media="html" autolink="false" >
                            <div class="dspText">${LISTASINIESTROS['FALTA']}</div>
                        </display:column>
                        <!-- IAXIS_15211 numero de reclamo -->
                        <display:column title="${title6}" sortable="true" sortProperty="NSINREC" style="width:8%;" headerClass="sortable fixed"  media="html" autolink="false" >
                            <div class="dspText">${LISTASINIESTROS['NSINRECL']}</div>
                        </display:column>                        
                        <display:column title="${title3}" sortable="true" sortProperty="TTIPSIN" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                            <div class="dspText">${LISTASINIESTROS['TIPSIN']}</div>
                        </display:column>   
                        <display:column title="${title4}" sortable="true" sortProperty="TNOMUSU" style="width:20%;" headerClass="sortable fixed"  media="html" autolink="false" >
                            <div class="dspText">${LISTASINIESTROS['TNOMUSU']}</div>
                        </display:column>                       
                       <%--FIN IAXIS 19/03/2019 AABC Cambio de consulta del siniestro --%> 
                       <!------------------------------------------------------------------------------------------------------------------------------------------------------>
                       
                        <axis:visible f="${pantalla}" c="BT_MASDATOS_SINIESTROS">
                             <display:column title="${title5}" headerClass="sortable fixed" media="html" style="width:7%;" autolink="false" >
                                <div class="dspIcons" ><img border="0" alt="<axis:alt f="${pantalla}" c="BT_MASDATOS_SINIESTROS" lit="1000113"/>" title1="<axis:alt f="${pantalla}" c="BT_MASDATOS_SINIESTROS" lit="1000113"/>" src="images/mes.gif" width="11px" height="11px"
                                style="cursor:pointer;"   onclick="f_seleccionar_siniestro('${LISTASINIESTROS['NSINIES']}')"  />
                                </div>
                            </display:column>   <%--onmouseout="javascript:ocultar('SECCION_A${LISTAAPUNTESAGENDA['NLINEA']}')"--%>
                        </axis:visible>                           
                        </display:table>

                    </div>

                    </td>
                </tr>
</c:if>
</axis:visible>

 <axis:visible c="DSP_SOLICITUDSUPLEM" f="${pantalla}">
 <c:if test="${ ! empty lstsolicituds }">
                <tr>
                    <td class="campocaja" >
                    	
                        <div style="float:left;">
                        <img id="DSP_SOLICITUDSUPLEM_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_SOLICITUDSUPLEM', this)" style="cursor:pointer"/>
                         <b><axis:alt f="${pantalla}" c="DSP_SOLICITUDSUPLEM" lit="9901619"></axis:alt></b>
                        </div>                        
                        <div style="clear:both;">
                        <hr class="titulo">
                        </div>

                    </td>

                </tr>
                <tr id="DSP_SOLICITUDSUPLEM_children" style="display:none">
                    <td class="campocaja" >
 												<c:set var="title0"><axis:alt f="${pantalla}" c="FESTSUP" lit="101006"/></c:set>
                        <c:set var="title2"><axis:alt f="${pantalla}" c="TESTSUP" lit="100587"/></c:set>
                        <c:set var="title3"><axis:alt f="${pantalla}" c="TMOTMOV" lit="102577"/></c:set>
                        <c:set var="title4"><axis:alt f="${pantalla}" c="TVALORA" lit="100892"/></c:set>
                        <c:set var="title5"><axis:alt f="${pantalla}" c="TVALORD" lit="151274"/></c:set>
                        

                     <div class="displayspace">
                        <display:table name="${lstsolicituds}" id="LISTASSOLICITUDS" export="false" class="dsptgtable"  pagesize="-1"
                        requestURI="axis_${pantalla}.do?paginar=true&subseccion=DSP_SOLICITUDSUPLEM" sort="list" cellpadding="0" cellspacing="0">
                        <%@ include file="../include/displaytag.jsp"%>
	                        <display:column title="${title0}" style="width:14%;" sortable="true" sortProperty="FESTSUP" headerClass="sortable"  media="html" autolink="false" >
	                                <div class="dspDate"><fmt:formatDate value="${LISTASSOLICITUDS.FESTSUP}" pattern="dd/MM/yyyy"/></div>
	                        </display:column>                         
	                        <display:column title="${title3}" sortable="true" style="width:20%;" sortProperty="TMOTMOV" headerClass="sortable"  media="html" autolink="false" >
	                                <div class="dspText">${LISTASSOLICITUDS.TMOTMOV}</div>
	                        </display:column>  
                                <display:column title="${title2}" sortable="true" sortProperty="TESTSUP" style="width:10%;" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">
                                         <select name="CESTSUP" id="CESTSUP"
                                         <c:if test="${__configform.axisctr020__CESTSUP__modificable==false  }"> disabled</c:if>
                                         onchange="f_actualizar_estado(this.value,'${LISTASSOLICITUDS.SSEGURO}','${LISTASSOLICITUDS.NMOVIMI}','${LISTASSOLICITUDS.NRIESGO}','${LISTASSOLICITUDS.CMOTMOV}','${LISTASSOLICITUDS.CGARANT}','${LISTASSOLICITUDS.CPREGUN}');"
                                         size="1" <axis:atr f="${pantalla}" c="CESTSUP" a="isInputText=false"/> class="campowidthselect campo campotexto" style="width:94%;">&nbsp;
                                            <c:forEach var="element" items="${lstestadossolsupl}">
                                                <option value = "${element.CATRIBU}"
                                                <c:if test="${LISTASSOLICITUDS.CESTSUP == element.CATRIBU}"> selected = "selected"</c:if> />
                                                    ${element.TATRIBU} 
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
	                        </display:column>
	                        <display:column title="${title4}" sortable="true" sortProperty="TVALORA" style="width:28%;"  headerClass="sortable fixed"  media="html" autolink="false" >
	                                <div class="dspText">${LISTASSOLICITUDS['TVALORA']}</div>
	                        </display:column> 
	                        <display:column title="${title5}" sortable="true" sortProperty="TVALORD" style="width:28%;"  headerClass="sortable fixed"  media="html" autolink="false" >
	                                <div class="dspText">${LISTASSOLICITUDS['TVALORD']}</div>
	                        </display:column> 
	     				                          
                        </display:table>
                         

                    </div>

                    </td>
                </tr>
</c:if>
</axis:visible>
 <c:if test="${!empty __formdata.SSEGURO}">
<axis:visible c="DSP_DOCUMENTOS" f="${pantalla}">

<%--c:if test="${ ! empty __formdata.axisgedox }"--%>
                <tr>
                    <td class="campocaja" >
                    	
                        <div style="float:left;">
                        <img id="DSP_DOCUMENTACION_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_DOCUMENTACION', this)" style="cursor:pointer"/>
                         <b><axis:alt f="${pantalla}" c="DSP_DOCUMENTACION" lit="9001358"></axis:alt></b>
                        </div>                        
                        
                        
                        
                        <axis:visible c="FILE" f="${pantalla}">
                            <div style="float:right;">
                                <a href="f_but_1000615()"><img onclick="f_but_1000615()" border="0" alt="<axis:alt f="${pantalla}" c="FILE" lit="1000615"/>" title="<axis:alt f="${pantalla}" c="FILE" lit="1000615"/>" src="images/gdocumental.gif"/></a>
                            </div>
                        </axis:visible>
                        <div style="clear:both;">
                        <hr class="titulo">
                        </div>
                      </td>

                </tr>
                <tr id="DSP_DOCUMENTACION_children" style="display:none">
                    <td class="campocaja" >
                    
                            <c:set var="title0"><axis:alt f="${pantalla}" c="DESCRIPCION" lit="100588"></axis:alt></c:set>
                            <c:set var="title1"><axis:alt f="${pantalla}" c="FICHERO" lit="105940"></axis:alt></c:set>
                            <c:set var="title2"><axis:alt f="${pantalla}" c="TORIGEN" lit="9000958"></axis:alt></c:set>
                            <c:set var="title3"><axis:alt f="${pantalla}" c="TUSUARIO" lit="100894"></axis:alt></c:set>
                            <c:set var="title4"><axis:alt f="${pantalla}" c="FALTA" lit="105887"></axis:alt></c:set>
                            <c:set var="title5"><axis:alt f="${pantalla}" c="TMOTMOV" lit="100565"></axis:alt></c:set>
                            <c:set var="title6"><axis:alt f="${pantalla}" c="TIDCAT" lit="1000612"></axis:alt></c:set>
                            <display:table name="${axisgedox}" id="miListaId" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                             requestURI="modal_${pantalla}.do?paginar=true">
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column title="${title5}" sortable="true" sortProperty="TMOTMOV" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">${miListaId['TMOTMOV']}</div>
                                </display:column>
                                <display:column title="${title0}" sortable="true" sortProperty="TDESCRIP" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">${miListaId['TDESCRIP']}</div>
                                </display:column>
                                <axis:visible c="TIDCAT" f="${pantalla}">
                                    <display:column title="${title6}" sortable="true" sortProperty="TIDCAT" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText">${miListaId['TIDCAT']}</div>
                                    </display:column>
                                </axis:visible>
                                
                                <display:column title="${title1}" sortable="true" sortProperty="FICHERO" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">${miListaId['FICHERO']}</div>
                                </display:column>
                                
                                <display:column title="${title2}" sortable="true" sortProperty="TORIGEN" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspIcons">
                                            <input type="checkbox" disabled name = "TORIGENx" id = "TORIGENx" value="${miListaId['CORIGEN']}"
                                            <c:if test="${miListaId['CORIGEN']  == 1}">checked </c:if>></div>
                                </display:column>
                                 <display:column title="${title3}" sortable="true" sortProperty="TUSUARIO" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">${miListaId['TUSUARIO']}</div>
                                </display:column>
                                
                                
                                
                                <display:column title="${title4}" sortable="true" sortProperty="FALTA" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspDate"><fmt:formatDate value="${miListaId.FALTA}" pattern="dd/MM/yyyy"/></div>
                                </display:column>
                               <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                   <c:if test="${!empty miListaId['IDDOC']}">
                                        <axis:visible c="MIDOCUMENTO" f="${pantalla}">
                                        <div class="dspIcons"><img border="0"  src="images/file.gif" width="15px" height="15px"
                                        style="cursor:pointer;" onclick="f_ver_doc('${miListaId['IDDOC']}');"/>
                                        </div>
                                        </axis:visible>
                                    </c:if>
                                </display:column> 
                            </display:table>
                            <c:choose>
                            <c:when test="${!empty __formdata.axisgedox}">
                                <c:if test="${ !(fn:containsIgnoreCase(header['User-Agent'],'ipad') ) }">
                                    <script language="javascript">objUtiles.retocarDsptagtable("miListaId");</script>
                                </c:if>
                            </c:when>
                            <c:otherwise>
                                <script language="javascript">
                                   objLista.esconderListaLinks();     
                                </script>
                            </c:otherwise>
                            </c:choose>
                        </div>
                </td>
            </tr>
    <%--    </c:if>--%>
</axis:visible>

</c:if>

<axis:visible c="DOC_REQUERIDA" f="${pantalla}">
 
     <tr>
        <td class="campocaja" >
        
        <div style="float:left;">
            <img src="images/mes.gif" id="DSP_DOCU_REQUERIDA_parent" onclick="objEstilos.toggleDisplay('DSP_DOCU_REQUERIDA', this)" style="cursor:pointer"/> 
            <b><axis:alt f="${pantalla}" c="DOCU_REQUERIDA" lit="9901998"/></b> 
        </div> 
        
        <axis:visible c="BT_EDITAR_DOC_REQUERIDA" f="${pantalla}">
            <div style="float:right;">
                <a href="f_abrir_axisctr173()">
                  <img border="0" onclick="f_abrir_axisctr173()"
                  alt="<axis:alt f='${pantalla}' c='LIT39' lit='9901998'/>"
                  title="<axis:alt f='${pantalla}' c='LIT40' lit='9901998'/>"
                       src="images/lapiz.gif"/>
                </a>
            </div>
        </axis:visible>
        <div style="clear:both;">
        <hr class="titulo">
        </div>
        </td>

    </tr>
    
    <tr id="DSP_DOCU_REQUERIDA_children" style="display:none">
        <td class="campocaja">
            <div class="displayspace">
             <c:set var="title0"><axis:alt f="${pantalla}" c="DESCRIPCION" lit="100588"/></c:set>
             <c:set var="title1"><axis:alt f="${pantalla}" c="OBLIGATORIO" lit="112347"/></c:set>
             <c:set var="title2"><axis:alt f="${pantalla}" c="ADJUNTADO" lit="9901999"/></c:set>
             <c:set var="title3"><axis:alt f="${pantalla}" c="CRECIBIDO" lit="9905367"/></c:set>
             <c:set var="title4"><axis:alt f="${pantalla}" c="FRECIBIDO" lit="102913"/></c:set>
             <c:set var="title5"><axis:alt f="${pantalla}" c="TFILENAME" lit="105940"/></c:set>
              <display:table name="${docu_requerida}" id="T_IAX_DOCREQUERIDA" export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0" cellspacing="0" 
              requestURI="modal_${pantalla}.do?paginar=true">
                   <%@ include file="../include/displaytag.jsp"%>
                   <axis:visible c="TDESCRIP" f="${pantalla}">
                   <display:column title="${title0}" sortable="true" sortProperty="T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.TDESCRIP" headerClass="sortable"  media="html" autolink="false" >
                       <div class="dspText">${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.TDESCRIP}</div>
                   </display:column>
                  </axis:visible>
                   <display:column title="${title1}" sortable="true" sortProperty="T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CCLASE" headerClass="sortable"  media="html" autolink="false" >
                       <div class="dspText">
                                <input value="${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.COBLIGA}" type="checkbox" 
                                id="CDOCUME_${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}" name="CDOCUME_${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}" 
                                <c:if test="${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.COBLIGA == 1 }"> checked="checked" </c:if>
                                 disabled="disabled" />
                            </div>
                        
                   </display:column>
                   <display:column title="${title2}" headerClass="sortable" media="html" autolink="false">
                           <div class="dspText">
                                <input value="${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.ADJUNTADO}" type="checkbox" 
                                id="CDOCUME_${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}" name="CDOCUME_${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}" 
                                <c:if test="${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.ADJUNTADO == 1 }"> checked="checked" </c:if>
                                onclick="f_onclickCDOCUMCheck(this, '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}')" disabled="disabled" />
                            </div>
                   </display:column>
                   
                   <display:column title="${title5}" sortable="true" sortProperty="TFILENAME" headerClass="sortable"  media="html" autolink="false" >
                        <div class="dspText">${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.TFILENAME}</div>
                   </display:column>
                   
                   <display:column title="${title3}" sortable="true" sortProperty="CRECIBIDO" headerClass="sortable"  media="html" autolink="false" >
                        <div class="dspText"> 
                            <input value="${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CRECIBIDO}" type="checkbox" 
                                id="CRECIBI_${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CRECIBIDO}" name="CRECIBI_${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CRECIBIDO}" 
                                <c:if test="${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CRECIBIDO == 1 }"> checked="checked" </c:if>
                                 disabled="disabled" />
                        </div>
                   </display:column>
                   
                   <display:column title="${title4}" sortable="true" sortProperty="FRECIBIDO" headerClass="sortable"  media="html" autolink="false" >
                        <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.FRECIBIDO}"/></div>
                   </display:column>
                   
                   <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                   <c:if test="${!empty T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.NINQAVAL}">
                                        <axis:visible c="MIDOCUMENTO" f="${pantalla}">
                                        <div class="dspIcons"><img border="0"  src="images/file.gif" width="15px" height="15px"
                                        style="cursor:pointer;" onclick="f_ver_doc('${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.NINQAVAL}');"/>
                                        </div>
                                        </axis:visible>
                                    </c:if>
                   </display:column> 
              </display:table>
              <c:choose>
                  <c:when test="${!empty __formdata.docu_requerida}">
                  <c:if test="${ !(fn:containsIgnoreCase(header['User-Agent'],'ipad') ) }">
                       <script language="javascript">objUtiles.retocarDsptagtable("T_IAX_DOCREQUERIDA");</script>
                  </c:if>
                  </c:when>
                  <c:otherwise>
                  <script language="javascript">
                     objLista.esconderListaLinks();     
                  </script>
                  </c:otherwise>
              </c:choose>
           </div>
        </td>
    </tr>

</axis:visible>

<!--PSU-->
<axis:visible f="${pantalla}" c="DSP_PSU">
 <c:if test="${!empty PTPSUS}" >


            <tr>
                <td class="campocaja" >
                    <img id="DSP_PSU_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_PSU', this)" style="cursor:pointer"/> 
                      <b><axis:alt f="axisctr020" c="DSP_PSU" lit="9002255"></axis:alt></b> ${PTESTPOL} ${TNIVELBPM} <c:if test="${!empty POBPSU_RETENIDAS.TUSUAUT}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <axis:alt f="axisctr020" c="USU_AUT" lit="9902808" />&nbsp;&nbsp;  ${POBPSU_RETENIDAS.TUSUAUT}&nbsp;&nbsp;&nbsp; <axis:alt f="axisctr020" c="FECHA_AUT" lit="100562" />&nbsp;&nbsp;<fmt:formatDate pattern="dd/MM/yyyy" value="${POBPSU_RETENIDAS.FFECAUT}"/> </c:if>
                    <hr class="titulo">
                </td>
            </tr>
            <tr id="DSP_PSU_children"  style="display:none">
                <td class="campocaja" >
                    <div class="displayspace">
                         <c:set var="title0"><axis:alt f="${pantalla}" c="TCONTROL" lit="9900975" /></c:set>
                         <c:set var="title1"><axis:alt f="${pantalla}" c="FMOVIMI" lit="9900976" /></c:set>                               
                         <c:set var="title2"><axis:alt f="${pantalla}" c="TAUTREC" lit="9900977" /></c:set>
                         <c:set var="title5"><axis:alt f="${pantalla}" c="TRIESGO" lit="100649" />&nbsp;-&nbsp;<axis:alt f="${pantalla}" c="TGARANT" lit="110994" /></c:set>                         
                         <c:set var="title6"><axis:alt f="${pantalla}" c="TNIVELR" lit="9900978" /></c:set>
                         <c:set var="title7"><axis:alt f="${pantalla}" c="INFO" lit="1000113" /></c:set>                        
                         
                         
                         <display:table name="${PTPSUS}" id="T_IAX_PSU" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                         requestURI="axis_${pantalla}.do?paginar=true"> <!-- Esta no necesitamos desplegarla al volver de ordenar - siempre estï¿½ desplegada -->
                           <%@ include file="../include/displaytag.jsp"%>                         
                           
                           
                           <display:column title="${title0}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.TCONTROL}</div>
                           </display:column>
                           
                           <display:column title="${title1}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_PSU.OB_IAX_PSU.FMOVIMI}"/></div>                               
                           </display:column>
                           
                           <axis:visible f="${pantalla}" c="TAUTREC">   
                           <display:column title="${title2}" sortable="true" sortProperty="" headerClass="fixed  sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.TAUTREC}</div>
                           </display:column>
                           </axis:visible>
                           
                           <%--display:column title="${title3}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_PSU.OB_IAX_PSU.FAUTREC}"/></div>                               
                           </display:column>
                           
                           <display:column title="${title4}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.TUSUNOM}</div>
                           </display:column--%>
                           
                           <display:column title="${title5}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.TRIESGO}<c:if test="${!empty T_IAX_PSU.OB_IAX_PSU.CGARANT && T_IAX_PSU.OB_IAX_PSU.CGARANT!=0}"> - ${T_IAX_PSU.OB_IAX_PSU.TGARANT}</c:if></div>
                           </display:column>
                           
                           <display:column title="${title6}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.TNIVELR}</div>
                           </display:column>
                           
                           <display:column title="${title7}" headerClass="headwidth5 fixed sortable" media="html" autolink="false" >
                                <axis:visible f="${pantalla}" c="INFO" >
                                <div class="dspIcons"><img border="0" alt="<axis:alt f="${pantalla}" c="INFO" lit="1000113"/>" src="images/informacion.gif" width="11px" height="11px"
                                style="vertical-align:middle;cursor:pointer;" onclick="f_abrir_axispsu003('${T_IAX_PSU.OB_IAX_PSU.SSEGURO}','${T_IAX_PSU.OB_IAX_PSU.NMOVIMI}','${T_IAX_PSU.OB_IAX_PSU.NRIESGO}','${T_IAX_PSU.OB_IAX_PSU.CCONTROL}','${T_IAX_PSU.OB_IAX_PSU.NOCURRE}','${T_IAX_PSU.OB_IAX_PSU.CGARANT}')" title="<axis:alt f='${pantalla}' c='INFO' lit='1000113'/>"/>
                                </div>
                                </axis:visible>
                           </display:column>                           
                        </display:table>
                    </div>
                    <div class="separador" style="align:right">&nbsp;</div>
                 </td>
               </tr>
                    
       
  </c:if>
</axis:visible>  
<!--Fin PSU-->

<c:import url="axisctr020_d1.jsp"/> 
