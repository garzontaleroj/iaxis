<%/* Revision:# QW+zqxgO0cMKZM7QB5Qwog== # */%>
<%-- /** * Fichero: axissin026.jsp * @author <a href =
     "mailto:etalavera@csi-ti.com">Esther Talavera</a> * * T?tulo: Modal datos
     documentacion: Documentacion * * Fecha: 15/07/2009 */--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15"%>
<c:set var="linea_trami" value="${__formdata.indexTramitacio}"/>
<!-- ${LINEATRAM} -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title>
            <axis:alt f="axissin026" c="TIT_AXISSIN026" lit="100431"/>
        </title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css"></link>
        <c:import url="../include/carga_framework_js.jsp"/>
        
        <!--********** CALENDARIO ************************** -->
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
        var val1 = "<%=request.getAttribute("OK")%>"; 
         var NSINIES = "${__formdata.NSINIES}"; 
        objDom.setValorPorId("NSINIES_O",NSINIES);      
         
        <c:if test="${__formdata.COBLIGA=='0'}" >
            document.miForm.COBLIGA.value=0;
        </c:if>
        <c:if test="${__formdata.COBLIGA=='1'}">
            document.miForm.COBLIGA.value=1;
        </c:if>
        var ISEXTERNO = "${__formdata.ISEXTERNO}"; 
        if (ISEXTERNO=="SI"){
            objDom.setValorPorId('TTIPTRA', 'PRUEBA');
        
        }
            if (val1=="OK"){
        
                    if ( !objUtiles.estaVacio(document.miForm.CGEDOX) && document.miForm.CGEDOX.value == 1){
                           f_anadir_documentacion();
                    }else{
                            parent.f_aceptar_axissin026(NSINIES); //TODO: Dato SINIESTRO EJEMPLAR EJ. para volver a la pantalla
                            this.f_but_cancelar();
                    }
            }
        }
        
        function f_habilitar_campos(){
            var checkboxs = document.getElementsByTagName("input");//mirem els checkbox
            var selects = document.getElementsByTagName("select");
            for(var i=0;i<selects.length;i++){
                if(selects[i].attributes.length>0) {
                   var selectId = selects[i].getAttribute("id");
                     try{
                         if (document.getElementById(selectId).style.visibility != 'hidden' ){
                             if(selects[i].getAttribute("type") != "button"  &&
                                objDom.estaDisabled(selectId))
                                    objDom.setDisabledPorId(selectId,false);
                         }
                     }catch(e){}
                }
            }
             for(var i=0;i<checkboxs.length;i++){
                if(checkboxs[i].attributes.length>0) {
                   var checkboxsId = checkboxs[i].getAttribute("id");
                    if(document.getElementsByTagName("input")[i].type == "checkbox"){
                    
                     try{
                         if (document.getElementById(checkboxsId).style.visibility != 'hidden' ){
                             if(checkboxs[i].getAttribute("type") != "button"  &&
                                objDom.estaDisabled(checkboxsId))
                                    objDom.setDisabledPorId(checkboxsId,false);
                         }
                     }catch(e){}
                     }
                }
            }
        }
        
        function f_but_aceptar(){
            //alert(document.miForm.COBLIGA.checked);
            if(document.miForm.COBLIGA.checked){
                //alert("Esta checked");
                document.miForm.COBLIGAV.value=1;
            }else{
                //alert("Esta NO checked");
                document.miForm.COBLIGAV.value=0;
            }            
            //if(document.miForm.CGEDOX.checked){
            if(!objUtiles.estaVacio(document.miForm.CGEDOX)){
                //alert("Esta NO checked");
                 document.miForm.CGEDOX.value=0;
                 if(document.miForm.CGEDOX.checked){
                    document.miForm.CGEDOX.value=1;
                 }                    
            }            
            if(!objUtiles.estaVacio(document.miForm.CINFORM)){
            	 document.miForm.CINFORM.value=0;
            	 if(document.miForm.CINFORM.checked){        
                     document.miForm.CINFORM.value=1;
                 }
            	}
            
            
            
             if (objValidador.validaEntrada()) {  
                 f_habilitar_campos();
                 objUtiles.ejecutarFormulario ("modal_axissin026.do", "guardar", document.miForm, "_self"); 
             }
              
        }
        
        function f_but_cancelar(){
            parent.f_cerrar_modal("axissin026");
        }
         
         /* ************************************************************************************************* */
         /* ******************************************* GEDOX *********************************************** */
         /* ************************************************************************************************* */
            function f_but_gedox(NMOVIMI) {
            	 f_anadir_documentacion();
             /*   objUtiles.abrirModal("axisgedox", "src", 
                    "modal_axisgedox.do?dt=<%=new java.util.Date().getTime()%>&operation=form&SEGURO="+document.miForm.SSEGURO.value + "&NMOVIMI=" + NMOVIMI);*/
            }   
            function f_cerrar_axisgedox() {
                objUtiles.cerrarModal("axisgedox");
            }
        
        /* ************************************************************************************************* */
        /* *************************************** ACCIONES PANTALLA *************************************** */
        /* ************************************************************************************************* */
        
        function f_carga_valores_titulo_descripcion(){
                    //alert("Antes de cargar garantias");
                    var qs="operation=ajax_titulo";
                    qs=qs+"&CDOCUME="+document.miForm.CDOCUME.value;
                                        
                    objAjax.invokeAsyncCGI("modal_axissin026.do", callbackajaxTitulo, qs, this);
        }
        
        
        function callbackajaxTitulo(ajaxResponseText){
            try{ 
                //alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                 //alert("dos");
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
              //alert("tres");
                    //if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                       
                            var TDOCUME = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("PTTITDOC")[0])) ? doc.getElementsByTagName("PTTITDOC")[0].childNodes[0].nodeValue : "");
                            var DESCRIPCION = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("PTDOCUME")[0])) ? doc.getElementsByTagName("PTDOCUME")[0].childNodes[0].nodeValue : "");
                            
                            //alert(TDOCUME);
                            //alert(DESCRIPCION);
                            document.miForm.TITULO.value=TDOCUME;          
                            //document.miForm.DESCRIPCION.value=DESCRIPCION;          
                

                }
                

            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
        }
       function f_anadir_documentacion() { // Añadir documentación
           var params = "&SSEGURO="+document.miForm.SSEGURO.value;
           params = params +"&NMOVIMI=${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.NMOVTRA}";
           params = params +"&NSINIES=${__formdata.NSINIES}";
           params = params +"&NTRAMIT=${__formdata.NTRAMIT}";
           params = params +"&indexTramitacio=${__formdata.indexTramitacio}";
           params = params +"&NDOCUME=${__formdata.NDOCUME}";
           params = params +"&ORIGEN=SINIESTROS";
           
           f_abrir_modal("axisfileupload", true, params);
        }
        
        function f_onclickCheckbox(thiss) {
                thiss.value =  ((thiss.checked)?1:0);
                objDom.setValorPorId(thiss.id, thiss.value);
    }
        
          function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
         function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
            if (cual == "axisfileupload")
               objUtiles.ejecutarFormulario ("modal_axissin026.do?isNew=no&SSEGURO=${__formdata.SSEGURO}&NMOVIMI=${__formdata.NMOVIMI}", "form", document.miForm, "_self", objJsMessages.jslit_cargando);                                     
        }
        
        function f_aceptar_axisfileupload(){
             var NSINIES = "${__formdata.NSINIES}";  
             parent.f_aceptar_axissin026(NSINIES); //TODO: Dato SINIESTRO EJEMPLAR EJ. para volver a la pantalla
             this.f_but_cancelar();
        }
        
    </script>
    </head>
    <body onload="javascript:f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisfileupload|<axis:alt f="axissin026" c="TIT_AXISFILEUPLOAD" lit="1000614"/></c:param>
    </c:import>
        
        
        <form name="miForm" action="modal_axissin026.do"
                         method="POST">
            <input type="hidden" name="operation" value="guardar"/>
            <input type="hidden" name="ISEXTERNO" value="${__formdata.ISEXTERNO}"/>
            <input type="hidden" name="subpantalla" value="tramitaciones"/>
            <input type="hidden" name="seccion" value="danyos"/>
            <input type="hidden" name="NSINIES" value="${__formdata.NSINIES}"/>
            <input type="hidden" name="NTRAMIT"
                   value="${__formdata.NTRAMIT}"/>
            <input type="hidden" name="NDANO" value="${__formdata.NDANO}"/>
            <input type="hidden" name="indexTramitacio"
                   value="${__formdata.indexTramitacio}"/>
            <input type="hidden" name="SSEGURO" value="${__formdata.SSEGURO}"/>
            <input type="hidden" name="subpantalla" value="${subpantalla}"/>
            <input type="hidden" name="seccion" value="${seccion}"/>
            <input type="hidden" name="COBLIGAV" value=""/>
            <input type="hidden" name="CMODO" id="CMODO" value="${__formdata.CMODO}" />
             
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo">
                    <axis:alt f="axissin026" c="TIT_AXISSIN026" lit="9001518"/>
                </c:param>
                <c:param name="formulario">
                    <axis:alt f="axissin026" c="FORM_AXISSIN026" lit="1000431"/>
                </c:param>
                <c:param name="form">axissin026</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisgedox|<axis:alt f="axissin026" c="TIT_AXISGEDOX" lit="1000201"/></c:param>
            </c:import>
            <div class="separador">&nbsp;</div>
            <table id="tabla1" class="mainModalDimensions base" align="center"
                   cellpadding="0" cellspacing="0">
                <axis:visible f="axissin026" c="CABECERA">  
                <tr>
                    <td>
                        <table class="seccion">
                            <tr>
                                <th style="width:25%;height:0px">
                                    &nbsp;
                                </th>
                                <th style="width:25%;height:0px">
                                    &nbsp;
                                </th>
                                <th style="width:25%;height:0px">
                                    &nbsp;
                                </th>
                                <th style="width:25%;height:0px">
                                    &nbsp;
                                </th>
                                
                            </tr>
                            <tr>
                            <axis:visible f="axissin026" c="NSINIES">  
                             <td class="titulocaja">
                                <b><axis:alt f="axissin026" c="NSINIES" lit="101298"/></b><!-- Tipus tramitacio -->                               
                                </td>
                                </axis:visible>
                                <axis:visible f="axissin026" c="TTIPTRA">  
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin026" c="TTIPTRA" lit="9001028"/></b>
                                    <!-- Tipus tramitacio -->
                                </td>
                                </axis:visible>
                                <axis:visible f="axissin026" c="TTRAMIT">  
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin026" c="TTRAMIT" lit="100588"/></b>
                                    <!-- Tipus dany  -->
                                </td>
                                </axis:visible>
                                <axis:visible f="axissin026" c="TTCAUSIN">  
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin026" c="TTCAUSIN" lit="9000901"/></b>
                                    <!-- Tipus dany  -->
                                </td>
                                </axis:visible>
                                <axis:visible f="axissin026" c="CINFORM">  
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin026" c="CINFORM" lit="9000905"/></b>
                                    <!-- Tramitación informativa -->
                                </td>
                                 </axis:visible>
                            </tr>
                            <tr>
                             <td class="campocaja">
                             <axis:visible f="axissin026" c="NSINIES">
                                 <input type="text" name="NSINIES_O" id="NSINIES_O"  class="campodisabled campo campotexto" style="width:90%"
                                    <axis:atr f="axissin026" c="NSINIES" a="modificable=false"/> />
                             </axis:visible>
                                </td>
                                <axis:visible f="axissin026" c="TTIPTRA">  
                                <td class="campocaja">
                                    <!--${sessionScope.tramitaciones_min[linea_trami]} - ${linea_trami}-->
                                    <input type="text" name="TTIPTRA"
                                    
                                    
                                           <c:choose> <c:when test="${__formdata.ISEXTERNO=='SI'}"> value ="${__formdata.TTIPTRA_EXT}" </c:when> <c:otherwise> value="${sessionScope.tramitaciones_min[linea_trami].TTIPTRA}"</c:otherwise> </c:choose>
                                           class="campodisabled campo campotexto"
                                           style="width:90%"
                                           <axis:atr f="axissin026" c="TTIPTRA" a="modificable=false"/>/>
                                </axis:visible>
                                </td>
                                <td class="campocaja">
                                 <axis:visible f="axissin026" c="TTRAMIT">  
                                    <input type="text" name="TTRAMIT"
                                           <c:choose> <c:when test="${__formdata.ISEXTERNO=='SI'}"> value ="${__formdata.TTRAMIT_EXT}" </c:when> <c:otherwise> value="${sessionScope.tramitaciones_min[linea_trami].TTRAMIT}"</c:otherwise> </c:choose>
                                           class="campodisabled campo campotexto"
                                           style="width:90%"
                                           <axis:atr f="axissin026" c="TTRAMIT" a="modificable=false"/>/>
                                 </axis:visible>
                                </td>
                                <td class="campocaja">
                                 <axis:visible f="axissin026" c="TTCAUSIN">  
                                    <input type="text" name="TTCAUSIN"
                                           value="${sessionScope.tramitaciones_min[linea_trami].TTCAUSIN}"
                                           class="campodisabled campo campotexto"
                                           style="width:90%"
                                           <axis:atr f="axissin026" c="TTCAUSIN" a="modificable=false"/>/>
                                  </axis:visible>
                                </td>
                                <td class="campocaja" align="left">
                                    <axis:visible f="axissin026" c="CINFORM">  
                                    <input type="checkbox"
                                           id="CINFORM" name="CINFORM"
                                           <axis:atr f="axissin026" c="CINFORM" a="modificable=false&isInputText=false"/>
                                           value="${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.CINFORM}"
                                           <c:if test="${sessionScope.tramitaciones_min[linea_trami].CINFORM == '1'}">checked</c:if>></input>
                                    </axis:visible>
                                </td>
                            </tr>
                            <tr>
                             <axis:visible f="axissin026" c="TESTTRA">  
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin026" c="TESTTRA" lit="100587"/></b>
                                    <!-- Estado -->
                                </td>
                                 </axis:visible>
                                 <axis:visible f="axissin026" c="TSUBTRA">  
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin026" c="TSUBTRA" lit="9000852"/></b>
                                    <!--Subestado -->
                                </td>
                                 </axis:visible>
                                 <axis:visible f="axissin026" c="TUNITRA">  
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin026" c="TUNITRA" lit="9000900"/></b>
                                    <!-- Unidad tramitacion -->
                                </td>
                                 </axis:visible>
                                 <axis:visible f="axissin026" c="TTRAMITAD">  
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin026" c="TTRAMITAD" lit="140769"/></b>
                                    <!-- Tramitador -->
                                </td>
                                 </axis:visible>
                                 
                                <td class="titulocaja">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="campocaja">
                                    <input type="text" name="TESTTRA"
                                          <c:choose> <c:when test="${__formdata.ISEXTERNO=='SI'}"> value ="${__formdata.TESTTRA_EXT}" </c:when> <c:otherwise> value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TESTTRA}"</c:otherwise> </c:choose>
                                           class="campodisabled campo campotexto"
                                           style="width:90%"
                                           <axis:atr f="axissin026" c="TESTTRA" a="modificable=false"/>/>
                                </td>
                                <td class="campocaja">
                                    <input type="text" name="TSUBTRA"
                                    <c:choose> <c:when test="${__formdata.ISEXTERNO=='SI'}"> value ="${__formdata.TSUBTRA_EXT}" </c:when> <c:otherwise> value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TSUBTRA}"</c:otherwise> </c:choose>
                                           class="campodisabled campo campotexto"
                                           style="width:90%"
                                           <axis:atr f="axissin026" c="TSUBTRA" a="modificable=false"/>/>
                                </td>
                                <td class="campocaja">
                                    <input type="text" name="TUNITRA"
                                    <c:choose> <c:when test="${__formdata.ISEXTERNO=='SI'}"> value ="${__formdata.TUNITRA_EXT}" </c:when> <c:otherwise> value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TUNITRA}"</c:otherwise> </c:choose>
                                           
                                           class="campodisabled campo campotexto"
                                           style="width:90%"
                                           <axis:atr f="axissin026" c="TUNITRA" a="modificable=false"/>/>
                                </td>
                                <td class="campocaja">
                                    <input type="text" name="TTRAMITAD"
                                    <c:choose> <c:when test="${__formdata.ISEXTERNO=='SI'}"> value ="${__formdata.TTRAMITAD_EXT}" </c:when> <c:otherwise> value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TTRAMITAD}" </c:otherwise> </c:choose>
                                           class="campodisabled campo campotexto"
                                           style="width:90%"
                                           <axis:atr f="axissin026" c="TTRAMITAD" a="modificable=false"/>/>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                </axis:visible>
                    <tr>
                        <td>
                            <table class="seccion">
                                <!--falta la llamada a el pac para recuperar los datos de los campos de la segunda tabla y que el boton llame a la pantalla modal nueva de impresion de doc gedox-->
                                <tr>
                                    <th style="width:15%;height:0px">
                                        &nbsp;
                                    </th>
                                    <th style="width:15%;height:0px">
                                        &nbsp;
                                    </th>
                                    <th style="width:15%;height:0px">
                                        &nbsp;
                                    </th>
                                    <th style="width:15%;height:0px">
                                        &nbsp;
                                    </th>
                                    <th style="width:15%;height:0px">
                                        &nbsp;
                                    </th>
                                    <th style="width:15%;height:0px">
                                        &nbsp;
                                    </th>
                                </tr>
                                <!-- Descripción del siniestro -->
                                <!-- CABECERA --fin>
                      <!-- CUERPO-->
                                <div class="separador">&nbsp;</div>
                                <tr>
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axissin026" c="TIT_DOCUMENT" lit="105330"/></b>
                                        <!-- Documento -->
                                    </td>
                                     <axis:visible f="axissin026"
                                                  c="BT_DOCUMENTO">
                                    <c:if test="${empty __formdata.IDDOC}"> 
                                    <axis:visible f="axissin026" c="CGEDOX">
                                    <td class="titulocaja" id="td_CGEDOX"> 
                                                                            
                                            <b><axis:alt f="axissin026" c="CGEDOX" lit="9001357"/></b>                                        
                                            <!--Documento Gedox -->
                                            <input type="checkbox" 
                                                   id="CGEDOX" name="CGEDOX" onchange="javascript:f_onclickCheckbox(this);"
                                                   <axis:atr f="axissin026" c="CGEDOX" a="isInputText=false"/>
                                                   value="${__formdata.CGEDOX}"
                                                   <c:if test="${__formdata.CGEDOX == '1'}">checked</c:if>></input>                                                  
                                    </td> 
                                    </axis:visible> 
                                    </c:if>
                                    <c:if test="${!empty __formdata.IDDOC}"> 
                                         <td class="titulocaja">  <b><axis:alt f="axissin026" c="DOC_GEDOX" lit="9001357"/></b></td>
                                    </c:if>
                                    </axis:visible>
                                </tr>
                                <tr>
                                    <!--CAJA DOCUMENTO -->
                                    <td class="campocaja" colspan="2">
                                        <!--input type="text" name="CDOCUME"
                                               value="${__formdata.CDOCUME}"
                                               class="campodisabled campo campotexto"
                                               style="width:90%"
                                               <axis:atr f="axissin026" c="CDOCUME" a="modificable=true"/>/-->
                                        <axis:visible c="CDOCUME" f="axissin026">
                                        <select name="CDOCUME" id="CDOCUME" size="1" onchange="javascript:f_carga_valores_titulo_descripcion();" title="<axis:alt f="axissin026" c="TIT_DOCUMENT" lit="105330"/>" <axis:atr f="axissin026" c="CDOCUME" a="modificable=true&isInputText=false&obligatorio=true"/> class="campowidthselect campo campotexto" <c:if test="${__formdata.MOD_TRAM=='MOD'||__formdata.MOD_TRAM=='CONS'}">disabled</c:if> style="width:90%;">
                                            <option value = "null"> - <axis:alt f="axissin026" c="SNV_COMBO" lit="1000348"/> - </option>
                                            <c:forEach var="docu" items="${listValores.lst_docume}">
                                                <option value = "${docu.CDOCUME}" 
                                                <c:if test="${ docu.CDOCUME == __formdata.CDOCUME  }"> selected </c:if> />
                                                    ${docu.TTITDOC} 
                                                </option>
                                            </c:forEach>
                                        </select>
                                        </axis:visible>
                                        
                                               
                                        <input type="hidden" name="NDOCUME"
                                               value="${__formdata.NDOCUME}"
                                               class="campodisabled campo campotexto"
                                               style="width:90%"/>
                                        <input type="hidden" name="TITULO"
                                               value="${__formdata.TITULO}"
                                               class="campodisabled campo campotexto"
                                               style="width:90%"
                                               <axis:atr f="axissin026" c="TITULO" a="modificable=false"/>/>
                                    </td>
       
                                    <!--CAJA TITULO -->
                             
                                     <axis:visible f="axissin026"
                                                  c="BT_DOCUMENTO"> 
                                      <c:if test="${!empty __formdata.IDDOC}">  
                                   			<!--CAJA docum gedox -->
				                                <td class="campocaja">
				                                    <input type="text" name="IDDOC"
				                                           value="${__formdata.IDDOC}"
				                                           class="campodisabled campo campotexto"
				                                           style="width:90%"
				                                           <axis:atr f="axissin026" c="IDDOC" a="modificable=true"/>/><!-- TDOCUMGEN -->
				                                </td>               	  
				                                <td class="campocaja" align="center">
				                                               <input type="button" class="boton"
				                                               id="but_docum" value='<axis:alt f="axissin026" c="BT_DOC" lit="9001357" />'
				                                               onclick="f_but_gedox('${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.NMOVTRA}')"/>                                  
				                                </td>
                              	  </c:if>
                                </axis:visible>
                                    
                                    
                                </tr>
                                <tr>
                               
                                    <!-- Nueva modificacion -->
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin026" c="FRECLAMA" lit="9001983"/></b>
                                        <!--Fecha solicitud -->
                                    </td>
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin026" c="FRECIBE" lit="102913"/></b>
                                        <!--Fecha Recepcion -->
                                    </td>
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin026" c="FCADUCA" lit="9001985"/></b>
                                        <!--Fecha Caducidad -->
                                    </td>
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin026" c="COBLIGA" lit="112347"/></b>
                                        <axis:visible c="COBLIGA" f="axissin026">
                                        <input type="checkbox" onchange="javascript:f_onclickCheckbox(this);"
                                               id="COBLIGA"
                                               name="COBLIGA"
                                               <c:if test="${__formdata.COBLIGA == 1}"> checked </c:if>
                                               value="${__formdata.COBLIGA}" <axis:atr f="axissin026" c="COBLIGA" a="modificable=false&isInputText=false"/> /></input>
                                       </axis:visible>
                                    </td>
                                    
                                    
                                </tr>
                                <tr>
                                 
                                  
                                
                                <!--CAJA fecha solitud -->
                                <td class="campocaja">
                                        <axis:visible c="FRECLAMA" f="axissin026">
                                        <input type="text" name="FRECLAMA" id="FRECLAMA" size="15" class="campowidthinput campo campotexto"  style="width:50%;"
                                        value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FRECLAMA}"/>" 
                                        title="<axis:alt f='axissin026' c='FRECLAMA' lit='9001983'/>"
                                        <axis:atr f="axisctr026" c="FRECLAMA" a="formato=fecha&modificable=false"/> /><a style="pointer-events: none;vertical-align:middle;"><img
                                        id="icon_FRECLAMA" border=0 alt="<axis:alt f="axissin026" c="ICO_FRECLAMA" lit="9001983"/>" title="<axis:alt f="axissin026" c="ICO_FRECLAMA" lit="9001983" />" src="images/calendar.gif"/></a>
                                        </axis:visible>
                                </td>
                                <!--CAJA FECHA RECEP -->
                                <td class="campocaja">
                                         <input type="text" name="FRECIBE" id="FRECIBE" size="15" class="campowidthinput campo campotexto"  style="width:50%;"
                                        value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FRECIBE}"/>" 
                                        title="<axis:alt f='axissin026' c='FRECIBE' lit='102913'/>"
                                        <axis:atr f="axisctr026" c="FRECIBE" a="formato=fecha"/> /><a style="vertical-align:middle;"><img
                                        id="icon_FRECIBE" border=0 alt="<axis:alt f="axissin026" c="ICO_FRECIBE" lit="102913"/>" title="<axis:alt f="axissin026" c="ICO_FRECIBE" lit="102913" />" src="images/calendar.gif"/></a>
                                </td>
                                <!--CAJA FECHA CADUCIDAD -->
                                <td class="campocaja">
                                        <input type="text" name="FCADUCA" id="FCADUCA" size="15" class="campowidthinput campo campotexto"  style="width:50%;"
                                        value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCADUCA}"/>" 
                                        title="<axis:alt f='axissin026' c='FCADUCA' lit='9001985'/>"
                                        <axis:atr f="axisctr026" c="FCADUCA" a="formato=fecha"/> /><a style="vertical-align:middle;"><img
                                        id="icon_FCADUCA" border=0 alt="<axis:alt f="axissin026" c="ICO_FCADUCA" lit="9001985"/>" title="<axis:alt f="axissin026" c="ICO_FCADUCA" lit="9001985" />" src="images/calendar.gif"/></a>
                                </td>
                                
                              
                                  
                               
                                
                                </tr>
                                
                                <tr>
                                    <td class="titulocaja" colspan="6">
                                        <b><axis:alt f="axissin026" c="DESCRIPCION" lit="100588"/></b>
                                        <!--Descripcion -->
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td class="campocaja" colspan="6">
                                        <textarea class="campowidthinput campo campotexto" 
                                                  style="width:100%;"
                                                  <axis:atr f="axissin026" c="DESCRIPCION" a="modificable=true"/>
                                                  name="DESCRIPCION" id="DESCRIPCION">${__formdata.DESCDOC}</textarea>
                                                  
                                        <!--<input type="text" name="TDESC" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TESTTRA}" class="campodisabled campo campotexto" style="width:90%"-->
                                        
                                    </td>
                                </tr>
                                
                                
                                
                            </table>
                        </td>
                    </tr>
                </tr>
            </table>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin026</c:param>
              <c:param name="__botones"><axis:visible c="BT_CANCELAR" f="axissin026">,cancelar</axis:visible><axis:visible c="BT_ACEPTAR" f="axissin026">,aceptar</axis:visible></c:param>
             </c:import>
            <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FRECLAMA",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FRECLAMA", 
                singleClick    :    true,
                firstDay       :    1
             });
             Calendar.setup({
                inputField     :    "FRECIBE",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FRECIBE", 
                singleClick    :    true,
                firstDay       :    1
             });
              Calendar.setup({
                inputField     :    "FCADUCA",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FCADUCA", 
                singleClick    :    true,
                firstDay       :    1
             });
     </script>
        </form><c:import url="../include/mensajes.jsp"/></body>
</html>
