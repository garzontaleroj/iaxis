<%/**
*  Fichero: axissin061.jsp
*  @author <a href = "mailto:dvergel@csi-ti.com">Deivis Vergel</a>
*  
*  Gestion de Pagos Pendientes
*
* Descripción de pantalla
*
*  Fecha: 05/03/2014
*/
%>
<%@ page contentType="text/html;charset=iso-8859-15"%>
<%@ page import="java.lang.String"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
  <fmt:setLocale value="${sessionScope.__locale}"/>
  <fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
  <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css"></link>
  <link rel="stylesheet" href="styles/axisnt.css" type="text/css"></link>
  <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
  <c:import url="../include/carga_framework_js.jsp"/>
  <!--********** CALENDARIO ************************* -->
  <!-- Hoja de estilo del Calendario -->
  <link rel="stylesheet" type="text/css" media="all"
        href="styles/calendar-green.css" title="green"/>
  <!-- Script principal del calendario -->
  <script type="text/javascript" src="scripts/calendar.js"></script>
  <!-- Idioma del calendario, en función del Locale -->
  <script type="text/javascript"
          src="scripts/calendar-${sessionScope.__locale}.js"></script>
  <!-- Setup del calendario -->
  <script type="text/javascript" src="scripts/calendar-setup.js"></script>
  <!--*********************************** -->
  <script language="Javascript" type="text/javascript">
