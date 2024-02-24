<%--
/**
*  Fichero: axissin053.jsp
*  
*  T?tulo: Siniestros ALTA Fraude 
*
*  Fecha: 20/02/2009
*/
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axissin053" c="title" lit="109479"/>/<axis:alt f="axissin053" c="title" lit="9000897"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
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
    <c:import url="../include/carga_framework_js.jsp"/>
    <c:set var="linea_trami" value="${__formdata.NTRAMIT}"/> <!-- ${LINEATRAM} -->
    <script type="text/javascript">
        function f_onload() { 
        revisarEstilos();
        var valor = "<%=request.getAttribute("resultado")%>"; 
        var sidepagout = "<%=request.getAttribute("PSIDEPAGOUT")%>";
        var isnew = "<%=request.getAttribute("isNew")%>";
        var seccion = "${__formdata.SECCION}";
        var NSINIES = "${__formdata.NSINIES}";
        if (valor=="OK"){
            alert('<axis:alt f="axissin053" c="LIT_PROCESO_CORRECTO" lit="109904"/>');
            parent.f_aceptar_axissin053();
            //this.f_but_cancelar();
        }
        
        //Cargamos el combo
        //f_recarga_cconpag(); //Se realizará desde el service, cada vez que se recargue la pantalla
        
        f_cargar_propiedades_pantalla();
        
   }
        
        function f_but_aceptar(){
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario ("modal_axissin053.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
        
        function f_but_cancelar(){
        var valor = "<%=request.getAttribute("OK")%>"; 
        var sidepagout = "<%=request.getAttribute("PSIDEPAGOUT")%>"; 
            var NSINIES = "${__formdata.NSINIES}";
            parent.f_aceptar_axissin053(NSINIES,"tramitaciones","pagos", valor,sidepagout);            	
        }


//AXISPER014, ALTA CCC
        function f_abrir_axisper014(CNORDBAN,selectedPerson) {
            objUtiles.abrirModal("axisper014", "src", "modal_axisper014.do?operation=form&SPERSON="+selectedPerson+"&CNORDBAN=" + CNORDBAN+"&CAGENTE="+document.miForm.CAGENTE.value);            
        }  
        function f_aceptar_axisper014(selectedPerson){
            f_cerrar_axisper014();
            objUtiles.ejecutarFormulario ("modal_axissin053.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        function f_cerrar_axisper014(){
            objUtiles.cerrarModal("axisper014");
        }         
//UTILS        
       function f_recargar(thiss){
               if (!objUtiles.estaVacio(thiss) && objUtiles.utilEquals(thiss.id,'DESTINATARI')){               
                    var SPERSON = objUtiles.utilSplit(thiss.value, "/")[0]; // SPERSON
                    var CTIPDES = objUtiles.utilSplit(thiss.value, "/")[1]; // CTIPDES
                    
                    document.miForm.SPERSON.value = SPERSON;                    
                    objDom.setValorPorId("SPERSON", SPERSON);
                                      
                    document.miForm.CTIPDES.value = CTIPDES;
                    objDom.setValorPorId("CTIPDES", CTIPDES);
                    
                }else{
                }
               if (!objUtiles.estaVacio(thiss) && objUtiles.utilEquals(thiss.id,'BANC')){
                    var CBANCAR = objUtiles.utilSplit(thiss.value, "@@")[0]; // SPERSON
                    var CTIPBAN = objUtiles.utilSplit(thiss.value, "@@")[1]; // CTIPDES
                    objDom.setValorPorId("CBANCAR", CBANCAR);
                    objDom.setValorPorId("CTIPBAN", CTIPBAN);
                }                
                
                
            objUtiles.ejecutarFormulario ("modal_axissin053.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);    
        }     

        function f_abrir_modal(cual, noXButton, optionalQueryString) {

            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
      function f_aceptar_axissin011(NSINIES) {
          //alta destinatarios, desde pagos
            objDom.setValorPorId("NSINIES", NSINIES);
            f_recargar(null);
        }     
        
      function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        ///////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////
        
        
         function f_actData(thiss){
        //alert("Aquí");
        thiss.value = f_formatdate(thiss);
        }     
        function f_formatdate(entrada){
         var jDate = new JsFecha();

         if (!jDate.validaFecha(entrada.value)
         || entrada.value.indexOf("/") == -1
         ){
            if(entrada.value.length>0){
                entrada.value=jDate.formateaFecha(entrada.value);            
                if(jDate.validaFecha(entrada.value)){
                    entrada.value=jDate.formateaFecha(entrada.value);
                }else{
                    entrada.value = '';//alert('Formato fecha incorrecto para el campo '+ title);
                }
        }
        }
        return entrada.value;
        }
        
       function f_onclickCheckbox(thiss) {
           thiss.value =  ((thiss.checked)?1:0);
        }
        
///////////////////////////////////////////////////////////////////////////////
///////////////////// funciones ajax //////////////////////////////////////////
function f_recarga_cconpag() {
            var comboOrigen="11";
            objAjax.invokeAsyncCGI("modal_axissin053.do", callbackAjaxActualizarCombos, "operation=ajax_recargar_cconpag", this);
        }
        
        
function callbackAjaxActualizarCombos(ajaxResponseText) {
            //alert("*************"+ajaxResponseText);
            var doc = objAjax.domParse(ajaxResponseText);
            try {            
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                     rellenarCombo(doc);
                    }
                         
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
        }
        
function rellenarCombo(doc) {
            //alert("0");
            var combo = document.getElementById("CCONPAG");
            //alert("1");
            objDom.borrarOpcionesDeCombo(combo);
            objDom.addOpcionACombo("", " - " + "<axis:alt f='axissin053' c='alerta_mensaje' lit='1000348'/>" + " - ", combo, null);
            //alert("2");
            //if (objUtiles.existeObjetoXml(doc.getElementsByTagName(comboName)[0])){                    
                if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                        objDom.borrarOpcionesDeCombo(combo);
                            objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", combo, 0);
                            for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                                    //alert("Antes de recorrera el bug");
                                    var TATRIBU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0].childNodes[0].nodeValue : "");
                                    var CATRIBU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0].childNodes[0].nodeValue : "");
                                    objDom.addOpcionACombo(CATRIBU, TATRIBU, combo, i+1);
                                  
                            }
                }
                //if (numElementos == 1) {
                    // Seleccionar la única opción del combo y ejecutar
                    // su llamada onchange para recuperar combos dependientes
                //     combo[0].selected = "1";
                //    combo.onchange(); 
                //}
          //  }
        }


