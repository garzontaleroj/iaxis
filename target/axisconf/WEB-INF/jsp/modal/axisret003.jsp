<%/*
*  Fichero: axisret003.jsp
*  Fecha: 17/09/2011
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

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
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
        // bug 0024892
        //f_recarga_combos('E');
        revisarEstilos();
        f_cargar_propiedades_pantalla();
        var IDCONVENIO = '${__formdata.IDCONVENIO}';
        
            <c:if test="${__formdata.OK=='OK'}" >
                    //alert('<axis:alt f="axisret003" c="LIT_MESA_OK" lit="1000405" />');
                    parent.f_aceptar_axisret003(IDCONVENIO);
            </c:if>
        }
                

         
         
        function f_but_xxx(SSEGURO,SRECREN) {
            var hayChecked = objUtiles.f_GuardaCasillasChecked ("selRenta");
            var valores = new Array();  
            
            if (typeof hayChecked == 'boolean' && objUtiles.estaVacio(SSEGURO)) {
                alert(objJsMessages.jslit_selecciona_registro);
            } else {
                
                // Se han de obtener los valores de la función o del radio
                if(!objUtiles.estaVacio(SSEGURO)){
                
                    parent.f_aceptar_axisret003(SSEGURO,SRECREN);
                    
                }else{
                    
                    var registro = document.miForm.selRentaValor.value;
                    //alert("registro"+registro);
                    valores= registro.split("#");
                    SSEGURO = valores[0];
                    SRECREN = valores[1];
                    
                    parent.f_aceptar_axisret003(SSEGURO,SRECREN);
                }
                
            }
        }
         
         
         
        function f_but_aceptar() {
         if (objValidador.validaEntrada())
           objUtiles.ejecutarFormulario("modal_axisret003.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        function f_recargar(thiss) {
           if (thiss.value > 0) 
                if (objValidador.validaEntrada())
                    objUtiles.ejecutarFormulario("modal_axisret003.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axisret003');
            
        }
        
        /* **************************************************** FUNCIONES PANTALLA ************************************************ */

        function f_abrir_axisper021(){
            var cagente = "${__formdata.CAGENTE}";
            objUtiles.abrirModal("axisper021","src","modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PUBPRIV&faceptar=f_aceptar_axisper021&CAGENTE="+cagente);
        }

        function f_consulta_axisper021(NNUMIDE){
            var cagente = "${__formdata.CAGENTE}";

            objDom.setValorPorId("DEC_SPERSON", ""); 
            objDom.setValorPorId("NNUMIDE", ""); 
            objDom.setValorPorId("NOMBRE_TEXT", ""); 

            if (!objUtiles.estaVacio(NNUMIDE)){
               objUtiles.abrirModal("axisper021","src","modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PUBPRIV&faceptar=f_aceptar_axisper021&NNUMNIF="+NNUMIDE+"&CAGENTE="+cagente);
            }
        }

        function f_cerrar_modalespersona(pantalla){
             f_cerrar_axisper021();
         }
        function f_cerrar_axisper021(){
                objUtiles.cerrarModal("axisper021");
        } 
        
        function f_aceptar_persona(SPERSON){
            objDom.setValorPorId("DEC_SPERSON", SPERSON); 
            objUtiles.cerrarModal("axisper021");
            f_get_persona(SPERSON);
        } 

        function f_get_persona(SPERSON){
             objAjax.invokeAsyncCGI("modal_axisret003.do", callbackajaxGetPersona, 
              "operation=ajax_get_persona&SPERSON=" + SPERSON , this, objJsMessages.jslit_actualizando_registro);
        }

          function callbackajaxGetPersona(ajaxResponseText) {
                var doc=objAjax.domParse(ajaxResponseText);
                //alert(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    
                    var TNOMBRE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNOMBRE")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0) : "");  

                    var TAPELLI1 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI1")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0) : "");                    
               
                    var TAPELLI2 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI2")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0) : "");   
                    
                    var NNUMIDE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NNUMIDE")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0) : ""); 
                    
                    var SPERSON = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("SPERSON")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0) : ""); 
                    
                    document.miForm.NOMBRE_TEXT.value = TNOMBRE + " " + TAPELLI1 + " " + TAPELLI2;
                    document.miForm.NNUMIDE.value = NNUMIDE;
                    objDom.setValorPorId("DEC_SPERSON", SPERSON); 

                }
            } 
          
        function f_recarga_combos(comboOrigen) {
        //alert("en recarga de combos");
                var CEMPRES = objDom.getValorPorId("CEMPRES");
                var CRAMO   = objDom.getValorPorId("CRAMO");                
               
                objAjax.invokeAsyncCGI("modal_axisret003.do", callbackAjaxActualizarCombos, 
                "operation=actualizar_combos&comboOrigen=" + comboOrigen + "&CEMPRES=" + CEMPRES + 
                "&CRAMO=" + CRAMO, this, null, comboOrigen);
        }       
            
            
        function callbackAjaxActualizarCombos(ajaxResponseText, comboOrigen) {
                var doc = objAjax.domParse(ajaxResponseText);    
                try {            
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                        
                        switch (comboOrigen) {
                            case 'E':   rellenarCombo(doc, "CRAMO");   // falls-through
                            case 'R':   rellenarCombo(doc, "SPRODUC"); 
                        }
                    }            
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
        }              
            
            
        function recuperaCATRIBUyTATRIBU(elemento) {
                var CATRIBU;
                var TATRIBU;
                
                if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("SPRODUC")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("SPRODUC"), 0, 0);
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TTITULO")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TTITULO"), 0, 0);                            
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CRAMO")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CRAMO"), 0, 0);                            
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TRAMO")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TRAMO"), 0, 0);                            
                // The rest of the method, is unreachable code here, in AXISADM036. We've kept it for future extensions.
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CATRIBU")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CATRIBU"), 0, 0);
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TATRIBU")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TATRIBU"), 0, 0);
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CACTIVI")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CACTIVI"), 0, 0);                            
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TTITULO")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TTITULO"), 0, 0);                        
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CGARANT")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CGARANT"), 0, 0);                            
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TGARANT")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TGARANT"), 0, 0);                        
                }
                
                var retVal = new Array(2);
                retVal[0] = CATRIBU;
                retVal[1] = TATRIBU;
                
                return retVal;
        }
        
        
        function rellenarCombo(doc, comboName) {
                var combo = document.getElementById(comboName);
                objDom.borrarOpcionesDeCombo(combo);
                objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", combo, null);
                
                if (objUtiles.existeObjetoXml(doc.getElementsByTagName(comboName)[0])){                    
                    var elementos = doc.getElementsByTagName(comboName)[0].getElementsByTagName("element");
                    var numElementos = elementos.length;
                    
                    if (numElementos == 1)
                        objDom.borrarOpcionesDeCombo(combo);
                    
                    for (i = 0; i < numElementos; i++) {
                        var CATRIBUyTATRIBU = recuperaCATRIBUyTATRIBU(elementos[i]);
                        var CATRIBU = CATRIBUyTATRIBU[0];
                        var TATRIBU = CATRIBUyTATRIBU[1];
                        
                        objDom.addOpcionACombo(CATRIBU, TATRIBU, combo, null);
                    }
                    
                    if (numElementos == 1) {
                        // Seleccionar la única opción del combo y ejecutar
                        // su llamada onchange para recuperar combos dependientes
                        combo[0].selected = "1";
                        combo.onchange(); 
                    }
                }
        }
            
        function f_sel_renta(valor){
        
            document.miForm.selRentaValor.value=valor;
        
        }
        
       /* ************************************************************************************************************************* */
       /* ************************************************************************************************************************* */
       
       function f_nuevo_convenio() {
            f_abrir_axisret003();
       }
            
       function f_editar_convenio(IDCONVENIO) {
            
            parent.f_editar_convenio(IDCONVENIO);
           
       }    
       
       
       /* ******************************************************************************************** */
       /* *********************************** tratamiento agentes ************************************ */
       /* ******************************************************************************************** */
                
        function f_actualizar_agente(){
            objAjax.invokeAsyncCGI("axis_axisadm047.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + objDom.getValorComponente(document.miForm.CAGENTE_TEXT) + 
            "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO), this, objJsMessages.jslit_cargando);
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
            
        function callbackAjaxCambiarAgente(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado);
                objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado);
            }
        }

       function f_actualizar_tomador(){
            if (objValidador.validaEntrada()) {
                 objAjax.invokeAsyncCGI("modal_axisret005.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&SPERSON=" + objDom.getValorComponente(document.miForm.CAGENTE_TEXT) + 
                        "&TRAMO=null&CRAMO=null", this, objJsMessages.jslit_cargando);
            } else {
                objDom.setValorPorId("TAGENTE","");
            }
        }
        
        /* ******************************************************************************************** */
        /* ******************************************************************************************** */
        /* ******************************************************************************************** */
    </script>
  </head>
    <body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }" >
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" id="operacion" value=""/>
            <input type="hidden" name="selRentaValor" id="selRentaValor" value=""/>
            <input type="hidden" name="CEMPRES" id="CEMPRES" value="${__formdata.CEMPRES}"/>
            <input type="hidden" name="IDCONVENIO" id="IDCONVENIO" value="${__formdata.IDCONVENIO}"/>
            <input type="hidden" name="CUSERAUT" id="CUSERAUT" value="${__formdata.CUSERAUT}"/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisret003" c="LIT_FORMULARIO_1" lit="9904266" /></c:param>
                <c:param name="producto"><axis:alt f="axisret003" c="LIT_PANTALLA_1" lit="9904266" /></c:param>
                <c:param name="form">axisret003</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisret003" c="TIT_PAGE" lit="9904266" /></c:param>
                <c:param name="nid" value="axisctr014" />
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                    <c:param name="titulo"><axis:alt f="axisret003" c="PERSONAS" lit="102073"/></c:param>
                    <c:param name="nid">axisper021</c:param>
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
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                           <axis:visible f="axisret003" c="CODCONV" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisret003" c="LIT_CCODIGO" lit="109155" /></b>
                                                </td>
                                             </axis:visible>	
                                           <axis:visible f="axisret003" c="TDESCONV" >
                                                <td class="titulocaja" colspan="3">
                                                    <b><axis:alt f="axisret003" c="LIT_TDESCRI" lit="100588" /></b>
                                                </td>
                                             </axis:visible>	
                                        </tr>
                                        <tr>
                                            <axis:visible f="axisret003" c="CODCONV">
                                                 <td class="campocaja"> 
                                                    <input style="width:85%" type="text" class="campowidthinput campo campotexto" maxlength="15" id="CODCONV" name="CODCONV" size="15" <axis:atr f="axisret003" c="CODCONV" a="modificable=true&obligatorio=true"/>
                                                    value ="${__formdata.CODCONV}" title="<axis:alt f="axisret003" c="ALT_CODCONV" lit="109155"/>" <axis:atr f="axisret003" c="CODCONV" a="modificable=true"/>/>
                                                </td>
                                            </axis:visible>
                                            <axis:visible f="axisret003" c="TDESCONV">
                                                 <td class="campocaja" colspan="3">
                                                    <input style="width:85%" type="text" class="campowidthinput campo campotexto" id="TDESCONV" name="TDESCONV" size="15" <axis:atr f="axisret003" c="TDESCONV" a="modificable=true&obligatorio=true"/>
                                                    value ="${__formdata.TDESCONV}" title="<axis:alt f="axisret003" c="ALT_TDESCONV" lit="100588"/>" <axis:atr f="axisret003" c="TDESCONV" a="modificable=true"/>/>
                                                 </td>
                                            </axis:visible>
                                        </tr>
                                        <%--tr>
                                           <axis:visible f="axisret003" c="CUSERAUT" >
                                                <td class="titulocaja" colspan="2">
                                                    <b><axis:alt f="axisret003" c="LIT_CUSERAUT" lit="9904202" /></b>
                                                </td>
                                             </axis:visible>	
                                        </tr--%>
                                        <%--tr>
                                            <axis:visible f="axisret003" c="CUSERAUT">
                                                 <td class="campocaja" colspan="2">
                                                    <input style="width:85%" type="text" class="campowidthinput campo campotexto" id="CUSERAUT" name="CUSERAUT" size="15"
                                                    value ="${__formdata.CUSERAUT}" title="<axis:alt f="axisret003" c="ALT_CUSERAUT" lit="100885"/>" <axis:atr f="axisret003" c="CUSERAUT" a="modificable=true"/>/>
                                                 </td>
                                            </axis:visible>
                                        </tr--%>
                                        <tr>
                                           <axis:visible f="axisret003" c="FINIVIG" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisret003" c="LIT_FINIVIG" lit="9000716" /></b>
                                                </td>
                                             </axis:visible>	
                                           <axis:visible f="axisret003" c="FFINVIG" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisret003" c="LIT_FFINVIG" lit="9000717" /></b>
                                                </td>
                                             </axis:visible>	
                                        </tr>
                                        <tr>
                                            <axis:visible f="axisret003" c="FINIVIG">
                                                 <td class="campocaja">
                                                    <input style="width:60%" type="text" class="campowidthinput campo campotexto" id="FINIVIG" name="FINIVIG" size="15"
                                                    value ="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINIVIG}"/>" title="<axis:alt f="axisret003" c="x" lit="9000716"/>" <axis:atr f="axisret003" c="FINIVIG" a="modificable=true&formato=fecha&obligatorio=true"/>/>
                                                    <a id="icon_FINIVIG" style="vertical-align:middle;" href="#">
                                                    <img border="0" alt="<axis:alt f="axisret003" c="ddd" lit="9000716" />" title="<axis:alt f="axisret003" c="x1" lit="9000716" />" src="images/calendar.gif"/>
                                                    </a>
                                                </td>
                                            </axis:visible>
                                            <axis:visible f="axisret003" c="FFINVIG">
                                                 <td class="campocaja">
                                                    <input style="width:60%" type="text" class="campowidthinput campo campotexto" id="FFINVIG" name="FFINVIG" size="15"
                                                    value ="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFINVIG}"/>" title="<axis:alt f="axisret003" c="x" lit="9000717"/>" <axis:atr f="axisret003" c="FFINVIG" a="modificable=true&formato=fecha&obligatorio=true"/>/>
                                                    <a id="icon_FFINVIG" style="vertical-align:middle;" href="#">
                                                    <img border="0" alt="<axis:alt f="axisret003" c="ddd" lit="9000717" />" title="<axis:alt f="axisret003" c="x1" lit="9000717" />" src="images/calendar.gif"/>
                                                    </a>
                                                </td>
                                            </axis:visible>
                                        </tr>
                                        <!-- bug 0025815 -->
                                        <!-- Tomador -->
                                        <tr>
                                           <axis:visible f="axisret003" c="SPERSON" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisret003" c="LIT_SPERSON" lit="109360" /></b>
                                                </td>
                                                <td class="titulocaja" colspan="3">
                                                    <b><axis:alt f="axisret003" c="NOMBRE_TEXT" lit="9902210"/>&nbsp;</b> 
                                                </td>                  
                                             </axis:visible>	
                                        </tr>
                                        <tr>
                                           <axis:visible f="axisret003" c="SPERSON" >

                                                <input type="hidden" id="DEC_SPERSON" name="DEC_SPERSON" value="${__formdata.DEC_SPERSON}">
                                                <td class="campocaja">                 
                                                    <input type="text" name="NNUMIDE" id="NNUMIDE" style="width:65%;" value="${__formdata.NNUMIDE}" class="campowidthinput campo campotexto" 
                                                           onchange="f_consulta_axisper021(this.value)" />
                                                        <img border="0" src="images/find.gif" onclick="f_abrir_axisper021()" style="cursor:pointer"/>
                                                        &nbsp;&nbsp;&nbsp;
                                                </td>
                                                <td class="campocaja" colspan="3">                             
                                                     <input readonly="true" type="text" style="width:50%;" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${__formdata.NOMBRE_TEXT}" class="campowidthinput campo campotexto"/>
                                                </td>
                                                <td class="titulocaja">
                                                    &nbsp;
                                                </td>                                 
                                             </axis:visible>	
                                        </tr>                                        
                                          
                                   
                                     
                                    </table>
                                </td>
                            </tr>
                        </table>
                  
              
                
                    </td>
                </tr>
            </table>						
            
            <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisret003</c:param><c:param name="f">axisret003</c:param>
                <c:param name="f">axisret003</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </form>
    <c:import url="../include/mensajes.jsp" />
<script type="text/javascript">
    Calendar.setup({
        inputField     :    "FINIVIG",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FINIVIG", 
        singleClick    :    true,
        firstDay       :    1
    });
    

    Calendar.setup({
        inputField     :    "FFINVIG",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FFINVIG",  
        singleClick    :    true,
        firstDay       :    1
    });

</script>    
    </body>
</html>