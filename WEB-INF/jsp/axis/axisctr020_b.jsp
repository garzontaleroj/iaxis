<%/* Revision:# miOBvcqFj15DLVhVYf+Skg== # */%>
<p>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    <%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
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


<c:if test="${!empty T_IAX_PREGUNTAS || !empty pregQuestSalut || !empty pregDespeses}">
                                <axis:visible c="DSP_TOT_PREGUNTAS" f="${pantalla}">
                                            <tr>
                                                <td class="campocaja" >
                                                    <div style="float:left;">
                                                        <img id="DSP_PREGUNTAS_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_PREGUNTAS', this)" style="cursor:pointer"/> 
                                                       <b><axis:alt c="LIT_TOT_PREGUNTAS" f="${pantalla}" lit="102299"/></b> 
                                                        
                                                    </div>
                                                    <axis:visible f="${pantalla}" c="LAPIZ1" >
                                                    <div style="float:right;" id="PREGUNTAS" c="LAPIZ1"></div>
                                                    </axis:visible>
                                                    <div class="seccion_suplementos" id="SECCION_PREGUNTAS"></div>
                                                    <div style="clear:both;">
                                                        <hr class="titulo">
                                                    </div>    
                                                </td>
                                            </tr>
                                            <tr id="DSP_PREGUNTAS_children" style="display:none">
                                               <td class="campocaja" >
                                                
                                                 <c:if test="${!empty T_IAX_PREGUNTAS}">
                                                    <axis:visible c="DSP_PREGUNTAS" f="${pantalla}">
                                                    <table class="area" align="center">
                                                        <tr>
                                                            <td class="campocaja" >
                                                            </td>
                                                        </tr>
                                                        <tr>   
                                                            <td class="campocaja" >
                                                               <div class="displayspace">
                                                                 <c:set var="title0"><axis:alt f="axisctr020" c="NNUM" lit="800440" /></c:set>
                                                                 <c:set var="title1"><axis:alt f="axisctr020" c="CPREGUN" lit="102738" /></c:set>
                                                                 <c:set var="title2"><axis:alt f="axisctr020" c="TRESPUE" lit="103712" /></c:set>
                                                                  <display:table name="${T_IAX_PREGUNTAS}" id="T_IAX_PREGUNTAS" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0" 
                                                                  requestURI="axis_${pantalla}.do?paginar=true&tabla=T_IAX_PREGUNTAS">
                                                                       <%@ include file="../include/displaytag.jsp"%>
                                                                       <axis:visible c="CPREGUN" f="${pantalla}">
                                                                       <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PREGUNTAS.CPREGUN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                                           <div class="dspNumber">${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.CPREGUN}</div>
                                                                       </display:column>
                                                                       </axis:visible>
                                                                       <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PREGUNTAS.TPREGUN" headerClass="sortable"  media="html" autolink="false" >
                                                                           <div class="dspText">${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TPREGUN}</div>
                                                                       </display:column>
                                                                       <display:column title="${title2}" sortable="false" headerClass="headwidth30 sortable"  media="html" autolink="false" >
                                                                           <div class="dspText">
                                                                                <c:choose>
                                                                                    <c:when test="${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TRESPUE != null}">
                                                                                        ${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TRESPUE}
                                                                                    </c:when>
                                                                                    <c:when test="${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.CRESPUE != null}">
                                                                                         ${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.CRESPUE}
                                                                                    </c:when>
                                                                                     <c:when test="${!empty T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TPREGUNTASTAB}">
                                                                                     <a href="javascript:void(0)" onClick="f_abrir_188('${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.CPREGUN}','${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TPREGUN}','P');"> 
                                                                                        <b style="color:red"><axis:alt f="axisctr004" c="VERDETALLE" lit="9000968"/></b>
                                                                                      </a>
                                                                                     </c:when>
                                                                                   
                                                                                </c:choose>
                                                                           </div>
                                                                       </display:column>                                                    
                                                                  </display:table>
                                                               </td>
                                                            </tr>
                                                    </table>
                                                    </axis:visible>
                                                </c:if>
                                
                                <c:if test="${!empty pregQuestSalut}">
                                <axis:visible c="DSP_PREGUNTAS_QUESTSALUT" f="${pantalla}">
                                <table class="area" align="center">            
                                            <tr>
                                                <td class="campocaja" >
                                                   <img id="DSP_PREGUNTAS_QUESTSALUT_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_PREGUNTAS_QUESTSALUT', this)" style="cursor:pointer"/> 
                                                   <b><axis:alt c="LIT_PREG_QUESTSALUT" f="${pantalla}" lit="103672"/></b>  
                                                   <hr class="titulo">
                                               </td>
                                            </tr>
                                            <tr id="DSP_PREGUNTAS_QUESTSALUT_children" style="display:none">
                                               <td class="campocaja" >
                                                   <div class="displayspace">
                                                     <c:set var="title0"><axis:alt f="axisctr020" c="NNUM" lit="800440" /></c:set>
                                                     <c:set var="title1"><axis:alt f="axisctr020" c="CPREGUN" lit="102738" /></c:set>
                                                     <c:set var="title2"><axis:alt f="axisctr020" c="TRESPUE" lit="103712" /></c:set>
                                                      <display:table name="${pregQuestSalut}" id="T_IAX_PREGUNTAS" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0" 
                                                      requestURI="axis_${pantalla}.do?paginar=true&tabla=T_IAX_PREGUNTAS">
                                                           <%@ include file="../include/displaytag.jsp"%>
                                                           <axis:visible c="CPREGUN" f="${pantalla}">
                                                           <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PREGUNTAS.CPREGUN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                               <div class="dspNumber">${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.CPREGUN}</div>
                                                           </display:column>
                                                          </axis:visible>
                                                           <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PREGUNTAS.TPREGUN" headerClass="sortable"  media="html" autolink="false" >
                                                               <div class="dspText">${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TPREGUN}</div>
                                                           </display:column>
                                                           <display:column title="${title2}" headerClass="headwidth30 sortable" media="html" autolink="false">
                                                               <div class="dspText">
                                                               
                                                                  <c:choose>
                                                                        <c:when test="${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TRESPUE != null}">
                                                                            ${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TRESPUE}
                                                                        </c:when>
                                                                        <c:when test="${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.CRESPUE != null}">
                                                                             ${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.CRESPUE}
                                                                        </c:when>
                                                                         <c:when test="${!empty T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TPREGUNTASTAB}">
                                                                         <a href="javascript:void(0)" onClick="f_abrir_188('${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.CPREGUN}','${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TPREGUN}','P');"> 
                                                                            <b style="color:red"><axis:alt f="axisctr004" c="VERDETALLE" lit="9000968"/></b>
                                                                          </a>
                                                                         </c:when>
                                                                       
                                                                    </c:choose>
                                                               </div>
                                                           </display:column>                                                    
                                                      </display:table>
                                                   </div>
                                               </td>
                                            </tr>
                                            </table>
                                            </axis:visible>
                                </c:if>
                                
                                <c:if test="${!empty pregDespeses}">
                                <axis:visible c="DSP_PREGUNTAS_DESPESES" f="${pantalla}">
                                <table class="area" align="center">
                                            <tr>
                                                <td class="campocaja" >
                                                   <img id="DSP_DSP_PREGUNTAS_DESPESES_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_PREGUNTAS_DESPESES', this)" style="cursor:pointer"/> 
                                                   <b><axis:alt c="LIT_PREG_DESPESES" f="${pantalla}" lit="9001509"/></b>   
                                                   <hr class="titulo">
                                               </td>
                                            </tr>
                                            <tr id="DSP_PREGUNTAS_DESPESES_children" style="display:none">
                                               <td class="campocaja" >
                                                   <div class="displayspace">
                                                     <c:set var="title0"><axis:alt f="axisctr020" c="NNUM" lit="800440" /></c:set>
                                                     <c:set var="title1"><axis:alt f="axisctr020" c="CPREGUN" lit="102738" /></c:set>
                                                     <c:set var="title2"><axis:alt f="axisctr020" c="TRESPUE" lit="103712" /></c:set>
                                                      <display:table name="${pregDespeses}" id="T_IAX_PREGUNTAS" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0" 
                                                      requestURI="axis_${pantalla}.do?paginar=true&tabla=T_IAX_PREGUNTAS">
                                                           <%@ include file="../include/displaytag.jsp"%>
                                                           <axis:visible c="CPREGUN" f="${pantalla}">
                                                           <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PREGUNTAS.CPREGUN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                               <div class="dspNumber">${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.CPREGUN}</div>
                                                           </display:column>
                                                          </axis:visible>
                                                           <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PREGUNTAS.TPREGUN" headerClass="sortable"  media="html" autolink="false" >
                                                               <div class="dspText">${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TPREGUN}</div>
                                                           </display:column>
                                                           <display:column title="${title2}" headerClass="headwidth30 sortable" media="html" autolink="false">
                                                               <div class="dspText">
                                                                   <c:choose>
                                                                        <c:when test="${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TRESPUE != null}">
                                                                            ${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TRESPUE}
                                                                        </c:when>
                                                                        <c:when test="${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.CRESPUE != null}">
                                                                             ${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.CRESPUE}
                                                                        </c:when>
                                                                         <c:when test="${!empty T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TPREGUNTASTAB}">
                                                                         <a href="javascript:void(0)" onClick="f_abrir_188('${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.CPREGUN}','${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TPREGUN}','P');"> 
                                                                            <b style="color:red"><axis:alt f="axisctr004" c="VERDETALLE" lit="9000968"/></b>
                                                                          </a>
                                                                         </c:when>
                                                                       
                                                                    </c:choose>
                                                               </div>
                                                           </display:column>                                                    
                                                      </display:table>
                                                   </div>
                                               </td>
                                            </tr>
                                            </table>
                                </axis:visible>
                                </c:if>

                   
               </td>
            </tr>
