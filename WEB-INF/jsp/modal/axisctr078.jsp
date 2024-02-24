<%/*
*  Fichero: axisctr078.js
*
*  @author <a href="mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*  Fecha: 04/07/2008
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
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
    <c:import url="../include/carga_framework_js.jsp" />    
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_but_cancelar() {
           parent.f_cerrar_modal('axisctr078');                      
        }
        
        function f_but_buscar() {
            if (objValidador.validaEntrada()) {
                var params = "?buscar=true";
                if (!objUtiles.estaVacio(objDom.getValorPorId("CEMPRES"))){
                   params +="&CEMPRES=" +   objDom.getValorPorId("CEMPRES");
                }
                if (!objUtiles.estaVacio(objDom.getValorPorId("SPRODUC"))){
                   params +="&SPRODUC=" +   objDom.getValorPorId("SPRODUC");
                }
                if (!objUtiles.estaVacio(objDom.getValorPorId("SPROCES"))){
                   params +="&SPROCES=" +   objDom.getValorPorId("SPROCES");
                }
                if (!objUtiles.estaVacio(objDom.getValorPorId("NMES"))){
                   params +="&NMES=" +   objDom.getValorPorId("NMES");
                }
                if (!objUtiles.estaVacio(objDom.getValorPorId("NANO"))){
                   params +="&NANO=" +   objDom.getValorPorId("NANO");
                }
                if (!objUtiles.estaVacio(objDom.getValorPorId("CESTADO"))){
                   params +="&CESTADO=" +   objDom.getValorPorId("CESTADO");
                }
                if (!objUtiles.estaVacio(objDom.getValorPorId("CCOMPANI"))){
                   params +="&CCOMPANI=" +   objDom.getValorPorId("CCOMPANI");
                }
                if (!objUtiles.estaVacio(objDom.getValorPorId("NRECIBO"))){
                   params +="&NRECIBO=" +   objDom.getValorPorId("NRECIBO");
                }
                if (!objUtiles.estaVacio(objDom.getValorPorId("NRECIBOCIA"))){
                   params +="&NRECIBOCIA=" +   objDom.getValorPorId("NRECIBOCIA");
                }
                if (!objUtiles.estaVacio(objDom.getValorPorId("NPOLIZA"))){
                   params +="&NPOLIZA=" +   objDom.getValorPorId("NPOLIZA");
                }
                if (!objUtiles.estaVacio(objDom.getValorPorId("NPOLIZACIA"))){
                   params +="&NPOLIZACIA=" +   objDom.getValorPorId("NPOLIZACIA");
                }
                if (!objUtiles.estaVacio(objDom.getValorPorId("FEMISIOINI"))){
                   params +="&FEMISIOINI=" +   objDom.getValorPorId("FEMISIOINI");
                }
                if (!objUtiles.estaVacio(objDom.getValorPorId("FEMISIOFIN"))){
                   params +="&FEMISIOFIN=" +   objDom.getValorPorId("FEMISIOFIN");
                }
                if (!objUtiles.estaVacio(objDom.getValorPorId("FEFEINI"))){
                   params +="&FEFEINI=" +   objDom.getValorPorId("FEFEINI");
                }
                if (!objUtiles.estaVacio(objDom.getValorPorId("FEFEFIN"))){
                   params +="&FEFEFIN=" +   objDom.getValorPorId("FEFEFIN");
                }
                if (!objUtiles.estaVacio(objDom.getValorPorId("FCOBINI"))){
                   params +="&FCOBINI=" +   objDom.getValorPorId("FCOBINI");
                }
                if (!objUtiles.estaVacio(objDom.getValorPorId("FCOBFIN"))){
                   params +="&FCOBFIN=" +   objDom.getValorPorId("FCOBFIN");
                }
                if (!objUtiles.estaVacio(objDom.getValorPorId("CAGENTE"))){
                   params +="&CAGENTE=" +   objDom.getValorPorId("CAGENTE");
                }
                
                if (!objUtiles.estaVacio(objDom.getValorPorId("NMES"))){
                   if (objUtiles.estaVacio(objDom.getValorPorId("NANO"))){
                        objAppMensajes.pintarMensajePantalla("<axis:alt f='axisctr078' c='ERRORANY' lit='9901742'/>", "info"); 
                   }else{
                    f_aceptar_modal(params);
                   }
                }else if (!objUtiles.estaVacio(objDom.getValorPorId("NANO"))){
                   if (objUtiles.estaVacio(objDom.getValorPorId("NMES"))){
                        objAppMensajes.pintarMensajePantalla("<axis:alt f='axisctr078' c='ERRORANY' lit='9901742'/>", "info"); 
                   }else{
                    f_aceptar_modal(params);
                   }
                }else{
                    f_aceptar_modal(params);
                }
            }
        }
        
        function f_aceptar_modal(params){
            objUtiles.ejecutarFormulario("modal_axisctr078.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);   
        }
        
        function f_but_nuevo() {
            parent.f_but_nuevo_modal078('axisctr078');
        }
        function f_onload() {
            f_cargar_propiedades_pantalla();
        }
              
        function f_onchange_empresa(CEMPRES) {
            // Recargar formulario para seleccionar los productos segun la empresa seleccionada
            objDom.setValorPorId("CEMPRES", CEMPRES);
            //objUtiles.ejecutarFormulario("modal_axisctr078.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
            objUtiles.ejecutarFormulario("modal_axisctr078.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
                       
        function f_actualizar_agente(){
             objAjax.invokeAsyncCGI("modal_axisctr078.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + objDom.getValorComponente(document.miForm.CAGENTE_TEXT), this, objJsMessages.jslit_cargando);
            
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
            
        function f_abrir_axisctr014() {
            objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
            }
            
        function f_cerrar_axisctr014() {
            objUtiles.cerrarModal("axisctr014");
        }    
        function f_aceptar_axisctr014 (CAGENTE){
            objDom.setValorPorId("CAGENTE", CAGENTE);
            objDom.setValorPorId("CAGENTE_TEXT", CAGENTE);
            f_cerrar_axisctr014();
            objAjax.invokeAsyncCGI("modal_axisctr078.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
        }            
                
        function f_seleccionar_persona(SPERSON, TNOMBRE) {
            var radioSPERSON = document.miForm.radioSPERSON;
           
            // Marcar/desmarcar radiobuttons
            if (objUtiles.estaVacio(radioSPERSON.length))
                radioSPERSON.checked = true;
            else {
                for (var i = 0; i < radioSPERSON.length; i++) 
                    radioSPERSON[i].checked = (radioSPERSON[i].value == SPERSON);
            }
            
            objDom.setValorPorId("SPERSON", SPERSON);
            objDom.setValorPorId("TNOMBRE", TNOMBRE);            
        }

        function f_borrar_campos() {
            objDom.setValorPorId("SPERSON", "");
            objDom.setValorPorId("TNOMBRE", "");
            f_cargar_DATOSPERSONA();
            document.getElementById("SPERSON").focus();
        }
        
        function f_seleccionar(psproces, cempres){
            objDom.setValorPorId("SPROCES_SEL", psproces);
            objDom.setValorPorId("CEMPRES", cempres);
            parent.f_but_aceptar_modal078(psproces,cempres);
        }
        function f_onclickCheckbox(thiss,psproces, pos) {
            objDom.setValorPorId("SPROCES_SEL", psproces);
            f_revisarChecks(pos);
        }
        
        function f_revisarChecks(pos){
                items =(document.getElementsByTagName("INPUT"));
                if (items != null){
                    for (i=0;i<items.length;i++)  {
                        if (items[i].id.indexOf("PLIQSELEC_")!=-1){
                            if (items[i].id.indexOf("PLIQSELEC_"+pos)==-1){
                                items[i].checked = false;
                            }
                        }
                    }
                }
            }
        
        /****************************************************************************************/
        /********************************** CALLBACK  *******************************************/
        /****************************************************************************************/        
        
    </script>
  </head>
  
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" action="modal_axisctr078.do" method="POST">  
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr078" c="TTITULO014" lit="9901036"/></c:param>
                <c:param name="nid" value="axisctr014" ></c:param>
        </c:import>
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisctr078" c="TTITULO" lit="9901036"/></c:param>
            <c:param name="formulario"><axis:alt f="axisctr078" c="TFORMULARIO" lit="9901036"/></c:param>
            <c:param name="form">axisctr078</c:param>
        </c:import>
        
        <input type="hidden" name="CAGENTE" id="CAGENTE" value="${sessionScope.axisctr_agente.CODI}"/>
        <input type="hidden" id="operation" name="operation" value=""/>
        <input type="hidden" name="SPROCES_SEL" id="SPROCES_SEL" value="${__formdata.SPROCES_SEL}"/>
    
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="3">            
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion">
                        <tr>
                            <th style="width:16%;height:0%;"/>
                            <th style="width:16%;height:0%;"/>
                            <th style="width:16%;height:0%;"/>
                            <th style="width:16%;height:0%;"/>
                            <th style="width:16%;height:0%;"/>
                            <th style="width:16%;height:0%;"/>
                        </tr>
                        <tr>
                            <div class="separador">&nbsp;</div>
                                <div class="titulo">
                                    <img src="images/flecha.gif"/><b><axis:alt f="axisctr078" c="PROCESOS" lit="103256"/> </b>
                                </div>
                                <div class="separador">&nbsp;</div>
                            <axis:visible f="axisctr078" c="CEMPRES"> 
                            <td class="titulocaja" colspan="2">
                                <b><axis:alt f="axisctr078" c="CEMPRESA" lit="101619"/></b> <%-- Empresa --%>
                            </td>
                            </axis:visible>
                            <axis:visible f="axisctr078" c="SPRODUC"> 
                            <td class="titulocaja" colspan="2">
                                <b><axis:alt f="axisctr078" c="SPRODUC" lit="100829"/></b> <%-- Producte --%>
                            </td> 
                            </axis:visible>
                        </tr>
                        <tr>
                           <axis:visible f="axisctr078" c="CEMPRES"> 
                            <td class="campocaja" colspan="2">
                                <select name="CEMPRES" id="CEMPRES" onchange="" size="1" class="campowidthselect campo campotexto_ob" obligatorio="true" style="width:94%;">&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr078" c="COMBO_SNV" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTEMPRESAS}">
                                        <option value = "${element.CEMPRES}"
                                         <c:if test="${__formdata.CEMPRES == element.CEMPRES}"> selected = "selected" </c:if> />
                                            ${element.TEMPRES}                                            
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:visible>
                            <axis:visible f="axisctr078" c="SPRODUC">
                            <td class="campocaja" colspan="2">                                
                                <select name="SPRODUC" id="SPRODUC" size="1" class="campowidthselect campo campotexto" style="width:97%;">&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr078" c="COMBO_SNV" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTPRODUCTOS}">
                                        <option value = "${element.SPRODUC}"
                                        <c:if test="${__formdata.SPRODUC == element.SPRODUC}"> selected = "selected" </c:if> />
                                            ${element.TTITULO} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:visible>
                        </tr>
                        <tr>
                            <axis:visible f="axisctr078" c="SPROCES">
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr078" c="SPROCES" lit="9000493"/></b> <%-- Nº pROCES --%>${LSTLIQUID.OB_IAX_LIQUIDACION}
                            </td>
                            </axis:visible>
                            <axis:visible f="axisctr078" c="NMES">
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr078" c="MES" lit="9000495"/></b> <%-- Mes --%>
                            </td>
                            </axis:visible>
                            <axis:visible f="axisctr078" c="NANO">
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr078" c="ANY" lit="101606"/></b> <%-- Any --%>
                            </td> 
                            </axis:visible>
                            <axis:visible f="axisctr078" c="CESTADO">
                             <td class="titulocaja">
                                <b><axis:alt f="axisctr078" c="CESTADO" lit="101510"/></b> <%-- Estado --%>
                            </td> 
                            </axis:visible>
                             <axis:ocultar f="axisctr078" c="CCOMPANI" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr078" c="CCOMPANI" lit="9000600"/></b><!-- Cod. Compañía -->       
                                    </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <axis:visible f="axisctr078" c="SPROCES">
                            <td class="campocaja">                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.SPROCES}" name="SPROCES" id="SPROCES" 
                                style="width:90%;" title="<axis:alt f="axisctr078" c="SPROCES" lit="9000493"/>"
                                <axis:atr f="axisctr078" c="SPROCES" a="formato=entero"/> />
                            </td>
                            </axis:visible>
                            <axis:visible f="axisctr078" c="NMES">
                            <td class="campocaja">
                                    <select name = "NMES" id ="NMES" onchange=""
                                        title="<axis:alt f="axisctr078" c="NMES" lit="9000495"/>"
                                        class="campowidthselect campo campotexto" obligatorio="false">&nbsp;
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr078" c="COMBO_SNV" lit="1000348"/> - </option> 
                                        <c:forEach items="${__formdata.LSTMESESCARTERA2}" var="mes">
                                            <option value = "${mes.CATRIBU}" <c:if test="${mes.CATRIBU  == __formdata.NMES}">selected</c:if>>${mes.TATRIBU}</option>
                                        </c:forEach>
                                    </select>
                             </td>
                            </axis:visible>
                            <axis:visible f="axisctr078" c="NANO">
                            <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" style="width:95%" size="15" value="${__formdata.NANO}" name="NANO" id="NANO"
                                         title="<axis:alt f="axisctr078" c="NANO" lit="101606"/>" obligatorio="false"/>
                             </td>
                            </axis:visible>
                            <axis:visible f="axisctr078" c="CESTADO">
                            <td class="campocaja" colspan="1">                                
                                <select name="CESTADO" id="CESTADO" size="1" class="campowidthselect campo campotexto" style="width:97%;">&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr078" c="COMBO_SVN" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LSESTADOS}">
                                        <option value = "${element.CATRIBU}"
                                        <c:if test="${__formdata.CESTADO == element.CATRIBU}"> selected = "selected" </c:if> />
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:visible>
                            <!-- Companyia productos -->
                            <axis:ocultar f="axisctr078" c="CCOMPANI" dejarHueco="false">
                            <td class="campocaja">
                                <select name="CCOMPANI" id ="CCOMPANI" size="1" class="campowidthselect campo campotexto" onchange="" style="width:180px">
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr078" c="COMBO_SVN" lit="1000348"/> - </option>
                                    <c:forEach var="CIA" items="${__formdata.CIAS}">
                                        <option value="${CIA.CCOMPANI}"
                                        <c:if test="${!empty __formdata.CCOMPANI && CIA.CCOMPANI == __formdata.CCOMPANI}"> selected </c:if>>
                                        ${CIA.TCOMPANI}
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                        </tr>
                    </table>
                    <div class="titulo"> <axis:alt f="axisctr078" c="RECIBOS" lit="102118"/></div>
                    <table>
                        
                        <tr>
                            <axis:visible f="axisctr078" c="NRECIBO">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr078" c="NRECIBO" lit="800636"/></b> <%-- Num.recibo --%>
                                </td>
                            </axis:visible>
                            <axis:visible f="axisctr078" c="NRECIBOCIA">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr078" c="NRECIBOCIA" lit="9901670"/></b> <%-- Núm. rebut Cia --%>
                                </td>
                            </axis:visible>
                             <axis:visible f="axisctr078" c="NPOLIZA">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr078" c="NPOLIZA" lit="100836"/></b> <%-- Pòlissa --%>
                                </td>
                            </axis:visible>
                            <axis:visible f="axisctr078" c="NPOLIZACIA">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr078" c="NPOLIZACIA" lit="9901675"/></b> <%-- Núm. pòlissa Cia --%>
                                </td>
                            </axis:visible>
                            
                        </tr>
                        <tr>
                             <axis:visible f="axisctr078" c="NRECIBO">
                             <td class="campocaja">                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NRECIBO}" name="NRECIBO" id="NRECIBO" 
                                style="width:90%;" title="<axis:alt f="axisctr078" c="NRECIBO" lit="800636"/>"
                                <axis:atr f="axisctr078" c="NRECIBO" a="formato=entero"/> />
                            </td>
                            </axis:visible>
                            <axis:visible f="axisctr078" c="NRECIBOCIA">
                            <td class="campocaja">                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NRECIBOCIA}" name="NRECIBOCIA" id="NRECIBOCIA" 
                                style="width:90%;" title="<axis:alt f="axisctr078" c="NRECIBOCIA" lit="9901670"/>"
                                <axis:atr f="axisctr078" c="NRECIBOCIA" a="formato=entero"/> />
                            </td>
                            </axis:visible>
                            <axis:visible f="axisctr078" c="NPOLIZA">
                            <td class="campocaja">                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA" 
                                style="width:90%;" title="<axis:alt f="axisctr078" c="NPOLIZA" lit="100836"/>"
                                <axis:atr f="axisctr078" c="NPOLIZA" a="formato=entero"/> />
                            </td>
                            </axis:visible>
                            <axis:visible f="axisctr078" c="NPOLIZACIA">
                            <td class="campocaja">                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NPOLIZACIA}" name="NPOLIZACIA" id="NPOLIZACIA" 
                                style="width:90%;" title="<axis:alt f="axisctr078" c="NPOLIZACIA" lit="9901675"/>"
                                <axis:atr f="axisctr078" c="NPOLIZACIA" a="formato=entero"/> />
                            </td>
                            </axis:visible>
                                                                               
                        </tr>
                        <tr>
                            <axis:visible f="axisctr078" c="CAGENTE"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr078" c="AGENTE" lit="100584"/></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr078" c="AGENTE2" lit="105940"/></b>
                                </td>
                            </axis:visible>
                            <axis:visible f="axisctr078" c="DIEMISSIO"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr078" c="DIEMISSIO" lit="1000554"/></b> <%-- Data inici emissió --%>
                                </td>
                            </axis:visible>
                            <axis:visible f="axisctr078" c="DFEMISSIO"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr078" c="DFEMISSIO" lit="1000555"/></b>  <%-- Data fi emissió --%>
                                </td>
                            </axis:visible>
                        </tr>
                        <tr>                                                
                            <axis:visible f="axisctr078" c="CAGENTE"> 
                            <td class="campocaja">
                                <input type="text" name="CAGENTE_TEXT" id="CAGENTE_TEXT" value="${sessionScope.axisctr_agente.CODI}" class="campowidthinput campo campotexto" style="width:70%"
                                <axis:atr f="axisctr078" c="CAGENTE" a="modificable=true"/> onchange="f_actualizar_agente()" />
                                <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                            </td>
                            <td class="campocaja">    
                                <input readonly="true" type="text" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${sessionScope.axisctr_agente.NOMBRE}" class="campowidthinput campo campotexto"/>
                            </td>
                            </axis:visible>
                            <axis:visible f="axisctr078" c="DIEMISSIO"> 
                            <td class="campocaja">                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:50%;"
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEMISIOINI}"/>" name="FEMISIOINI" id="FEMISIOINI"
                                title="<axis:alt f="axisctr078" c="DIEMISSIO" lit="1000554"/>"
                                <axis:atr f="axisctr078" c="FEMISIOINI" a="formato=fecha"/> /><a style="vertical-align:middle;"><img
                                id="icon_FEMISIOINI" alt="<axis:alt f="axisctr078" c="FEMISIOINI" lit="108341"/>" title="<axis:alt f="axisctr078" c="DIEMISSIO" lit="1000554"/>" src="images/calendar.gif"/></a>
                            </td>
                            </axis:visible>
                            <axis:visible f="axisctr078" c="DFEMISSIO"> 
                            <td class="campocaja">                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:50%;"
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEMISIOFIN}"/>" name="FEMISIOFIN" id="FEMISIOFIN"
                                title="<axis:alt f="axisctr078" c="DFEMISSIO" lit="1000555"/>"
                                <axis:atr f="axisctr078" c="FEMISIOFIN" a="formato=fecha"/> /><a style="vertical-align:middle;"><img
                                id="icon_FEMISIOFIN" alt="<axis:alt f="axisctr078" c="FEMISIOFIN" lit="108341"/>" title="<axis:alt f="axisctr078" c="DFEMISSIO" lit="1000555"/>" src="images/calendar.gif"/></a>
                            </td>
                            </axis:visible>
                        </tr>
                        <tr>
                            <axis:visible f="axisctr078" c="DIEFECTE"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr078" c="DIEFECTE" lit="1000556"/></b>  <%-- Data inici efecte --%>
                                </td>
                            </axis:visible>
                            <axis:visible f="axisctr078" c="DFEFECTE"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr078" c="DFEFECTE" lit="1000557"/></b> <%-- Data fi efecte --%>
                                </td>
                            </axis:visible>
                            <axis:visible f="axisctr078" c="DIEFECTE2"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr078" c="DIEFECTE2" lit="9001814"/></b>  <%-- Data inici efecte --%>
                                </td>
                            </axis:visible>
                            <axis:visible f="axisctr078" c="DFEFECTEW"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr078" c="DFEFECTEW" lit="9001815"/></b>  <%-- Data fi efecte --%>
                                </td>
                            </axis:visible>
                        </tr>
                        <tr>
                            <axis:visible f="axisctr078" c="DIEFECTE"> 
                                <td class="campocaja">                             
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:50%;"
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEFEINI}"/>" name="FEFEINI" id="FEFEINI"
                                    title="<axis:alt f="axisctr078" c="DIEFECTE" lit="1000556"/>"
                                    <axis:atr f="axisctr078" c="FEFEINI" a="formato=fecha"/> /><a style="vertical-align:middle;"><img
                                    id="icon_FEFEINI" alt="<axis:alt f="axisctr078" c="FEFEINI" lit="108341"/>" title="<axis:alt f="axisctr078" c="DIEFECTE" lit="1000556"/>" src="images/calendar.gif"/></a>
                                </td>
                            </axis:visible>
                            <axis:visible f="axisctr078" c="DFEFECTE"> 
                                <td class="campocaja">                             
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:50%;"
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEFEFIN}"/>" name="FEFEFIN" id="FEFEFIN"
                                    title="<axis:alt f="axisctr078" c="DFEFECTE" lit="1000557"/>"
                                    <axis:atr f="axisctr078" c="FEFEFIN" a="formato=fecha"/> /><a style="vertical-align:middle;"><img
                                    id="icon_FEFEFIN" alt="<axis:alt f="axisctr078" c="FEFEFIN" lit="108341"/>" title="<axis:alt f="axisctr078" c="DFEFECTE" lit="1000557"/>" src="images/calendar.gif"/></a>
                                </td>
                            </axis:visible>
                            <axis:visible f="axisctr078" c="DIEFECTE2"> 
                                <td class="campocaja">                             
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:50%;"
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCOBINI}"/>" name="FCOBINI" id="FCOBINI"
                                    title="<axis:alt f="axisctr078" c="DIEFECTE2" lit="9001814"/>"
                                    <axis:atr f="axisctr078" c="FCOBINI" a="formato=fecha"/> /><a style="vertical-align:middle;"><img
                                    id="icon_FCOBINI" alt="<axis:alt f="axisctr078" c="FCOBINI" lit="108341"/>" title="<axis:alt f="axisctr078" c="DIEFECTE2" lit="9001814"/>" src="images/calendar.gif"/></a>
                                </td>
                            </axis:visible>
                            <axis:visible f="axisctr078" c="DFEFECTEW"> 
                               <td class="campocaja">                             
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:50%;"
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCOBFIN}"/>" name="FCOBFIN" id="FCOBFIN"
                                    title="<axis:alt f="axisctr078" c="DFEFECTEW" lit="9001815"/>"
                                    <axis:atr f="axisctr078" c="FCOBFIN" a="formato=fecha"/> /><a style="vertical-align:middle;"><img
                                    id="icon_FCOBFIN" alt="<axis:alt f="axisctr078" c="FCOBFIN" lit="108341"/>" title="<axis:alt f="axisctr078" c="DFEFECTEW" lit="9001815"/>" src="images/calendar.gif"/></a>
                                </td> 
                            </axis:visible>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <div class="separador">&nbsp;</div>
                                <div class="titulo">
                                    <img src="images/flecha.gif"/><b><axis:alt f="axisctr078" c="RESULTADOS" lit="1000345"/> </b>
                                </div>
                                <div class="separador">&nbsp;</div>
                                <c:set var="title8"> </c:set>
                    <c:set var="title0"><axis:alt f="axisctr078" c="NPROCESO" lit="9000493"/></c:set>   <%-- Núm proceso --%>
                    <c:set var="title1"><axis:alt f="axisctr078" c="EMPRESA" lit="101619"/></c:set>   <%-- Empresa --%>
                    <c:set var="title2"><axis:alt f="axisctr078" c="MESANO" lit="100562"/></c:set>  <%-- Mes/año --%>
                    <c:set var="title3"><axis:alt f="axisctr078" c="OBSER" lit="101162"/></c:set>   <%-- Observaciones --%>
                    <c:set var="title4"><axis:alt f="axisctr078" c="FINILIQ" lit="9000526"/></c:set>   <%-- Fecha inicio --%>
                    <c:set var="title5"><axis:alt f="axisctr078" c="FFINLIQ" lit="9000527"/></c:set>   <%-- Observaciones --%>
                    <c:set var="title6"><axis:alt f="axisctr078" c="IMPORTE" lit="100563"/></c:set>   <%-- Observaciones --%>
                    <c:set var="title7"><axis:alt f="axisctr078" c="CCOMPANI" lit="9000600"/></c:set>   <%-- Observaciones --%>
                    <c:set var="title15"><axis:alt f="axisctr078" c="TESTADO" lit="100587"/></c:set>   <%-- Estado --%>
                    
                    <% int i=0; %>
                    <c:set var="h"><%=i%></c:set>
                    <div id="dt_recibos" class="seccion displayspace">
                        <display:table name="${__formdata.LSTLIQUIDACIONES}" id="LSTLIQUID" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                             requestURI="axis_axisctr078.do?paginar=true">
                            <%@ include file="../include/displaytag.jsp"%>     
                            <%--
                            <display:column title="${title8}" sortable="true" sortProperty="PLIQSELEC" headerClass="sortable fixed"   media="html" autolink="false" >
                                <input type= "radio" id="PLIQSELEC_${h}" sproliq="${LSTLIQUID.OB_IAX_LIQUIDACION.SPROLIQ}" name="PLIQSELEC_${h}" onclick="f_onclickCheckbox(this,'${LSTLIQUID.OB_IAX_LIQUIDACION.SPROLIQ}','${h}' );"
                                <c:if test="${LSTLIQUID.OB_IAX_LIQUIDACION.SPROLIQ == __formdata.SPROLIQ_}"> checked</c:if>  value="${LSTRECIBOS.OB_IAX_RECIBOS.PLIQSELEC}" /> 
                            </display:column>   --%>
                            <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_LIQUIDACION.SPROLIQ" headerClass="sortable fixed"  media="html" autolink="false" >                                                                                                                
                                <div class="dspNumber">
                                        <a href="javascript:f_seleccionar('${LSTLIQUID.OB_IAX_LIQUIDACION.SPROLIQ},${LSTLIQUID.OB_IAX_LIQUIDACION.CEMPRES}')">
                                        ${LSTLIQUID.OB_IAX_LIQUIDACION.SPROLIQ}
                                        </a>
                                </div>
                            </display:column>
                            <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_LIQUIDACION.TEMPRES" headerClass="sortable fixed"   media="html" autolink="false" >
                                <div class="dspText">
                                        <a href="javascript:f_seleccionar('${LSTLIQUID.OB_IAX_LIQUIDACION.SPROLIQ}','${LSTLIQUID.OB_IAX_LIQUIDACION.CEMPRES}')">
                                        ${LSTLIQUID.OB_IAX_LIQUIDACION.TEMPRES}
                                        </a>
                                </div>
                            </display:column>
                             <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_LIQUIDACION.TEMPRES" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText">
                                        <a href="javascript:f_seleccionar('${LSTLIQUID.OB_IAX_LIQUIDACION.SPROLIQ}','${LSTLIQUID.OB_IAX_LIQUIDACION.CEMPRES}')">
                                        ${LSTLIQUID.OB_IAX_LIQUIDACION.TCOMPANI}
                                        </a>
                                </div>
                            </display:column>
                             <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_LIQUIDACION.FLIQUIDA" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText">
                                        <a href="javascript:f_seleccionar('${LSTLIQUID.OB_IAX_LIQUIDACION.SPROLIQ}','${LSTLIQUID.OB_IAX_LIQUIDACION.CEMPRES}')">
                                        <fmt:formatDate pattern="dd/MM/yyyy" value="${LSTLIQUID.OB_IAX_LIQUIDACION.FLIQUIDA}"/>
                                        </a>
                                </div>
                            </display:column>
                            <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_LIQUIDACION.FINILIQ" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText">
                                        <a href="javascript:f_seleccionar('${LSTLIQUID.OB_IAX_LIQUIDACION.SPROLIQ}','${LSTLIQUID.OB_IAX_LIQUIDACION.CEMPRES}')">
                                        <fmt:formatDate pattern="dd/MM/yyyy" value="${LSTLIQUID.OB_IAX_LIQUIDACION.FINILIQ}"/>
                                        </a>
                                </div>
                            </display:column>
                             <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_LIQUIDACION.FFINLIQ" headerClass="sortable fixed"   media="html" autolink="false" >
                                <div class="dspText">
                                     <a href="javascript:f_seleccionar('${LSTLIQUID.OB_IAX_LIQUIDACION.SPROLIQ}','${LSTLIQUID.OB_IAX_LIQUIDACION.CEMPRES}')">
                                     <fmt:formatDate pattern="dd/MM/yyyy" value="${LSTLIQUID.OB_IAX_LIQUIDACION.FFINLIQ}"/>
                                     </a>
                                </div>
                            </display:column>
                               <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_LIQUIDACION.IMPORTE" headerClass="sortable fixed"   media="html" autolink="false" >
                                <div class="dspText">
                                    <a href="javascript:f_seleccionar('${LSTLIQUID.OB_IAX_LIQUIDACION.SPROLIQ}','${LSTLIQUID.OB_IAX_LIQUIDACION.CEMPRES}')">
                                    <fmt:formatNumber pattern="###,##0.00" value='${LSTLIQUID.OB_IAX_LIQUIDACION.IMPORTE}'/>
                                    </a>
                                </div>
                            </display:column>
                           <display:column title="${title15}" sortable="true" sortProperty="OB_IAX_LIQUIDACION.SPROLIQ" headerClass="sortable fixed"  media="html" autolink="false" >                                                                                                                
                                <div class="dspNumber">
                                        <a href="javascript:f_seleccionar('${LSTLIQUID.OB_IAX_LIQUIDACION.SPROLIQ}','${LSTLIQUID.OB_IAX_LIQUIDACION.CEMPRES}')">
                                        ${LSTLIQUID.OB_IAX_LIQUIDACION.TESTLIQ}
                                        </a>
                                </div>
                            </display:column>
                            <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_LIQUIDACION.TLIQUIDA" headerClass="sortable fixed"   media="html" autolink="false" >
                                <div class="dspText">                                    
                                        <a href="javascript:f_seleccionar('${LSTLIQUID.OB_IAX_LIQUIDACION.SPROLIQ}','${LSTLIQUID.OB_IAX_LIQUIDACION.CEMPRES}')">
                                        ${LSTLIQUID.OB_IAX_LIQUIDACION.TLIQUIDA}
                                        </a>
                                </div>
                            </display:column>
                            <%i++;%>
                            <c:set var="h"><%=i%></c:set>
                        </display:table>
                    </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr> 
        </table>
        
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="__botones">cancelar,nuevo,buscar</c:param>
            <c:param name="f">axiscttr078</c:param>
        </c:import>
        
    </form>
    <c:import url="../include/mensajes.jsp" />
    
    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FEMISIOINI",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FEMISIOINI", 
            singleClick    :    true,
            firstDay       :    1
        });
        
        Calendar.setup({
            inputField     :    "FEMISIOFIN",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_FEMISIOFIN",  
            singleClick    :    true,
            firstDay       :    1
        });
        
         Calendar.setup({
            inputField     :    "FEFEINI",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_FEFEINI",  
            singleClick    :    true,
            firstDay       :    1
        });
        
         Calendar.setup({
            inputField     :    "FEFEFIN",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_FEFEFIN",  
            singleClick    :    true,
            firstDay       :    1
        });        
        
        Calendar.setup({
            inputField     :    "FCOBINI",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_FCOBINI",  
            singleClick    :    true,
            firstDay       :    1
        });  
        
        Calendar.setup({
            inputField     :    "FCOBFIN",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_FCOBFIN",  
            singleClick    :    true,
            firstDay       :    1
        });  
        
    </script>

</body>
</html>