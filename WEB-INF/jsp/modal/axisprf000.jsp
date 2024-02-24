<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <%-- Especial per controlar els scroll amb iPad --%>
    <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
    <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
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
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {            
            f_cargar_propiedades_pantalla();
            var aceptar = "${__formdata.aceptar}";
            if ((!objUtiles.estaVacio(aceptar))&&(aceptar=="0")){
               parent.f_aceptar_modal("axisprf000");
            }
            var SPROFES_OUT = "${requestScope.SPROFES_OUT}";
            if (!objUtiles.estaVacio(SPROFES_OUT)) {
                parent.f_aceptar_modal("axisprf000","pCodiProf="+SPROFES_OUT);
            }
            var tipper = "${__formdata.CTIPPER}";
            if ($("#CTIPPER").val()<"0" && objUtiles.estaVacio(tipper)){ 
                $("#CTIPPER").val("1");
            }
             $("#pSPROFES").focus();
        }
                
        function f_but_cancelar() {
            parent.f_but_salir(); 
        }        
        
        function f_but_buscar() {
            if ($("#CTIPIDE").val() == "<%= Integer.MIN_VALUE %>" ){
                $("#CTIPIDE").val(null) ;
            }
            if ($("#CTIPPRO").val() == "<%= Integer.MIN_VALUE %>" ){
                $("#CTIPPRO").val(null) ;
            }   
            if ($("#CSUBPRO").val() == "<%= Integer.MIN_VALUE %>" ){
                $("#CSUBPRO").val(null) ;
            } 
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisprf000.do","busqueda_profesional",document.miForm, "_self", objJsMessages.jslit_buscando_personas);   
            }
        }
        
        function f_seleccionar_profesional (SPROFES) {
            if (objUtiles.estaVacio(SPROFES))
                alert (objJsMessages.jslit_error_de_seleccion);
            else{
                objDom.setValorPorId ("SPROFES", SPROFES);
                objUtiles.ejecutarFormulario("modal_axisprf000.do","traspaso_profesional",document.miForm, "_self", objJsMessages.jslit_buscando_personas);   
            }
         }
         
        function f_but_nuevo() {
            objAjax.invokeAsyncCGI("modal_axisprf000.do", callbackAjaxCargarSprofes, "operation=ajax_busqueda_sprofes",
                                   this, objJsMessages.jslit_cargando);
        }
        
        function f_abrir_axisper010NOU(isNew){
                f_cerrar_axisper008();
                objDom.setVisibilidadPorId('but_cerrar_modal_axisper010', 'hidden');
                objUtiles.abrirModal("axisper010","src","modal_axisper010.do?operation=form&isNew="+isNew);
        } 
        
        function f_aceptar_axisper010(selectedPerson,selectedagent){
                $("#SPERSON").val(selectedPerson);
                f_cerrar_axisper010(null);
                objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=datosgenerales&faceptar=f_aceptar_mtn_axisper001&SPERSON="+selectedPerson+"&CAGENTEselected="+selectedagent, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        function f_cerrar_axisper010(isNew) {
            objUtiles.cerrarModal("axisper010");
            selectedPerson = '${dades_persona.SPERSON}';
            if (!objUtiles.estaVacio(isNew)) {
                if (isNew)
                    f_abrir_axisper008();     
            }else
                objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=datosgenerales&faceptar=f_aceptar_mtn_axisper001&SPERSON="+selectedPerson+"&CAGENTEselected="+document.miForm.CAGENTE.value, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        function callbackAjaxCargarSprofes(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);  
            var elementos = doc.getElementsByTagName("SPROFES");  
            for (i = 0; i < elementos.length; i++) {
                var SPROFES = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPROFES"), i, 0);
                objDom.setValorPorId("SPROFES",SPROFES);
                objDom.setValorPorId("pCodiProf",SPROFES);
            }
            parent.actualizaSprofes(SPROFES);
            parent.f_abrir_modal('axisper021',null,'&MODO_SWPUBLI=PERSONAS_PUBLICAS&pCodiProf='+$("#SPROFES").val());

            $.reinitialiseScroll(); 
        }
        
        function f_onchange_TIDENTI(TIDENTI) {
            formdataTIDENTI = '${__formdata.CTIPPER}';    
            if (TIDENTI != "<%= Integer.MIN_VALUE %>" && TIDENTI != formdataTIDENTI && (formdataTIDENTI == 2 || TIDENTI == 2)) {
                // Recargar formulario para esconder/mostrar campos en función de TIDENTI
                objUtiles.ejecutarFormulario("modal_axisprf000.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        }
        
        function f_seleccionar_sprofes (SPROFES,SPERSON, NNUMIDE, TNOMBRE) {
            if (objUtiles.estaVacio(SPROFES))
                alert (objJsMessages.jslit_error_de_seleccion);
            else{
                parent.f_aceptar_modal("axisprf000", "SPROFES="+SPROFES+"&SPERSON="+SPERSON+"&NNUMIDE="+NNUMIDE+"&TNOMBRE="+TNOMBRE);
            }
         }
        function f_cargar_poblaciones(thiss){
                objAjax.invokeAsyncCGI("axis_axislist002.do", callbackAjaxCargarCombosPoblaciones, "operation=ajax_cargarPoblaciones&CPROVIN="+thiss, this, objJsMessages.jslit_cargando);  
        }
        
        function callbackAjaxCargarCombosPoblaciones(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var elementos = doc.getElementsByTagName("VALOR");
                var CPOBLACcombo = document.miForm.CPOBLAC;     
                objDom.borrarOpcionesDeCombo(CPOBLACcombo);
                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - ', 
                                       CPOBLACcombo, 0);
                for (i = 0; i < elementos.length; i++) {
                    var VALOR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("VALOR"), i, 0);
                    var TEXTO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TEXTO"), i, 0);                                     
                    objDom.addOpcionACombo(VALOR, TEXTO, CPOBLACcombo, i+1);
                }
            }
        }
    </script>
  </head>
    <body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="SPROFES" id="SPROFES" value="" />
            <input type="hidden" name="CAGENTE" id="CAGENTE" value="" />
            <input type="hidden" name="pantalla" id="pantalla" value="${__formdata.pantalla}" />
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisprf000" c="FORM" lit="9904783" /></c:param>
                <c:param name="producto"><axis:alt f="axisprf000" c="FORM" lit="9904783" /></c:param>
                <c:param name="form">axisprf000</c:param>
            </c:import>
            
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisprf000" c="SPROFES" dejarHueco="false"> 
                                                  <td class="titulocaja" >
                                                      <b><axis:alt f="axisprf000" c="SPROFES" lit="9904784"/></b>
                                                  </td>
                                            </axis:ocultar>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisprf000" c="CTIPPER" lit="102844"/></b>
                                            </td>
                                            <axis:ocultar f="axisprf000" c="CTIPIDE" dejarHueco="false"> 
                                                  <td class="titulocaja" colspan = "2">
                                                      <b><axis:alt f="axisprf000" c="CTIPIDE" lit="109774"/></b>
                                                  </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisprf000" c="NNUMIDE" dejarHueco="false"> 
                                                  <td class="titulocaja">
                                                      <b><axis:alt f="axisprf000" c="NNUMIDE" lit="9000760"></axis:alt></b>
                                                  </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                        <axis:visible f="axisprf000" c="pSPROFES" >
                                              <td class="campocaja">
                                                  <input type="text" class="campo campotexto" value="${__formdata['SPROFES']}" name="pSPROFES" id="pSPROFES" size="15"/>
                                              </td>
                                        </axis:visible>
                                       
                                        <td class="campocaja"><!-- ** LCF ** __formdata.TIDENTI NOMBRE CAMPO -->
                                            <select name="CTIPPER" id="CTIPPER" size="1" class="campowidthselect campo campotexto" style="width:90%;"
                                                    onchange="f_onchange_TIDENTI(this.value)" >&nbsp;
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisprf000" c="SNV_COMBO" lit="1000348"/> - </option>
                                            <c:forEach var="element" items="${__formdata.tipPerson}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CTIPPER}"> selected </c:if> > <!-- ** LCF ** __formdata.TIDENTI -->
                                            ${element.TATRIBU} 
                                            </option>
                                            </c:forEach>
                                            </select>
                                        </td>
                                        <axis:visible f="axisprf000" c="CTIPIDE" > 
                                              <td class="campocaja" colspan = "2" >
                                                <select name="CTIPIDE" id="CTIPIDE" size="1" class="campowidthselect campo campotexto">&nbsp;
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisprf000" c="SNV_COMBO" lit="1000348"/> - </option>
                                                    <c:forEach var="element" items="${__formdata.tipDocum}">
                                                        <option value = "${element.CATRIBU}">${element.TATRIBU}</option>
                                                    </c:forEach>
                                                </select>
                                              </td>
                                        </axis:visible>
                                        <axis:visible f="axisprf000" c="NNUMIDE" >
                                              <td class="campocaja">
                                                  <input type="text" class="campo campotexto" value="${__formdata['NNUMIDE']}" name="NNUMIDE" id="NNUMIDE" size="15"/>
                                              </td>
                                        </axis:visible>
                                        </tr>
                                        <tr>
                                        <axis:visible f="axisprf000" c="TNOMBRE">
                                        <td class="titulocaja" colspan="2">
                                                  <b><axis:alt f="axisprf000" c="TNOMBRE" lit="105940" /></b>
                                        </td>
                                        </axis:visible>                                           	
                                        <axis:visible f="axisprf000" c="CTIPPRO">
                                        <td class="titulocaja" >
                                                  <b><axis:alt f="axisprf000" c="CTIPPRO" lit="9903408" /></b>
                                        </td>
                                        </axis:visible>
                                        <axis:visible f="axisprf000" c="CSUBPRO">
                                        <td class="titulocaja" >
                                                  <b><axis:alt f="axisprf000" c="CSUBPRO" lit="9902570" /></b>
                                        </td>
                                        </axis:visible>
                                        <axis:ocultar f="axisprf007" c="CPROVIN" dejarHueco="false">                 
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisprf007" c="CPROVIN" lit="100756"/></b>
                                        </td> 
                                        </axis:ocultar>
                                        <axis:visible f="axisprf007" c="CPOBLAC">
                                        <td class="titulocaja" id="tit_CPOBLAC">
                                            <b id="label_CPOBLAC"><axis:alt f="axisprf007" c="CPOBLAC" lit="9903660"/></b>
                                        </td>
                                        </axis:visible>
                                        </tr>
                                        <tr>
                                        <axis:visible f="axisprf000" c="TNOMBRE">
                                        <td class="campocaja" colspan="2">
                                                  <input type="text" class="campo campotexto" value="${__formdata['TNOMBRE']}" name="TNOMBRE" id="TNOMBRE" size="15"/>
                                              </td>
                                        </axis:visible>                                             	
                                        <axis:ocultar f="axisprf000" c="CTIPPRO" dejarHueco="false"> 
                                         <td class="campocaja">
                                         <select name="CTIPPRO" id="CTIPPRO" size="1" class="campowidthselect campo campotexto">
                                         <option value="<%= Integer.MIN_VALUE %>">
                                         <axis:alt f="axisprf000" c="SELECCIONAR" lit="108341"/>                                
                                         </option>
                                         <c:forEach var="tipo_prof" items="${__formdata.TIPOSPROF}">
                                         <option value="${tipo_prof.CATRIBU}">${tipo_prof.TATRIBU}</option>
                                     </c:forEach>
                                 </select>
                                 </td>
                               </axis:ocultar> 
                               <axis:ocultar f="axisprf000" c="CSUBPRO" dejarHueco="false"> 
                                 <td class="campocaja">
                                 <select name="CSUBPRO" id="CSUBPRO" size="1" class="campowidthselect campo campotexto">
                                     <option value="<%= Integer.MIN_VALUE %>">
                                       <axis:alt f="axisprf000" c="SELECCIONAR" lit="108341"/>                                
                                     </option>
                                     <c:forEach var="tipo_subprof" items="${__formdata.TIPOSSUBPROF}">
                                         <option value="${tipo_subprof.CATRIBU}">${tipo_subprof.TATRIBU}</option>
                                     </c:forEach>
                                 </select>
                                 </td>
                               </axis:ocultar>
                              <axis:ocultar f="axisprf000" c="CPROVIN" dejarHueco="false">
                              <td class="campocaja"  id="td_CPROVIN" >
                                  <select name="CPROVIN" id="CPROVIN" size="1" class="campowidthselect campo campotexto_op" style="width:85%;"
                                          onchange="f_cargar_poblaciones(this.value)"
                                          <axis:atr f="axisprf000" c="CPROVIN" a="obligatorio=false&isInputText=false"/>>
                                      <option value="<%= Integer.MIN_VALUE %>">
                                          - <axis:alt f="axisprf000" c="SELEC" lit="1000348"/> - 
                                      </option>
                                      <c:forEach var="element" items="${__formdata.PROVINCIAS}">
                                      <option value = "${element.CODIGO}"
                                              <c:if test="${__formdata['CPROVIN'] == element.CODIGO}"> selected </c:if>>
                                          ${element.TEXTO}
                                      </option>
                                      </c:forEach>
                                  </select>
                              </td>
                              </axis:ocultar>
                              <axis:visible f="axisprf000" c="CPOBLAC">
                                  <td class="campocaja" id="td_CPOBLAC">
                                      <select name = "CPOBLAC" id="CPOBLAC" paramMap="true"    size="1" 
                                              title="<axis:alt f="axisprf000" c="td_CPOBLAC" lit="9903660"/>"
                                              class="campowidthselect campo campotexto" 
                                                  <axis:atr f="axisprf000" c="CPOBLAC" a="obligatorio=false&isInputText=false"/>>
                                          <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisprf000" c="SNV_COMBO" lit="108341"/> - </option>
                                          <c:forEach var="poblaciones" items="${__formdata.POBLACIONES}">
                                              <option value = "${poblaciones.VALOR}"
                                              <c:if test="${__formdata.CPOBLAC == poblaciones.VALOR}"> selected </c:if>>
                                              ${poblaciones.TEXTO}</option>
                                          </c:forEach>
                                      </select>
                                  </td>
                              </axis:visible>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    
                        <div class="separador">&nbsp;</div>
                            <!-- DisplayTag ListaPersonas -->
                            <c:set var="title0"><axis:alt f="axisprf000" c="SPROFES" lit="9904784"/></c:set>
                            <c:set var="title1"><axis:alt f="axisprf000" c="NNUMIDE" lit="9903661"/></c:set>
                            <c:set var="title2"><axis:alt f="axisprf000" c="TNOMBRE" lit="105940"/></c:set>
                            <c:set var="title3"><axis:alt f="axisprf000" c="CTIPPRO" lit="9903408"/></c:set>
                            <c:set var="title4"><axis:alt f="axisprf000" c="CSUBPRO" lit="9902570"/></c:set>
                            <c:set var="title5"><axis:alt f="axisprf000" c="MOD" lit="9000724"/></c:set>
                            <c:set var="title6"><axis:alt f="axisprf000" c="TZONA_GEO" lit="9904708"/></c:set>
            
                            <div class="seccion displayspaceProfesionales">
                                <display:table name="${sessionScope.axisprf000_listaProfesionales}" id="miListaId" export="false" class="dsptgtable" pagesize="15" defaultsort="1" defaultorder="ascending" requestURI="modal_axisprf000.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <c:if test="${__formdata.pantalla == 'destinatario'}">
                                        <display:column sortable="true"
                                                      sortProperty=""
                                                      headerClass="sortable fixed"
                                                      media="html" autolink="false" style="width:4%">
                                        <div class="dspText">
                                        <input type="radio" id="SPROFES_sel" name="SPROFES_sel" value="${miListaId['SPROFES']}" 
                                               onchange="f_seleccionar_sprofes(${miListaId['SPROFES']}, '${miListaId['SPERSON']}', '${miListaId['NNUMIDE']}','${miListaId['TNOMBRE']}')"/>
                                        </div>
                                        </display:column>
                                    </c:if>
                                    <display:column title="${title0}" sortable="true" style="width:8%;" sortProperty="SPROFES" headerClass="headwidth5 sortable"
                                                    media="html" autolink="false" >
                                        <div class="dspNumber">${miListaId['SPROFES']}</div>
                                    </display:column>
                                    <display:column title="${title1}" sortable="true" style="width:8%;" sortProperty="NNUMIDE" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText">
                                            ${miListaId['NNUMIDE']}
                                        </div>
                                    </display:column>
                                    <axis:visible f="axisprf000" c="TNOMBRE">
                                    <display:column title="${title2}" sortable="true" style="width:30%;" sortProperty="TNOMBRE" headerClass="sortable"  media="html" 
                                                    autolink="false" >
                                        <div class="dspText">
                                            ${miListaId['TNOMBRE']}
                                        </div>
                                    </display:column>
                                    </axis:visible>
                                     <axis:visible f="axisprf000" c="TTIPPRO">
                                    <display:column title="${title3}" sortable="true" style="width:20%;" sortProperty="TTIPPRO" headerClass="sortable"  media="html" 
                                                    autolink="false" >
                                        <div class="dspText">
                                            ${miListaId['TTIPPRO']}
                                        </div>
                                    </display:column>    
                                    </axis:visible>
                                    <axis:visible f="axisprf000" c="TSUBPRO">
                                    <display:column title="${title4}" sortable="true" style="width:20%;" sortProperty="TSUBPRO" headerClass="sortable"  media="html" 
                                                    autolink="false" >
                                        <div class="dspText">
                                           ${miListaId['TSUBPRO']}
                                        </div>
                                    </display:column>
                                    </axis:visible>  
                                    <axis:visible f="axisprf000" c="TZONA_GEO">
                                    <display:column title="${title6}" sortable="true" style="width:20%;" sortProperty="TZONA_GEO" headerClass="sortable"  media="html" 
                                                    autolink="false" >
                                        <div class="dspText">
                                           ${miListaId['TZONA_GEO']}
                                        </div>
                                    </display:column>
                                    </axis:visible> 
                                    <c:if test="${__formdata.pantalla != 'destinatario'}">
                                        <axis:visible c="BT_EDIT_SINI" f="axissin019">
                                        <display:column title="${title5}" sortable="false" headerClass="sortable" media="html" autolink="false">
                                            <div class="dspIcon">
                                                 <a href="javascript:f_seleccionar_profesional('${miListaId['SPROFES']}')">
                                                 <img border="0" alt="<axis:alt f="axisprf000" c="EDITAR" lit="100002" />" 
                                                      title="<axis:alt f="axisprf000" c="EDITAR" lit="100002" />" src="images/lapiz.gif"/>
                                                 </a>
                                            </div>
                                        </display:column>
                                        </axis:visible>
                                    </c:if>
                                </display:table>
                            </div>	
                    </td>
                </tr>
            </table>						
            
            <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisprf000</c:param>
                <c:param name="__botones">
                    <c:if test="${__formdata.pantalla != 'destinatario'}">
                        <axis:visible f="axisprf000" c="BT_CANCELAR">cancelar</axis:visible><axis:visible f="axisprf000" c="BT_NUEVO">,nuevo</axis:visible><axis:visible f="axisprf000" c="BT_BUSCAR">,buscar</axis:visible>
                    </c:if>
                    <c:if test="${__formdata.pantalla == 'destinatario'}">
                        <axis:visible f="axisprf000" c="BT_CANCELAR">cancelar</axis:visible><axis:visible f="axisprf000" c="BT_BUSCAR">,buscar</axis:visible>
                    </c:if>
                </c:param>                
            </c:import>
        </form>
    <c:import url="../include/mensajes.jsp" />
    </div>
    </body>
    <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
      <script language="Javascript" type="text/javascript">  
        retocarPAGE_CSS('axisprf000');
      </script >                   
    </c:if>
</html>