</axis:visible>
</c:if>
<axis:visible c="DSP_CONTRAGARAN" f="axisctr306">
	<c:if test="${__formdata.T_IAX_CONTRAGARAN!=null}">
	<tr>
		<td class="campocaja">
		<img src="images/mes.gif" id="DSP_CONTRAGARAN_parent" onclick="objEstilos.toggleDisplay('DSP_CONTRAGARAN', this)" style="cursor: pointer" /> 
			<b><axis:alt f="axisctr306" c="CGAR" lit="9908805" /></b>
			<hr class="titulo">
		</td>
	</tr>
	<tr id="DSP_CONTRAGARAN_children" style="display: none">
		<td class="campocaja">
		<c:import url="../include/modal_estandar.jsp">
				<c:param name="titulo">
					<axis:alt f="axiscga001" c="DOCU_REQUERIDA" lit="9908805" />
				</c:param>
				<c:param name="nid" value="axiscga002" />
			</c:import>
			<script type="text/javascript">
			function f_consultar_contragarantia(SCONTGAR,NMOVIMI,SPERSON) {
				objUtiles.abrirModal("axiscga002", "src","modal_axiscga002.do?operation=detalle_consulta&SCONTGAR=" + SCONTGAR+ "&SPERSON=" + SPERSON+"&CMODOPAN=CONSULTA"+"&NMOVIMI="+NMOVIMI+"&SSEGUROPRODUCCION=${sessionScope.SSEGURO}");			
			}
			function f_but_cerrar_axiscga002(){
		    	objUtiles.cerrarModal("axiscga002");		    	
		   }
			</script>
		<div class="displayspace">
						<c:set var="title0"><axis:alt f="axisctr306" c="SCONTGAR" lit="9908801"/></c:set>
                       <c:set var="title1"><axis:alt f="axisctr306" c="TDESCRIP" lit="100588"/></c:set>
                       <c:set var="title2"><axis:alt f="axisctr306" c="TTIPO" lit="9907700"/></c:set>
                       <c:set var="title3"><axis:alt f="axisctr306" c="TCLASE" lit="9904874"/></c:set>
                       <c:set var="title4"><axis:alt f="axisctr306" c="TTENEDOR" lit="9908802"/></c:set>
                       <c:set var="title5"><axis:alt f="axisctr306" c="TESTADO" lit="101510"/></c:set>
                       <c:set var="title6"><axis:alt f="axisctr306" c="IVALOR" lit="101159"/></c:set> 
                       <c:set var="title7"><axis:alt f="axisctr306" c="CONSULTAR" lit="1000439"/></c:set>
                       <c:set var="axisctr306_lista_contragaran" value="${__formdata.T_IAX_CONTRAGARAN}" />    
                       <div class="separador">&nbsp;</div>
                       
                       <display:table name="${axisctr306_lista_contragaran}" id="miLCC" export="false" class="dsptgtable"
							pagesize="-1" defaultsort="2" defaultorder="ascending"
							requestURI="axis_axisctr306.do?paginar=true" sort="list"
							cellpadding="0" cellspacing="0">
							<%@ include file="../include/displaytag.jsp"%>
                        	
                        	<display:column title="${title0}" sortProperty="SCONTGAR" headerClass="sortable" media="html" sortable="true"
								autolink="false">
                                <div class="dspText">${miLCC.OB_IAX_CONTRAGARAN.SCONTGAR}</div>
                            </display:column>
                            <display:column title="${title1}" sortProperty="TDESCRIP" headerClass="sortable" media="html" sortable="true"
								autolink="false">
                                <div class="dspText">${miLCC.OB_IAX_CONTRAGARAN.TDESCRIP}</div>
                            </display:column>
                            <display:column title="${title2}" sortProperty="TTIPO" headerClass="sortable" media="html" sortable="true"
								autolink="false">
                                <div class="dspText">${miLCC.OB_IAX_CONTRAGARAN.TTIPO}</div>
                            </display:column>
                            <display:column title="${title3}" sortProperty="TCLASE" headerClass="sortable" media="html" sortable="true"
								autolink="false">
                                <div class="dspText">${miLCC.OB_IAX_CONTRAGARAN.TCLASE}</div>
                            </display:column>
                            <display:column title="${title4}" sortProperty="TTENEDOR" headerClass="sortable" media="html" sortable="true"
								autolink="false">
                                <div class="dspText">${miLCC.OB_IAX_CONTRAGARAN.TTENEDOR}</div>
                            </display:column>
                            <display:column title="${title5}" sortProperty="TESTADO" headerClass="sortable" media="html" sortable="true"
								autolink="false">
                                <div class="dspText">${miLCC.OB_IAX_CONTRAGARAN.TESTADO}</div>
                            </display:column>
                            <display:column title="${title6}" sortProperty="IVALOR" headerClass="sortable" media="html" sortable="true"
								autolink="false">
                                <div class="dspText">${miLCC.OB_IAX_CONTRAGARAN.IVALOR}</div>
                            </display:column>
                            
                            <display:column title="${title7}" headerClass="sortable" media="html" sortable="false"
								autolink="false">
								<div class="dspIcons">
									<img id="find" border="0" src="images/find.gif"
										onclick="javascript:f_consultar_contragarantia('${miLCC.OB_IAX_CONTRAGARAN.SCONTGAR}','${miLCC.OB_IAX_CONTRAGARAN.SPERSON}','${miLCC.OB_IAX_CONTRAGARAN.NMOVIMI}');"
										style="cursor: pointer" />
								</div>
							</display:column>
                            
		                                    
                        </display:table>     
                        </div>
                         
		</td>
		</tr>
