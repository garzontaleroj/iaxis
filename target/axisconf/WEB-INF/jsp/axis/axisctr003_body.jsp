<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<c:choose>
    <c:when test="${param.multiPantalla == 'true'}">
        <c:set var="pantalla" value="axisctr026"/>
        <c:set var="literalPantalla" value="1000193"/>
    </c:when>
    <c:otherwise>
        <c:set var="pantalla" value="axisctr003"/>
        <c:set var="literalPantalla" value="100645"/>

    </c:otherwise>
</c:choose>

<c:import url="../include/precargador_ajax.jsp">
    <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
</c:import>

<form name="axisctr003Form" action="" method="POST">
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="${pantalla}" c="TIT_AXISPER001" lit="1000235" /></c:param>
        <c:param name="nid" value="axisper001" />
    </c:import>

    <c:if test="${param.multiPantalla != 'true'}">
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="${pantalla}" c="TIT_AXISPER005" lit="1000214" /></c:param>
            <c:param name="nid" value="axisper005" />
        </c:import>
    </c:if>
    <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="${pantalla}" c="TIT_AXISIMPRIMI" lit="1000205" /></c:param>
    </c:import>    
    <input type="hidden" name="operation" value=""/>    
    <input type="hidden" name="SPERSON_ASEG" id="SPERSON_ASEG" value="${__formdata.SPERSON_ASEG}"/>
    <input type="hidden" name="SPERSON_ASEG2MODIFY" id="SPERSON_ASEG2MODIFY" value="${__formdata.SPERSON_ASEG2MODIFY}"/>
    <input type="hidden" name="axisctr_multi_registro_asegurados" id="axisctr_multi_registro_asegurados" value="${__formdata.axisctr_multi_registro_asegurados}"/>
    <input type="hidden" name="axisctr_aseg_no_riesgo" id="axisctr_aseg_no_riesgo" value="${__formdata.axisctr_aseg_no_riesgo}"/>
    <input type="hidden" name="abrir_axisper001" id="abrir_axisper001" value="${__formdata.abrir_axisper001}"/>
    <input type="hidden" name="NRIESGO" id="NRIESGO" value="${__formdata.NRIESGO}"/>
    
	<input type="hidden" name="MASASE" id="MASASE" value="${__formdata.MASASE}"/><!-- BARTOLO -->
	
    <c:if test="${param.multiPantalla != 'true'}">
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="modalidad"><axis:alt f="${pantalla}" c="TIT_FORM" lit="101110" />
             <axis:visible f="${pantalla}" c="NPOLIZA"> 
             <axis:alt f="axisctr003" c="TITULO_FORM" lit="101779"/> 
             <axis:alt f="axisctr003" c="TITULO_FORM" lit="102707"/> ${__formdata.NPOLIZA}
             </axis:visible>
             <axis:visible f="axisctr003" c="PTMOTMOV"> ${__formdata.PTMOTMOV}
             </axis:visible>
            </c:param>
            <c:param name="titulo"></c:param>
            <c:param name="formulario"><axis:alt f="${pantalla}" c="ASEGURADO" lit="${literalPantalla}"/></c:param>
            <c:param name="form">${pantalla}</c:param>
        </c:import>
    </c:if>
    
