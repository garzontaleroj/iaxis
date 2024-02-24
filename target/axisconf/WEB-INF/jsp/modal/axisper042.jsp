<%
/*
*  Fichero: axisper042.jsp
*  @author <a href = "mailto:mnustes@csi-ti.com">Marlon Nustes</a> 
*  Fecha: 12/05/2015
*/
%>

<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css"/>
        <%-- Especial para controlar los scroll con iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
        <%-- Especial para controlar los scroll con iPad --%>
        <c:import url="../include/carga_framework_js.jsp" />   
        
        <script language="Javascript" type="text/javascript">
        
        function f_onload() {
            if (document.all) // ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";
            f_cargar_propiedades_pantalla();
        }     
        
        function f_but_cancelar() {
            parent.f_cerrar_modal("axisper042");
        }        
        
        
        function f_abrir_axiscom001(CODIGO_LITERAL, CODIGO_CONSULTA, CODIGO_CONDICION,CODIGO_CP){
             objUtiles.abrirModal("axiscom001", "src", "modal_axiscom001.do?operation=form&CODIGO_LITERAL=" + CODIGO_LITERAL +
              "&CODIGO_CONSULTA=" + CODIGO_CONSULTA + "&CODIGO_CONDICION=" + CODIGO_CONDICION + "&CODIGO_CP=" + CODIGO_CP);
        }
        
        function f_aceptar_axiscom001(CODIGO, TEXTO, CODIGO_CONSULTA,CPROVIN){
            f_cerrar_axiscom001();
            if (!objUtiles.estaVacio(TEXTO))
                TEXTO = objUtiles.replaceAll(TEXTO, "-quote-", "\'");
            if (CODIGO_CONSULTA == "LISTA_PAIS") {
                objDom.setValorPorId("CPAIS", CODIGO);
                objDom.setVisibilidadPorId("findProvincia", "visible"); 
                objDom.setValorHTMLPorId("TPAIS_span", "<b>" + TEXTO + "</b>");
                limpiaCampos("CPAIS");
            }
            else if (CODIGO_CONSULTA == "LISTA_PROVINCIA") {
                objDom.setValorPorId("CPROVIN", CODIGO);
                objDom.setVisibilidadPorId("findPoblacion", "visible");
                objDom.setValorHTMLPorId("TPROVIN_span", "<b>" + TEXTO + "</b>");
                limpiaCampos("CPROVIN");
            }
            else if (CODIGO_CONSULTA == "LISTA_POBLACION") {
                objDom.setValorPorId("CPOBLAC", CODIGO);
                objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + TEXTO + "</b>");
                
            }  
        }
        
        function limpiaCampos (CAMPO){
            if(objUtiles.utilEquals(CAMPO, "CPAIS")){
                //Limpio província
                objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                
                
            }
            
            if(objUtiles.utilEquals(CAMPO, "CPAIS") ||
                objUtiles.utilEquals(CAMPO, "CPROVIN")){
                    //Limpio población
                    objDom.setValorPorId("CPOBLAC", "");
                    objDom.setValorHTMLPorId("TPOBLAC_span", "");
            }
        }
        
        function f_cerrar_axiscom001() {
            objUtiles.cerrarModal("axiscom001");
        }
        
        function f_onchange_CPAIS() {
            var CPAIS=objDom.getValorPorId("CPAIS");
            if (!objUtiles.estaVacio(CPAIS)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPAIS";
                qs=qs+"&CPAIS="+CPAIS;
                qs=qs+"&dt="+(new Date().getTime());
                var origen = 'CPAIS';
                objAjax.invokeAsyncCGI("modal_axisper042.do", callbackajaxdireccion, qs, this, null, origen)
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
                qs=qs+"&CPAIS="+CPAIS;
                qs=qs+"&CPOBLAC="+CPOBLAC;
                qs=qs+"&CPROVIN="+CPROVIN;
                qs=qs+"&dt="+(new Date().getTime());
                var origen = 'CPOBLAC';
                objAjax.invokeAsyncCGI("modal_axisper042.do", callbackajaxdireccion, qs, this, null, origen)
            } else {
                objDom.setValorPorId("CPOBLAC", "");
                objDom.setValorHTMLPorId("TPOBLAC_span", "");
                limpiaCampos("CPOBLAC");
            }
        }
        
        function f_onchange_CPROVIN() {
            var CPAIS=objDom.getValorPorId("CPAIS");
            var CPROVIN=objDom.getValorPorId("CPROVIN");
            if (!objUtiles.estaVacio(CPROVIN)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPROVIN";
                qs=qs+"&CPAIS="+CPAIS;
                qs=qs+"&CPROVIN="+CPROVIN;
                qs=qs+"&dt="+(new Date().getTime());
                var origen = 'CPROVIN';
                objAjax.invokeAsyncCGI("modal_axisper042.do", callbackajaxdireccion, qs, this, null, origen)
            }else{
                objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                objDom.setVisibilidadPorId("findPoblacion", "hidden");
                limpiaCampos("CPROVIN");
            }
        }
        
        function callbackajaxdireccion (ajaxResponseText,origen){
            try{ 
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAIS")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPAIS", "");
                            objDom.setValorHTMLPorId("TPAIS_span", "<b>" + objJsMessages.jslit_codigo_pais_incorrecto +"</b>");
                            limpiaCampos("CPAIS");
                           
                        }else{
                            objDom.setValorPorId("CPAIS", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS"), 0, 0));
                            objDom.setVisibilidadPorId("findProvincia", "visible");
                           
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAIS")[0])){
                                objDom.setValorHTMLPorId("TPAIS_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAIS"), 0, 0) + "</b>");                                
                                limpiaCampos("CPAIS");
                            }
                        }
                    }
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPROVIN")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPROVIN", "");
                            objDom.setValorHTMLPorId("TPROVIN_span", "<b>" + objJsMessages.jslit_codigo_provincia_incorrecto +"</b>");
                            limpiaCampos("CPROVIN");
                        }else{
                            objDom.setValorPorId("CPROVIN", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPROVIN"), 0, 0));
                            objDom.setVisibilidadPorId("findPoblacion", "visible");
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPROVIN")[0])){
                                objDom.setValorHTMLPorId("TPROVIN_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPROVIN"), 0, 0) + "</b>");                                
                                limpiaCampos("CPROVIN");
                            }
                        }
                    }
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPOBLAC")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPOBLAC", "");
                            objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + objJsMessages.jslit_codigo_poblacion_incorrecto +"</b>");
                        }else{
                            objDom.setValorPorId("CPOBLAC", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPOBLAC"), 0, 0));
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPOBLAC")[0]))
                                objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPOBLAC"), 0, 0) + "</b>");
                        }
                    }
                }else{
                    //Si ha habido errores en la recepción de algún cambio limpiaremos los que dependen de él
                    if(origen == 'CPAIS'){
                            limpiaCampos("CPAIS");
                            objDom.setVisibilidadPorId("findProvincia", "hidden");
                            objDom.setValorHTMLPorId("TPAIS_span", "");
                    }
                    
                    if(origen == 'CPROVIN'){
                            limpiaCampos("CPROVIN");
                            objDom.setVisibilidadPorId("findPoblacion", "hidden");
                            objDom.setValorHTMLPorId("TPROVIN_span", "");
                    }
                    
                    if(origen == 'CPOBLAC'){
                            objDom.setValorHTMLPorId("TPOBLAC_span", "");
                    }
                
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }
        
        function val_number(valor,campo){
            try{
                valor = objValidador.valorFormateadoCampoNumerico(valor, true, true);
                if(objNumero.validaNumero(valor, true)) {
                    if(campo == 'PAIS')
                        document.miForm.CPAIS.value = valor;  
                    else if (campo == 'PROVIN')
                        document.miForm.CPROVIN.value = valor;  
                    else if (campo == 'POBLAC')
                        document.miForm.CPOBLAC.value = valor;  
                }else{
                    if(campo == 'PAIS'){
                        document.miForm.CPAIS.value = '';
                        document.miForm.CPAIS.focus();
                    }
                    else if (campo == 'PROVIN'){
                        document.miForm.CPROVIN.value = '';
                        document.miForm.CPROVIN.focus();
                    }
                    else if (campo == 'POBLAC'){
                        document.miForm.CPOBLAC.value = '';
                        document.miForm.CPOBLAC.focus();
                    }
                }               
            }catch(e){
                alert (e.name + " " + e.message);
            }
        }
        
        function f_but_buscar() {
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisper042.do", "busqueda", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        }
        
        function f_but_aceptar() {
            if(objUtiles.estaVacio(document.miForm.seleccionaLinea))
                alert(objJsMessages.jslit_selecciona_registro);
            else{
                var hayChecked = objUtiles.f_GuardaCasillasChecked ("seleccionaLinea");

                if(typeof hayChecked == 'boolean') 
                    alert(objJsMessages.jslit_selecciona_registro);
                else {
                    seleccionaRegistro(hayChecked);
                }
            }
        }
        
        function seleccionaRegistro (CPOSTAL) {
            if (objUtiles.estaVacio(CPOSTAL))
                alert (objJsMessages.jslit_selecciona_registro);
            else{
                parent.f_aceptar_axisper042(CPOSTAL);                
            }
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
                      
            <form name="miForm" action="" method="POST">
                
                <input type="hidden" name="operation" value=""/>
                <!-- Area de Titulo  -->
                <c:import url="../include/titulo_nt.jsp">
                    <c:param name="formulario"><axis:alt f="axisper042" c="FORM" lit="9002274" /></c:param>
                    <c:param name="producto"><axis:alt f="axisper042" c="FORM" lit="9002274" /></c:param>
                    <c:param name="form">axisper042</c:param>
                </c:import>
                
                <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:10px;">
                    <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                            <img src="images/flecha.gif"/>
                            <b><axis:alt f="axisper042" c="LIT32" lit="9002274"/></b>
                        </div>
                        <table class="seccion" >
                            <tr>                        
                            <td align="left">
                                <table class="area" align="center">
                                    <tr> 
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    </tr> 
                                    
                                    <tr>
                                        <axis:ocultar f="axisper042" c="CPAIS" dejarHueco="false"> 
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisper042" c="CPAIS" lit="100816"/></b>
                                            </td>                                            
                                        </axis:ocultar>
                                        
                                        <axis:ocultar f="axisper042" c="CPROVIN" dejarHueco="false"> 
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisper042" c="CPROVIN" lit="100756"/></b>
                                            </td>                                            
                                        </axis:ocultar>
                                        
                                         <axis:ocultar f="axisper042" c="CPOBLAC" dejarHueco="false"> 
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisper042" c="CPOBLAC" lit="100817"/></b>
                                            </td>                                            
                                        </axis:ocultar>
                                        
                                    </tr>
                                    
                                    <tr>
                                        <axis:visible f="axisper042" c="CPAIS">
                                            <td class="campocaja">
                                                    <input type="text" class="campo campotexto" value="${__formdata.CPAIS}" name="CPAIS" id="CPAIS" size="10" style="width:18%;" onchange="val_number(this.value, 'PAIS');f_onchange_CPAIS();" <axis:atr f="axisper042" c="CPAIS" a="obligatorio=true"/>/>
                                                &nbsp;<img id="findPais" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS', null);" style="cursor:pointer" alt=""/>
                                                &nbsp;<span id="TPAIS_span"><b>${__formdata.TPAIS}</b></span>
                                            </td>
                                        </axis:visible>  
                                        
                                        <axis:visible f="axisper042" c="CPROVIN">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" value="${__formdata.CPROVIN}" name="CPROVIN" id="CPROVIN" size="10" style="width:18%;" onchange="val_number(this.value, 'PROVIN');f_onchange_CPROVIN();" />
                                                &nbsp;<img id="findProvincia" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152431', 'LISTA_PROVINCIA', document.miForm.CPAIS.value);" style="cursor:pointer" alt=""/>
                                                &nbsp;<span id="TPROVIN_span"><b>${__formdata.TPROVIN}</b></span>
                                            </td>
                                        </axis:visible>
                                        
                                        <axis:visible f="axisper042" c="CPOBLAC">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" value="${__formdata.CPOBLAC}" name="CPOBLAC" id="CPOBLAC" size="10" style="width:18%;" onchange="val_number(this.value, 'POBLAC');f_onchange_CPOBLAC();"/>
                                                &nbsp;<img id="findPoblacion" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION', document.miForm.CPROVIN.value, null);" style="cursor:pointer" alt=""/>
                                                &nbsp;<span id="TPOBLAC_span"><b>${__formdata.TPOBLAC}</b></span>
                                            </td>
                                        </axis:visible>
                                       
                                    </tr>
                                    
                                </table>
                            </td>                        
                            </tr>
                        </table>
                        
                        <c:import url="../include/botonera_nt.jsp"> 
                            <c:param name="__botones">
                                <axis:ocultar f="axisper042" c="BT_BUSCAR" dejarHueco="false">buscar</axis:ocultar>	
                            </c:param>
                        </c:import>
                        
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                            <img src="images/flecha.gif"/>
                            <b><axis:alt f="axisper042" c="flecha" lit="1000258"/></b>
                        </div> 
                        
                        <table class="seccion" align="center">
                            <tr>
                            <td>
                                <table class="area" align="center"> 
                                    <tr>                        
                                    <td>       
                                    <c:set var="title0"><axis:alt f="axisper042" c="TTCPOSTAL" lit="100823"/></c:set>
                                    <c:set var="title1"><axis:alt f="axisper042" c="TTCPAIS" lit="100816"/></c:set>
                                    <c:set var="title2"><axis:alt f="axisper042" c="TTCPROVIN" lit="100756"/></c:set>
                                    <c:set var="title3"><axis:alt f="axisper042" c="TTCPOBLAC" lit="100817"/></c:set>
                                                                            
                                    <div class="seccion displayspacePersonas"> 
                                        <display:table name="${sessionScope.axisper042_listaCpostal}"
                                                        id="miListaId" export="false"
                                                        class="dsptgtable" pagesize="12"
                                                        defaultsort="1"
                                                        defaultorder="ascending"
                                                        sort="list" cellpadding="0"
                                                        cellspacing="0"
                                                        requestURI="modal_axisper042.do?paginar=true">                                 
                                         
                                         
                                         <%@ include file="../include/displaytag.jsp"%>
                                         
                                         <display:column title="" 
                                                         sortable="false" 
                                                         headerClass="headwidth5 sortable"  
                                                         media="html" autolink="false">    
                                            <div class="dspIcons">
                                            <input  type="radio" id="seleccionaLinea" name="seleccionaLinea" value="${miListaId['RCCPOSTAL']}"/>
                                            </div>
                                         </display:column>
                                         
                                         <display:column title="${title0}"
                                                         sortable="true"
                                                         sortProperty="RCCPOSTAL"
                                                         headerClass="sortable fixed"
                                                         media="html" autolink="false">
                                            <div class="dspText">
                                            <a href='javascript:seleccionaRegistro("${miListaId['RCCPOSTAL']}")'>${miListaId['RCCPOSTAL']}</a>
                                            
                                            </div>
                                  
                                         </display:column>
                                          
                                         <display:column title="${title1}"
                                                         sortable="true"
                                                         sortProperty="RCCPAIS"
                                                         headerClass="sortable fixed"
                                                         media="html" autolink="false">
                                            <div class="dspText">
                                            ${miListaId['RCTPAIS']}
                                            </div>
                                  
                                          </display:column>
                                          
                                          <display:column title="${title2}"
                                                          sortable="true"
                                                          sortProperty="RCCPROVIN"
                                                          headerClass="sortable fixed"
                                                          media="html" autolink="false">
                                            <div class="dspText">
                                            ${miListaId['RCTPROVIN']}
                                            </div>
                                          </display:column>
                                            
                                          <display:column title="${title3}"
                                                          sortable="true"
                                                          sortProperty="RCCPOBLAC"
                                                          headerClass="sortable fixed"
                                                          media="html" autolink="false">
                                            <div class="dspText">
                                            ${miListaId['RCTPOBLAC']}
                                            </div>                                                
                                          </display:column>                                           
                                                                                                                                   
                                          </display:table> 
                                      </div> 
                                    <div class="separador">&nbsp;</div>
                                    </td>
                                    </tr>
                                </table>
                            </td>
                            </tr>
                        </table>     
                       
                    </td>
                    </tr>
                    
                </table>
                
                <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisper042</c:param>
                    <c:param name="__botones"><axis:visible f="axisadm095" c="BT_CANCELAR">cancelar</axis:visible><axis:visible f="axisper042" c="BT_ACEPTAR">,aceptar</axis:visible></c:param>
                </c:import>
            </form>            
            
            <c:import url="../include/mensajes.jsp" />
        
    </body>
    
    <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
      <script language="Javascript" type="text/javascript">  
        retocarPAGE_CSS('axisper042');
      </script>                   
    </c:if>
    
</html>
