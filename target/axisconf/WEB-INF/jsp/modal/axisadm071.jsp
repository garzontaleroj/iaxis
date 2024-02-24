<%/*
*  Fichero: axisadm071.jsp
*
*  Fecha: 25/06/2012
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
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
    <title><axis:alt f="axisadm071" c="TITLE" lit="9001162"/></title> <%-- Tratamiento de recibos --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
   
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
        
        function f_onload() { 
            ok = "${__formdata.OK}";
            /* f_cercarTransferencies(ok); */
            /* document.miForm.tipos.value = ''; */
            revisarEstilos(); 
            
          
            
            <c:forEach items="${__formdata.listvalores.empresas}" var="item">
                    <c:if test="${(!empty __formdata['CEMPRES'] && __formdata['CEMPRES']==item.CEMPRES)}">
                                 document.miForm.CEMPRES.value = "${item.CEMPRES}"; 
                    </c:if>
            </c:forEach>
            
            f_cargar_propiedades_pantalla();
            
          }
          
        
          function f_buscar_trans(){
                
                CEMPRES = document.miForm.CEMPRES.value;
                CAGRUP = document.miForm.CAGRUP.value;
                CRAMO = document.miForm.CRAMO.value;
                SPRODUC = document.miForm.SPRODUC.value;
                FABONOINI = document.miForm.FABONOINI.value;
                FABONOFIN = document.miForm.FABONOFIN.value;
                FTRANSINI = document.miForm.FTRANSINI.value;
                FTRANSFIN = document.miForm.FTRANSFIN.value;
                CTRANSFERIDOS = document.miForm.CTRANSFERIDOS.value;
                NREMESA = document.miForm.NREMESA.value;
                                
                tipos = document.miForm.tipos.value;
                             
                parent.f_buscar_transferencias(CEMPRES, CAGRUP,CRAMO,SPRODUC,
                FABONOINI,FABONOFIN,FTRANSINI,FTRANSFIN,CTRANSFERIDOS,tipos,NREMESA, "cercant");
                
          }
          
          function f_recargar(){
             if (objValidador.validaEntrada()) {
                 document.miForm.CEMPRES.value = document.miForm.CEMPRES_AUX.value;
                 //alert(document.miForm.CEMPRES.value);
                 objUtiles.ejecutarFormulario ("modal_axisadm071.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);    
             }
          }
          
          function f_recargar_empresa(){
             if (objValidador.validaEntrada()) {
                 document.miForm.CEMPRES.value = document.miForm.CEMPRES_AUX.value;
                 objUtiles.ejecutarFormulario ("modal_axisadm071.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);    
             }
          }
          
          
          function f_but_buscar(){
                                  
             
             if (objValidador.validaEntrada()) {
       
                
                     if (objValidador.validaEntrada()) {
                        objUtiles.ejecutarFormulario ("modal_axisadm071.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);    
                     }else{
                        alert("<axis:alt f='axisadm071' c='ALERT_BUSC' lit='9001857' />");
                     }
           
                     
                }
             
          }
          
        function f_but_cancelar() {
            parent.f_cerrar_axisadm071();
        }   
        
       // function f_but_aceptar() {
       //     parent.f_cerrar_axisadm071();
       // }    
        
        
        function f_cargar_DATOSPERSONA() {        
            var params = "&NNUMIDE=" + objDom.getValorPorId("NNUMIDE") + "&TNOMBRE=" + objDom.getValorPorId("TNOMBRE"); 
            objAjax.invokeAsyncCGI("modal_axisadm071.do", callbackCargarDatosPersona, 
                "operation=ajax_cargarDatosPersona" + params, this);
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

        function f_borrar_campos() {
        
            objDom.setValorPorId("NNUMIDE", "");
             objDom.setValorPorId("SPERSON", "");
            objDom.setValorPorId("TNOMBRE", "");
     
        }
        
        
        function f_but_aceptar(cual,cont){
            var NMATRIC = "";      
            var i ="";            
          
            if (!objUtiles.estaVacio(cont))                    
            {
                NMATRIC = document.getElementById("NMATRIC_"+cont).value; 
            }
            
            if (!objUtiles.estaVacio(cual) || !objUtiles.estaVacio(cont) )  {         
                // Seleccionada por el hipervínculo
                NMATRIC = cual;                       
           
            }else if (!objUtiles.estaVacio(document.miForm.checked_nmatric)) {
                // Checkeada por el radio button
                i = objUtiles.f_GuardaCasillasChecked("checked_nmatric");
                    if (typeof i == 'boolean'){
                            NMATRIC = i;
                    } else {
                            NMATRIC = document.getElementById("NMATRIC_"+i).value; 
                    }

            }             
           
           
            
            if (typeof NMATRIC == 'boolean' || (objUtiles.estaVacio (NMATRIC) ) ) 
                alert(objJsMessages.jslit_selecciona_registro);   
            else{
              // Si hay una seleccionada, llamar al Action.
              if (!objUtiles.estaVacio(NMATRIC))                     
                    parent.f_aceptar_axisadm071(NMATRIC);   
             
             
            }
       
        
        }
        
        function f_aceptar_axisadm071(NMATRIC){
              objUtiles.ejecutarFormulario ("modal_axisadm071.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);    
        }

        /****************************************************************************************/
        /********************************** CALLBACK  *******************************************/
        /****************************************************************************************/
        
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
                
                objLista.borrarFilasDeLista ("DATOSPERSONA", "3", "<axis:alt f='axisadm071' c='DATOSPERSONA' lit='1000254'/>");
                
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
          
    </script>    
</head>

<body  onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="tipos"   value="${__formdata.tipos}"/>
        <input type="hidden" name="CTRANSFERIDOS"   value="${__formdata.CTRANSFERIDOS}"/>
        <input type="hidden" name="SPERSON"   value="${__formdata.SPERSON}"/>



        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisadm071" c="TITULO" lit="9902717"/> - <axis:alt f="axisadm071" c="TITULO" lit="9903861"/></c:param>     <%-- Prenotificaciones --%>
                <c:param name="formulario"></c:param> <%-- Búsqueda matrículas --%>
                <c:param name="form">axisadm071</c:param>
        </c:import>        

        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table class="seccion" >
                      <tr>
                        <td>
                          <table class="area" align="center">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>
                                <td class="titulocaja" >
                                    <b><axis:alt f="axisadm071" c="CEMPRES_AUX" lit="101619" /></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisadm071" c="NPOLIZA" lit="800242" /></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisadm071" c="NRECIBO" lit="111838" /></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisadm071" c="COBBANCAR" lit="100879" /></b>
                                </td>
                               
                            </tr>
                            <tr>
                             <td class="campocaja">
                                    <select name = "CEMPRES_AUX" id ="CEMPRES_AUX" title="<axis:alt f="axisadm071" c="CEMPRES_AUX" lit="101619" />" size="1" class="campowidthselect campo" onchange="f_recargar_empresa()" 
                                    <axis:atr f="axisadm071" c="CEMPRES" a="isInputText=false&obligatorio=true"/> >
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm071" c="MIN_VALUE" lit="108341" /> - </option>
                                        <c:forEach items="${__formdata.listvalores.empresas}" var="item">
                                            <option value = "${item.CEMPRES}" <c:if test="${(!empty __formdata['CEMPRES'] && __formdata['CEMPRES']==item.CEMPRES)}">selected</c:if> >${item.TEMPRES}</option>
                                        </c:forEach>
                                    </select>
                                    <input type="hidden" class="campowidthinput campo" size="15"  value="${__formdata.CEMPRES}" name="CEMPRES" id="CEMPRES" obligatorio="false" />
                           
                            </td>
                            <td class="campocaja">  
                                <input type="text" class="campowidthinput campo" size="15" title="<axis:alt f="axisadm071" c="NPOLIZA" lit="800242" />" <axis:atr f="axisadm071" c="NPOLIZA" a="formato=entero&obligatorio=false"/>  value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA"/>
                            </td>
                            <td class="campocaja"> 
                                <input type="text" class="campowidthinput campo" size="15" title="<axis:alt f="axisadm071" c="NRECIBO" lit="111838" />" <axis:atr f="axisadm071" c="NRECIBO" a="formato=entero&obligatorio=false"/>   value="${__formdata.NRECIBO}" name="NRECIBO" id="NRECIBO"/>
                            </td>    
                            <td class="campocaja" colspan="2">
                                    <select name = "CCOBBAN" id ="CCOBBAN" size="1" class="campowidthselect campo" title="<axis:alt f="axisadm071" c="CCOBBAN" lit="100879" />">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm071" c="MIN_VALUE" lit="108341" /> - </option>
                                        <c:forEach items="${__formdata.listvalores.cobbancarios}" var="item">
                                            <option value = "${item.CCOBBAN}" <c:if test="${__formdata['CCOBBAN']==item.CCOBBAN}">selected</c:if> >${item.DESCRIPCION}</option>
                                        </c:forEach>
                                    </select>
                            </td>
                                
            </tr>                            
            <tr>
                            <td class="titulocaja">
                                    <b><axis:alt f="axisadm071" c="NMATRIC" lit="9001045" /></b>
                            </td>
                                                
                            <td class="titulocaja">
                                    <b><axis:alt f="axisadm071" c="FENVINI" lit="9903850" /></b>
                            </td>
                                                
                            <td class="titulocaja">
                                    <b><axis:alt f="axisadm071" c="FENVFIN" lit="9903851" /></b>
                            </td>
            </tr>
            
            <tr>
                            <td class="campocaja">  
                                <input type="text" class="campowidthinput campo" size="15"   value="${__formdata.NMATRIC}" name="NMATRIC" id="NMATRIC" title="<axis:alt f="axisadm071" c="NMATRIC" lit="9001045" />"/>
                            </td>
                            <td class="campocaja">
                                 <input style="width:85%" type="text" class="campo campotexto" id="FENVINI" name="FENVINI" size="15"
                                 value ="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FENVINI}"/>" title="<axis:alt f="axisadm071" c="FENVINI" lit="9903850"/>" <axis:atr f="axisadm038" c="FENVINI" a="modificable=true&formato=fecha"/>/>
                                 <a id="icon_FENVINI" style="vertical-align:middle;" href="#"><img border="0" alt="<axis:alt f="axisadm071" c="FENVINI" lit="108341" />" src="images/calendar.gif"/></a>
                            </td>
                            <td class="campocaja">
                                 <input style="width:85%" type="text" class="campo campotexto" id="FENVFIN" name="FENVFIN" size="15"
                                 value ="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FENVFIN}"/>" title="<axis:alt f="axisadm071" c="FENVFIN" lit="9903851"/>" <axis:atr f="axisadm071" c="FENVFIN" a="modificable=true&formato=fecha"/>/>
                                 <a id="icon_FENVFIN" style="vertical-align:middle;" href="#"><img border="0" alt="<axis:alt f="axisadm071" c="FENVFIN" lit="108341" />" src="images/calendar.gif"/></a>
                            </td>
            </tr>
                </table>
              </td>
            </tr>
        </table> 
        
    <!-- FIN PRIMERA SECCION -->
                    
                    <axis:ocultar f="axisadm071" c="DSP_BUSCPERSON" dejarHueco="false"> 
                    <div class="separador">&nbsp;</div>
                    <table class="seccion">
                     <tr>
                        <td>
                          <table class="area" align="center">
                        <tr>
                            <th style="width:16.6%;height:0%;"/>
                            <th style="width:16.6%;height:0%;"/>
                            <th style="width:16.6%;height:0%;"/>
                            <th style="width:16.6%;height:0%;"/>
                            <th style="width:8.6%;height:0%;"/>
                            <th style="width:8.4%;height:0%;"/>
                        </tr>
                        <tr>
                            <axis:ocultar f="axisadm071" c="NNUMIDE" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm071" c="NNUMIDE" lit="105330"/></b> <%-- Nº identificatiu --%>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm071" c="TNOMBRE" dejarHueco="false">
                            <td class="titulocaja" colspan="3">
                                <b><axis:alt f="axisadm071" c="TNOMBRE" lit="1000560"/> <axis:alt f="axisadm071" c="TNOMBRE2" lit="105940"/></b> <%-- Cognoms Nom --%>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm071" c="TIPOPER" dejarHueco="false">     
                            <td></td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm071" c="PRENADOR" lit="101027"/></b> <%-- Prenedor --%>
                            </td>                            
                            <td class="titulocaja">
                                <input type="radio" id="tomador" name="tipoper" value="1" 
                                title="<axis:alt f="axisadm071" c="PRENADOR" lit="101027"/>" <c:if test="${__formdata['TIPOPER'] == '1' || empty __formdata['TIPOPER']}"> checked </c:if>/>
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <axis:ocultar f="axisadm071" c="NNUMIDE" dejarHueco="false">
                            <td class="campocaja">                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NNUMIDE}" name="NNUMIDE" id="NNUMIDE" 
                                <axis:atr f="axisadm071" c="NNUMIDE" a="obligatorio=false"/> onchange="f_cargar_DATOSPERSONA()" style="width:50%;"
                                title="<axis:alt f="axisadm071" c="NNUMIDE" lit="105330"/>"/>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm071" c="TNOMBRE" dejarHueco="false">
                            <td class="campocaja" colspan="3">                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TNOMBRE}" name="TNOMBRE" id="TNOMBRE" 
                                <axis:atr f="axisadm071" c="TNOMBRE" a="obligatorio=false"/>  onchange="f_cargar_DATOSPERSONA()"  style="width:80%;"
                                title="<axis:alt f="axisadm071" c="TNOMBRE" lit="1000560"/> <axis:alt f="axisadm071" c="TNOMBRE2" lit="105940"/>"/>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm071" c="TIPOPER" dejarHueco="false">     
                            <td></td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm071" c="CAMPO003" lit="9903157"/></b> <%-- Pagador --%>                                
                            </td>    
                            <td class="titulocaja">
                                <input type="radio" id="pagador" name="tipoper" value="3" 
                                title="<axis:alt f="axisadm071" c="pagador" lit="9903157"/>" <c:if test="${__formdata['TIPOPER'] == '3'}">checked</c:if>/>
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <td align="center" colspan="5">
                                <div class="separador">&nbsp;</div>
                                <axis:ocultar f="axisadm071" c="BT_BORRAR_CAMPOS" dejarHueco="false">
                                <input type="button" id="BT_BORRAR_CAMPOS" class="boton" value="<axis:alt f="axisadm071" c="CAMPO004" lit="9000440"/>" onclick="f_borrar_campos()" />
                                </axis:ocultar>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <axis:ocultar f="axisadm071" c="BT_BUSCAR_PER" dejarHueco="false">
                                <input type="button" id="BT_BUSCAR_PER" class="boton" value="<axis:alt f="axisadm071" c="CAMPO005" lit="1000065"/>" onclick="f_cargar_DATOSPERSONA()" />
                                </axis:ocultar>
                                <div class="separador">&nbsp;</div>
                            </td>
                            <axis:ocultar f="axisadm071" c="ASEGURADO" dejarHueco="false">     
                                <td class="titulocaja">
                                    <b><axis:alt f="axisadm071" c="ASEGURADO" lit="101028"/></b> <%-- Asegurado --%>                                
                                </td>    
                                <td class="titulocaja">
                                    <input type="radio" id="asegurado" name="tipoper" value="2"
                                    title="<axis:alt f="axisadm071" c="asegurado" lit="101028"/>" <c:if test="${__formdata['TIPOPER'] == '2'}">checked</c:if>/>
                                </td>
                            </axis:ocultar>
                        </tr>
                        <axis:ocultar f="axisadm071" c="DSP_DATPERSON" dejarHueco="false"> 
                        <tr>
                            <td colspan="6">
                                <c:set var="title1"><axis:alt f="axisadm071" c="CAMPO006" lit="800440"/></c:set> <%-- Nº --%>
                                <c:set var="title2"><axis:alt f="axisadm071" c="CAMPO007" lit="105940"/></c:set> <%-- Nom --%>
                                <div class="displayspace">
                                    <display:table name="${sessionScope.DATOSPERSONA}" id="DATOSPERSONA" export="false" class="dsptgtable" 
                                    pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                    requestURI="modal_axisadm071.do?paginar=true">
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
                    </td>
                    </tr>
                    </table>
                    </axis:ocultar> 
                            
                          
                    <!-- INICIO SEGUNDA SECCION -->        
                    <!--    ************************************************************************  -->
                    
                   <div class="separador">&nbsp;</div>
                   <axis:ocultar f="axisadm071" c="BT_BUSCAR" dejarHueco="false">
                   <table>
                   <tr>
                        <td align="right" colspan="5">
                                <input type="button" id="BT_BUSCAR" class="boton" value="<axis:alt f="axisadm071" c="BUT_BUSCAR" lit="100797"/>" onclick="f_but_buscar()" />
                        </td>
                   </tr>
                   <table>
                   </axis:ocultar>  
                   
                   <div class="separador">&nbsp;</div>
                   
                   
                    <table class="seccion" >
                      <tr>
                        <td>
                          <table class="area" align="center">
                             
                             <!-- **************************** Lista ****************************** -->
                            
                                <tr>
                                    <td> 
                                        <div class="separador">&nbsp;</div>     
                                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm072" c="MATRICULAS" lit="9903859"/>
                                        <!--img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisadm071()" style="cursor:pointer"/--> </div>
                                        
                                        <c:set var="title0"></c:set>
                                        <c:set var="title1"><axis:alt f="axisadm072" c="MATRICULA" lit="9001045"/></c:set> <!-- Matricula -->
                                        <c:set var="title2"><axis:alt f="axisadm072" c="COBBANCAR" lit="100879"/></c:set> <!-- Cobrador bancario -->
                                        <c:set var="title3"><axis:alt f="axisadm072" c="CBANCAR" lit="100965"/></c:set> <!-- Cuenta bancaria -->
                                        <c:set var="title4"><axis:alt f="axisadm072" c="CTIPCUENTA" lit="9001200"/></c:set> <!-- Tipo cuenta -->
                                        <c:set var="title5"><axis:alt f="axisadm072" c="CBANCO" lit="9000964"/></c:set> <!-- Banco -->
                                        <c:set var="title6"><axis:alt f="axisadm072" c="CESTADO" lit="101510"/></c:set> <!-- Estado -->
                                        
                                        <% int contador = 0;%>
                                        <div class="displayspaceGrande" id="MATRIC">
                                        
                                            <display:table name="${__formdata.LISTA_MATRICULAS}" id="miListaId" style="width:98%;" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0" requestURI="axis_axisadm072.do?paginar=true">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <c:set var="contador"><%=contador%></c:set> 
                                               
                                                    <display:column style="width:5%;" title=" " headerClass="sortable fixed" media="html" autolink="false" sortable="false">
                                                        <div class="dspIcons">
                                                        <input <c:if test="${miListaId.CMARCADO == 1}">checked</c:if> type="radio" name="checked_nmatric" id="checked_nmatric" value="${contador}"/></div>
                                                    </display:column>
                                               
                                                <display:column title="${title1}" sortable="true" style="width:21%;" sortProperty="NMATRIC" headerClass="sortable fixed"  media="html" autolink="false" >
                                                     <div class="dspText"><a href="javascript:f_but_aceptar('${miListaId['NMATRIC']}','${contador}')">${miListaId['NMATRIC']}</div>
                                                     <input type="hidden" id="NMATRIC_${contador}" name="NMATRIC_${contador}" value="${miListaId['NMATRIC']}"/>     
                                                </display:column>
                                                <display:column title="${title2}" sortable="true" style="width:9%;" sortProperty="COBBANCAR" headerClass="sortable fixed"  media="html" autolink="false" >
                                                      <div class="dspText">${miListaId['TCOBBAN']}</div>
                                                </display:column>
                                                <display:column title="${title3}" sortable="true" style="width:14%;" sortProperty="CBANCAR" headerClass="sortable fixed"  media="html" autolink="false" >
                                                    <div class="dspText">${miListaId['CBANCAR']}</div>
                                                </display:column>
                                                <display:column title="${title4}" sortable="true" style="width:9%;" sortProperty="TTIPO" headerClass="sortable fixed"  media="html" autolink="false" >
                                                    <div class="dspText">${miListaId['TTIPO']}</div>
                                                </display:column>
                                                <display:column title="${title5}" sortable="true" style="width:14%;" sortProperty="TBANCO" headerClass="sortable fixed"  media="html" autolink="false" >
                                                    <div class="dspText">${miListaId['TBANCO']}</div>
                                                </display:column>
                                                <display:column title="${title6}" sortable="true" style="width:14%;" sortProperty="CESTADO" headerClass="sortable fixed"  media="html" autolink="false" >
                                                    <div class="dspText">${miListaId['TESTADO']}</div>
                                                </display:column>
                                                <%--display:column title="${title7}" sortable="true" style="width:9%;" sortProperty="IIMPORT" headerClass="sortable fixed"  media="html" autolink="false" >
                                                    <div class="dspText"><fmt:formatNumber pattern="###,##0.00" value="${miListaId.IIMPORT}"/></div>    
                                                </display:column--%>
                                                
                                                <%--display:column title="${title4}" sortable="true" style="width:9%;" sortProperty="CTIPBAN" headerClass="sortable fixed"  media="html" autolink="false" >
                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.CTIPBAN}"/></div>
                                                </display:column --%>
                                                
                                                <%contador++;%>
                                            </display:table>
                                        </div>
                             <!-- ***************************************************************** -->
                         
                                   </td>
                               </tr>
                          </table>
                        </td>
                      </tr>
                    </table> <!-- FIN DE SECCION LISTA -->
        
        </td>
        </tr>
        </table>
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm071</c:param><c:param name="f">axisadm071</c:param>
        <c:param name="__botones">cancelar,aceptar</c:param> 
        </c:import>

    </form>
<script type="text/javascript">
    Calendar.setup({
        inputField     :    "FENVINI",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FENVINI", 
        singleClick    :    true,
        firstDay       :    1
    });
    Calendar.setup({
        inputField     :    "FENVFIN",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FENVFIN", 
        singleClick    :    true,
        firstDay       :    1
    });
   
</script>
    <c:import url="../include/mensajes.jsp"/>

</body>
</html>