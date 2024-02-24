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
        <c:set var="pantalla" value="axisctr175"/>
        <c:set var="literalPantalla" value="9902530"/>

    </c:otherwise>
</c:choose>

<c:import url="../include/precargador_ajax.jsp">
    <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
</c:import>

<form name="axisctr175Form" action="" method="POST">
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr175" c="INTERMEDIARIOS_TIT" lit="9902530"/></c:param>
        <c:param name="nid" value="axisctr014" />
    </c:import>

    <c:if test="${param.multiPantalla != 'true'}">
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisctr175" c="CORRET_PAN_TIT" lit="1000214"/></c:param>
            <c:param name="nid" value="axisper005" />
        </c:import>
    </c:if>
    <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axisctr175" c="imprimir" lit="1000205"/></c:param>
    </c:import>    
    <input type="hidden" name="operation" value=""/>    
    <input type="hidden" name="INTERM" id="INTERM" value=""/>
    <input type="hidden" name="INTERM2MODIFY" id="INTERM2MODIFY" value=""/>
    <input type="hidden" name="CAGENTE" id="CAGENTE" value="${__formdata.CAGENTE}"/>
    <input type="hidden" name="CINTERMEDIARIO" id="CINTERMEDIARIO" value="${__formdata.CINTERMEDIARIO}"/>
    
    <c:if test="${param.multiPantalla != 'true'}">
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="modalidad"><axis:alt f="axisctr175" c="INTERMED_MODALIDAD" lit="101110"/></c:param>
            <c:param name="titulo"></c:param>
            <c:param name="formulario"><axis:alt f="axisctr175" c="INTERMEDIARIO" lit="${literalPantalla}"/></c:param>
            <c:param name="form">${pantalla}</c:param>
        </c:import>
    </c:if>
    
