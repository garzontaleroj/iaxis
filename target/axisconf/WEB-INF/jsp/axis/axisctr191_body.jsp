<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

 <c:set var="pantalla" value="axisctr191"/>

<c:import url="../include/precargador_ajax.jsp">
    <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
</c:import>

<form name="axisctr191Form" action="" method="POST">
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo">
            <axis:alt f="axisctr191" c="TITULO" lit="1000235"/>
        </c:param>
        <c:param name="nid" value="axisper001"/>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo">
            <axis:alt f="axisctr191" c="MDD_AXISPER005" lit="1000214"/>
        </c:param>
        <c:param name="nid" value="axisper005"/>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo">
            <axis:alt f="axisctr191" c="MDL_AXISPER006" lit="1000215"/>
        </c:param>
        <c:param name="nid" value="axisper006"/>
    </c:import>
    
    <input type="hidden" name="operation" value=""/>
    <input type="hidden" name="SPERSON_INQUI" id="SPERSON_INQUI" value="${__formdata.SPERSON_INQUI}"/>
    <input type="hidden" name="SPERSON_AVAL" id="SPERSON_AVAL" value="${__formdata.SPERSON_AVAL}"/>
    <input type="hidden" name="CTIPPER" id="CTIPPER" value="${__formdata.obtomador.CTIPPER}"/>
    <input type="hidden" name="CTIPFIG" id="CTIPFIG" value="${__formdata.CTIPFIG}"/>
     <input type="hidden" name="AUX_INQUI" id="AUX_INQUI" value=""/>
      <input type="hidden" name="AUX_AVAL" id="AUX_AVAL" value=""/>
      <input type="hidden" name="ANTIGUO_EX" id="ANTIGUO_EX" value=""/>
       <input type="hidden" name="ANTIGUO_EA" id="ANTIGUO_EA" value=""/>
    
    
    <input type="hidden" name="SPERSON_INQUI2MODIFY" id="SPERSON_INQUI2MODIFY" value=""/>
    <input type="hidden" name="SPERSON_AVA2MODIFY" id="SPERSON_AVA2MODIFY" value=""/>
   
    <input type="hidden" name="mensaje_a_mostrar" id="mensaje_a_mostrar" value=""/>
    
    
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="modalidad">
            <axis:alt f="axisctr191" c="TITULO_FORM" lit="101110"/>
        </c:param>
        <c:param name="formulario">
            ${literalPantalla}
        </c:param>
        <c:param name="form">
            ${pantalla}
        </c:param>
    </c:import>
    
    <!-- Area de campos  -->
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0" >
        <tr>
            <td>
                <div class="titulo">
                    <img src="images/flecha.gif"/><axis:alt f="axisctr191" c="LIT_PRIMER_SUBTITULO" lit="9903771"/>
                </div>
                <table class="seccion" align="center">
                    <%-- Inquilino --%>
                    <tr>
                        <td>
                            <table class="area" align="center">
                                <tr>
                                    <td>
                                        <!-- DisplayTag inquilinos -->
                                        <c:set var="title1">
                                            <axis:alt f="axisctr191" c="DSP_LIT_PRIMERA_COLUMNA" lit="9903773"/>
                                        </c:set>
                                        <c:set var="title2">
                                            <axis:visible f="axisctr191" c="SUPFILTRO">
                                                <axis:alt f="axisctr191" c="SUPFILTRO" lit="9903774"></axis:alt>
                                            </axis:visible>
                                        </c:set>
                                        <div class="separador">&nbsp;</div>
                                        <div class="displayspace">
                                            <c:set var="idInquilino"> ${__formdata.obinquilino.SPERSON} </c:set>
                                            <display:table name="${__formdata.axisctr_inquilinos}" id="axisctr_inquilinos" export="false"
                                                           class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending"
                                                           sort="list" cellpadding="0" cellspacing="0"
                                                           requestURI="axis_${pantalla}.do?ordenar=true&tabla=axisctr_inquilinos&campo=TNOMBRE&outerMap=OB_IAX_TOMADORES">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="" sortProperty="SPERSON" sortable="false" headerClass="headwidth5 sortable"
                                                                media="html" autolink="false">
                                                    <div class="dspIcons">
                                                        <input <c:if test="${idInquilino !='' && idInquilino == axisctr_inquilinos.OB_IAX_INQUIAVAL.SPERSON}">checked</c:if>
                                                               onclick="javascript:f_selecciona_inquilino('${axisctr_inquilinos.OB_IAX_INQUIAVAL.SPERSON}')"
                                                               value="${axisctr_inquilinos.OB_IAX_INQUIAVAL.SPERSON}"
                                                               type="radio" id="radioTomador" name="radioInquilino"/>
                                                    </div>
                                                </display:column>
                                                <display:column title="${title1}" sortable="true" sortProperty="TNOMBRE" headerClass="sortable" media="html" autolink="false">
                                                    <div class="dspText">
                                                        ${axisctr_inquilinos.OB_IAX_INQUIAVAL.TNOMBRE}
                                                         
                                                        ${axisctr_inquilinos.OB_IAX_INQUIAVAL.TAPELLI1}
                                                         
                                                        ${axisctr_inquilinos.OB_IAX_INQUIAVAL.TAPELLI2}
                                                    </div>
                                                </display:column>
                                                <axis:visible f="axisctr191" c="SUPERAFILTRO">
                                                    <display:column title="${title2}" sortable="false" sortProperty="superafiltro"
                                                                    headerClass="headwidth5 sortable" media="html" autolink="false">
                                                        <div class="dspIcons">
                                                            <input type="checkbox"
                                                                   <axis:atr f="axisctr191" c="SUPERAFILTRO" a="modificable=false"/>
                                                                   id="SUPERAFILTRO_${axisctr_inquilinos.OB_IAX_INQUIAVAL.SPERSON}"
                                                                   name="SUPERAFILTRO_${axisctr_inquilinos.OB_IAX_INQUIAVAL.SPERSON}"
                                                                   value="" disabled="true" checked="checked"  />
                                                        </div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible f="axisctr191"
                                                              c="BT_MODIF_INQUILINO">
                                                    <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false">
                                                        <div class="dspIcons">
                                                            <a href="javascript:f_but_modificar_inquilino('${axisctr_inquilinos.OB_IAX_INQUIAVAL.SPERSON}')">
                                                                <img border="0"
                                                                     alt='<axis:alt f="axisctr191" c="ICO_MOD_INQUILINO" lit="9903831"/>'
                                                                     title='<axis:alt f="axisctr191" c="ICO_MOD_INQUILINO" lit="9903831"/>'
                                                                     src="images/find.gif"/>
                                                            </a>
                                                        </div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible f="axisctr191"
                                                              c="BT_DEL_INQUILINO">
                                                    <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false">
                                                        <div class="dspIcons">
                                                            <a href="javascript:f_borrar_inquilino('${axisctr_inquilinos.OB_IAX_INQUIAVAL.SPERSON}', this)">
                                                                <img border="0"
                                                                     alt='<axis:alt f="axisctr191" c="ICO_DEL_INQUILINO" lit="1000127" />'
                                                                     title='<axis:alt f="axisctr191" c="ICO_DEL_INQUILINO" lit="1000127" />'
                                                                     src="images/delete.gif"/>
                                                            </a>
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
                    <tr>
                        <axis:visible f="axisctr191" c="BT_ANADIR_INQUILINO">
                            <td align="right">
                                <div class="separador">&nbsp;</div>
                                <input type="button" class="boton" id="but_anadir_inquilino" value='<axis:alt f="axisctr191" c="BT_ANADIR" lit="9903775"/>'
                                       onclick="f_abrir_axisper001_inquilinos()"/>
                            </td>
                        </axis:visible>
                    </tr>
                   <c:if test="${!empty __formdata.axisctr_inquilinos}">
                    <tr>
                        <td colspan="2" align="left">
                            <div class="titulo"
                                 style="margin-left:10px;font-size: 11px;width:98%">
                                <img src="images/flecha.gif"/><axis:alt f="axisctr191" c="LIT_SEGUNDO_SUBTITULO" lit="9903776"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <table class="area" align="center">
                                <tr>
                                    <th style="width:12.5%;height:0px">&nbsp;</th>
                                    <th style="width:12.5%;height:0px">&nbsp;</th>
                                    <th style="width:25%;height:0px">&nbsp;</th>
                                    <th style="width:25%;height:0px">&nbsp;</th>
                                    <th style="width:25%;height:0px">&nbsp;</th>
                                </tr>
                                <tr>
                                    <axis:ocultar f="axisctr191" c="NNUMIDEI" dejarHueco="false">
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisctr191" c="NNUMIDEI" lit="105330"/></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr191" c="TNOMBREI" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr191" c="TNOMBREI" lit="105940"/></b>
                                        </td>
                                    </axis:ocultar>
                                </tr>
                                <tr>
                                    <axis:ocultar f="axisctr191" c="NNUMIDEI" dejarHueco="false">
                                        <td class="campocaja" colspan="2">
                                            <input type="text"
                                                   class="campowidthinput campo campotexto"
                                                   id="NNUMIDEI" name="NNUMIDEI"
                                                   size="15" onchange="f_grabar_in_datos_inquilinos()"
                                                   value="${__formdata.obinquilino.NNUMIDE}"
                                                   style="width:85%;"
                                                   <axis:atr f="axisctr191" c="NNUMIDEI" a="modificable=false"/>/>
                                            <c:set var="canModify">
                                                ${!empty __formdata.obinquilino.SPERSON ? "visible" : "hidden"}
                                            </c:set>
                                            <axis:visible f="axisctr191" c="BT_EDITAR_PER">
                                                <a id="tomadores_abrir_axisper005_a"
                                                   style="visibility:${canModify}"
                                                   href="javascript:f_abrir_axisper005('f_aceptar_inquilino_axisper005_modificar')">
                                                    <img border="0"
                                                         alt='<axis:alt f="axisctr191" c="ICO_EDIT_PER" lit="1000214"/>'
                                                         title='<axis:alt f="axisctr191" c="ICO_EDIT_PER" lit="1000214"/>'
                                                         src="images/lapiz.gif"/>
                                                </a>
                                            </axis:visible>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr191" c="TNOMBREI" dejarHueco="false">
                                        <td class="campocaja" colspan="2">
                                            <input type="text" style="width:92%;"
                                                   class="campowidthinput campo campotexto"
                                                   id="TNOMBREI" name="TNOMBREI" size="15"
                                                   value="${__formdata.obinquilino.TNOMBRE} ${__formdata.obinquilino.TAPELLI1} ${__formdata.obinquilino.TAPELLI2}"
                                                   <axis:atr f="axisctr191" c="TNOMBRE" a="modificable=false"/>/>
                                        </td>
                                    </axis:ocultar>
                                </tr>
                                <tr>
                                    <axis:ocultar f="axisctr191" c="CDOMICII" dejarHueco="false">
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisctr191" c="CDOMICII" lit="101078"/></b>
                                        </td>
                                    </axis:ocultar>
                                </tr>
                                <tr> 
                                    <axis:ocultar f="axisctr191" c="CDOMICII" dejarHueco="false">
                                        <td class="campocaja" colspan="3">   
                                            <select name="DOMICILIO" id="DOMICILIO"
                                                    <axis:atr f="axisctr191" c="CDOMICI" a="obligatorio=false&isInputText=false"/>
                                                    style="width:88%" id="domicilio" size="1"
                                                    onchange="f_cambia_domicilio(this)"    
                                                    title="<axis:alt f="axisctr191" c="CDOMICII" lit="101078"/>"
                                                    class="campowidthselect campo campotexto">
                                                &nbsp;
                                                    <c:if test="${empty __formdata.CDOMICI}">
                                                    <option value="<%= Integer.MIN_VALUE %>">
                                                        -
                                                        <axis:alt f="axisctr191" c="SNV_COMBO" lit="108341"/>
                                                        -
                                                    </option>
                                                </c:if>
                                                <c:forEach var="domicilio" items="${__formdata.lstdomicilios}" varStatus="status">
                                                    <option value="${domicilio.CDOMICI}"
                                                            <c:if test="${domicilio.CDOMICI == __formdata.CDOMICI}">selected</c:if>>
                                                        ${domicilio.TDOMICI}
                                                        ${domicilio.CPOSTAL}
                                                        ${domicilio.TPOBLAC}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                            <axis:visible f="axisctr191"
                                                          c="BT_EDITAR_DOMICILIO">
                                                <a id="inquilino_abrir_axisper006_a"
                                                   href="javascript:f_abrir_axisper006('f_aceptar_inquilinos_axisper006')">
                                                    <img border="0"
                                                         alt='<axis:alt f="axisctr191" c="ICO_EDIT_DOMI" lit="1000069"/>'
                                                         title='<axis:alt f="axisctr191" c="ICO_EDIT_DOMI" lit="1000069"/>'
                                                         src="images/lapiz.gif"/>
                                                </a>
                                            </axis:visible>
                                        </td>
                                    </axis:ocultar>
                                    
                                </tr>
                                <tr>
                                    <axis:ocultar f="axisctr191" c="INGMENSUALESI" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr191" c="INGMENSUALESI" lit="9903781"/></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr191" c="INGANUALESI" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr191" c="INGANUALESI" lit="9903782"/></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr191" c="SITLABORALI" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr191" c="SITLABORALI" lit="9903783"/></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr191" c="TIPCONTRATOI" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr191" c="TIPCONTRATOI" lit="9903784"/></b>
                                        </td>
                                    </axis:ocultar>
                                </tr>
                                <tr>
                                    <axis:ocultar f="axisctr191" c="IINGRMEN" dejarHueco="false">
                                        <td class="campocaja">
                                            <input type="text" style="width:75%" class="campowidthinput campo campotexto" id="IINGRMEN" name="IINGRMEN" onblur="f_grabar_in_datos_inquilinos()" size="15"
                                                   value="${__formdata.obinquilino.IINGRMEN}" <axis:atr f="axisctr191" c="IINGRMEN" a="modificable=true&obligatorio=false"/>
                                                   title="<axis:alt f="axisctr191" c="INGMENSUALESI" lit="9903781"/>" />
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr191" c="INGANUALESI" dejarHueco="false">
                                        <td class="campocaja" >
                                            <input type="text" style="width:75%" class="campowidthinput campo campotexto" id="IINGRANUAL" name="IINGRANUAL" size="15" onblur="f_grabar_in_datos_inquilinos()"
                                                   value="${__formdata.obinquilino.IINGRANUAL}" <axis:atr f="axisctr191" c="IINGRANUAL" a="modificable=true&obligatorio=false"/>
                                                   title="<axis:alt f="axisctr191" c="INGANUALESI" lit="9903782"/>"/>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr191" c="SITLABORALI" dejarHueco="false">
                                        <td class="campocaja">
                                            <select name = "CSITLABORAL" id ="CSITLABORAL" size="1" <axis:atr f="axisctr191" c="CSITLABORAL" a="isInputText=false&obligatorio=true"/> onchange="f_cargar_propiedades_pantalla();f_grabar_in_datos_inquilinos();"
                                                    title="<axis:alt f="axisctr191" c="SITLABORALI" lit="9903783"/>" class="campowidthselect campo campotexto">&nbsp;
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr191" c="SITLABORALI" lit="108341"/> - </option> 
                                                    <c:forEach items="${__formdata.listValores.lstsitlaboral}" var="emp">
                                                        <option value = "${emp.CATRIBU}" <c:if test="${emp.CATRIBU  == __formdata.obinquilino.CSITLABORAL}">selected</c:if>>${emp.TATRIBU}</option>
                                                    </c:forEach>
                                            </select>
                                        </td> 
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr191" c="TIPCONTRATOI" dejarHueco="false">
                                        <td class="campocaja">
                                            <select name = "CTIPCONTRATO" id ="CTIPCONTRATO" size="1" <axis:atr f="axisadm033" c="TIPCONTRATOI" a="isInputText=false"/>
                                                    title="<axis:alt f="axisctr191" c="TIPCONTRATOI" lit="9903784"/>"  onchange="f_grabar_in_datos_inquilinos();" class="campowidthselect campo campotexto">&nbsp;
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr191" c="TIPCONTRATOI" lit="108341"/> - </option> 
                                                    <c:forEach items="${__formdata.listValores.lsttipcontrato}" var="emp">
                                                        <option value = "${emp.CATRIBU}" <c:if test="${emp.CATRIBU  == __formdata.obinquilino.CTIPCONTRATO}">selected</c:if>>${emp.TATRIBU}</option>
                                                    </c:forEach>
                                            </select>
                                        </td> 
                                    </axis:ocultar>
                                       
                                </tr>
                            </table>
                        </td>
                    </tr>
                    
                    </c:if>                   
                    
                </table>
            </td>
        </tr>
        <%-- Avalista --%>
        <tr>
            <td>
                <div class="titulo">
                    <img src="images/flecha.gif"/><axis:alt f="axisctr191" c="LIT_PRIMER_SUBTITULO" lit="9903777"/>
                </div>
                <table class="seccion" align="center">
                    <tr>
                        <td>
                            <table class="area" align="center">
                                <tr>
                                    <td>
                                        <!-- DisplayTag avalistas -->
                                        <c:set var="title1">
                                            <axis:alt f="axisctr191" c="DSP_LIT_PRIMERA_COLUMNA" lit="9903778"/>
                                        </c:set>
                                        <c:set var="title2">
                                            <axis:visible f="axisctr191" c="SUPFILTRO">
                                                <axis:alt f="axisctr191" c="SUPFILTRO" lit="9903774"></axis:alt>
                                            </axis:visible>
                                        </c:set>
                                        <div class="separador">&nbsp;</div>
                                        <div class="displayspace">
                                            <c:set var="idAvalista"> ${__formdata.obavalista.SPERSON} </c:set>
                                            <display:table name="${__formdata.axisctr_avalistas}" id="axisctr_avalistas" export="false"
                                                           class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending"
                                                           sort="list" cellpadding="0" cellspacing="0"
                                                           requestURI="axis_${pantalla}.do?ordenar=true&tabla=axisctr_avalistas&campo=TNOMBRE&outerMap=OB_IAX_INQUIAVAL">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="" sortProperty="SPERSON" sortable="false" headerClass="headwidth5 sortable"
                                                                media="html" autolink="false">
                                                    <div class="dspIcons">
                                                        <input <c:if test="${idAvalista !='' && idAvalista == axisctr_avalistas.OB_IAX_INQUIAVAL.SPERSON}">checked</c:if>
                                                               onclick="javascript:f_selecciona_avalista('${axisctr_avalistas.OB_IAX_INQUIAVAL.SPERSON}')"
                                                               value="${axisctr_avalistas.OB_IAX_INQUIAVAL.SPERSON}"
                                                               type="radio" id="radioAvalista" name="radioAvalista"/>
                                                    </div>
                                                </display:column>
                                                <display:column title="${title1}" sortable="true" sortProperty="TNOMBRE" headerClass="sortable" media="html" autolink="false">
                                                    <div class="dspText">
                                                        ${axisctr_avalistas.OB_IAX_INQUIAVAL.TNOMBRE}
                                                         
                                                        ${axisctr_avalistas.OB_IAX_INQUIAVAL.TAPELLI1}
                                                         
                                                        ${axisctr_avalistas.OB_IAX_INQUIAVAL.TAPELLI2}
                                                    </div>
                                                </display:column>
                                                <axis:visible f="axisctr191" c="SUPERAFILTRO">
                                                    <display:column title="${title2}" sortable="false" sortProperty="superafiltro"
                                                                    headerClass="headwidth5 sortable" media="html" autolink="false">
                                                        <div class="dspIcons">
                                                            <input type="checkbox"
                                                                   <axis:atr f="axisctr191" c="SUPERAFILTRO" a="modificable=false"/>
                                                                   id="SUPERAFILTRO_${axisctr_avalistas.OB_IAX_INQUIAVAL.SPERSON}"
                                                                   name="SUPERAFILTRO_${axisctr_avalistas.OB_IAX_INQUIAVAL.SPERSON}"
                                                                   value="" disabled="true" checked="checked"/>
                                                        </div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible f="axisctr191"
                                                              c="BT_MODIF_AVALISTA">
                                                    <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false">
                                                        <div class="dspIcons">
                                                            <a href="javascript:f_but_modificar_avalista('${axisctr_avalistas.OB_IAX_INQUIAVAL.SPERSON}')">
                                                                <img border="0"
                                                                     alt='<axis:alt f="axisctr191" c="ICO_MOD_INQUILINO" lit="9903832"/>'
                                                                     title='<axis:alt f="axisctr191" c="ICO_MOD_INQUILINO" lit="9903832"/>'
                                                                     src="images/find.gif"/>
                                                            </a>
                                                        </div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible f="axisctr191"
                                                              c="BT_DEL_AVALISTA">
                                                    <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false">
                                                        <div class="dspIcons">
                                                            <a href="javascript:f_borrar_avalista('${axisctr_avalistas.OB_IAX_INQUIAVAL.SPERSON}', this)">
                                                                <img border="0"
                                                                     alt='<axis:alt f="axisctr191" c="ICO_DEL_AVALISTA" lit="1000127" />'
                                                                     title='<axis:alt f="axisctr191" c="ICO_DEL_AVALISTA" lit="1000127" />'
                                                                     src="images/delete.gif"/>
                                                            </a>
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
                    <tr>
                        <axis:visible f="axisctr191" c="BT_ANADIRA">
                            <td align="right">
                                <div class="separador">&nbsp;</div>
                                <input type="button" class="boton" id="but_anadir_avalista" value='<axis:alt f="axisctr191" c="BT_ANADIR" lit="9903780"/>'
                                       onclick="f_abrir_axisper001_avalistas()"/>
                            </td>
                        </axis:visible>
                    </tr>
                    <!-- Sub-Sección datos tomador -->
                    <c:if test="${!empty __formdata.axisctr_avalistas}">
                    <tr>
                        <td colspan="2" align="left">
                            <div class="titulo"
                                 style="margin-left:10px;font-size: 11px;width:98%">
                                <img src="images/flecha.gif"/><axis:alt f="axisctr191" c="LIT_SEGUNDO_SUBTITULO" lit="9903779"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <table class="area" align="center">
                                <tr>
                                    <th style="width:12.5%;height:0px">&nbsp;</th>
                                    <th style="width:12.5%;height:0px">&nbsp;</th>
                                    <th style="width:25%;height:0px">&nbsp;</th>
                                    <th style="width:25%;height:0px">&nbsp;</th>
                                    <th style="width:25%;height:0px">&nbsp;</th>
                                </tr>
                                <tr>
                                    <axis:ocultar f="axisctr191" c="NNUMIDEA" dejarHueco="false">
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisctr191" c="NNUMIDEA" lit="105330"/></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr191" c="TNOMBREA" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr191" c="TNOMBREA" lit="105940"/></b>
                                        </td>
                                    </axis:ocultar>
                                </tr>
                                <tr>
                                    <axis:ocultar f="axisctr191" c="NNUMIDEA" dejarHueco="false">
                                        <td class="campocaja" colspan="2">
                                            <input type="text"
                                                   class="campowidthinput campo campotexto"
                                                   id="NNUMIDEA" name="NNUMIDEA"
                                                   size="15" onchange="f_grabar_in_datos_avalistas()"
                                                   value="${__formdata.obavalista.NNUMIDE}"
                                                   style="width:85%;"
                                                   <axis:atr f="axisctr191" c="NNUMIDEA" a="modificable=false"/>/>
                                            <c:set var="canModify">
                                                ${!empty __formdata.obavalista.SPERSON ? "visible" : "hidden"}
                                            </c:set>
                                            <axis:visible f="axisctr191" c="BT_EDITAR_PER">
                                                <a id="avalistas_abrir_axisper005_a"
                                                   style="visibility:${canModify}"
                                                   href="javascript:f_abrir_axisper005('f_aceptar_avalista_axisper005')">
                                                    <img border="0"
                                                         alt='<axis:alt f="axisctr191" c="ICO_EDIT_PER" lit="1000214"/>'
                                                         title='<axis:alt f="axisctr191" c="ICO_EDIT_PER" lit="1000214"/>'
                                                         src="images/lapiz.gif"/>
                                                </a>
                                            </axis:visible>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr191" c="TNOMBREA" dejarHueco="false">
                                        <td class="campocaja" colspan="2" >
                                            <input type="text" style="width:92%;"
                                                   class="campowidthinput campo campotexto"
                                                   id="TNOMBREA" name="TNOMBREA" size="15"
                                                   value="${__formdata.obavalista.TNOMBRE} ${__formdata.obavalista.TAPELLI1} ${__formdata.obavalista.TAPELLI2}"
                                                   <axis:atr f="axisctr191" c="TNOMBREA" a="modificable=false"/>/>
                                        </td>
                                    </axis:ocultar>
                                </tr>
                                <tr>
                                    <axis:ocultar f="axisctr191" c="CDOMICIAVAL" dejarHueco="false">
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisctr191" c="CDOMICIAVAL" lit="101078"/></b>
                                        </td>
                                    </axis:ocultar>
                                </tr>
                                <tr> 
                                    <axis:ocultar f="axisctr191" c="CDOMICIAVAL" dejarHueco="false">
                                        <td class="campocaja" colspan="3">   
                                            <select name="DOMICILIOAVAL" id="DOMICILIOAVAL"
                                                    <axis:atr f="axisctr191" c="CDOMICIAVAL" a="obligatorio=false&isInputText=false"/>
                                                    style="width:88%" id="domicilio" size="1"
                                                    onchange="f_cambia_domicilio_ava(this)"                                                    
                                                    class="campowidthselect campo campotexto"
                                                    title="<axis:alt f="axisctr191" c="CDOMICIAVAL" lit="101078"/>">
                                                &nbsp;
                                                <%--c:if test="${fn:length(sessionScope.axisctr_tomador.T_DOMICILIOS) > 1 || empty sessionScope.axisctr_tomador.T_DOMICILIOS}"--%>
                                                   <c:if test="${empty __formdata.CDOMICIAVAL}">
                                                    <option value="<%= Integer.MIN_VALUE %>">
                                                        -
                                                        <axis:alt f="axisctr191" c="SNV_COMBO" lit="108341"/>
                                                        -
                                                    </option>
                                                </c:if>
                                                <c:forEach var="domicilio" items="${__formdata.lstdomiciliosaval}" varStatus="status">
                                                                                               
                                                    <option value="${domicilio.CDOMICI}"
                                                            <c:if test="${domicilio.CDOMICI == __formdata.CDOMICIAVAL}">selected</c:if>>
                                                        ${domicilio.TDOMICI}
                                                        ${domicilio.CPOSTAL}
                                                        ${domicilio.TPOBLAC}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                            <axis:visible f="axisctr191"
                                                          c="BT_EDITAR_DOMICILIO">
                                                <a id="inquilino_abrir_axisper006_a"
                                                   href="javascript:f_abrir_axisper006('f_aceptar_avalistas_axisper006')">
                                                    <img border="0"
                                                         alt='<axis:alt f="axisctr191" c="ICO_EDIT_DOMI" lit="1000069"/>'
                                                         title='<axis:alt f="axisctr191" c="ICO_EDIT_DOMI" lit="1000069"/>'
                                                         src="images/lapiz.gif"/>
                                                </a>
                                            </axis:visible>
                                        </td>
                                    </axis:ocultar>
                                    
                                </tr>
                                <tr>
                                    <axis:ocultar f="axisctr191" c="INGMENSUALESA" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr191" c="INGMENSUALESA" lit="9903781"/></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr191" c="INGANUALESA" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr191" c="INGANUALESA" lit="9903782"/></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr191" c="SITLABORALA" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr191" c="SITLABORALA" lit="9903783"/></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr191" c="TIPCONTRATOA" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr191" c="TIPCONTRATOA" lit="9903784"/></b>
                                        </td>
                                    </axis:ocultar>
                                </tr>
                                <tr>
                                    <axis:ocultar f="axisctr191" c="IINGRMENA" dejarHueco="false">
                                        <td class="campocaja">
                                            <input type="text" style="width:75%" class="campowidthinput campo campotexto" id="IINGRMENA" onblur="f_grabar_in_datos_avalistas();" name="IINGRMENA" size="15"
                                                   value="${__formdata.obavalista.IINGRMEN}" <axis:atr f="axisctr191" c="IINGRMENA" a="modificable=true"/>
                                                   title="<axis:alt f="axisctr191" c="INGMENSUALESA" lit="9903781"/>"/>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr191" c="IINGRANUALA" dejarHueco="false">
                                        <td class="campocaja">
                                            <input type="text" style="width:75%" class="campowidthinput campo campotexto" id="IINGRANUALA" onblur="f_grabar_in_datos_avalistas();" name="IINGRANUALA" size="15"
                                                   value="${__formdata.obavalista.IINGRANUAL}" <axis:atr f="axisctr191" c="IINGRANUALA" a="modificable=true"/>
                                                   title="<axis:alt f="axisctr191" c="INGANUALESA" lit="9903782"/>"/>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr191" c="SITLABORALA" dejarHueco="false">
                                        <td class="campocaja">
                                            <select name = "CSITLABORALA" id ="CSITLABORALA" size="1"  onchange="f_grabar_in_datos_avalistas();f_cargar_propiedades_pantalla();" <axis:atr f="axisadm033" c="CSITLABORALA" a="isInputText=false&obligatorio=true" />
                                                    title="<axis:alt f="axisctr191" c="SITLABORALA" lit="9903783"/>" class="campowidthselect campo campotexto">&nbsp;
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr191" c="SITLABORALA" lit="108341"/> - </option> 
                                                    <c:forEach items="${__formdata.listValores.lstsitlaboral}" var="emp">
                                                        <option value = "${emp.CATRIBU}" <c:if test="${emp.CATRIBU  == __formdata.obavalista.CSITLABORAL}">selected</c:if>>${emp.TATRIBU}</option>
                                                    </c:forEach>
                                            </select>
                                        </td> 
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr191" c="TIPCONTRATOA" dejarHueco="false">
                                        <td class="campocaja">
                                            <select name = "CTIPCONTRATOA" id ="CTIPCONTRATOA" size="1" onchange="f_grabar_in_datos_avalistas();" <axis:atr f="axisadm033" c="CTIPCONTRATOA" a="isInputText=false"/>
                                                    title="<axis:alt f="axisctr191" c="TIPCONTRATOA" lit="9903784"/>" class="campowidthselect campo campotexto">&nbsp;
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr191" c="TIPCONTRATOA" lit="108341"/> - </option> 
                                                    <c:forEach items="${__formdata.listValores.lsttipcontrato}" var="emp">
                                                        <option value = "${emp.CATRIBU}" <c:if test="${emp.CATRIBU  == __formdata.obavalista.CTIPCONTRATO}">selected</c:if>>${emp.TATRIBU}</option>
                                                    </c:forEach>
                                            </select>
                                        </td> 
                                    </axis:ocultar>
                                       
                                </tr>
                            </table>
                        </td>
                    </tr>
                    </c:if>
                    
                </table>
            </td>
        </tr>
    </table>
    
    <c:if test="${param.multiPantalla != 'true'}">
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr191</c:param><c:param name="f">axisctr191</c:param><c:param name="f">axisctr191</c:param>
            <c:param name="__botones">cancelar<axis:visible f="${pantalla}" c="BT_ANT">,anterior</axis:visible>,siguiente</c:param>
        </c:import>
    </c:if>
</form>