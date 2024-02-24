<%--
      NOMBRE:    axismnt018.jsp
      @author <a href = "mailto:joan_torres@csi-ti.com">Joan Torres</a>
      Fecha: 03/09/2012
      PROPÓSITO (descripción pantalla): Mantenimiento de CFG
  
      REVISIONES:
      Ver        Fecha        Autor             Descripción
      ---------  ----------  ---------------  ------------------------------------
      1.0        03/09/2012   JTS             1. Creación de la pantalla. Bug.23079
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
        
        <%--Inicio Sólo si vamos a tener un campo fecha --%>
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
        <%-- fin Sólo si vamos a tener un campo fecha --%>
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
            function f_onload(){
                f_cargar_propiedades_pantalla();//Función que nos carga todas las propiedades de pantalla
            }
            
            function f_abrir_modal_params(cual, optionalQueryString){
                optionalQueryString = optionalQueryString;
                f_abrir_modal(cual, optionalQueryString);
            }
            
            function f_abrir_modal(cual, optionalQueryString) {
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";
                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);   
            }
            
            function f_aceptar_axismnt019(PCEMPRES,PSPRODUC,PCMODO,PCCFGFORM,PCODFORM){
                f_cerrar_modal("axismnt019");
                //
                objDom.setValorPorId("BCEMPRES", PCEMPRES);
                objDom.setValorPorId("BSPRODUC", PSPRODUC);
                objDom.setValorPorId("BCMODO", PCMODO);
                objDom.setValorPorId("BCCFGFORM", PCCFGFORM);
                objDom.setValorPorId("BCODFORM", PCODFORM);
                /*
                objDom.setValorPorId("CEMPRES", PCEMPRES);
                objDom.setValorPorId("SPRODUC", PSPRODUC);
                objDom.setValorPorId("CMODO", PCMODO);
                objDom.setValorPorId("CCFGFORM", PCCFGFORM);
                objDom.setValorPorId("CODFORM", PCODFORM);
                */
                objUtiles.ejecutarFormulario("axis_axismnt018.do", "buscar", document.miForm, "_self", objJsMessages.jslit_buscando);
            }
            
            function f_aceptar_axismnt020(){
                f_cerrar_modal("axismnt020");
                objUtiles.ejecutarFormulario("axis_axismnt018.do", "buscar", document.miForm, "_self", objJsMessages.jslit_buscando);
            }
            
            function f_cerrar_modal(cual){
                 objUtiles.cerrarModal(cual);
            }
            
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axismnt018", "cancelar", document.miForm, "_self");
            }
            
            function f_onchange_empresa(pcempres){
                objDom.setValorPorId("CEMPRES", pcempres);
                objDom.setValorPorId("BCEMPRES", pcempres);
                objDom.setValorPorId("CIDCFG", "");
                objUtiles.ejecutarFormulario("axis_axismnt018.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_onchange_producto(psproduc){
                objDom.setValorPorId("SPRODUC", psproduc);
                objDom.setValorPorId("BSPRODUC", psproduc);
                objDom.setValorPorId("CIDCFG", "");
                objUtiles.ejecutarFormulario("axis_axismnt018.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_onchange_codmodo(pcodmodo){
                objDom.setValorPorId("CMODO", pcodmodo);
                objDom.setValorPorId("BCMODO", pcodmodo);
                objDom.setValorPorId("CIDCFG", "");
                objUtiles.ejecutarFormulario("axis_axismnt018.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }  
            
            function f_onchange_ccfgform(pccfgform){
                objDom.setValorPorId("BCCFGFORM", pccfgform);
                objDom.setValorPorId("CIDCFG", "");
            } 
            
            function f_onchange_codform(pcodform){
                objDom.setValorPorId("BCODFORM", pcodform);
                objDom.setValorPorId("CIDCFG", "");
            } 
            
            function f_but_nou(){
                f_abrir_modal("axismnt019","");
            }
            
            function f_but_reset(){
                objDom.setValorPorId("CEMPRES", null);
                objDom.setValorPorId("SPRODUC", null);
                objDom.setValorPorId("CMODO", null);
                objDom.setValorPorId("CCFGFORM", null);
                objDom.setValorPorId("CODFORM", null);
                
                objDom.setValorPorId("BCEMPRES", null);
                objDom.setValorPorId("BSPRODUC", null);
                objDom.setValorPorId("BCMODO", null);
                objDom.setValorPorId("BCCFGFORM", null);
                objDom.setValorPorId("BCODFORM", null);
                
                objUtiles.ejecutarFormulario("axis_axismnt018.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_but_buscar(){
                if (objValidador.validaEntrada()){
                    objDom.setValorPorId("BCEMPRES", objDom.getValorPorId("CEMPRES"));
                    objDom.setValorPorId("BSPRODUC", objDom.getValorPorId("SPRODUC"));
                    objDom.setValorPorId("BCMODO", objDom.getValorPorId("CMODO"));
                    objDom.setValorPorId("BCCFGFORM", objDom.getValorPorId("CCFGFORM"));
                    objDom.setValorPorId("BCODFORM", objDom.getValorPorId("CODFORM"));
                    objUtiles.ejecutarFormulario("axis_axismnt018.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }
            
            function f_but_9904153(){
                if (objValidador.validaEntrada()){
                    var CIDCFG = objDom.getValorPorId("CIDCFG");
                    var CEMPRES = objDom.getValorPorId("CEMPRES");
                    var SPRODUC = objDom.getValorPorId("SPRODUC");
                    var CMODO = objDom.getValorPorId("CMODO");
                    var CCFGFORM = objDom.getValorPorId("CCFGFORM");
                    var CODFORM = objDom.getValorPorId("CODFORM");
                    //alert(CEMPRES+SPRODUC+CMODO+CCFGFORM+CODFORM);
                    if (CIDCFG == '') alert("<axis:alt c='AVISO_NPROPIEDAD' f='axismnt018' lit='9904236'/>");
                    else f_abrir_modal("axismnt020","&PCIDCFG="+CIDCFG+"&PCEMPRES="+CEMPRES+"&PSPRODUC="+SPRODUC+"&PCMODO="+CMODO+"&PCCFGFORM="+CCFGFORM+"&PCODFORM="+CODFORM);
                }
            }
            
            function f_onchange_cvalue(CVALUE,CEMPRES,CIDCFG,CFORM,CITEM,CPRPTY){
                objAjax.invokeAsyncCGI("axis_axismnt018.do?PCVALUE="+CVALUE+"&PCEMPRES="+CEMPRES+"&PCIDCFG="+CIDCFG+
                "&PCFORM="+CFORM+"&PCITEM="+CITEM+"&PCPRPTY="+CPRPTY,
                callbackAjaxGuardar, "operation=guardar",  this, objJsMessages.jslit_cargando);
            }
            
            function f_but_borrar(CEMPRES,CIDCFG,CFORM,CITEM,CPRPTY){
                objAjax.invokeAsyncCGI("axis_axismnt018.do?PCEMPRES="+CEMPRES+"&PCIDCFG="+CIDCFG+
                "&PCFORM="+CFORM+"&PCITEM="+CITEM+"&PCPRPTY="+CPRPTY,
                callbackAjaxBorrar, "operation=borrar",  this, objJsMessages.jslit_cargando);
            }
            
            //CallBacks
            function callbackAjaxGuardar(ajaxResponse) {                
                var doc = objAjax.domParse(ajaxResponse);
                try {            
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                        //OK
                    }            
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
            }
            
            function callbackAjaxBorrar(ajaxResponse) {                
                var doc = objAjax.domParse(ajaxResponse);
                try {            
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                        objUtiles.ejecutarFormulario("axis_axismnt018.do", "buscar", document.miForm, "_self", objJsMessages.jslit_buscando);
                    }            
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
            }
            
        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>

    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axismnt019|<axis:alt c="lit_form_mod" f="axismnt018" lit="9904152"/></c:param>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axismnt020|<axis:alt c="lit_form_mod_cfg" f="axismnt018" lit="9904153"/></c:param>
    </c:import>
   


    <form name="miForm" action="" method="POST">
       <input type="hidden" name="operation" value=""/>
       <input type="hidden" name="BCEMPRES" id="BCEMPRES" value="${__formdata.BCEMPRES}"/>
       <input type="hidden" name="BSPRODUC" id="BSPRODUC" value="${__formdata.BSPRODUC}"/>
       <input type="hidden" name="BCMODO" id="BCMODO" value="${__formdata.BCMODO}"/>
       <input type="hidden" name="BCCFGFORM" id="BCCFGFORM" value="${__formdata.BCCFGFORM}"/>
       <input type="hidden" name="BCODFORM" id="BCODFORM" value="${__formdata.BCODFORM}"/>
       <input type="hidden" name="CIDCFG" id="CIDCFG" value="${__formdata.CIDCFG}"/>
        
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="lit_form" f="axismnt018" lit="9900732"/></c:param>
                <c:param name="producto"><axis:alt c="lit_form" f="axismnt018" lit="9900732"/></c:param>
                <c:param name="form">axismnt018</c:param>
            </c:import>
            <div class="separador">&nbsp;</div>
                      <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                    <axis:visible c="SEC_BUSC" f="axismnt018">
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                            <img src="images/flecha.gif"/><axis:alt c="LIT_TITULO1" f="axismnt018" lit="9900732"/>
                        </div>
                        <!-- Sección 1 -->
                        <table class="seccion">
                            <tr>
                                <td >
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:12.5%;height:0px"></th>
                                            <th style="width:12.5%;height:0px"></th>
                                            <th style="width:12.5%;height:0px"></th>
                                            <th style="width:12.5%;height:0px"></th>
                                            <th style="width:12.5%;height:0px"></th>
                                            <th style="width:12.5%;height:0px"></th>
                                            <th style="width:12.5%;height:0px"></th>
                                            <th style="width:12.5%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axismnt018" c="CEMPRES" dejarHueco="false">
                                                <td class="titulocaja" colspan ="2">
                                                    <b><axis:alt f="axismnt018" c="CEMPRES" lit="101619"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axismnt018" c="SPRODUC" dejarHueco="false">
                                                <td class="titulocaja" colspan ="2">
                                                    <b><axis:alt f="axismnt018" c="SPRODUC" lit="100829"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axismnt018" c="CCFGFORM" dejarHueco="false">
                                                <td class="titulocaja" colspan ="2">
                                                    <b><axis:alt f="axismnt018" c="CCFGFORM" lit="9001350"/></b>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                           <axis:ocultar f="axismnt018" c="CEMPRES" dejarHueco="false">
                                                <td class="campocaja" colspan ="2">                                
                                                    <select title="<axis:alt f="axismnt018" c="CEMPRES" lit="101619"/>" name="CEMPRES" id="CEMPRES" onchange="f_onchange_empresa(this.value)" <axis:atr f="axismnt018" c="CEMPRES" a="obligatorio=true&isInputText=false"/>  size="1" class="campowidthselect campo campotexto" style="width:95%;">&nbsp;
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axismnt018" c="BLANCO" lit="1000348"/> - </option>
                                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTEMPRESAS}">
                                                            <option value = "${element.CEMPRES}"
                                                            <c:if test="${__formdata.CEMPRES == element.CEMPRES}"> selected = "selected"</c:if> />
                                                                ${element.TEMPRES} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axismnt018" c="SPRODUC" dejarHueco="false">
                                                <td class="campocaja" colspan ="2">
                                                    <select title="<axis:alt f="axismnt018" c="SPRODUC" lit="100829"/>" name="SPRODUC" id="SPRODUC" onchange="f_onchange_producto(this.value)" <axis:atr f="axismnt018" c="SPRODUC" a="obligatorio=true&isInputText=false"/> size="1" class="campowidthselect campo campotexto" style="width:95%;">&nbsp;
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axismnt018" c="BLANCO" lit="1000348"/> - </option>
                                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTPRODUCTOS}">
                                                            <option value = "${element.SPRODUC}"
                                                            <c:if test="${__formdata.SPRODUC == element.SPRODUC}"> selected = "selected"</c:if> />
                                                                ${element.TTITULO} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axismnt018" c="CCFGFORM" dejarHueco="false">
                                                <td class="campocaja" colspan ="2">
                                                    <select title="<axis:alt f="axismnt018" c="CCFGFORM" lit="9001350"/>" name="CCFGFORM" id="CCFGFORM" onchange="f_onchange_ccfgform(this.value)" <axis:atr f="axismnt018" c="CCFGFORM" a="obligatorio=true&isInputText=false"/> size="1" class="campowidthselect campo campotexto" style="width:95%;">&nbsp;
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axismnt018" c="BLANCO" lit="1000348"/> - </option>
                                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCCFGFORM}">
                                                            <option value = "${element.CCFGFORM}"
                                                            <c:if test="${__formdata.CCFGFORM == element.CCFGFORM}"> selected = "selected"</c:if> />
                                                                ${element.TDESC} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td> 
                                            </axis:ocultar>
                                        </tr>
                                        
                                        <tr>
                                            <axis:ocultar f="axismnt018" c="CMODO" dejarHueco="false">
                                                <td class="titulocaja" colspan ="2">
                                                    <b><axis:alt f="axismnt018" c="CMODO" lit="9901139"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axismnt018" c="CODFORM" dejarHueco="false">
                                                <td class="titulocaja" colspan ="2">
                                                    <b><axis:alt f="axismnt018" c="CODFORM" lit="9000593"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <td class="titulocaja" colspan ="2">
                                                   &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                           <axis:ocultar f="axismnt018" c="CMODO" dejarHueco="false">
                                                <td class="campocaja" colspan ="2">                                
                                                    <select title="<axis:alt f="axismnt018" c="CMODO" lit="9901139"/>" name="CMODO" id="CMODO" onchange="f_onchange_codmodo(this.value)" <axis:atr f="axismnt018" c="CMODO" a="obligatorio=true&isInputText=false"/>  size="1" class="campowidthselect campo campotexto" style="width:95%;">&nbsp;
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axismnt018" c="BLANCO" lit="1000348"/> - </option>
                                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCODMODO}">
                                                            <option value = "${element.CMODO}"
                                                            <c:if test="${__formdata.CMODO == element.CMODO}"> selected = "selected"</c:if> />
                                                                ${element.CMODO}&nbsp;-&nbsp;${element.TMODO} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axismnt018" c="CODFORM" dejarHueco="false">
                                                <td class="campocaja" colspan ="2">
                                                    <select title="<axis:alt f="axismnt018" c="CODFORM" lit="9000593"/>" name="CODFORM" id="CODFORM" onchange="f_onchange_codform(this.value)" <axis:atr f="axismnt018" c="CODFORM" a="obligatorio=true&isInputText=false"/> size="1" class="campowidthselect campo campotexto" style="width:95%;">&nbsp;
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axismnt018" c="BLANCO" lit="1000348"/> - </option>
                                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCODFORM}">
                                                            <option value = "${element.CFORM}"
                                                            <c:if test="${__formdata.CODFORM == element.CFORM}"> selected = "selected"</c:if> />
                                                                ${element.CFORM}&nbsp;-&nbsp;${element.TFORM} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:ocultar>
                                            <td class="campocaja" colspan="4" align="right">
                                                <input type="button" class="boton" id="but_1000428" onclick="f_but_nou()" value="<axis:alt f="axismnt018" c="but_1000428" lit="1000428" />"/>
                                                &nbsp;
                                                <input type="button" class="boton" id="but_9904040" onclick="f_but_reset()" value="<axis:alt f="axismnt018" c="but_9904040" lit="9904040" />"/>
                                                &nbsp;
                                                <input type="button" class="boton" id="but_9000508" onclick="f_but_buscar()" value="<axis:alt f="axismnt018" c="but_9000508" lit="9000508" />"/>    
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        </axis:visible>
                        <axis:visible f="axismnt018" c="SEC_MANT">
                        <div class="separador">&nbsp;</div>
                            <c:set var="title1"><axis:alt f="axismnt018" c="DSP_CPRPTY" lit="9001817"/></c:set>
                            <c:set var="title2"><axis:alt f="axismnt018" c="DSP_CCAMPO" lit="109373"/></c:set>
                            <c:set var="title3"><axis:alt f="axismnt018" c="DSP_CVALUE" lit="101159"/></c:set>
                            <div class="seccion displayspaceGrande">
                                <display:table name="${__formdata.PROPIEDADES}" id="miListaId" export="false" class="dsptgtable" pagesize="8" defaultsort="1" defaultorder="ascending" requestURI="axis_axismnt018.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <axis:visible f="axismnt018" c="CPRPTY">
                                        <display:column title="${title1}" style="width:30%;" sortable="true" sortProperty="CPRPTY" headerClass="sortable fixed"  media="html" autolink="false" >    
                                            <div class="dspText">${miListaId['CPRPTY']}&nbsp;-&nbsp;${miListaId['TCPRPTY']}</div>
                                        </display:column>
                                    </axis:visible>
                                    <axis:visible f="axismnt018" c="CCAMPO">
                                        <display:column title="${title2}" style="width:35%;" sortable="true" sortProperty="CITEM" headerClass="sortable fixed" media="html" autolink="false" >
                                            <div class="dspText">${miListaId['CITEM']}</div>
                                        </display:column>
                                    </axis:visible>
                                    <axis:visible f="axismnt018" c="CVALUE">
                                        <display:column title="${title3}" style="width:30%;" sortable="true" sortProperty="CVALUE" headerClass="sortable fixed" media="html" autolink="false" >
                                            <div class="dspCampo">
                                                <c:choose>
                                                    <c:when test="${miListaId.CPRPTY==1 || miListaId.CPRPTY==2 || miListaId.CPRPTY==3 || miListaId.CPRPTY==9 || miListaId.CPRPTY==12 || miListaId.CPRPTY==10}">
                                                        <select name="CVALUE" id="CVALUE" onchange="javascript:f_onchange_cvalue(this.value,'${miListaId.CEMPRES}','${miListaId.CIDCFG}','${miListaId.CFORM}','${miListaId.CITEM}','${miListaId.CPRPTY}');" <axis:atr f="axismnt018" c="CVALUE" a="obligatorio=true&isInputText=false"/> size="1" class="campowidthselect campo campotexto" style="width:90%;">&nbsp;
                                                            <c:forEach var="element" items="${__formdata.LISTVALORES.LSTSINO}">
                                                                <option value = "${element.CATRIBU}"
                                                                <c:if test="${miListaId.CVALUE == element.CATRIBU}"> selected = "selected"</c:if> />
                                                                    ${element.TATRIBU} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </c:when>
                                                    <c:when test="${miListaId.CPRPTY==11}">
                                                        <select name="CVALUE" id="CVALUE" onchange="javascript:f_onchange_cvalue(this.value,'${miListaId.CEMPRES}','${miListaId.CIDCFG}','${miListaId.CFORM}','${miListaId.CITEM}','${miListaId.CPRPTY}');" <axis:atr f="axismnt018" c="CVALUE" a="obligatorio=true&isInputText=false"/> size="1" class="campowidthselect campo campotexto" style="width:90%;">&nbsp;
                                                            <c:forEach var="element" items="${__formdata.LISTVALORES.LSTENMASCARA}">
                                                                <option value = "${element.CATRIBU}"
                                                                <c:if test="${miListaId.CVALUE == element.CATRIBU}"> selected = "selected"</c:if> />
                                                                    ${element.TATRIBU} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type= "text" class="campo campotexto" id="CVALUE" name="CVALUE" value="${miListaId.CVALUE}" onchange="javascript:f_onchange_cvalue(this.value,'${miListaId.CEMPRES}','${miListaId.CIDCFG}','${miListaId.CFORM}','${miListaId.CITEM}','${miListaId.CPRPTY}');"
                                                        <axis:atr f="axismnt018" c="CVALUE" a="modificable=true&obligatorio=true"/> style="width:89%;" />
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </display:column>
                                    </axis:visible>
                                    <axis:visible f="axismnt018" c="BBORRAR">
                                        <display:column title="" style="width:5%;" sortable="false" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspIcons">
                                                <a href="javascript:f_but_borrar('${miListaId.CEMPRES}','${miListaId.CIDCFG}','${miListaId.CFORM}','${miListaId.CITEM}','${miListaId.CPRPTY}');">
                                                    <img border="0"
                                                         alt='<axis:alt f="axismnt018" c="BBORRAR" lit="9001333"/>'
                                                         title='<axis:alt f="axismnt018" c="BBORRAR" lit="9001333"/>'
                                                         src="images/delete.gif"/>
                                                </a>
                                            </div>
                                        </display:column>
                                    </axis:visible>
                                    
                                </display:table>
                            </div>
                         </axis:visible>
                        
                    </td> 
                </tr>
            </table>
        
             <div class="separador">&nbsp;</div>
    </form>
    <!-- fin Sólo si vamos a tener un campo fecha !-->
    
    <c:import url="../include/botonera_nt.jsp">
       <c:param name="f">axismnt018</c:param>
       <c:param name="__botones"><axis:ocultar f="axismnt018" c = "BT_SALIR" dejarHueco="false">salir</axis:ocultar><axis:ocultar f="axismnt018" c = "BT_NUEVAPROP" dejarHueco="false">,9904153</axis:ocultar></c:param>
    </c:import>
    <c:import url="../include/mensajes.jsp" />
    
    </body>
</html>