/* **************************************** FUNCIONES AJAX ***************************************** */

function f_buscar_personas() {
              
                var NSINIES=document.miForm.NSINIES.value;
                var NTIPDEF=document.miForm.NTIPDEF.value;
                var SSEGURO=document.miForm.SSEGURO.value;
            
               
                if (!objUtiles.estaVacio(NTIPDEF)){
                    var qs="operation=ajax_buscar_personas";
                    qs=qs+"&NSINIES="+NSINIES+"&SSEGURO="+SSEGURO+"&NTIPDEF="+NTIPDEF;
                    objAjax.invokeAsyncCGI("modal_axissin053.do", callbackajaxPersonas, qs, this);
                } 
            }    

function callbackajaxPersonas (ajaxResponseText){
              
                try{ 
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var comboPersonas = document.miForm.SPERSON;   
             
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                   
                        objDom.borrarOpcionesDeCombo(comboPersonas);
                            objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", comboPersonas, 0);
                            for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                                         
                                var TPERSON = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TPERSON")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TPERSON")[0].childNodes[0].nodeValue : "");
                                var SPERSON = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("SPERSON")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("SPERSON")[0].childNodes[0].nodeValue : "");
                               
                                objDom.addOpcionACombo(SPERSON, TPERSON, comboPersonas, i+1);
                            }
                                valor = documento.miForm.SPERSON_AUX.value;
                                document.miForm.SPERSON.selectedIndex = valor;
                        }else{
                            objDom.borrarOpcionesDeCombo (comboPersonas);
                            objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", comboPersonas, null);
                        }
                    }
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
                }
            }

