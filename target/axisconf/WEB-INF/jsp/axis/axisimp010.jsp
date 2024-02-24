<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes, java.util.*" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<%@ page import="java.math.BigDecimal" %>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<c:set var="nombrePantalla" value="localizaciones_modal"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp"/> 
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
        
            function f_onload() {
                f_cargar_propiedades_pantalla();
              <% if (request.getAttribute("__formdata") != null )
                {  %>
                   
             <% }  %>  
            }
            
            function f_aceptar_modal(pantalla){
                f_cerrar_modal(pantalla);
                objUtiles.ejecutarFormulario("axis_axisimp010.do", "form", document.${nombrePantalla}Form, "ftrabajo", objJsMessages.jslit_cargando);
            }
            
            function f_aceptar_modal(pantalla, param){
                f_cerrar_modal(pantalla);
                objUtiles.ejecutarFormulario("axis_axisimp010.do?"+param, "form", document.${nombrePantalla}Form, "ftrabajo", objJsMessages.jslit_cargando);
            }
    
            function f_abrir_modal(cual, noXButton, optionalQueryString) {
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";
                
                if (noXButton) 
                    objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    

                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);   
            }
            
            function f_cerrar_modal(pantalla){
                objUtiles.cerrarModal(pantalla);
            }      
            
            function f_but_cancelar(){
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisimp010", "cancelar", document.${nombrePantalla}Form, "_self");            
            }
            
            function f_onchange_CPAIS() {
                var CPAIS=objDom.getValorPorId("CPAIS");
                if (!objUtiles.estaVacio(CPAIS)){
                    var qs="operation=ajax_direccion";
                    qs=qs+"&op="+"CPAIS";
                    qs=qs+"&CPAIS="+CPAIS
                    qs=qs+"&dt="+(new Date().getTime())
                    objAjax.invokeAsyncCGI("modal_axissin017.do", callbackajaxdireccion, qs, this)
                } else {
                    objDom.setValorPorId("CPAIS", "");
                    objDom.setValorHTMLPorId("TPAIS_span", "");
                    objDom.setVisibilidadPorId("findProvincia", "hidden");
                    limpiaCampos("CPAIS");
                }
            }
            
            function f_onchange_CPOBLAC() {
                var CPAIS=objDom.getValorPorId("CPAIS");
                var CPOBLAC=objDom.getValorPorId("CPOBLAC");
                var CPROVIN=objDom.getValorPorId("CPROVIN");
                if (!objUtiles.estaVacio(CPOBLAC)){
                    var qs="operation=ajax_direccion";
                    qs=qs+"&op="+"CPOBLAC";
                    qs=qs+"&CPAIS="+CPAIS
                    qs=qs+"&CPOBLAC="+CPOBLAC
                    qs=qs+"&CPROVIN="+CPROVIN
                    qs=qs+"&dt="+(new Date().getTime())
                    objAjax.invokeAsyncCGI("modal_axissin017.do", callbackajaxdireccion, qs, this)
                } else {
                    limpiaCampos("CPROVIN");
                }
            }
        
            function f_onchange_CPROVIN() {
                var CPAIS=objDom.getValorPorId("CPAIS");
                var CPROVIN=objDom.getValorPorId("CPROVIN");
                if (!objUtiles.estaVacio(CPROVIN)){
                    var qs="operation=ajax_direccion";
                    qs=qs+"&op="+"CPROVIN";
                    qs=qs+"&CPAIS="+CPAIS
                    qs=qs+"&CPROVIN="+CPROVIN
                    qs=qs+"&dt="+(new Date().getTime())
                    objAjax.invokeAsyncCGI("modal_axissin017.do", callbackajaxdireccion, qs, this)
                }else{
                    objDom.setValorPorId("CPROVIN", "");
                    objDom.setValorHTMLPorId("TPROVIN_span", "");
                    objDom.setVisibilidadPorId("findPoblacion", "hidden");
                    limpiaCampos("CPROVIN");
                }
            }
            
            function callbackajaxdireccion (ajaxResponseText){
                try{ 
                    var doc = objAjax.domParse(ajaxResponseText);
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                        if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAIS")[0])) {
                            if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                                objDom.setValorPorId("CPAIS", "");
                                limpiaCampos("CPAIS");
                            }else{
                                objDom.setValorPorId("CPAIS", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS"), 0, 0));
                                objDom.setVisibilidadPorId("findProvincia", "visible");
                                if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAIS")[0])){
                                    objDom.setValorHTMLPorId("TPAIS_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAIS"), 0, 0) + "</b>");
                                    
                                    limpiaCampos("CPAIS");
                                    f_limpiar_valores_reteica();
                                }
                            }
                        }
                     
                        if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPROVIN")[0])) {
                            if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                                objDom.setValorPorId("CPROVIN", "");
                                limpiaCampos("CPROVIN");
                            }else{
                                objDom.setValorPorId("CPROVIN", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPROVIN"), 0, 0));
                                objDom.setVisibilidadPorId("findPoblacion", "visible");
                                if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPROVIN")[0])){
                                    objDom.setValorHTMLPorId("TPROVIN_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPROVIN"), 0, 0) + "</b>");
                                    
                                    limpiaCampos("CPROVIN");
                                    f_limpiar_valores_reteica();
                                }
                            }
                        }
                        
                        if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPOBLAC")[0])) {
                            if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                                objDom.setValorPorId("CPOBLAC", "");
                            }else{
                                objDom.setValorPorId("CPOBLAC", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPOBLAC"), 0, 0));
                                if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPOBLAC")[0]))
                                    objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPOBLAC"), 0, 0) + "</b>");
                            }
                            f_limpiar_valores_reteica();
                            q="?TPAIS="+$("#TPAIS_span b").html()+"&TPROVIN="+$("#TPROVIN_span b").html()+"&TPOBLAC="+$("#TPOBLAC_span b").html();
                            objUtiles.ejecutarFormulario("axis_axisimp010.do"+q, "form", document.${nombrePantalla}Form, "ftrabajo", objJsMessages.jslit_cargando);
                        }
                    }
                } catch (e) {
                   if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
                }
            }
            
            function limpiaCampos (CAMPO){
                if(objUtiles.utilEquals(CAMPO, "CPAIS")){
                    objDom.setValorPorId("CPROVIN", "");
                    //Limpio población
                    objDom.setValorHTMLPorId("TPROVIN_span", "");
                    objDom.setVisibilidadPorId("findPoblacion", "hidden");
                }
                
                if(objUtiles.utilEquals(CAMPO, "CPAIS") ||
                    objUtiles.utilEquals(CAMPO, "CPROVIN")){
                    //Limpio población
                    objDom.setValorPorId("CPOBLAC", "");
                    objDom.setValorHTMLPorId("TPOBLAC_span", "");
                }
            }
            
            function f_limpiar_valores_reteica(){
                for (var i=0;i<$("#T_IAX_TIPPROF >tbody >tr").length;i++){
                    $("#reteica_"+i).val('');
                }
            }
            
            function f_abrir_axiscom001(CODIGO_LITERAL, CODIGO_CONSULTA, CODIGO_CONDICION, CODIGO_CP){
                 objUtiles.abrirModal("axiscom001", "src", "modal_axiscom001.do?operation=form&CODIGO_LITERAL=" + 
                                                            CODIGO_LITERAL +
                                                            "&CODIGO_CONSULTA=" + CODIGO_CONSULTA + 
                                                            "&CODIGO_CONDICION=" + CODIGO_CONDICION+
                                                            "&TIPO=DATE&CODIGO_CP=" + CODIGO_CP);
            }
            
            function f_aceptar_axiscom001(CODIGO, TEXTO, CODIGO_CONSULTA){
                f_cerrar_axiscom001();
                if (!objUtiles.estaVacio(TEXTO))
                    TEXTO = objUtiles.replaceAll(TEXTO, "-quote-", "\'");
                if (CODIGO_CONSULTA == "LISTA_PAIS") {
                    objDom.setValorPorId("CPAIS", CODIGO);
                    objDom.setVisibilidadPorId("findProvincia", "visible");                
                    objDom.setValorHTMLPorId("TPAIS_span", "<b>" + TEXTO + "</b>");
                    limpiaCampos("CPAIS");
                    f_limpiar_valores_reteica();
                }
                else if (CODIGO_CONSULTA == "LISTA_PROVINCIA") {
                    objDom.setValorPorId("CPROVIN", CODIGO);
                    objDom.setVisibilidadPorId("findPoblacion", "visible");
                    objDom.setValorHTMLPorId("TPROVIN_span", "<b>" + TEXTO + "</b>");
                    limpiaCampos("CPROVIN");
                    f_limpiar_valores_reteica();
                }
                else if (CODIGO_CONSULTA == "LISTA_POBLACION") {
                    objDom.setValorPorId("CPOBLAC", CODIGO);
                    objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + TEXTO + "</b>");
                    f_limpiar_valores_reteica();
                    q="?TPAIS="+$("#TPAIS_span b").html()+"&TPROVIN="+$("#TPROVIN_span b").html()+"&TPOBLAC="+$("#TPOBLAC_span b").html();
                    objUtiles.ejecutarFormulario("axis_axisimp010.do"+q, "form", document.${nombrePantalla}Form, "ftrabajo", objJsMessages.jslit_cargando);
                }  
            }
            
            function f_cerrar_axiscom001() {
                objUtiles.cerrarModal("axiscom001");
            }
            
            function f_guardar_valores(){
            //   Se monta una estructura tipo:
            //   CTIPPROF#PRETEICA, 
            
              var valores='';
              var cont_filas=0;
              var CTIPPROF='';var PRETEICA='';
              $("#T_IAX_TIPPROF tbody tr").each(function (){
                var fila = $(this);
                var cont_colum = 0;
            
                fila.find("td").each(function (){
                  var columna = $(this);
                  if (cont_colum == 0){/*Codigo tipo profesional CTIPPROF*/
                    CTIPPROF = columna.find("span").html()+"#";
                    CTIPPROF = CTIPPROF.replace(/\s/g,'');
                  }
                  if (cont_colum == 1){/*Valores reteica PRETEICA*/
                    PRETEICA = objNumero.cambiarSeparadorDecimalesPorMiles($("#reteica_"+cont_filas).val())+",";
                    valores += CTIPPROF+PRETEICA;
                  }
                  cont_colum++;
                });
                cont_filas++;
              });
              return valores;
            }
        
         function replaceAll( text, busca, reemplaza ){
          while (text.toString().indexOf(busca) != -1)
              text = text.toString().replace(busca,reemplaza);
          return text;
        }
        
        function f_but_aceptar(){
            $("#valores_reteica").val(f_guardar_valores());
            
            if (objValidador.validaEntrada())
                objUtiles.ejecutarFormulario ("axis_axisimp010.do", "aceptar", document.${nombrePantalla}Form, "_self", objJsMessages.jslit_cargando);
        }
            
        </script>
    </head>
    <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
        </c:import>    
    <form name="${nombrePantalla}Form" action="axis_axisimp010.do" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" name="valores_reteica" id="valores_reteica" value="${__formdata.valores_reteica}"/> 
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="form" f="axisimp010" lit="9906252"/></c:param>
                <c:param name="producto"><axis:alt c="form" f="axisimp010" lit="9906252"/></c:param>
                <c:param name="form">axisimp010</c:param>
            </c:import>  
            
            <axis:visible c="DSP_CUENTAS" f="axisimp010"> 
              <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                <td>
                <table class="seccion">
                <tr>
                    <td align="left" >
                        <table class="area" align="center">
                            <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                            </tr>  
                            <tr>
                                <!-- País -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axisimp010" c="CPAIS" lit="100816" /></b>
                                </td>
                                <!-- Provincia -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axisimp010" c="CPROVIN" lit="100756" /></b>
                                </td>
                                <!--  Población -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axisimp010" c="CPOBLAC" lit="100817" /></b>
                                </td>
                                <!--  Fecha desde -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axisimp010" c="FDESDE" lit="9902360" /></b>
                                </td>
                            </tr> 
                            <tr>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="3" maxlength="3" value="${__formdata.CPAIS}" name="CPAIS" id="CPAIS" onchange="f_onchange_CPAIS()" style="width:30%;" 
                                    <axis:atr f="axisimp010" c="CPAIS" a="obligatorio=true"/> title="<axis:alt f="axisimp010" c="CPAIS" lit="100816"/>"/>&nbsp;<img id="findPais" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS', null)" style="cursor:pointer"/>
                                    &nbsp;<span id="TPAIS_span"><b>${__formdata.TPAIS}</b></span>
                                </td>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" maxlength="3" value="${__formdata.CPROVIN}" name="CPROVIN" id="CPROVIN" onchange="f_onchange_CPROVIN()" style="width:18%;" 
                                    <axis:atr f="axisimp010" c="CPROVIN" a="obligatorio=true"/> title="<axis:alt f="axisimp010" c="CPROVIN" lit="100756"/>"/>
                                    &nbsp;<img id="findProvincia" style="visibility:${empty __formdata.CPAIS ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152431', 'LISTA_PROVINCIA', document.${nombrePantalla}Form.CPAIS.value)"/>                
                                    &nbsp;<span id="TPROVIN_span"><b>${__formdata.TPROVIN}</b></span>
                                </td>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" maxlength="5" value="${__formdata.CPOBLAC}" name="CPOBLAC" id="CPOBLAC" onchange="f_onchange_CPOBLAC()" style="width:18%;" 
                                    <axis:atr f="axisimp010" c="CPOBLAC" a="obligatorio=true"/> title="<axis:alt f="axisimp010" c="CPOBLAC" lit="100817"/>"/>
                                    &nbsp;<img id="findPoblacion" style="visibility:${empty __formdata.CPROVIN ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION', document.${nombrePantalla}Form.CPROVIN.value, null)"/>                
                                    &nbsp;<span id="TPOBLAC_span"><b>${__formdata.TPOBLAC}</b></span>
                                </td>
                                <axis:visible f="axisimp010" c="FDESDE">
                                    <td class="campocaja"> 
                                        <input tabindex="13" type="text" class="campowidthinput campo" id="FDESDE" title="<axis:alt f='axisimp010' c='FDESDE' lit='700362' />" name="FDESDE" size="15"
                                        value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata['FDESDE']}"/>" 
                                        <axis:atr f="axisimp010" c="FDESDE" a="obligatorio=true&modificable=true&formato=fecha"/> style="width:40%"/><a style="vertical-align:middle;text-decoration:none">
                                        <img id="popup_calendario_fdesde" alt="<axis:alt f="axisimp010" c="SELECCIONAR" lit="108341"/>" title="<axis:alt f="axisimp010" c="FDESDE" lit="700362" />" src="images/calendar.gif"/></a>
                                    </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <td colspan="4">
                                  <div class="separador">&nbsp;</div>
                                  <div class="separador">&nbsp;</div>
                                  <div class="separador">&nbsp;</div>
                                  <% int contador = 0; %>
                                  <c:set var="title0"><axis:alt f="axisimp010" c="CTIPPROF" lit="9903408"/></c:set><!--Tipo Profesional-->
                                  <c:set var="title1"><axis:alt f="axisimp010" c="PRETEICA" lit="9902696" /></c:set><!--% ReteIca-->
                                  <div class="displayspace" style="max-height:none">
                                    <display:table name="${__formdata.lstdefinicionesreteica}" id="T_IAX_TIPPROF" export="false" class="dsptgtable" 
                                                   pagesize="15" defaultsort="1" defaultorder="ascending" requestURI="axis_axisimp010.do?paginar=true" 
                                                   sort="list" cellpadding="0" cellspacing="0">
                                      <%@ include file="../include/displaytag.jsp"%>
                                      <% HashMap formdata = (HashMap)request.getAttribute(axis.util.Constantes.FORMDATA);
                                       String reteica_j = null;
                                       BigDecimal b_reteica_j = new BigDecimal(-1); %>
                                       <c:set var="reteica_guardado" value=""/>
                                    <%  if (formdata.get("reteica_"+contador) != null){
                                            if (formdata.get("reteica_"+contador) instanceof String){
                                                reteica_j = (String)formdata.get("reteica_"+contador);%>
                                                <c:set var="reteica_guardado" value="<%= reteica_j %>"/>
                                            <%}else if (formdata.get("reteica_"+contador) instanceof BigDecimal){
                                                b_reteica_j = ((BigDecimal)formdata.get("reteica_"+contador)).divide(new BigDecimal(10));%>
                                                <c:set var="reteica_guardado" value="<%= b_reteica_j %>"/>
                                            <%}else{
                                                reteica_j = "";
                                            }
                                        }%>
                                    <% if (reteica_j == null ) { reteica_j = " "; }%>
                                      <axis:visible f="axisimp010" c="CTIPPROF">
                                       <display:column title="${title0}"
                                                      sortable="true"
                                                      sortProperty="CTIPPROF"
                                                      headerClass="sortable fixed"
                                                      media="html" autolink="false">
                                        <div class="dspText">
                                          ${T_IAX_TIPPROF.TTIPPROF} 
                                          <span style="display:none">${T_IAX_TIPPROF.CTIPPROF} </span>
                                        </div>
                                      </display:column>
                                      </axis:visible>
                                      <axis:visible f="axisimp010" c="PRETEICA">
                                       <display:column title="${title1}"
                                                      sortable="true"
                                                      sortProperty="PRETEICA"
                                                      headerClass="sortable fixed"
                                                      media="html" autolink="false" style="width:30%">
                                        <div class="dspText">
                                          <input <axis:atr f="axisimp010" c="PRETEICA" a="obligatorio=true&modificable=true&isInputText=true"/>
                                                 title="${T_IAX_TIPPROF.TTIPPROF}" type="text" style="width:30%"
                                                 name = "reteica_<%= contador %>" id="reteica_<%= contador %>"
                                                 <c:if test="${!empty reteica_guardado && reteica_guardado != 'null'}">
                                                       value="${reteica_guardado}" 
                                                 </c:if>
                                                 <c:if test="${empty reteica_guardado or reteica_guardado == 'null'}">
                                                       value="${T_IAX_TIPPROF.VALOR}" 
                                                 </c:if>
                                                 class="campowidthinput campo campotexto" formato="decimal"/>
                                        </div>
                                      </display:column>
                                      </axis:visible>
                                      <% contador++; %>
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
            </axis:visible>            
    </form>  
    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FDESDE",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "popup_calendario_fdesde", 
            singleClick    :    true,
            firstDay       :    1
        });
    </script>
    <c:import url="../include/botonera_nt.jsp">
       <c:param name="f">axisimp010</c:param>
       <c:param name="__botones"><axis:ocultar f="axisimp010" c="BT_CANCELAR" dejarHueco="false">cancelar</axis:ocultar>,<axis:ocultar f="axisimp010" c="BT_ACEPTAR" dejarHueco="false">aceptar</axis:ocultar></c:param>
    </c:import>
    <c:import url="../include/mensajes.jsp" />    
</body>
</html>


