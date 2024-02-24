<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
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

                     <axis:ocultar f="axisctr009" c="DSP_BENRIESGO">
  
            <table class="area" align="center">
                <tr>
                    <td align="left">
                        <div class="titulo" style="margin-left:10px;font-size: 11px;"><img src="images/flecha.gif"/><axis:alt f="axisctr009" c="TIT_DSP_BENEIDENT" lit="9902578"/>    </div>
                       
                
                            </td>
                </tr>
                <tr>
                    <td>
                        <!-- DisplayTag beneficiarios identificados a nivel de riesgo -->
                       <c:set var="title0"><axis:alt f="axisctr009" c="TIPODOC" lit="109774"/></c:set><%--tip doc--%>
                        <c:set var="title1"><axis:alt f="axisctr009" c="DOCUMENTO" lit="105330"/></c:set><%--documento--%>
                        <c:set var="title2"><axis:alt f="axisctr009" c="NOMBRE" lit="105940"/></c:set><%--nombre--%>
                        <c:set var="title3"><axis:alt f="axisctr009" c="CTIPBEN" lit="9901522"/></c:set><%--tipo ben--%>
                        <c:set var="title4"><axis:alt f="axisctr009" c="CPAREN" lit="9902580"/></c:set><%--parent--%>
                        <c:set var="title5"><axis:alt f="axisctr009" c="PORBENF" lit="9902581"/></c:set><%--porbenf--%>
                        <c:set var="title6"><axis:alt f="axisctr009" c="CONTIGENTE" lit="9902583"/></c:set><%--continentede--%>
                                <!-- Codi estat #6.2013.22.2013.-->
                                <c:set var="title7"><axis:alt f="axisctr006" c="CESTADO" lit="9000793"/></c:set><%--testado--%>

                                <c:set var="axisctr009_lista_beneficiarios_identificados_nivel_rieso" value="${OB_IAX_RIESGOS.BENEFICIARIO.BENEFESP.BENEF_RIESGO}" />
                        <div class="separador">&nbsp;</div>
                        <div class="displayspace">
                                
                            <display:table name="${axisctr009_lista_beneficiarios_identificados_nivel_rieso}" id="miL01" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" requestURI="axis_axisctr009.do?paginar=true">
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

                                        <!-- Codi estat #6.2013.22.2013.-->
                                        <axis:visible f="axisctr009" c="CESTADO">
                                             <display:column title="${title7}" sortable="true" sortProperty="OB_IAX_BENEIDENTIFICADOS.TESTADO" headerClass="sortable"  style="width:10%;" media="html" autolink="false" >
                                                <div class="dspText">${miL01.OB_IAX_BENEIDENTIFICADOS.TESTADO}</div>
                                            </display:column>
                                        </axis:visible>
                                <axis:visible f="axisctr009" c="SCLABEN">
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
        
  </axis:ocultar>
  
  
     <axis:ocultar f="axisctr009" c="DSP_GAR_BENEF">
  
            <table class="area" align="center">
                <tr>
                    <td align="left">
                        <div class="titulo" style="margin-left:10px;font-size: 11px;"><img src="images/flecha.gif"/><axis:alt f="axisctr009" c="TIT_BENGAR" lit="9902585"/></div>
                        
                    </td>
                </tr>
                        
                        <c:if test="${!empty OB_IAX_RIESGOS.BENEFICIARIO.BENEFESP.BENEFESP_GAR}">
                       
                        
                        <c:forEach var="element"  items="${OB_IAX_RIESGOS.BENEFICIARIO.BENEFESP.BENEFESP_GAR}"> 
                <tr>
                        <td colspan="5">
                         <table class="area" align="right">
                            <tr>
                    <td align="left">
                        <div class="titulo" style="margin-left:10px;font-size: 11px;"><img src="images/flecha.gif"/><axis:alt f="axisctr009" c="TIT_BENGAR2" lit="9902498"/>
                                <b style="color:black">${element.OB_IAX_BENESPECIALES_GAR.TGARANT}<b>
                                </div>
                      
                    </td>
                </tr>
                        <tr>
                    <td>
                        <!-- DisplayTag beneficiarios identificados a nivel de garantia/amparo -->
                        <c:set var="title0"><axis:alt f="axisctr009" c="TIPODOC" lit="109774"/></c:set><%--tip doc--%>
                        <c:set var="title1"><axis:alt f="axisctr009" c="DOCUMENTO" lit="105330"/></c:set><%--documento--%>
                        <c:set var="title2"><axis:alt f="axisctr009" c="NOMBRE" lit="105940"/></c:set><%--nombre--%>
                        <c:set var="title3"><axis:alt f="axisctr009" c="CTIPBEN" lit="9901522"/></c:set><%--tipo ben--%>
                        <c:set var="title4"><axis:alt f="axisctr009" c="CPAREN" lit="9902580"/></c:set><%--parent--%>
                        <c:set var="title5"><axis:alt f="axisctr009" c="PORBENF" lit="9902581"/></c:set><%--porbenf--%>
                        <c:set var="title6"><axis:alt f="axisctr009" c="CONTIGENTE" lit="9902583"/></c:set><%--continentede--%>
                        	
                        <div class="separador">&nbsp;</div>
                        <div class="displayspace">
                              
                                    <display:table name="${element.OB_IAX_BENESPECIALES_GAR.BENEF_IDENT}" id="miL02" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" requestURI="axis_axisctr009.do?paginar=true">
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
       
  </axis:ocultar>
                  