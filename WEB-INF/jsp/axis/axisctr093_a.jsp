<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

                <tr>
                    <td>
                        <div class="titulo">
                            <img src="images/flecha.gif"/>
                                <c:if test="${!empty datos_poliza.TPRODUC}">&nbsp;${datos_poliza.TPRODUC}</c:if><c:if test="${!empty datos_poliza.NPOLIZA}">&nbsp;-&nbsp;${datos_poliza.NPOLIZA}</c:if><c:if test="${!empty datos_poliza.NCERTIF}">-${datos_poliza.NCERTIF}</c:if><c:if test="${!empty datos_poliza.CRETENI && datos_poliza.CRETENI != 0 && !empty tmotret}">&nbsp;-&nbsp;<axis:alt f="axisctr093" c="MOTRETEN" lit="152427" />&nbsp;${tmotret}&nbsp;&nbsp;</c:if> <c:if test="${ADMITECERTIFICADOS == '1'}">- <axis:alt f="axisctr093" c="COLEC" lit="9001021"/>: ${NAMETOMADORCERO}</c:if>
                           <axis:visible c="CONSULTA_TRAS" f="axisctr093"> <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisctr092()" style="cursor:pointer"/></axis:visible>
                        </div>
                       
                        <!--campos--><!--f_cargar_propiedades_pantalla(); -->
                        <table class="seccion">
                            <tr>
                                <td align="left">
                                 <div class="separador">&nbsp;</div>
                                    <table class="area" align="center">
                                         <tr>
                                            <th style="height:0px"></th>
                                        </tr>
                                    <c:if test="${! empty datos_poliza}">
                                        <tr>
                                            <td class="campocaja" >
                                                <div style="float:left;">
                                                    <img id="DSP_DATOS_POLIZA_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_DATOS_POLIZA', this)" style="cursor:pointer"/> 
                                                <b><axis:alt f="axisctr093" c="DATOS_POLIZA" lit="104925" /></b>&nbsp;&nbsp;${datos_poliza.NPOLIZA}<c:if test="${datos_poliza.NCERTIF!=null}" >&nbsp;-&nbsp;${datos_poliza.NCERTIF}</c:if><c:if test="${datos_poliza.TSITUAC!=null}" >&nbsp;-&nbsp;${datos_poliza.TSITUAC}</c:if><c:if test="${datos_poliza.TRETENI!=null}" >&nbsp;-&nbsp;${datos_poliza.TRETENI}</c:if><c:if test="${!empty datos_poliza.TINCIDE}">&nbsp;-&nbsp;${datos_poliza.TINCIDE}</c:if><c:if test="${datos_poliza.FEFECTO!=null}">&nbsp;-&nbsp;<axis:alt f="axisctr093" c="FEFECTO" lit="100883" />&nbsp;<fmt:formatDate value="${datos_poliza.FEFECTO}" pattern="dd/MM/yyyy"/></c:if><c:if test="${datos_poliza.FVENCIM!=null}">&nbsp;-&nbsp;<axis:alt f="axisctr093" c="FVENCIM" lit="100885" />&nbsp;<fmt:formatDate value="${datos_poliza.FVENCIM}" pattern="dd/MM/yyyy"/></c:if>
                                                </div>
                                                <div style="clear:both;">
                                                    <hr class="titulo">
                                                </div>
                                            </td>
                                        </tr>
                                        <!--  INICIO SECCION CAMPOS **********************************************************  -->
                                        <tr id="DSP_DATOS_POLIZA_children" style="display:none">
                                            <td align="left" >
                                                 <table class="area" align="center">
                                                     <tr>
                                                        <th style="width:15%;height:0px"></th>
                                                        <th style="width:5%;height:0px"></th>
                                                        <th style="width:20%;height:0px"></th>
                                                        <th style="width:20%;height:0px"></th>
                                                        <th style="width:20%;height:0px"></th>
                                                        <th style="width:20%;height:0px"></th>
                                                    </tr>
                                                    <!-- DATOS POLIZA -->
                                                    <tr>
                                                        <!-- Numero de poliza -->
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="axisctr093" c="NPOLIZA" lit="100624" /></b>
                                                        </td>
                                                        <axis:ocultar f="axisctr093" c="NCERTIF_READ">
                                                        <!-- Numero de CERTIF -->
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="axisctr093" c="NCERTIF" lit="101236" /></b>
                                                        </td>
                                                        </axis:ocultar>
                                                        
                                                        <!-- Situacion -->
                                                         <td class="titulocaja">
                                                            <b><axis:alt f="axisctr093" c="SITUAC" lit="100874" /></b>
                                                        </td>
                                                         <c:if test="${!empty datos_poliza.TRETENI}">
                                                             <!-- Estado -->
                                                             <td class="titulocaja">
                                                                <b><axis:alt f="axisctr093" c="TRETEN" lit="100587" /></b>
                                                            </td>
                                                        </c:if>
                                                        <td class="titulocaja" colspan="2">
                                                            <b><axis:alt f="axisctr093" c="PRODUC" lit="100829" /></b>
                                                        </td>
                                                       
                                                    </tr>
                                                    <tr>
                                                        <!-- Numero de poliza -->
                                                        <td class="campocaja">
                                                            <input type="text" class="campo campotexto" id="NPOLIZA_READ" name="NPOLIZA_READ" size="15" style="width:90%"
                                                            value="${datos_poliza.NPOLIZA}" readonly="true" />
                                                        </td>    
                                                         <axis:ocultar f="axisctr093" c="NCERTIF">
                                                        <td class="campocaja">
                                                           
                                                                    <!-- Numero de certificado -->
                                                                    <input type="text" class="campo campotexto" id="NCERTIF_READ" name="NCERTIF_READ" size="3" style="width:90%"
                                                                    value="${datos_poliza.NCERTIF}" readonly="true" />
                                                            
                                                        </td>
                                                        </axis:ocultar>
                                                        
                                                        <!-- Situacion -->
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="TSITUAC" name="TSITUAC" size="15"
                                                            value="${datos_poliza.TSITUAC}" readonly="true" />
                                                        </td>
                                                         <c:if test="${!empty datos_poliza.TRETENI}">
                                                             <!-- Estado -->
                                                             <td class="campocaja">
                                                                <input type="text" class="campowidthinput campo campotexto" id="TRETENI" name="TRETENI" size="15"
                                                                value="${datos_poliza.TRETENI}" readonly="true" />
                                                            </td>
                                                        </c:if>
                                                         <!-- producto -->
                                                        <td class="campocaja" colspan="2">
                                                            <input type="text" style="width:95%" class="campowidthinput campo campotexto" id="TPRODUC" name="TPRODUC" size="15"
                                                            value="${datos_poliza.TPRODUC}" readonly="true" />
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                         <!-- Fecha efecto -->
                                                        <td class="titulocaja" colspan="2">
                                                            <b><axis:alt f="axisctr093" c="FEFECTO" lit="100883" /></b>
                                                        </td>                                                    
                                                       
                                                        <!-- TDuraci -->
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="axisctr093" c="TDURACI" lit="1000120" /></b>
                                                        </td>
                                                        <axis:visible c="NDURCOB" f="axisctr093">
                                                        <!-- NDURCOB -->
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="axisctr093" c="NDURCOB" lit="9000814" /></b>
                                                        </td>  
                                                        </axis:visible>
                                                        <axis:ocultar f="axisctr093" c="FVENCIM" dejarHueco="false">
                                                        <!-- Fecha vencimiento -->
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="axisctr093" c="FVENCIM" lit="100885" /></b>
                                                        </td>     
                                                        </axis:ocultar>
                                                       
                                                    </tr>
                                                    <tr>
                                                        <!-- Fefecto -->
                                                        <td class="campocaja" colspan="2">
                                                            <input type="text" class="campowidthinput campo campotexto" id="FEFECTOPOL" name="FEFECTOPOL" size="15"
                                                            value="<fmt:formatDate value="${datos_poliza.FEFECTO}" pattern="dd/MM/yyyy" />" readonly="true" />
                                                        </td>
                                                        <!-- TDuraci -->
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="TDURACI" name="TDURACI" size="15"
                                                            value="${datos_poliza.TDURACI}" readonly="true" />
                                                        </td>
                                                        <axis:visible c="NDURCOB" f="axisctr093">
                                                        <!-- NDURCOB -->
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="NDURCOB" name="NDURCOB" size="15" style="width:30%;"
                                                            value="${datos_poliza.NDURCOB}" readonly="true" />
                                                        </td>                                    
                                                        </axis:visible>
                                                        <axis:ocultar f="axisctr093" c="FVENCIM" dejarHueco="false">
                                                        <!-- Fecha vencimiento -->
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="FVENCIM" name="FVENCIM" size="10" style="width:30%
                                                            value="<fmt:formatDate value="${datos_poliza.FVENCIM}" pattern="dd/MM/yyyy" />" readonly="true" />
                                                        </td>  
                                                        </axis:ocultar>
                                                        

                                                    </tr>
                                                       <tr> 
                                                       	 <axis:visible f="axisctr093" c="POLISSA_INI">
                                                        <td class="titulocaja" colspan="2">
                                                            <b><axis:alt f="axisctr093" c="POLINI" lit="1000017" /></b>
                                                        </td>
                                                         </axis:visible>
                                                             <axis:ocultar f="axisctr093" c="CAGENTE" dejarHueco="false">
                                                             
                                                         <!-- Agente -->
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="axisctr093" c="CAGENTE" lit="100584" /></b>
                                                        </td>
                                                        </axis:ocultar>
                                                        </tr>
                                                    <tr>
                                                    <axis:visible f="axisctr093" c="POLISSA_INI">
                                                        <td class="campocaja" colspan="2">
                                                            <input readonly="true" type="text" class="campowidthinput campo campotexto" id="polissa_ini" name="polissa_ini" 
                                                            title="<axis:alt f="axisctr093" c="POLINI" lit="1000017"/>" size="15" value ="${datos_poliza.POLISSA_INI}"/>&nbsp;
                                                    <axis:ocultar f="axisctr093" c="CAGENTE" dejarHueco="false">
                                                        <!-- AGENTE -->
                                                         <td class="campocaja" colspan="2">
                                                            <input type="text" class="campowidthinput campo campotexto" id="CAGENTE" name="CAGENTE" style="width:30%"
                                                            value="${datos_poliza.CAGENTE}" readonly="true" />
                                                         <input type="text" class="campowidthinput campo campotexto" id="TAGENTE" name="TAGENTE" size="15" style="width:60%"
                                                            value="${datos_poliza.axisctr093_agente.NOMBRE}" readonly="true" />
                                                         </td>
                                                         </axis:ocultar>
                                                        </td>
                                                    </axis:visible>
                                                        
                                                          
                                                            <td class="campocaja" colspan="2" style="color:red;">
                                                            <b>${datos_poliza.TINCIDE}</b>
                                                        </td> 
                                                    </tr>
                                                </table>        
                                            </td> 
                                        </tr>       
                                    </c:if>
                                   
                                    <c:if test="${!empty tomadores && fn:length(tomadores)>0}">
                                        <tr>
                                            <td class="campocaja" >
                                                <img  id="DSP_TOMADOR_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_TOMADOR', this)" style="cursor:pointer"/> 
                                                 <b><axis:alt f="axisctr093" c="TOMADOR" lit="1000380" /></b>&nbsp;&nbsp;<c:if test="${tomadores[0].OB_IAX_TOMADORES.TTIPIDE!=null}" >${tomadores[0].OB_IAX_TOMADORES.TTIPIDE}&nbsp;-&nbsp;</c:if>${tomadores[0].OB_IAX_TOMADORES.NNUMIDE} - ${datos_poliza.TNOMTOM}
                                                <hr class="titulo">
                                            </td>
                                        </tr>
                                        <tr id="DSP_TOMADOR_children" style="display:none">
                                            <td align="left" >
                                                <div class="displayspace">
                                                     <c:set var="title0"><axis:alt f="axisctr093" c="TIPODOC" lit="109774" /></c:set>
                                                     <c:set var="title1"><axis:alt f="axisctr093" c="DOCUMEN" lit="105330" /></c:set>
                                                     <c:set var="title2"><axis:alt f="axisctr093" c="NOMBRE" lit="105940" /></c:set>                               
                                                     <c:set var="title3"><axis:alt f="axisctr093" c="SEXE" lit="100962" /></c:set>
                                                     <c:set var="title4"><axis:alt f="axisctr093" c="DNACIMI" lit="1000064" /></c:set>
                                                     <c:set var="title5"><axis:alt f="axisctr093" c="DOMICI" lit="101078" /></c:set>
                                                     <display:table name="${tomadores}" id="tomadores" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                     requestURI="axis_axisctr093.do?paginar=true&tabla=tomador"> 
                                                       <%@ include file="../include/displaytag.jsp"%>
                                                       <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_TOMADORES.TTIPIDE" headerClass="sortable"  style="width:11%" media="html" autolink="false" >
                                                           <div class="dspText">${tomadores.OB_IAX_TOMADORES.TTIPIDE}</div>
                                                       </display:column>
                                                       <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_TOMADORES.NNUMIDE" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                           <div class="dspText">${tomadores.OB_IAX_TOMADORES.NNUMIDE}</div>
                                                       </display:column>
                                                        <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_TOMADORES.TNOMBRE" headerClass="sortable" style="width:23%" media="html" autolink="false" >
                                                           <div class="dspText">${tomadores.OB_IAX_TOMADORES.TAPELLI1} ${tomadores.OB_IAX_TOMADORES.TAPELLI2}, ${tomadores.OB_IAX_TOMADORES.TNOMBRE}</div>
                                                       </display:column>
                                                        <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_TOMADORES.TSEXPER" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                           <div class="dspText">${tomadores.OB_IAX_TOMADORES.TSEXPER}</div>
                                                       </display:column>                                   
                                                        <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_TOMADORES.FNACIMI" headerClass="sortable" style="width:20%" media="html" autolink="false" >
                                                           <div class="dspText"><fmt:formatDate value='${tomadores.OB_IAX_TOMADORES.FNACIMI}' pattern='dd/MM/yyyy'/></div>
                                                       </display:column>                                                                      
                                                       <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_TOMADORES.DIRECCIONES[0].OB_IAX_DIRECCIONES.TDOMICI" headerClass="sortable" style="width:33%" media="html" autolink="false" >
                                                           <div class="dspText">${tomadores.OB_IAX_TOMADORES.DIRECCIONES[0].OB_IAX_DIRECCIONES.TDOMICI}</div>
                                                       </display:column>                                                                      
                                                    </display:table>
                                                </div>
                                            </td> 
                                        </tr>
                                    </c:if>
                                    

