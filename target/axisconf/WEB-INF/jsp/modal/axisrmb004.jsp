<%/*
*  Fichero: axisrmb004.jsp
*
*  @author <a href="mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*  Fecha: 25/08/2008
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
        
        function f_but_cancelar() {
            reformatearImportes();
           parent.f_cerrar_modal('axisrmb004','');  

        }
        
        function f_but_aceptar() {
        
            if (objValidador.validaEntrada()) {
              // reformatearImportes();
               var PPFAC_CLI = document.miForm.NFACT_CLI.value;
               var PPNREEMB = document.miForm.NREEMB_HIDDEN.value;
               var PPFACTURA = document.miForm.NFACT.value;
               
               if (objUtiles.estaVacio(PPFACTURA)) 
                  PPFACTURA = objDom.getValorPorId("NFACTURA");

               if (!objUtiles.estaVacio(PPFAC_CLI)) {
                    //primer gravem i despres comprovem si existeix la factura
                    var PARAM = "?PPNREEMB="+ PPNREEMB + "&NFACTURACLI=" + PPFAC_CLI;
                    objUtiles.ejecutarFormulario ("modal_axisrmb004.do"+PARAM, "existe_factura", document.miForm, "_self");
                    //objAjax.invokeAsyncCGI("modal_axisrmb004.do", callbackAjaxExisteFactura, "operation=ajax_existe_factura" + PARAM, this, objJsMessages.jslit_cargando);
               }
               else {
                    objUtiles.ejecutarFormulario ("modal_axisrmb004.do", "alta_fact", document.miForm, "_self");
               }
           }
        }

        function f_onclickCheckbox(thiss) {
           thiss.value =  ((thiss.checked)?1:0);
           objDom.setValorPorId(thiss.id, thiss.value);
        }    

        function callbackAjaxExisteFactura(ajaxResponseText) {
           try { 
               reformatearImportes();
               var doc=objAjax.domParse(ajaxResponseText);
               
               if (!objAppMensajes.existenErroresEnAplicacion(doc)) {

                   try{
                       var nremb = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PNREEMBDEST"), 0, 0);
                       var NewFACT = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NewFACT"), 0, 0);
                       document.miForm.NFACT.value = NewFACT;               
                   }catch(e){}

                  if(confirm("<axis:alt f='axisrmb004' c='PREG_EXIS_REEMB' lit='9001976'/>")){
                       try{
                          var PPFAC_CLI = document.miForm.NFACT_CLI.value;
                          objUtiles.ejecutarFormulario ("modal_axisrmb004.do?PPNREEMB="+ PPNREEMB + "&NewFACT="+NewFACT+"&NFACTURACLI=" + PPFAC_CLI +"&NREEMBORI=" + nremb, "tras_factura", document.miForm, "_self");
                       }catch(e){alert (e.name + " " + e.message);}
                  } else {
                        //apretem el boto cancelar:actualitzem la factura i posem a null el nº de full
                        document.miForm.NFACT_CLI.value = null;
                        objUtiles.ejecutarFormulario ("modal_axisrmb004.do", "alta_fact", document.miForm, "_self");
                  }
               }
               else{
                 objUtiles.ejecutarFormulario ("modal_axisrmb004.do", "alta_fact", document.miForm, "_self");               
               }
           } catch (e) {
             // if (isDebugAjaxEnabled == "true")
                 alert (e.name + " " + e.message);
           }
        }          
        
        function f_onload() {
           
            try{
            	document.miForm.NFACT_CLI.focus();
            }catch(e){
                document.miForm.FFACTURA.focus();
            }
            f_cargar_propiedades_pantalla();
            //   reformatearImportes();
            var missatge = "${__formdata.missatge}";
            if (!objUtiles.estaVacio(missatge) ){
                 if(confirm("<axis:alt f='axisrmb004' c='PREG_EXIS_REEMB' lit='9001976'/>")){
                     nremb = "${__formdata.PNREEMBDEST}";
                     var PPFAC_CLI = document.miForm.NFACT_CLI.value;
                     objUtiles.ejecutarFormulario ("modal_axisrmb004.do?PPNREEMB="+ document.miForm.NREEMB.value + "&NFACTURACLI=" + PPFAC_CLI +"&NREEMBORI=" + nremb, "tras_factura", document.miForm, "_self");
                 } else {//apretem el boto cancelar:actualitzem la factura i posem a null el nº de full
                     document.miForm.NFACT_CLI.value = '';
                     objUtiles.ejecutarFormulario ("modal_axisrmb004.do", "alta_fact", document.miForm, "_self");
                 }
            }
            
            var NREEMB = "${__formdata.newReemb}";
            var ok = "${__formdata.OK}";

            if (!objUtiles.estaVacio(ok) ){
                parent.f_cerrar_axisrmb004(NREEMB, document.miForm.NFACT.value)
            }

            <c:if test="${__formdata.ALTAC==0}">
                   // document.miForm.but_aceptar.disabled="true";
                   //f_but_cancelar();
                   parent.f_cerrar_modal('axisrmb004',document.miForm.NFACT.value);  
            </c:if>
        }
        
        function f_formatdate(entrada,title){
         var jDate = new JsFecha();
            if(entrada.value.length>0){
                entrada.value=jDate.formateaFecha(entrada.value);
            
                if(jDate.validaFecha(entrada.value)){
                    entrada.value=jDate.formateaFecha(entrada.value);
                }else{
                    alert("<axis:alt f="axisrmb004" c="MSG_FECHA" lit="1000421"/>");
                }
            }
        }
        
        /**
        * Método que valida y formatea un campo numérico con el patrón ##.##,##. Si no se valida correctamente, devuelve un ''.
        * @param {Object} valor a validar
        * @param {Boolean} isDecimal: true->es decimal, false->no es decimal
        * @param {Boolean} tienePuntoMiles: true->formatea puntos a los miles, false->no lo hace
        * @return {String} Valor obtenido de la validación y formateo
        */
        function valorFormateadoCampoNumerico (entrada, isDecimal, tienePuntoMiles){
            if (objNumero.validaNumero(entrada, isDecimal)){
                // Validación correcta, formatear valor 
                entrada = objNumero.formateaNumero(entrada, isDecimal);  
                if(!tienePuntoMiles) entrada = objNumero.quitarSeparadorMiles(entrada);
                
            }else{
                return '';
            }
            
            return entrada;
        }
        
        function reformatearImportes(){
             objDom.setValorPorId("IMPFACT",valorFormateadoCampoNumerico(objDom.getValorPorId("IMPFACT"),true,false));
        }       
        
        function f_ponerFocus(idd){
             try{
                alert(event);
                if (idd == 'FFACTURA')
                      document.miForm.IMPFACT.focus();
             }catch(e){}
        }
        
        function pasarAlSiguiente(campoActual) { 
          if (campoActual.readOnly || campoActual.disabled){
                var tabIndexActual = parseInt( campoActual.getAttribute("tabIndex") ); 
                // tengo que encontrar el campo dentro del formulario que tenga un tabindex tabIndexActual+1 
                var fr = campoActual.form; 
                var nCampos = fr.length; 
                for(var i=0, tabIndexAux; i<nCampos; i++) { 
                    tabIndexAux = parseInt( fr.item(i).getAttribute("tabIndex") ); 
                    if( tabIndexAux === tabIndexActual+1 ) { 
                        if( fr.item(i).disabled===false && fr .item(i).type!='hidden')         // casos en que no acepta el focus 
                            fr.item(i).focus(); 
                        else 
                            tabIndexActual++; 
                    } 
                } 
            }
        } 
        
    </script>
  </head>
  
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" action="modal_axisrmb004.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisrmb004" c="TITULO" lit="9000467"/></c:param>      <%-- Mto. Facturas --%>
            <c:param name="formulario"><axis:alt f="axisrmb004" c="TITULO" lit="9000467"/></c:param>  <%-- Mto. Facturas --%>
            <c:param name="form">axisrmb004</c:param>
        </c:import>
        
        <input type="hidden" id="operation" name="operation" value=""/>
        <input type="hidden" name="NREEMB_HIDDEN" value="${__formdata.NREEMB}" />
        <input type="hidden" name="NFACTURA" value="${__formdata.NFACT}" />
        <input type="hidden" name="NFACTURA_CLI" value="${__formdata.NFACT_CLI}" />

        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="3">            
            <tr>
                <td>
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisrmb004" c="LIT_DATREEMB" lit="9000468" /></div>
                    <table class="seccion">
                        <tr>
                            <td>
                                <table class="area" align="center">                    
                                    <tr>
                                        <th style="width:20%;height:0%;"/>
                                        <th style="width:20%;height:0%;"/>
                                        <th style="width:20%;height:0%;"/>
                                        <th style="width:20%;height:0%;"/>
                                        <th style="width:20%;height:0%;"/>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb004" c="NREEMB" lit="9001512"/></b>   <%-- Nº Reembolso --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb004" c="NPOLIZA" lit="9001514"/></b>   <%-- Nº Póliza --%>
                                        </td>                                                       
                                        <td class="titulocaja" colspan=2>
                                            <b><axis:alt f="axisrmb004" c="CESTADO" lit="100587"/></b>    <%-- Estado --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb004" c="FESTADO" lit="9000450"/></b>   <%-- F. Estado --%>
                                        </td>           
                                    </tr>
                                    <tr>
                                        <td class="campocaja">                             
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NREEMB}" name="NREEMB" id="NREEMB"
                                            style="width:45%;" onfocus="pasarAlSiguiente(this)" <axis:atr f="axisrmb004" c="NREEMB" a="formato=entero&modificable=false"/>
                                            title="<axis:alt f="axisrmb004" c="NREEMB" lit="9001512"/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" onfocus="pasarAlSiguiente(this)"  class="campowidthinput campo campotexto" size="15" value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA"
                                            style="width:45%;" <axis:atr f="axisrmb004" c="NPOLIZA" a="formato=entero&modificable=false"/> 
                                            title="<axis:alt f="axisrmb004" c="NPOLIZA" lit="9001514"/>"/>
                                        </td>
                                        <td class="campocaja" colspan=2>
                                            <input type="text" onfocus="pasarAlSiguiente(this)"  class="campowidthinput campo campotexto" size="15" value="${__formdata.TESTADO}" name="CESTADO" id="CESTADO"
                                            style="width:70%;" <axis:atr f="axisrmb004" c="CESTADO" a="formato=entero&modificable=false"/> 
                                            title="<axis:alt f="axisrmb004" c="CESTADO" lit="100587"/>" />
                                        </td>
                                        <td class="campocaja">                                
                                            <input type="text" onfocus="pasarAlSiguiente(this)"  class="campowidthinput campo campotexto" size="15" title="<axis:alt f="axisrmb004" c="FESTADO" lit="9000450"/>"
                                            value="<fmt:formatDate value="${__formdata.FESTADO}" pattern="dd/MM/yyyy"/>" name="FESTADO" id="FESTADO"
                                            style="width:40%;" <axis:atr f="axisrmb004" c="FESTADO" a="modificable=false"/> />
                                        </td>    
                                    </tr>
                                    <tr>                                                    
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisrmb004" c="NOMBRE_TOM" lit="101027"/></b> <%-- Tomador --%>
                                        </td>
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisrmb004" c="NOMBRE_ASEG" lit="101028"/></b>  <%-- Asegurado --%>
                                        </td>                                                     
                                        <axis:ocultar f="axisrmb004" c="CBANHOSP" dejarHueco="false" >
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisrmb004" c="CBANHOSP" lit="9901858"/></b>  <%-- Abonament Hospital --%>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <td class="campocaja" colspan="2">                             
                                            <input type="text" onfocus="pasarAlSiguiente(this)"  class="campowidthinput campo campotexto" size="15" value="${__formdata.NOMBRE_TOM}" name="NOMBRE_TOM" id="NOMBRE_TOM"
                                            style="width:80%;" <axis:atr f="axisrmb004" c="NOMBRE_TOM" a="modificable=false"/>
                                            title="<axis:alt f="axisrmb004" c="NOMBRE_TOM" lit="101027"/>"/>
                                        </td>
                                        <td class="campocaja" colspan="2">
                                            <input type="text" onfocus="pasarAlSiguiente(this)"  class="campowidthinput campo campotexto" size="15" value="${__formdata.NOMBRE_ASEG}" name="NOMBRE_ASEG" id="NOMBRE_ASEG"
                                            style="width:80%;" <axis:atr f="axisrmb004" c="NOMBRE_ASEG" a="modificable=false"/> 
                                            title="<axis:alt f="axisrmb004" c="NOMBRE_ASEG" lit="101028"/>" />
                                        </td>
                                        <axis:ocultar f="axisrmb004" c="CBANHOSP" dejarHueco="false" >
                                            <td class="campocaja">
                                                <input type="checkbox" onchange="f_onclickCheckbox(this);" value="${__formdata.CBANHOSP}" name="CBANHOSP" id="CBANHOSP"
                                                    <c:if test="${__formdata.CBANHOSP == '1'}">checked="true"</c:if> />
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    
                    <div class="separador">&nbsp;</div>
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisrmb004" c="LIT_FACTURA" lit="9000469" /></div>
                    <table class="seccion">
                        <tr>
                            <td>
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:33%;height:0%;"/>
                                        <th style="width:33%;height:0%;"/>
                                        <th style="width:33%;height:0%;"/>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb004" c="NFACT" lit="9000445"/></b>  <%-- Nº Fact. --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb004" c="NFACT_CLI" lit="9000650"/></b>  <%-- Nº Fact. Cli. --%>
                                        </td>                                                       
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb004" c="TORIGEN" lit="9000443"/></b>   <%-- Origen --%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NFACT}" name="NFACT" id="NFACT"
                                            style="width:30%;"  <axis:atr f="axisrmb004" c="NFACT" a="formato=entero&modificable=false"/>
                                            title="<axis:alt f="axisrmb004" c="NFACT" lit="9000445"/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" tabindex="1" onfocus="pasarAlSiguiente(this)" class="campowidthinput campo campotexto" size="15" value="${__formdata.NFACT_CLI}" name="NFACT_CLI" id="NFACT_CLI"
                                            style="text-transform:uppercase; width:50%;" <axis:atr f="axisrmb004" c="NFACT_CLI" a="modificable=true"/> 
                                            title="<axis:alt f="axisrmb004" c="NFACT_CLI" lit="9000650"/>"/>
                                        </td>
                                        <td class="campocaja">                                
                                            <input type="text" onfocus="pasarAlSiguiente(this)"  class="campowidthinput campo campotexto" size="15" value="${__formdata.TORIGEN}" name="TORIGEN" id="TORIGEN"
                                            style="width:50%;" <axis:atr f="axisrmb004" c="TORIGEN" a="modificable=false"/> title="<axis:alt f="axisrmb004" c="TORIGEN" lit="9000443"/>"/>
                                        </td>        
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb004" c="FFACTURA" lit="9000451"/></b>  <%-- F. Factura --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb004" c="FACUSE" lit="9000453"/></b>  <%-- F. Acuse --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb004" c="IMPFACT" lit="100563"/></b>   <%-- Importe --%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="campocaja">                             
                                            <input type="text" tabindex="2" onfocus="pasarAlSiguiente(this)" class="campowidthinput campo campotexto" size="15" 
                                            value="<fmt:formatDate value='${__formdata.FFACTURA}' pattern='dd/MM/yyyy'/>" name="FFACTURA" id="FFACTURA" onblur="javascript:f_formatdate(this,'')"
                                            style="width:30%;" <axis:atr f="axisrmb004" c="FFACTURA" a="formato=fecha&obligatorio=true"/>
                                            title="<axis:alt f="axisrmb004" c="FFACTURA" lit="9000451"/>"/><a id="icon_FFACTURA" style="vertical-align:middle;"><img 
                                            alt="<axis:alt f="axisrmb004" c="LIT_SELEC" lit="108341"/>" title="<axis:alt f="axisrmb004" c="FFACTURA" lit="9000451" />" src="images/calendar.gif"/></a>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" onfocus="pasarAlSiguiente(this)" class="campowidthinput campo campotexto" size="15" 
                                            value="<fmt:formatDate value='${__formdata.FACUSE}' pattern='dd/MM/yyyy'/>" name="FACUSE" id="FACUSE"
                                            style="width:30%;" <axis:atr f="axisrmb004" c="FACUSE" a="formato=fecha&obligatorio=false&modificable=false"/>
                                            title="<axis:alt f="axisrmb004" c="FACUSE" lit="9000453"/>"/>
                                        </td>
                                         <td class="campocaja">                                
                                            <input type="text" tabindex="3"  onfocus="pasarAlSiguiente(this)" class="campowidthinput campo campotexto" size="15" 
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPFACT}' />" name="IMPFACT" id="IMPFACT"
                                            style="width:30%;" <axis:atr f="axisrmb004" c="IMPFACT" a="formato=decimal&obligatorio=true"/> title="<axis:alt f="axisrmb004" c="IMPFACT" lit="100563"/>"/>
                                        </td>   
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb004" c="CTIPO" lit="9001979"/></b>  <%-- Tipo factura--%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb004" c="FBAJA" lit="9000447"/></b>  <%-- F. Baja --%>
                                        </td>   
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb004" c="NFACTEXT" lit="9001913"/></b>   <%-- Num. factura externa --%>
                                        </td>                                                    
                                    </tr>
                                    <tr>
                                       <td class="campocaja">
                                            <select tabindex="4" name="CTIPO" onfocus="pasarAlSiguiente(this)" id="CTIPO" <axis:atr f="axisrmb004" c="CTIPO" a="isInputText=false&obligatorio=true"/> 
                                                title="<axis:alt f="axisrmb004" c="LIT_TIPO" lit="100565"/>" size="1" class="campowidthselect campo campotexto" style="width:40%;">
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrmb004" c="LIT_SELECCIONI" lit="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.listaTipos}">
                                                    <option value = "${element.CATRIBU}" 
                                                        <c:if test="${element.CATRIBU == __formdata.CTIPOFAC || element.CATRIBU == 0}"> selected </c:if> />
                                                        ${element.TATRIBU} 
                                                    </option>
                                                </c:forEach>
                                            </select>
                                            <input type="hidden" class="campowidthinput campo campotexto" size="15" value="${__formdata.CTIPO}" name="CTIPO_AUX" id="CTIPO_AUX"
                                            style="width:30%;" />
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" tabindex="5" onfocus="pasarAlSiguiente(this)" class="campowidthinput campo campotexto" size="15" 
                                            title="<axis:alt f="axisrmb004" c="FBAJA" lit="9000447"/>" value="<fmt:formatDate value='${__formdata.FBAJA}' pattern='dd/MM/yyyy'/>" name="FBAJA" id="FBAJA" onblur="javascript:f_formatdate(this,'')"
                                            style="width:30%;" <axis:atr f="axisrmb004" c="FBAJA" a="formato=fecha"/>/><a id="icon_FBAJA" style="vertical-align:middle;"><img 
                                            alt="<axis:alt f="axisrmb004" c="LIT_SELEC" lit="108341"/>" title="<axis:alt f="axisrmb004" c="FBAJA" lit="9000447" />" src="images/calendar.gif"/></a>
                                        </td>
                                        <td class="campocaja">                             
                                            <input type="text" tabindex="6" onfocus="pasarAlSiguiente(this)" class="campowidthinput campo campotexto" size="15" value="${__formdata.NFACTEXT}" name="NFACTEXT" id="NFACTEXT"
                                            style="width:50%;" <axis:atr f="axisrmb004" c="NFACTEXT" a="modificable=true"/> title="<axis:alt f="axisrmb004" c="NFACTEXT" lit="9001913"/>"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb004" c="LIT_NUM" lit="800440"/> <axis:alt f="axisrmb004" c="LIT_CASS" lit="9000434"/> <axis:alt f="axisrmb004" c="LIT_TITULAR" lit="9000566"/></b> <%-- Nº CASS TITULAR--%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb004" c="NCASS_ASE" lit="9000448"/></b>  <%-- Nº CASS Enfermo --%>
                                        </td>
                                        <axis:ocultar f="axisrmb004" c="CTRACTAT" dejarHueco="false" >
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisrmb004" c="CTRACTAT" lit="9901851"/></b>  <%-- Tractada --%>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>

                                        <td class="campocaja">                             
                                            <input type="text" tabindex="8" onfocus="pasarAlSiguiente(this)"  class="campowidthinput campo campotexto" size="15" value="${__formdata.NCASS_ASE}" name="NCASS_ASE" id="NCASS_ASE"
                                            style="width:30%;" <axis:atr f="axisrmb004" c="NCASS_ASE" a="obligatorio=true" /> 
                                            title="<axis:alt f="axisrmb004" c="NCASS_ASE" lit="9000448"/>"/>
                                        </td>
                                        <td class="campocaja">                             
                                            <input type="text" tabindex="7" onfocus="pasarAlSiguiente(this)"  class="campowidthinput campo campotexto" size="15" value="${__formdata.NCASS}" name="NCASS" id="NCASS" 
                                            style="width:30%;" <axis:atr f="axisrmb004" c="NCASS" a="obligatorio=true" /> 
                                            title="<axis:alt f="axisrmb004" c="LIT_NUM" lit="800440"/> <axis:alt f="axisrmb004" c="LIT_CASS" lit="9000434"/>"/> <!-- OJO INTERCAMBIADOS -->
                                        </td>                                        
                                        <axis:ocultar f="axisrmb004" c="CTRACTAT" dejarHueco="false" >
                                            <td class="campocaja">
                                                <select tabindex="9" name="CTRACTAT" onfocus="pasarAlSiguiente(this)" id="CTRACTAT" <axis:atr f="axisrmb004" c="CTRACTAT" a="isInputText=false&obligatorio=false"/> 
                                                    title="<axis:alt f="axisrmb004" c="LIT_TIPO" lit="100565"/>" size="1" class="campowidthselect campo campotexto" style="width:40%;">
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrmb004" c="LIT_SELECCIONI" lit="1000348"/> - </option>
                                                    <c:forEach var="element" items="${__formdata.listaSiNo}">
                                                        <option value = "${element.CATRIBU}" 
                                                            <c:if test="${element.CATRIBU == __formdata.CTRACTAT}"> selected </c:if> />
                                                            ${element.TATRIBU} 
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                                <input type="hidden" class="campowidthinput campo campotexto" size="15" value="${__formdata.CTRACTAT}" name="CTRACTAT_AUX" id="CTRACTAT_AUX"
                                                style="width:30%;" />
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
        
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axisrmb004</c:param>
            <c:param name="tabindex">7</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>
        
    </form>
    <c:import url="../include/mensajes.jsp" />
    
    <script type="text/javascript">
        
        //Calendar.setup({
        //    inputField     :    "FESTADO",     
        //    ifFormat       :    "%d/%m/%Y",      
        //    button         :    "icon_FESTADO", 
        //    singleClick    :    true,
        //    firstDay       :    1
        //});
        
        Calendar.setup({
            inputField     :    "FFACTURA",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FFACTURA", 
            singleClick    :    true,
            firstDay       :    1
        });
        

        Calendar.setup({
            inputField     :    "FBAJA",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_FBAJA",  
            singleClick    :    true,
            firstDay       :    1
        });

    </script>
    
  </body>
</html>