<!-- Area de campos  -->

    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td>     
        <div class="titulo"><img src="images/flecha.gif"/>
        <b><axis:alt f="axisctr175" c="LISTACORRETAJE" lit="9902364"></axis:alt></b>
        </div>
        <!--campos-->
         <table class="seccion">
            <tr>
                <td>
                    <table class="area" align="center">
                    <tr>
                    <td>
                    <c:set var="title1">
                        <axis:alt f="axisctr175" c="CAGENTE" lit="9902363"></axis:alt>
                    </c:set>                        
                    <c:set var="title5">
                        <axis:alt f="axisctr175" c="TSUCURSAL" lit="9002202"></axis:alt>
                    </c:set>                       
                    <c:set var="title2">
                        <axis:alt f="axisctr175" c="PCOMISI" lit="9001923"></axis:alt>
                    </c:set>                       
                    <c:set var="title3">
                        <axis:alt f="axisctr175" c="PPARTICI" lit="104818"></axis:alt>
                    </c:set>                       
                    <c:set var="title4">
                        <axis:alt f="axisctr175" c="ISLIDER" lit="9902425"></axis:alt>
                    </c:set>                       
                    
                    
                    <div class="displayspace">
                        <display:table name="${sessionScope.axisctr_corretaje}" id="axisctr_corretaje" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                         requestURI="axis_${pantalla}.do?ordenar=true&tabla=axisctr_corretaje&campo=TNOMBRE&outerMap=OB_IAX_CORRETAJE">
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="" sortProperty="NORDAGE" sortable="false" headerClass="headwidth5 sortable" media="html" autolink="false" >                                                            
                                <div class="dspIcons"><input <c:if test="${!empty __formdata.CAGENTE && __formdata.CAGENTE == axisctr_corretaje.OB_IAX_CORRETAJE.CAGENTE}">checked</c:if> onClick="javascript:f_selecciona_intermediario('${axisctr_corretaje.OB_IAX_CORRETAJE.CAGENTE}', this)" value="${axisctr_corretaje.OB_IAX_CORRETAJE.CAGENTE}" type="radio" id="radioIntermediario" name="radioIntermediario"/></div>
                                <input type="hidden" name="NIF" id="NIF" value="axisctr_corretaje.OB_IAX_CORRETAJE.NNUMIDE"/>
                                <input type="hidden" name="NOM" id="NOM" value="${axisctr_corretaje.OB_IAX_CORRETAJE.TNOMBRE} ${axisctr_corretaje.OB_IAX_CORRETAJE.TAPELLI1} ${axisctr_corretaje.OB_IAX_CORRETAJE.TAPELLI2}"/>
                            </display:column>
                            <display:column title="${title1}" sortable="true" sortProperty="TAGENTE" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">${axisctr_corretaje.OB_IAX_CORRETAJE.TAGENTE} </div>
                            </display:column>
                            <display:column title="${title5}" sortable="true" sortProperty="TSUCURSAL" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">${axisctr_corretaje.OB_IAX_CORRETAJE.TSUCURSAL} </div>
                            </display:column>
                            <display:column  title="${title2}" sortable="true" sortProperty="PCOMISI" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspNumber"><fmt:formatNumber pattern="###,##0.00" value="${axisctr_corretaje.OB_IAX_CORRETAJE.PCOMISI}" /></div>                                
                            </display:column>
                            <display:column title="${title3}" sortable="true" sortProperty="PPARTICI" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspNumber"><fmt:formatNumber pattern="###,##0.00" value="${axisctr_corretaje.OB_IAX_CORRETAJE.PPARTICI}" /></div>
                            </display:column>
                            <display:column title="${title4}" sortable="true" sortProperty="ISLIDER" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                 <input disabled type="checkbox" 
                                                             <c:if test="${axisctr_corretaje.OB_IAX_CORRETAJE.ISLIDER == '1'}">checked="checked"</c:if>
                                                             name="LIDER" id="LIDER"                                                             
                                                           value="axisctr_corretaje.OB_IAX_CORRETAJE.ISLIDER"/>
                                </div>
                            </display:column>
                            <axis:visible f="axisctr175" c="BT_MODIF_CORR">
                            <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                <div class="dspIcons"><a href="javascript:f_but_modificar_corretaje('${axisctr_corretaje.OB_IAX_CORRETAJE.CAGENTE}')">
                                <img border="0" alt = "<axis:alt f="axisctr175" c="INTERMEDIARIO" lit="9902529"/>" src="images/lapiz.gif"/></a></div>                                
                                
                            </display:column>       
                            </axis:visible >
                            <axis:visible  f="axisctr175" c="BT_DEL_CORR">
                            <display:column title=" " headerClass="headwidth5 sortable" media="html" autolink="false" >
                                <div class="dspIcons"><a href="javascript:f_borrar_intermediario('${axisctr_corretaje.OB_IAX_CORRETAJE.NORDAGE}','${axisctr_corretaje.OB_IAX_CORRETAJE.CAGENTE}', this)"><img border="0" alt="<axis:alt f="axisctr175" c="BT_DEL_CORR" lit="1000127"/>" title="<axis:alt f="axisctr175" c="BT_DEL_CORR" lit="1000127"/>" src="images/delete.gif"/></a></div>
                            </display:column>
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
                    <axis:visible f="axisctr175" c="BT_NOU_CORR"> 
                      <input type="button" class="boton" id="but_anadir_corretaje" value="<axis:alt f="axisctr175" c="BT_NOU_CORR" lit="9905791"/>" onclick="f_but_anadir_corretaje()" />                      
                    </axis:visible>
               </td>    
                
            </tr>
            <!-- Sub-Seccion datos asgurado -->
            <tr>
                        <td colspan="2" align="left">
                              <div class="titulo" style="margin-left:10px;font-size: 11px;width:98%"><img src="images/flecha.gif"/> <axis:alt f="axisctr175" c="DATOS_CORRETAJE" lit="9902363"/></div>
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
                            <axis:ocultar f="axisctr175" c="NNUMIDE" dejarHueco="false"> 
                                <td class="titulocaja" colspan="2">                                    
                                    <b><axis:alt f="axisctr175" c="NNUMIDE" lit="105330"/></b>
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisctr175" c="TNOMBRE" dejarHueco="false"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr175" c="TNOMBRE" lit="105940"/></b>
                                </td>
                            </axis:ocultar>
     
                        </tr>
                        <tr>
                            <axis:ocultar f="axisctr175" c="NNUMIDE" dejarHueco="false"> 
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" id="NNUMIDE" name="NNUMIDE" size="15"
                                    value="${sessionScope.axisctr_corretaj.NNUMIDE}" style="width:87%"
                                    <axis:atr f="axisctr175" c="NNUMIDE" a="modificable=false"/>/>                                    
                               </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisctr175" c="TNOMBRE" dejarHueco="false"> 
                                <td class="campocaja" colspan="3">
                                    <input type="text"  style="width:98.5%" class="campowidthmedium campo campotexto" id="TNOMBRE" name="TNOMBRE" size="15"
                                    value="${sessionScope.axisctr_corretaj.TAGENTE}" 
                                    <axis:atr f="axisctr175" c="TNOMBRE" a="modificable=false"/>/>
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
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr175</c:param>
            <c:param name="__botones">cancelar<axis:visible f="axisctr175" c="BT_ANT">,anterior</axis:visible>,siguiente</c:param>
        </c:import>
    </c:otherwise>
</c:choose>
</form>