<!-- Area de campos  se añade más aseg no riesgo-->
<c:if test="${param.multiPantalla != 'true' || __formdata.axisctr_multi_registro_asegurados != 1 || __formdata.axisctr_aseg_no_riesgo == 1 || __formdata.MASASE == 1}">
<!-- Si PAC_IAXPAR_PRODUCTOS__F_PERMITIRMULTIASEG == 1 y estamos en multi-pantalla, no mostrar asegurados -->
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0" <c:if test="${param.multiPantalla == 'true'}">style="height:200px;"</c:if>>
    <tr>
      <td>
        <div class="titulo"><img src="images/flecha.gif"/>
        <b><axis:alt f="${pantalla}" c="LISTAASEGURADO" lit="1000274"></axis:alt></b>
        </div>
        <!--campos-->
         <table class="seccion">
            <tr>
                <td>
                    <table class="area" align="center">
                    <tr>
                    <td>
                    <!-- DisplayTag Asegurados -->
                    <c:set var="title1">
                        <axis:alt f="${pantalla}" c="ASEGURADO" lit="100645"></axis:alt>
                    </c:set>                    
                    
                    <c:set var="idAsegurado">${__formdata.obasegurado.SPERSON}</c:set>
                    <div class="displayspace">
                        <display:table name="${__formdata.axisctr_asegurados}" id="axisctr_asegurados" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                         requestURI="axis_${pantalla}.do?ordenar=true&tabla=axisctr_asegurados&campo=TNOMBRE&outerMap=OB_IAX_ASEGURADOS">
                            <%@ include file="../include/displaytag.jsp"%>

                            <display:column title="" sortProperty="SPERSON" sortable="false" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                <div class="dspIcons"><input <c:if test="${idAsegurado !='' && idAsegurado == axisctr_asegurados.OB_IAX_ASEGURADOS.SPERSON}">checked</c:if> onClick="javascript:f_selecciona_asegurado('${axisctr_asegurados.OB_IAX_ASEGURADOS.SPERSON}', this)" value="${axisctr_asegurados.OB_IAX_ASEGURADOS.SPERSON}" type="radio" id="radioAsegurado" name="radioAsegurado"/></div>
                            </display:column>

                            <display:column title="${title1}" sortable="true" sortProperty="TNOMBRE" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">${axisctr_asegurados.OB_IAX_ASEGURADOS.TNOMBRE} ${axisctr_asegurados.OB_IAX_ASEGURADOS.TAPELLI1} ${axisctr_asegurados.OB_IAX_ASEGURADOS.TAPELLI2}</div>
                            </display:column>
                            <c:choose>
                                <c:when  test="${!empty axisctr_asegurados.OB_IAX_ASEGURADOS.NRIESGO}">
                                    <axis:visible f="${pantalla}" c="BT_MODIF_ASEG">
                                    <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                        <c:if test="${empty axisctr_asegurados.permiteModificarAsegurado  ||  axisctr_asegurados.permiteModificarAsegurado == 0}">
                                            <div class="dspIcons"><a href="javascript:f_but_modificar_asegurado('${axisctr_asegurados.OB_IAX_ASEGURADOS.SPERSON}')">
                                            <img border="0" title="<axis:alt f="${pantalla}" c="MODASEGURADO" lit="1000293"/>"  alt = "<axis:alt f="${pantalla}" c="MODASEGURADO" lit="1000293"/>" src="images/find.gif"/></a></div>                                
                                        </c:if>
                                    </display:column>       
                                    </axis:visible >
                                    <axis:visible  f="${pantalla}" c="BT_DEL_ASEG">
                                    <display:column title=" " headerClass="headwidth5 sortable" media="html" autolink="false" >
                                        <c:if test="${ empty axisctr_asegurados.permiteModificarAsegurado  ||   axisctr_asegurados.permiteModificarAsegurado == 0}">
                                            <div class="dspIcons"><a href="javascript:f_borrar_asegurado('${axisctr_asegurados.OB_IAX_ASEGURADOS.SPERSON}','${axisctr_asegurados.OB_IAX_ASEGURADOS.NRIESGO}', this)"><img border="0" alt="<axis:alt f="${pantalla}" c="BT_DEL_ASEG" lit="1000127" />" title="<axis:alt f="${pantalla}" c="BT_DEL_ASEG" lit="1000127" />" src="images/delete.gif"/></a></div>
                                        </c:if>
                                    </display:column>
                                    </axis:visible >
                                </c:when>
                                <c:otherwise>
                                      <axis:visible f="${pantalla}" c="BT_MODIF_ASEG">
                                        <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                <div class="dspIcons"><a href="javascript:f_but_modificar_asegurado('${axisctr_asegurados.OB_IAX_ASEGURADOS.SPERSON}')">
                                                <img border="0" title="<axis:alt f="${pantalla}" c="MODASEGURADO" lit="1000293"/>"  alt = "<axis:alt f="${pantalla}" c="MODASEGURADO" lit="1000293"/>" src="images/find.gif"/></a></div>                                
                                        </display:column>       
                                        </axis:visible >
                                        <axis:visible  f="${pantalla}" c="BT_DEL_ASEG">
                                        <display:column title=" " headerClass="headwidth5 sortable" media="html" autolink="false" >
                                            <div class="dspIcons"><a href="javascript:f_borrar_asegurado('${axisctr_asegurados.OB_IAX_ASEGURADOS.SPERSON}', '${axisctr_asegurados.OB_IAX_ASEGURADOS.NRIESGO}',this)"><img border="0" alt="<axis:alt f="${pantalla}" c="BT_DEL_ASEG" lit="1000127" />" title="<axis:alt f="${pantalla}" c="BT_DEL_ASEG" lit="1000127" />" src="images/delete.gif"/></a></div>
                                        </display:column>
                                        </axis:visible >
                                </c:otherwise>
                            </c:choose>                                
                        </display:table>
                    </div>
                    </td>
                    </tr>
                    </table>
                </td>
            </tr>
           <tr>
               <td align="right" colspan="4">
                    <axis:visible f="${pantalla}" c="BT_NOU_ASEG"> <!-- TODO: C:but_anadir -->
                      <input type="button" class="boton" id="but_anadir_asegurado" value="<axis:alt f="${pantalla}" c="BT_NOU_ASEG" lit="100645"/>" onclick="f_but_anadir_asegurado()" />                      
                    </axis:visible>
               </td>    
                
            </tr>
            <!-- Sub-Seccion datos asgurado -->
            <tr>
                        <td colspan="2" align="left">
                              <div class="titulo" style="margin-left:10px;font-size: 11px;width:98%"><img src="images/flecha.gif"/> <axis:alt f="${pantalla}" c="DATOS_ASEGURADO" lit="100645"/></div>
                        </td>
            </tr>
            <tr>
                <td align="left">
                     <table class="area" align="center">
                         <tr>
                                <th style="width:12.5%;height:0px"></th>
                                <th style="width:9.5%;height:0px"></th>
                                <th style="width:19.5%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:12.5%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                
                        </tr>
                        <tr>
                            <axis:ocultar f="${pantalla}" c="NNUMIDE" dejarHueco="false"> 
                                <td class="titulocaja" colspan="2">
                                    <span id="TTIPIDE_ASEGURADO">
                                        <c:choose>
                                            <c:when test="${!empty __formdata.obasegurado.TTIPIDE}">
                                               <b>${__formdata.obasegurado.TTIPIDE}</b>
                                            </c:when>
                                            <c:otherwise>
                                                <b><axis:alt f="${pantalla}" c="TTIPIDE_ASEGURADO" lit="105330" /></b>
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="${pantalla}" c="TNOMBRE" dejarHueco="false"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="${pantalla}" c="TNOMBRE" lit="105940" /></b>
                                </td>
                            </axis:ocultar>
     
                        </tr>
                        <tr>
                            <axis:ocultar f="${pantalla}" c="NNUMIDE" dejarHueco="false"> 
                                <td class="campocaja" colspan="2"> 
                                    <input type="text" class="campowidthinput campo campotexto" id="NNUMIDE" name="NNUMIDE" size="15"
                                    value="${__formdata.obasegurado.NNUMIDE}" style="width:87%"
                                    <axis:atr f="${pantalla}" c="NNUMIDE" a="modificable=false"/>/>
                                    <c:set var="canModify">
                                        ${!empty __formdata.obasegurado.SPERSON ? "visible" : "hidden"}
                                    </c:set>
                                    <c:if test="${empty __formdata.obasegurado.permiteModificarAsegurado || __formdata.obasegurado.permiteModificarAsegurado == 0}">
                                        <axis:visible f="${pantalla}" c="BT_EDITAR_PER">
                                            <a id="asegurados_abrir_axisper005_a" style="visibility:${canModify}" href="javascript:f_abrir_axisper005('f_aceptar_asegurados_axisper005')"><img border="0" alt="<axis:alt f="${pantalla}" c="BT_EDITAR_PER" lit="1000214"/>" title="<axis:alt f="${pantalla}" c="BT_EDITAR_PER" lit="1000214"/>" src="images/lapiz.gif"/></a>
                                        </axis:visible>
                                    </c:if>
                               </td>
                            </axis:ocultar>
                            <axis:ocultar f="${pantalla}" c="TNOMBRE" dejarHueco="false"> 
                                <td class="campocaja" colspan="3">
                                    <input type="text"  style="width:98.5%" class="campowidthmedium campo campotexto" id="TNOMBRE" name="TNOMBRE" size="15"
                                    value="${__formdata.obasegurado.TNOMBRE} ${__formdata.obasegurado.TAPELLI1} ${__formdata.obasegurado.TAPELLI2}" 
                                    <axis:atr f="${pantalla}" c="TNOMBRE" a="modificable=false"/>/>
                                </td>
                            </axis:ocultar>
                                                        
                        </tr>
                        <tr>  
                            <axis:visible f="${pantalla}" c="FNACIMI">
                                <td class="titulocaja">
                                    <b><axis:alt f="${pantalla}" c="FNACIMI" lit="1000064" /></b>
                                </td>
                            </axis:visible>
                             <axis:ocultar f="${pantalla}" c="TSEXPER" dejarHueco="false"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="${pantalla}" c="TSEXPER" lit="100962" /></b>
                                </td>
                            </axis:ocultar>
                             <axis:ocultar f="${pantalla}" c="CDOMICI_ASEG" dejarHueco="false">
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="${pantalla}" c="CDOMICI" lit="101078"/></b>
                                        </td>
                              </axis:ocultar>
                             <axis:ocultar f="${pantalla}" c="SNIP" dejarHueco="false">
                                <td class="titulocaja">
                                     <b><axis:alt f="${pantalla}" c="SNIP" lit="1000088"/></b>
                                </td>
                            </axis:ocultar>  
                             <axis:ocultar f="${pantalla}" c="FCARNET" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="${pantalla}" c="FCARNET" lit="9001171" /></b>
                                </td>
                            </axis:ocultar> 
                            <axis:visible f="${pantalla}" c="FECRETROACT">
                                <td class="titulocaja">
                                    <b><axis:alt f="${pantalla}" c="FECRETROACT" lit="9903825" /></b>
                                </td>
                            </axis:visible>
                            <%--axis:ocultar f="${pantalla}" c="CTVINCULO" dejarHueco="false"> <!-- TODO: C:T_VINCULOS -->
                                <td class="titulocaja">
                                    <b><axis:alt f="${pantalla}" c="CTVINCULO" lit="1000383" /></b>
                                </td>
                            </axis:ocultar--%>                            

                            <td class="titulocaja"></td>
                        </tr>
                        <tr>
                         
                              <axis:visible f="${pantalla}" c="FNACIMI">
                                <td class="campocaja">
                                     <input type="text"  style="width:80%" class="campowidthinput campo campotexto" id="FNACIMI" name="FNACIMI" size="15"
                                    value="<fmt:formatDate value='${__formdata.obasegurado.FNACIMI}' pattern='dd/MM/yyyy'/>" 
                                    <axis:atr f="${pantalla}" c="FNACIMI" a="modificable=false&formato=fecha"/>/>
                                 </td>
                              </axis:visible> 
                              <axis:ocultar f="${pantalla}" c="TSEXPER" dejarHueco="false"> 
                                 <td class="campocaja">
                                     <input type="text" style="width:71%" class="campowidthinput campo campotexto" id="TSEXPER" name="TSEXPER" size="15"
                                    value="${__formdata.obasegurado.TSEXPER}"
                                    <axis:atr f="${pantalla}" c="TSEXPER" a="modificable=false"/>/>&nbsp;
                                  </td>                           
                              </axis:ocultar>
                              
                              <axis:ocultar f="${pantalla}" c="CDOMICI_ASEG" dejarHueco="false">
                                        <td class="campocaja" colspan="2" style="white-space:nowrap;">   
                                            <select name="domicilio"
                                                    <axis:atr f="${pantalla}" c="CDOMICI_ASEG" a="obligatorio=true&isInputText=false"/>
                                                    style="width: 280px;"
                                                    id="domicilio" size="1"
                                                    onchange="f_cambia_domicilio_aseg(this)"                                                    
                                                    class="campowidthselect campo campotexto">
                                              
                                                <%--c:if test="${fn:length(sessionScope.axisctr_tomador.T_DOMICILIOS) > 1 || empty sessionScope.axisctr_tomador.T_DOMICILIOS}"--%>
                                                   <c:if test="${empty __formdata.CDOMICI_ASEG}">
                                                    <option value="<%= Integer.MIN_VALUE %>">
                                                        -
                                                        <axis:alt f="${pantalla}" c="SNV_COMBO" lit="108341"/>
                                                        -
                                                    </option>
                                                </c:if>
                                                <c:forEach var="domicilio"
                                                           items="${__formdata.lstdomiciliosase}"
                                                           varStatus="status">
                                                    <option value="${domicilio.CDOMICI}"
                                                            <c:if test="${domicilio.CDOMICI == __formdata.CDOMICI_ASEG}">selected</c:if>>
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
                                                          c="BT_EDITAR_DOMICILIO"><a id="asegurados_abrir_axisper006_a"
                                                   onclick="f_abrir_axisper006('f_aceptar_asegurados_axisper006')"><img border="0"
                                                        style="visibility:${canModify}"
                                                         alt='<axis:alt f="${pantalla}" c="ICO_EDIT_DOMI" lit="1000069"/>'
                                                         title='<axis:alt f="${pantalla}" c="ICO_EDIT_DOMI" lit="1000069"/>'
                                                         src="images/lapiz.gif"/></a></axis:visible>
                                        </td>
                                    </axis:ocultar>
                             <axis:ocultar f="${pantalla}" c="SNIP" dejarHueco="false">
                                <td class="campocaja">                                     
                                    <input type="text" class="campowidthmedium campo campotexto" id="SNIP" name="SNIP" size="15"
                                    value="${__formdata.obasegurado.SNIP}" <axis:atr f="${pantalla}" c="SNIP" a="modificable=false"/>/>
                                </td>                           
                            </axis:ocultar>    
                            
                             <axis:ocultar f="${pantalla}" c="FCARNET" dejarHueco="false"> <!-- TODO: C:T_VINCULOS -->
                                <td class="campocaja">
                                    <select name = "FCARNET" id ="FCARNET" size="1"  class="campowidthselect campo campotexto"
                                     <axis:atr f="${pantalla}" c="FCARNET" a="modificable=false&isInputText=false"/>>&nbsp;
                                        <c:forEach var="percarnet" items="${__formdata.obasegurado.PERAUTCARNETS}">
                                            <option value = "${percarnet.OB_IAX_PERAUTCARNETS.FCARNET}" 
                                                <c:if test="${percarnet.OB_IAX_PERAUTCARNETS.CDEFECTO == 1 || percarnet.OB_IAX_PERAUTCARNETS.FCARNET == __formdata.FCARNET}">selected</c:if> >
                                                ${percarnet.OB_IAX_PERAUTCARNETS.TTIPCAR}  - <fmt:formatDate value='${percarnet.OB_IAX_PERAUTCARNETS.FCARNET}' pattern='dd/MM/yyyy'/>
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:ocultar>
                            
                            <axis:visible f="${pantalla}" c="FECRETROACT">
                                <td class="campocaja">
                                     <input type="text"  style="width:80%" class="campowidthinput campo campotexto" id="FECRETROACT" name="FECRETROACT" size="15" onchange="f_guarda_fecretroact()"
                                    value="<fmt:formatDate value='${__formdata.obasegurado.FECRETROACT}' pattern='dd/MM/yyyy'/>" 
                                    <axis:atr f="${pantalla}" c="FECRETROACT" a="modificable=true&formato=fecha"/>/>
                                    	<a style="vertical-align:middle;"><img
                                    id="icon_FECRETROACT" alt="<axis:alt f="${pantalla}" c="FECRETROACT" lit="9903825"/>" title="<axis:alt f="${pantalla}" c="FECRETROACT" lit="9903825" />" src="images/calendar.gif"/></a>
                                 </td>
                              </axis:visible> 
                            <%--axis:ocultar f="${pantalla}" c="CTVINCULOx" dejarHueco="false"> <!-- TODO: C:T_VINCULOS -->
                                <td class="campocaja">
                                    <select name = "CTVINCULO" id ="CTVINCULO" size="1" onchange = "f_cambia_vinculo_tomador(this)" class="campowidthselect campo campotexto_ob"
                                     <axis:atr f="${pantalla}" c="CTVINCULO" a="modificable=false&isInputText=false"/>>&nbsp;
                                        <option value="null"> - <axis:alt f="${pantalla}" c="SNV_COMBO" lit="108341"/> - </option>
                                        <c:forEach var="vinculo" items="${__formdata.obasegurado.T_VINCULOS}">
                                            <option value = "${vinculo.CODI}" 
                                                <c:if test="${vinculo.CODI == __formdata.obasegurado.CTVINCULO}">selected</c:if> >
                                                ${vinculo.TEXTE} 
                                            </option>
                                        </c:forEach>
                                    </select><a href="javascript:f_add_vinculo_tomador()" style="visibility:hidden"><img border="0" alt="<axis:alt f="${pantalla}" c="BT_VINC" lit="1000071"/>" title="<axis:alt f="${pantalla}" c="BT_VINC" lit="1000071"/>" src="images/new.gif"/></a>
                                </td>
                            </axis:ocultar--%>
                            
                            <td class="campocaja"></td>
                        </tr>
                        
                        <tr>
                        <axis:ocultar f="${pantalla}" c="CPAREN_ASEG" dejarHueco="false">
                            <td class="titulocaja" colspan="2">
                            <b><axis:alt f="${pantalla}" c="CPAREN_ASEG" lit="9902580"/></b>
                            </td>
                        </axis:ocultar>
                        </tr>
                        
                        <tr>
                        <axis:visible f="${pantalla}" c="CPAREN_ASEG">
                            <td class="campocaja" colspan="2">
                                <select name="CPARENTESCO" onchange= "f_guarda_fecretroact();" id="CPARENTESCO" class="campowidthselect campo campotexto"  
                                <axis:atr f="${pantalla}" c="CPARENTESCO" a="isInputText=false"/>>
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="${pantalla}" c="SNV_COMBO" lit="108341"/> - </option>
                                    <c:forEach items="${__formdata.lista_detvaloresparentesco}" var="item">
                                        <option value="${item.CATRIBU}" <c:if test="${__formdata.obasegurado.CPAREN == item.CATRIBU}">selected</c:if>>${item.TATRIBU}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </axis:visible>  
                        
                        </tr>
