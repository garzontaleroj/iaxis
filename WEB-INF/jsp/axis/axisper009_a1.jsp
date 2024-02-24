<%-- 
  Fichero: axisper009.jsp
  Fecha: 23/07/2008
--%>
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

                                            <!-- *************************************************************************************  -->
                                            <!-- **********************************  tabla seccion sponsor ***************************  -->
                                            <!-- *************************************************************************************  -->
                                            
                                               <%--c:if test="${!empty dades_persona.SPONSOR}"> 
                                                <div class="titulo"><a name="posicionPorColorcar__SPONSOR" id="posicionPorColorcar__SPONSOR"></a>
                                                 <b><axis:alt f="axisper009" c="SPONSOR" lit="9902623" /></b>
                                                </div>
                                                
                                                <table class="seccion"   onclick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','SPONSOR');return true;">
                                                    <tr>
                                                        <td> 
                                                            <!-- DisplayTag -->
                                                            <c:set var="title1"><axis:alt f="axisper009" c="TCOMPANI_X" lit="9000600"/></c:set>
                                                            <c:set var="title2"><axis:alt f="axisper009" c="TTIPIVA_X" lit="101340"/></c:set>
                                                            <c:set var="title3"><axis:alt f="axisper009" c="TCOMISI_X" lit="101509"/></c:set>
                                                            <div class="displayspace">
                                                              <display:table name="${dades_persona.SPONSOR}" id="T_IAX_SPONSOR" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                              requestURI="axis_axisper009.do?operation=form&paginar=true&subpantalla=datospoltom" >
                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                <display:column title="${title1}" sortable="true" sortProperty="TCOMPANI" headerClass="headwidth5 sortable" media="html" style="width:35%" autolink="false" >
                                                                    <div class="dspText">${T_IAX_SPONSOR.TCOMPANI}</div>
                                                                </display:column>
                                                                <display:column title="${title2}" sortable="true" sortProperty="TTIPIVA" headerClass="sortable" media="html" style="width:25%" autolink="false" >
                                                                    <div class="dspText">${T_IAX_SPONSOR.TTIPIVA}</div>
                                                                </display:column>
                                                                <display:column title="${title3}" sortable="true" sortProperty="TCOMISI" headerClass="sortable" media="html" style="width:15%" autolink="false" >
                                                                    <div class="dspText">${T_IAX_SPONSOR.TCOMISI}</div>
                                                                </display:column>                                                                  
                                                                                            
                                                                
                                                            </display:table>
                                                            </div>
                                                        </td>
                                                    <tr>
                                                </table>  
                                               </c:if--%> 
                                               
                                            <!-- *************************************************************************************  -->
                                            <!-- *****************************  tabla secc gestores/empleados*************************  -->
                                            <!-- *************************************************************************************  -->
                                                                                    
                                            <c:if test="${!empty dades_persona.GESTORES}"> 
                                                <div class="titulo"><a name="posicionPorColorcar__GESTORES" id="posicionPorColorcar__GESTORES"></a>
                                                 <b><axis:alt f="axisper009" c="GESTORES" lit="9902624" /></b>
                                                </div>
                                                
                                                <table class="seccion"   onclick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','GESTORES');return true;">
                                                    <tr>
                                                        <td> 
                                                            <!-- DisplayTag -->
                                                            <c:set var="title1"><axis:alt f="axisper009" c="LIT_TTIPO" lit="100565"/></c:set><!-- tipo -->
                                                            <c:set var="title2"><axis:alt f="axisper009" c="LIT_SUBTIPO" lit="9902638"/></c:set><!-- cargo -->
                                                           
                                                            <div class="displayspace">
                                                              <display:table name="${dades_persona.GESTORES}" id="T_IAX_GESTORES" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                              requestURI="axis_axisper009.do?operation=form&paginar=true&subpantalla=datospoltom" >
                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                <display:column title="${title1}" sortable="true" sortProperty="TCOMPANI" headerClass="headwidth5 sortable" media="html" style="width:35%" autolink="false" >
                                                                    <div class="dspText">${T_IAX_GESTORES.TTIPO}</div>
                                                                </display:column>
                                                                <display:column title="${title2}" sortable="true" sortProperty="TTIPIVA" headerClass="sortable" media="html" style="width:25%" autolink="false" >
                                                                    <div class="dspText">${T_IAX_GESTORES.TSUBTIPO}</div>
                                                                </display:column>
                                                                                                                               
                                                            </display:table>
                                                            </div>
                                                        </td>
                                                    <tr>
                                                </table>  
                                               </c:if> 
                                               
                                            <!-- *************************************************************************************  -->
                                            <!-- *****************************  tabla secc representantes    *************************  -->
                                            <!-- *************************************************************************************  -->
                                      
                                               
                                     <c:if test="${!empty dades_persona.REPRESENTANTES}"> 
                                                <div class="titulo"><a name="posicionPorColorcar__REPRESENTANTES" id="posicionPorColorcar__REPRESENTANTES"></a>
                                                 <b><axis:alt f="axisper009" c="REPRESENTANTES" lit="9902625" /></b>
                                                </div>
                                                
                                                <table class="seccion"  onclick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','REPRESENTANTES');return true;">
                                                    <tr>
                                                        <td> 
                                                            <!-- DisplayTag -->
                                                            <c:set var="title1"><axis:alt f="axisper009" c="TIPO" lit="100565"/></c:set>
                                                            <c:set var="title2"><axis:alt f="axisper009" c="INT_EXT" lit="9902637"/></c:set>
                                                            <c:set var="title3"><axis:alt f="axisper009" c="CIA" lit="9000600"/></c:set>
															<c:set var="title4"><axis:alt f="axisper009" c="OFICINA" lit="102347"/>/<axis:alt f="axisper009" c="PTOVENTA" lit="9902636"/></c:set>
                                                            <div class="displayspace">
                                                              <display:table name="${dades_persona.REPRESENTANTES}" id="T_IAX_REPRESENTANTES" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                              requestURI="axis_axisper009.do?operation=form&paginar=true&subpantalla=datospoltom" >
                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                <display:column title="${title1}" sortable="true" sortProperty="TTIPO" headerClass="headwidth5 sortable" media="html" style="width:35%" autolink="false" >
                                                                    <div class="dspText">${T_IAX_REPRESENTANTES.TTIPO}</div>
                                                                </display:column>
                                                                <display:column title="${title2}" sortable="true" sortProperty="TSUBTIPO" headerClass="sortable" media="html" style="width:25%" autolink="false" >
                                                                    <div class="dspText">${T_IAX_REPRESENTANTES.TSUBTIPO}</div>
                                                                </display:column>
                                                                <display:column title="${title3}" sortable="true" sortProperty="TCOMPANIA" headerClass="sortable" media="html" style="width:15%" autolink="false" >
                                                                    <div class="dspText">${T_IAX_REPRESENTANTES.TCOMPANIA}</div>
                                                                </display:column>   
																<display:column title="${title4}" sortable="true" sortProperty="TPUNTOVENTA" headerClass="sortable" media="html" style="width:15%" autolink="false" >
                                                                    <div class="dspText">${T_IAX_REPRESENTANTES.TPUNTOVENTA}</div>
                                                                </display:column>    
 
                                                                
                                                            </display:table>
                                                            </div>
                                                        </td>
                                                    <tr>
                                                </table>  
                                               </c:if> 
                                               
                                            <!-- *************************************************************************************  -->
                                            <!-- *****************************  tabla secc coordinadores     *************************  -->
                                            <!-- *************************************************************************************  -->
                                                      
                                    
                                        <c:if test="${!empty dades_persona.COORDINADORES}"> 
                                                <div class="titulo"><a name="posicionPorColorcar__COORDINADORES" id="posicionPorColorcar__COORDINADORES"></a>
                                                 <b><axis:alt f="axisper009" c="COORDINADORES" lit="9902626" /></b>
                                                </div>
                                                
                                                <table class="seccion"  onclick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','COORDINADORES');return true;">
                                                    <tr>
                                                        <td> 
                                                            <!-- DisplayTag -->
                                                            <c:set var="title1"><axis:alt f="axisper009" c="TCOMPANI_AUX" lit="100565"/></c:set>
                                                            <c:set var="title2"><axis:alt f="axisper009" c="TTIPIVA_AUX" lit="105940"/></c:set>
                                                            <div class="displayspace">
                                                              <display:table name="${dades_persona.COORDINADORES}" id="T_IAX_COORDINADORES" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                              requestURI="axis_axisper009.do?operation=form&paginar=true&subpantalla=datospoltom" >
                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                <display:column title="${title1}" sortable="true" sortProperty="TTIPO" headerClass="headwidth5 sortable" media="html" style="width:35%" autolink="false" >
                                                                    <div class="dspText">${T_IAX_COORDINADORES.TTIPO}</div>
                                                                </display:column>
                                                                <display:column title="${title2}" sortable="true" sortProperty="TNOMBRE" headerClass="sortable" media="html" style="width:25%" autolink="false" >
                                                                    <div class="dspText">${T_IAX_COORDINADORES.TNOMBRE}</div>
                                                                </display:column>
                                                                       
                                                            </display:table>
                                                            </div>
                                                        </td>
                                                    <tr>
                                                </table>  
                                               </c:if> 
                                               
                                               
                                            <!-- *************************************************************************************  -->
                                            <!-- *****************************  tabla secc listas ofi ext    *************************  -->
                                            <!-- *************************************************************************************  -->
                                                      
                                    
                                     <c:if test="${!empty dades_persona.LISTASOFIEXT}"> 
                                                <div class="titulo"><a name="posicionPorColorcar__LISTASOFIEXT" id="posicionPorColorcar__LISTASOFIEXT"></a>
                                                 <b><axis:alt f="axisper009" c="LISTASOFIEXT" lit="9902628" /></b>
                                                </div>
                                                
                                                <table class="seccion"  onclick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','LISTASOFIEXT');return true;">
                                                    <tr>
                                                        <td>
                                                            <!-- DisplayTag -->
                                                            <c:set var="title0"><axis:alt f="axisper009" c="LIT_TIP_L1" lit="9902639"/></c:set><!--tipo -->
                                                            <c:set var="title1"><axis:alt f="axisper009" c="LIT_FINC_L1" lit="9902640"/></c:set><!-- Fecha inclusion -->
                                                            <c:set var="title2"><axis:alt f="axisper009" c="LIT_MINC_L1" lit="9902641"/></c:set><!-- Motivo inclusion -->
                                                            <c:set var="title3"><axis:alt f="axisper009" c="LIT_FEXT_L1" lit="9902639"/></c:set><!-- Fecha exclusión -->
                                                            <c:set var="title4"><axis:alt f="axisper009" c="LIT_MEXT_L1" lit="9902642"/></c:set><!-- Motivo exclusión -->
                                                            <c:set var="title5"><axis:alt f="axisper009" c="LIT_NNUMIDE" lit="105330"/></c:set><!-- Numero identificador -->
                                                            
                                                            <div class="displayspace">
                                                              <display:table name="${dades_persona.LISTASOFIEXT}" id="T_IAX_LISTASOFIEXT" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                              requestURI="axis_axisper009.do?operation=form&paginar=true&subpantalla=datospoltom" >
                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                <display:column title="${title5}" sortable="true" sortProperty="TTIPLIST" headerClass="sortable" media="html"  autolink="false" >
                                                                    <div class="dspText">${T_IAX_LISTASOFIEXT.NNUMIDE}</div>
                                                                </display:column>
                                                                <display:column title="${title0}" sortable="true" sortProperty="TTIPLIST" headerClass="sortable" media="html"  autolink="false" >
                                                                    <div class="dspText">${T_IAX_LISTASOFIEXT.TTIPLIST}</div>
                                                                </display:column>
                                                                <display:column title="${title1}" sortable="true" sortProperty="FINCLUS" headerClass="sortable" media="html"  autolink="false" >
                                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_LISTASOFIEXT.FINCLUS}"/></div>
                                                                </display:column>
                                                                <display:column title="${title2}" sortable="true" sortProperty="CINCLUS" headerClass="sortable" media="html"  autolink="false" >
                                                                    <div class="dspText">${T_IAX_LISTASOFIEXT.CINCLUS}</div>
                                                                </display:column>    
                                                                <display:column title="${title3}" sortable="true" sortProperty="FEXCLUS" headerClass="sortable" media="html"  autolink="false" >
                                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_LISTASOFIEXT.FEXCLUS}"/></div>
                                                                </display:column>
                                                                <display:column title="${title4}" sortable="true" sortProperty="CEXCLUS" headerClass="sortable" media="html"  autolink="false" >
                                                                    <div class="dspText">${T_IAX_LISTASOFIEXT.CEXCLUS}</div>
                                                                </display:column>                                                                  
 
 
                                                                
                                                            </display:table>
                                                            </div>
                                                        </td>
                                                    <tr>
                                                </table>  
                                               </c:if> 
                                               
                                            <!-- *************************************************************************************  -->
                                            <!-- *****************************  tabla secc listas ofi ext    *************************  -->
                                            <!-- *************************************************************************************  -->
                                    
                                 <axis:visible c="LISTASOFIINT" f="axisper009">  <!-- POST130 -->   
                                     <c:if test="${!empty dades_persona.LISTASOFIINT}"> 
                                                <div class="titulo"><a name="posicionPorColorcar__LISTASOFIINT" id="posicionPorColorcar__LISTASOFIINT"></a>
                                                 <b><axis:alt f="axisper009" c="LISTASOFIINT" lit="9902627" /></b>
                                                </div>
                                                
                                                <table class="seccion"  onclick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','LISTASOFIINT');return true;">
                                                    <tr>
                                                        <td>
                                                            <!-- DisplayTag -->
                                                             <c:set var="title0"><axis:alt f="axisper009" c="LIT_TIP_L2" lit="100565"/></c:set><!--tipo -->
                                                            <c:set var="title1"><axis:alt f="axisper009" c="LIT_FINC_L2" lit="9902640"/></c:set><!-- Fecha inclusion -->
                                                            <c:set var="title2"><axis:alt f="axisper009" c="LIT_MINC_L2" lit="9902641"/></c:set><!-- Motivo inclusion -->
                                                            <c:set var="title3"><axis:alt f="axisper009" c="LIT_FEXT_L2" lit="9902639"/></c:set><!-- Fecha exclusión -->
                                                            <c:set var="title4"><axis:alt f="axisper009" c="LIT_MEXT_L2" lit="9902642"/></c:set><!-- Motivo exclusión -->
                                                            <c:set var="title5"><axis:alt f="axisper009" c="LIT_NNUMIDE" lit="105330"/></c:set><!-- Numero identificador -->
                                                            <c:set var="title6"><axis:alt f="axisper009" c="LIT_ACCION" lit="9000844"/></c:set><!-- Acción -->
                                                            <c:set var="title7"><axis:alt f="axisper009" c="LIT_NPOLIZA" lit="100624"/></c:set><!-- Numero póliza -->
                                                            <c:set var="title8"><axis:alt f="axisper009" c="LIT_NSINIES" lit="800279"/></c:set><!-- Numero siniestro -->
                                                            <c:set var="title9"><axis:alt f="axisper009" c="LIT_NRECIBO" lit="111838"/></c:set><!-- Numero recibo -->
                                                            <div class="displayspace">
                                                              <display:table name="${dades_persona.LISTASOFIINT}" id="T_IAX_LISTASOFIINT" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                              requestURI="axis_axisper009.do?operation=form&paginar=true&subpantalla=datospoltom" >
                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                 <display:column title="${title5}" sortable="true" sortProperty="TTIPLIST" headerClass="sortable" media="html"  autolink="false" >
                                                                    <div class="dspText">${T_IAX_LISTASOFIINT.NNUMIDE}</div>
                                                                </display:column>
                                                                 <display:column title="${title0}" sortable="true" sortProperty="TTIPLIST" headerClass="sortable" media="html"  autolink="false" >
                                                                    <div class="dspText">${T_IAX_LISTASOFIINT.TTIPLIS}</div>
                                                                </display:column>
                                                                <display:column title="${title1}" sortable="true" sortProperty="FINCLUS" headerClass="sortable" media="html"  autolink="false" >
                                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_LISTASOFIINT.FINCLUS}"/></div>
                                                                </display:column>
                                                                <display:column title="${title2}" sortable="true" sortProperty="CINCLUS" headerClass="sortable" media="html"  autolink="false" >
                                                                    <div class="dspText">${T_IAX_LISTASOFIINT.TCINCLUS}</div>
                                                                </display:column>    
                                                                <display:column title="${title3}" sortable="true" sortProperty="FEXCLUS" headerClass="sortable" media="html"  autolink="false" >
                                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_LISTASOFIINT.FEXCLUS}"/></div>
                                                                </display:column>
                                                                <%--
                                                                <display:column title="${title4}" sortable="true" sortProperty="CEXCLUS" headerClass="sortable" media="html"  autolink="false" >
                                                                    <div class="dspText">${T_IAX_LISTASOFIINT.CEXCLUS}</div>
                                                                </display:column>   --%>                                                                     
 
                                                                <display:column title="${title6}" sortable="true" sortProperty="CEXCLUS" headerClass="sortable" media="html"  autolink="false" >
                                                                    <div class="dspText">${T_IAX_LISTASOFIINT.TTIPOCACCION}</div>
                                                                </display:column>
                                                                <display:column title="${title7}" sortable="true" sortProperty="CEXCLUS" headerClass="sortable" media="html"  autolink="false" >
                                                                    <div class="dspText">${T_IAX_LISTASOFIINT.NPOLIZA}</div>
                                                                </display:column>
                                                                <display:column title="${title8}" sortable="true" sortProperty="CEXCLUS" headerClass="sortable" media="html"  autolink="false" >
                                                                    <div class="dspText">${T_IAX_LISTASOFIINT.NSINIES}</div>
                                                                </display:column>
                                                                <display:column title="${title9}" sortable="true" sortProperty="CEXCLUS" headerClass="sortable" media="html"  autolink="false" >
                                                                    <div class="dspText">${T_IAX_LISTASOFIINT.NRECIBO}</div>
                                                                </display:column>
                                                                
                                                            </display:table>
                                                            </div>
                                                        </td>
                                                    <tr>
                                                </table>  
                                               </c:if> 
                                 	 	</axis:visible> <!-- POST130 -->   

                                               