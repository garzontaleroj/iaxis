<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>


<c:if test="${!empty T_IAX_TRASPASOS}">
    <tr>
        <td class="campocaja">
            <div style="float:left;">
                <img id="DSP_TRASPASOS_parent" src="images/mes.gif" 
		    	onclick="objEstilos.toggleDisplay('DSP_TRASPASOS', this)" 
			    style="cursor:pointer"/> 
                <b><axis:alt f="axisctr093" c="DSP_TRASPASOS" lit="109232"></axis:alt></b>
            </div>
            <div style="clear:both;">
                <hr class="titulo">
            </div>                      
        </td>
    </tr>
    <tr id="DSP_TRASPASOS_children" style="display:none">
        <td class="campocaja" > 
            <div class="displayspace">
                <c:set var="title1"><axis:alt f="axisctr093" c="LIT_1" lit="800440"/></c:set>
                <c:set var="title2"><axis:alt f="axisctr093" c="LIT_2" lit="105940"/></c:set>
                <c:set var="title3"><axis:alt f="axisctr093" c="LIT_3" lit="9900744"/></c:set>
                <c:set var="title4"><axis:alt f="axisctr093" c="LIT_4" lit="100587"/></c:set>
                <c:set var="title5"><axis:alt f="axisctr093" c="LIT_5" lit="9001983"/></c:set>
                <c:set var="title6"><axis:alt f="axisctr093" c="LIT_6" lit="9900743"/></c:set>
                <c:set var="title7"><axis:alt f="axisctr093" c="LIT_7" lit="9002015"/></c:set>
                                                 
                <display:table name="${T_IAX_TRASPASOS}" 
		        id="T_IAX_TRASPASOS" export="false" 
		        class="dsptgtable" pagesize="-1" defaultsort="1" 
		        defaultorder="ascending" sort="list" 
		        cellpadding="0" cellspacing="0"
		        requestURI="axis_axisctr093.do?paginar=true"> 
		        <!-- Esta no necesitamos desplegarla al volver de ordenar - siempre est� desplegada -->
                    <%@ include file="../include/displaytag.jsp"%>        
                    <display:column title="${title1}" sortable="true" sortProperty="NPOLIZA" headerClass="headwidth10 sortable"  media="html" autolink="false" >    
                        <div class="dspText">
                            ${T_IAX_TRASPASOS.OB_IAX_TRASPASOS.NPOLIZA}
                            <c:if test="${miListaId.MOSTRA_CERTIF == '1'}"> - ${miListaId.OB_IAX_TRASPASOS.NCERTIF}</c:if>
                        </div>
                    </display:column>
                    <display:column title="${title2}" sortable="true" sortProperty="NOMBRE" headerClass="sortable" media="html" autolink="false" >
                        <div class="dspText">
                            ${T_IAX_TRASPASOS.OB_IAX_TRASPASOS.TNOMTOM}
                        </div>
                    </display:column>
                    <display:column title="${title3}" sortable="true" sortProperty="SITUACION" headerClass="sortable" media="html" autolink="false" >
                        <div class="dspText">
                            ${T_IAX_TRASPASOS.OB_IAX_TRASPASOS.TCINOUT}
                        </div>
                    </display:column>
                    <display:column title="${title4}" sortable="true" sortProperty="DESPRODUCTO" headerClass="sortable" media="html" autolink="false" >
                        <div class="dspText">
                            ${T_IAX_TRASPASOS.OB_IAX_TRASPASOS.TCESTADO}
                        </div>
                    </display:column>
                    <display:column title="${title5}" sortable="true" sortProperty="DESPRODUCTO" headerClass="sortable" media="html" autolink="false" >
                        <div class="dspDate">
                            <fmt:formatDate value='${T_IAX_TRASPASOS.OB_IAX_TRASPASOS.FSOLICI}' pattern='dd/MM/yyyy'/>
                        </div>
                    </display:column>
                    <display:column title="${title6}" sortable="true" sortProperty="DESPRODUCTO" headerClass="sortable" media="html" autolink="false" >
                        <div class="dspText">
                            ${T_IAX_TRASPASOS.OB_IAX_TRASPASOS.TCTIPTRAS}
                        </div>
                    </display:column>
                    <display:column title="${title7}" sortable="true" sortProperty="DESPRODUCTO" headerClass="sortable" media="html" autolink="false" >
                        <div class="dspText">
                            ${T_IAX_TRASPASOS.OB_IAX_TRASPASOS.TCTIPTRASSOL}
                        </div>
                    </display:column>
                </display:table>
            </div>
        </td>
    </tr>
</c:if>
<%--posa l'if correcta si es que es vol amagar per algun motiu sin� treure l'if--%>

<tr>
    <td class="campocaja" >
        <img  id="DSP_DATOSTRASPASO_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_DATOSTRASPASO', this)" style="cursor:pointer"/> 
        <b><axis:alt f="axisctr093" c="LIT_DATOSTRASPASO" lit="9900749" /></b>
        <hr class="titulo">
    </td>