/* ************************************************************************************************* */        
    </script>
</head>
<body onload="javascript:f_onload()">
        <!-- AXISSIN011 ALTA/MODIF. DESTINATARIOS -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin011|<axis:alt f="axissin053" c="titulo_axissin011" lit="9000896"/></c:param>
        </c:import>
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
        <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axissin053" c="titulo_axisper012" lit="1000235" /></c:param>
        <c:param name="nid" value="axisper012" />
        </c:import>      
        <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axissin053" c="titulo_axisper014" lit="1000235" /></c:param>
        <c:param name="nid" value="axisper014" />
        </c:import>  
    <form name="miForm" action="modal_axissin053.do" method="POST">

    <input type="hidden" name="operation" value="guardar" />
    <input type="hidden" name="NSINIES" value="${__formdata.NSINIES}"/>
    <input type="hidden" name="NTRAMIT" value="${__formdata.NTRAMIT}"/>
    <input type="hidden" name="SIDEPAG" value="${__formdata.SIDEPAG}"/>
    <input type="hidden" name="indexTramitacio" value="${__formdata.indexTramitacio}"/>
    <input type="hidden" name="SSEGURO" value="${__formdata.SSEGURO}"/>
    <input type="hidden" name="SPERSON_AUX" value="${__formdata.SPERSON_AUX}"/>
    <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}"/>
    <input type="hidden" name="CTIPDES" value="${__formdata.CTIPDES}"/>
    <input type="hidden" name="subpantalla" value="${subpantalla}"/>
    <input type="hidden" name="SECCION" value="${__formdata.SECCION}"/>    
    <input type="hidden" name="isNew" value="${__formdata.isNew}"/>    
    
    <input type="hidden" name="SPRODUC"  value="${__formdata.SPRODUC}" />
    <input type="hidden" name="CACTIVI"  value="${__formdata.CACTIVI}" />
    <input type="hidden" name="CTRAMIT"  value="${__formdata.CTRAMIT}" />
    <input type="hidden" name="CCAUSIN"  value="${__formdata.CCAUSIN}" />
    <input type="hidden" name="CMOTSIN"  value="${__formdata.CMOTSIN}" />
    
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt f="axissin053" c="titulo" lit="9903632"/></c:param>
        <c:param name="formulario"><axis:alt f="axissin053" c="formulario" lit="9903632"/></c:param>
        <c:param name="form">axissin053</c:param>
    </c:import>
    <div class="separador">&nbsp;</div>
    <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table class="seccion">
                    <tr>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                    </tr>
                    <tr>
                        <axis:ocultar c="NTIPDEF" f="axissin053" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin053" c="NTIPDEF" lit="9901939"/></b><!-- Tipo defraudador -->
                            </td>
                        </axis:ocultar>
                        <axis:ocultar c="SPERSON" f="axissin053" dejarHueco="false">
                            <td class="titulocaja">
                                <b id="label_SPERSON"><axis:alt f="axissin053" c="SPERSON" lit="9901375"/></b><!-- SPERSON - Persona relacionada -->
                            </td>  
                        </axis:ocultar>
                        <axis:ocultar c="FINIEFE" f="axissin053" dejarHueco="false">
                            <td class="titulocaja">
                                <b id="label_FINIEFE"><axis:alt f="axissin053" c="FINIEFE" lit="9000526"/></b><!-- Fecha Inicio  -->
                            </td>
                        </axis:ocultar>
                        <axis:ocultar c="FFINEFE" f="axissin053" dejarHueco="false">
                            <td class="titulocaja">
                                <b id="label_FFINEFE"><axis:alt f="axissin053" c="FFINEFE" lit="9000527"/></b><!--  Fecha fin -->
                            </td>   
                        </axis:ocultar>
                    </tr>
                    
                    <tr>
                        <axis:ocultar c="NTIPDEF" f="axissin053" dejarHueco="false">
                            <td class="campocaja">
                                <select name="NTIPDEF" id="CTIPPAGnoEdit" size="1" onchange="javascript:f_buscar_personas();" title="<axis:alt f="axissin053" c="NTIPDEF_TIT" lit="9901939"/>" class="campowidthselect campo campotexto" style="width:90%;"
                                    <axis:atr f="axissin053" c="CTIPPAG" a="modificable=true&isInputText=false&obligatorio=true"/> >
                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin053" c="CTIPPAGnoEdit" lit="1000348"/> - </option>
                                    <c:forEach var="tipodest" items="${__formdata.listvalores.lista_roles}">
                                        <option value = "${tipodest.CATRIBU}" 
                                        <c:if test="${tipodest.CATRIBU== __formdata.CTIPPAG}"> selected </c:if> />
                                            ${tipodest.TATRIBU}
                                        </option>
                                    </c:forEach>
                                </select>       
                            </td>
                        </axis:ocultar>
                        <axis:ocultar c="SPERSON" f="axissin053" dejarHueco="false">
                            <td class="campocaja">
                                <select name="SPERSON" id="SPERSON" size="1" class="campowidthselect campo campotexto" title="<axis:alt f="axissin053" c="SPERSON_TIT" lit="9901375"/>" style="width:90%;"
                                    <axis:atr f="axissin053" c="SPERSON" a="modificable=true&isInputText=false&obligatorio=true"/> >
                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin053" c="SPERSON" lit="1000348"/> - </option>
                                    <c:forEach var="tipodest" items="${__formdata.listvalores.lista}">
                                        <option value = "${tipodest.CATRIBU}" 
                                        <c:if test="${tipodest.CATRIBU== __formdata.CTIPPAG}"> selected </c:if> />
                                            ${tipodest.TATRIBU}
                                        </option>
                                    </c:forEach>
                                </select>     
                            </td>   
                        </axis:ocultar>
                        <axis:ocultar c="FINIEFE" f="axissin053" dejarHueco="false">
                            <td class="campocaja">
                                <input   type="text"  class="campowidthinput campo" id="FINIEFE"  style="width:65%" name="FINIEFE"   
                                <axis:atr f="axissin053" c="FINIEFE" a="modificable=true&formato=fecha"/> value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINIEFE}"/>"/>                                    
                                <a style="vertical-align:middle;"><img id="popup_calendario_FINIEFE" alt="<axis:alt f="axissin053" c="popup_calendario_FINIEFE" lit="102913"/>" title="<axis:alt f="axissin053" c="popup_calendario_FINIEFE" lit="102913" />" src="images/calendar.gif"/></a>
                            </td>
                        </axis:ocultar>
                        <axis:ocultar c="FFINEFE" f="axissin053" dejarHueco="false">
                            <td class="campocaja" align="left">
                                <input   type="text"  class="campowidthinput campo" id="FFINEFE"  style="width:65%" name="FFINEFE"   
                                <axis:atr f="axissin053" c="FFINEFE" a="modificable=true&formato=fecha"/> value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFINEFE}"/>"/>                                    
                                <a style="vertical-align:middle;"><img id="popup_calendario_FFINEFE" alt="<axis:alt f="axissin053" c="popup_calendario_FFINEFE" lit="102913"/>" title="<axis:alt f="axissin053" c="popup_calendario_FFINEFE" lit="102913" />" src="images/calendar.gif"/></a>
                            </td>                        
                        </axis:ocultar>
                    </tr>
                    
                   
                    
                    
                </table>
            </td>
        </tr>
    </table>
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin053</c:param><c:param name="f">axissin053</c:param><c:param name="f">axissin053</c:param><c:param name="__botones">cancelar,aceptar</c:param></c:import>
    </form>
    <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FINIEFE",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FINIEFE", 
                singleClick    :    true,
                firstDay       :    1
            });
            
            Calendar.setup({
                inputField     :    "FFINEFE",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FFINEFE", 
                singleClick    :    true,
                firstDay       :    1
            });
</script>    
  <c:import url="../include/mensajes.jsp" />
</body>
</html>