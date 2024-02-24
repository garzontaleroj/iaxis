<%--
      NOMBRE:    axisint002.jsp
      @author <a href = "mailto:pfeliu@csi-ti.com">Pablo Feliu</a>
      Fecha: 17/05/2010
      PROPÓSITO (descripción pantalla): Pantalla de Busqueda de Control de Cargas
  
      REVISIONES:
      Ver        Fecha        Autor             Descripción
      ---------  ----------  ---------------  ------------------------------------
      1.0        17/05/2010  PFA              1. Creación de la pantalla. Bug.14455
--%>

<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="axis.util.Constantes, java.util.*" %>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        
        
        <!--********** CALENDARIO ************************* -->
        <!-- Hoja de estilo del Calendario -->
        <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
        <!-- Script principal del calendario -->
        <script type="text/javascript" src="scripts/calendar.js"></script>
        <!-- Idioma del calendario, en función del Locale -->
        <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
        <!-- Setup del calendario -->
        <script type="text/javascript" src="scripts/calendar-setup.js"></script>
        <!--*********************************** -->

        <script type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/            
            function f_onload(){
                f_cargar_propiedades_pantalla();
                document.getElementById("SPROCESBUSQ").focus();
	        }
            
            function f_but_buscar(){
                if (objValidador.validaEntrada()){
                    document.getElementById('SPROCES').value = '';
                    f_buscar_Cargas(objDom.getValorPorId("SPROCES"), objDom.getValorPorId("TFICHERO"), objDom.getValorPorId("CESTADO"), objDom.getValorPorId("CESTADOLINEA"), objDom.getValorPorId("FINI"), objDom.getValorPorId("FFIN"), objDom.getValorPorId("P_CPROCESOS"));
                }
            }
            
            function f_but_cancelar(){
                parent.f_cerrar_modal('axisint002');
            } 
            
            function f_onclickCheckbox(thiss){
                thiss.value = ((thiss.checked)?1:0);
                objDom.setValorPorId(thiss.id, thiss.value);
            }
            
            function f_buscar_Cargas(SPROCES, TFICHERO, CESTADO, CESTADOLINEA, FINI, FFIN, P_CPROCESOS){
                objUtiles.ejecutarFormulario("modal_axisint002.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_selecciona_carga(SPROCES, CPROCESO){
                document.miForm.SPROCES.value = SPROCES;
            }
            function f_but_aceptar(){
                if (!objUtiles.estaVacio(document.getElementById('SPROCES').value)){
                    parent.f_aceptar_axisint002(document.getElementById('SPROCES').value);
                }else{
                    //S'ha de seleccionar un item de la llista
                    alert("<axis:alt c="ERROR_SELECCIONAR" f="axisint002" lit="9900849"/>");
                }
            }
        </script>
    </head>
    
    <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>            
            <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
            <input type="hidden" name="SPROCES" id="SPROCES" value=""/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="lit_form" f="axisint002" lit="9901204"/></c:param>
                <c:param name="producto"><axis:alt c="lit_form" f="axisint002" lit="9901204"/></c:param>
                <c:param name="form">axisint002</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisint002" c="SPROCESBUSQ" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt c="SPROCESBUSQ" f="axisint002" lit="1000576"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisint002" c="TFICHERO">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisint002" c="TFICHERO" lit="9901205"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisint002" c="CESTADO" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisint002" c="CESTADO" lit="101510" /></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisint002" c="SPROCESBUSQ" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto"
                                        <axis:atr f="axisint002" c="SPROCESBUSQ" a="modificable=true&formato=entero"/> 
                                        style="width:93%;" value="${__formdata.SPROCESBUSQ}" 
                                        name="SPROCESBUSQ" id="SPROCESBUSQ" title="<axis:alt f="axisint002" c="AXISINT002_MSG001" lit="1000576" />" size="15" 
                                        title="<axis:alt c="SPROCESBUSQ" f="axisint002" lit="100836"/>"/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisint002" c="TFICHERO" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" 
                                        <axis:atr f="axisint002" c="TFICHERO" a="modificable=true"/>
                                        style="width:93%;" size="15" value="${__formdata.TFICHERO}" name="TFICHERO" id="TFICHERO"
                                        title="<axis:alt c="TFICHERO" f="axisint002" lit="9901205"/>"/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisint002" c="CESTADO" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja">
                                        <select name = "CESTADO" id="CESTADO" style="width:95%;" size="1"  title="<axis:alt c="CESTADO" f="axisint002" lit="101510"/>"
                                        <axis:atr f="axisint002" c="CESTADO" a="modificable=true&obligatorio=false&isInputText=false"/>
                                        onchange="f_carga_dependencias();" class="campowidthselect campo campotexto">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="CESTADO001" f="axisint002" lit="108341"/> - </option>
                                            <c:forEach var="estados" items="${__formdata.listValores.lstestado}">
                                                <option value = "${estados.CATRIBU}"
                                                    <c:if test="${estados.CATRIBU == __formdata.CESTADO}">selected</c:if>>
                                                    ${estados.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisint002" c="P_CPROCESOS" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisint002" c="P_CPROCESOS" lit="9001148" /></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar c="FINI" f="axisint002" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt c="FINI" f="axisint002" lit="9000526"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar c="FFIN" f="axisint002" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt c="FFIN" f="axisint002" lit="9000527"/></b>
                                    </td>
                                </axis:ocultar>
                                 <axis:ocultar c="REFEXT" f="axisint002" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt c="REFEXT" f="axisint002" lit="9901782"/></b>
                                    </td>
                                </axis:ocultar>
                                
                            </tr>
                            <tr>
                                <axis:ocultar f="axisint002" c="P_CPROCESOS" dejarHueco="false"> 
                                    <td class="campocaja">                             
                                        <select name = "P_CPROCESOS" id ="P_CPROCESOS" size="1" title="<axis:alt f="axisint002" c="P_CPROCESOS" lit="9001148" />" 
                                            class="campowidthselect campo campotexto" style="95%"
                                            <axis:atr f="axisint002" c="P_CPROCESOS" a="modificable=true&obligatorio=false&isInputText=false"/>>
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisint002" c="P_CPROCESOS001" lit="108341" /> - </option> 
                                            <c:forEach items="${__formdata.P_TPROCESOS}" var="P_TPROCESOS">
                                                <option value = "${P_TPROCESOS.CPROCESO}" <c:if test="${P_TPROCESOS.CPROCESO  == __formdata.P_CPROCESOS}">selected</c:if>>${P_TPROCESOS.TDESCRIP}</option>
                                            </c:forEach>
                                        </select>
                                        <div class="separador">&nbsp;</div>
                                    </td>
                                </axis:ocultar> 
                                <axis:ocultar c="FINI" f="axisint002" dejarHueco="false">
                                    <td class = "campocaja" >
                                        <jsp:useBean id="today" class="java.util.Date" />
                                        <input type="text" style="width:50%;" class="campo campotexto" size="15" 
                                        value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINI}"/><c:if test="${empty __formdata.FINI}"></c:if>" name="FINI" id="FINI"
                                        <axis:atr f="axisint002" c="FINI" a="formato=fecha"/> title="<axis:alt f="axisint002" c="FINI001" lit="9000526" />" onblur="parent.f_formatdate(this,'');"/>
                                        <c:if test="${empty __configform.axisint002__FINI__modificable || __configform.axisint002__FINI__modificable != false}">
                                            <a id="icon_FINI" style="vertical-align:middle;"><img alt="<axis:alt f="axisint002" c="FINI002" lit="108341" />"
                                            title="<axis:alt f="axisint002" c="FINI001" lit="9000526" />" src="images/calendar.gif"/></a>
                                        </c:if>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar c="FFIN" f="axisint002" dejarHueco="false">
                                    <td class = "campocaja" >
                                        <input type="text" style="width:50%;" class="campo campotexto" size="15" 
                                        value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFIN}"/><c:if test="${empty __formdata.FFIN}"></c:if>" name="FFIN" id="FFIN"
                                        <axis:atr f="axisint002" c="FFIN" a="formato=fecha"/> title="<axis:alt f="axisint002" c="FFIN001" lit="9000527" />" onblur="parent.f_formatdate(this,'')"/>
                                        <c:if test="${empty __configform.axisint002__FFIN__modificable || __configform.axisint002__FFIN__modificable != false}">
                                            <a id="icon_FFIN" style="vertical-align:middle;"><img alt="<axis:alt f="axisint002" c="FIN002" lit="108341" />"
                                            title="<axis:alt f="axisint002" c="FFIN001" lit="9000527" />" src="images/calendar.gif"/></a>
                                        </c:if>
                                    </td>
                                </axis:ocultar> 
                               <axis:ocultar f="axisint002" c="REFEXT" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" 
                                        <axis:atr f="axisint002" c="REFEXT" a="modificable=true"/>
                                        style="width:93%;" size="15" value="${__formdata.REFEXT}" name="REFEXT" id="REFEXT"
                                        title="<axis:alt c="REFEXT" f="axisint002" lit="9901782"/>"/>
                                    </td>
                                </axis:ocultar>
                            </tr>
                        </table>                        
                        <div class="separador">&nbsp;</div>
                        <table class="seccion" align="center">
                            <tr>
                                <td>
                                    <table class="area" align="center">
                                        <tr>
                                            <td>
                                                <c:set var="title1"><axis:alt c="LIT_DSP_TIT01" f="axisint002" lit="1000576"/></c:set>
                                                <c:set var="title2"><axis:alt c="LIT_DSP_TIT02" f="axisint002" lit="1000574"/></c:set>
                                                <c:set var="title3"><axis:alt c="LIT_DSP_TIT03" f="axisint002" lit="101510"/></c:set>
                                                <c:set var="title4"><axis:alt c="LIT_DSP_TIT04" f="axisint002" lit="9000464"/></c:set>
                                                <c:set var="title5"><axis:alt c="LIT_DSP_TIT05" f="axisint002" lit="1000277"/></c:set>
                                                <c:set var="title6"><axis:alt c="LIT_DSP_TIT06" f="axisint002" lit="100890"/></c:set>
                                                <c:set var="title7"><axis:alt c="LIT_DSP_TIT07" f="axisint002" lit="1000120"/></c:set>
                                                <c:set var="title8"><axis:alt c="LIT_DSP_TIT08" f="axisint002" lit="9001148"/></c:set>
                                                <c:set var="title9"><axis:alt c="LIT_DSP_TIT08" f="axisint002" lit="9901782"/></c:set>
                                                <div class="separador">&nbsp;</div>
                                                <div class="displayspacePersonas" id="CTRL">
                                                    <display:table name="${__formdata.ctrlCabecera}" id="ctrlCabecera" export="false" class="dsptgtable"  pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                                       requestURI="modal_axisint002.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column headerClass="sortable fixed"   title="" media="html" autolink="false">
                                                        <div class="dspIcons">
                                                          <input onclick="f_selecciona_carga('${ctrlCabecera.SPROCES}', '${ctrlCabecera.CPROCESO}');"
                                                                 value="${ctrlCabecera.SPROCES}"
                                                                 type="radio" id="radioctrlCabecera"
                                                                 name="radioctrlCabecera"/>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title1}" sortable="true"  sortProperty="SPROCES" headerClass="sortable fixed"  media="html" autolink="false" >    
                                                        <div class="dspNumber">${ctrlCabecera['SPROCES']}</div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true"   sortProperty="TFICHERO" headerClass="sortable fixed" media="html" autolink="false" >
                                                        <div class="dspText">${ctrlCabecera['TFICHERO']}</div>
                                                    </display:column>
                                                    <display:column title="${title3}" sortable="true" sortProperty="TESTADO" headerClass="sortable fixed" media="html" autolink="false" >
                                                        <div class="dspText">
                                                             <c:if test="${ctrlCabecera['CESTADO'] == 1}"><font color="red">${ctrlCabecera['TESTADO']} </font> </c:if> 
                                                             <c:if test="${ctrlCabecera['CESTADO'] != 1}">${ctrlCabecera['TESTADO']}</c:if>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title4}" sortable="true" sortProperty="CERROR_LIT" headerClass="sortable fixed" media="html" autolink="false" >
                                                        <div class="dspText" style="border:0px;">
                                                             <table class="area" align="center" style="border:0px;">
                                                                <tr>
                                                                    <th style="width:80%;height:0px;"></th>
                                                                    <th style="width:20%;height:0px;"></th>
                                                                </tr>
                                                                <tr >
                                                                    <td style="border:0px;">
                                                                    ${ctrlCabecera['CERROR_LIT']}
                                                                    <c:if test="${empty ctrlCabecera['CERROR_LIT'] && !empty ctrlCabecera['TERROR']}"><axis:alt f="axisint002" c="CERROR_LIT" lit="151541" /></c:if>
                                                                    </td>
                                                                    <td align="center" style="border:0px;">
                                                                    <c:if test="${!empty ctrlCabecera['TERROR']}">
                                                                        
                                                                        </c:if>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title6}" sortable="true" style="width:10%" sortProperty="FINI" headerClass="sortable fixed" media="html" autolink="false" >
                                                        <div class="dspText"> <fmt:formatDate pattern="dd/MM/yyyy" value="${ctrlCabecera.FINI}"/></div>
                                                    </display:column>
                                                    <display:column title="${title7}" sortable="true" style="width:10%" sortProperty="FFIN" headerClass="sortable fixed" media="html" autolink="false" >
                                                        <div class="dspText">${ctrlCabecera.FFIN}</div>
                                                    </display:column>
                                                    <display:column title="${title8}" sortable="true" style="width:15%" sortProperty="CDESCRIP" headerClass="sortable fixed" media="html" autolink="false" >
                                                        <div class="dspText">${ctrlCabecera.CDESCRIP}</div>
                                                    </display:column>
                                                     
                                                    <display:column class="seccion_informacion" style="width:700px;padding-right:10px;padding-left:5px;">>
                                                        <div id="SECCION_A${ctrlCabecera['SPROCES']}" class="seccion_informacion">
                                                            <table class="area" align="center">
                                                                <tr>
                                                                    <th style="width:50%;height:0px"></th>
                                                                    <th style="width:50%;height:0px"></th>
                                                                 </tr>
                                                                <tr>
                                                                    <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                        <b>${title5}</b>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="campocaja" style="background-color:white;border-right-width: 0px;" colspan="2">
                                                                        <textarea name="TTEXTOS" rows="5" cols="50" class="campo campotexto" readonly>${ctrlCabecera['TERROR']}</textarea>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </display:column>
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
            </table>
     </form>

<c:import url="../include/botonera_nt.jsp">
           <c:param name="f">axisint002</c:param>
            <c:param name="__botones">
                <axis:ocultar f="axisint002" c = "BT_CANCELAR" dejarHueco="false">cancelar</axis:ocultar><axis:ocultar f="axisint002" c = "BT_BUSCAR" dejarHueco="false">,buscar</axis:ocultar><axis:ocultar f="axisint002" c = "BT_ACEPTAR" dejarHueco="false">,aceptar</axis:ocultar>
            </c:param>

</c:import>
<script type="text/javascript">
    Calendar.setup({
        inputField     :    "FINI",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FINI",  
        singleClick    :    true,
        firstDay       :    1
    });
    Calendar.setup({
        inputField     :    "FFIN",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FFIN",  
        singleClick    :    true,
        firstDay       :    1
    });
    </script>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>