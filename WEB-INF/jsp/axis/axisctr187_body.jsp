<%/* Revision:# JuscLg0DnH1K+PXJRxFX5w== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!-- f_cargar_propiedades_pantalla(); -->
<c:choose>
    <c:when test="${param.multiPantalla == 'true'}">
        <c:set var="pantalla" value="axisctr026"/>
        <c:set var="literalPantalla" value="9903385"/>
    </c:when>
    <c:otherwise>
        <c:set var="pantalla" value="axisctr187"/>
        <c:set var="literalPantalla" value="9903385"/>

    </c:otherwise>
</c:choose>

<c:import url="../include/precargador_ajax.jsp">
    <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
</c:import>

<form name="axisctr187Form" action="" method="POST">
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="${pantalla}" c="TIT_AXISPER001" lit="1000235" /></c:param>
        <c:param name="nid" value="axisper001" />
    </c:import>

    <c:if test="${param.multiPantalla != 'true'}">
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="${pantalla}" c="TIT_AXISPER005" lit="1000214" /></c:param>
            <c:param name="nid" value="axisper005" />
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="${pantalla}" c="TIT_AXISPER006" lit="1000215" /></c:param>
            <c:param name="nid" value="axisper006" />
        </c:import>
    </c:if>
    <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="${pantalla}" c="TIT_AXISIMPRIMI" lit="1000205" /></c:param>
    </c:import>    
    <input type="hidden" name="operation" value=""/>    
    <input type="hidden" name="SPERSON_GEST" id="SPERSON_GEST" value="${__formdata.SPERSON_GEST}"/>
    <input type="hidden" name="SPERSON_GEST2MODIFY" id="SPERSON_GEST2MODIFY" value="${__formdata.SPERSON_GEST2MODIFY}"/>
    
      <input type="hidden" name="axisctr_multi_registro_asegurados" id="axisctr_multi_registro_asegurados" value="${__formdata.axisctr_multi_registro_asegurados}"/>
   
    
    <c:if test="${param.multiPantalla != 'true'}">
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="modalidad"><axis:alt f="${pantalla}" c="TIT_FORM" lit="101110" /></c:param>
            <c:param name="titulo"></c:param>
            <c:param name="formulario"><axis:alt f="${pantalla}" c="ASEGURADO" lit="${literalPantalla}"/></c:param>
            <c:param name="form">${pantalla}</c:param>
        </c:import>
    </c:if>
    
<!-- Area de campos  -->

<!-- Si PAC_IAXPAR_PRODUCTOS__F_PERMITIRMULTIASEG == 1 y estamos en multi-pantalla, no mostrar asegurados -->
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0" <c:if test="${param.multiPantalla == 'true'}">style="height:200px;"</c:if>>
    <tr>
      <td>
        <div class="titulo"><img src="images/flecha.gif"/>
        <b><axis:alt f="${pantalla}" c="LISTAASEGURADO" lit="9903385"></axis:alt></b>
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
                        <axis:alt f="${pantalla}" c="ASEGURADO" lit="9903385"></axis:alt>
                    </c:set>                    
                    
                    <c:set var="idAsegurado">${__formdata.obgestor.SPERSON}</c:set>
                    <%--div class="displayspace">
                        <display:table name="${__formdata.axisctr_gestores}" id="axisctr_gestores" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                         requestURI="axis_${pantalla}.do?ordenar=true&tabla=axisctr_gestores&campo=TNOMBRE&outerMap=OB_IAX_ASEGURADOS">
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="" sortProperty="SPERSON" sortable="false" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                <div class="dspIcons"><input <c:if test="${idAsegurado !='' && idAsegurado == axisctr_gestores.OB_IAX_ASEGURADOS.SPERSON}">checked</c:if> onClick="javascript:f_selecciona_asegurado('${axisctr_gestores.OB_IAX_ASEGURADOS.SPERSON}', this)" value="${axisctr_gestores.OB_IAX_ASEGURADOS.SPERSON}" type="radio" id="radioAsegurado" name="radioAsegurado"/></div>
                            </display:column>
                            <display:column title="${title1}" sortable="true" sortProperty="TNOMBRE" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">${axisctr_gestores.OB_IAX_ASEGURADOS.TNOMBRE} ${axisctr_gestores.OB_IAX_ASEGURADOS.TAPELLI1} ${axisctr_gestores.OB_IAX_ASEGURADOS.TAPELLI2}</div>
                            </display:column>
                            <axis:visible f="${pantalla}" c="BT_MODIF_ASEG">
                            <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                <div class="dspIcons"><a href="javascript:f_but_modificar_asegurado('${axisctr_gestores.OB_IAX_ASEGURADOS.SPERSON}')">
                                <img border="0" title="<axis:alt f="${pantalla}" c="MODASEGURADO" lit="1000293"/>"  alt = "<axis:alt f="${pantalla}" c="MODASEGURADO" lit="1000293"/>" src="images/find.gif"/></a></div>                                
                                
                            </display:column>       
                            </axis:visible >
                            <axis:visible  f="${pantalla}" c="BT_DEL_ASEGx">
                            <display:column title=" " headerClass="headwidth5 sortable" media="html" autolink="false" >
                                <div class="dspIcons"><a href="javascript:f_borrar_asegurado('${axisctr_gestores.OB_IAX_ASEGURADOS.SPERSON}', this)"><img border="0" alt="<axis:alt f="${pantalla}" c="BT_DEL_ASEG" lit="1000127" />" title="<axis:alt f="${pantalla}" c="BT_DEL_ASEG" lit="1000127" />" src="images/delete.gif"/></a></div>
                            </display:column>
                            </axis:visible >
                        </display:table>
                    </div--%>
                    </td>
                    </tr>
                    </table>
                </td>
            </tr>
           <!--tr>
               <td align="right" colspan="4">
                    <axis:visible f="${pantalla}" c="BT_NOU_ASEG"> 
                      <input type="button" class="boton" id="but_anadir_asegurado" value="<axis:alt f="${pantalla}" c="BT_NOU_ASEG" lit="100645"/>" onclick="f_but_anadir_asegurado();" />    
                    </axis:visible>
               </td>    
                
            </tr-->
            <!-- Sub-Seccion datos asgurado -->
            <%--tr>
                        <td colspan="2" align="left">
                              <div align="right"><a id="gestores_abrir_axisper001_b" <c:if test="${__formdata.obgestor.NNUMIDE!=null && __formdata.obgestor.NNUMIDE!='' }">style="visibility:hidden"</c:if> href="javascript:f_abrir_axisper001_gestores();" ><img border="0" src="images/new.gif" /></a><img  src="images/delete.gif" onclick="javascript:borrar_gestor();" /></div>
                              <div class="titulo" style="margin-left:10px;font-size: 11px;width:98%"><img src="images/flecha.gif"/> <axis:alt f="${pantalla}" c="DATOS_ASEGURADO" lit="1000566"/></div>
                        </td>
            </tr--%>
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
                                    <span id="TTIPIDE_GESTOR">
                                        <c:choose>
                                            <c:when test="${!empty __formdata.obgestor.TTIPIDE}">
                                               <b>${__formdata.obgestor.TTIPIDE}</b>
                                            </c:when>
                                            <c:otherwise>
                                                <b><axis:alt f="${pantalla}" c="TTIPIDE_GESTOR" lit="105330" /></b>
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
                                    value="${__formdata.obgestor.NNUMIDE}" style="width:87%"
                                    <axis:atr f="${pantalla}" c="NNUMIDE" a="modificable=false"/>/>
                                    <c:set var="canModify">
                                        ${!empty __formdata.obgestor.SPERSON ? "visible" : "hidden"}
                                    </c:set>
                                    <axis:visible f="${pantalla}" c="BT_EDITAR_PER">
                                        <a id="asegurados_abrir_axisper005_a" style="visibility:${canModify}" href="javascript:f_abrir_axisper005('f_aceptar_gestores_axisper005')"><img border="0" alt="<axis:alt f="${pantalla}" c="BT_EDITAR_PER" lit="1000214"/>" title="<axis:alt f="${pantalla}" c="BT_EDITAR_PER" lit="1000214"/>" src="images/lapiz.gif"/></a>
                                    </axis:visible>
                               </td>
                            </axis:ocultar>
                            <axis:ocultar f="${pantalla}" c="TNOMBRE" dejarHueco="false"> 
                                <td class="campocaja" colspan="3">
                                    <input type="text"  style="width:98.5%" class="campowidthmedium campo campotexto" id="TNOMBRE" name="TNOMBRE" size="15"
                                    value="${__formdata.obgestor.TNOMBRE} ${__formdata.obgestor.TAPELLI1} ${__formdata.obgestor.TAPELLI2}" 
                                    <axis:atr f="${pantalla}" c="TNOMBRE" a="modificable=false"/>/>
                                </td>
                            </axis:ocultar>
                                                        
                        </tr>
                        <!--tr>  
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
                            <axis:ocultar f="${pantalla}" c="CTVINCULO" dejarHueco="false"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="${pantalla}" c="CTVINCULO" lit="1018783" /></b>
                                </td>
                            </axis:ocultar>                            

                            <td class="titulocaja"></td>
                        </tr-->
                       <tr>
                       <!-- INI-IAXIS-2065 CES 05/04/2019 -->
                                    <axis:ocultar f="${pantalla}" c="CDOMICI_GEST" dejarHueco="false">
                                        <td class="titulocaja" colspan="4">
                                            <b><axis:alt f="${pantalla}" c="CDOMICI_GEST" lit="101078"/></b>
                                        </td>
                                    </axis:ocultar>
                        <!-- END-IAXIS-2065 CES 05/04/2019 -->
                        </tr>
                        
                        <tr>
                            
                            <axis:ocultar f="${pantalla}" c="CDOMICI_GEST" dejarHueco="false">
                                        <td class="campocaja" colspan="4">   
                                                <select name="CDOMICI_GEST"
                                                    <axis:atr f="${pantalla}" c="CDOMICI_GEST" a="obligatorio=true&isInputText=false"/>
                                                    style="width:88%"
                                                    id="CDOMICI_GEST" size="1"
                                                    onchange="f_cambia_domicilio_gest()"                                                    
                                                    class="campowidthselect campo campotexto">
                                                &nbsp;
                                                <c:if test="${empty __formdata.CDOMICI_GEST &&  fn:length(__formdata.lstdomicilios_gestor) != 1 }">
                                                    <option value="<%= Integer.MIN_VALUE %>">
                                                        -
                                                        <axis:alt f="${pantalla}" c="SNV_COMBO" lit="108341"/>
                                                        -
                                                    </option>
                                                </c:if>
                                                <c:forEach var="domicilio_gest"
                                                           items="${__formdata.lstdomicilios_gestor}"
                                                           varStatus="status">
                                                    <option value="${domicilio_gest.CDOMICI}"
                                                            <c:if test="${domicilio_gest.CDOMICI == __formdata.CDOMICI_GEST ||( fn:length(__formdata.lstdomicilios_gestor) == 1 && domicilio_gest.CDOMICI !=null )}">selected</c:if>>
                                                        ${domicilio_gest.TDOMICI}
                                                        ${domicilio_gest.CPOSTAL}
                                                        ${domicilio_gest.TPOBLAC}
                                                        
                                                    </option>
                                                </c:forEach>
                                            </select>
                                            <axis:visible f="${pantalla}"
                                                          c="BT_EDITAR_DOMICILIO">
                                                          
                                                <c:if test="${__formdata.obgestor.NNUMIDE!=null && __formdata.obgestor.NNUMIDE!='' }">
                                                <a id="gestores_abrir_axisper006_a"
                                                   href="javascript:f_abrir_axisper006_gest('f_aceptar_gestores_axisper006')">
                                                    <img border="0"
                                                         alt='<axis:alt f="${pantalla}" c="ICO_EDIT_DOMI" lit="1000069"/>'
                                                         title='<axis:alt f="${pantalla}" c="ICO_EDIT_DOMI" lit="1000069"/>'
                                                         src="images/lapiz.gif"/>
                                                </a>
                                                </c:if>
                                            </axis:visible>
                                        </td>
                                    </axis:ocultar>
                        
                        </tr>
						
						 <!-- Botonera -->
                        <tr>
                     
                                <td align="right" colspan="6">
                                    <c:if test="${__formdata.obgestor.NNUMIDE==null || __formdata.obgestor.NNUMIDE=='' }">
                                    <axis:visible f="${pantalla}" c="BT_NOU_GEST"> 
                                      <input type="button" class="boton" id="but_anadir_gest" value="<axis:alt f="${pantalla}" c="BT_NOU_ASEG" lit="9903385"/>" onclick="javascript:f_abrir_axisper001_gestores();" />    
                                    </axis:visible>
                                   
                                    </c:if>
                                    <c:if test="${!empty __formdata.obgestor}">
                                    <axis:visible f="${pantalla}" c="BT_DEL_GEST"> 
                                      <input type="button" class="boton" id="but_del_gesto" value="<axis:alt f="${pantalla}" c="BT_NOU_ASEG" lit="9904087"/>" onclick="javascript:borrar_gestor();" />    
                                    </axis:visible>
                                    </c:if>
                               </td>  
                         </tr>
                        <!-- Botonera -->
						
						
						
						
                    </table>
                </td>
            </tr>
      </table>
   
    </td>
    </tr>
    </table>

<c:choose>
    <c:when test="${param.multiPantalla == 'true'}">
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">${pantalla}</c:param><c:param name="f">${pantalla}</c:param><c:param name="f">${pantalla}</c:param>
            <c:param name="__botones">cancelar,siguiente</c:param>
        </c:import>
    </c:when>
    <c:otherwise>
        <!-- Botonera -->
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">${pantalla}</c:param><c:param name="f">${pantalla}</c:param><c:param name="f">${pantalla}</c:param>
            <c:param name="__botones">cancelar<axis:visible f="${pantalla}" c="BT_ANT">,anterior</axis:visible>,siguiente</c:param>
        </c:import>
    </c:otherwise>
</c:choose>
</form>
