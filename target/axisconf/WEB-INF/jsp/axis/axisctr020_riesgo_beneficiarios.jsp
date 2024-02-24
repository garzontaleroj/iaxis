<p>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"
                                                                              prefix="fmt"%><%@ taglib uri="/WEB-INF/tld/displaytag-11.tld"
                                                                                                       prefix="display"%><%@ taglib uri="http://java.sun.com/jsp/jstl/functions"
                                                                                                                                    prefix="fn"%><%@ taglib uri="/WEB-INF/tld/axis-1.tld"
                                                                                                                                                            prefix="axis"%>
</p>

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
<c:choose>
    <c:when test="${empty param.f}">
        <c:set var="pantalla" value="axisctr020"/>
    </c:when>
    <c:otherwise>
        <c:set var="pantalla" value="${param.f}"/>
    </c:otherwise>
</c:choose>
<!-- f_cargar_propiedades_pantalla(); -->
   <div class="separador">&nbsp;</div> 
            <table class="area" align="center">
            	   <axis:ocultar f="${pantalla}" c="DSP_BENEFICIARIOS">
                 <tr id="DSP_BENEFICIARIOS_parent">
                     <td class="campocaja" >
                        <div style="float:left;">
                            <img id="DSP_BENEFICIARIOS_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_BENEFICIARIOS', this)" style="cursor:pointer"/> 
                            <b><axis:alt f="${pantalla}" c="LIT_PARBENE" lit="1000079"/></b>
                        </div>
                        <axis:visible f="${pantalla}" c="LAPIZ1" >
                        <div style="float:right;" id="BENEFICIARIOS" c="LAPIZ1"></div>
                        </axis:visible>
                       <div class="seccion_suplementos" id="SECCION_BENEFICIARIOS"></div>
                        <div style="clear:both;">
                            <hr class="titulo">
                        </div>
                    </td>
                 </tr>
                 <%--axis:tabla name="${OB_IAX_RIESGOS.OB_IAX_BENEFICIARIOS}" miid="OB_IAX_BENEFICIARIOS" objeto="" campos="<axis:visible f='${pantalla}' c='CLAUBENEESP' >SCLABEN(O)#</axis:visible>DESCRIPCION(O)" estilos="<axis:visible f='${pantalla}' c='CLAUBENEESP'>dspNumber#</axis:visible>dspText" titulos="<axis:visible f='${pantalla}' c='CLAUBENEESP' >${title0}@@</axis:visible>${title1}" cellpadding="0" cellspacing="0"/--%> 
                 <tr id="DSP_BENEFICIARIOS_children" style="display:none">
                    <td class="campocaja" >
                    	
                         <axis:visible c="DSP_BENEFICIARIOS_1" f="${pantalla}">
                         <div class="displayspace">
                          <c:set var="title0"><axis:alt f="${pantalla}" c="LIT_CHI0BENE" lit="800440"/></c:set>
                          <c:set var="title1"><axis:alt f="${pantalla}" c="LIT_CHI1BENE" lit="101805"/></c:set>                               
                            <display:table name="${OB_IAX_RIESGOS.OB_IAX_BENEFICIARIOS}" id="lista_bene" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                            requestURI="axis_${pantalla}.do?paginar=true"> <!-- Esta no necesitamos desplegarla al volver de ordenar - siempre está desplegada -->
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <axis:visible f="${pantalla}" c="SCLABEN">
                                        <display:column title="${title0}" sortable="false"  headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                          <div class="dspText">${lista_bene.SCLABEN}</div>  
                                        </display:column>
                                        </axis:visible>
                                        <display:column title="${title1}" sortable="false"  headerClass="headwidth sortable"  media="html" autolink="false" >
                                          <div class="dspText">${lista_bene.DESCRIPCION}</div>  
                                        </display:column>
                            </display:table>
                            
                         </div>
                         
                         </axis:visible>
                           
                         
                         
                         <axis:visible f="${pantalla}" c="BEN_IDENT">
                          <axis:ocultar f="${pantalla}" c="DSP_BENRIESGO">
  
            <table class="area" align="center">
                <tr>
                    <td align="left">
                        <div class="titulo" style="margin-left:10px;font-size: 11px;"><img src="images/flecha.gif"/><axis:alt f="${pantalla}" c="TIT_DSP_BENEIDENT" lit="9902578"/>    </div>
                       
                
                            </td>
                </tr>
                <tr>
                    <td>
                        <!-- DisplayTag beneficiarios identificados a nivel de riesgo -->
                                <c:set var="title0"><axis:alt f="${pantalla}" c="TIPODOC" lit="109774"/></c:set><%--tip doc--%>
                        <c:set var="title1"><axis:alt f="${pantalla}" c="DOCUMENTO" lit="105330"/></c:set><%--documento--%>
                        <c:set var="title2"><axis:alt f="${pantalla}" c="NOMBRE" lit="105940"/></c:set><%--nombre--%>
                        <c:set var="title3"><axis:alt f="${pantalla}" c="CTIPBEN" lit="9901522"/></c:set><%--tipo ben--%>
                        <c:set var="title4"><axis:alt f="${pantalla}" c="CPAREN" lit="9902580"/></c:set><%--parent--%>
                        <c:set var="title5"><axis:alt f="${pantalla}" c="PORBENF" lit="9902581"/></c:set><%--porbenf--%>
                        <c:set var="title6"><axis:alt f="${pantalla}" c="CONTIGENTE" lit="9902583"/></c:set><%--continentede--%>
                                <!-- Codi estat #6.2013.22.2013.-->
                                <c:set var="title7"><axis:alt f="axisctr006" c="CESTADO" lit="9000793"/></c:set><%--testado--%>
                               <c:set var="title8"><axis:alt f="axisctr006" c="CONSULTAR" lit="1000439"/></c:set><%--Consultar--%> 
                               
                                 <c:set var="title9"><axis:alt f="axisctr006" c="CTTIPOCON" lit="9908388"/></c:set><%--contingency type--%>
                                
                                <c:set var="axis_lista_beneficiarios_identificados_nivel_rieso" value="${OB_IAX_RIESGOS.BENEFICIARIO.BENEFESP.BENEF_RIESGO}" />
                        <div class="separador">&nbsp;</div>
                        <div class="displayspace">
                                
                            <display:table name="${axis_lista_beneficiarios_identificados_nivel_rieso}" id="miL01" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" requestURI="axis_${pantalla}.do?paginar=true">
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
                                <axis:visible f="axisctr020" c="CESTADO">
                                     <display:column title="${title7}" sortable="true" sortProperty="OB_IAX_BENEIDENTIFICADOS.TESTADO" headerClass="sortable"  style="width:10%;" media="html" autolink="false" >
                                        <div class="dspText">${miL01.OB_IAX_BENEIDENTIFICADOS.TESTADO}</div>
                                    </display:column>
                                </axis:visible>
                                <axis:visible f="axisctr020" c="NOMBRE_TIT">
                                    <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_BENEIDENTIFICADOS.NOMBRE_TIT" headerClass="sortable" style="width:25%;"  media="html" autolink="false" >
                                        <div class="dspText">${miL01.OB_IAX_BENEIDENTIFICADOS.NOMBRE_TIT}</div>
                                    </display:column>
                                </axis:visible>
                                  <axis:visible f="axisctr006" c="CTTIPOCON">    
                                     <display:column title="${title9}" sortable="true" sortProperty="OB_IAX_BENEIDENTIFICADOS.TTIPOCON" headerClass="sortable" style="width:25%;"  media="html" autolink="false" >
                                        <div class="dspText">${miL01.OB_IAX_BENEIDENTIFICADOS.TTIPOCON}</div>
                                    </display:column>     
                                </axis:visible>                               
    
                               <axis:visible f="axisctr020" c="BT_CON_FIND_BEN"> 
                                    <display:column title="${title8}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                        <div class="dspIcons">
                                            <img id="find" border="0" src="images/find.gif" onclick="javascript:f_consultar_persona('${miL01.OB_IAX_BENEIDENTIFICADOS.SPERSON}');" style="cursor:pointer"/>
                                        </div>
                                    </display:column>  
                               </axis:visible>
                            </display:table>
                        </div>
                        <div class="separador">&nbsp;</div>
                    </td>
                </tr>
            </table>
        
  </axis:ocultar>
  
  
     <axis:ocultar f="${pantalla}" c="DSP_GAR_BENEF">
  
            <table class="area" align="center">
                <tr>
                    <td align="left">
                        <div class="titulo" style="margin-left:10px;font-size: 11px;"><img src="images/flecha.gif"/><axis:alt f="${pantalla}" c="TIT_BENGAR" lit="9902585"/></div>
                        
                    </td>
                </tr>
                        
                        <c:if test="${!empty OB_IAX_RIESGOS.BENEFICIARIO.BENEFESP.BENEFESP_GAR}">
                       
                        
                        <c:forEach var="element"  items="${OB_IAX_RIESGOS.BENEFICIARIO.BENEFESP.BENEFESP_GAR}"> 
                <tr>
                        <td colspan="5">
                         <table class="area" align="right">
                            <tr>
                    <td align="left">
                        <div class="titulo" style="margin-left:10px;font-size: 11px;"><img src="images/flecha.gif"/><axis:alt f="${pantalla}" c="TIT_BENGAR2" lit="9902498"/>
                                <b style="color:black">${element.OB_IAX_BENESPECIALES_GAR.TGARANT}<b>
                                </div>
                      
                    </td>
                </tr>
                        <tr>
                    <td>
                        <!-- DisplayTag beneficiarios identificados a nivel de garantia/amparo -->
                       <!-- DisplayTag beneficiarios identificados a nivel de riesgo -->
                                <c:set var="title0"><axis:alt f="${pantalla}" c="TIPODOC" lit="109774"/></c:set><%--tip doc--%>
                        <c:set var="title1"><axis:alt f="${pantalla}" c="DOCUMENTO" lit="105330"/></c:set><%--documento--%>
                        <c:set var="title2"><axis:alt f="${pantalla}" c="NOMBRE" lit="105940"/></c:set><%--nombre--%>
                        <c:set var="title3"><axis:alt f="${pantalla}" c="CTIPBEN" lit="9901522"/></c:set><%--tipo ben--%>
                        <c:set var="title4"><axis:alt f="${pantalla}" c="CPAREN" lit="9902580"/></c:set><%--parent--%>
                        <c:set var="title5"><axis:alt f="${pantalla}" c="PORBENF" lit="9902581"/></c:set><%--porbenf--%>
                        <c:set var="title6"><axis:alt f="${pantalla}" c="CONTIGENTE" lit="9902583"/></c:set><%--continentede--%>
                      
                        <div class="separador">&nbsp;</div>
                        <div class="displayspace">
                              
                                    <display:table name="${element.OB_IAX_BENESPECIALES_GAR.BENEF_IDENT}" id="miL02" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" requestURI="axis_${pantalla}.do?paginar=true">
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
                                <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_BENEIDENTIFICADOS.NOMBRE_TIT" headerClass="sortable" style="width:25%;"  media="html" autolink="false" >
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
  </axis:visible>
   </axis:ocultar>
                  
                         
                         
                         
                         
                         
                         
                         
                         
                         
                         
                         
                         
                         
                         
                    </td>
                </tr>
             
            </table>