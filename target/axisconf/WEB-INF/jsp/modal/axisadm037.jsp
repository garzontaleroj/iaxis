<%/*
*  Fichero: axisadm037.jsp
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavi Pastor</a> 
*
*  Fecha: 20/05/2009
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
            f_cargar_propiedades_pantalla();
            revisarEstilos();
            
            //Marcar tipo
            var primerCheck  = "${__formdata['asegurado']}";            
            var tercerCheck  = "${__formdata['pagador']}";           
            if(primerCheck==""&&tercerCheck==""){            
                var tomador = document.getElementById("tomador");
                f_checkea_persona(1);
                //tomador.checked=true;
                }
            else{
                if(primerCheck==""){
                 f_checkea_persona(3);
                }else{
                 f_checkea_persona(2);
                }
                
            }
            
            //Marcar persona busqueda
            
            var persona  = "${__formdata['SPERSON']}";      
           // //alert(persona);
            if(persona!=null && persona!='null'&&persona!=''){
                f_cargar_DATOSPERSONA();
            }
          
            
            
        }
      
        function f_but_aceptar (cual) {
            var SDEVOLU = "";
            if (!objUtiles.estaVacio(cual)) 
                // Seleccionada por el hipervínculo
                SDEVOLU = cual;
            else if (!objUtiles.estaVacio(document.miForm.seleccionaDev)) {
                // Checkeada por el radio button
                SDEVOLU = objUtiles.f_GuardaCasillasChecked("seleccionaDev");
            } 
            
            if (typeof SDEVOLU == 'boolean' || objUtiles.estaVacio (SDEVOLU)) 
                alert("<axis:alt f='axisadm037' c='ALERT_ACEPTAR' lit='1000413' />");
            else
                // Si hay una seleccionada, llamar al Action.
                 if (objValidador.validaEntrada())
                    parent.f_aceptar_axisadm037(SDEVOLU);
            
         }
        function f_but_buscar() {
         if (objValidador.validaEntrada())
           objUtiles.ejecutarFormulario("modal_axisadm037.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
         
        }
        function f_recargar(thiss) {
           if (thiss.value > 0) 
                if (objValidador.validaEntrada())
                    objUtiles.ejecutarFormulario("modal_axisadm037.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axisadm037');
        }
        
        
        
        
        /*********************************************************************************************************************/
        /*******************************************       DATOS PERSONA         *********************************************/
        /*********************************************************************************************************************/
        
          function f_checkea_persona(tipo){
        
         if (tipo == 1)
            {
            document.getElementById("tomador").checked=true;
            document.getElementById("asegurado").checked=false;
            document.getElementById("pagador").checked=false;
            }
         else if (tipo == 2) 
            {
            document.getElementById("tomador").checked=false;
            document.getElementById("asegurado").checked=true;
            document.getElementById("pagador").checked=false;
            }
         else if (tipo == 3) 
            {
            document.getElementById("tomador").checked=false;
            document.getElementById("asegurado").checked=false;
            document.getElementById("pagador").checked=true;
            }  
            
        objDom.setValorPorId("TIPO_PERS",tipo);
               
        }
        
        function f_cargar_DATOSPERSONA() {        
            var params = "&NNUMIDE=" + objDom.getValorPorId("NNUMIDE") + "&TNOMBRE=" + objDom.getValorPorId("TNOMBRE"); 
            objAjax.invokeAsyncCGI("modal_axisadm037.do", callbackCargarDatosPersona, "operation=ajax_cargarDatosPersona" + params, this, objJsMessages.jslit_cargando);
            
            //var params = "&NNUMIDE=" + objDom.getValorPorId("NNUMIDE") + "&TNOMBRE=" + objDom.getValorPorId("TNOMBRE"); 
            //objAjax.invokeAsyncCGI("modal_axisadm001.do", callbackCargarDatosPersona, 
            //    "operation=ajax_cargarDatosPersona" + params, this);
        }
        
        
        function callbackCargarDatosPersona(ajaxResponseText) {
            var doc = objAjax.domParse(ajaxResponseText);
            // Buscamos las filas (tradded) y el cuerpo (tbodyadded) de un displayTag asociado (miListaId) 
            // para poder añadir una nueva fila
            if (!objAppMensajes.existenErroresEnAplicacion(doc)){
                var tbodyadded = objLista.obtenerBodyLista("DATOSPERSONA");
                var tradded = objLista.obtenerFilasBodyLista("DATOSPERSONA", tbodyadded);
                var primerSPERSON = null;
                var primerTEXTO   = null;
                var primerNNUMIDE = null;
                
                objLista.borrarFilasDeLista ("DATOSPERSONA", "3", "<axis:alt f='axisadm037' c='DATOSPERSONA' lit='1000254'/>");
                
                if (objDom.existeTag(doc, "CODI"))
                    // Si hay registros, eliminamos el tr "No se han encontrado datos"
                    objLista.borrarFilaVacia(tbodyadded, tradded);
                
                // Bucle para insertar cada una de las filas
                for (var i = 0; i < objDom.numeroDeTags(doc, "CODI") ; i++) {
                    // Obtenemos el estilo para la fila que insertaremos
                    var rowstyle = objLista.addEstiloEnFilaDeLista(tradded, "gridEven", "gridNotEven");
                    // Creamos una nueva fila vacia y le damos el estilo obtenido
                    var newtr = objLista.crearNuevaFila(rowstyle);
                    // Creamos un array de columnas a añadir a la nueva fila del displayTag
                    var newtd = new Array(4);
                    // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                    
                    var SPERSON   = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), i, 0);
                    var VALOR   = objDom.getValorNodoDelComponente(doc.getElementsByTagName("VALOR"), i, 0);
                    var TEXTO     = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TEXTO"), i, 0);
                  //  TEXTO = objUtiles.replaceAll(TEXTO, "'", "\'");
                     TEXTO=TEXTO.replace(/'/g, "\\'");
                    var jsFuncion = "javascript:f_seleccionar_persona('" + SPERSON + "', '" + TEXTO + "', '" + VALOR + "')";
                    
                    newtd[0] = objLista.addRadioButtonEnLista("radioSPERSON", SPERSON, jsFuncion);             
                    
                    if (i == 0 && !objUtiles.estaVacio(newtd[0])) {
                        primerSPERSON = SPERSON;
                        primerTEXTO   = TEXTO;
                        primerNNUMIDE   = VALOR;
                    }
                        
                    newtd[1] = objLista.addTextoEnLista(VALOR, jsFuncion);
                    newtd[2] = objLista.addTextoEnLista(TEXTO, jsFuncion);
                    
                    // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                    objLista.addNuevaFila(newtd, newtr, tbodyadded);
                }
                
                // Seleccionar el primero si sólo hay uno
                
                if (!objUtiles.estaVacio(primerSPERSON) && objDom.numeroDeTags(doc, "CODI") == 1)
                    f_seleccionar_persona(primerSPERSON, primerTEXTO,primerNNUMIDE);
                                                        
            } // Fi if
        }
        
        
        function f_borrar_campos() {
        
            objDom.setValorPorId("NNUMIDE", "");
             objDom.setValorPorId("SPERSON", "");
            objDom.setValorPorId("TNOMBRE", "");
           // f_cargar_DATOSPERSONA();
            document.getElementById("NNUMIDE").focus();
        }
        
        
         function f_seleccionar_persona(SPERSON, TNOMBRE,NNUMIDE) {
        
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
            objDom.setValorPorId("NNUMIDE", NNUMIDE);   
        }

    </script>
  </head>
    <body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }" >
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" id="TIPO_PERS" name="TIPO_PERS" value="${__formdata.TIPO_PERS}"/>
            <input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.SPERSON}"/>
            <c:if test="${!empty __formdata.LISTVALORES.LSTEMPRESAS && fn:length(__formdata.LISTVALORES.LSTEMPRESAS) == 1  }">
                <input type="hidden" name="CEMPRES" id="CEMPRES" value="${__formdata.LISTVALORES.LSTEMPRESAS[0].CEMPRES}" />
            </c:if>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisadm037" c="for_cercador_dev" lit="9001616" /></c:param>
                <c:param name="producto"><axis:alt f="axisadm037" c="pro_cercador_dev" lit="9001616" /></c:param>
                <c:param name="form">axisadm037</c:param>
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
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                        </tr>
                                        <tr>
                                           <axis:visible f="axisadm037" c="CEMPRES" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm037" c="CEMPRES" lit="101619" /></b>
                                                </td>
                                            </axis:visible>	
                                            <axis:ocultar f="axisadm037" c="CCOBBAN" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm067" c="CCOBBAN" lit="100879"/></b>   <%-- Cobrador bancario --%>
                                                </td>
                                            </axis:ocultar>
                                            <axis:visible f="axisadm037" c="SDEVOLU" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm037" c="SDEVOLU" lit="9001617" /></b>
                                                </td>
                                             </axis:visible>	
                                           <axis:visible f="axisadm037" c="FSOPORTE" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm037" c="FSOPORTE" lit="9001618" /></b>
                                                </td>
                                             </axis:visible>	
                                           <axis:visible f="axisadm037" c="FCARGA" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm037" c="FCARGA" lit="9001619" /></b>
                                                </td>
                                             </axis:visible>
                                           <axis:visible f="axisadm037" c="FCARGAINI" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm037" c="FCARGAINI" lit="9904398" /></b>
                                                </td>
                                             </axis:visible>
                                        <axis:visible f="axisadm037" c="FCARGAFIN" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm037" c="FCARGAFIN" lit="9904399" /></b>
                                                </td>
                                             </axis:visible>
                                        </tr>
                                        <tr>
                                        <axis:visible f="axisadm037" c="CEMPRES">
                                            <c:choose> 
                                                <c:when test="${fn:length(__formdata.listValores.lstempresas) > 1 && !empty __formdata.listValores.lstempresas}">         
                                                     <td class="campocaja">
                                                            <select name = "CEMPRES" id ="CEMPRES" size="1" <axis:atr f="axisadm037" c="CEMPRES" a="isInputText=false"/>
                                                                title="<axis:alt f="axisadm037" c="CEMPRES" lit="101619" />" onchange="f_recargar(this)"
                                                                class="campowidthselect campo campotexto">&nbsp;
                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm037" c="item_empresa_sel" lit="108341"/> - </option> 
                                                                <c:forEach items="${__formdata.listValores.lstempresas}" var="emp">
                                                                    <option value = "${emp.CEMPRES}" <c:if test="${emp.CEMPRES  == __formdata.CEMPRES}">selected</c:if>>${emp.TEMPRES}</option>
                                                                </c:forEach>
                                                            </select>
                                                     </td>
                                                </c:when>
                                                <c:otherwise> 
                                                    <td class="campocaja" > 
                                                        <input type= "text" class="campo campotexto" obligatorio="true" id="TEMPRES" name="TEMPRES" value = "${__formdata.listValores.lstempresas[0].TEMPRES}"
                                                        title="<axis:alt f="axisadm037" c="CEMPRES" lit="101619" />"
                                                        <axis:atr f="axisadm037" c="CEMPRES" a="modificable=false&obligatorio=true"/>/>
                                                    </td>    
                                                </c:otherwise> 
                                                
                                            </c:choose> 
                                          </axis:visible>
                                          
                                          <axis:ocultar f="axisadm037" c="CCOBBAN" dejarHueco="false">
                                                <td class="campocaja">
                                                    <select name="CCOBBAN" id ="CCOBBAN" size="1" class="campo campotexto" style="width:90%" 
                                                    title="<axis:alt f="axisadm037" c="CCOBBAN" lit="100879"/>" 
                                                    <axis:atr f="axisadm067" c="CCOBBAN" a="isInputText=false"/>>
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm037" c="CCOBBAN2" lit="108341"/> - </option>
                                                        <c:forEach items="${__formdata.listValores.lstcobban}" var="item">                                                               <!--BFP bug 20544 28/12/2011: hi havia=> item.NCUENTA -->
                                                            <option value = "${item.CCOBBAN}" <c:if test="${__formdata.CCOBBAN != 'null' && __formdata.CCOBBAN == item.CCOBBAN}"> selected </c:if>>${item.DESCRIPCION}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                          </axis:ocultar>
                                          
                                          
                                          <axis:visible f="axisadm037" c="SDEVOLU">
                                                    
                                                     <td class="campocaja">
                                                            <select name = "SDEVOLU" id ="SDEVOLU" size="1" <axis:atr f="axisadm037" c="SDEVOLU" a="isInputText=false"/>
                                                                title="<axis:alt f="axisadm037" c="SDEVOLU" lit="9001617" />"
                                                                class="campowidthselect campo campotexto">&nbsp;
                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm037" c="item_devolucio_sel" lit="108341"/> - </option> 
                                                                <c:forEach items="${__formdata.listValores.lstdevoluciones}" var="emp">
                                                                    <option value = "${emp.SDEVOLU}" <c:if test="${emp.SDEVOLU  == __formdata.SDEVOLU}">selected</c:if>>${emp.TPRENOM}</option>
                                                                </c:forEach>
                                                            </select>
                                                     </td>     
                                                     
                                          </axis:visible> 
                                            <axis:visible f="axisadm037" c="FSOPORTE">
                                                 <td class="campocaja">
                                                    <input style="width:85%" type="text" class="campowidthinput campo campotexto" id="FSOPORTE" name="FSOPORTE" size="15"
                                                    value ="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FSOPORTE}"/>" title="<axis:alt f="axisadm037" c="FSOPORTE" lit="9001618"/>" <axis:atr f="axisadm037" c="FSOPORTE" a="modificable=true&formato=fecha"/>/>
                                                    <a id="icon_FSOPORTE" style="vertical-align:middle;" href="#">
                                                    <img border="0" alt="<axis:alt f="axisadm037" c="item_fsoport_mes" lit="108341" />" title="<axis:alt f="axisadm037" c="item_fsoport_sel" lit="108341" />" src="images/calendar.gif"/>
                                                    </a>
                                                </td>
                                            </axis:visible>
                                            <axis:visible f="axisadm037" c="FCARGA">
                                                 <td class="campocaja">
                                                    <input style="width:85%" type="text" class="campowidthinput campo campotexto" id="FCARGA" name="FCARGA" size="15"
                                                    value ="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCARGA}"/>" title="<axis:alt f="axisadm037" c="FCARGA" lit="9001619"/>" <axis:atr f="axisadm037" c="FCARGA" a="modificable=true&formato=fecha"/>/>
                                                    <a id="icon_FCARGA" style="vertical-align:middle;" href="#">
                                                    <img border="0" alt="<axis:alt f="axisadm037" c="item_fcarga_sel" lit="108341" />" title="<axis:alt f="axisadm037" c="item_fcarga_mes" lit="108341" />" src="images/calendar.gif"/>
                                                    </a>
                                                </td>
                                            </axis:visible>
                                            <jsp:useBean id="today" class="java.util.Date" /> 
                                            <axis:visible f="axisadm037" c="FCARGAINI">
                                                 <td class="campocaja">
                                                    <input style="width:85%" type="text" class="campowidthinput campo campotexto" id="FCARGAINI" name="FCARGAINI" size="15"
                                                    value ="<fmt:formatDate pattern="dd/MM/yyyy" value="${!empty __formdata.FCARGAINI ? __formdata.FCARGAINI : today}"/>" title="<axis:alt f="axisadm037" c="FCARGAINI" lit="9904398"/>" <axis:atr f="axisadm037" c="FCARGAINI" a="modificable=true&formato=fecha"/>/>
                                                    <a id="icon_FCARGAINI" style="vertical-align:middle;" href="#">
                                                    <img border="0" alt="<axis:alt f="axisadm037" c="item_fcarga_sel" lit="108341" />" title="<axis:alt f="axisadm037" c="item_fcarga_mes" lit="108341" />" src="images/calendar.gif"/>
                                                    </a>
                                                </td>
                                            </axis:visible>
                                            <axis:visible f="axisadm037" c="FCARGAFIN">
                                                 <td class="campocaja">
                                                    <input style="width:85%" type="text" class="campowidthinput campo campotexto" id="FCARGAFIN" name="FCARGAFIN" size="15"
                                                    value ="<fmt:formatDate pattern="dd/MM/yyyy" value="${!empty __formdata.FCARGAFIN ? __formdata.FCARGAFIN : today}"/>" title="<axis:alt f="axisadm037" c="FCARGAFIN" lit="9904399"/>" <axis:atr f="axisadm037" c="FCARGAFIN" a="modificable=true&formato=fecha"/>/>
                                                    <a id="icon_FCARGAFIN" style="vertical-align:middle;" href="#">
                                                    <img border="0" alt="<axis:alt f="axisadm037" c="item_fcarga_sel" lit="108341" />" title="<axis:alt f="axisadm037" c="item_fcarga_mes" lit="108341" />" src="images/calendar.gif"/>
                                                    </a>
                                                </td>
                                            </axis:visible>
                                         </tr>
                                    </table>
                                </td>
                            </tr>
                 
                            <!-- ******************************************************************************************************************************************** -->
                            <!-- ************************************************************* SECCION PERSONA ************************************************************** -->
                            <!-- ******************************************************************************************************************************************** -->
                            
                            
                            
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <axis:ocultar f="axisadm037" c="SEC_PERSONA" dejarHueco="false">
                    
                    
                    <table class="seccion">
                        <tr>
                            <th style="width:16.6%;height:0%;"/>
                            <th style="width:16.6%;height:0%;"/>
                            <th style="width:16.6%;height:0%;"/>
                            <th style="width:16.6%;height:0%;"/>
                            <th style="width:8.6%;height:0%;"/>
                            <th style="width:8.4%;height:0%;"/>
                        </tr>
                        <tr>
                            <axis:ocultar f="axisadm037" c="NNUMIDE" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm037" c="NNUMIDE" lit="105330"/></b> <%-- Nº identificatiu --%>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm037" c="TNOMBRE" dejarHueco="false">
                            <td class="titulocaja" colspan="3">
                                <b><axis:alt f="axisadm037" c="TNOMBRE" lit="1000560"/> <axis:alt f="axisadm037" c="TNOMBRE2" lit="105940"/></b> <%-- Cognoms Nom --%>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm037" c="TIPOPER" dejarHueco="false">     
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm037" c="PRENADOR" lit="101027"/></b> <%-- Prenedor --%>
                            </td>                            
                            <td class="titulocaja">
                                <input type="radio" id="tomador" name="tomador" onclick="f_checkea_persona(1)"                                
                                <c:if test="${__formdata['tomador'] == 'on'}"> checked </c:if>/>                                    
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <axis:ocultar f="axisadm037" c="NNUMIDE" dejarHueco="false">
                            <td class="campocaja">                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NNUMIDE}" name="NNUMIDE" id="NNUMIDE" 
                                <axis:atr f="axisadm037" c="NNUMIDE" a="obligatorio=false"/> onchange="f_cargar_DATOSPERSONA()" style="width:50%;"
                                title="<axis:alt f="axisadm037" c="NNUMIDE" lit="105330"/>" />
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm037" c="TNOMBRE" dejarHueco="false">
                            <td class="campocaja" colspan="3">                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TNOMBRE}" name="TNOMBRE" id="TNOMBRE" 
                                title="<axis:alt f="axisadm037" c="TNOMBRE" lit="1000560"/> <axis:alt f="axisadm037" c="TNOMBRE2" lit="105940"/>" 
                                <axis:atr f="axisadm037" c="TNOMBRE" a="obligatorio=false"/>  onchange="f_cargar_DATOSPERSONA()"  style="width:80%;"/>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm037" c="TIPOPER" dejarHueco="false">     
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm037" c="CAMPO003" lit="101028"/></b> <%-- Assegurat --%>                                
                            </td>
                                       
                            <td class="titulocaja">
                                <input type="radio" id="asegurado" name="asegurado" onclick="f_checkea_persona(2)"
                                <c:if test="${__formdata['asegurado'] == 'on'}">checked</c:if>/>
                            </td>
                            </axis:ocultar>
                        </tr>
                        <!-- ******************************** -->
                         <tr>
                         <td class="titulocaja" colspan = "4">
                         <axis:ocultar f="axisadm037" c="PAGADOR" dejarHueco="false">     
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm037" c="PAGADOR" lit="9903157"/></b> <%-- Pagador --%>
                            </td>                 
                             <td class="titulocaja">
                                <input type="radio" id="pagador" name="pagador" onclick="f_checkea_persona(3)"                               
                                <c:if test="${__formdata['pagador'] == 'on'}"> checked </c:if>/>                                    
                            </td>
                         </axis:ocultar>
                        </tr>
                        <!-- ********************************* -->
                        <tr>
                            <td align="center" colspan="5">
                                <div class="separador">&nbsp;</div>
                                <axis:ocultar f="axisadm037" c="BT_BORRAR_CAMPOS" dejarHueco="false">
                                <input type="button" class="boton" value="<axis:alt f="axisadm037" c="CAMPO004" lit="9000440"/>" onclick="f_borrar_campos()" />
                                </axis:ocultar>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <axis:ocultar f="axisadm037" c="BT_BUSCAR_PER" dejarHueco="false">
                                <input type="button" class="boton" value="<axis:alt f="axisadm037" c="CAMPO005" lit="1000065"/>" onclick="f_cargar_DATOSPERSONA()" />
                                </axis:ocultar>
                                <div class="separador">&nbsp;</div>
                            </td>
                        </tr>
                        <axis:ocultar f="axisadm001" c="DSP_DATPERSON" dejarHueco="false"> 
                        <tr>
                            <td colspan="6">
                                <c:set var="title1"><axis:alt f="axisadm037" c="CAMPO006" lit="800440"/></c:set> <%-- Nº --%>
                                <c:set var="title2"><axis:alt f="axisadm037" c="CAMPO007" lit="105940"/></c:set> <%-- Nom --%>
                                <div class="displayspace">
                                    <display:table name="${sessionScope.DATOSPERSONA}" id="DATOSPERSONA" export="false" class="dsptgtable" 
                                    pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                    requestURI="modal_axisadm037.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column headerClass="headwidth5 sortable" title="" media="html" autolink="false" >
                                            <div class="dspIcons">
                                                <input value="${DATOSPERSONA.SPERSON}" type="radio" id="radioSPERSON" name="radioSPERSON"/>
                                            </div>
                                        </display:column>
                                        <%--display:column title="${title1}" sortable="true" sortProperty="SPERSON" headerClass="headwidth5 sortable"  media="html" autolink="false" >                                    
                                            <div class="dspText">${DATOSPERSONA.SPERSON}</div>
                                        </display:column--%>
                                        <display:column title="${title1}" sortable="true" sortProperty="NNUMIDE" headerClass="headwidth5 sortable"  media="html" autolink="false" >                                    
                                            <div class="dspText">${DATOSPERSONA.NNUMIDE}</div>
                                        </display:column>
                                        <display:column title="${title2}" sortable="true" sortProperty="TNOMBRE" headerClass="sortable"  media="html" autolink="false" >                                    
                                            <div class="dspText"></div>
                                        </display:column>
                                    </display:table>
                                </div>
                            </td>
                        </tr> 
                      </axis:ocultar>                
                    </table>
                    
                    </axis:ocultar>
                </td>
            </tr>
            
                            
        
                            
                            
                            <!-- ******************************************************************************************************************************************** -->
                            <!-- ******************************************************************************************************************************************** -->
                            <!-- ******************************************************************************************************************************************** -->
                                   
                            
                            
                            
                            
                        </table>
