<%/**
*  Fichero: axisctr025.jsp
*  Pantalla de Emisión o continuación de modificaciones de Suplementos.
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>  
*
*  Fecha: 15/02/2008
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
    <head>
        <title><axis:alt f="axisctr025" c="titulo" lit="140360"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>    
             <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>      
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
            	<c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
								retocarPAGE_CSS('axisctr025');
							</c:if>
                // Retocar tabla en IE
                if (document.all) // ES Explorer
                    document.getElementById("tabla1").style.marginLeft="1.3%";
                    
                f_cargar_propiedades_pantalla();
                    
            }
            
            function f_but_cerrar() {
                parent.f_cerrar_axisctr025();
            }           
                                   
        </script>
    </head>
    <body class="" onload="f_onload()">
    	<div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
            
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/> 
            <input type="hidden" name="NCERTIF" id="NCERTIF" value="${__formdata.NCERTIF}"/> 
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad"><axis:alt f="axisctr025" c="modalidad" lit="100913"/></c:param>
                <c:param name="formulario"><axis:alt f="axisctr025" c="formulario" lit="140360"/></c:param>
                <c:param name="form">axisctr025</c:param>
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr025" c="titulo" lit="140360"/></c:param>
                <c:param name="nid" value="axisctr025" />
            </c:import>
            
            <!-- Área de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="seccion">
                            <tr>
                                <td class="campocaja" colspan="2">
                                    <c:set var="title0"><axis:alt f="axisctr025" c="title0" lit="100649"/></c:set>
                                    <c:set var="title1"><axis:alt f="axisctr025" c="title1" lit="102577"/></c:set>
                                    <c:set var="title2"><axis:alt f="axisctr025" c="title2" lit="100892"/></c:set>
                                    <c:set var="title3"><axis:alt f="axisctr025" c="title3" lit="151274"/></c:set>
                                    <c:set var="title4"><axis:alt f="axisctr025" c="title3" lit="9904678"/></c:set> 
                                    <c:set var="title5"><axis:alt f="axisctr025" c="title3" lit="102517"/></c:set>
                                    <div class="seccion displayspaceGrande">
                                        <display:table name="${__formdata.T_IAX_DETMOVSEGURO}" id="T_IAX_DETMOVSEGURO" export="false" class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                             requestURI="modal_axisctr025.do?paginar=true">
                                            <%@ include file="../include/displaytag.jsp"%>
                                           
                                           <display:column title="${title5}" sortable="true" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText">${T_IAX_DETMOVSEGURO.OB_IAX_DETMOVSEGURO.CGARANT}</div>
                                            </display:column>
                                            <display:column title="${title0}" sortable="true" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText">${T_IAX_DETMOVSEGURO.OB_IAX_DETMOVSEGURO.TRIESGO}</div>
                                            </display:column>
                                            <display:column title="${title1}" sortable="true" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText">${T_IAX_DETMOVSEGURO.OB_IAX_DETMOVSEGURO.TMOTMOV}</div>
                                            </display:column>
                                            <display:column title="${title2}" sortable="true" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText">${T_IAX_DETMOVSEGURO.OB_IAX_DETMOVSEGURO.TVALORA}</div>
                                            </display:column>
                                            <display:column title="${title3}" sortable="true" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText">${T_IAX_DETMOVSEGURO.OB_IAX_DETMOVSEGURO.TVALORD}</div>
                                            </display:column>
                                            <c:if test="${__formdata.NCERTIF == 0}">
                                                <axis:visible f="axisctr025" c="TPROPAGASUPL">
                                                    <display:column title="${title4}" sortable="true" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${T_IAX_DETMOVSEGURO.OB_IAX_DETMOVSEGURO.TPROPAGASUPL}</div>
                                                    </display:column>
                                                </axis:visible>
                                            </c:if>
                                        </display:table>
                                        <c:choose>
                                            <c:when test="${!empty __formdata.T_IAX_DETMOVSEGURO}">
                                                <c:if test="${ !(fn:containsIgnoreCase(header['User-Agent'],'ipad') ) }">
                                                    <script language="javascript">objUtiles.retocarDsptagtable("T_IAX_DETMOVSEGURO");</script>
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
                        </table>
                            
                        <c:if test="${ __formdata.mostrar_bpm }">
                            <tr>
                                <td class="campocaja" colspan="2">                                    
                                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr025" c="titulo" lit="9906103" /></div>
                                </td>
                            </tr>
                            <tr><td colspan="2">
                                <table>
                                    <tr>
                                        <td class="titulocaja" width="150px">
                                            <b><axis:alt f="axisctr025" c="NCASO_BPM" lit="9906097"/></b>
                                        </td><td class="titulocaja">
                                            <b><axis:alt f="axisctr025" c="NSOLICI_BPM" lit="9906098"/></b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja" width="150px">
                                            <input type="text" class="campowidthinput campo campotexto" id="NCASO_BPM" name="NCASO_BPM"
                                            value="${__formdata.caso_bpm.NCASO_BPM}" readonly="true" style="width:130px;"/> 
                                        </td><td class="titulocaja">
                                            <input type="text" class="campowidthinput campo campotexto" id="NSOLICI_BPM" name="NSOLICI_BPM"
                                            value="${__formdata.caso_bpm.NSOLICI_BPM}" readonly="true" style="width:130px;"/>   
                                        </td>
                                    </tr>   
                                </table>   
                            </td></tr>
                         </c:if>
       
                         <div class="separador">&nbsp;</div>
                         
                        <c:if test="${! empty __formdata.TRAMOS_REGU}">   
                        
                            <axis:visible f="axisctr025" c="DSP_TRAMOS_REGULACION" >   
                            <tr><td>
                                <table  align="center" cellpadding="0" cellspacing="0" class="basetitulo">
                                    <tr>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td style="font-size:11px;color:white"><b><axis:alt f='axisctr025' c='LIT01' lit='9907652'/></b>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table> 
                 <tr><td>
                                <table class="seccion">
    
                                <tr>
                                        
                                     <td class="campocaja" colspan="2">
                                     
                                        <c:set var="title0"><axis:alt f="axisctr025" c="NMOVIMI" lit="9907654" /></c:set>
                                        <c:set var="title1"><axis:alt f="axisctr025" c="NMOVIMIORG" lit="9907655" /></c:set>
                                        <c:set var="title2"><axis:alt f="axisctr025" c="FECINI" lit="9000526" /></c:set>
                                        <c:set var="title3"><axis:alt f="axisctr025" c="FECFIN" lit="9000527" /></c:set>
                                        <c:set var="title4"><axis:alt f="axisctr025" c="ICAPITALFIN" lit="9907656" /></c:set>
                                        <c:set var="title5"><axis:alt f="axisctr025" c="ICAPITALORG" lit="9907657" /></c:set>
                                        <c:set var="title6"><axis:alt f="axisctr025" c="IPRIANUFIN" lit="1000516" /></c:set>
                                        <c:set var="title7"><axis:alt f="axisctr025" c="IPRIANUORG" lit="152178" /></c:set>
                                        <c:set var="title8"><axis:alt f="axisctr025" c="CTIPO" lit="9907658" /></c:set>
                                        <c:set var="title9"><axis:alt f="axisctr025" c="NRECIBO" lit="100895" /></c:set>
                                        <c:set var="title10"><axis:alt f="axisctr025" c="ITOTALR" lit="100563" /></c:set>
                                        
                                        <div class="displayspace">
                                        
                                            <display:table name="${__formdata.TRAMOS_REGU}" id="TRAMOS_REGU" export="false" class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                 requestURI="axis_axisctr025.do?paginar=true">
                                                 
                                                <%@ include file="../include/displaytag.jsp"%>
                                                
                                                <display:column title="${title0}" sortable="false" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspText">${TRAMOS_REGU.NMOVIMI}</div>
                                                </display:column>
                                                
                                                <display:column title="${title1}" sortable="false" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspText">${TRAMOS_REGU.NMOVIMIORG}</div>
                                                </display:column>
                                                
                                                <display:column title="${title2}" sortable="false" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspText"><fmt:formatDate value="${TRAMOS_REGU.FECINI}" pattern="dd/MM/yyyy"/></div>
                                                </display:column>
                                                
                                                <display:column title="${title3}" sortable="false" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspText"><fmt:formatDate value="${TRAMOS_REGU.FECFIN}" pattern="dd/MM/yyyy"/></div>
                                                </display:column>
                                                
                                                <display:column title="${title4}" sortable="false" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspText">${TRAMOS_REGU.ICAPITALFIN}</div>
                                                </display:column>
                                                
                                                <display:column title="${title5}" sortable="false" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspText">${TRAMOS_REGU.ICAPITALORG}</div>
                                                </display:column>
                                                
                                                <display:column title="${title6}" sortable="false" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspText">${TRAMOS_REGU.IPRIANUFIN}</div>
                                                </display:column>
                                                
                                                <display:column title="${title7}" sortable="false" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspText">${TRAMOS_REGU.IPRIANUORG}</div>
                                                </display:column>
                                                
                                                <display:column title="${title8}" sortable="false" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspText">${TRAMOS_REGU.CTIPO}</div>
                                                </display:column>
                                                
                                                <display:column title="${title9}" sortable="false" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspText">${TRAMOS_REGU.NRECIBO}</div>
                                                </display:column>
                                                
                                                <display:column title="${title10}" sortable="false" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspText">${TRAMOS_REGU.ITOTALR}</div>
                                                </display:column>
                                                
                                            </display:table>
                                            
                                        </div>
                                    </td>
                                
                                </tr>
                                
                                </table>
            </td></tr></td></tr>
                            </axis:visible>
                            
                        </c:if>
                                    
                         <div class="separador">&nbsp;</div>
                         
                        <c:if test="${! empty __formdata.ASEGURADOS_MES}"> 
                                    
                            <axis:visible f="axisctr025" c="DSP_ASEGURADOS_MES" >    
                                <tr><td>
                                <table  align="left" class="area">
                                    <tr>
                                        <td class="campocaja">
                                            <div style="float:left;">
                                                <b><axis:alt f='axisctr025' c='LIT01' lit='9907653'/></b>
                                            </div>
                                            <div style="clear:both;">
                                                <hr class="titulo">
                                            </div>
                                        </td>
                                    </tr>
                                </table> 
                                 <tr><td>    
                                <table class="seccion">
                                 
                                    <tr>
                                            
                                         <td class="campocaja">
                                         
                                            <c:set var="title20"><axis:alt f="axisctr025" c="NRIESGO" lit="100649" /></c:set>
                                            <c:set var="title21"><axis:alt f="axisctr025" c="NASEG1" lit="9907612" /></c:set>
                                            <c:set var="title22"><axis:alt f="axisctr025" c="NASEG2" lit="9907613" /></c:set>
                                            <c:set var="title23"><axis:alt f="axisctr025" c="NASEG3" lit="9907614" /></c:set>
                                            <c:set var="title24"><axis:alt f="axisctr025" c="NASEG4" lit="9907615" /></c:set>
                                            <c:set var="title25"><axis:alt f="axisctr025" c="NASEG5" lit="9907616" /></c:set>
                                            <c:set var="title26"><axis:alt f="axisctr025" c="NASEG6" lit="9907617" /></c:set>
                                            <c:set var="title27"><axis:alt f="axisctr025" c="NASEG7" lit="9907618" /></c:set>
                                            <c:set var="title28"><axis:alt f="axisctr025" c="NASEG8" lit="9907619" /></c:set>
                                            <c:set var="title29"><axis:alt f="axisctr025" c="NASEG9" lit="9907620" /></c:set>
                                            <c:set var="title30"><axis:alt f="axisctr025" c="NASEG10" lit="9907621" /></c:set>
                                            <c:set var="title31"><axis:alt f="axisctr025" c="NASEG11" lit="9907622" /></c:set>
                                            <c:set var="title32"><axis:alt f="axisctr025" c="NASEG12" lit="9907623" /></c:set>
                                            <c:set var="title33"><axis:alt f="axisctr025" c="NASEG13" lit="9908585" /></c:set>
                                            
                                            <div class="displayspace">
                                            
                                                <display:table name="${__formdata.ASEGURADOS_MES}" id="ASEGURADOS_MES" export="false" class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                     requestURI="axis_axisctr025.do?paginar=true">
                                                     
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    
                                                    <display:column title="${title20}" sortable="false" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${ASEGURADOS_MES.NRIESGO}</div>
                                                    </display:column>
                                                    
                                                    <display:column title="${title21}" sortable="false" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${ASEGURADOS_MES.NASEG1}</div>
                                                    </display:column>
                                                    
                                                    <display:column title="${title22}" sortable="false" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${ASEGURADOS_MES.NASEG2}</div>
                                                    </display:column>
                                                    
                                                    <display:column title="${title23}" sortable="false" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${ASEGURADOS_MES.NASEG3}</div>
                                                    </display:column>
                                                    
                                                    <display:column title="${title24}" sortable="false" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${ASEGURADOS_MES.NASEG4}</div>
                                                    </display:column>
                                                    
                                                    <display:column title="${title25}" sortable="false" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${ASEGURADOS_MES.NASEG5}</div>
                                                    </display:column>
                                                    
                                                    <display:column title="${title26}" sortable="false" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${ASEGURADOS_MES.NASEG6}</div>
                                                    </display:column>
                                                    
                                                    <display:column title="${title27}" sortable="false" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${ASEGURADOS_MES.NASEG7}</div>
                                                    </display:column>
                                                    
                                                    <display:column title="${title28}" sortable="false" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${ASEGURADOS_MES.NASEG8}</div>
                                                    </display:column>
                                                    
                                                    <display:column title="${title29}" sortable="false" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${ASEGURADOS_MES.NASEG9}</div>
                                                    </display:column>
                                                    
                                                    <display:column title="${title30}" sortable="false" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${ASEGURADOS_MES.NASEG10}</div>
                                                    </display:column>
                                                    
                                                    <display:column title="${title31}" sortable="false" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${ASEGURADOS_MES.NASEG11}</div>
                                                    </display:column>
                                                    
                                                    <display:column title="${title32}" sortable="false" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${ASEGURADOS_MES.NASEG12}</div>
                                                    </display:column>
                                                    
                                                    <display:column title="${title33}" sortable="false" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                        <c:set var="total">${ ASEGURADOS_MES.NASEG1 + ASEGURADOS_MES.NASEG2 + ASEGURADOS_MES.NASEG3 + ASEGURADOS_MES.NASEG4 + ASEGURADOS_MES.NASEG5 + ASEGURADOS_MES.NASEG6 +ASEGURADOS_MES.NASEG7 +ASEGURADOS_MES.NASEG8 + ASEGURADOS_MES.NASEG9 + ASEGURADOS_MES.NASEG10 + ASEGURADOS_MES.NASEG11 + ASEGURADOS_MES.NASEG12}</c:set>
                                                        <div class="dspText"><fmt:formatNumber pattern="###,##0.00" value="${total /12 }" /></div>
                                                    </display:column>
                                                    
                                                </display:table>
                                                
                                            </div>
                                        </td>
                                    
                                    </tr>
                                    
                                    </table>
                </td></tr></td></tr>
                            </axis:visible>
                             
                        </c:if> 
 
                    </td>
                </tr>
                
                
                
            </table>
            
            <div class="separador">&nbsp;</div>
                        
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisctr025</c:param>
                <c:param name="__botones">cerrar</c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
        </div>
    </body>
</html>

