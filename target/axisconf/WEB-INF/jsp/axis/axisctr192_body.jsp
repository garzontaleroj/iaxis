<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<c:choose>
    <c:when test="${param.multiPantalla == 'true'}">
        <c:set var="pantalla" value="axisctr026"/>
        <c:set var="literalPantalla" value="9904182"/>
    </c:when>
    <c:otherwise>
        <c:set var="pantalla" value="axisctr192"/>
        <c:set var="literalPantalla" value="9904182"/>

    </c:otherwise>
</c:choose>

<c:import url="../include/precargador_ajax.jsp">
    <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
</c:import>

<form name="axisctr192Form" action="" method="POST">
    
    <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axisctr192" c="imprimir" lit="1000205"/></c:param>
    </c:import>    
    <input type="hidden" name="operation" value=""/>    
    <input type="hidden" name="BENEF" id="BENEF" value=""/>
    <input type="hidden" name="BENEF2MODIFY" id="BENEF2MODIFY" value=""/>
    <input type="hidden" name="CAGENTE" id="CAGENTE" value="${__formdata.CAGENTE}"/>
    <input type="hidden" name="SPERSON_SELECTED" id="SPERSON_SELECTED" value="${__formdata.SPERSON_SELECTED}"/>
    <input type="hidden" name="CBENEFICIARIO" id="CBENEFICIARIO" value="${__formdata.CBENEFICIARIO}"/>
	<input type="hidden" name="CTIPPER" id="CTIPPER" value="${datos_persona.CTIPPER}"/>
    <input type="hidden" name="TIENECONRET" id="TIENECONRET" value="${datos_persona.TIENECONRET}"/>
    
    <c:if test="${param.multiPantalla != 'true'}">
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="modalidad"><axis:alt f="axisctr192" c="BENEF_MODALIDAD" lit="101110"/></c:param>
            <c:param name="titulo"></c:param>
            <c:param name="formulario"><axis:alt f="axisctr192" c="BENEF" lit="${literalPantalla}"/></c:param>
            <c:param name="form">${pantalla}</c:param>
        </c:import>
    </c:if>
    
