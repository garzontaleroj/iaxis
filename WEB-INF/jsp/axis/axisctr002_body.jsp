<%/* Revision:# +AYZE1+vjgyJxyvfeZYzbA== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<c:choose>
    <c:when test="${param.multiPantalla == 'true'}">
        <c:set var="pantalla" value="axisctr026"/>
        <c:set var="literalPantalla">
            <axis:alt f="${pantalla}" c="LIT_PANTALLA" lit="1000193"/>
        </c:set>
    </c:when>
    <c:otherwise>
        <c:set var="pantalla" value="axisctr002"/>
        <c:set var="literalPantalla">
            <axis:alt f="${pantalla}" c="LIT_PANTALLA" lit="1000181"/>
        </c:set>
    </c:otherwise>
</c:choose>

<c:import url="../include/precargador_ajax.jsp">
    <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
</c:import>

<form name="axisctr002Form" action="" method="POST">
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo">
            <axis:alt f="${pantalla}" c="TITULO" lit="1000235"/>
        </c:param>
        <c:param name="nid" value="axisper001"/>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo">
            <axis:alt f="${pantalla}" c="MDD_AXISPER005" lit="1000214"/>
        </c:param>
        <c:param name="nid" value="axisper005"/>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo">
            <axis:alt f="${pantalla}" c="MDL_AXISPER006" lit="1000215"/>
        </c:param>
        <c:param name="nid" value="axisper006"/>
    </c:import>
    
    <input type="hidden" name="operation" value=""/>
    <input type="hidden" name="SPERSON_TOMAD" id="SPERSON_TOMAD" value="${__formdata.SPERSON_TOMAD}"/>
    <input type="hidden" name="CTIPPER" id="CTIPPER" value="${__formdata.obtomador.CTIPPER}"/>
    
    
    
    <input type="hidden" name="SPERSON_TOMAD2MODIFY" id="SPERSON_TOMAD2MODIFY"
           value=""/>
    <input type="hidden" name="ISASEG" id="ISASEG" value=""/>
    <input type="hidden" name="mensaje_a_mostrar" id="mensaje_a_mostrar" value=""/>
    <input type="hidden" name="axisctr_multi_registro_tomadores" id="axisctr_multi_registro_tomadores" value="${__formdata.axisctr_multi_registro_tomadores}"/>
    
    
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="modalidad">
            <axis:alt f="${pantalla}" c="TITULO_FORM" lit="101110"/>
            <axis:visible f="${pantalla}" c="NPOLIZA"> 
            <axis:alt f="axisctr002" c="TITULO_FORM" lit="101779"/> 
            
            <axis:ocultar f="${pantalla}" c="TITULO_COLECTIVO" dejarHueco="false">
            	<axis:alt f="axisctr002" c="TITULO_FORM" lit="102707"/> 
            </axis:ocultar>
            ${__formdata.NPOLIZA}
            </axis:visible>
            <axis:visible f="axisctr002" c="PTMOTMOV"> ${__formdata.PTMOTMOV}
            </axis:visible>
        </c:param>
        <c:param name="formulario">
            ${literalPantalla}
        </c:param>
        <c:param name="form">
            ${pantalla}
        </c:param>
    </c:import>
    
    <!-- Area de campos  -->
    <table class="mainTableDimensions base" align="center" cellpadding="0"
           cellspacing="0"
           <c:if test="${param.multiPantalla == 'true'}">style="height:180px;"</c:if>>
        <tr>
            <td>
                <div class="titulo">
                    <img src="images/flecha.gif"/><axis:alt f="${pantalla}"
                                                            c="LIT_PRIMER_SUBTITULO"
                                                            lit="1000275"/>
                </div>
                <table class="seccion" align="center">
                    <tr>
                        <td>
                            <table class="area" align="center">
                                <tr>
                                    <td>
                                        <!-- DisplayTag Tomadores -->
                                        <c:set var="title1">
                                            <axis:alt f="${pantalla}"
                                                      c="DSP_LIT_PRIMERA_COLUMNA"
                                                      lit="1000181"/>
                                        </c:set>
                                        <c:set var="title2">
                                            <axis:visible f="${pantalla}"
                                                          c="ESASEGURADO">
                                                <axis:alt f="${pantalla}"
                                                          c="ESASEGURADO"
                                                          lit="1000078"></axis:alt>
                                            </axis:visible>
                                        </c:set>
                                        <c:set var="title3">
                                            <axis:visible f="${pantalla}"
                                                          c="CEXISTEPAGADOR">
                                                <axis:alt f="${pantalla}"
                                                          c="CEXISTEPAGADOR"
                                                          lit="9903157">?</axis:alt>
                                            </axis:visible>
                                        </c:set>
                                        <c:set var="idTomador">
                                            ${__formdata.obtomador.SPERSON}
                                        </c:set>
                                        <div class="separador">&nbsp;</div>
                                        <div class="displayspace">
                                            <display:table name="${__formdata.axisctr_tomadores}"
                                                           id="axisctr_tomadores"
                                                           export="false"
                                                           class="dsptgtable"
                                                           pagesize="-1"
                                                           defaultsort="1"
                                                           defaultorder="ascending"
                                                           sort="list"
                                                           cellpadding="0"
                                                           cellspacing="0"
                                                           requestURI="axis_${pantalla}.do?ordenar=true&tabla=axisctr_tomadores&campo=TNOMBRE&outerMap=OB_IAX_TOMADORES">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title=""
                                                                sortProperty="SPERSON"
                                                                sortable="false"
                                                                headerClass="headwidth5 sortable"
                                                                media="html"
                                                                autolink="false">
                                                    <div class="dspIcons">
                                                        <input <c:if test="${idTomador !='' && idTomador == axisctr_tomadores.OB_IAX_TOMADORES.SPERSON}">checked</c:if>
                                                               onclick="javascript:f_selecciona_tomador('${axisctr_tomadores.OB_IAX_TOMADORES.SPERSON}', this)"
                                                               value="${axisctr_tomadores.OB_IAX_TOMADORES.SPERSON}"
                                                               type="radio"
                                                               id="radioTomador"
                                                               name="radioTomador"/>
                                                    </div>
                                                </display:column>
                                                <display:column title="${title1}"
                                                                sortable="true"
                                                                sortProperty="TNOMBRE"
                                                                headerClass="sortable"
                                                                media="html"
                                                                autolink="false">
                                                    <div class="dspText">
                                                        ${axisctr_tomadores.OB_IAX_TOMADORES.TNOMBRE}
                                                         
                                                        ${axisctr_tomadores.OB_IAX_TOMADORES.TAPELLI1}
                                                         
                                                        ${axisctr_tomadores.OB_IAX_TOMADORES.TAPELLI2}
                                                    </div>
                                                </display:column>
                                                <axis:visible f="${pantalla}"
                                                              c="ESASEGURADO">
                                                    <display:column title="${title2}"
                                                                    sortable="false"
                                                                    sortProperty="esAsegurado"
                                                                    headerClass="headwidth5 sortable"
                                                                    media="html"
                                                                    autolink="false">
                                                        <div class="dspIcons">
                                                            <input onclick="javascript:f_actualiza_casilla_asegurado(this,'${axisctr_tomadores.OB_IAX_TOMADORES.SPERSON}','${axisctr_tomadores.OB_IAX_TOMADORES.CEXISTEPAGADOR}')"
                                                                   <c:if test="${axisctr_tomadores.OB_IAX_TOMADORES.ISASEG == '1'}">checked="true"</c:if>
                                                                   type="checkbox"
                                                                   <axis:atr f="${pantalla}" c="ESASEGURADO" a="modificable=true&isInputText=false"/>
                                                                   id="ESASEGURADO_${axisctr_tomadores.OB_IAX_TOMADORES.SPERSON}"
                                                                   name="ESASEGURADO_${axisctr_tomadores.OB_IAX_TOMADORES.SPERSON}"
                                                                   value=""/>
                                                        </div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible f="${pantalla}"
                                                              c="CEXISTEPAGADOR">
                                                    <display:column title="${title3}"
                                                                    sortable="false"
                                                                    sortProperty="existePagador"
                                                                    headerClass="headwidth5 sortable"
                                                                    media="html"
                                                                    autolink="false">
                                                        <div class="dspIcons">
                                                            <input onclick="javascript:f_actualiza_casilla_pagador(${axisctr_tomadores.OB_IAX_TOMADORES.ISASEG},'${axisctr_tomadores.OB_IAX_TOMADORES.SPERSON}',this)"
                                                                   <c:if test="${axisctr_tomadores.OB_IAX_TOMADORES.CEXISTEPAGADOR == '1'}">checked="true"</c:if>
                                                                   type="checkbox"
                                                                   <axis:atr f="${pantalla}" c="CEXISTEPAGADOR" a="modificable=false&isInputText=false"/>
                                                                   id="CEXISTEPAGADOR_${axisctr_tomadores.OB_IAX_TOMADORES.SPERSON}"
                                                                   name="CEXISTEPAGADOR_${axisctr_tomadores.OB_IAX_TOMADORES.SPERSON}"
                                                                   value="${axisctr_tomadores.OB_IAX_TOMADORES.CEXISTEPAGADOR}"/>
                                                        </div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible f="${pantalla}"
                                                              c="BT_MODIF_TOMADOR">
                                                    <display:column title=""
                                                                    headerClass="headwidth5 sortable"
                                                                    media="html"
                                                                    autolink="false">
                                                        <div class="dspIcons">
                                                            <a href="javascript:f_but_modificar_tomador('${axisctr_tomadores.OB_IAX_TOMADORES.SPERSON}')">
                                                                <img border="0"
                                                                     alt='<axis:alt f="${pantalla}" c="ICO_MOD_TOMADOR" lit="1000295"/>'
                                                                     title='<axis:alt f="${pantalla}" c="ICO_MOD_TOMADOR" lit="1000295"/>'
                                                                     src="images/find.gif"/>
                                                            </a>
                                                        </div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible f="${pantalla}"
                                                              c="BT_DEL_TOMADOR">
                                                    <display:column title=""
                                                                    headerClass="headwidth5 sortable"
                                                                    media="html"
                                                                    autolink="false">
                                                        <div class="dspIcons">
                                                            <a href="javascript:f_borrar_tomador('${axisctr_tomadores.OB_IAX_TOMADORES.SPERSON}', this)">
                                                                <img border="0"
                                                                     alt='<axis:alt f="${pantalla}" c="ICO_DEL_TOMADOR" lit="1000127" />'
                                                                     title='<axis:alt f="${pantalla}" c="ICO_DEL_TOMADOR" lit="1000127" />'
                                                                     src="images/delete.gif"/>
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
                    <tr>
                        <axis:visible f="${pantalla}" c="BT_ANADIR">
                            <td align="right">
                                <div class="separador">&nbsp;</div>
                                <input type="button" class="boton"
                                       id="but_anadir_tomador"
                                       value='<axis:alt f="${pantalla}" c="BT_ANADIR" lit="1000070"/>'
                                       onclick="f_but_anadir_tomador()"/>
                                <div class="separador">&nbsp;</div>
                            </td>
                        </axis:visible>
                    </tr>
                    <!-- Sub-Sección datos tomador -->
                    <tr>
                        <td colspan="2" align="left">
                            <div class="titulo"
                                 style="margin-left:10px;font-size: 11px;width:98%">
                                <img src="images/flecha.gif"/><axis:alt f="${pantalla}"
                                                                        c="LIT_SEGUNDO_SUBTITULO"
                                                                        lit="1000102"/>
                            </div>
                        </td>
                    </tr>
				<!-- Ini IAXIS -3635 - ACL - 22/04/2019 -->
					<tr>
                        <axis:visible f="${pantalla}" c="BT_DATOS_PER">
                            <td align="right">
                                <div class="separador">&nbsp;</div>
                                <input type="button" class="boton"
                                       id="but_consultar_per"
                                       value='<axis:alt f="${pantalla}" c="BT_DATOS_PER" lit="110275"/>'
                                       onclick="f_but_consultar_per('${__formdata.SPEREAL}','${__formdata.CAGENTE}')"/>
                                <div class="separador">&nbsp;</div>
                            </td>
                        </axis:visible>
                    </tr>
				<!-- Fin IAXIS -3635 - ACL - 22/04/2019 -->
                    <tr>
                        <td align="left">
                            <table class="area" align="center">
                                <tr>
                                    <th style="width:12.5%;height:0px">
                                        &nbsp;
                                    </th>
                                    <th style="width:12.5%;height:0px">
                                        &nbsp;
                                    </th>
                                    <th style="width:25%;height:0px">
                                        &nbsp;
                                    </th>
                                    <th style="width:25%;height:0px">
                                        &nbsp;
                                    </th>
                                    <th style="width:25%;height:0px">
                                        &nbsp;
                                    </th>
                                </tr>
                                <tr>
                                    <axis:ocultar f="${pantalla}" c="NNUMIDE" dejarHueco="false">
                                        <td class="titulocaja" colspan="2">
                                            <span id="TTIPIDE_TOMADOR">
                                                <c:choose>
                                                    <c:when test="${!empty __formdata.obtomador.TTIPIDE}">
                                                        <b>${__formdata.obtomador.TTIPIDE}</b>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <b><axis:alt f="${pantalla}" c="NNUMIDE" lit="105330"/></b>
                                                    </c:otherwise>
                                                </c:choose>
                                            </span>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="${pantalla}" c="TNOMBRE" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b><axis:alt f="${pantalla}" c="TNOMBRE" lit="105940"/></b>
                                        </td>
                                    </axis:ocultar>
                                    <%--INI IAXIS-2085 03/04/2019 AP--%>
                                    <td>
                                    <axis:ocultar f="${pantalla}" c="td_CAGRUPA" dejarHueco="false">
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="${pantalla}" c="td_CAGRUPA" lit="111471"/></b>
                                        </td>
                                    </axis:ocultar>
                                    </td>
                                    <%--INI IAXIS-2085 03/04/2019 AP--%>
                                </tr>
                                <tr>
                                    <axis:ocultar f="${pantalla}" c="NNUMIDE" dejarHueco="false">
                                        <td class="campocaja" colspan="2" >
                                            <input type="text"
                                                   class="campowidthinput campo campotexto"
                                                   id="NNUMIDE" name="NNUMIDE"
                                                   size="15"
                                                   value="${__formdata.obtomador.NNUMIDE}"
                                                   style="width:85%;"
                                                   <axis:atr f="${pantalla}" c="NNUMIDE" a="modificable=false"/>/>
                                            <c:set var="canModify">
                                                ${!empty __formdata.obtomador.SPERSON ? "visible" : "hidden"}
                                            </c:set>
                                            <axis:visible f="${pantalla}"
                                                          c="BT_EDITAR_PER">                                                <a id="tomadores_abrir_axisper005_a"
                                                   style="visibility:${canModify}"
                                                   href="javascript:f_abrir_axisper005('f_aceptar_tomadores_axisper005')"><img border="0"
                                                         alt='<axis:alt f="${pantalla}" c="ICO_EDIT_PER" lit="1000214"/>'
                                                         title='<axis:alt f="${pantalla}" c="ICO_EDIT_PER" lit="1000214"/>'
                                                         src="images/lapiz.gif"/></a>    
                                            </axis:visible>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="${pantalla}" c="TNOMBRE" dejarHueco="false">
                                        <td class="campocaja" colspan="2">
                                            <input type="text"
                                                   style="width:92%;"
                                                   class="campowidthinput campo campotexto"
                                                   id="TNOMBRE" name="TNOMBRE"
                                                   size="15"
                                                   value="${__formdata.obtomador.TNOMBRE} ${__formdata.obtomador.TAPELLI1} ${__formdata.obtomador.TAPELLI2}"
                                                   <axis:atr f="${pantalla}" c="TNOMBRE" a="modificable=false"/>/>
                                        </td>
                                    </axis:ocultar>
                                    <%--INI IAXIS-2085 03/04/2019 AP--%>
                                    <axis:ocultar dejarHueco="false" f="axisctr002" c="CAGRUPA">
                                           <td id="CAGRUPA"><select title="<axis:alt f='axisctr002' c='CAGRUPA' lit='9908809' />" onchange="javascript:f_cambia_cagrupa(this)"
                                                  alt="<axis:alt f='axisctr002' c='CAGRUPA' lit='9908809' />" name="CAGRUPA" id="CAGRUPA" size="1"
                                                  class="campowidthselect campo campotexto_ob"
                                                  <axis:atr f="axisctr002" c="CAGRUPA" a="isInputText=false&modificable=true&obligatorio=true"/>>
                                                        <option value="<%= Integer.MIN_VALUE %>">
														-
														<axis:alt f="${pantalla}" c="SNV_COMBO" lit="108341"/>
														-
														</option>
                                                        <c:forEach var="area" items="${requestScope.LS_AGRUPACION}">
                                                               <option value="${area.CATRIBU}"
                                                                      <c:if test="${area.CATRIBU == __formdata.obtomador.CAGRUPA}">selected</c:if>>${area.TATRIBU}</option>
                                                        </c:forEach>
                                           </select></td>
                                    </axis:ocultar>
                                    <%--FIN IAXIS-2085 03/04/2019 AP --%>                                    
                                </tr>
                                <tr>
                                    <axis:ocultar f="${pantalla}" c="FNACIMI" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b id="label_FNACIMI"><axis:alt f="${pantalla}" c="FNACIMI" lit="1000064"/></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="${pantalla}" c="CSEXO" dejarHueco="false">
                                        <td class="titulocaja" id="tit_CSEXO">
                                            <b id="label_CSEXO"><axis:alt f="${pantalla}" c="CSEXO" lit="100962"/></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="${pantalla}" c="CDOMICI" dejarHueco="false">
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="${pantalla}" c="CDOMICI" lit="101078"/></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="${pantalla}" c="SNIP" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b><axis:alt f="${pantalla}" c="SNIP" lit="1000088"/></b>
                                        </td>
                                    </axis:ocultar>
                                </tr>
                                <tr>
                                    <axis:ocultar f="${pantalla}" c="FNACIMI" dejarHueco="false">
                                        <td class="campocaja">
                                            <input type="text" style="width:76%"
                                                   class="campowidthinput campo campotexto"
                                                   id="FNACIMI" name="FNACIMI"
                                                   size="15"
                                                   value="<fmt:formatDate value='${__formdata.obtomador.FNACIMI}' pattern='dd/MM/yyyy'/>"
                                                   <axis:atr f="${pantalla}" c="FNACIMI" a="modificable=false&formato=fecha"/>/>
                                        </td>
                                    </axis:ocultar>
                                    <!-- INI-IAXIS-2065 CES 05/04/2019 -->
                                    <axis:visible f="${pantalla}" c="CSEXO">
                                        <td class="campocaja" id="td_CSEXO">                                            
                                            <input type="text" name="CSEXO" 
											   id="CSEXO" value="${__formdata.obtomador.TSEXPER}" class="campowidthinput campo campotexto" 
											   style="width: 90%;" <axis:atr f="${pantalla}" c="CSEXO" a="modificable=false&obligatorio=false"/>	
											   alt="<axis:alt f="${pantalla}" c="CSEXO" lit="100962" />" 
								               title="<axis:alt f="${pantalla}" c="CSEXO" lit="100962" />" />
                                        </td>
                                    </axis:visible>
                                    <!-- END-IAXIS-2065 CES 05/04/2019 -->
                                    <axis:ocultar f="${pantalla}" c="CDOMICI" dejarHueco="false">
                                        <td class="campocaja" colspan="2" style="white-space:nowrap;">   
                                            <select name="domicilio"
                                                    <axis:atr f="${pantalla}" c="CDOMICI" a="obligatorio=true&isInputText=false"/>
                                                    style="width: 280px;"
                                                    id="domicilio" size="1"
                                                    onchange="javascript:f_cambia_domicilio_tom(this)"                                                    
                                                    class="campowidthselect campo campotexto">
                                              
                                                <%--c:if test="${fn:length(sessionScope.axisctr_tomador.T_DOMICILIOS) > 1 || empty sessionScope.axisctr_tomador.T_DOMICILIOS}"--%>
                                                   <c:if test="${empty __formdata.CDOMICI}">
                                                    <option value="<%= Integer.MIN_VALUE %>">
                                                        -
                                                        <axis:alt f="${pantalla}" c="SNV_COMBO" lit="108341"/>
                                                        -
                                                    </option>
                                                </c:if>
                                                <c:forEach var="domicilio"
                                                           items="${__formdata.lstdomicilios}"
                                                           varStatus="status">
                                                    <option value="${domicilio.CDOMICI}"
                                                            <c:if test="${domicilio.CDOMICI == __formdata.CDOMICI}">selected</c:if>>
																<c:if test="${sessionScope.__locale == 'en_US' || sessionScope.__locale == 'hr_HR'}">
																														${domicilio.TDOMICI}
																														${domicilio.TPOBLAC}
																														${domicilio.CPOSTAL}
																</c:if>
																<c:if test="${sessionScope.__locale != 'en_US' && sessionScope.__locale != 'hr_HR'}">
																														${domicilio.TDOMICI}
																														${domicilio.CPOSTAL}
																														${domicilio.TPOBLAC}
																</c:if>
                                                    </option>
                                                </c:forEach>
                                            </select> <axis:visible f="${pantalla}"
                                                          c="BT_EDITAR_DOMICILIO"><a id="tomadores_abrir_axisper006_a"
                                                   href="javascript:f_abrir_axisper006_tom('f_aceptar_tomadores_axisper006')"><img border="0"
                                                        style="visibility:${canModify}"
                                                         alt='<axis:alt f="${pantalla}" c="ICO_EDIT_DOMI" lit="1000069"/>'
                                                         title='<axis:alt f="${pantalla}" c="ICO_EDIT_DOMI" lit="1000069"/>'
                                                         src="images/lapiz.gif"/></a></axis:visible>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="${pantalla}" c="SNIP" dejarHueco="false">
                                        <td class="campocaja">
                                            <input type="text" style="width:50%"
                                                   class="campowidthinput campo campotexto"
                                                   id="SNIP" name="SNIP"
                                                   size="15"
                                                   value="${__formdata.obtomador.SNIP}"
                                                   <axis:atr f="${pantalla}" c="SNIP" a="modificable=false"/>/>
                                        </td>
                                    </axis:ocultar>
                                </tr>
								<tr>
									<axis:ocultar dejarHueco="false" f="${pantalla}" c="TCIUDAD">
										<td><b><axis:alt f="${pantalla}" c="TCIUDAD" lit="9908410"></axis:alt></b><br /> <input
											type="text" name="TCIUDAD" id="TCIUDAD" value="${__formdata.OB_IAX_DIRECCIONES.TPOBLAC}"
											class="campowidthinput campo campotexto" style="width: 90%;"
											<axis:atr f="${pantalla}"
												c="TCIUDAD" a="modificable=false&obligatorio=false" />
											alt="<axis:alt f="${pantalla}"
												c="TCIUDAD" lit="9908410" />"
											title="<axis:alt f="${pantalla}" c="TCIUDAD"
												lit="9908410" />" /></td>
									</axis:ocultar>


									<axis:ocultar dejarHueco="false" f="${pantalla}" c="TTELEFONO">
										<td><b><axis:alt f="${pantalla}" c="TTELEFONO" lit="9909813"></axis:alt></b><br /> <input
											type="text" name="TTELEFONO" id="TTELEFONO"
											value="${__formdata.OB_IAX_CONTACTOS_TEL.TVALCON}"
											class="campowidthinput campo campotexto" style="width: 90%;"
											<axis:atr f="${pantalla}" c="TTELEFONO" a="modificable=false&obligatorio=false"/>
											alt="<axis:alt f="${pantalla}" c="TTELEFONO" lit="9909813" />"
											title="<axis:alt f="${pantalla}" c="TTELEFONO" lit="9909813" />" /></td>
									</axis:ocultar>

									<axis:ocultar dejarHueco="false" f="${pantalla}" c="TCORREOELEC">
										<td><b><axis:alt f="${pantalla}" c="TCORREOELEC" lit="9905728"></axis:alt></b><br />
											<input type="text" name="TCORREOELEC" id="TCORREOELEC"
											value="${__formdata.OB_IAX_CONTACTOS_EMA.TVALCON}"
											class="campowidthinput campo campotexto" style="width: 90%;"
											<axis:atr f="${pantalla}" c="TCORREOELEC" a="modificable=false&obligatorio=false"/>
											alt="<axis:alt f="${pantalla}" c="TCORREOELEC" lit="9905728" />"
											title="<axis:alt f="${pantalla}" c="TCORREOELEC" lit="9905728" />" /></td>
									</axis:ocultar>
								</tr>
							</table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!-- Start-4321 ON 07/04/2019-->
    <c:if test="${param.multiPantalla != 'true'}">
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr002</c:param>
            <c:param name="__botones">cancelar,anterior,siguiente</c:param>
        </c:import>
    </c:if>
<!-- End IAxis-4321 ON 07/04/2019-->
</form>
