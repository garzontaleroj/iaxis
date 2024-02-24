<%/* Revision:# +5Ff1PW3CqXxK0Uk31pi4Q== # */%>
<%/*
*  Fichero: axisage029.jsp
*
*  @author <a href = "mailto:rfonollet@csi-ti.com">Ramon Fonollet</a>
*
*
*  Fecha: 09/04/2015
*/
%>


<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <%-- Especial per controlar els scroll amb iPad --%>
    <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
    <style type="text/css" id="page-css"></style>
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
        
        	 <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
				retocarPAGE_CSS('axisage029');
			 </c:if>
             
            f_cargar_propiedades_pantalla(); 
            //document.miForm.CPROVIN.focus();
            
            // Retocar tabla en IE
            if (document.all){ // ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";
            } 
        }

        function f_but_cancelar() {
            parent.f_cerrar_axisage029();
        }        
        
        function f_but_buscar() {
        
            if (objDom.getValorPorId("SPROLIQ") != "" || objDom.getValorPorId("FLIQUIDA") != "" || objDom.getValorPorId("IIMPORTE") != "" || objDom.getValorPorId("CAGENTE") != ""|| 
                objDom.getValorPorId("CUSUARIO") != "" || objDom.getValorPorId("CESTADO") != "escogeOption" || objDom.getValorPorId("FCOBRO") != "") {
                //Si la validación es correcta, ejecutamos la acción
                if (objValidador.validaEntrada()) {
                    objUtiles.ejecutarFormulario("modal_axisage029.do", "busqueda", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }else{
                alert("falta informar un campo de busqueda");
            }
        }
        
        function f_but_aceptar() {
        
            if(typeof document.miForm.seleccionaLiquidacion == 'undefined' || typeof document.miForm.seleccionaLiquidacion == 'null'){
            
                alert(objJsMessages.jslit_busca_primero_general);
                
            }else{
            
                var hayChecked = objUtiles.f_GuardaCasillasChecked ("seleccionaLiquidacion");               
                if (!hayChecked) {
                    alert(objJsMessages.jslit_selecciona_registro);
                }else{                    
                    f_aceptar_liquidacion(hayChecked);
                }
                
            }    
        }
        
        function f_aceptar_liquidacion(VARTODO){
        
                    var viene = VARTODO;                 
                    var agentSplit = objUtiles.utilSplit(viene, "#");
                    var CESTAUTO = agentSplit[0];
                    var SPROLIQ = agentSplit[1];     
                    var CAGENTE = agentSplit[2]; 
                    var CEMPRES = agentSplit[3]; 
                    var todo = agentSplit[4]; 
                    
            if (objUtiles.estaVacio(todo)){
                alert (objJsMessages.jslit_error_de_seleccion);
            }else{   
                parent.f_cargar_axisage029(SPROLIQ,CESTAUTO,CAGENTE,CEMPRES);
            }
         }
         
         function selecciona(SPROLIQ,CESTAUTO,CAGENTE,CEMPRES){
             parent.f_cargar_axisage029(SPROLIQ,CESTAUTO,CAGENTE,CEMPRES);
         }
        
        function f_but_9902314() {
            parent.f_alta_axisage029();
         }
        
        /*******************************************
                  Formateo Numeros
         ********************************************/
         function validarNumeros(IMPORTE){
             if (!objUtiles.estaVacio(IMPORTE)){
                 IMPORT = objValidador.valorFormateadoCampoNumerico(IMPORTE, true, true);
                 if(objNumero.validaNumero(IMPORT, true)){
                     return this.formateaNumeroCero(IMPORT, true);
                 }
                 else{
                     return   '';
                 }
             }
             else return IMPORTE;
         }
         
        function formateaNumeroCero(entrada, isDecimal){
            // es crida al reformateixador  ###.###,00
            var fnum=objNumero.formateaNumero(entrada,isDecimal);
            if(entrada.indexOf(objNumero.getSeparadorDecimales())<0){
                fnum += objNumero.getSeparadorDecimales() + '00';
            }
            // si es tracta d'un 0 el converteix a 0,00
            if(fnum=='0') fnum += objNumero.getSeparadorDecimales() + '00';
            return fnum;

        }
         
        function f_formatear(thiss){
            thiss.value = validarNumeros(thiss.value);
        }
        
        function f_calculoma(thiss){               
            f_formatear(thiss);
        }
        
        
        /*******************************************
                 Actualizar/Buscar Agente
         ********************************************/
        
        function f_cerrar_axisctr014() {
            objUtiles.cerrarModal("axisctr014")
        } 
        
        function f_abrir_axisctr014() {
            
            objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
        }
        
        
        function f_aceptar_axisctr014 (CAGENTE){
            f_cerrar_axisctr014();
            objAjax.invokeAsyncCGI("modal_axisage029.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
        }
        
        function callbackAjaxCambiarAgente(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                objDom.setValorPorId("CAGENTE", CAGENTEformateado);
                objDom.setValorPorId("TAGENTE", NOMBREformateado);
            }
        }
        
        function f_actualizar_agente (){
            
            objAjax.invokeAsyncCGI("modal_axisage029.do", callbackAjaxActualizarAgente, "operation=actualizar_agente&CAGENTE=" + document.getElementById("CAGENTE").value, this, objJsMessages.jslit_actualizando_registro);
        }
        
        function callbackAjaxActualizarAgente(ajaxResponseText) {
        
            var doc = objAjax.domParse(ajaxResponseText);
            try {            
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {

                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0])) {
                        objDom.setValorPorId("CAGENTE", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0)));
                    } else {
                        objDom.setValorPorId("CAGENTE", "");
                    }
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("NOMBRE")[0])) {
                        objDom.setValorPorId("TAGENTE", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0)));
                    } else {
                        objDom.setValorPorId("TAGENTE", "");
                    }
                
                } else {                       
                    objDom.setValorPorId("TAGENTE", "");
                }
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
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
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="formulario" f="axisage029" lit="9907742" /></c:param>
                <c:param name="producto"><axis:alt c="producto" f="axisage029" lit="9907742" /></c:param>
                <c:param name="form">axisage029</c:param>
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisage029" c="TIT_AXISCTR014" lit="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
        </c:import>
            
            <input type="hidden" name="operation"/>
            <input type="hidden" id="CONDICION" name="CONDICION" value="${__formdata.CONDICION}"/> 
            <input type="hidden" id="PARTNER" name="PARTNER" value="${__formdata.PARTNER}"/> 
            <input type="hidden" id="SPRODUC" name="SPRODUC" value="${__formdata.SPRODUC}"/> 
            
            <!-- Area de campos  -->
            <table id="tabla1" class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                            
                                <th style="width:33%;height:0%;"/>
                                <th style="width:33%;height:0%;"/>
                                <th style="width:33%;height:0%;"/>
                                
                            </tr>
                            <tr>
                            
                                <td class="titulocaja">
                                    <b><axis:alt c="SPROLIQ" f="axisage029" lit="9901183" /></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt c="FLIQUIDA" f="axisage029" lit="100562" /></b>
                                </td>   
                                <td class="titulocaja">
                                    <b><axis:alt c="IIMPORTE" f="axisage029" lit="9904351" /></b>
                                </td>  
                                
                            </tr>
                            <tr>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata['SPROLIQ']}" name="SPROLIQ" id="SPROLIQ" size="1"
                                    style="width:90%" title="<axis:alt c="SPROLIQ" f="axisage029" lit="9901183"/>"/>
                                </td>                                  
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FLIQUIDA}"/>" name="FLIQUIDA" id="FLIQUIDA"  style="width:90%;"
                                    <axis:atr f="axisage029" c="FLIQUIDA" a="modificable=true&formato=fecha&obligatorio=false"/> title="<axis:alt f="axisage029" c="FLIQUIDA" lit="1000064"/>"/> 
                                    <a id="icon_FLIQUIDA" style="vertical-align:middle;" href="#"><img id="popup_calendario_FLIQUIDA" border="0" alt="<axis:alt f="axisage029" c="FLIQUIDA_CAL" lit="100562"/>" title="<axis:alt f="axisage029" c="TIT_FLIQUIDA" lit="100959" />" src="images/calendar.gif"/></a>
                                </td>      
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.IIMPORTE}'/>" name="IIMPORTE" id="IIMPORTE" size="15"
                                    style="width:97%" title="<axis:alt c="IIMPORTE" f="axisage029" lit="9904351"/>" onChange = "javascript:f_calculoma(this);"/>
                                </td>  
                            </tr>
                            <tr>
                            
                                <td class="titulocaja">
                                    <b><axis:alt c="CAGENTE" f="axisage029" lit="9903137" /></b>
                                </td>                                
                                <td class="titulocaja">
                                    <b><axis:alt c="CUSUARIO" f="axisage029" lit="9905522" /></b>
                                </td>   
                                <td class="titulocaja">
                                    <b></b>
                                </td>  
                                
                            </tr>
                             <tr>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata['CAGENTE']}" name="CAGENTE" id="CAGENTE" size="1"
                                    style="width:20%" title="<axis:alt c="CAGENTE" f="axisage029" lit="9903137"/>" onchange="javascript:f_actualizar_agente();"/>
                                    <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                    <input readonly="true" type="text" name="TAGENTE" id="TAGENTE" value="${axisage_tagente}" class="campowidthinput campo campotexto" style="width:66%" />
                                </td>  
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata['CUSUARIO']}" name="CUSUARIO" id="CUSUARIO" size="1"
                                    style="width:90%" title="<axis:alt c="CUSUARIO" f="axisage029" lit="9905522"/>"/>
                                </td>      
                                <td></td>  
                            </tr>
                            <tr>
                            
                                <td class="titulocaja">
                                    <b><axis:alt c="CESTADO" f="axisage029" lit="9907741" /></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt c="FCOBRO" f="axisage029" lit="9000805" /></b>
                                </td>   
                                <td class="titulocaja">
                                    <b></b>
                                </td>  
                                
                            </tr>
                             <tr>
                                <td class="campocaja">
                                   <select name="CESTADO" id="CESTADO" size="1" class="campowidthselect campo campotexto" style="width:90%;">&nbsp;
                                        <option value="escogeOption"> - <axis:alt f="axisage029" c="SELECC" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${ESTADO_LIQUIDA}">
                                            <option value = "${element.CATRIBU}"
                                            <c:if test="${__formdata.CATRIBU == element.CATRIBU || fn:length(ESTADO_LIQUIDA) == 1}"> selected = "selected"</c:if>>
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>   
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCOBRO}"/>" name="FCOBRO" id="FCOBRO"  style="width:90%;"
                                    <axis:atr f="axisage029" c="FCOBRO" a="modificable=true&formato=fecha&obligatorio=false"/> title="<axis:alt f="axisage029" c="FCOBRO" lit="1000064"/>"/> 
                                    <a id="icon_FCOBRO" style="vertical-align:middle;" href="#"><img id="popup_calendario_FCOBRO" border="0" alt="<axis:alt f="axisage029" c="FCOBRO_CAL" lit="9000805"/>" title="<axis:alt f="axisage029" c="TIT_FCOBRO" lit="100959" />" src="images/calendar.gif"/></a>
                                </td>      
                                <td></td>  
                            </tr>
                   
                        </table>

                        <div class="separador">&nbsp;</div>
                        <!-- Nombre columnas tablas -->
                        <c:set var="title1"><axis:alt c="SPROLIQ" f="axisage029" lit="9901183"/></c:set> 
                        <c:set var="title2"><axis:alt c="MEDIADOR" f="axisage029" lit="9903137"/></c:set> 
                        <c:set var="title3"><axis:alt c="FLIQUID" f="axisage029" lit="100562"/></c:set>  
                        <c:set var="title4"><axis:alt c="IIMPORTE" f="axisage029" lit="9904351"/></c:set> 
                        <c:set var="title5"><axis:alt c="CESTAUTOLIQ" f="axisage029" lit="9907741"/></c:set> 
                        <c:set var="title6"><axis:alt c="FCOBRO" f="axisage029" lit="9000805"/></c:set>  
                        <c:set var="title7"><axis:alt c="CUSUARI" f="axisage029" lit="9905522"/></c:set>  
                        <c:set var="title8"><axis:alt c="RECIBOS" f="axisage029" lit="9001017"/></c:set> 
                        
                        <div class="seccion displayspaceGrande">
                            <display:table name="${sessionScope.axisage029_listaLiquidaciones}" id="miListaId" export="false" class="dsptgtable" pagesize="8" defaultsort="1" defaultorder="ascending" requestURI="modal_axisage029.do?paginar=true&operation=form" sort="list" cellpadding="0" cellspacing="0">
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >  
                                    <div class="dspIcons"><input type="radio" id="seleccionaLiquidacion" name="seleccionaLiquidacion" value="${miListaId.CESTAUTOLIQ}#${miListaId.SPROLIQ}#${miListaId.CAGENTE}#${miListaId.CEMPRES}#${miListaId}"/></div>
                                </display:column> 
                                <display:column title="${title1}" sortable="true" sortProperty="SPROLIQ" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText"><a href="javascript:selecciona('${miListaId.SPROLIQ}','${miListaId.CESTAUTOLIQ}','${miListaId.CAGENTE}','${miListaId.CEMPRES}')">${miListaId.SPROLIQ}</a></div>
                                </display:column>
                                <display:column title="${title2}" sortable="true" sortProperty="MEDIADOR" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText"><a href="javascript:selecciona('${miListaId.SPROLIQ}','${miListaId.CESTAUTOLIQ}','${miListaId.CAGENTE}','${miListaId.CEMPRES}')">${miListaId.MEDIADOR}</a></div>
                                </display:column>
                                <display:column title="${title3}" sortable="true" sortProperty="FLIQUID" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText"><a href="javascript:selecciona('${miListaId.SPROLIQ}','${miListaId.CESTAUTOLIQ}','${miListaId.CAGENTE}','${miListaId.CEMPRES}')"><fmt:formatDate value="${miListaId.FLIQUID}" pattern="dd/MM/yyyy"/></a></div>
                                </display:column>
                                <display:column title="${title4}" sortable="true" sortProperty="IIMPORTE" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText"><a href="javascript:selecciona('${miListaId.SPROLIQ}','${miListaId.CESTAUTOLIQ}','${miListaId.CAGENTE}','${miListaId.CEMPRES}')"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONEDAPROD]}" value="${miListaId.IIMPORTE}"/></a></div>
                                </display:column>
                                <display:column title="${title5}" sortable="true" sortProperty="CESTAUTOLIQ" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText"><a href="javascript:selecciona('${miListaId.SPROLIQ}','${miListaId.CESTAUTOLIQ}','${miListaId.CAGENTE}','${miListaId.CEMPRES}')">${miListaId.TCESTAUTOLIQ}</a></div>
                                </display:column>
                                <display:column title="${title6}" sortable="true" sortProperty="FCOBRO" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText"><a href="javascript:selecciona('${miListaId.SPROLIQ}','${miListaId.CESTAUTOLIQ}','${miListaId.CAGENTE}','${miListaId.CEMPRES}')"><fmt:formatDate value="${miListaId.FCOBRO}" pattern="dd/MM/yyyy"/></a></div>
                                </display:column>
                                <display:column title="${title7}" sortable="true" sortProperty="CUSUARI" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText"><a href="javascript:selecciona('${miListaId.SPROLIQ}','${miListaId.CESTAUTOLIQ}','${miListaId.CAGENTE}','${miListaId.CEMPRES}')">${miListaId.CUSUARI}</a></div>
                                </display:column>
                                <display:column title="${title8}" sortable="true" sortProperty="RECIBOS" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText"><a href="javascript:selecciona('${miListaId.SPROLIQ}','${miListaId.CESTAUTOLIQ}','${miListaId.CAGENTE}','${miListaId.CEMPRES}')">${miListaId.RECIBOS}</a></div>
                                </display:column>
                            </display:table>
                        
                            <c:choose>
                            <c:when test="${!empty sessionScope.axisage029_listaLiquidaciones &&  !(fn:containsIgnoreCase(header['User-Agent'],'ipad') )}">
                                <script language="javascript">objUtiles.retocarDsptagtable("miListaId");</script>
                            </c:when>
                            <c:otherwise>
                            	 <c:if test="${!(fn:containsIgnoreCase(header['User-Agent'],'ipad') )}">
                                <script language="javascript">
                                   objLista.esconderListaSpans();
                                   objLista.esconderListaLinks();     
                                </script>
                              </c:if>
                            </c:otherwise>
                            </c:choose>
                        </div>
                    </td>
                </tr>
            </table>
            <!-- Botonera -->
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisage029</c:param>        
                <c:param name="__botones">cancelar,buscar,9902314,aceptar</c:param>
            </c:import>
        </form>
        
        <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FLIQUIDA",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FLIQUIDA", 
                singleClick    :    true,
                firstDay       :    1
            });

            Calendar.setup({
                inputField     :    "FCOBRO",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FCOBRO", 
                singleClick    :    true,
                firstDay       :    1
            });
        </script>
        
        <c:import url="../include/mensajes.jsp" />
        </div>
    </body>
</html>