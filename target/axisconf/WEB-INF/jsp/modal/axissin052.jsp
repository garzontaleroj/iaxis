<%--
/**
*  Fichero: axissin052.jsp
*  
*  T?tulo: Detalle fraude
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
    <title><axis:alt f="axissin052" c="title" lit="109479"/>/<axis:alt f="axissin052" c="title" lit="9000897"/></title>
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
        var valor = "<%=request.getAttribute("OK")%>"; 
        var sidepagout = "<%=request.getAttribute("PSIDEPAGOUT")%>";
        var isnew = "<%=request.getAttribute("isNew")%>";
        var seccion = "${__formdata.SECCION}";
        var NSINIES = "${__formdata.NSINIES}";
        if (valor=="OK"){
            parent.f_aceptar_axissin052(NSINIES,"tramitaciones",seccion,valor,sidepagout,isnew); //TODO: Dato EJ. para volver a la pantalla
            //this.f_but_cancelar();
        }
        
        //Cargamos el combo
        //f_recarga_cconpag(); //Se realizará desde el service, cada vez que se recargue la pantalla
        
        f_cargar_propiedades_pantalla();
        
   }
        
        function f_but_aceptar(){
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario ("modal_axissin052.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
        
        function f_but_salir(){
        var valor = "<%=request.getAttribute("OK")%>"; 
        var sidepagout = "<%=request.getAttribute("PSIDEPAGOUT")%>"; 
            var NSINIES = "${__formdata.NSINIES}";
            parent.f_aceptar_axissin052(NSINIES,"tramitaciones","pagos", valor,sidepagout);            	
        }


//AXISPER014, ALTA CCC
        function f_abrir_axisper014(CNORDBAN,selectedPerson) {
            objUtiles.abrirModal("axisper014", "src", "modal_axisper014.do?operation=form&SPERSON="+selectedPerson+"&CNORDBAN=" + CNORDBAN+"&CAGENTE="+document.miForm.CAGENTE.value);            
        }  
        function f_aceptar_axisper014(selectedPerson){
            f_cerrar_axisper014();
            objUtiles.ejecutarFormulario ("modal_axissin052.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
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
                
                
            objUtiles.ejecutarFormulario ("modal_axissin052.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);    
        }     

        function f_abrir_modal(cual, noXButton, optionalQueryString) {

            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
  function f_aceptar_axissin011(NSINIES,SPROFES) {
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
            objAjax.invokeAsyncCGI("modal_axissin052.do", callbackAjaxActualizarCombos, "operation=ajax_recargar_cconpag", this);
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
            objDom.addOpcionACombo("", " - " + "<axis:alt f='axissin052' c='alerta_mensaje' lit='1000348'/>" + " - ", combo, null);
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



    /* ****************************** AXISSIN053 - alta defraudador ************************************* */
    function f_alta_defraudador(){
        var NSINIES = "${__formdata.NSINIES}";
        f_abrir_axissin053(NSINIES);
    }
    
    function f_abrir_axissin053(NSINIES) {
        var SSEGURO = document.miForm.SSEGURO.value;
        //alert("SSEGURO:"+SSEGURO);
        objUtiles.abrirModal("axissin053","src","modal_axissin053.do?operation=form&NSINIES="+NSINIES+"&SSEGURO="+SSEGURO);               
    }
        
    function f_cerrar_axissin053(){
        objUtiles.cerrarModal("axissin053");
    }
    
    function f_aceptar_axissin053(){
        f_cerrar_axissin053();
        objUtiles.ejecutarFormulario ("modal_axissin052.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);    
    }

    function f_eliminar_fraude(NFRAUD){
        objUtiles.ejecutarFormulario ("modal_axissin052.do?NDEFRAU="+NFRAUD, "borrar_defraudador", document.miForm, "_self", objJsMessages.jslit_cargando);    
    }



        
    </script>
</head>
<body onload="javascript:f_onload()">
        <!-- AXISSIN011 ALTA/MODIF. DESTINATARIOS -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin011|<axis:alt f="axissin052" c="titulo_axissin011" lit="9000896"/></c:param>
        </c:import>
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
        <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axissin052" c="titulo_axisper012" lit="1000235" /></c:param>
        <c:param name="nid" value="axisper012" />
        </c:import>      
        <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axissin052" c="titulo_axisper014" lit="1000235" /></c:param>
        <c:param name="nid" value="axisper014" />
        </c:import>  
    <form name="miForm" action="modal_axissin052.do" method="POST">

    <input type="hidden" name="operation" value="guardar" />
    <input type="hidden" name="NSINIES" value="${__formdata.NSINIES}"/>
    <input type="hidden" name="NTRAMIT" value="${__formdata.NTRAMIT}"/>
    <input type="hidden" name="SIDEPAG" value="${__formdata.SIDEPAG}"/>
    <input type="hidden" name="indexTramitacio" value="${__formdata.indexTramitacio}"/>
    <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}"/>
    <input type="hidden" name="SPERSON" value="${__formdata.SPERSON}"/>
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
        <c:param name="titulo"><axis:alt f="axissin052" c="titulo" lit="9903634"/></c:param>
        <c:param name="formulario"><axis:alt f="axissin052" c="formulario" lit="9903634"/></c:param>
        <c:param name="form">axissin052</c:param>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axissin053" c="titulo_axissin053" lit="9903632" /></c:param>
                <c:param name="nid" value="axissin053"></c:param>
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
                        <td colspan="4">
                        <!-- ******************************************************************************************************************************* --> 
                        <!-- ************************************************************ LISTA ************************************************************ --> 
                        <!-- ******************************************************************************************************************************* --> 
                                   <table>
                                                    <tr>
                                                        <td align="right" > 
                                                        <c:if test="${__formdata.MODOFRAU!='CONSULTA'}">
                                                            <a href="javascript:f_alta_defraudador();" ><img border="0" alt="<axis:alt f="axissin052" c="ALTA_DEFRAU" lit="9903632"/>" title="<axis:alt f="axissin052" c="ALTA_DEFRAU" lit="9903632"/>" src="images/new.gif"></a>
                                                        </c:if>
                                                            <table class="area" align="center" tabindex="38">
                                                                <th style="width:100%;height:0px"></th>
                                                                <tr>
                                                                    <td align="left" class="campocaja">
                                                                        <c:set var="title1"><axis:alt f="axissin052" c="NUMDEF" lit="800440"/></c:set> <!-- Numero defraudador -->
                                                                        <c:set var="title2"><b id="label_SPERSON"><axis:alt f="axissin052" c="SPERSON" lit="9901375"/></b></c:set> <!-- Descripción persona -->
                                                                        <c:set var="title3"><axis:alt f="axissin052" c="FINIEFE" lit="1000556"/></c:set><!-- Fecha inicio fecto -->
                                                                        <c:set var="title6"><axis:alt f="axissin052" c="FFINEFE" lit="1000557"/></c:set><!-- Fecha fin Efecto -->
                                                                        <c:set var="title4"><axis:alt f="axissin052" c="MODIFICAR" lit="9000552"/></c:set><!-- Modificar -->
                                                                        <c:set var="title5"><axis:alt f="axissin052" c="ELIMINAR" lit="1000127"/></c:set><!-- Eliminar -->
                                                                        <c:set var="title7"><axis:alt f="axissin052" c="ROL" lit="9903635"/></c:set> <!-- Rol defraudador -->
                                                                        <c:set var="title8"><axis:alt f="axissin052" c="FALTA" lit="9001192"/></c:set> <!-- Rol defraudador -->
                                                                        <c:set var="title9"><axis:alt f="axissin052" c="USUALTA" lit="9001630"/></c:set> <!-- Rol defraudador -->
                                                                        <div class="displayspace" style="border: solid 0;width:100%" >                         
                                                                            <display:table name="${__formdata.listvalores.lst_fraudes}" id="miListaRef" export="false"  class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" style="width:98.5%;border:1px" 
                                                                             requestURI="axis_axissin052.do?paginar=true">
                                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                                <axis:visible f="axissin052" c="NUMDEF">
                                                                                <display:column title="${title1}" sortable="false" sortProperty="NDEFRAU" headerClass="headwidth5 sortable fixed"  media="html" autolink="false"  >
                                                                                    <a srefext="${miListaRef.OB_IAX_DEFRAUDADORES.NDEFRAU}" ></a><div class="dspNumber">${miListaRef.OB_IAX_DEFRAUDADORES.NDEFRAU}</div>
                                                                                </display:column>
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin052" c="TTIPROL">
                                                                                <display:column title="${title7}" sortable="false" sortProperty="NDEFRAU" headerClass="sortable fixed"  media="html" autolink="false"  >
                                                                                    <a srefext="${miListaRef.OB_IAX_DEFRAUDADORES.TTIPROL}" ></a><div class="dspNumber">${miListaRef.OB_IAX_DEFRAUDADORES.TTIPROL}</div>
                                                                                </display:column>
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin052" c="CODIGO">
                                                                                <display:column title="${title2}" sortable="false" sortProperty="OB_IAX_SINIESTRO_REFERENCIAS.TREFEXT" headerClass="headwidth20 sortable fixed"  media="html" autolink="false" >
                                                                                    <div class="dspNumber">${miListaRef.OB_IAX_DEFRAUDADORES.TPERSON}</div>
                                                                                </display:column>
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin052" c="FINI">
                                                                                    <display:column title="${title3}" sortable="false" sortProperty="OB_IAX_SINIESTRO_REFERENCIAS.FREFINI" headerClass="headwidth20 sortable fixed"  media="html" autolink="false">
                                                                                        <div class="dspNumber"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaRef.OB_IAX_DEFRAUDADORES.FINIEFE}"/></div>
                                                                                    </display:column>  
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin052" c="FFIN">
                                                                                    <display:column title="${title6}" sortable="false" sortProperty="OB_IAX_SINIESTRO_REFERENCIAS.FREFFIN" headerClass="headwidth20 sortable fixed"  media="html" autolink="false">
                                                                                        <div class="dspNumber"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaRef.OB_IAX_DEFRAUDADORES.FFINEFE}"/></div>
                                                                                    </display:column>  
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin052" c="FALTA">
                                                                                    <display:column title="${title8}" sortable="false" sortProperty="OB_IAX_SINIESTRO_REFERENCIAS.FALTA" headerClass="headwidth20 sortable fixed"  media="html" autolink="false">
                                                                                        <div class="dspNumber"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaRef.OB_IAX_DEFRAUDADORES.FALTA}"/></div>
                                                                                    </display:column>  
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin052" c="CUSUALT">
                                                                                <display:column title="${title9}" sortable="false" sortProperty="CUSUALT" headerClass="sortable fixed"  media="html" autolink="false"  >
                                                                                    <a srefext="${miListaRef.OB_IAX_DEFRAUDADORES.CUSUALT}" ></a><div class="dspNumber">${miListaRef.OB_IAX_DEFRAUDADORES.CUSUALT}</div>
                                                                                </display:column>
                                                                                </axis:visible>
                                                                                <%--axis:visible f="axissin052" c="MODIFICAR">
                                                                                    <display:column title="${title4}" sortable="false" sortProperty="ICAPITAL" headerClass="headwidth5 sortable fixed"  media="html" autolink="false">
                                                                                        <div class="dspIcons">
                                                                                            <a href="javascript:f_modificar_ref('${miListaRef.OB_IAX_SINIESTRO_REFERENCIAS.CTIPREF}','${miListaRef.OB_IAX_SINIESTRO_REFERENCIAS.TREFEXT}','<fmt:formatDate pattern="dd/MM/yyyy" value="${miListaRef.OB_IAX_SINIESTRO_REFERENCIAS.FREFINI}"/>','<fmt:formatDate pattern="dd/MM/yyyy" value="${miListaRef.OB_IAX_SINIESTRO_REFERENCIAS.FREFFIN}"/>','${miListaRef.OB_IAX_SINIESTRO_REFERENCIAS.SREFEXT}');"><img border="0" alt="<axis:alt f="axissin052" c="EDITAR" lit="100002"/>" title="<axis:alt f="axissin052" c="EDITAR" lit="100002"/>" src="images/lapiz.gif">
                                                                                            </a>
                                                                                        </div>
                                                                                    </display:column>  
                                                                                </axis:visible--%>
                                                                                <c:if test="${__formdata.MODOFRAU!='CONSULTA'}">
                                                                                <axis:visible f="axissin052" c="ELIMINAR">
                                                                                    <display:column title="${title5}" sortable="false" sortProperty="ICAPITAL" headerClass="headwidth5 sortable fixed"  media="html" autolink="false">
                                                                                        <div class="dspIcons"><a href="javascript:f_eliminar_fraude('${miListaRef.OB_IAX_DEFRAUDADORES.NDEFRAU}');"><img border="0" alt="<axis:alt f="axissin052" c="EDITAR" lit="100002"/>" title="<axis:alt f="axissin052" c="EDITAR" lit="100002"/>" src="images/delete.gif"></a></div>
                                                                                    </display:column>  
                                                                                </axis:visible>
                                                                                </c:if>
                                                                            </display:table>
                                                                        </div>
                                                                   </td>
                                                                 </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                        
                        <!-- ******************************************************************************************************************************* --> 
                        <!-- ************************************************************ F i n ************************************************************ --> 
                        <!-- ******************************************************************************************************************************* --> 
                        </td>
                    </tr>
                    
                    
                </table>
            </td>
        </tr>
    </table>
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin052</c:param><c:param name="f">axissin052</c:param><c:param name="f">axissin052</c:param><c:param name="__botones">salir</c:param></c:import>
    </form>
    <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FORDPAG",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FORDPAG", 
                singleClick    :    true,
                firstDay       :    1
            });
            
            Calendar.setup({
                inputField     :    "FFACREF",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FFACREF", 
                singleClick    :    true,
                firstDay       :    1
            });
</script>    
  <c:import url="../include/mensajes.jsp" />
</body>
</html>