// Código javascript
    
    function f_onload() {
        f_cargar_propiedades_pantalla();
        if (!objUtiles.estaVacio ($("#new_CESTVAL").val()) &&
           $('#new_CESTPAG > option').length == 1){
            f_carga_pago();
        }
    }
    
    function f_but_salir() {
        objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axissin061", "cancelar", document.miForm, "_self");
    }
    
    // Primero miramos si hay alguna opción de la lista seleccionada
    function f_but_aceptar() {     
        //alert("En boton aceptar");
        if(document.miForm.TBLPAG.value == "") {
            alert('<axis:alt f="axissin061" c="TBLPAG" lit="9000633"/>');
        }else{
        //objAjax.invokeAsyncCGI("axis_axissin061.do", null, "operation=aceptar", this, objJsMessages.jslit_cargando);
                objUtiles.ejecutarFormulario("axis_axissin061.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
    }
        
    function f_but_buscar(){
        if (objValidador.validaEntrada()) {
            objUtiles.ejecutarFormulario("axis_axissin061.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
    }

    function f_cargar_productos(){
            //alert("En cargar productos");
            CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
             if (!objUtiles.estaVacio (CRAMO) ){
            objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
            objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
            }else
            objDom.setValorComponente(document.miForm.CRAMO, null);
            objAjax.invokeAsyncCGI("axis_axissin061.do", callbackAjaxCargarProductos, "operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO) + 
                "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&tipo="+document.miForm.tipo.value, this, objJsMessages.jslit_cargando);
            //alert("Fin cargar productos");
     }      
            
             

     function callbackAjaxCargarProductos (ajaxResponseText){
        var doc=objAjax.domParse(ajaxResponseText);
        if(!objAppMensajes.existenErroresEnAplicacion(doc)){
            var elementos = doc.getElementsByTagName("SPRODUC");
            
            var SPRODUCCombo = document.miForm._SPRODUC;     
            objDom.borrarOpcionesDeCombo(SPRODUCCombo);
           objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axissin061" c="SELECCIONAR" lit="108341" /> - ', SPRODUCCombo, 0);
               for (i = 0; i < elementos.length; i++) {
                    var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                    var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                    objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                }
        }
     }       

      
        
        /****************************************************************************************/
        /************************************** UTILES *******************************************/
        /****************************************************************************************/
        function limpiaCampos (CAMPO){
            if(objUtiles.utilEquals(CAMPO, "CPAIS")){
                //Limpio província
                objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                
                objDom.setVisibilidadPorId("findPoblacion", "hidden");
            }
            
            if(objUtiles.utilEquals(CAMPO, "CPAIS") ||
                objUtiles.utilEquals(CAMPO, "CPROVIN")){
                    //Limpio población
                    objDom.setValorPorId("CPOBLAC", "");
                    objDom.setValorHTMLPorId("TPOBLAC_span", "");
            }
        }
        
        function seleccionarPago(CAMPO){
            if(CAMPO.checked){
                if(document.miForm.TBLPAG.value=="")
                     document.miForm.TBLPAG.value=CAMPO.value+"#";
                else
                     document.miForm.TBLPAG.value=document.miForm.TBLPAG.value+CAMPO.value+"#";
             }else{
             var str = document.miForm.TBLPAG.value;
                    if(document.miForm.TBLPAG.value.indexOf(CAMPO.value)>-1){
                        document.miForm.TBLPAG.value = str.replace(CAMPO.value+"#","");
                }
             }
         }
         
       
          /****************************************************************************************/
        /*********************************** CALLBACK AJAX **************************************/
        /****************************************************************************************/
        
        function callbackAjaxCargarConceptoPago (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("CATRIBU");
                    
                    var SPRODUCCombo = document.miForm.CCONPAG;     
                    objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axissin061" c="SELECCIONAR" lit="108341" /> - ', SPRODUCCombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CATRIBU"), i, 0);
                            var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TATRIBU"), i, 0);                                     
                            objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                        }
                }
            }       
        
            
      function f_onchangeproductos(valor){
            if (!objUtiles.estaVacio(valor)){
                objAjax.invokeAsyncCGI("axis_axissin061.do", callbackAjaxCargarConceptoPago, "operation=ajax_concepto_pago&SPRODUC="+ objDom.getValorComponente(document.miForm._SPRODUC), this, objJsMessages.jslit_cargando);
            }                
      }
            
      function f_abrir_axisper021 () {
        var SSEGURO = "${__formdata.SSEGURO}";
        objUtiles.abrirModal("axisper021", "src", "modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PUBPRIV&CAGENTE="+document.miForm.CAGENTE.value+"&SSEGURO="+SSEGURO);
      }    
      
      function f_cerrar_axisper021(){
        f_cerrar_modalespersona("axisper021");
      }   
      
      function f_nova_persona(){
          f_cerrar_modalespersona("axisper021");
          objUtiles.abrirModal("axisper022","src","modal_axisper022.do?operation=form&MODO_SWPUBLI=PERSONAS_PUBPRIV&CAGENTE="+document.miForm.CAGENTE.value);  
      }
      
      function f_cerrar_modalespersona(modal){
        objUtiles.cerrarModal(modal);
      } 
      
      function f_aceptar_persona(SPERSON,CAGENTE, SNIP, modal){
        f_cerrar_modalespersona(modal);
        var porigen = 'INT';
        if (modal =='axisper022')
         porigen = 'NUEVO';
    
        document.miForm.ORIGEN.value = porigen;
        document.miForm.SNIP.value = SNIP;
        document.miForm.SPERSON.value = SPERSON;
        document.miForm.CAGENTE_VISIO.value = CAGENTE;
         if (!objUtiles.estaVacio(SPERSON)){
       objUtiles.ejecutarFormulario ("axis_axissin061.do?CAGE="+CAGENTE, "traspasar", document.miForm, "_self", objJsMessages.jslit_cargando);   
       // objAjax.invokeAsyncCGI("modal_axissin011.do?SPERSON="+SPERSON+"&CAGENTE="+document.miForm.CAGENTE.value, callbackAjaxActualitzaPersona, "operation=ajax_actualiza_persona", this, objJsMessages.jslit_cargando);
        }
      }
      
      function f_carga_pago(){
        
            var qs="operation=ajax_pago";
            qs=qs+"&ESTVALANT="+document.miForm.CESTVAL_FIL.value;
            qs=qs+"&ESTPAGANT="+document.miForm.CESTPAG_FIL.value;
            qs=qs+"&ESTVAL="+document.miForm.new_CESTVAL.value;
            
            objAjax.invokeAsyncCGI("axis_axissin061.do", callbackajaxPago, qs, this);
        
        }
        
        
        function callbackajaxPago(ajaxResponseText){
            try{ 
              
                var doc = objAjax.domParse(ajaxResponseText);
                var comboPago = document.miForm.new_CESTPAG;  
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
             
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                        //alert("Existe elemento 0");
                            objDom.borrarOpcionesDeCombo(comboPago);
                            objDom.addOpcionACombo(null, " - " + objJsMessages.jslit_seleccionar + " - ", comboPago, 0);
                                    for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                                        var TATRIBU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0].childNodes[0].nodeValue : "");
                                        var CATRIBU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0].childNodes[0].nodeValue : "");
                                        objDom.addOpcionACombo(CATRIBU, TATRIBU, comboPago, i+1);
                                        //alert(CGARANT);
                                        //alert(TGARANT);
                                    }  

                    }else{
                            objDom.borrarOpcionesDeCombo(comboPago);
                            objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", comboPago, null);
                    }
                }
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
                f_cargar_propiedades_pantalla();//Función que nos carga todas las propiedades de pantalla
        }  
        
        function f_aceptar_axissin006(NSINIES, SSEGURO, SPRODUC, CACTIVI) {
               objDom.setValorPorId("NSINIES", NSINIES);
               objDom.setValorPorId("SSEGURO", SSEGURO);
               objDom.setValorPorId("SPRODUC", SPRODUC);
               objDom.setValorPorId("CACTIVI", CACTIVI);
               /*NSINIES="+NSINIES+
               "&SSEGURO="+SSEGURO+
               "&SPRODUC="+SPRODUC+
               "&CACTIVI="+CACTIVI*/
               objUtiles.ejecutarFormulario("axis_axissin061.do?", "consultarSiniestro", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
</script>
  <body onload="f_onload()"
        onkeypress="if (event.keyCode==13)  { f_but_buscar() }"><c:import url="../include/precargador_ajax.jsp">
      <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import><c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt c="TITULO_021" f="axissin061" lit="9906618"/>
      </c:param>
      <c:param name="nid" value="axisper021"/>
    </c:import><form name="miForm" action="" method="POST">
      <input type="hidden" name="operation" value=""/>
      <input type="hidden" name="radioSiniestro" value=""/>
      <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
      <!-- Revisar -->
      <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
      <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>
      <input type="hidden" name="ORIGEN" id="ORIGEN"
             value="${__formdata.ORIGEN}"/>
      <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}"/>
      <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}"/>
      <input type="hidden" name="TBLPAG" value="${__formdata.TBLPAG}"/>
      <input type="hidden" name="CACTIVI" id="CACTIVI" value="${__formdata.CACTIVI}"/>
      <input type="hidden" name="NSINIES" id="NSINIES" value="${__formdata.NSINIES}"/>
      <input type="hidden" name="SPRODUC" id="SPRODUC" value="${__formdata.SPRODUC}"/>
      <input type="hidden" name="CESTVAL_FIL"
             value="${__formdata.CESTVAL_FIL}"/>
      <input type="hidden" name="CESTPAG_FIL"
             value="${__formdata.CESTPAG_FIL}"/>
      <input type="hidden" name="CAGENTE_VISIO"
             value="${__formdata.CAGENTE_VISIO}"/>
      <input type="hidden" name="SNIP" value="${__formdata.SNIP}"/>
      <input type="hidden" name="MODO" id="MODO"
             value="<c:if test="${!empty __formdata['MODO'] && __formdata['MODO']=='APERTURASINIESTROS'}">${__formdata['MODO']}</c:if>"/>
      <input type="hidden" id="CEMPRES" name="CEMPRES"
             value="${__formdata.CEMPRES}"/>
      <c:import url="../include/titulo_nt.jsp">
        <c:param name="formulario">
          <axis:alt f="axissin061" c="GEST_PAG" lit="9906618"/>
        </c:param>
        <c:param name="producto">
          <axis:alt f="axissin061" c="SELECCIONAR_PAGO" lit="9906618"/>
        </c:param>
        <c:param name="form">axissin061</c:param>
      </c:import>
      <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo">
          <axis:alt f="axissin061" c="CAGENTE" lit="100584"/>
        </c:param>
        <c:param name="nid" value="axisctr014"></c:param>
      </c:import>
      <!-- Area de campos  -->
      <table class="mainModalDimensions base" align="center" cellpadding="0"
             cellspacing="0">
        <tr>
          <td>
            <!-- Situacion -->
            <div class="titulo">
              <img src="images/flecha.gif"/><axis:alt f="axissin061"
                                                      c="DATOS_GENE"
                                                      lit="103593"/>
            </div>
            <!--campos-->
            <table class="seccion">
              <tr>
                <th style="width:20%;height:0px">&nbsp;</th>
                <th style="width:30%;height:0px">&nbsp;</th>
                <th style="width:15%;height:0px">&nbsp;</th>
                <th style="width:5%; height:0px">&nbsp;</th>
                <th style="width:15%; height:0px">&nbsp;</th>
                <th style="width:15%; height:0px">&nbsp;</th>
              </tr>
              <!--fi joan  -->
              <tr>
                <!-- Ramo -->
                <axis:ocultar f="axissin061" c="CRAMO" dejarHueco="false">
                  <td class="titulocaja">
                    <b><axis:alt f="axissin061" c="RAMO" lit="100784"/></b>
                  </td>
                </axis:ocultar>
                <!-- Sproduc -->
                <axis:ocultar f="axissin061" c="_SPRODUC" dejarHueco="false">
                  <td class="titulocaja">
                    <b><axis:alt f="axissin061" c="_SPRODUC" lit="100829"/></b>
                  </td>
                </axis:ocultar>
                <!-- Siniestro -->
                <axis:ocultar f="axissin061" c="_NSINIES" dejarHueco="false">
                  <td class="titulocaja">
                    <b><axis:alt f="axissin061" c="_NSINIES" lit="101298"/></b>
                  </td>
                </axis:ocultar>
                <axis:ocultar f="axissin061" c="SIDEPAG" dejarHueco="false">
                  <td class="titulocaja">
                    <b><axis:alt f="axissin061" c="SIDEPAG" lit="9001909"/></b>
                  </td>
                </axis:ocultar>
                <axis:ocultar c="CCONPAG" f="axissin061" dejarHueco="false">
                  <td class="titulocaja">
                    <b><axis:alt f="axissin061" c="CCONPAG" lit="9001284"/></b>
                    <!-- Concepto Pago -->
                  </td>
                </axis:ocultar>
              </tr>
              <tr>
                <!-- Ramo -->
                <axis:ocultar f="axissin061" c="CRAMO" dejarHueco="false">
                  <td class="campocaja">
                    <select name="ramoProducto" style="width:100%;"
                            id="ramoProducto" size="1"
                            onchange="f_cargar_productos()"
                            class="campowidthselect campo campotexto">
                      <option value="<%= Integer.MIN_VALUE %>">
                        -
                        <axis:alt f="axissin061" c="SELECCIONAR" lit="108341"/>
                        -
                      </option>
                      <c:forEach var="ramos" items="${axisctr_listaRamos}">
                        <option value="${ramos.CRAMO}/${ramos.TRAMO}"
                                <c:if test="${ramos.CRAMO == __formdata.CRAMO}">selected</c:if>>
                          ${ramos.TRAMO}
                        </option>
                      </c:forEach>
                    </select>
                  </td>
                </axis:ocultar>
                <!-- Producto -->
                <axis:ocultar f="axissin061" c="_SPRODUC" dejarHueco="false">
                  <td class="campocaja">
                    <select name="_SPRODUC" id="_SPRODUC" size="1"
                            class="campowidthselect campo campotexto">
                      <option value="<%= Integer.MIN_VALUE %>">
                        <axis:alt f="axissin061" c="SELECCIONAR" lit="108341"/>
                      </option>
                      <c:forEach items="${__formdata.productos}" var="item">
                        <option value="${item.SPRODUC}"
                                <c:if test="${__formdata['_SPRODUC']==item.SPRODUC}">selected</c:if>>
                          ${item.TTITULO}
                        </option>
                      </c:forEach>
                    </select>
                  </td>
                </axis:ocultar>
                <!-- Siniestro -->
                <axis:ocultar f="axissin061" c="_NSINIES" dejarHueco="false">
                  <td class="campocaja">
                    <input type="text" class="campowidthinput campo campotexto"
                           value="${__formdata['_NSINIES']}" name="_NSINIES"
                           id="_NSINIES" size="15" formato="entero"
                           title='<axis:alt f="axissin061" c="SINIESTRO" lit="101298"/>'/>
                  </td>
                </axis:ocultar>
                <axis:ocultar f="axissin061" c="SIDEPAG" dejarHueco="false">
                  <td class="campocaja">
                    <input type="text" class="campowidthinput campo campotexto"
                           value="${__formdata['SIDEPAG']}" name="SIDEPAG"
                           id="SIDEPAG" size="15" formato="entero"
                           title='<axis:alt f="axissin061" c="SIDEPAG" lit="9001909"/>'/>
                  </td>
                </axis:ocultar>
                <axis:ocultar c="CCONPAG" f="axissin061" dejarHueco="false">
                  <td class="campocaja">
                    <select name="CCONPAG" id="CCONPAG" size="1"
                            class="campowidthselect campo campotexto_ob"
                            style="width:90%;"
                            <axis:atr f="axissin061" c="CCONPAG" a="obligatorio=false"/>
                            title='<axis:alt f="axissin061" c="CCONPAG" lit="9001284"/>'>
                      <option value="<%= Integer.MIN_VALUE %>">
                        -
                        <axis:alt f="axissin061" c="CCONPAGLST" lit="1000348"/>
                        -
                      </option>
                      <c:forEach var="tipoconpag"
                                 items="${__formdata.listvalores.lstcconpag}">
                        <option value="${tipoconpag.CATRIBU}"
                                <c:if test="${tipoconpag.CATRIBU == __formdata.CCONPAG}"> selected </c:if>/>
                        ${tipoconpag.TATRIBU}
                      </c:forEach>
                    </select>
                  </td>
                </axis:ocultar>
              </tr>
              <tr>
                <axis:ocultar c="ISINRET" f="axissin061">
                  <td class="titulocaja">
                    <b><axis:alt f="axissin061" c="ISINRET" lit="9904351"></axis:alt></b>
                  </td>
                </axis:ocultar>
                <axis:ocultar c="CESTVAL" f="axissin061">
                  <td class="titulocaja">
                    <b><axis:alt f="axissin061" c="CESTVAL" lit="9000948"/></b>
                    <!-- Estado Validación -->
                  </td>
                </axis:ocultar>
                <axis:ocultar c="CESTPAG" f="axissin061">
                  <td class="titulocaja">
                    <b><axis:alt f="axissin061" c="CESTPAG" lit="9001326"/></b>
                    <!-- Estado Pago  -->
                  </td>
                </axis:ocultar>
              </tr>
              <tr>
                <axis:ocultar f="axissin061" c="ISINRET" dejarHueco="false">
                  <td class="campocaja">
                    <input type="text" class="campowidthinput campo campotexto"
                           value="${__formdata['ISINRET']}" name="ISINRET"
                           id="ISINRET" size="15" formato="entero"
                           title='<axis:alt f="axissin061" c="ISINRET" lit="9904351"></axis:alt>'/>
                  </td>
                </axis:ocultar>
                <axis:ocultar c="CESTVAL" f="axissin061">
                  <td class="campocaja">
                    <select name="CESTVAL" id="CESTVAL" size="1"
                            class="campowidthselect campo campotexto_ob"
                            <axis:atr f="axissin061" c="CESTVAL" a="modificable=true&isInputText=false&obligatorio=true"/>
                            title='<axis:alt f="axissin061" c="CESTVAL" lit="9000948"/>'
                            style="width:90%;">
                      <option value="<%= Integer.MIN_VALUE %>">
                        -
                        <axis:alt f="axissin061" c="SNV_COMBO" lit="1000348"/>
                        -
                      </option>
                      <c:forEach var="tipoval"
                                 items="${__formdata.listvalores.lstestval}">
                        <option value="${tipoval.CATRIBU}"
                                <c:if test="${tipoval.CATRIBU == __formdata.CESTVAL}"> selected </c:if>/>
                        ${tipoval.TATRIBU}
                      </c:forEach>
                    </select>
                  </td>
                </axis:ocultar>
                <axis:ocultar c="CESTPAG" f="axissin061">
                  <td class="campocaja">
                    <select name="CESTPAG" id="CESTPAG" size="1"
                            class="campowidthselect campo campotexto_ob"
                            <axis:atr f="axissin061" c="CESTPAG" a="modificable=true&isInputText=false&obligatorio=true"/>
                            title='<axis:alt f="axissin061" c="CESTPAG" lit="9001326"/>'
                            style="width:90%;">
                      <option value="<%= Integer.MIN_VALUE %>">
                        -
                        <axis:alt f="axissin061" c="SNV_COMBO" lit="1000348"/>
                        -
                      </option>
                      <c:forEach var="tipopag"
                                 items="${__formdata.listvalores.lstestpagdef}">
                        <option value="${tipopag.CATRIBU}"
                                <c:if test="${tipopag.CATRIBU == __formdata.CESTPAG}"> selected </c:if>/>
                        ${tipopag.TATRIBU}
                      </c:forEach>
                    </select>
                  </td>
                </axis:ocultar>
              </tr>
            </table>
          </td>
        </tr>
        <axis:visible f="axissin061" c="DSP_DATOS_PERSO">
          <tr>
            <td>
              <div class="titulo">
                <img src="images/flecha.gif"/>
                 
                <axis:alt f="axissin061" c="DATOS_PERSO" lit="9000909"/>
              </div>
              <table class="seccion">
                <tr>
                  <th style="width:25%;height:0px">&nbsp;</th>
                  <th style="width:25%;height:0px">&nbsp;</th>
                  <th style="width:25%;height:0px">&nbsp;</th>
                  <th style="width:25%; height:0px">&nbsp;</th>
                </tr>
                <tr>
                  <axis:ocultar f="axissin061" c="SPERSON" dejarHueco="false">
                    <td class="titulocaja">
                      <b><axis:alt f="axissin061" c="LIT_SPERSON" lit="105330"/></b>
                      <!-- Document -->
                    </td>
                  </axis:ocultar>
                  <axis:ocultar f="axissin061" c="NOMBRE" dejarHueco="false">
                    <td class="titulocaja">
                      <b><axis:alt f="axissin061" c="LIT_NOMBRE" lit="105940"/></b>
                      <!-- Nombre -->
                    </td>
                  </axis:ocultar>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <axis:ocultar f="axissin061" c="SPERSON" dejarHueco="false">
                    <td class="campocaja">
                      <input type="hidden" name="SPERSON"
                             value="${__formdata.SPERSON}"
                             class="campowidthinput campo campotexto"
                             style="width:90%"
                             <axis:atr f="axissin061" c="SPERSON" a="modificable=true"/>/>
                      <input type="text" name="NNUMIDE"
                             value="${__formdata.NNUMIDE}"
                             class="campowidthinput campo campotexto_ob"
                             style="width:90%"
                             <axis:atr f="axissin061" c="NNUMIDE" a="modificable=false"/>/>
                      <img id="find" border="0" src="images/find.gif"
                           onclick="f_abrir_axisper021()"
                           style="cursor:pointer"/>
                    </td>
                  </axis:ocultar>
                  <axis:ocultar f="axissin061" c="NOMBRE" dejarHueco="false">
                    <td class="campocaja" colspan="2">
                      <input type="text" name="NOMBRE"
                             value="${__formdata.NOMBRE}"
                             class="campowidthinput campo campotexto_ob"
                             style="width:90%"
                             <axis:atr f="axissin012" c="NOMBRE" a="modificable=false"/>/>
                    </td>
                    <td>&nbsp;</td>
                  </axis:ocultar>
                </tr>
              </table>
            </td>
          </tr>
        </axis:visible>
        <tr>
            <td>
                <c:import url="../include/botonera_nt.jsp">
                  <c:param name="__botones">buscar</c:param>
                  <c:param name="f">axissin061</c:param>
                </c:import>
            </td>
        </tr>
        <!--Fi nova secció dades del risc -->
        <tr>
          <!-- Listado de siniestros por poliza -->
          <!-- Lista de Siniestros por póliza -->
        </tr>
        <axis:ocultar f="axissin061" c="LST_SINIESPOLIZAS" dejarHueco="false">
            <tr>
            <td>
              <div class="titulo">
                <img src="images/flecha.gif"/><axis:alt f="axissin061"
                                                        c="LISTADO_SINI"
                                                        lit="9906619"/>
              </div>
              <!-- Lista de siniestros -->
              <table class="seccion">
                <tr>
                  <td>
                    <div id="divSiniestros">
                      <c:set var="title0">&nbsp;</c:set>
                       
                      <c:set var="title2">
                        <axis:alt f="axissin061" c="NSINIES_LST" lit="101298"/>
                      </c:set>
                       
                      <c:set var="title3">
                        <axis:alt f="axissin061" c="SIDEPAG_LST" lit="9001909"/>
                      </c:set>
                       
                      <c:set var="title4">
                        <axis:alt f="axissin061" c="CCONPAG_LST" lit="9001284"/>
                      </c:set>
                       
                      <c:set var="title5">
                        <axis:alt f="axissin061" c="DESTINATARIO_LST"
                                  lit="9000909"/>
                      </c:set>
                       
                      <c:set var="title6">
                        <axis:alt f="axissin061" c="CESTVAL_LST" lit="9000948"/>
                      </c:set>
                       
                      <c:set var="title7">
                        <axis:alt f="axissin061" c="CESTPAG_LST" lit="9001326"/>
                      </c:set>
                       
                      <c:set var="title8">
                        <axis:alt f="axissin061" c="ISINRET_LST" lit="9904351"></axis:alt>
                      </c:set>
                      
                      <c:set var="title9">
                                        <axis:alt f="axissin019" c="CONS" lit="103101"/>
                                    </c:set>
                       
                      <div class="seccion displayspace" style="height:auto">
                        <display:table name="${__formdata.lista_sin}"
                                       id="miListaId" export="false"
                                       class="dsptgtable" pagesize="15"
                                       defaultsort="2" defaultorder="ascending"
                                       requestURI="axis_axissin061.do?paginar=true"
                                       sort="list" cellpadding="0"
                                       cellspacing="0">
                          <%@ include file="../include/displaytag.jsp"%>
                          <axis:visible c="CHECK_LST" f="axissin061">
                            <display:column title="" sortable="false"
                                            sortProperty="CHECK"
                                            headerClass="headwidth10 sortable"
                                            media="html" autolink="false">
                              <div class="dspNumber">
                                <input type="checkbox" id="checkPagos" name="checkPagos" value="${miListaId['SIDEPAG']}" onclick="seleccionarPago(this)"><br>
                              </div>
                            </display:column>
                          </axis:visible>
                          <axis:visible c="NSINIES_LST" f="axissin061">
                            <display:column title="${title2}" sortable="false"
                                            sortProperty="NSINIES"
                                            headerClass="headwidth10 sortable"
                                            media="html" autolink="false">
                              <div class="dspNumber">
                                ${miListaId['NSINIES']}
                              </div>
                            </display:column>
                          </axis:visible>
                          <axis:visible c="SIDEPAG_LST" f="axissin061">
                            <display:column title="${title3}" sortable="false"
                                            sortProperty="SIDEPAG"
                                            headerClass="sortable" media="html"
                                            autolink="false">
                              <div class="dspText">
                                ${miListaId['SIDEPAG']}
                              </div>
                            </display:column>
                          </axis:visible>
                          <axis:visible c="CCONPAG_LST" f="axissin061">
                            <display:column title="${title4}" sortable="false"
                                            sortProperty="CCONPAG"
                                            headerClass="sortable" media="html"
                                            autolink="false">
                              <div class="dspText">
                                ${miListaId['CCONPAG']}
                              </div>
                            </display:column>
                          </axis:visible>
                          <axis:visible c="DESTINATARIO_LST" f="axissin061">
                            <display:column title="${title5}" sortable="false"
                                            sortProperty="DESTINATARIO"
                                            headerClass="sortable" media="html"
                                            autolink="false">
                              <div class="dspText">
                                ${miListaId['DESTINATARIO']}
                              </div>
                            </display:column>
                          </axis:visible>
                          <axis:visible c="CESTVAL_LST" f="axissin061">
                            <display:column title="${title6}" sortable="false"
                                            sortProperty="CESTVAL"
                                            headerClass="sortable" media="html"
                                            autolink="false">
                              <div class="dspText">
                                ${miListaId['CESTVAL']}
                              </div>
                            </display:column>
                          </axis:visible>
                          <axis:visible c="CESTPAG_LST" f="axissin061">
                            <display:column title="${title7}" sortable="false"
                                            sortProperty="CESTPAG"
                                            headerClass="headwidth10 sortable"
                                            media="html" autolink="false">
                              <div class="dspText">
                                ${miListaId['CESTPAG']}
                              </div>
                            </display:column>
                          </axis:visible>
                          <axis:visible c="ISINRET_LST" f="axissin061">
                            <display:column title="${title8}" sortable="false"
                                            sortProperty="IMPORTE"
                                            headerClass="sortable" media="html"
                                            autolink="false">
                              <div class="dspText">
                                ${miListaId['IMPORTE']}
                              </div>
                            </display:column>
                          </axis:visible>
                          <axis:visible c="BT_EDIT_SINI" f="axissin019">
                                            <display:column title="${title9}"
                                                            sortable="false"
                                                            headerClass="sortable"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspIcon">
                                                   <a href="javascript:f_aceptar_axissin006('${miListaId.NSINIES}',  '${miListaId['SSEGURO']}','${miListaId.SPRODUC}','${miListaId.CACTIVI}')"><img border="0" alt="<axis:alt f="axissin019" c="EDITAR" lit="100002" />" title="<axis:alt f="axissin019" c="EDITAR" lit="100002" />" src="images/find.gif"/></a>
                                                </div>
                                            </display:column>
                                            </axis:visible>
                        </display:table>
                         
                        <c:choose>
                          <c:when test="${!empty  __formdata.AXISSIN_LISTASINIESTROS}">
                            <script language="javascript">//objUtiles.retocarDsptagtable("miListaId");</script>
                          </c:when>
                          <c:otherwise>
                            <script language="javascript">
                                                //objLista.esconderListaSpans();
                                                //objLista.esconderListaLinks();     
                                                        </script>
                          </c:otherwise>
                        </c:choose>
                      </div>
                    </div>
                  </td>
                </tr>
                <tr>
          
                </tr>
              </table>
            </td>
        </tr>
        </axis:ocultar>
      </table>
      <c:if test="${!empty __formdata.CESTVAL_FIL}">
      <table align="center" cellpadding="0"
             cellspacing="0" style="width:50%;">
             <tr>
             </tr>
             <tr>
             </tr>
        <tr>
          <axis:ocultar c="new_CESTVAL" f="axissin061">
            <td class="campocaja">
            <b><axis:alt f="axissin061" c="new_CESTVAL" lit="9000948"/></b><br>
              <select name="new_CESTVAL" id="new_CESTVAL" size="1"
                      class="campowidthselect campo campotexto_ob"
                      <axis:atr f="axissin061" c="new_CESTVAL" a="modificable=true&isInputText=false&obligatorio=false"/>
                      title='<axis:alt f="axissin061" c="new_CESTVAL" lit="9000948"/>'
                      style="width:50%;" onchange="f_carga_pago()">
                <option value="<%= Integer.MIN_VALUE %>">
                  -
                  <axis:alt f="axissin061" c="SNV_COMBO" lit="1000348"/>
                  -
                </option>
                <c:forEach var="tipoval"
                           items="${__formdata.listvalores.lstestval}">
                  <option value="${tipoval.CATRIBU}"
                          <c:if test="${tipoval.CATRIBU == __formdata.new_CESTVAL}"> selected </c:if>/>
                  ${tipoval.TATRIBU}
                </c:forEach>
              </select>
            </td>
          </axis:ocultar>
          <axis:ocultar c="new_CESTPAG" f="axissin061">
            <td class="campocaja">
            <b><axis:alt f="axissin061" c="new_CESTPAG" lit="9001326"/></b><br>
              <select name="new_CESTPAG" id="new_CESTPAG" size="1"
                      class="campowidthselect campo campotexto_ob"
                      <axis:atr f="axissin061" c="new_CESTPAG" a="modificable=true&isInputText=false&obligatorio=false"/>
                      title='<axis:alt f="axissin061" c="new_CESTPAG" lit="9001326"/>'
                      style="width:50%;">
                <option value="<%= Integer.MIN_VALUE %>">
                  -
                  <axis:alt f="axissin061" c="SNV_COMBO" lit="1000348"/>
                  -
                </option>
                <c:forEach var="tipopag"
                           items="${__formdata.listvalores.lcestpag}">
                  <option value="${tipopag.CATRIBU}"
                          <c:if test="${tipopag.CATRIBU == __formdata.new_CESTPAG}"> selected </c:if>/>
                  ${tipopag.TATRIBU}
                </c:forEach>
              </select>
            </td>
          </axis:ocultar>
        </tr>
        <tr>
        
        </tr>
        </table>
        </c:if>
      <!-- Area campos -->
      <c:import url="../include/botonera_nt.jsp">
            <c:param name="__botones">salir,aceptar</c:param>
            <c:param name="f">axissin061</c:param>
          </c:import>
    </form>
    <script type="text/javascript">
            <axis:ocultar f="axissin061" c="FSINIES" dejarHueco="false">
            Calendar.setup({
                inputField     :    "FSINIES",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FSINIES", 
                singleClick    :    true,
                firstDay       :    1
            });
            </axis:ocultar>
          </script><c:import url="../include/mensajes.jsp"/></body>