<!-- Area de campos  -->

    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td>     
        <div class="titulo"><img src="images/flecha.gif"/>
        <b><axis:alt f="axisctr192" c="LISTAretorno" lit="9904184"></axis:alt></b>
        </div>
        <!--campos-->
         <table class="seccion">
            <tr>
                <td>
                    <table class="area" align="center">
                    <tr>
                    <td> 
                    <c:set var="title1">
                        <axis:alt f="axisctr192" c="BENEFICIARIO" lit="9001911"></axis:alt>
                    </c:set>                        
                    <c:set var="title2">
                        %<axis:alt f="axisctr192" c="PPARTICI" lit="101467"></axis:alt>
                    </c:set>                       
                                      
                    
                    
                    <div class="displayspace">
                        <display:table name="${axisctr_retorno}" id="axisctr_retorno" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                         requestURI="axis_${pantalla}.do?ordenar=true&tabla=axisctr_retorno&campo=TNOMBRE&outerMap=OB_IAX_retorno">
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="" sortProperty="NORDAGE" sortable="false" headerClass="headwidth5 sortable" media="html" autolink="false" >                                                            
                                <div class="dspIcons"><input <c:if test="${empty __formdata.SPERSON_SELECTED || (__formdata.SPERSON_SELECTED == axisctr_retorno.OB_IAX_RETORNO.SPERSON ) }">checked</c:if> onClick="javascript:f_selecciona_beneficiario('${axisctr_retorno.OB_IAX_RETORNO.SPERSON}', this)" value="${axisctr_retorno.OB_IAX_RETORNO.SPERSON}" type="radio" id="radioBeneficiario" name="radioBeneficiario"/></div>
                            </display:column>
                            <display:column title="${title1}" sortable="true" sortProperty="TNOMBRE" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">${axisctr_retorno.OB_IAX_RETORNO.TNOMBRE}, ${axisctr_retorno.OB_IAX_RETORNO.TAPELLI1} ${axisctr_retorno.OB_IAX_retorno.TAPELLI2}</div>
                            </display:column>
                            <display:column title="${title2}" sortable="true" sortProperty="PPARTICI" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">${axisctr_retorno.OB_IAX_RETORNO.PRETORNO} </div>
                            </display:column>

                            <axis:visible f="axisctr192" c="BT_MODIF_RETORNO">
                            <c:if test="${__formdata.TIENECONRET == 0}">
                            <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                <div class="dspIcons"><a href="javascript:f_but_modificar_retorno('${axisctr_retorno.OB_IAX_RETORNO.SPERSON}','${axisctr_retorno.OB_IAX_RETORNO.NNUMIDE}','${axisctr_retorno.OB_IAX_RETORNO.PRETORNO}','${axisctr_retorno.OB_IAX_RETORNO.TNOMBRE}','${axisctr_retorno.OB_IAX_RETORNO.TAPELLI1}','${axisctr_retorno.OB_IAX_RETORNO.TAPELLI2}','${axisctr_retorno.OB_IAX_RETORNO.IDCONVENIO}')">
                                <img border="0" alt = "<axis:alt f="axisctr192" c="INTERMEDIARIO" lit="9001911"/>" src="images/find.gif"/></a></div>                                
                                
                            </display:column>       
                            </c:if>
                            </axis:visible >
                            <axis:visible  f="axisctr192" c="BT_DEL_RETORNO">
                            <c:if test="${__formdata.TIENECONRET == 0}">
                            <display:column title=" " headerClass="headwidth5 sortable" media="html" autolink="false" >
                                <div class="dspIcons"><a href="javascript:f_borrar_retorno('${axisctr_retorno.OB_IAX_RETORNO.SPERSON}')"><img border="0" alt="<axis:alt f="axisctr192" c="BT_DEL_RETORNO" lit="1000127"/>" title="<axis:alt f="axisctr192" c="BT_DEL_CORR" lit="1000127"/>" src="images/delete.gif"/></a></div>
                            </display:column>
                            </c:if>
                            </axis:visible >
                        </display:table>
                    </div>
                    </td>
                    </tr>
                    </table>
                </td>
            </tr>
           <tr>
               <td align="right" colspan="4">
                    <c:if test="${__formdata.TIENECONRET == 0}">
                    <axis:visible f="axisctr192" c="BT_NOU_BENE"> <!-- TODO: C:but_anadir -->
                      <input type="button" class="boton" id="but_anadir_retorno" value="<axis:alt f="axisctr192" c="BT_NOU_BENE" lit="9001911"/>" onclick="f_but_anadir_retorno()" />                      
                    </axis:visible>
                    </c:if>
               </td>    
                
            </tr>
            <!-- Sub-Seccion datos asgurado -->
            <tr>
                        <td colspan="2" align="left">
                              <div class="titulo" style="margin-left:10px;font-size: 11px;width:98%"><img src="images/flecha.gif"/> <axis:alt f="axisctr192" c="DATOS_RETORNO" lit="9001911"/></div>
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
                            <axis:ocultar f="axisctr192" c="NNUMIDE" dejarHueco="false"> 
                                <td class="titulocaja" colspan="2">                                    
                                    <b><axis:alt f="axisctr192" c="NNUMIDE" lit="105330"/></b>
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisctr192" c="TNOMBRE" dejarHueco="false"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr192" c="TNOMBRE" lit="105940"/></b>
                                </td>
                            </axis:ocultar>
     
                        </tr>
                        <tr>
                            <axis:ocultar f="axisctr192" c="NNUMIDE" dejarHueco="false"> 
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" id="NNUMIDE" name="NNUMIDE" size="15"
                                    value="${datos_persona.NNUMIDE}" style="width:87%"
                                    <axis:atr f="axisctr192" c="NNUMIDE" a="modificable=false"/>/>                                    
                               </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisctr192" c="TNOMBRE" dejarHueco="false"> 
                                <td class="campocaja" colspan="3">
                                    <input type="text"  style="width:98.5%" class="campowidthmedium campo campotexto" id="TNOMBRE" name="TNOMBRE" size="15"
                                    value="${datos_persona.TNOMBRE} ${datos_persona.TAPELLI1} ${datos_persona.TAPELLI2}" 
                                    <axis:atr f="axisctr192" c="TNOMBRE" a="modificable=false"/>/>
                                </td>
                            </axis:ocultar>
                                                        
                        </tr>   
                        <tr>
                            <axis:ocultar f="axisctr192" c="FNACIMI" dejarHueco="false"> 
                                <td class="titulocaja" id="tit_FNACIMI">                                    
                                    <b id="label_FNACIMI"><axis:alt f="axisctr192" c="FNACIMI" lit="1000064"/></b>
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisctr192" c="CSEXO" dejarHueco="false"> 
                                <td class="titulocaja" id="tit_CSEXO">
                                    <b id="label_CSEXO"><axis:alt f="axisctr192" c="CSEXO" lit="100962"/></b>
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisctr192" c="CDOMICI" dejarHueco="false"> 
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisctr192" c="CDOMICI" lit="101078"/></b>
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisctr192" c="SNIP" dejarHueco="false"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr192" c="SNIP" lit="1000088"/></b>
                                </td>
                            </axis:ocultar>
     
                        </tr>
                        <tr>
                            <axis:ocultar f="axisctr192" c="FNACIMI" dejarHueco="false">
                                        <td class="campocaja" id="td_FNACIMI">
                                            <input type="text" style="width:76%"
                                                   class="campowidthinput campo campotexto"
                                                   id="FNACIMI" name="FNACIMI"
                                                   size="15"
                                                   value="<fmt:formatDate value='${datos_persona.FNACIMI}' pattern='dd/MM/yyyy'/>"
                                                   <axis:atr f="${pantalla}" c="FNACIMI" a="modificable=false&formato=fecha"/>/>
                                        </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisctr192" c="CSEXO" dejarHueco="false">
                                        <td class="campocaja" id="td_CSEXO">
                                            <input type="text" style="width:74%"
                                                   class="campowidthinput campo campotexto"
                                                   id="CSEXO" name="CSEXO"
                                                   size="15"
                                                   value="${datos_persona.TSEXPER}"
                                                   <axis:atr f="${pantalla}" c="CSEXO" a="modificable=false"/>/>
                                        </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisctr192" c="CDOMICI" dejarHueco="false">
                                        <td class="campocaja" colspan="2">   
                                            <select name="domicilio"
                                                    <axis:atr f="axisctr192" c="CDOMICI" a="obligatorio=true&isInputText=false"/>
                                                    style="width:88%"
                                                    id="domicilio" size="1"
                                                    onchange=""                                                    
                                                    class="campowidthselect campo campotexto">
                                                
                                                <c:forEach var="domicilio"
                                                           items="${datos_persona.DIRECCIONES}"
                                                           varStatus="status">
                                                    <option value="${domicilio.OB_IAX_DIRECCIONES.CDOMICI}"
                                                            <c:if test="${domicilio.OB_IAX_DIRECCIONES.CDOMICI == __formdata.CDOMICI}">selected</c:if>>
                                                        ${domicilio.OB_IAX_DIRECCIONES.TDOMICI}
                                                        ${domicilio.OB_IAX_DIRECCIONES.CPOSTAL}
                                                        ${domicilio.OB_IAX_DIRECCIONES.TPOBLAC}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisctr192" c="SNIP" dejarHueco="false">
                                        <td class="campocaja">
                                            <input type="text" style="width:50%"
                                                   class="campowidthinput campo campotexto"
                                                   id="SNIP" name="SNIP"
                                                   size="15"
                                                   value="${datos_persona.SNIP}"
                                                   <axis:atr f="axisctr192" c="SNIP" a="modificable=false"/>/>
                                        </td>
                            </axis:ocultar>
                                                        
                        </tr>        
                    </table>
                </td>
            </tr>
      </table>
   
    </td>
    </tr>
    </table>
<c:choose>
    <c:when test="${param.multiPantalla == 'true'}">
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="__botones">cancelar,siguiente</c:param>
        </c:import>
    </c:when>
    <c:otherwise>
        <!-- Botonera -->
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr192</c:param>
            <c:param name="__botones">cancelar<axis:visible f="axisctr192" c="BT_ANT">,anterior</axis:visible>,siguiente</c:param>
        </c:import>
    </c:otherwise>
</c:choose>
</form>