<div class="separador">&nbsp;</div>                       
                        <!--campos--> 
                  <table class="seccion">
                            <tr>
                            <td align="left">
                                 <table border="0" class="area" align="left" style="width:100%;">
                                    <tr>
                                        <td>
                                            <c:set var="title1"><axis:alt f="axisadm037" c="camp_codi_dev" lit="9001622"/></c:set>
                                            <c:set var="title2"><axis:alt f="axisadm037" c="camp_empresa" lit="101619"/></c:set>
                                            <c:set var="title3"><axis:alt f="axisadm037" c="camp_presentador" lit="9001623"/></c:set>
                                            <c:set var="title4"><axis:alt f="axisadm037" c="camp_entitat" lit="9001624"/></c:set>
                                            <c:set var="title5"><axis:alt f="axisadm037" c="camp_oficina" lit="9000436"/></c:set>
                                            <c:set var="title6"><axis:alt f="axisadm037" c="FSOPORT" lit="9001618"/></c:set>
                                            <c:set var="title7"><axis:alt f="axisadm037" c="FCARGA" lit="9001619"/></c:set>
                                            <c:set var="title8"><axis:alt f="axisadm037" c="camp_usuari" lit="100894"/></c:set>
                                            <c:set var="title9"><axis:alt f="axisadm037" c="TCOBBAN" lit="100879"/></c:set>
                                            <div class="displayspaceMaximo">
                                            <display:table name="${__formdata.devoluciones}" id="miListaId" export="false" class="dsptgtable" pagesize="8" requestURI="modal_axisadm037.do?paginar=true"
                                            sort="list" cellpadding="0" cellspacing="0">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title=" " sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                                    <div class="dspIcons"><input <c:if test="${miListaId['seleccionaDev']}">checked</c:if> type="radio" id="seleccionaDev" name="seleccionaDev" value="${miListaId['SDEVOLU']}"/></div>
                                                </display:column>
                                                <display:column title="${title1}" headerClass="sortable" sortProperty="SDEVOLU" style="width:5%"  media="html" autolink="false" >
                                                    <div class="dspNumber"><a href="javascript:f_but_aceptar('${miListaId['SDEVOLU']}')">${miListaId.SDEVOLU}</a></div>
                                                </display:column>
                                                <axis:visible c="TEMPRES" f="axisadm037">
                                                    <display:column title="${title2}" headerClass="sortable" sortProperty="TEMPRES"  media="html" autolink="false" >
                                                        <div class="dspText"><a href="javascript:f_but_aceptar('${miListaId['SDEVOLU']}')">${miListaId.TEMPRES}</a></div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible c="TPRENOM" f="axisadm037">
                                                    <display:column title="${title3}" headerClass="sortable" sortProperty="TPRENOM"  media="html" autolink="false" >
                                                        <div class="dspText"><a href="javascript:f_but_aceptar('${miListaId['SDEVOLU']}')">${miListaId.TPRENOM}</a></div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible c="TCOBBAN" f="axisadm037">
                                                    <display:column title="${title9}" headerClass="sortable" sortProperty="TCOBBAN"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.TCOBBAN}</div>
                                                    </display:column>  
                                                </axis:visible>
                                                <display:column title="${title4}" headerClass="sortable" sortProperty="CDOMSUC"  media="html" autolink="false" >
                                                    <div class="dspText">${miListaId.CDOMSUC}</div>
                                                </display:column> 
                                                <display:column title="${title5}" headerClass="sortable" sortProperty="CDOMENT"  media="html" autolink="false" >
                                                    <div class="dspText">${miListaId.CDOMENT}</div>
                                                </display:column>
                                                <display:column title="${title6}" headerClass="sortable" sortProperty="FSOPORT"  media="html" autolink="false" >
                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FSOPORT}"/></div>    
                                                </display:column>                                                
                                                <display:column title="${title7}" headerClass="sortable" sortProperty="FCARGA"  media="html" autolink="false" >
                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FCARGA}"/></div>    
                                                </display:column>                                                
                                                <display:column title="${title8}" headerClass="sortable" sortProperty="CUSUARI"  media="html" autolink="false" >
                                                    <div class="dspText">${miListaId.CUSUARI}</div>    
                                                </display:column>                                                
                                             </display:table> 
                                            </div>	
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        </table>
                    </td>
                </tr>
            </table>						

            <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm037</c:param>
                <c:param name="f">axisadm037</c:param>
                <c:param name="__botones">cancelar,buscar,aceptar</c:param>
            </c:import>
        </form>
    <c:import url="../include/mensajes.jsp" />
<script type="text/javascript">
    Calendar.setup({
        inputField     :    "FSOPORTE",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FSOPORTE", 
        singleClick    :    true,
        firstDay       :    1
    });
    

    Calendar.setup({
        inputField     :    "FCARGA",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FCARGA",  
        singleClick    :    true,
        firstDay       :    1
    });
    
    Calendar.setup({
        inputField     :    "FCARGAINI",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FCARGAINI",  
        singleClick    :    true,
        firstDay       :    1
    });
    
    Calendar.setup({
        inputField     :    "FCARGAFIN",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FCARGAFIN",  
        singleClick    :    true,
        firstDay       :    1
    });

</script>    
    </body>
</html>