<!-- INI-IAXIS-2065 CES 05/04/2019 -->                        
                        <tr>
									<axis:ocultar dejarHueco="false" f="${pantalla}" c="TCIUDAD_ASE">
										<td><b><axis:alt f="${pantalla}" c="TCIUDAD_ASE" lit="9908410"></axis:alt></b><br /> <input
											type="text" name="TCIUDAD_ASE" id="TCIUDAD_ASE" value="${__formdata.OB_IAX_DIRECCIONES_ASE.TPOBLAC}"
											class="campowidthinput campo campotexto" style="width: 90%;"
											<axis:atr f="${pantalla}"
												c="TCIUDAD_ASE" a="modificable=false&obligatorio=false" />
											alt="<axis:alt f="${pantalla}"
												c="TCIUDAD_ASE" lit="9908410" />"
											title="<axis:alt f="${pantalla}" c="TCIUDAD_ASE"
												lit="9908410" />" /></td>
									</axis:ocultar>


									<axis:ocultar dejarHueco="false" f="${pantalla}" c="TTELEFONO_ASE">
										<td><b><axis:alt f="${pantalla}" c="TTELEFONO_ASE" lit="9909813"></axis:alt></b><br /> <input
											type="text" name="TTELEFONO_ASE" id="TTELEFONO_ASE"
											value="${__formdata.OB_IAX_CONTACTOS_TEL_ASE.TVALCON}"
											class="campowidthinput campo campotexto" style="width: 90%;"
											<axis:atr f="${pantalla}" c="TTELEFONO_ASE" a="modificable=false&obligatorio=false"/>
											alt="<axis:alt f="${pantalla}" c="TTELEFONO_ASE" lit="9909813" />"
											title="<axis:alt f="${pantalla}" c="TTELEFONO_ASE" lit="9909813" />" /></td>
									</axis:ocultar>

									<axis:ocultar dejarHueco="false" f="${pantalla}" c="TCORREOELEC_ASE">
										<td><b><axis:alt f="${pantalla}" c="TCORREOELEC_ASE" lit="9905728"></axis:alt></b><br />
											<input type="text" name="TCORREOELEC_ASE" id="TCORREOELEC_ASE"
											value="${__formdata.OB_IAX_CONTACTOS_EMA_ASE.TVALCON}"
											class="campowidthinput campo campotexto" style="width: 90%;"
											<axis:atr f="${pantalla}" c="TCORREOELEC_ASE" a="modificable=false&obligatorio=false"/>
											alt="<axis:alt f="${pantalla}" c="TCORREOELEC_ASE" lit="9905728" />"
											title="<axis:alt f="${pantalla}" c="TCORREOELEC_ASE" lit="9905728" />" /></td>
									</axis:ocultar>
								</tr>