<c:if test="${!empty T_IAX_GESTRIESGOS}">
    <tr>
        <td class="campocaja">
            <div style="float:left;">
                    <img id="DSP_RIESGOS_parent" src="images/mes.gif" 
		    	onclick="objEstilos.toggleDisplay('DSP_RIESGOS', this)" 
			style="cursor:pointer"/> 
                    <b><axis:alt f="axisctr020" c="DSP_RIESGOS" lit="102500"></axis:alt></b>
                    </div>
                    <div style="clear:both;">
                        <hr class="titulo">
                    </div>                      
                </td>
            </tr>
            <tr id="DSP_RIESGOS_children" style="display:none">
                <td class="campocaja" > 
                    <div class="displayspace">
		    <c:set var="title0"><axis:alt f="axisctr093" c="NUM" lit="800440" /></c:set>
		    <c:set var="title1"><axis:alt f="axisctr020" c="TRIESGO" lit="102500"></axis:alt></c:set>                               
		    <c:set var="title2"><axis:alt f="axisctr093" c="PTOTAL" lit="140531" /></c:set>
		    <c:set var="title3"><axis:alt f="axisctr093" c="DETALL" lit="1000113" /></c:set>
                    <display:table name="${T_IAX_GESTRIESGOS}" 
		    id="T_IAX_GESTRIESGOS" export="false" 
		    class="dsptgtable" pagesize="-1" defaultsort="1" 
		    defaultorder="ascending" sort="list" 
		    cellpadding="0" cellspacing="0"
		    requestURI="axis_axisctr093.do?paginar=true"> 
		    <!-- Esta no necesitamos desplegarla al volver de ordenar - siempre está desplegada -->
                           <%@ include file="../include/displaytag.jsp"%>
                          <%-- <display:column title="" sortable="false" sortProperty="" 
			   headerClass="headwidth5 sortable"  
			   media="html" autolink="false" >
			   <div class="dspIcons">
			   <input  <c:if test="${OB_IAX_RIESGOS.NRIESGO == T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO || T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO == __formdata.NRIESGO}">checked</c:if> 
			   onClick="javascript:f_getRiesgo('${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO}')" 
                           value="${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO}" 
			   type="radio" id="radioNRIESGO" 
			   name="radioNRIESGO"/>
			   </div>
                           </display:column>--%>
                           <display:column title="${title0}" sortable="true" 
			   sortProperty="NRIESGO" 
			   headerClass="headwidth5 sortable"  
			   media="html" autolink="false" >
			   <div class="dspText">
			   ${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO}
			   </div>
                           </display:column>
                           <display:column title="${title1}" sortable="true" 
			   sortProperty="TRIESGO" 
			   headerClass="sortable"  media="html" 
			   autolink="false" >
			   <div class="dspText">
			   ${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.TRIESGO}
			   </div>
                           </display:column>
                            <axis:visible f="axisctr020" c="RIE_PRIMATOTAL">
                           <display:column title="${title2}" sortable="true" 
			   sortProperty="PRIMATOTAL" 
			   headerClass="headwidth10 sortable"  
			   media="html" autolink="false" >
			   <div class="dspNumber">
			   <fmt:formatNumber pattern="###,##0.00" 
			   value="${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.PRIMATOTAL}"/>
			   </div>
                           </display:column>
                           </axis:visible>
			<%--   <display:column title="${title3}"
			   headerClass="headwidth5 sortable"
			   media="html" autolink="false">
			   <c:choose>
			   <c:when test="${datos_poliza.COBJASE==1}">
			   <div class="dspIcons">
                                    <img border="0"
                                         alt='<axis:alt f="axisctr093" c="LIT_1000195" lit="1000195"/>'
                                         title='<axis:alt f="axisctr093" c="LIT_1000195" lit="1000195"/>'
                                         src="images/mas.gif" width="11px"
                                         height="11px"
                                         style="vertical-align:middle;cursor:pointer;"
                                         onclick="f_abrir_axisctr029('${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO}')"/>
                                </div>
                            </c:when>
                            <c:when test="${datos_poliza.COBJASE==2}">
                                <div class="dspIcons">
                                    <img border="0"
                                         alt='<axis:alt f="axisctr093" c="LIT_1000195" lit="1000195"/>'
                                         title='<axis:alt f="axisctr093" c="LIT_1000195" lit="1000195"/>'
                                         src="images/mas.gif" width="11px"
                                         height="11px"
                                         style="vertical-align:middle;cursor:pointer;"
                                         onclick="f_abrir_modal('axisctr042', false, '&NRIESGO=' + ${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO});"/>
                                </div>
                            </c:when>
                            <c:when test="${datos_poliza.COBJASE==3}">
                                <div class="dspIcons">
                                    <img border="0"
                                         alt='<axis:alt f="axisctr093" c="LIT_1000195" lit="1000195"/>'
                                         title='<axis:alt f="axisctr093" c="LIT_1000195" lit="1000195"/>'
                                         src="images/mas.gif" width="11px"
                                         height="11px"
                                         style="vertical-align:middle;cursor:pointer;"
                                         onclick="f_abrir_modal('axisctr043', false, '&NRIESGO=' + ${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO});"/>
                                </div>
                            </c:when>
                            <c:when test="${datos_poliza.COBJASE==4}">
                                <div class="dspIcons">
                                    <img border="0"
                                         alt='<axis:alt f="axisctr093" c="LIT_1000195" lit="1000195"/>'
                                         title='<axis:alt f="axisctr093" c="LIT_1000195" lit="1000195"/>'
                                         src="images/mas.gif" width="11px"
                                         height="11px"
                                         style="vertical-align:middle;cursor:pointer;"
                                         onclick="f_abrir_modal('axisctr043', false, '&NRIESGO=' + ${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO});"/>
                                </div>
                            </c:when>
                            <c:when test="${datos_poliza.COBJASE==5}">
                                <div class="dspIcons">
                                    <img border="0"
                                         alt='<axis:alt f="axisctr093" c="LIT_1000195" lit="1000195"/>'
                                         title='<axis:alt f="axisctr093" c="LIT_1000195" lit="1000195"/>'
                                         src="images/mas.gif" width="11px"
                                         height="11px"
                                         style="vertical-align:middle;cursor:pointer;"
                                         onclick="f_abrir_axisctrautos('${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO}')"/>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="dspIcons">
                                    <img border="0"
                                         alt='<axis:alt f="axisctr093" c="LIT_1000195" lit="1000195"/>'
                                         title='<axis:alt f="axisctr093" c="LIT_1000195" lit="1000195"/>'
                                         src="images/mas.gif" width="11px"
                                         height="11px"
                                         style="vertical-align:middle;cursor:pointer;"
                                         onclick="f_abrir_axisctr029('${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO}')"/>
                                         
                                </div>
                        </c:otherwise>
                    </c:choose>
                    </display:column>--%>
                        </display:table>
                    </div>
                    </td>
                    </tr>
                    </c:if>

