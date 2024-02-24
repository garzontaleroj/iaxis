<%/**
*  Fichero: axisctr100_body.jsp
*  
*
*  Pantalla de Simulacion de riesgos
*
*  xpl
*  Fecha: 20/05/2009
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<axis:ocultar f="axisctr100" c="DSP_BENEFICIARIOS">
                        <table class="area" align="center">
                         	  
                              
                                   <c:if test="${!empty sessionScope.axisctr100_datosRiesgo}">
                              
                              <tr>
                        <td>
                        
                            <div style="clear:both;" class="titulo">
                            <div style="float:left;">
                                <img src="images/flecha.gif"/><b><axis:alt f="axisctr100" c="LIT_PARBENE" lit="1000079"/></b>
                            </div>
                            <axis:visible c="IMG_ASEG_GAR" f="axisctr100">
                            <div style="float:right;">
                                <axis:visible f="axisctr100" c="BT_EDITRIESGO_ANADIR">
                                    <input type="button" class="boton" id="but_anadir_benef" name="but_anadir_benef" value="<axis:alt f="axisctr100" c="BUTANADIR" lit="9001911" />" onclick="f_abrir_axisctr101_BENE(null,'');" />
                                </axis:visible>
                            </div>
                            </axis:visible></div>
                        </td>
                    </tr>
                             
                             
                             <tr>
                                <td class="campocaja" >
                                	
                                     <axis:visible c="DSP_BENEFICIARIOS_1" f="axisctr100">
                                       <c:if test="${!empty OB_IAX_RIESGOS.OB_IAX_BENEFICIARIOS}">
                                     <div class="displayspace">
                                      <c:set var="title0"><axis:alt f="axisctr100" c="LIT_CHI0BENE" lit="800440"/></c:set>
                                      <c:set var="title1"><axis:alt f="axisctr100" c="LIT_CHI1BENE" lit="101805"/></c:set>                               
                                        <display:table name="${OB_IAX_RIESGOS.OB_IAX_BENEFICIARIOS}" id="lista_bene" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                        requestURI="axis_axisctr100.do?paginar=true"> <!-- Esta no necesitamos desplegarla al volver de ordenar - siempre está desplegada -->
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <axis:visible f="axisctr100" c="SCLABEN">
                                                    <display:column title="${title0}" sortable="false"  headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                      <div class="dspText">${lista_bene.SCLABEN}</div>  
                                                    </display:column>
                                                    </axis:visible>
                                                    <display:column title="${title1}" sortable="false"  headerClass="headwidth sortable"  media="html" autolink="false" >
                                                      <div class="dspText">${lista_bene.DESCRIPCION}</div>  
                                                    </display:column>
                                        </display:table>
                                        
                                     </div>
                                        </c:if>
                                     </axis:visible> 
                            
                                       
                                     
                                     
                                     <axis:visible f="axisctr100" c="BEN_IDENT">
                                      <axis:ocultar f="axisctr100" c="DSP_BENRIESGO">
                 <c:if test="${!empty OB_IAX_RIESGOS.BENEFICIARIO.BENEFESP.BENEF_RIESGO}">
                                   
	                    <table class="area" align="center">
		                    <tr>
		                        <td align="left">
		                            <div class="titulo" style="margin-left:10px;font-size: 11px;"><img src="images/flecha.gif"/><axis:alt f="axisctr100" c="TIT_DSP_BENEIDENT" lit="9902578"/>    </div>
                                   
		                    
                                        </td>
		                    </tr>
		                    <tr>
		                        <td>
		                            <!-- DisplayTag beneficiarios identificados a nivel de riesgo -->
<c:set var="title0"><axis:alt f="axisctr100" c="TIPODOC" lit="109774"/></c:set><%--tip doc--%>
		                            <c:set var="title1"><axis:alt f="axisctr100" c="DOCUMENTO" lit="105330"/></c:set><%--documento--%>
		                            <c:set var="title2"><axis:alt f="axisctr100" c="NOMBRE" lit="105940"/></c:set><%--nombre--%>
		                            <c:set var="title3"><axis:alt f="axisctr100" c="CTIPBEN" lit="9901522"/></c:set><%--tipo ben--%>
		                            <c:set var="title4"><axis:alt f="axisctr100" c="CPAREN" lit="9902580"/></c:set><%--parent--%>
		                            <c:set var="title5"><axis:alt f="axisctr100" c="PORBENF" lit="9902581"/></c:set><%--porbenf--%>
		                            <c:set var="title6"><axis:alt f="axisctr100" c="CONTIGENTE" lit="9902583"/></c:set><%--continentede--%>
                                    <c:set var="axis_lista_beneficiarios_identificados_nivel_rieso" value="${OB_IAX_RIESGOS.BENEFICIARIO.BENEFESP.BENEF_RIESGO}" />
		                            <div class="separador">&nbsp;</div>
		                            <div class="displayspace">
                                           
		                                <display:table name="${axis_lista_beneficiarios_identificados_nivel_rieso}" id="miL01" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" requestURI="axis_axisctr100.do?paginar=true">
		                                    <%@ include file="../include/displaytag.jsp"%>
		                                    <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_BENEIDENTIFICADOS.TTIPIDE" headerClass="sortable" style="width:10%;"  media="html" autolink="false" >
		                                        <div class="dspText">${miL01.OB_IAX_BENEIDENTIFICADOS.TTIPIDE}</div>
		                                    </display:column>
		                                    <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_BENEIDENTIFICADOS.NNUMIDE" headerClass="sortable" style="width:10%;"  media="html" autolink="false" >
		                                        <div class="dspText">${miL01.OB_IAX_BENEIDENTIFICADOS.NNUMIDE}</div>
		                                    </display:column>
		                                    <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_BENEIDENTIFICADOS.NOMBRE_BEN" headerClass="sortable" style="width:20%;"  media="html" autolink="false" >
		                                        <div class="dspText">${miL01.OB_IAX_BENEIDENTIFICADOS.NOMBRE_BEN}</div>
		                                    </display:column>
		                                    <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_BENEIDENTIFICADOS.TTIPBEN" headerClass="sortable"  style="width:10%;" media="html" autolink="false" >
		                                        <div class="dspText">${miL01.OB_IAX_BENEIDENTIFICADOS.TTIPBEN}</div>
		                                    </display:column>
		                                    <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_BENEIDENTIFICADOS.TPAREN" headerClass="sortable" style="width:10%;"  media="html" autolink="false" >
		                                        <div class="dspText">${miL01.OB_IAX_BENEIDENTIFICADOS.TPAREN}</div>
		                                    </display:column>
		                                    <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_BENEIDENTIFICADOS.PPARTICIP" headerClass="sortable"  style="width:10%;" media="html" autolink="false" >
		                                        <div class="dspText">${miL01.OB_IAX_BENEIDENTIFICADOS.PPARTICIP}</div>
		                                    </display:column>
                                            <axis:visible f="axisctr100" c="SCLABEN">
		                                    <display:column title="${title6}" sortable="true" sortProperty="SCLABEN" headerClass="sortable" style="width:25%;"  media="html" autolink="false" >
		                                        <div class="dspText">${miL01.OB_IAX_BENEIDENTIFICADOS.NOMBRE_TIT}</div>
		                                    </display:column>
                                            </axis:visible>
                                           
		                                </display:table>
                                                
		                            </div>
		                            <div class="separador">&nbsp;</div>
		                        </td>
		                    </tr>
	                    </table>
                    </c:if>
              </axis:ocultar>
              
              
                 <axis:ocultar f="axisctr100" c="DSP_GAR_BENEF">
                    <c:if test="${!empty OB_IAX_RIESGOS.BENEFICIARIO.BENEFESP.BENEFESP_GAR}">
	                    <table class="area" align="center">
		                    <tr>
		                        <td align="left">
		                            <div class="titulo" style="margin-left:10px;font-size: 11px;"><img src="images/flecha.gif"/><axis:alt f="axisctr100" c="TIT_BENGAR" lit="9902585"/></div>
                                    
		                        </td>
		                    </tr>
                                    
                                    <c:if test="${!empty OB_IAX_RIESGOS.BENEFICIARIO.BENEFESP.BENEFESP_GAR}">
                                   
                                    
                                    <c:forEach var="element"  items="${OB_IAX_RIESGOS.BENEFICIARIO.BENEFESP.BENEFESP_GAR}"> 
		                    <tr>
                                    <td colspan="5">
                                     <table class="area" align="right">
                                        <tr>
		                        <td align="left">
		                            <div class="titulo" style="margin-left:10px;font-size: 11px;"><img src="images/flecha.gif"/><axis:alt f="axisctr100" c="TIT_BENGAR2" lit="9902498"/>
                                            <b style="color:black">${element.OB_IAX_BENESPECIALES_GAR.TGARANT}<b>
                                            </div>
                                  
		                        </td>
		                    </tr>
                                    <tr>
		                        <td>
		                            <!-- DisplayTag beneficiarios identificados a nivel de garantia/amparo -->
		                           <!-- DisplayTag beneficiarios identificados a nivel de riesgo -->
                                            <c:set var="title0"><axis:alt f="axisctr100" c="TIPODOC" lit="109774"/></c:set><%--tip doc--%>
		                            <c:set var="title1"><axis:alt f="axisctr100" c="DOCUMENTO" lit="105330"/></c:set><%--documento--%>
		                            <c:set var="title2"><axis:alt f="axisctr100" c="NOMBRE" lit="105940"/></c:set><%--nombre--%>
		                            <c:set var="title3"><axis:alt f="axisctr100" c="CTIPBEN" lit="9901522"/></c:set><%--tipo ben--%>
		                            <c:set var="title4"><axis:alt f="axisctr100" c="CPAREN" lit="9902580"/></c:set><%--parent--%>
		                            <c:set var="title5"><axis:alt f="axisctr100" c="PORBENF" lit="9902581"/></c:set><%--porbenf--%>
		                            <c:set var="title6"><axis:alt f="axisctr100" c="CONTIGENTE" lit="9902583"/></c:set><%--continentede--%>
		                            <div class="separador">&nbsp;</div>
		                            <div class="displayspace">
                                          
                                                <display:table name="${element.OB_IAX_BENESPECIALES_GAR.BENEF_IDENT}" id="miL02" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" requestURI="axis_axisctr100.do?paginar=true">
		                                    <%@ include file="../include/displaytag.jsp"%>
		                                   <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_BENEIDENTIFICADOS.TTIPIDE" headerClass="sortable" style="width:10%;"  media="html" autolink="false" >
		                                        <div class="dspText">${miL02.OB_IAX_BENEIDENTIFICADOS.TTIPIDE}</div>
		                                    </display:column>
		                                    <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_BENEIDENTIFICADOS.NNUMIDE" headerClass="sortable" style="width:10%;"  media="html" autolink="false" >
		                                        <div class="dspText">${miL02.OB_IAX_BENEIDENTIFICADOS.NNUMIDE}</div>
		                                    </display:column>
		                                    <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_BENEIDENTIFICADOS.NOMBRE_BEN" headerClass="sortable" style="width:20%;"  media="html" autolink="false" >
		                                        <div class="dspText">${miL02.OB_IAX_BENEIDENTIFICADOS.NOMBRE_BEN}</div>
		                                    </display:column>
		                                    <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_BENEIDENTIFICADOS.TTIPBEN" headerClass="sortable"  style="width:10%;" media="html" autolink="false" >
		                                        <div class="dspText">${miL02.OB_IAX_BENEIDENTIFICADOS.TTIPBEN}</div>
		                                    </display:column>
		                                    <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_BENEIDENTIFICADOS.TPAREN" headerClass="sortable" style="width:10%;"  media="html" autolink="false" >
		                                        <div class="dspText">${miL02.OB_IAX_BENEIDENTIFICADOS.TPAREN}</div>
		                                    </display:column>
		                                    <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_BENEIDENTIFICADOS.PPARTICIP" headerClass="sortable"  style="width:10%;" media="html" autolink="false" >
		                                        <div class="dspText">${miL02.OB_IAX_BENEIDENTIFICADOS.PPARTICIP}</div>
		                                    </display:column>
		                                    <display:column title="${title6}" sortable="true" sortProperty="SCLABEN" headerClass="sortable" style="width:25%;"  media="html" autolink="false" >
		                                        <div class="dspText">${miL02.OB_IAX_BENEIDENTIFICADOS.NOMBRE_TIT}</div>
		                                    </display:column>
                                           
		                                </display:table>
		                            </div>
		                            <div class="separador">&nbsp;</div>
		                        </td>
		                    </tr>
                                    </table>
                                    </td>
                                    </tr>
                                    </c:forEach>
                             </c:if>
	                    </table>
                                      </c:if>
                   
              </axis:ocultar>
              </axis:visible>
                  </c:if>
               </axis:ocultar>