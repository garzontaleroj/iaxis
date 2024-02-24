<%--
      NOMBRE:    axisctr110.jsp
      @author <a href = "mailto:pfeliu@csi-ti.com">Autor creación</a>
      Fecha: 15/09/2010
      PROPÓSITO (descripción pantalla): Buscador Cartas Fe de Vida
  
      REVISIONES:
      Ver        Fecha        Autor             Descripción
      ---------  ----------  ---------------  ------------------------------------
      1.0        15/09/2010   PFA(iniciales)     1. Creación de la pantalla. Bug.9296
--%>

<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
        
        <!--Inicio Sólo si vamos a tener un campo fecha !-->
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
        <!-- fin Sólo si vamos a tener un campo fecha !-->
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
            function f_onload(){    
                f_cargar_propiedades_pantalla();
            }
    
            function f_but_buscar() {
               if (objValidador.validaEntrada()){              
                          
                    var CEMPRESA=objDom.getValorPorId("CEMPRES");                    
                    <c:if test="${!empty __formdata.LISTVALORES.LSTEMPRESAS && fn:length(__formdata.LISTVALORES.LSTEMPRESAS) == 1  }">                    
                        CEMPRESA = document.miForm.CEMPRES[0].value;                    
                    </c:if> 
                                        
                    if(CEMPRESA != null && document.miForm.FEFECTO.value!=''){
                    
                        parent.f_aceptar_axisctr110(CEMPRESA, document.miForm.CRAMO.value,document.miForm.SPRODUC.value,document.miForm.CAGENTE.value,document.miForm.NOMBRE_TEXT.value,document.miForm.NPOLIZA.value,document.miForm.NCERTIF.value, document.miForm.FEFECTO.value,document.miForm.SPROCES.value,document.miForm.TEMPRES.value,document.miForm.TTITULO.value,document.miForm.TRAMO.value);                 
                    }
                    else{
                        alert('<fmt:message key="9000505"/>');
                    }
                }
            }
           
           
            function f_but_cancelar() {
                parent.f_cerrar_modal('axisctr110');
            }
        

            function f_cargar_propiedades_pantalla(){
                f_cargapropietatexpander();
                f_cargar_valores_defecto();
                objDependencias.modificarPropiedadesSegunModificableYVisible();
                f_carga_dependencias();
                revisarEstilos();
            }
            
            function f_recarga_combos(comboOrigen) {
                var CEMPRES = objDom.getValorPorId("CEMPRES");
                var CRAMO   = objDom.getValorPorId("CRAMO");
                var TIPO   = objDom.getValorPorId("TIPO");
                
                objAjax.invokeAsyncCGI("modal_axisctr110.do", callbackAjaxActualizarCombos, 
                "operation=actualizar_combos&comboOrigen=" + comboOrigen + "&CEMPRES=" + CEMPRES + 
                "&CRAMO=" + CRAMO + "&TIPO="+ TIPO, this, objJsMessages.jslit_actualizando_registro, comboOrigen);
            }
            
            function callbackAjaxActualizarCombos(ajaxResponseText, comboOrigen) {
                var doc = objAjax.domParse(ajaxResponseText);
                
                try {            
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                        switch (comboOrigen) {
                            case 'E':   rellenarCombo(doc, "CRAMO");   // falls-through
                            case 'R':   rellenarCombo(doc, "SPRODUC"); 
                        }
                    }            
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
            }
            
            function rellenarCombo(doc, comboName) {
                var combo = document.getElementById(comboName);
                objDom.borrarOpcionesDeCombo(combo);
                objDom.addOpcionACombo("", "- " + objJsMessages.jslit_seleccionar + " -", combo, null);
                
                if (objUtiles.existeObjetoXml(doc.getElementsByTagName(comboName)[0])){    
                    var elementos = doc.getElementsByTagName(comboName)[0].getElementsByTagName("element");
                    var numElementos = elementos.length;
                    if (numElementos == 1)
                        objDom.borrarOpcionesDeCombo(combo);
                    
                    for (var i = 0; i < numElementos; i++) {
                        var CATRIBUyTATRIBU = recuperaCATRIBUyTATRIBU(elementos[i]);
                        var CATRIBU = CATRIBUyTATRIBU[0];
                        var TATRIBU = CATRIBUyTATRIBU[1];
                        
                        //objDom.addOpcionACombo(CATRIBU, TATRIBU, combo, null);
                        myOption = new Option(TATRIBU,CATRIBU, false, false);
                        if(comboName=="CRAMO"){
                            myOption.setAttribute('onclick',"javascript:objDom.setValorPorId('TRAMO','"+TATRIBU+"');");
                        }
                        if(comboName=="SPRODUC"){
                           myOption.setAttribute('onclick',"javascript:objDom.setValorPorId('TTITULO','"+TATRIBU+"');"); 
                        }
                        combo.options[i+1] = myOption;
                    }
                    if (numElementos == 1) {
                        // Seleccionar la única opción del combo y ejecutar
                        // su llamada onchange para recuperar combos dependientes y onclick para obtener su texto descriptivo.
                        combo[0].selected = "1";
                        combo.onclick();
                        combo.onchange(); 
                    }
                }
            }
            
            function recuperaCATRIBUyTATRIBU(elemento) {
                var CATRIBU;
                var TATRIBU;
                
                if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("SPRODUC")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("SPRODUC"), 0, 0);
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TTITULO")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TTITULO"), 0, 0);                            
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CRAMO")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CRAMO"), 0, 0);                            
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TRAMO")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TRAMO"), 0, 0);      
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CATRIBU")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CATRIBU"), 0, 0);
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TATRIBU")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TATRIBU"), 0, 0);
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CACTIVI")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CACTIVI"), 0, 0);                            
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TTITULO")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TTITULO"), 0, 0);                        
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CGARANT")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CGARANT"), 0, 0);                            
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TGARANT")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TGARANT"), 0, 0);                        
                }
                
                var retVal = new Array(2);
                retVal[0] = CATRIBU;
                retVal[1] = TATRIBU;
                
                return retVal;
            }
            
            function f_abrir_axisctr014() {            
                objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");            
            }
            
            function f_actualizar_agente(){
                objAjax.invokeAsyncCGI("modal_axisctr110.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + objDom.getValorComponente(document.miForm.CAGENTE_TEXT), this, objJsMessages.jslit_cargando);
            }
        
            function callbackAjaxCargarAgente(ajaxResponseText){                    
                var doc=objAjax.domParse(ajaxResponseText);
                var elementos = doc.getElementsByTagName("element");
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                        var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                        objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado);
                        objDom.setValorPorId("CAGENTE", CAGENTEformateado);
                        objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado); 
                    }else{
                        objDom.setValorPorId("NOMBRE_TEXT","");
                        objDom.setValorPorId("CAGENTE_TEXT","");
                        objDom.setValorPorId("CAGENTE","");
                    }
                }
            }
            
            function f_aceptar_axisctr014 (CAGENTE){
                objDom.setValorPorId("CAGENTE", CAGENTE);
                f_cerrar_axisctr014();
                objAjax.invokeAsyncCGI("modal_axisctr110.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            }
            
            function f_cerrar_axisctr014() {
                objUtiles.cerrarModal("axisctr014");
            } 
            
            function callbackAjaxCambiarAgente(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                    var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                    objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado);
                    objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado);
                }
            } 
            
            

        </script>
    </head>
 <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt c="axisctr014" f="axisctr110" lit="9901458"/></c:param>
                <c:param name="nid" value="axisctr014" />
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            
            <input type="hidden" id="TIPO" name="TIPO" value="FE_DE_VIDA"/>                
            <input type="hidden" name="CAGENTE" id="CAGENTE" value="${sessionScope.axisctr_agente.CODI}"/>
            <input type="hidden" id="TEMPRES" name="TEMPRES" value="${__formdata.TEMPRES}"/> 
            <input type="hidden" id="TTITULO" name="TTITULO" value="${__formdata.TTITULO}"/> 
            <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/> 
            
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="form" f="axisctr110" lit="9901458"/></c:param>
                <c:param name="producto"><axis:alt c="form" f="axisctr110" lit="9901458"/></c:param>
                <c:param name="form">axisctr110</c:param>
            </c:import>
            <!-- Area de campos  -->
            
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="9901461"/></div> <%-- Buscador Cartas Fe de Vida --%>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisctr110" c="CEMPRES" dejarHueco="false">
                                                <td class="titulocaja" id="tit_CEMPRES">
                                                    <b id="label_CEMPRES"><axis:alt f="axisctr110" c="CEMPRES" lit="101619" /></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr110" c="CRAMO" dejarHueco="false">
                                                <td class="titulocaja" id="tit_CRAMO">
                                                    <b id="label_CRAMO"><axis:alt f="axisctr110" c="CRAMO" lit="100784" /></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr110" c="SPRODUC" dejarHueco="false">
                                                <td class="titulocaja" id="tit_SPRODUC">
                                                    <b id="label_SPRODUC"><axis:alt c="SPRODUC" f="axisctr110" lit="100829"/></b>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>                                        
                                            <%-- Empresa --%>                                            
                                            <axis:ocultar f="axisctr110" c="CEMPRES" dejarHueco="false">
                                                <td class="campocaja" id="td_CEMPRES">
                                                    <select name="CEMPRES" id ="CEMPRES" size="1"  class="campowidthinput campo campotexto_ob" style="width:90%"
                                                    title="<fmt:message key="101619"/>" onchange="f_recarga_combos('E')"
                                                    <axis:atr f="axisctr110" c="CEMPRES" a="isInputText=false&obligatorio=true"/>>
                                                        <option value="<%=Integer.MIN_VALUE%>"> - <fmt:message key="108341"/> - </option>                                                                                                        
                                                        <c:forEach var="item" items="${__formdata.LSTEMPRESAS}">
                                                            <option value = "${item.CEMPRES}" <c:if test="${!empty __formdata.CEMPRES && __formdata.CEMPRES == item.CEMPRES}">selected</c:if>>${item.TEMPRES}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axisctr110" c="CRAMO" dejarHueco="false">
                                                <td class="campocaja" id="td_CRAMO">
                                                    <select name = "CRAMO" id="CRAMO" style="width:95%;" size="1"  title="<fmt:message key="100784"/>"
                                                    onchange="f_recarga_combos('R')"
                                                    <axis:atr f="axisctr110" c="CRAMO" a="modificable=true&obligatorio=false&isInputText=false"/> 
                                                    class="campowidthselect campo campotexto">
                                                        <option value = "<%= Integer.MIN_VALUE %>"> - <fmt:message key="108341"/> - </option>
                                                        <c:forEach var="ramos" items="${__formdata.axisctr_listaRamos}">
                                                            <option value = "${ramos.CRAMO}" onclick="objDom.setValorPorId('TRAMO','${ramos.TRAMO}')"
                                                                <c:if test="${ramos.CRAMO == __formdata.CRAMO}">selected</c:if>>
                                                                ${ramos.TRAMO}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:ocultar> 
                                            
                                            <%-- Producto --%>
                                            <axis:ocultar f="axisctr110" c="SPRODUC" dejarHueco="false">
                                                <td class="campocaja" colspan="2" id="td_SPRODUC">
                                                    <select name="SPRODUC" id ="SPRODUC" size="1" onchange="" class="campo campotexto" style="width:95%"
                                                    title="<fmt:message key="100829"/>" <axis:atr f="axisctr110" c="SPRODUC" a="isInputText=false"/>>
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <fmt:message key="108341"/> - </option>
                                                        <c:forEach items="${__formdata.productos}" var="item">
                                                            <option value = "${item.SPRODUC}"  <c:if test="${!empty __formdata.SPRODUC && __formdata.SPRODUC == item.SPRODUC}"> selected </c:if>>${item.TTITULO}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisctr110" c="CAGENTE" dejarHueco="false">
                                                <td class="titulocaja" id="tit_CAGENTE">
                                                    <b id="label_CAGENTE"><axis:alt f="axisctr110" c="CAGENTE" lit="100584"/></b>
                                                </td>
                                            </axis:ocultar>                                       
                                        </tr>
                                        <tr>
                                           <axis:ocultar c="CAGENTE" f="axisctr110" dejarHueco="false">
                                                <td class="campocaja" colspan="2" id="TD_CAGENTE">                                                        
                                                    <input type="text" name="CAGENTE_TEXT" id="CAGENTE_TEXT" style="width:15%;" value="${sessionScope.axisctr_agente.CODI}" class="campowidthinput campo campotexto" 
                                                        <axis:atr f="axisctr110" c="CAGENTE" a="modificable=true"/> onchange="f_actualizar_agente()" />
                                                    <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                                    &nbsp;&nbsp;&nbsp;
                                                    <input readonly="true" type="text" style="width:50%;" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${sessionScope.axisctr_agente.NOMBRE}" class="campowidthinput campo campotexto"/>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <%-- Número de póliza --%>
                                            <axis:ocultar c="NPOLIZA" f="axisctr110" dejarHueco="false">
                                                <td class="titulocaja" id="tit_NPOLIZA">
                                                    <b id="label_NPOLIZA"><axis:alt f="axisctr110" c="NPOLIZA" lit="100624"/></b>
                                                </td>    
                                            </axis:ocultar>
                                            <%-- Número certificado --%>
                                            <axis:ocultar c="NCERTIF" f="axisctr110" dejarHueco="false">
                                                <td class="titulocaja" id="tit_NCERTIF">
                                                    <b id="label_NCERTIF"><axis:alt f="axisctr110" c="NCERTIF" lit="101300"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <!-- Fecha efecto -->
                                            <axis:ocultar f="axisctr110" c="FEFECTO" dejarHueco="false"> 
                                                <td class="titulocaja" id="tit_FEFECTO">
                                                    <b id="label_FEFECTO"><axis:alt f="axisctr110" c="FEFECTO" lit="9002169"/></b>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <%-- Número de póliza --%>
                                            <axis:ocultar c="NPOLIZA" f="axisctr110" dejarHueco="false">
                                                <td class="campocaja" id="TD_NPOLIZA">
                                                    <input style="width:90%" type="text" class="campowidthinput campo campotexto" id="NPOLIZA" name="NPOLIZA" size="15"
                                                    value="${__formdata.NPOLIZA}"/>
                                                </td>
                                            </axis:ocultar>
                                            <%-- Número certificado --%>
                                            <axis:ocultar c="NCERTIF" f="axisctr110" dejarHueco="false">
                                                <td class="campocaja" id="TD_NCERTIF">
                                                    <input style="width:90%" type="text" class="campowidthinput campo campotexto" id="NCERTIF" name="NCERTIF" size="15"
                                                    value="${__formdata.NCERTIF}"/>
                                                </td>
                                            </axis:ocultar>
                                            <!-- Fecha efecto -->
                                            <axis:ocultar f="axisctr110" c="FEFECTO" dejarHueco="false">
                                                <td class="campocaja" id="TD_FEFECTO">
                                                    <jsp:useBean id="today" class="java.util.Date" /> 
                                                    <c:set var="FEFECTO"><fmt:formatDate pattern="dd/MM/yyyy" value="${sessionScope.axisctr_datosGestion.FEFECTO}"/></c:set>
                                                    <input style="width:85%" type="text" class="campowidthinput campo campotexto" id="FEFECTO" name="FEFECTO" size="15" 
                                                    <axis:atr f="axisctr110" c="FEFECTO" a="modificable=true&obligatorio=true&formato=fecha"/>
                                                    value="${FEFECTO} <c:if test="${empty FEFECTO}"><fmt:formatDate pattern="dd/MM/yyyy" value="${today}"/></c:if>"
                                                    title="<fmt:message key="100883"/>"/><a id="icon_FEFECTO" style="vertical-align:middle;"><img 
                                                     alt="<fmt:message key="108341"/>" title="<fmt:message key="100883" />" src="images/calendar.gif"/></a>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                    </table>
                                    <!-- Área 2 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisctr110" c="SPROCES" dejarHueco="false">                                            
                                                <td class="titulocaja" colspan="2" id="tit_SPROCES">
                                                    <b id="label_SPROCES"><axis:alt f="axisctr110" c="SPROCES" lit="1000576"/></b>  <%-- Proceso --%>
                                                </td>
                                            </axis:ocultar>
                                        </tr> 
                                        <tr>
                                            <axis:ocultar f="axisctr110" c="SPROCES" dejarHueco="false">                                            
                                                <td class="campocaja" id="TD_SPROCES">                             
                                                    <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                    value="${__formdata.SPROCES}" name="SPROCES" id="SPROCES" 
                                                    style="width:67%;" title="<fmt:message key="1000576"/>"
                                                    <axis:atr f="axisctr110" c="SPROCES" a="formato=entero"/> />
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
        </form>
       

<c:import url="../include/botonera_nt.jsp">
           <c:param name="f">axisctr110</c:param>
            <c:param name="__botones"><axis:ocultar f="axisctr110" c = "BT_CANCELAR" dejarHueco="false">cancelar</axis:ocultar><axis:ocultar f="axisctr110" c = "BT_BUSCAR" dejarHueco="false">,buscar</axis:ocultar></c:param>

</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>


<script type="text/javascript">

    <axis:ocultar f="axisctr110" c="FEFECTO" dejarHueco="false">
        Calendar.setup({
            inputField     :    "FEFECTO",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FEFECTO", 
            singleClick    :    true,
            firstDay       :    1
        });
    </axis:ocultar>

</script>