</tr>
<tr id="DSP_DATOSTRASPASO_children" style="display:none">
    <td align="left" >
        <table class="area">                                                
            <tr>
                <th style="width:20%;height:0px">
                    &nbsp;
                </th>
                <th style="width:20%;height:0px">
                    &nbsp;
                </th>
                <th style="width:20%;height:0px">
                    &nbsp;
                </th>
                <th style="width:20%;height:0px">
                    &nbsp;
                </th>
            </tr>
            <tr>
                <axis:ocultar f="axisctr093" c="CINOUT" dejarHueco="false">
                    <td class="titulocaja">
                        <b><axis:alt f="axisctr093" c="LIT_CINOUT" lit="9900744" /></b>
                    </td>
                </axis:ocultar>
                <axis:ocultar f="axisctr093" c="CESTADO" dejarHueco="false">
                    <td class="titulocaja">
                        <b><axis:alt f="axisctr093" c="LIT_CESTADO" lit="100587" /></b>
                    </td>
                </axis:ocultar>                                                              
                <axis:ocultar f="axisctr093" c="FSOLICI" dejarHueco="false">
                    <td class="titulocaja">
                        <b><axis:alt f="axisctr093" c="LIT_FSOLICI" lit="9001983" /></b>
                    </td>
                </axis:ocultar>
                <axis:ocultar f="axisctr093" c="CTIPDER" dejarHueco="false">
                    <td class="titulocaja">
                        <b><axis:alt f="axisctr093" c="LIT_CTIPDER" lit="9900750" /></b>
                    </td>
                </axis:ocultar>
                <axis:ocultar f="axisctr093" c="CMOTIVO" dejarHueco="false">
                    <td class="titulocaja">
                        <b id="label_CMOTIVO"><axis:alt f="axisctr093" c="LIT_CMOTIVO" lit="9901543" /></b>
                    </td>
                </axis:ocultar>
            </tr>
            <tr>
                <axis:ocultar f="axisctr093" c="CINOUT" dejarHueco="false">
                    <td class="campocaja">
                        <select name="CINOUT" id="CINOUT" style="width:95%"
                                title='<axis:alt f="axisctr093" c="LIT_CINOUT" lit="9900744" />'
                                <axis:atr f="axisctr093" c="CINOUT" a="modificable=true&obligatorio=true&&isInputText=false"/>
                                size="1"
                                class="campowidthselect campo campotexto">
                            <option value="<%= Integer.MIN_VALUE %>">
                                -
                                <axis:alt f="axisctr093" c="LIT_CINOUT" lit="108341"/>
                                -
                            </option>
                            <c:forEach var="listado"
                                       items="${listValores.entradasalida}">
                                <option value="${listado.CATRIBU}"
                                        <c:if test="${listado.CATRIBU == __formdata.CINOUT}">selected</c:if>>
                                    ${listado.TATRIBU}
                                </option>
                            </c:forEach>
                        </select>
                    </td>
                </axis:ocultar>
                <axis:ocultar f="axisctr093" c="CESTADO" dejarHueco="false">
                    <td class="campocaja">
                        <select name="CESTADO" id="CESTADO" style="width:95%"
                                <axis:atr f="axisctr093" c="CESTADO" a="modificable=false&obligatorio=true&&isInputText=false"/>
                                size="1"
                                class="campowidthselect campo campotexto">
                            <option value="<%= Integer.MIN_VALUE %>">
                                -
                                <axis:alt f="axisctr093" c="LIT_CESTADO" lit="108341"/>
                                -
                            </option>
                            <c:forEach var="listado"
                                       items="${listValores.estado}">
                                <option value="${listado.CATRIBU}"
                                        <c:if test="${listado.CATRIBU == __formdata.CESTADO}">selected</c:if>>
                                    ${listado.TATRIBU}
                                </option>
                            </c:forEach>
                        </select>
                    </td>
                </axis:ocultar>
                <axis:ocultar f="axisctr093" c="FSOLICI" dejarHueco="false">
                    <td class="campocaja">
                        <input type="text" style="width:60%"
                               class="campowidthinput campo campotexto"
                               id="FSOLICI" name="FSOLICI"
                               title='<axis:alt f="axisctr093" c="LIT_FSOLICI" lit="9001983" />' size="15"
                               onblur="javascript:f_formatdate2(this,'${__formdata.FHOY}')"
                               <%--onblur="javascript:f_formatdate(this,'')"--%>
                               value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FSOLICI}'/>"
                               <axis:atr f="axisctr093" c="FSOLICI" a="modificable=true&obligatorio=true&formato=fecha"/>/>
                        <a id="icon_FSOLICI" style="vertical-align:middle;"
                           href="#">
                            <img id="popup_calendario_FSOLICI" border="0"
                                 alt='<axis:alt f="axisctr093" c="LIT_FSOLICI" lit="108341" />'
                                 title='<axis:alt f="axisctr093" c="LIT_FSOLICI" lit="108341" />'
                                 src="images/calendar.gif"/>
                        </a>
                    </td>
                </axis:ocultar>
                <axis:ocultar f="axisctr093" c="CTIPDER" dejarHueco="false">
                    <td class="campocaja">
                        <select name="CTIPDER" style="width:95%"
                                title='<axis:alt f="axisctr093" c="LIT_CTIPDER" lit="108230" />'
                                <axis:atr f="axisctr093" c="CTIPDER" a="modificable=true&obligatorio=true&isInputText=false"/>
                                id="CTIPDER" size="1"
                                class="campowidthselect campo campotexto">
                            <option value="<%= Integer.MIN_VALUE %>">
                                -
                                <axis:alt f="axisctr093" c="LIT_CTIPDER_OPCION" lit="108341"/>
                                -
                            </option>
                            <c:forEach var="listado"
                                       items="${listValores.tiptraspas}">
                                <option value="${listado.CATRIBU}"
                                        <c:if test="${listado.CATRIBU == __formdata.CTIPDER}">selected</c:if>>
                                    ${listado.TATRIBU}
                                </option>
                            </c:forEach>
                        </select>
                    </td>
                </axis:ocultar>
                <axis:ocultar f="axisctr093" c="CMOTIVO" dejarHueco="false">
                    <td class="campocaja">
                        <select name="CMOTIVO" id="CMOTIVO" style="width:95%"
                                <axis:atr f="axisctr093" c="CMOTIVO" a="modificable=true&obligatorio=false&isInputText=false"/>
                                size="1"
                                class="campowidthselect campo campotexto">
                            <option value="<%= Integer.MIN_VALUE %>">
                                -
                                <axis:alt f="axisctr093" c="LIT_CMTIVO_OPCION" lit="108341"/>
                                -
                            </option>
                            <c:forEach var="listado"
                                       items="${listValores.lcmotivo}">
                                <option value="${listado.CATRIBU}"
                                        <c:if test="${listado.CATRIBU == __formdata.CMOTIVO}">selected</c:if>>
                                    ${listado.TATRIBU}
                                </option>
                            </c:forEach>
                        </select>
                    </td>
                </axis:ocultar>
            </tr>
            <c:if test="${!empty __formdata.STRAS}">
                <tr>
                    <axis:ocultar f="axisctr093" c="FEFECTO" dejarHueco="false">
                        <td class="titulocaja">
                            <b><axis:alt f="axisctr093" c="LIT_FEFECTO" lit="100883"/></b>
                        </td>
                    </axis:ocultar>
                    <axis:ocultar f="axisctr093" c="FVALOR" dejarHueco="false">
                        <td class="titulocaja">
                            <b><axis:alt f="axisctr093" c="LIT_FVALOR" lit="1000590"/></b>
                        </td>
                    </axis:ocultar>
                    <axis:ocultar f="axisctr093" c="IIMPORTE"
                                  dejarHueco="false">
                        <td class="titulocaja">
                            <b><axis:alt f="axisctr093" c="LIT_IIMPORTE" lit="100563"/></b>
                        </td>
                    </axis:ocultar>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <axis:ocultar f="axisctr093" c="FEFECTO" dejarHueco="false">
                        <td class="campocaja">
                            <input type="text" style="width:60%"
                                   class="campowidthinput campo campotexto"
                                   id="FEFECTO" name="FEFECTO" size="15"
                                   onblur="javascript:f_formatdate2(this,'${__formdata.FHOY}')"
                                   value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FEFECTO}'/>"
                                   <axis:atr f="axisctr093" c="FEFECTO" a="modificable=true&obligatorio=false&formato=fecha"/>/>
                            <a id="icon_FEFECTO" style="vertical-align:middle;"
                               href="#">
                                <img id="popup_calendario_FEFECTO" border="0"
                                     alt='<axis:alt f="axisctr093" c="LIT_IMG_FEFECTO" lit="108341" />'
                                     title='<axis:alt f="axisctr093" c="LIT_IMG_FEFECTO" lit="108341" />'
                                     src="images/calendar.gif"/>
                            </a>
                        </td>
                    </axis:ocultar>
                    <axis:ocultar f="axisctr093" c="FVALOR" dejarHueco="false">
                        <td class="campocaja">
                            <input type="text" style="width:60%"
                                   class="campowidthinput campo campotexto"
                                   id="FVALOR" name="FVALOR" size="15"
                                       onblur="javascript:f_formatdate2(this,'${__formdata.FHOY}')"
                                   <%--onblur="javascript:f_formatdate(this,'')" --%>
                                   value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FVALOR}'/>"
                                   <axis:atr f="axisctr093" c="FVALOR" a="modificable=true&obligatorio=false&formato=fecha"/>/>
                            <a id="icon_FVALOR" style="vertical-align:middle;"
                               href="#">
                                <img id="popup_calendario_FVALOR" border="0"
                                     alt='<axis:alt f="axisctr093" c="LIT_IMG_FVALOR" lit="108341" />'
                                     title='<axis:alt f="axisctr093" c="LIT_IMG_FVALOR" lit="108341" />'
                                     src="images/calendar.gif"/>
                            </a>
                        </td>
                    </axis:ocultar>
                    <axis:ocultar f="axisctr093" c="IIMPORTE"
                                  dejarHueco="false">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto"
                                   id="IIMPORTE" name="IIMPORTE"
                                   onchange="f_formatear(this)"
                                   <axis:atr f="axisctr093" c="IIMPORTE" a="modificable=true&obligatorio=false&formato=decimal"/>
                                   size="15" style="width:90%"
                                   value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IIMPORTE}'/>"/>
                        </td>
                    </axis:ocultar>
                    <td>&nbsp;</td>
                </tr>
            </c:if>
            <tr>
                <td class="campocaja" colspan="4">
                    <table class="area" align="center">
                        <tr>
                            <td class="campocaja">
                                <img id="DSP_ORIDEST_parent"
                                     src="images/mes.gif"
                                     onclick="objEstilos.toggleDisplay('DSP_ORIDEST', this)"
                                     style="cursor:pointer"/>
                                <b id="LIT_ORIGEN"><axis:alt f="axisctr093" c="LIT_ORIDEST" lit="9000443"/></b>
                                /
                                <b id="LIT_DESTI"><axis:alt f="axisctr093" c="LIT_ORIDEST" lit="9900766"/></b>
                                <hr class="titulo"></hr>
                            </td>
                        </tr>
                        <tr id="DSP_ORIDEST_children" style="display:none">
                            <td align="left">
                                <table class="area">
                                    <tr>
                                        <th style="width:5%;height:0px">&nbsp;</th>
                                        <th style="width:20%;height:0px">&nbsp;</th>
                                        <th style="width:20%;height:0px">&nbsp;</th>
                                        <th style="width:20%;height:0px">&nbsp;</th>
                                        <th style="width:35%;height:0px">&nbsp;</th>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisctr093" c="CEXTERN"
                                                      dejarHueco="false">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr093" c="LIT_CEXTERN" lit="9900768"/></b>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr093" c="NPOLIZA"
                                                      dejarHueco="false">
                                            <!-- Numero de poliza -->
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr093" c="LIT_NPOLIZA" lit="100624"/></b>
                                            </td>
                                        </axis:ocultar>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr093" c="LIT_CAMPO" lit="9900930"/></b>
                                        </td>
                                        <td>&nbsp;</td>
                                        <axis:ocultar f="axisctr093" c="TPOLEXT"
                                                      dejarHueco="false">
                                            <td class="titulocaja">&nbsp;</td>
                                        </axis:ocultar>
                                        <!-- Check box es fons -->
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisctr093" c="CEXTERN"
                                                      dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="checkbox"
                                                       onclick="f_onclickCheckbox(this)"
                                                       id="CCEXTERN"
                                                       name="CCEXTERN"
                                                       <axis:atr f="axisctr093" c="CEXTERN" a="modificable=true&isInputText=false"/>
                                                       value="${__formdata.CEXTERN}"
                                                       <c:if test="${__configform.axisctr093__CEXTERN__modificable == 'false'}">disabled</c:if>
                                                       <c:if test="${__formdata.CEXTERN == '1'}">checked="true"</c:if>
                                                       <c:if test="${empty __formdata.CEXTERN && __configform.axisctr093__CEXTERN__valordefecto == 1}">checked="true"</c:if>/>
                                                <%-- <c:if
                                                     test="${__configform.axisctr093__CEXTERN__modificable
                                                     ==
                                                     'false'}">disabled</c:if>%--%>
                                            </td>
                                        </axis:ocultar>
                                        <td class="campocaja">
                                            <axis:ocultar f="axisctr093"
                                                          c="TPOLEXT"
                                                          dejarHueco="false">
                                                <input type="text"
                                                       class="campo campotexto"
                                                       id="TPOLEXT"
                                                       name="TPOLEXT"
                                                       title='<axis:alt f="axisctr093" c="LIT_TPOLEXT" lit="100624" />'
                                                       <axis:atr f="axisctr093" c="TPOLEXT" a="modificable=true"/>
                                                       size="15"
                                                       style="width:50%"
                                                       value="${__formdata.TPOLEXT}"/>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr093"
                                                          c="NCERTEXT"
                                                          dejarHueco="false">
                                                <%-- <b><fmt:message
                                                     key="101236" /></b>--%>
                                                <!-- Numero de certificado -->
                                                <input type="text"
                                                       class="campo campotexto"
                                                       id="NCERTEXT"
                                                       name="NCERTEXT"
                                                       <axis:atr f="axisctr093" c="NCERTEXT" a="modificable=true"/>
                                                       size="3"
                                                       style="width:15%"
                                                       value="${__formdata.NCERTEXT}"/>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr093"
                                                          c="ICO_BUSCARPOLIZA"
                                                          dejarHueco="false">
                                                <img id="ICO_BUSCARPOLIZA"
                                                     name="ICO_BUSCARPOLIZA"
                                                     border="0"
                                                     src="images/find.gif"
                                                     onclick="f_buscar_poliza_destino()"
                                                     style="cursor:pointer"/>
                                            </axis:ocultar>
                                        </td>
                                        <td class="campocaja">
                                            <!-- colspan="2">-->
                                            <axis:ocultar f="axisctr093"
                                                          c="ES_FONS"
                                                          dejarHueco="false">
                                                <input type="checkbox"
                                                       onclick="f_onclickCheckbox2(this)"
                                                       id="ES_FONS"
                                                       name="ES_FONS"
                                                       <c:if test="${__configform.axisctr093__ES_FONS__modificable == 'false'}">disabled</c:if>
                                                       <c:if test="${__formdata.CCODPLA!=null&&__formdata.CCODPLA!=''}">checked="true"</c:if>
                                                       <axis:atr f="axisctr093" c="ES_FONS" a="modificable=true"/>/>
                                            </axis:ocultar>
                                        </td>
                                        <td class="campocaja" colspan="2">
                                            <axis:ocultar f="axisctr093"
                                                          c="CCOMPANI_DGS"
                                                          dejarHueco="false">
                                                <b id="CCOMPANI_L"><axis:alt f="axisctr093" c="LIT_CCOMPANI" lit="9000600"/></b>
                                                <!-- compa�ia -->
                                                <input type="text"
                                                       class="campo campotexto"
                                                       id="CCOMPANI_DGS"
                                                       name="CCOMPANI_DGS"
                                                       title='<axis:alt f="axisctr093" c="LIT_CCOMPANI_DGS" lit="9000600" />'
                                                       onchange="f_onchange_cccompani(this.value)"
                                                       <axis:atr f="axisctr093" c="CCOMPANI_DGS" a="obligatorio=true&modificable=true"/>
                                                       style="width:12%"
                                                       value="${__formdata.CCOMPANI_DGS}"/>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr093"
                                                          c="CCOMPANI_DGS"
                                                          dejarHueco="false">
                                                <!-- compa�ia -->
                                                <input type="text"
                                                       class="campo campotexto"
                                                       id="TCOMPANI"
                                                       name="TCOMPANI"
                                                       <axis:atr f="axisctr093" c="CCOMPANI" a="modificable=false"/>
                                                       style="width:63%"
                                                       value="${__formdata.TCOMPANI}"/>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr093"
                                                          c="ICO_CCOMPANI"
                                                          dejarHueco="false">
                                                <img id="ICO_CCOMPANI"
                                                     border="0"
                                                     src="images/find.gif"
                                                     onclick="f_abrir_cercador();"
                                                     style="cursor:pointer"/>
                                            </axis:ocultar>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="campocaja">
                                <img id="J_PLAN_parent" src="images/mes.gif"
                                     onclick="objEstilos.toggleDisplay('J_PLAN', this)"
                                     style="display:none"/>
                            </td>
                        </tr>
                        <tr id="J_PLAN_children" style="display:none">
                            <td align="left">
                                <table class="area">
                                    <tr>
                                        <th style="width:20%;height:0px">&nbsp;</th>
                                        <th style="width:20%;height:0px">&nbsp;</th>
                                        <th style="width:20%;height:0px">&nbsp;</th>
                                        <th style="width:20%;height:0px">&nbsp;</th>
                                        <th style="width:20%;height:0px">&nbsp;</th>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisctr093" c="PLAN"
                                                      dejarHueco="false">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr093" c="LIT_CPLAN" lit="9900775"/></b>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <td class="campocaja" colspan="4">
                                            <axis:ocultar f="axisctr093"
                                                          c="PLAN"
                                                          dejarHueco="false">
                                                <input type="text"
                                                       class="campo campotexto"
                                                       id="CCODPLA_TRASPAS"
                                                       onchange="f_onchange_ccodpla(this.value)"
                                                       name="CCODPLA_TRASPAS"
                                                       <axis:atr f="axisctr093" c="CCODPLA_TRASPAS" a="modificable=true"/>
                                                       size="15"
                                                       style="width:10%"
                                                       value="${__formdata.CCODPLA_TRASPAS}"/>
                                                <input type="text"
                                                       class="campo campotexto"
                                                       id="TCODPLA_TRASPAS"
                                                       name="TCODPLA_TRASPAS"
                                                       <axis:atr f="axisctr093" c="TCODPLA_TRASPAS" a="modificable=false"/>
                                                       size="15"
                                                       style="width:80%"
                                                       value="${__formdata.TCODPLA_TRASPAS}"/>
                                                <img id="find" border="0"
                                                     src="images/find.gif"
                                                     onclick="f_abrir_axispen009();"
                                                     style="cursor:pointer"/>
                                            </axis:ocultar>
                                        </td>
                                    </tr>
                                    <%-- </c:if>--%>
                                    <tr>
                                        <axis:ocultar f="axisctr093" c="FONDO"
                                                      dejarHueco="false">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr093" c="LIT_FONDO" lit="9900776"/></b>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <td class="campocaja" colspan="4">
                                            <axis:ocultar f="axisctr093"
                                                          c="FONDO"
                                                          dejarHueco="false">
                                                <input type="text"
                                                       class="campo campotexto"
                                                       id="CCODFON_TRASPAS"
                                                       name="CCODFON_TRASPAS"
                                                       <axis:atr f="axisctr093" c="CCODFON_TRASPAS" a="modificable=false"/>
                                                       size="15"
                                                       style="width:10%"
                                                       value="${__formdata.CCODFON_TRASPAS}"/>
                                                <input type="text"
                                                       class="campo campotexto"
                                                       id="TCODFON_TRASPAS"
                                                       name="TCODFON_TRASPAS"
                                                       <axis:atr f="axisctr093" c="TCODFON_TRASPAS" a="modificable=false"/>
                                                       size="15"
                                                       style="width:80%"
                                                       value="${__formdata.TCODFON_TRASPAS}"/>
                                            </axis:ocultar>
                                        </td>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisctr093"
                                                      c="GESTORAS"
                                                      dejarHueco="false">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr093" c="LIT_GESTORAS" lit="9900778"/></b>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <td class="campocaja" colspan="4">
                                            <axis:ocultar f="axisctr093"
                                                          c="GESTORAS"
                                                          dejarHueco="false">
                                                <input type="text"
                                                       class="campo campotexto"
                                                       id="CCODGES_TRASPAS"
                                                       name="CCODGES_TRASPAS"
                                                       <axis:atr f="axisctr093" c="CCODGES_TRASPAS" a="modificable=false"/>
                                                       size="15"
                                                       style="width:10%"
                                                       value="${__formdata.CCODGES_TRASPAS}"/>
                                                <input type="text"
                                                       class="campo campotexto"
                                                       id="TCODGES_TRASPAS"
                                                       name="TCODGES_TRASPAS"
                                                       <axis:atr f="axisctr093" c="TCODGES_TRASPAS" a="modificable=false"/>
                                                       size="15"
                                                       style="width:80%"
                                                       value="${__formdata.TCODGES_TRASPAS}"/>
                                            </axis:ocultar>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <%-- </c:if>--%>
                        <tr>
                            <td align="left">
                                <table class="area">
                                    <tr>
                                        <th style="width:20%;height:0px">&nbsp;</th>
                                        <th style="width:20%;height:0px">&nbsp;</th>
                                        <th style="width:20%;height:0px">&nbsp;</th>
                                        <th style="width:20%;height:0px">&nbsp;</th>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisctr093" c="CTIPBAN"
                                                      dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_CTIPBAN"><axis:alt f="axisctr093" c="LIT_CTIPBAN" lit="1000374"/></b>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr093" c="CBANCAR"
                                                      dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_CBANCAR"><axis:alt f="axisctr093" c="LIT_CBANCAR" lit="100965"/></b>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisctr093" c="CTIPBAN"
                                                      dejarHueco="false">
                                            <td class="campocaja">
                                                <select name="CTIPBAN"
                                                        id="CTIPBAN"
                                                        style="width:95%"
                                                        <axis:atr f="axisctr093" c="CTIPBAN" a="modificable=true&obligatorio=false&isInputText=false"/>
                                                        size="1"
                                                        class="campowidthselect campo campotexto">
                                                    <option value="<%= Integer.MIN_VALUE %>">
                                                        -
                                                        <axis:alt f="axisctr093" c="LIT_CTIPBAN" lit="108341"/>
                                                        -
                                                    </option>
                                                    <c:forEach var="listado"
                                                               items="${listValores.tipCCC}">
                                                        <option value="${listado.CTIPBAN}"
                                                                <c:if test="${listado.CTIPBAN == __formdata.CTIPBAN || fn:length(listValores.tipCCC) == 1 }">selected</c:if>>
                                                            ${listado.TTIPO}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr093" c="CBANCAR"
                                                      dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text"
                                                       class="campowidthinput campo campotexto"
                                                       id="CBANCAR"
                                                       name="CBANCAR"
                                                       <axis:atr f="axisctr093" c="CBANCAR" a="modificable=true"/>
                                                       size="15"
                                                       value="${__formdata.CBANCAR}"/>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisctr093"
                                                      c="CTIPTRAS"
                                                      dejarHueco="false">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr093" c="LIT_CTIPTRAS" lit="9900743"/></b>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr093"
                                                      c="CTIPTRASSOL"
                                                      dejarHueco="false">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr093" c="LIT_CTIPTRASSOL" lit="9002015"/></b>
                                            </td>
                                            <c:if test="${__formdata.CTIPTRASSOL==1}">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr093" c="LIT_CTIPTRASSOL" lit="9900779"/></b>
                                                </td>
                                            </c:if>
                                            <c:if test="${__formdata.CTIPTRASSOL==3}">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr093" c="LIT_CTIPTRASSOL" lit="9900780"/></b>
                                                </td>
                                            </c:if>
                                            <c:if test="${__formdata.CTIPTRASSOL==2}">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr093" c="LIT_CTIPTRASSOL" lit="101467"/></b>
                                                </td>
                                            </c:if>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisctr093"
                                                      c="CTIPTRAS"
                                                      dejarHueco="false">
                                            <td class="campocaja">
                                                <select name="CTIPTRAS"
                                                        id="CTIPTRAS"
                                                        title='<axis:alt f="axisctr093" c="LIT_CTIPTRAS" lit="9900743" />'
                                                        <axis:atr f="axisctr093" c="CTIPTRAS" a="modificable=true&obligatorio=true&isInputText=false"/>
                                                        style="width:95%"
                                                        size="1"
                                                        class="campowidthselect campo campotexto"
                                                        onchange="f_carga_dependencias();revisarEstilos();">
                                                    <option value="<%= Integer.MIN_VALUE %>">
                                                        -
                                                        <axis:alt f="axisctr093" c="LIT_CTIPTRAs_OPCION" lit="108341"/>
                                                        -
                                                    </option>
                                                    <c:forEach var="listado"
                                                               items="${listValores.tiptras}">
                                                        <option value="${listado.CATRIBU}"
                                                                <c:if test="${listado.CATRIBU == __formdata.CTIPTRAS}">selected</c:if>>
                                                            ${listado.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr093"
                                                      c="CTIPTRASSOL"
                                                      dejarHueco="false">
                                            <td class="campocaja">
                                                <select name="CTIPTRASSOL"
                                                        id="CTIPTRASSOL"
                                                        title='<axis:alt f="axisctr093" c="LIT_CTIPTRASSOL" lit="9002015" />'
                                                        <axis:atr f="axisctr093" c="CTIPTRASSOL" a="modificable=true&obligatorio=false&isInputText=false"/>
                                                        style="width:95%"
                                                        size="1"
                                                        onchange="f_actualitzar();"
                                                        class="campowidthselect campo campotexto">
                                                    <option value="<%= Integer.MIN_VALUE %>">
                                                        -
                                                        <axis:alt f="axisctr093" c="LIT_CTIPTRASSOL_OPCION" lit="108341"/>
                                                        -
                                                    </option>
                                                    <c:forEach var="listado"
                                                               items="${listValores.tiptrassol}">
                                                        <option value="${listado.CATRIBU}"
                                                                <c:if test="${listado.CATRIBU == __formdata.CTIPTRASSOL}">selected</c:if>>
                                                            ${listado.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            <c:if test="${__formdata.CTIPTRASSOL==1}">
                                                <td class="campocaja">
                                                    <input type="text"
                                                           class="campowidthinput campo campotexto"
                                                           id="IIMPTEMP"
                                                           name="IIMPTEMP"
                                                           onchange="f_formatear(this)"
                                                           <axis:atr f="axisctr093" c="IIMPTEMP" a="modificable=true"/>
                                                           size="15"
                                                           value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IIMPTEMP}'/>"/>
                                                </td>
                                            </c:if>
                                            <c:if test="${__formdata.CTIPTRASSOL==3}">
                                                <td class="campocaja">
                                                    <input type="text"
                                                           class="campowidthinput campo campotexto"
                                                           id="NPARPLA"
                                                           name="NPARPLA"
                                                           onchange="f_formatear(this)"
                                                           <axis:atr f="axisctr093" c="NPARPLA" a="modificable=true"/>
                                                           size="15"
                                                           value="<fmt:formatNumber pattern='###,##0.00' value='${__formdata.NPARPLA}'/>"/>
                                                </td>
                                            </c:if>
                                            <c:if test="${__formdata.CTIPTRASSOL==2}">
                                                <td class="campocaja">
                                                    <input type="text"
                                                           class="campowidthinput campo campotexto"
                                                           id="NPORCEN"
                                                           name="NPORCEN"
                                                           onblur="ValidaPorcen(this)"
                                                           <axis:atr f="axisctr093" c="NPORCEN" a="modificable=true"/>
                                                           size="15"
                                                           value="<fmt:formatNumber pattern='###,##0.00' value='${__formdata.NPORCEN}'/>"/>
                                                </td>
                                            </c:if>
                                        </axis:ocultar>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <axis:ocultar f="axisctr093" c="DSP_INFOAD" dejarHueco="false">
                <tr>
                    <td class="campocaja" colspan="4">
                        <table class="area" align="center">
                            <tr>
                                <td class="campocaja">
                                    <img id="DSP_INFOAD_parent"
                                         src="images/mes.gif"
                                         onclick="objEstilos.toggleDisplay('DSP_INFOAD', this)"
                                         style="cursor:pointer"/>
                                    <b><axis:alt f="axisctr093" c="LIT_DSP" lit="9900767"/></b>
                                    <hr class="titulo"></hr>
                                </td>
                            </tr>
                            <tr id="DSP_INFOAD_children" style="display:none">
                                <td align="left">
                                    <table class="area">
                                        <tr>
                                            <th style="width:20%;height:0px">&nbsp;</th>
                                            <th style="width:20%;height:0px">&nbsp;</th>
                                            <th style="width:20%;height:0px">&nbsp;</th>
                                            <th style="width:20%;height:0px">&nbsp;</th>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisctr093"
                                                          c="FANTIGI"
                                                          dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr093" c="LIT_FANTIGI" lit="9900781"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr093"
                                                          c="IIMPANU"
                                                          dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr093" c="LIT_IIMPANU" lit="9900782"/></b>
                                                </td>
                                            </axis:ocultar>
                                      
                                            <axis:ocultar f="axisctr093"
                                                          c="PORCPOS2006"
                                                          dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr093" c="LIT_PORCPOS" lit="9900784"/></b>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisctr093"
                                                          c="FANTIGI"
                                                          dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text"
                                                           style="width:60%"
                                                           class="campowidthinput campo campotexto"
                                                           id="FANTIGI"
                                                           name="FANTIGI"
                                                           size="15"
                                                           onblur="javascript:f_formatdate(this,'')"
                                                           value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FANTIGI}'/>"
                                                           <axis:atr f="axisctr093" c="FANTIGI" a="modificable=true&obligatorio=false&formato=fecha"/>/>
                                                    <a id="icon_FANTIGI"
                                                       style="vertical-align:middle;"
                                                       href="#">
                                                        <img id="popup_calendario_FANTIGI"
                                                             border="0"
                                                             alt='<axis:alt f="axisctr093" c="LIT_FANTIGI" lit="108341" />'
                                                             title='<axis:alt f="axisctr093" c="LIT_FANTIGI" lit="108341" />'
                                                             src="images/calendar.gif"/>
                                                    </a>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr093"
                                                          c="IIMPANU"
                                                          dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text"
                                                           class="campowidthinput campo campotexto"
                                                           id="IIMPANU"
                                                           name="IIMPANU"
                                                           size="15"
                                                           title='<axis:alt f="axisctr093" c="LIT_IIMPANU" lit="9900782" />'
                                                           onchange="f_formatear(this)"
                                                           value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IIMPANU}'/>"
                                                           <axis:atr f="axisctr093" c="IIMPANU" a="modificable=true&obligatorio=false&formato=decimal"/>/>
                                                </td>
                                            </axis:ocultar>
                                            <%-- <axis:ocultar f="axisctr093"
                                                 c="PORCANT2007"
                                                 dejarHueco="false"> <td
                                                 class="campocaja"> <input
                                                 type="text"
                                                 class="campowidthinput campo
                                                 campotexto" id="PORCANT2007"
                                                 name="PORCANT2007" size="15"
                                                 maxlength="6"
                                                 onblur="ValidaPorcen(this)"
                                                 title="<fmt:message
                                                 key="9901076" />"
                                                 value="<fmt:formatNumber
                                                 pattern='###,##0.00'
                                                 value='${__formdata.PORCANT2007}'/>"
                                                 <axis:atr f="axisctr093"
                                                 c="PORCANT2007"
                                                 a="modificable=true&obligatorio=false&formato=decimal"/>/>
                                                 </td> </axis:ocultar>--%>
                                            <axis:ocultar f="axisctr093"
                                                          c="PORCPOS2006"
                                                          dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text"
                                                           class="campowidthinput campo campotexto"
                                                           id="PORCPOS2006"
                                                           name="PORCPOS2006"
                                                           size="15"
                                                           maxlength="6"
                                                           title='<axis:alt f="axisctr093" c="LIT_PORCPOS" lit="9900784" />'
                                                           onblur="ValidaPorcen2006(this)"
                                                           value="<fmt:formatNumber pattern='###,##0.00' value='${__formdata.PORCPOS2006}'/>"
                                                           <axis:atr f="axisctr093" c="PORCPOS2006" a="modificable=true&obligatorio=false&formato=decimal"/>/>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisctr093"
                                                          c="TMEMO"
                                                          dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr093" c="LIT_TMEMO" lit="101162"/></b>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisctr093"
                                                          c="TMEMO"
                                                          dejarHueco="false">
                                                <td class="campocaja"
                                                    colspan="4">
                                                    <textarea class="campowidthinput campo campotexto"
                                                              rows="5"
                                                              style="width:100%;"
                                                              <axis:atr f="axisctr093" c="TMEMO" a="modificable=true&obligatorio=false"/>
                                                              name="TMEMO"
                                                              id="TMEMO">${__formdata.TMEMO}</textarea>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </axis:ocultar>
            
            
            <c:if test="${!empty __formdata.CTIPCONT}">    
            <axis:ocultar f="axisctr093" c="DSP_INFODERECO" dejarHueco="false">
                <tr>
                    <td class="campocaja" colspan="4">
                        <table class="area" align="center">
                            <tr>
                                <td class="campocaja">
                                    <img id="DSP_INFODERECO_parent"
                                         src="images/mes.gif"
                                         onclick="objEstilos.toggleDisplay('DSP_INFODERECO', this)"
                                         style="cursor:pointer"/>
                                    <b><axis:alt f="axisctr093" c="LIT_CTIPCONT" lit="9901550"/></b>
                                    <hr class="titulo"></hr>
                                </td>
                            </tr>
                            <tr id="DSP_INFODERECO_children" style="display:none">
                                <td align="left">
                                    <table class="area">
                                        <tr>
                                            <th style="width:20%;height:0px">&nbsp;</th>
                                            <th style="width:20%;height:0px">&nbsp;</th>
                                            <th style="width:20%;height:0px">&nbsp;</th>
                                            <th style="width:20%;height:0px">&nbsp;</th>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisctr093"
                                                          c="CTIPCONT"
                                                          dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr093" c="LIT_CTIPCONT" lit="9901552"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr093"
                                                          c="FCONTIG"
                                                          dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr093" c="LIT_FCONTIG" lit="9901553"/></b>
                                                </td>
                                            </axis:ocultar>
                                            
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisctr093"
                                                          c="CTIPCONT"
                                                          dejarHueco="false">
                                            <td class="campocaja">
                                                <select name="CTIPCONT"
                                                        id="CTIPCONT"
                                                        title='<axis:alt f="axisctr093" c="LIT_CTIPCONT" lit="9002015" />'
                                                        <axis:atr f="axisctr093" c="CTIPCONT" a="modificable=true&obligatorio=false&isInputText=false"/>
                                                        style="width:95%"
                                                        size="1"
                                                        onchange=""
                                                        class="campowidthselect campo campotexto">
                                                    <option value="<%= Integer.MIN_VALUE %>">
                                                        -
                                                        <axis:alt f="axisctr093" c="LIT_CTIPCONT_OPCION" lit="108341"/>
                                                        -
                                                    </option>
                                                    <c:forEach var="listado"
                                                               items="${listValores.tipctipcont}">
                                                        <option value="${listado.CATRIBU}"
                                                                <c:if test="${listado.CATRIBU == __formdata.CTIPCONT}">selected</c:if>>
                                                            ${listado.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr093"
                                                          c="FCONTING"
                                                          dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text"
                                                           style="width:60%"
                                                           class="campowidthinput campo campotexto"
                                                           id="FCONTING"
                                                           name="FCONTING"
                                                           size="15"
                                                           onblur="javascript:f_formatdate(this,'')"                       
                                                           value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FCONTING}'/>"
                                                           <axis:atr f="axisctr093" c="FCONTING" a="modificable=true&obligatorio=false&formato=fecha"/>/>
                                                    <a id="icon_FCONTING"
                                                       style="vertical-align:middle;"
                                                       href="#">
                                                        <img id="popup_calendario_FCONTING"
                                                             border="0"
                                                             alt='<axis:alt f="axisctr093" c="LIT_FCONTIG" lit="108341" />'
                                                             title='<axis:alt f="axisctr093" c="LIT_FCONTIG" lit="108341" />'
                                                             src="images/calendar.gif"/>
                                                    </a>
                                                </td>
                                            </axis:ocultar>
                                          </tr>  
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </axis:ocultar>
            
            <axis:ocultar f="axisctr093" c="DSP_INFOCOPRES" dejarHueco="false">
                <tr>
                    <td class="campocaja" colspan="4">
                        <table class="area" align="center">
                            <tr>
                                <td class="campocaja">
                                    <img id="DSP_INFOCOPRES_parent"
                                         src="images/mes.gif"
                                         onclick="objEstilos.toggleDisplay('DSP_INFOCOPRES', this)"
                                         style="cursor:pointer"/>
                                    <b><axis:alt f="axisctr093" c="LIT_INFOCOPRES" lit="9901551"/></b>
                                    <hr class="titulo"></hr>
                                </td>
                            </tr>
                            <tr id="DSP_INFOCOPRES_children" style="display:none">
                                <td align="left">
                                    <table class="area">
                                        <tr>
                                            <th style="width:20%;height:0px">&nbsp;</th>
                                            <th style="width:20%;height:0px">&nbsp;</th>
                                            <th style="width:20%;height:0px">&nbsp;</th>
                                            <th style="width:20%;height:0px">&nbsp;</th>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisctr093"
                                                          c="CTIPCAP"
                                                          dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr093" c="LIT_CTIPCAP" lit="151348"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr093"
                                                          c="IMPORTE"
                                                          dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr093" c="LIT_IMPORTE" lit="100563"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr093"
                                                          c="FABONOCAP"
                                                          dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr093" c="LIT_FABONO" lit="9001861"/></b>
                                                </td>
                                            </axis:ocultar>
                                            
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisctr093"
                                                          c="CTIPCAP"
                                                          dejarHueco="false">
                                            <td class="campocaja">
                                                <select name="CTIPCAP"
                                                        id="CTIPCAP"
                                                        title='<axis:alt f="axisctr093" c="LIT_CTIPCAP" lit="9002015" />'
                                                        <axis:atr f="axisctr093" c="CTIPCAP" a="modificable=true&obligatorio=false&isInputText=false"/>
                                                        style="width:95%"
                                                        size="1"
                                                        onchange=""
                                                        class="campowidthselect campo campotexto">
                                                    <option value="<%= Integer.MIN_VALUE %>">
                                                        -
                                                        <axis:alt f="axisctr093" c="LIT_CTIPCAP_OPCION" lit="108341"/>
                                                        -
                                                    </option>
                                                    <c:forEach var="listado"
                                                               items="${listValores.tipctipcap}">
                                                        <option value="${listado.CATRIBU}"
                                                                <c:if test="${listado.CATRIBU == __formdata.TPREST.CTIPCAP}">selected</c:if>>
                                                            ${listado.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr093"
                                                          c="IMPORTE"
                                                          dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text"
                                                           class="campowidthinput campo campotexto"
                                                           id="IMPORTE"
                                                           name="IMPORTE"
                                                           size="15"
                                                           style="width:50%"
                                                           title='<axis:alt f="axisctr093" c="LIT_IMPORTE" lit="9900782" />'
                                                           onchange="f_formatear(this)"
                                                           value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.TPREST.IMPORTE}'/>"
                                                           <axis:atr f="axisctr093" c="IMPORTE" a="modificable=true&obligatorio=false&formato=decimal"/>/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr093"
                                                          c="FABONOCAP"
                                                          dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text"
                                                           style="width:60%"
                                                           class="campowidthinput campo campotexto"
                                                           id="FABONOCAP"
                                                           name="FABONOCAP"
                                                           size="15"
                                                           onblur="javascript:f_formatdate(this,'')"
                                                           value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.TPREST.FPROPAG}'/>"
                                                           <axis:atr f="axisctr093" c="FABONOCAP" a="modificable=true&obligatorio=false&formato=fecha"/>/>
                                                    <a id="icon_FABONOCAP"
                                                       style="vertical-align:middle;"
                                                       href="#">
                                                        <img id="popup_calendario_FABONOCAP"
                                                             border="0"
                                                             alt='<axis:alt f="axisctr093" c="LIT_FABONOCAP" lit="108341" />'
                                                             title='<axis:alt f="axisctr093" c="LIT_FABONOCAP" lit="108341" />'
                                                             src="images/calendar.gif"/>
                                                    </a>
                                                </td>
                                            </axis:ocultar>
                                            
                                          </tr>  
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </axis:ocultar>
        </c:if>    
        </table>                                     
    </td> 
</tr>
                                    
  
                       