</c:if>		
</axis:visible>
<c:if test="${! empty datos_poliza}">
<axis:visible c="DSP_CITAMEDICA" f="axisctr020">
        <tr>
            <td class="campocaja">
                <img src="images/mes.gif" id="DSP_CITAMEDICA_parent" onclick="objEstilos.toggleDisplay('DSP_CITAMEDICA', this)" style="cursor:pointer"/> 
                <b><axis:alt f="axisctr009" c="CITA" lit="9908315" /></b> 
                 <axis:visible f="${pantalla}" c="LAPIZ1" >
                    <div style="float:right;" id="CITASMEDICAS" c="LAPIZ1"></div>
                 </axis:visible>
                 <div class="seccion_suplementos" id="SECCION_CITASMEDICAS"></div>
                 <div style="clear:both;">
                    <hr class="titulo">
                 </div> 
            </td>
        </tr>
        
        <tr id="DSP_CITAMEDICA_children" style="display:none">
            <td class="campocaja">
            <table class="area" align="center">
                <tr>
                    <td align="left">
                        <div class="titulo" style="margin-left:10px;font-size: 9px;"><img src="images/flecha.gif"/><axis:alt f="${pantalla}" c="TIT_DSP_BENEIDENT" lit="9908458"/>    </div>
                       
                
                            </td>
                </tr>
                <tr>
                    <td>
                <div class="displayspace">
		                            <c:set var="title0"><axis:alt f="axisctr306" c="CODEVID" lit="9908314"/></c:set><%--Codigo cita medica--%>
		                            <c:set var="title1"><axis:alt f="axisctr306" c="TEVIDEN" lit="9908312"/></c:set><%--Tipo cita medica--%>
		                            <c:set var="title2"><axis:alt f="axisctr306" c="NOMASEG" lit="100645"/></c:set><%--Nombre Asegurado--%>
		                            <c:set var="title3"><axis:alt f="axisctr306" c="NOMMEDI" lit="9908313"/></c:set><%--Nombre medico--%>
                                            <c:set var="title4"><axis:alt f="axisctr306" c="TESTADO" lit="9905523"/></c:set><%--Estado--%>
                                            <c:set var="title5"><axis:alt f="axisctr306" c="FEVIDEN" lit="9908311"/></c:set><%--Fecha cita medica--%>
                                            <c:set var="title6"><axis:alt f="axisctr306" c="CPAGO" lit="9908320"/></c:set><%--Estado--%>
                                            <c:set var="title7"><axis:alt f="axisctr306" c="IEVIDEN" lit="9908321"/></c:set><%--Fecha cita medica--%>            
                                    <c:set var="axisctr306_lista_citasmedicas" value="${__formdata.T_IAX_CITAMEDICA}" />
		                            <div class="separador">&nbsp;</div>
		                            
                                            
		                                <display:table name="${axisctr306_lista_citasmedicas}" id="miL01" export="false" class="dsptgtable" defaultsort="1" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" requestURI="axis_axisctr306.do">
		                                    <%@ include file="../include/displaytag.jsp"%>
                                                    
		                                    <display:column title="${title0}" sortable="true" sortProperty="CODEVID" headerClass="sortable" style="width:5%;"  media="html" autolink="false" >
                                                    <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 0}">
		                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.CODEVID}</div>
                                                    </c:if>
		                                    </display:column>
		                                    <display:column title="${title1}" sortable="true" sortProperty="TEVIDEN" headerClass="sortable" style="width:20%;"  media="html" autolink="false" >
		                                    <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 0}">
                                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.TEVIDEN}</div>
                                                    </c:if>
		                                    </display:column>
		                                    <display:column title="${title2}" sortable="true" sortProperty="NOMASEG" headerClass="sortable" style="width:10%;"  media="html" autolink="false" >
		                                    <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 0}">
                                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.NOMASEG}</div>
                                                    </c:if>
		                                    </display:column>
		                                    <display:column title="${title3}" sortable="true" sortProperty="NOMMEDI" headerClass="sortable"  style="width:10%;" media="html" autolink="false" >
		                                    <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 0}">
                                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.NOMMEDI}</div>
                                                    </c:if>
		                                    </display:column>

		                                      <display:column title="${title4}" sortable="true" sortProperty="TESTADO" headerClass="sortable" style="width:10%;"  media="html" autolink="false" >
		                                      <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 0}">
                                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.TESTADO}</div>
                                                      </c:if>
		                                      </display:column>
                                         
		                                      <display:column title="${title5}" sortable="true" sortProperty="FEVIDEN" headerClass="sortable"  style="width:10%;" media="html" autolink="false" >
		                                      <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 0}">
                                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.FEVIDEN}</div>
                                                      </c:if>
		                                      </display:column>
 		                                      <display:column title="${title6}" sortable="true" sortProperty="TPAGO" headerClass="sortable" style="width:5%;"  media="html" autolink="false" >
		                                      <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 0}">
                                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.TPAGO}</div>
                                                      </c:if>
		                                      </display:column>
                                         
		                                      <display:column title="${title7}" sortable="true" sortProperty="IEVIDEN" headerClass="sortable"  style="width:5%;" media="html" autolink="false" >
		                                      <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 0}">
                                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.IEVIDEN}</div>
                                                      </c:if>
		                                      </display:column>                                        

                                                        
                                                    </display:table>        
                </div>
                </td>
                </tr>
                <tr>
                    <td align="left">
                        <div class="titulo" style="margin-left:10px;font-size: 9px;"><img src="images/flecha.gif"/><axis:alt f="${pantalla}" c="TIT_DSP_BENEIDENT" lit="9908459"/>    </div>
                       
                
                            </td>
                </tr>
                <tr>
                    <td>
                       <div class="displayspace">
		                    <c:set var="title0"><axis:alt f="axisctr306" c="CODEVID" lit="9908314"/></c:set><%--Codigo cita medica--%>
                                    <c:set var="title1"><axis:alt f="axisctr306" c="TEVIDEN" lit="9908312"/></c:set><%--Tipo cita medica--%>
                                    <c:set var="title2"><axis:alt f="axisctr306" c="NOMASEG" lit="100645"/></c:set><%--Nombre Asegurado--%>
                                    <c:set var="title3"><axis:alt f="axisctr306" c="NOMMEDI" lit="9908313"/></c:set><%--Nombre medico--%>
                                    <c:set var="title4"><axis:alt f="axisctr306" c="TESTADO" lit="9905523"/></c:set><%--Estado--%>
                                    <c:set var="title5"><axis:alt f="axisctr306" c="FEVIDEN" lit="9908311"/></c:set><%--Fecha cita medica--%>
                                    <c:set var="title6"><axis:alt f="axisctr306" c="CPAGO" lit="9908320"/></c:set><%--Estado--%>
                                    <c:set var="title7"><axis:alt f="axisctr306" c="IEVIDEN" lit="9908321"/></c:set><%--Fecha cita medica--%>            
                                    <c:set var="axisctr306_lista_citasmedicas" value="${__formdata.T_IAX_CITAMEDICA}" />
		                    <div class="separador">&nbsp;</div>
		                                <display:table name="${axisctr306_lista_citasmedicas}" id="miL01" export="false" class="dsptgtable" defaultsort="1" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" requestURI="axis_axisctr306.do">
		                                    
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    
		                                    <display:column title="${title0}" sortable="true" sortProperty="CODEVID" headerClass="sortable" style="width:5%;"  media="html" autolink="false" >
                                                    <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 1}">
		                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.CODEVID}</div>
                                                    </c:if>
		                                    </display:column>
		                                    <display:column title="${title1}" sortable="true" sortProperty="TEVIDEN" headerClass="sortable" style="width:20%;"  media="html" autolink="false" >
		                                    <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 1}">
                                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.TEVIDEN}</div>
                                                    </c:if>
		                                    </display:column>
		                                    <display:column title="${title2}" sortable="true" sortProperty="NOMASEG" headerClass="sortable" style="width:10%;"  media="html" autolink="false" >
		                                    <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 1}">
                                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.NOMASEG}</div>
                                                    </c:if>
		                                    </display:column>   
                                                </display:table>
                      </div> 
                  </td>
                </tr>
              </table>
            </td> 
        </tr>
       
        