<%--               
<c:if test="${__formdata.CAGRPRO == 11}">
    <tr>
        <td class="campocaja">
            <div style="float:left;">
                    <img id="DSP_PLAPEN_parent" src="images/mes.gif" 
		    	onclick="objEstilos.toggleDisplay('DSP_PLAPEN', this)" 
			style="cursor:pointer"/> 
                    <b><axis:alt f="axisctr020" c="DSP_PLAPEN" lit="9900775"></axis:alt></b>
                    </div>
                    <div style="clear:both;">
                        <hr class="titulo">
                    </div>                      
                </td>
            </tr>
            <tr id="DSP_PLAPEN_children" style="display:none">
                         <td align="left" >
                            <table class="area" align="center">
                             <tr>
                                <axis:ocultar f="axisctr093" c="PLAN" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr093" c="DSP_PLAPEN" lit="9900775" /></b>
                                </td>
                                </axis:ocultar>
                           </tr>
                            <tr>
                                <td class="campocaja" colspan="4">
                                <axis:ocultar f="axisctr093" c="PLAN" dejarHueco="false">
                                    <input type="text" class="campo campotexto" id="CCODPLA" name="CCODPLA"
                                    <axis:atr f="axisctr093" c="CCODPLA" a="modificable=false"/> size="15" style="width:10%"
                                    value="${__formdata.CCODPLA}" />
                                    <input type="text" class="campo campotexto" id="TCODPLA" name="TCODPLA"
                                    <axis:atr f="axisctr093" c="TCODPLA" a="modificable=false"/> size="15" style="width:80%"
                                    value="${__formdata.TCODPLA}" />
                                  </axis:ocultar>
                                </td>
                            </tr>  
                             <tr>
                                <axis:ocultar f="axisctr093" c="FONDO" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr093" c="FONDO" lit="9900776" /></b>
                                </td>
                                </axis:ocultar>
                           </tr>
                             <tr>
                                <td class="campocaja" colspan="4">
                                <axis:ocultar f="axisctr093" c="FONDO" dejarHueco="false">
                                    <input type="text" class="campo campotexto" id="CCODFON" name="CCODFON"
                                    <axis:atr f="axisctr093" c="CCODFON" a="modificable=false"/> size="15" style="width:10%"
                                    value="${__formdata.CCODFON}" />
                                    <input type="text" class="campo campotexto" id="TCODFON" name="TCODFON"
                                    <axis:atr f="axisctr093" c="TCODFON" a="modificable=false"/> size="15" style="width:80%"
                                    value="${__formdata.TCODFON}" />
                                    
                                 </axis:ocultar>
                                </td>
                            </tr>   
                            <tr>
                                <axis:ocultar f="axisctr093" c="GESTORAS" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr093" c="GESTORAS" lit="9900778" /></b>
                                </td>
                                </axis:ocultar>
                           </tr>
                             <tr>
                                <td class="campocaja" colspan="4">
                                <axis:ocultar f="axisctr093" c="GESTORAS" dejarHueco="false">
                                    <input type="text" class="campo campotexto" id="CCODGES" name="CCODGES"
                                    <axis:atr f="axisctr093" c="CCODGES" a="modificable=false"/> size="15" style="width:10%"
                                    value="${__formdata.CCODGES}" />
                                    <input type="text" class="campo campotexto" id="TCODGES" name="TCODGES"
                                    <axis:atr f="axisctr093" c="TCODGES" a="modificable=false"/> size="15" style="width:80%"
                                    value="${__formdata.TCODGES}" />
                                    
                                 </axis:ocultar>
                                </td>
                            </tr> 
                        </table>
                    </td>
                    </tr>
                    </c:if>                                    