<!-- END-IAXIS-2065 CES 05/04/2019 -->                                                
                    </table>
                </td>
            </tr>
      </table>
   
    </td>
    </tr>
    </table>
</c:if>
<c:choose>
    <c:when test="${param.multiPantalla == 'true' && param.existe187 != 'true' }">
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">${pantalla}</c:param>
            <c:param name="__botones">cancelar,siguiente</c:param>
        </c:import>
    </c:when>
    
     <c:when test="${param.multiPantalla != 'true' }">
           <c:import url="../include/botonera_nt.jsp"><c:param name="f">${pantalla}</c:param>
              <c:param name="__botones">cancelar<axis:visible f="${pantalla}" c="BT_ANT">,anterior</axis:visible>,siguiente</c:param>
           </c:import>
    </c:when>
    
    
    <%--c:otherwise>
        <!-- Botonera -->
        <c:if test="${param.existeMAS != 'true'}">
           <c:import url="../include/botonera_nt.jsp"><c:param name="f">${pantalla}</c:param>
              <c:param name="__botones">cancelar<axis:visible f="${pantalla}" c="BT_ANT">,anterior</axis:visible>,siguiente</c:param>
           </c:import>
        </c:if>
    </c:otherwise --%>
</c:choose>

</form>

<axis:visible f="${pantalla}" c="FECRETROACT">
<script type="text/javascript">
        Calendar.setup({
            inputField     :    "FECRETROACT",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FECRETROACT", 
            singleClick    :    true,
            firstDay       :    1
        });
        
 </script>     
 </axis:visible>  