</axis:visible>
</c:if>
<!-- SECCION CAPITALES ASEGURADOS / CAPITALS ASSEGURATS-->

    <axis:visible c="DSP_SALDODEUTOR" f="${pantalla}">
        <c:if test="${!empty OB_IAX_RIESGOS.PRESTAMO}">
            
                     <tr>
                         <td class="campocaja" >
                            <div class="separador">&nbsp;</div>   
                            <div style="float:left;">
                                <img id="DSP_SALDODEUTOR_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_SALDODEUTOR', this)" style="cursor:pointer"/> 
                                <b><axis:alt f="${pantalla}" c="DSP_CAPASEG" lit="9002050"></axis:alt></b>
                            </div>
                            <axis:visible f="${pantalla}" c="LAPIZ1" >
                            <div style="float:right;" id="DATOS_PRESTAMO" c="LAPIZ1"></div>
                            </axis:visible>
                            <div class="seccion_suplementos" id="SECCION_PRESTAMOS"></div>
                            <div style="clear:both;">
                                <hr class="titulo">
                            </div>
                        </td>
                     </tr>
                     <tr id="DSP_SALDODEUTOR_children" style="display:none">
                         <td class="campocaja">
                            <table>
                              <tr>
                                   <th style="width:90%;height:0px"></th>
                              </tr>
                              <tr>
                                <td>
                                  <div class="displayspace">
                                <!-- displaytag! -->
                                    <c:set var="title0"><axis:alt f="${fname}" c="TITLE00" lit="1000109" /></c:set>
                                    <c:set var="title1"><axis:alt f="${fname}" c="TITLE01" lit="100588" /></c:set>
                                    <c:set var="title2"><axis:alt f="${fname}" c="TITLE02" lit="9001942" /></c:set>
                                    <c:set var="title3"><axis:alt f="${fname}" c="TITLE03" lit="9002015" /></c:set>
                                    <c:set var="title4"><axis:alt f="${fname}" c="TITLE04" lit="9900816" /></c:set>
                                    <c:set var="title5"><axis:alt f="${fname}" c="TITLE05" lit="105815" /></c:set>
                                    <c:set var="title6"><axis:alt f="${fname}" c="TITLE06" lit="9002016" /></c:set>
                                    <c:set var="title7"><axis:alt f="${fname}" c="TITLE07" lit="108871" /></c:set>
                                    <c:set var="title88"><axis:alt f="${fname}" c="TITLE08" lit="108871" /></c:set>
                                    <c:set var="title9"><axis:alt f="${fname}" c="TITLE09" lit="100565" /></c:set>
                                    <c:set var="title10"><axis:alt f="${fname}" c="TITLE10" lit="9000526" /></c:set>
                                    <c:set var="title11"><axis:alt f="${fname}" c="TITLE11" lit="9000527" /></c:set>             
                                    <%int contador = 0;%>
                                    <display:table name="${OB_IAX_RIESGOS.PRESTAMO}" id="miListaId" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="axis_${pantalla}.do?paginar=true">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <c:set var="contador"><%=contador%></c:set>  
                                            <%--restringim que nomes s'ens mostri els registres marcats--%>
                                            <axis:visible c="RADIOBUTTON" f="${pantalla}">                                                                                                    
                                                <display:column title="" sortable="false" headerClass="sortable headwidth5 fixed"  media="html" autolink="false">
                                                    <div class="dspIcons">
                                                        <input type="radio" name="selCesiones" id="" value=""
                                                        onclick="f_recargar_cuadro_amortizacion('${contador}');"                                                            
                                                        <c:if test="${__formdata.NCONTADOR == contador}"> checked </c:if> >
                                                    </div>
                                                </display:column>
                                             </axis:visible>   
                                            <axis:visible c="RADIO" f="${pantalla}">
                                             <display:column title="" sortable="false" style="width:5%;" sortProperty="selectedSaldo" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspIcons">
                                                <input disabled <c:if test="${miListaId.OB_IAX_PRESTAMOSEG['SELSALDO']==1}">checked</c:if> 
                                                    type="checkbox" id="selectedSaldo" name="selectedSaldo" value="${miListaId.OB_IAX_PRESTAMOSEG['SELSALDO']}"/>
                                                </div>    
                                            </display:column>
                                            </axis:visible>
                                            <axis:visible c="IDCUENTA" f="${pantalla}">
                                            <display:column title="${title0}" sortable="false" style="width:18%;" sortProperty="IDCUENTA" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspNumber">${miListaId.OB_IAX_PRESTAMOSEG.IDCUENTA}</div>
                                            </display:column>
                                            </axis:visible>
                                            <axis:visible c="DESCRIPCION" f="${pantalla}">
                                            <display:column title="${title1}" sortable="false" style="width:19%;" sortProperty="TTIPCUENTA" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText">${miListaId.OB_IAX_PRESTAMOSEG.DESCRIPCION}</div>
                                            </display:column>
                                            </axis:visible>
                                            <axis:visible c="CMONEDA" f="${pantalla}">
                                            <display:column title="${title4}" style="width:5%;" sortable="false" sortProperty="CMONEDA" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText">${miListaId.OB_IAX_PRESTAMOSEG.CMONEDA}</div>
                                            </display:column>
                                            </axis:visible>
                                            <axis:visible c="ISALDO" f="${pantalla}">
                                            <display:column title="${title2}" sortable="false" style="width:15%;" sortProperty="ISALDO" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaId.OB_IAX_PRESTAMOSEG.ISALDO}"/></div>
                                            </display:column>
                                            </axis:visible>
                                            <axis:visible c="ILIMITE" f="${pantalla}">
                                            <display:column title="${title88}" sortable="false" style="width:12%;" sortProperty="ILIMITE" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspNumber">
                                                    <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaId.OB_IAX_PRESTAMOSEG.ILIMITE}"/>
                                                    
                                                </div>
                                            </display:column>
                                            </axis:visible>
                                            <axis:visible c="TTIPIMPORTE" f="${pantalla}">
                                            <display:column title="${title9}"
                                                        headerClass="headwidth5 sortable fixed"
                                                        media="html" style="width:7%;"
                                                        autolink="false">
                                            <div class="dspText">${miListaId.OB_IAX_PRESTAMOSEG.TTIPIMP}</div>
                                            </display:column>
                                            </axis:visible>
                                        
                                        <axis:visible c="CTIPIMPORTE" f="${pantalla}">
                                        <display:column title="%" sortable="false" style="width:3%;" sortProperty="ILIMITE" headerClass="sortable fixed"  media="html" autolink="false" >
                                                    <div class="dspText">
                                            <%-- <c:choose>
                                                <c:when test="${!empty miListaId.OB_IAX_PRESTAMOSEG.CTIPIMP &&  miListaId.OB_IAX_PRESTAMOSEG.CTIPIMP == 2}">  --%>
                                                    <div class="dspNumber"><fmt:formatNumber pattern="###,##0.00" value="${miListaId.OB_IAX_PRESTAMOSEG.PORCEN}"/></div>
                                            <%--     </c:when>
                                                 <c:otherwise>
                                                           &nbsp; 
                                                </c:otherwise>
                                            </c:choose> --%>
                                         </div>
                                        </display:column>
                                        </axis:visible>
                                        <axis:visible c="ICAPMAX" f="${pantalla}">
                                            <display:column title="${title5}" style="width:8%;" sortable="false" sortProperty="ICAPMAX" headerClass="sortable fixed"  media="html" autolink="false" >
                                                 <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaId.OB_IAX_PRESTAMOSEG.ICAPMAX}"/></div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible c="ICAPASEG" f="${pantalla}">
                                            <display:column title="${title6}" sortable="false" style="width:8%;" sortProperty="ICAPASEG" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaId.OB_IAX_PRESTAMOSEG.ICAPASEG}"/></div>
                                            </display:column> 
                                        </axis:visible>
                                         <axis:visible c="FINIPREST" f="${pantalla}">
                                            <display:column title="${title10}" sortable="false" style="width:8%;" sortProperty="FINIPREST" headerClass="sortable fixed"  media="html" autolink="false" >
                                               <div class="dspText"><fmt:formatDate value="${miListaId.OB_IAX_PRESTAMOSEG.FINIPREST}" pattern="dd/MM/yyyy"/></div>
                                            </display:column> 
                                        </axis:visible>
                                        <axis:visible c="FFINPREST" f="${pantalla}">
                                            <display:column title="${title11}" sortable="false" style="width:8%;" sortProperty="FFINPREST" headerClass="sortable fixed"  media="html" autolink="false" >                                               
                                                <div class="dspText"><fmt:formatDate value="${miListaId.OB_IAX_PRESTAMOSEG.FFINPREST}" pattern="dd/MM/yyyy"/></div>
                                            </display:column> 
                                        </axis:visible>
                                        <%contador++;%>
                                    </display:table>
                                </div>
                            </td>
                            
                        </tr>
                           
                        <tr>
                            <axis:ocultar f="${pantalla}" c="ICAPMAXPOL" dejarHueco="false">
                                <td class="campocaja">
                                    <div class="separador">&nbsp;</div>   
                                    <b id="label_ICAPMAXPOL"><axis:alt f="${fname}" c="ICAPMAXPOL" lit="9002025" /></b> &nbsp;
                                    <input  type="text" class="campowidth campo campotexto" id="ICAPMAXPOL" name="ICAPMAXPOL" size="3" style="width:10%;text-align:right;"
                                            value="<fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${datos_poliza.ICAPMAXPOL}"/>" readonly="true" 
                                            <axis:atr f="${pantalla}" c="ICAPMAXPOL" a="modificable=false&formato=decimal"/> />
                                </td>
                            </axis:ocultar>  
                        </tr>
                            <!--nova subseccio-->
                        <axis:ocultar f="${pantalla}" c="CUADRODEAMORTIZACION" dejarHueco="false">                            
                            <tr>
                                <td class="campocaja">                              
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                <div class="separador">&nbsp;</div>
                                
                                <table class="area" align="right">                           
                                 <tr>
                                   <td>                          
                                    <c:set var="title0"><axis:alt f="${fname}" c="TITULO100" lit="100883"/></c:set>     <!--Fecha Efecto-->
                                    <c:set var="title1"><axis:alt f="${fname}" c="TITULO101" lit="100885"/></c:set>     <!--Fecha vencimiento-->
                                    <c:set var="title2"><axis:alt f="${fname}" c="TITULO102" lit="9901245"/></c:set>    <!--Cuota-->
                                    <c:set var="title3"><axis:alt f="${fname}" c="TITULO103" lit="9901246"/></c:set>    <!--Amortización-->
                                    <c:set var="title4"><axis:alt f="${fname}" c="TITULO104" lit="9901247"/></c:set>    <!--Interés-->
                                    <c:set var="title5"><axis:alt f="${fname}" c="TITULO105" lit="9901248"/></c:set>    <!--Capital pendiente-->
                                    <div class="seccion displayspaceGrande">
                                                                          
                                        <display:table style="width:98%;"  name="${OB_IAX_RIESGOS.PRESTAMO[__formdata.NCONTADOR].OB_IAX_PRESTAMOSEG.CUADRO}" id="LISTACUADROS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" requestURI="axis_${pantalla}.do?operation=form&paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                        <%@ include file="../include/displaytag.jsp"%>                                   
                                        <axis:visible c="FEFECTO" f="${pantalla}">
                                            <display:column title="${title0}" sortable="true" style="width:16%" sortProperty="FEFECTO" headerClass="headwidth15 sortable fixed"  media="html" autolink="false">
                                                <div class="dspText"><fmt:formatDate value="${LISTACUADROS.OB_IAX_PRESTCUADROSEG.FEFECTO}" pattern="dd/MM/yyyy"/></div>                                        
                                            </display:column>
                                        </axis:visible>    
                                        <axis:visible c="FVENCIM" f="${pantalla}">
                                            <display:column title="${title1}" sortable="true" style="width:16%" sortProperty="FVENCIM" headerClass="headwidth15 sortable fixed"  media="html" autolink="false">                                        
                                                <div class="dspText"><fmt:formatDate value="${LISTACUADROS.OB_IAX_PRESTCUADROSEG.FVENCIM}" pattern="dd/MM/yyyy"/></div>                                        
                                            </display:column>                        
                                        </axis:visible>
                                        <axis:visible c="ICUOTA" f="${pantalla}">
                                            <display:column title="${title2}" sortable="true" style="width:16%" sortProperty="ICUOTA" headerClass="headwidth15 sortable fixed"  media="html" autolink="false" >
                                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${LISTACUADROS.OB_IAX_PRESTCUADROSEG.ICUOTA}"/></div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible c="ICAPITAL" f="${pantalla}">                                        
                                            <display:column title="${title3}" sortable="true" style="width:16%" sortProperty="ICAPITAL" headerClass="headwidth15 sortable fixed"  media="html" autolink="false" >
                                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${LISTACUADROS.OB_IAX_PRESTCUADROSEG.ICAPITAL}"/></div>                                        
                                            </display:column>                                                                
                                        </axis:visible>
                                        <axis:visible f="${pantalla}" c="ICAPPEND">
                                            <display:column title="${title5}" sortable="true" style="width:16%" sortProperty="ICAPPEND" headerClass="headwidth15 sortable fixed"  media="html" autolink="false" >
                                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${LISTACUADROS.OB_IAX_PRESTCUADROSEG.ICAPPEND}"/></div>                                            
                                            </display:column>                            
                                        </axis:visible>
                                        <axis:visible c="IINTERES" f="${pantalla}">
                                            <display:column title="${title4}" sortable="true" style="width:16%" sortProperty="IINTERES"  headerClass="headwidth15 sortable fixed"  media="html" autolink="false" >
                                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${LISTACUADROS.OB_IAX_PRESTCUADROSEG.IINTERES}"/></div>                                                                                    
                                            </display:column>                        
                                        </axis:visible>
                                        </display:table>
                                        <c:choose>
                                        <c:when test="${!empty LISTACUADROS}">
                                            <c:if test="${ !(fn:containsIgnoreCase(header['User-Agent'],'ipad') ) }">
                                                <script language="javascript">objUtiles.retocarDsptagtable("LISTACUADROS");</script>
                                            </c:if>
                                        </c:when>
                                        <c:otherwise>
                                            <script language="javascript">
                                               objLista.esconderListaSpans();
                                               //objLista.esconderListaLinks();     
                                            </script>
                                        </c:otherwise>
                                        </c:choose>
                                    </div>
                                   </td>
                                   </tr>
                                  </table> 
                                                
                                </td>
                            </tr>
                        </axis:ocultar>
                            <!--fin nova --subseccio-->
                    </table>
                </td>
            </tr>
        </c:if>
    </axis:visible>
    
    <axis:visible c="DSP_CUAD_AMORPREST" f="${pantalla}">
    <c:if test="${!empty T_IAX_PRESTCUADROSEG}">
    
    <tr>
    <td class="campocaja" >
    
        <div style="float:left;">
            <img id="DSP_CUAD_AMORPREST_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_CUAD_AMORPREST', this)" style="cursor:pointer"/> 
            <b><axis:alt f="${pantalla}" c="DSP_CUAD_AMOR" lit="9002050"></axis:alt></b>
        </div>
        
        <axis:visible f="${pantalla}" c="LAPIZ1" >
        <div style="float:right;" id="DATOS_PRESTAMO" c="LAPIZ1"></div>
        </axis:visible>
        
        <div style="clear:both;">
            <hr class="titulo">
        </div>
        
    </td>
    </tr>
    
    <tr id="DSP_CUAD_AMORPREST_children" style="display:none">
    <td class="campocaja">    
        <table>
        <tr>
            <th style="width:100%;height:0px"></th>
        </tr>
        <tr>
        <td class="campocaja">            
            <table>                           
                <tr>
                <td>
                <div class="displayspace" align="center">
                
                <c:set var="title0"><axis:alt f="${fname}" c="TITULO100" lit="100883"/></c:set>     <!--Fecha Efecto-->
                <c:set var="title1"><axis:alt f="${fname}" c="TITULO101" lit="100885"/></c:set>     <!--Fecha vencimiento-->
                <c:set var="title2"><axis:alt f="${fname}" c="TITULO102" lit="9901245"/></c:set>    <!--Cuota-->
                <c:set var="title3"><axis:alt f="${fname}" c="TITULO103" lit="9901246"/></c:set>    <!--Amortización-->
                <c:set var="title4"><axis:alt f="${fname}" c="TITULO104" lit="9901247"/></c:set>    <!--Interés-->
                <c:set var="title5"><axis:alt f="${fname}" c="TITULO105" lit="9901248"/></c:set>    <!--Capital pendiente-->                
                               
                <display:table  name="${T_IAX_PRESTCUADROSEG}"
                                id="CUADROAMORPREST"
                                export="false"
                                class="dsptgtable"
                                pagesize="-1"
                                defaultsort="1"
                                defaultorder="ascending"
                                requestURI="axis_${pantalla}.do?operation=form&paginar=true" 
                                sort="list" cellpadding="0" cellspacing="0">
                                
                <%@ include file="../include/displaytag.jsp"%>
                
                <axis:visible c="FEFECTOCAP" f="${pantalla}">
                    <display:column title="${title0}" sortable="true" style="width:16%" sortProperty="FEFECTO" headerClass="headwidth15 sortable fixed"  media="html" autolink="false">
                    <div class="dspText">
                        <fmt:formatDate value="${CUADROAMORPREST.OB_IAX_PRESTCUADROSEG.FEFECTO}" pattern="dd/MM/yyyy"/>
                    </div>
                    </display:column>
                </axis:visible> 
                
                <axis:visible c="FVENCIMCAP" f="${pantalla}">
                    <display:column title="${title1}" sortable="true" style="width:16%" sortProperty="FVENCIM" headerClass="headwidth15 sortable fixed"  media="html" autolink="false">                                        
                    <div class="dspText">
                        <fmt:formatDate value="${CUADROAMORPREST.OB_IAX_PRESTCUADROSEG.FVENCIM}" pattern="dd/MM/yyyy"/>
                    </div>
                    </display:column>                        
                </axis:visible>
                
                <axis:visible c="ICUOTACAP" f="${pantalla}">
                    <display:column title="${title2}" sortable="true" style="width:16%" sortProperty="ICUOTA" headerClass="headwidth15 sortable fixed"  media="html" autolink="false">
                    <div class="dspNumber">
                        <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${CUADROAMORPREST.OB_IAX_PRESTCUADROSEG.ICUOTA}"/>
                    </div>
                    </display:column>
                </axis:visible>
                
                <axis:visible c="ICAPITALCAP" f="${pantalla}">                                        
                    <display:column title="${title3}" sortable="true" style="width:16%" sortProperty="ICAPITAL" headerClass="headwidth15 sortable fixed"  media="html" autolink="false" >
                    <div class="dspNumber">
                        <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${CUADROAMORPREST.OB_IAX_PRESTCUADROSEG.ICAPITAL}"/>
                    </div>                                        
                    </display:column>                                                                
                </axis:visible>
                
                <axis:visible c="ICAPPENDCAP" f="${pantalla}">
                    <display:column title="${title5}" sortable="true" style="width:16%" sortProperty="ICAPPEND" headerClass="headwidth15 sortable fixed"  media="html" autolink="false" >
                    <div class="dspNumber">
                        <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${CUADROAMORPREST.OB_IAX_PRESTCUADROSEG.ICAPPEND}"/>
                    </div>
                    </display:column>
                </axis:visible>
                
                <axis:visible c="IINTERESCAP" f="${pantalla}">
                    <display:column title="${title4}" sortable="true" style="width:20%" sortProperty="IINTERES"  headerClass="headwidth15 sortable fixed"  media="html" autolink="false" >
                    <div class="dspNumber">
                        <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${CUADROAMORPREST.OB_IAX_PRESTCUADROSEG.IINTERES}"/>
                    </div>
                    </display:column>                  
                </axis:visible>
                
                </display:table>
                
                </div>
                </td>
                </tr>
            </table> 
        
        </td>
        </tr>
        </table>    
    </td>
    </tr>
    
    </c:if>
    </axis:visible>