--%>

                                    
<c:if test="${ !empty OB_IAX_RIESGOS.OB_IAX_DATOSECONOMICOS}">
                <tr>
                    <td class="campocaja" >
                        <img id="DSP_CTASEGURO_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_CTASEGURO', this)" style="cursor:pointer"/>
                          <b><axis:alt f="axisctr020" c="DSP_APORTACIONES" lit="1000593"></axis:alt></b>
                            <%--<b><axis:alt f="axisctr093" c="LIT_1000593" lit="1000593" /></b>&nbsp;&nbsp; --%>
                            <hr class="titulo">
                    </td>
                </tr>
                <tr id="DSP_CTASEGURO_children" style="display:none">

                    <td class="campocaja" >
                   <axis:ocultar f="axisctr020" c="DSP_DATOSECON" dejarHueco="false">
                         <table class="area" align="center">
                             <tr>
                                <td class="campocaja" >
                                    <img id="DSP_DTAECO_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_DTAECO', this)" style="cursor:pointer"/>
                                        <b><axis:alt f="axisctr093" c="DTAECO" lit="1000097" /></b>&nbsp;&nbsp;
                                        <hr class="titulo">
                                </td>
                            </tr>

                            <tr id="DSP_DTAECO_children" style="display:none">
                                <td class="campocaja" >
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:33.33%;height:0px">
                                        &nbsp;
                                    </th>
                                            <th style="width:33.33%;height:0px">
                                        &nbsp;
                                    </th>
                                            <th style="width:33.33%;height:0px">
                                        &nbsp;
                                    </th>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja">
                                                                <b><axis:alt f="axisctr093" c="APORTMIN" lit="1000588" /></b>
                                            </td>
                                            <td class="titulocaja">
                                                                <b><axis:alt f="axisctr093" c="APORTPER" lit="1000589" /></b>
                                            </td>
                                            <td class="titulocaja">
                                                                <b><axis:alt f="axisctr093" c="PRIMACT" lit="1000516" /></b>
                                            </td>

                                        </tr>
                                        <tr>
                                            <!-- Aport. / Prima perióde -->
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="ImpPrimaPer" name="ImpPrimaPer" size="15"
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${OB_IAX_RIESGOS.OB_IAX_DATOSECONOMICOS.IMPPRIMAPER}'/>" readonly="true"/>
                                            </td>
                                            <!-- Aport./Prima ejercicio -->
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="ImpPrimaInicial" name="IMPPRIMAINICIAL" size="15"
                                                formato="decimal"  size="15" value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${OB_IAX_RIESGOS.OB_IAX_DATOSECONOMICOS.IMPPRIMAINICIAL}'/>" readonly="true"/>

                                            </td>
                                            <!-- Prima Actual -->
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="ImpPrimaActual" name="ImpPrimaActual" size="15"
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${OB_IAX_RIESGOS.OB_IAX_DATOSECONOMICOS.IMPPRIMAACTUAL}'/>" readonly="true"/>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td class="titulocaja">
                                                                <b><axis:alt f="axisctr093" c="APORTACUM" lit="1000513" /></b>
                                            </td>
                                            <td class="titulocaja">
                                                                <b><axis:alt f="axisctr093" c="APORTMAX" lit="1000515" /></b>
                                            </td>
                                            <td class="titulocaja">
                                                                <b><axis:alt f="axisctr093" c="APORTPEND" lit="1000517" /></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <!-- Aportaciones Acum. -->
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="ImpAportAcum" name="ImpAportAcum" size="15"
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${OB_IAX_RIESGOS.OB_IAX_DATOSECONOMICOS.IMPAPORTACUM}'/>" readonly="true"/>
                                            </td>
                                            <!-- Aportación Máxima -->
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="ImpPrimaInicial" name="ImpAportMax" size="15"
                                                formato="decimal"  size="15" value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${OB_IAX_RIESGOS.OB_IAX_DATOSECONOMICOS.IMPAPORTMAX}'/>" readonly="true"/>
                                            </td>
                                            <!-- Aportaciones Pend. -->
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="ImpPrimaActual" name="ImpAportPend" size="15"
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${OB_IAX_RIESGOS.OB_IAX_DATOSECONOMICOS.IMPAPORTPEND}'/>" readonly="true"/>
                                            </td>
                                        </tr>

                                </td>
                            </tr>
                        </table>
                        </axis:ocultar>
                    </td>
                </tr>

                        <table class="area" align="center">
                         <tr>
                            <td class="campocaja" >
                                <img id="DSP_PROVISIONES_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_PROVISIONES', this)" style="cursor:pointer"/>
                                    <b><axis:alt f="axisctr020" c="DSP_PROVISIONES" lit="102656"></axis:alt></b>
                                   <%-- <b><axis:alt f="axisctr093" c="LIT_102656" lit="102656" /></b>&nbsp;&nbsp; --%>
                                    <hr class="titulo">
                            </td>
                        </tr>
                        <tr id="DSP_PROVISIONES_children" style="display:none">
                        <td class="campocaja" >
                        <table class="area" align="center">
                                        <tr>
                                            <th style="width:33.33%;height:0px">
                            &nbsp;
                        </th>
                                            <th style="width:33.33%;height:0px">
                            &nbsp;
                        </th>
                                            <th style="width:33.33%;height:0px">
                            &nbsp;
                        </th>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja">
                                             <b><axis:alt f="axisctr020" c="IMPPROVISION" lit="1000518"></axis:alt></b>
                                            </td>
                                            <td class="titulocaja">
                                                                <b><axis:alt f="axisctr093" c="CAPMORT" lit="1000519" /></b>
                                            </td>
                                            <axis:ocultar f="axisctr020" c="IMPCAPGARAN" dejarHueco="false">
                                            <td class="titulocaja">
                                                                <b><axis:alt f="axisctr093" c="CAPGARANT" lit="1000521" /></b>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr020" c="IMPCAPESTIMAT">
                                            <td class="titulocaja">
                                                                <b><axis:alt f="axisctr093" c="CAPESTI" lit="9002136" /></b>
                                            </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <!-- Provisión -->
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="IMPPROVISION" name="IMPPROVISION" size="15"
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${OB_IAX_RIESGOS.OB_IAX_DATOSECONOMICOS.IMPPROVISION}'/>" readonly="true"/>
                                            </td>
                                            <!-- Capital fallecido -->
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="IMPCAPFALL" name="IMPCAPFALL" size="15"
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${OB_IAX_RIESGOS.OB_IAX_DATOSECONOMICOS.IMPCAPFALL}'/>" readonly="true"/>

                                            </td>
                                             <axis:ocultar f="axisctr020" c="IMPCAPGARAN" dejarHueco="false">
                                            <!-- Capital Garant. -->
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="IMPCAPGARAN" name="IMPCAPGARAN" size="15"
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${OB_IAX_RIESGOS.OB_IAX_DATOSECONOMICOS.IMPCAPGARAN}'/>" readonly="true"/>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr020" c="IMPCAPESTIMAT">
                                            <!-- Capital Estimado. -->
                                            <td>
                                                <input type="text" style="width:95%" class="campowidthinput campo campotexto" id="IMPCAPESTIMAT" name="IMPCAPESTIMAT" size="15"
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${OB_IAX_RIESGOS.OB_IAX_DATOSECONOMICOS.IMPCAPESTIMAT}'/>" readonly="true"/>
                                            </td>
                                            </axis:ocultar>
                                        </tr>
                                        </table>
                        </td>
                        </tr>
                        </table>


                        <table class="area" align="center">
                         <tr>
                            <td class="campocaja" >
                               <div style="float:left;">
                                <img id="DSP_MOVDTASEG_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_MOVDTASEG', this)" style="cursor:pointer"/>
                                    <b><axis:alt f="axisctr093" c="MOVDTASEG" lit="1000594" /></b>&nbsp;&nbsp;
                               </div>

                                <axis:visible f="axisctr020" c="BT_CTASEGURO">
                                    <div style="float:right;">
                                        <img border="0" alt="<axis:alt f="axisctr093" c="CTASEGURO" lit="100001"/>"  onclick="javascript:f_but_ctaseguro();" title="<axis:alt f="axisctr093" c="CTASEGURO" lit="100001"/>" src="images/print.gif" style="cursor:pointer"/>
                                    </div>
                                </axis:visible>

                                <div style="clear:both;">
                                        <hr class="titulo">
                                </div>
                            </td>
                        </tr>

                        <tr id="DSP_MOVDTASEG_children" style="display:none">
                            <td class="campocaja" >


                                 <div class="displayspace">
                                              <c:set var="title0"><axis:alt f="axisctr093" c="FEFECTO" lit="100883" /></c:set>
                                              <c:set var="title1"><axis:alt f="axisctr093" c="FVALOR" lit="1000590" /></c:set>
                                              <c:set var="title2"><axis:alt f="axisctr093" c="TIPMOV" lit="1000591" /></c:set>
                                              <c:set var="title3"><axis:alt f="axisctr093" c="IMPORT" lit="100563" /></c:set>
                                              <c:set var="title4"><axis:alt f="axisctr093" c="ANUL" lit="1000592" /></c:set>
                                              <c:set var="title5"><axis:alt f="axisctr093" c="VALLIQ" lit="9001310" /></c:set>
                                              <c:set var="title6"><axis:alt f="axisctr093" c="PARTIC" lit="108490" /></c:set>
                                              <c:set var="title7"><axis:alt f="axisctr093" c="TOTALPART" lit="9002014" /></c:set>

                                              <display:table name="${OB_IAX_RIESGOS.T_IAX_DATOSCTASEGURO}" id="MOVCTASEGURO" export="false" class="dsptgtable" pagesize="15" defaultorder="descending" sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="axis_axisctr093.do?paginar=true&subpantalla=ctaseguro&subpantalla_b=movdtaseg&operation=form"> <!-- Esta no necesitamos desplegarla al volver de ordenar - siempre está desplegada -->
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="${title0}" sortable="true" sortProperty="FFECMOV" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                      <div class="dspText"><fmt:formatDate value='${MOVCTASEGURO.OB_IAX_DATOSCTASEGURO.FFECMOV}' pattern='dd/MM/yyyy'/></div>
                                                    </display:column>
                                                    <display:column title="${title1}" sortable="true" sortProperty="FVALMOV" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatDate value='${MOVCTASEGURO.OB_IAX_DATOSCTASEGURO.FVALMOV}' pattern='dd/MM/yyyy'/></div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="TMOVIMI" headerClass="headwidth60 sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${MOVCTASEGURO.OB_IAX_DATOSCTASEGURO.TMOVIMI}</div>
                                                    </display:column>
                                                    <display:column title="${title3}" sortable="true" sortProperty="IMOVIMI" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                        <div class="dspNumber"><fmt:formatNumber value="${MOVCTASEGURO.OB_IAX_DATOSCTASEGURO.IMOVIMI}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/></div>
                                                    </display:column>
                                                    <display:column title="${title4}" sortable="true" sortProperty="TMOVANU" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${MOVCTASEGURO.OB_IAX_DATOSCTASEGURO.TMOVANU}</div>
                                                    </display:column>
                                                    <display:column title="${title5}" sortable="true" sortProperty="VALORLIQ" headerClass="headwidth10 sortable" media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatNumber value="${MOVCTASEGURO.OB_IAX_DATOSCTASEGURO.VALORLIQ}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/></div>
                                                    </display:column>
                                                    <display:column title="${title6}" sortable="true" sortProperty="NUNIDAD" headerClass="headwidth10 sortable" media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatNumber value="${MOVCTASEGURO.OB_IAX_DATOSCTASEGURO.NUNIDAD}" pattern="###,##0.00"/></div></div>
                                                    </display:column>
                                                    <display:column title="${title7}" sortable="true" sortProperty="SALDOACUM" headerClass="headwidth10 sortable" media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatNumber value="${MOVCTASEGURO.OB_IAX_DATOSCTASEGURO.SALDOACUM}" pattern="###,##0.00"/></div></div>
                                                    </display:column>
                                              </display:table>
                                 </div>
                         </td>
                    </tr>
                    </table>
                <c:if test="${ !empty perfil_inv.MODINVFONDO}">
                    <table class="area" align="center">
                         <tr>
                            <td class="campocaja" >
                               <div style="float:left;">
                                <img id="DSP_PERINVERSION_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_PERINVERSION', this)" style="cursor:pointer"/>
                                    <b><axis:alt f="axisctr093" c="PERFINV" lit="9001351" /></b>&nbsp;&nbsp;
                               </div>
                               <div style="clear:both;">
                                    <hr class="titulo">
                               </div>
                            </td>
                        </tr>

                        <tr id="DSP_PERINVERSION_children" style="display:none">
                            <td>
                                <table>
                                    <tr>
                                            <th style="width:2%;height:0px">&nbsp;</th>
                                            <th style="width:15%;height:0px">&nbsp;</th>
                                            <th style="width:43%;height:0px">&nbsp;</th>
                                            <th style="width:30%;height:0px">&nbsp;</th>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr093" c="PERFIL" lit="9001350" /></b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" id="PERFIL" name="PERFIL" size="15"
                                                    value="${perfil_inv.TMODINV}" readonly="true"/>
                                        </td>
                                    </tr>
                                    <axis:visible f="axisctr020" c="DSP_MODELOSINV">
                                    <tr>
                                        <td></td>
                                        <td class="campocaja" colspan="2">
                                            <div class="displayspace">
                                              <c:set var="title1"><axis:alt f="axisctr093" c="CONDFONS" lit="9001352" /></c:set>
                                              <c:set var="title2"><axis:alt f="axisctr093" c="FONS" lit="1000179" /></c:set>
                                              <c:set var="title3"><axis:alt f="axisctr093" c="INVER" lit="9001353" /></c:set>

                                              <display:table name="${perfil_inv.MODINVFONDO}" id="PRODULKMODINVFONDO" export="false" class="dsptgtable" pagesize="15" defaultorder="descending" sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="axis_axisctr093.do?paginar=true&subpantalla=ctaseguro&subpantalla_b=movdtaseg&operation=form"> <!-- Esta no necesitamos desplegarla al volver de ordenar - siempre está desplegada -->
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="${title1}" sortable="true" sortProperty="CCODFON" headerClass="headwidth10 sortable"  media="html" autolink="false" style="width:20%">
                                                        <div class="dspText">${PRODULKMODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON}</div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="TMOVIMI" headerClass="headwidth60 sortable"  media="html" autolink="false" style="width:65%">
                                                        <div class="dspText">${PRODULKMODINVFONDO.OB_IAX_PRODULKMODINVFONDO.TCODFON}</div>
                                                    </display:column>
                                                    <display:column title="${title3}" sortable="true" sortProperty="IMOVIMI" headerClass="headwidth10 sortable"  media="html" autolink="false" style="width:15%">
                                                        <div class="dspNumber">${PRODULKMODINVFONDO.OB_IAX_PRODULKMODINVFONDO.PINVERS}</div>
                                                    </display:column>
                                              </display:table>
                                            </div>
                                        </td>
                                    </tr>
                                   </axis:visible>     
                                   </table>
                                </td>
                                </tr>
                               </table>
                            </c:if>
                            </td>
                        </tr>
                    </c:if>                                    
